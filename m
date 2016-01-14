Received: by 10.25.159.19 with SMTP id i19csp1802249lfe;
        Thu, 14 Jan 2016 06:18:18 -0800 (PST)
X-Received: by 10.28.175.147 with SMTP id y141mr4918244wme.64.1452781096797;
        Thu, 14 Jan 2016 06:18:16 -0800 (PST)
Return-Path: <pm215@archaic.org.uk>
Received: from mnementh.archaic.org.uk (mnementh.archaic.org.uk. [2001:8b0:1d0::1])
        by mx.google.com with ESMTPS id x3si9884894wjy.213.2016.01.14.06.18.16
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 14 Jan 2016 06:18:16 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::1 as permitted sender) client-ip=2001:8b0:1d0::1;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::1 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.80)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aJiKd-0008Uh-LF; Thu, 14 Jan 2016 13:52:55 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: patches@linaro.org,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [PATCH v3 11/19] memory: Add address_space_init_shareable()
Date: Thu, 14 Jan 2016 13:52:47 +0000
Message-Id: <1452779575-32582-12-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1452779575-32582-1-git-send-email-peter.maydell@linaro.org>
References: <1452779575-32582-1-git-send-email-peter.maydell@linaro.org>
X-TUID: ldIah2vTlR+A

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
Acked-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 include/exec/memory.h | 18 ++++++++++++++++++
 memory.c              | 27 +++++++++++++++++++++++++++
 2 files changed, 45 insertions(+)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 01f1004..c92734a 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -241,6 +241,8 @@ struct AddressSpace {
     struct rcu_head rcu;
     char *name;
     MemoryRegion *root;
+    int ref_count;
+    bool malloced;
 
     /* Accessed via RCU.  */
     struct FlatView *current_map;
@@ -1189,6 +1191,22 @@ MemTxResult memory_region_dispatch_write(MemoryRegion *mr,
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
index 93bd8ed..d2d0a92 100644
--- a/memory.c
+++ b/memory.c
@@ -2124,7 +2124,9 @@ void address_space_init(AddressSpace *as, MemoryRegion *root, const char *name)
 {
     memory_region_ref(root);
     memory_region_transaction_begin();
+    as->ref_count = 1;
     as->root = root;
+    as->malloced = false;
     as->current_map = g_new(FlatView, 1);
     flatview_init(as->current_map);
     as->ioeventfd_nb = 0;
@@ -2139,6 +2141,7 @@ void address_space_init(AddressSpace *as, MemoryRegion *root, const char *name)
 static void do_address_space_destroy(AddressSpace *as)
 {
     MemoryListener *listener;
+    bool do_free = as->malloced;
 
     address_space_destroy_dispatch(as);
 
@@ -2150,12 +2153,36 @@ static void do_address_space_destroy(AddressSpace *as)
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
