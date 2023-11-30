Received: by 2002:a17:906:3657:b0:a0d:e0d9:b5bf with SMTP id r23csp268372ejb;
        Thu, 30 Nov 2023 06:31:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEHxMBxKh1fL8mTwtNp69PAvK9GdNJ99V4Q+Xbuv2upZxIjyCBqEkU53ShN6cLGWWkFZjBS
X-Received: by 2002:a0c:f989:0:b0:670:f55e:573b with SMTP id t9-20020a0cf989000000b00670f55e573bmr24187130qvn.12.1701354704399;
        Thu, 30 Nov 2023 06:31:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701354704; cv=none;
        d=google.com; s=arc-20160816;
        b=Xw/cL5xIGjGA2/3Wjt4fD4zQea0NWi0yxTG8kSklQRV1p67ctX9zc5GgjrEAQCQP1x
         vhKDD6AFFUw27b/7oTSBFaa7aMdtzPS+Y4FJoRzN7svCWvm8MhhEqFqAi8N15QtrbHlm
         yDMcprXTiAui2iSGI5Av5+vMRHUo1419QuacDaWN9pI34f7IqOFS7tq7rVOJy0flyKgu
         8uiv1qdkDf44334ORoP6Ne2AQYo5Cx5HNY02byPP6gVRwz35LMu0apxBBAyw111OBH/k
         ebto+GklDuDgfdPVcXBEKVA5rUJZws3Q7WU+IZqrxbD3Wg3e87WBiLrDcsP49u+YNdH2
         s52g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=+QZbTWlSEbbogh5qu4EzEaVMOn+hl4OCPZwl+YIqUvQ=;
        fh=EvzXIS2ygU9QKs+dZ6sztfuJi5WQr5izWtbugpSw92U=;
        b=nqx1FEHVideS+P5R7m7TJ3kKJzyhZcwnD7zg+kJRJhvzoYToxrsRlhJfDp9Ts5h3J/
         Q/W+q0UgyPFU2do8fVBlUhYw7c9GVMlLHzeGuH3s51OiQ0seNK8NgTbO+OJsURoYYERL
         1xy09hRWAFtTGOI1xmswEmoIbnWbsp3LXjnW0JY99gmQVCFVZr6Q2zm7pS6JJ+SSdmHF
         FhAVQnaFZvm5MIBuC2aqwNF9ybtdyFdegjaKDPg69sOlot9ZL+Kh152MUnSKk4w2iWAu
         uVLKR7nieTnxxBvIXzFYJaqzTAPKncFKSd177rEGRkisYqulrZeNEbiBmrgHPyrfm+hS
         j7JQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=cM7kXOMH;
       spf=none (google.com: linux.intel.com does not designate permitted sender hosts) smtp.mailfrom=zhao1.liu@linux.intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@linux.intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [192.55.52.43])
        by mx.google.com with ESMTPS id j16-20020a0cf9d0000000b0065cfed59386si1092242qvo.338.2023.11.30.06.31.43
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 30 Nov 2023 06:31:44 -0800 (PST)
Received-SPF: none (google.com: linux.intel.com does not designate permitted sender hosts) client-ip=192.55.52.43;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=cM7kXOMH;
       spf=none (google.com: linux.intel.com does not designate permitted sender hosts) smtp.mailfrom=zhao1.liu@linux.intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701354704; x=1732890704;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=q8av5JpkyS6FnEIeBR5gNojelDu9V7STUz/Dtf8UH7E=;
  b=cM7kXOMHVhJi7KKNa/0z7pQXWHMOKmItPKsu0AcxGg7SY2eesXNCMXz5
   HpgeDrimTmi0ZpQN3neGgvbNSZHrNb4+i/rySHD3blHt/eQfX2odJonEi
   hQ9gCDTrAU2rWOyB9+L7HKA/Weg6rmx35k4RTKn51bLPakvjgMQtEhjEL
   LAaUS+pgtLs1hvtU7HiW4SojZkGKIwv35WNpUNo3gTciMoB7AZBQ0zlJ/
   Go42lAspooR8AnT60pWlp+gkSzgFhW/9oedrX1USB9c0Mhirc1eovN3p6
   Qs6Oxuse9+8f3HJxWUOrU0TgVYLLJukqsi9wTzGV8x4Wmw3pF5DTK+8oH
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="479531055"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="479531055"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2023 06:31:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="942729632"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="942729632"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
  by orsmga005.jf.intel.com with ESMTP; 30 Nov 2023 06:31:01 -0800
