Received: by 10.182.158.201 with SMTP id ww9csp129428obb;
        Mon, 16 Nov 2015 06:22:03 -0800 (PST)
X-Received: by 10.194.2.144 with SMTP id 16mr37361713wju.90.1447683723414;
        Mon, 16 Nov 2015 06:22:03 -0800 (PST)
Return-Path: <pm215@archaic.org.uk>
Received: from mnementh.archaic.org.uk (mnementh.archaic.org.uk. [2001:8b0:1d0::1])
        by mx.google.com with ESMTPS id g126si25951554wma.27.2015.11.16.06.22.03
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 16 Nov 2015 06:22:03 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::1 as permitted sender) client-ip=2001:8b0:1d0::1;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::1 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.80)
	(envelope-from <pm215@archaic.org.uk>)
	id 1ZyKPL-00013K-Om; Mon, 16 Nov 2015 14:05:23 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: patches@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	qemu-arm@nongnu.org
Subject: [PATCH v2 11/19] memory: Add address_space_init_shareable()
Date: Mon, 16 Nov 2015 14:05:15 +0000
Message-Id: <1447682723-3977-12-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1447682723-3977-1-git-send-email-peter.maydell@linaro.org>
References: <1447682723-3977-1-git-send-email-peter.maydell@linaro.org>
X-TUID: blRkU20Ilstk

From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>

This will either create a new AS or return a pointer to an
already existing equivalent one, if we have already created
an AS for the specified root memory region.

The motivation is to reuse address spaces as much as possible.
It's going to be quite common that bus masters out in device land
have pointers to the same memory region for their mastering yet
each will need to create its own address space. Let the memory
API implement sharing for them.

Aside from the perf optimisations, this should reduce the amount
of redundant output on info mtree as well.

Thee returned value will be malloced, but the malloc will be
automatically freed when the AS runs out of refs.

Signed-off-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
[PMM: dropped check for NULL root as unused; added doc-comment;
 squashed Peter C's reference-counting patch into this one;
 don't compare name string when deciding if we can share ASes;
 read as->malloced before the unref of as->root to avoid possible
 read-after-free if as->root was the owner of as]
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/exec/memory.h | 18 ++++++++++++++++++
 memory.c              | 27 +++++++++++++++++++++++++++
 2 files changed, 45 insertions(+)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 0f07159..d156e8a 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -236,6 +236,8 @@ struct AddressSpace {
     struct rcu_head rcu;
     char *name;
     MemoryRegion *root;
+    int ref_count;
+    bool malloced;
 
     /* Accessed via RCU.  */
     struct FlatView *current_map;
@@ -1165,6 +1167,22 @@ MemTxResult memory_region_dispatch_write(MemoryRegion *mr,
  */
 void address_space_init(AddressSpace *as, MemoryRegion *root, const char *name);
 
+/**
+ * address_space_init_shareable: return an address space for a memory region,
+ *                               creating it if it does not already exist
+ *
+ * @root: a #MemoryRegion that routes addresses for the address space
+ * @name: an address space name.  The name is only used for debugging
+ *        output.
+ *
+ * This function will return a pointer to an existing AddressSpace
+ * which was initialized with the specified MemoryRegion, or it will
+ * create and initialize one if it does not already exist. The ASes
+ * are reference-counted, so the memory will be freed automatically
+ * when the AddressSpace is destroyed via address_space_destroy.
+ */
+AddressSpace *address_space_init_shareable(MemoryRegion *root,
+                                           const char *name);
 
 /**
  * address_space_destroy: destroy an address space
diff --git a/memory.c b/memory.c
index e193658..a969ff8 100644
--- a/memory.c
+++ b/memory.c
@@ -2105,7 +2105,9 @@ void address_space_init(AddressSpace *as, MemoryRegion *root, const char *name)
 {
     memory_region_ref(root);
     memory_region_transaction_begin();
+    as->ref_count = 1;
     as->root = root;
+    as->malloced = false;
     as->current_map = g_new(FlatView, 1);
     flatview_init(as->current_map);
     as->ioeventfd_nb = 0;
@@ -2120,6 +2122,7 @@ void address_space_init(AddressSpace *as, MemoryRegion *root, const char *name)
 static void do_address_space_destroy(AddressSpace *as)
 {
     MemoryListener *listener;
+    bool do_free = as->malloced;
 
     address_space_destroy_dispatch(as);
 
@@ -2131,12 +2134,36 @@ static void do_address_space_destroy(AddressSpace *as)
     g_free(as->name);
     g_free(as->ioeventfds);
     memory_region_unref(as->root);
+    if (do_free) {
+        g_free(as);
+    }
+}
+
+AddressSpace *address_space_init_shareable(MemoryRegion *root, const char *name)
+{
+    AddressSpace *as;
+
+    QTAILQ_FOREACH(as, &address_spaces, address_spaces_link) {
+        if (root == as->root && as->malloced) {
+            as->ref_count++;
+            return as;
+        }
+    }
+
+    as = g_malloc0(sizeof *as);
+    address_space_init(as, root, name);
+    as->malloced = true;
+    return as;
 }
 
 void address_space_destroy(AddressSpace *as)
 {
     MemoryRegion *root = as->root;
 
+    as->ref_count--;
+    if (as->ref_count) {
+        return;
+    }
     /* Flush out anything from MemoryListeners listening in on this */
     memory_region_transaction_begin();
     as->root = NULL;
-- 
1.9.1