From: Zhao Liu <zhao1.liu@linux.intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Igor Mammedov <imammedo@redhat.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	=?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Barrat?= <fbarrat@linux.ibm.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair@alistair23.me>,
	"Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
	=?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Bin Meng <bin.meng@windriver.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Weiwei Li <liwei1518@gmail.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	qemu-devel@nongnu.org,
	kvm@vger.kernel.org,
	qemu-ppc@nongnu.org,
	xen-devel@lists.xenproject.org,
	qemu-arm@nongnu.org,
	qemu-riscv@nongnu.org,
	qemu-s390x@nongnu.org
Cc: Nina Schoetterl-Glausch <nsg@linux.ibm.com>,
	Thomas Huth <thuth@redhat.com>,
	Zhiyuan Lv <zhiyuan.lv@intel.com>,
	Zhenyu Wang <zhenyu.z.wang@intel.com>,
	Yongwei Ma <yongwei.ma@intel.com>,
	Zhao Liu <zhao1.liu@intel.com>
Subject: [RFC 04/41] qom/object: Introduce helper to resolve path from non-direct parent
Date: Thu, 30 Nov 2023 22:41:26 +0800
Message-Id: <20231130144203.2307629-5-zhao1.liu@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231130144203.2307629-1-zhao1.liu@linux.intel.com>
References: <20231130144203.2307629-1-zhao1.liu@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: nX8B8zcSxrKT

From: Zhao Liu <zhao1.liu@intel.com>

When we support child<> property creation from cli, the peripheral
container (/machine/peripheral) may not be the direct parent of the
devices created from cli.

For this case, add a helper to resolve path from non-direct parent.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 include/qom/object.h | 15 +++++++++++++++
 qom/object.c         | 18 ++++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/include/qom/object.h b/include/qom/object.h
index afccd24ca7ab..494eef801be3 100644
--- a/include/qom/object.h
+++ b/include/qom/object.h
@@ -1562,6 +1562,21 @@ Object *object_resolve_path_type(const char *path, const char *typename,
  */
 Object *object_resolve_path_at(Object *parent, const char *path);
 
+/**
+ * object_resolve_path_from:
+ * @parent: the object from which to resolve the path
+ * @path: the path to resolve
+ * @ambiguous: returns true if the path resolution failed because of an
+ *   ambiguous match
+ *
+ * This is like object_resolve_path_at(), except @parent may be the
+ * partial parent of @path.
+ *
+ * Returns: The resolved object or NULL on path lookup failure.
+ */
+Object *object_resolve_path_from(Object *parent, const char *path,
+                                 bool *ambiguous);
+
 /**
  * object_resolve_path_component:
  * @parent: the object in which to resolve the path
diff --git a/qom/object.c b/qom/object.c
index 95c0dc8285fe..da29e88816b5 100644
--- a/qom/object.c
+++ b/qom/object.c
@@ -2192,6 +2192,24 @@ Object *object_resolve_path_at(Object *parent, const char *path)
     return object_resolve_abs_path(parent, parts, TYPE_OBJECT);
 }
 
+Object *object_resolve_path_from(Object *parent, const char *path,
+                                 bool *ambiguousp)
+{
+    g_auto(GStrv) parts = NULL;
+    bool ambiguous = false;
+    Object *obj;
+
+    parts = g_strsplit(path, "/", 0);
+    assert(parts);
+
+    obj = object_resolve_partial_path(parent, parts, TYPE_OBJECT,
+                                      &ambiguous);
+    if (ambiguousp) {
+        *ambiguousp = ambiguous;
+    }
+    return obj;
+}
+
 typedef struct StringProperty
 {
     char *(*get)(Object *, Error **);
-- 
2.34.1
