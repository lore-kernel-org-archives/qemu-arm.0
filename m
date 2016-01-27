Received: by 10.25.159.19 with SMTP id i19csp2423743lfe;
        Wed, 27 Jan 2016 05:52:22 -0800 (PST)
X-Received: by 10.140.201.20 with SMTP id w20mr7683813qha.10.1453902742129;
        Wed, 27 Jan 2016 05:52:22 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o63si6112608qho.8.2016.01.27.05.52.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 27 Jan 2016 05:52:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:50628 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aOQWD-00034j-Lr
	for alex.bennee@linaro.org; Wed, 27 Jan 2016 08:52:21 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38536)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@linaro.org>) id 1aOQWA-0002z6-8h
	for qemu-arm@nongnu.org; Wed, 27 Jan 2016 08:52:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@linaro.org>) id 1aOQW8-0002B5-QQ
	for qemu-arm@nongnu.org; Wed, 27 Jan 2016 08:52:18 -0500
Received: from mail-wm0-x22c.google.com ([2a00:1450:400c:c09::22c]:35201)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@linaro.org>) id 1aOQW8-0002Al-Ct
	for qemu-arm@nongnu.org; Wed, 27 Jan 2016 08:52:16 -0500
Received: by mail-wm0-x22c.google.com with SMTP id r129so145876880wmr.0
	for <qemu-arm@nongnu.org>; Wed, 27 Jan 2016 05:52:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=OWv/2//g5AYghjzg3bRGTTFY1I/sd5ewy4o6R2cO2CM=;
	b=iy2Lh3LNahIg+qoR9RWwNtC4G0viqPsEtsuTu51C5dyp+QkehDVpKSsJ68dtumPGVO
	oUb3vAwB+5gotHY2vRFfXXPB+vfI5vySQiOeLUkQCny0PiQYZc+eGL5cdrE7l/DjhbQD
	PikN6Vgwpm7NGIKe234v0riSgvWMLw9xc/yvE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=OWv/2//g5AYghjzg3bRGTTFY1I/sd5ewy4o6R2cO2CM=;
	b=Nt7u3ti3SuMNU3yry+EVQpU9vxh8d6pqalBai++o1b6BnBKA+WcFWP5RiROw0/jTGm
	CvS9jxz0pa5o6NFHfmX1rKXMChgVZhwd4vg/vqyh6W/nvt+bX2mStU8EkOZaSt1/LHIU
	UMBfTygi8+q0z8SVnvbgnUP6op5JpqMEUckbblUUveZguqF+YQQ1nxdCCr0FTGQA7hTi
	60jWtm2jL+zTHVikB5SZpGOjDuEVgZcrNMJ4QQfzAOc+9et7OiSVoCxdvxNrBBSiGWEg
	Kf3s8jmiZFFGjlSOQYhRzO34t4WABB+elsPXwsh1otxi41iDEyB/qxZ1SqjF2LSaBucc
	atfg==
X-Gm-Message-State: AG10YOQPTs/BpABCQd3bichasNdqdiqSh0SnVX/06GQqcsiGLMv1TVGOwCfIBuqg/4QnXOCQ
X-Received: by 10.28.45.151 with SMTP id t145mr32148510wmt.88.1453902735782;
	Wed, 27 Jan 2016 05:52:15 -0800 (PST)
Received: from new-host-8.home (LMontsouris-657-1-37-90.w80-11.abo.wanadoo.fr.
	[80.11.198.90])
	by smtp.gmail.com with ESMTPSA id t9sm6345866wjf.33.2016.01.27.05.52.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 27 Jan 2016 05:52:12 -0800 (PST)
From: Eric Auger <eric.auger@linaro.org>
To: eric.auger@st.com, eric.auger@linaro.org, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org, alex.williamson@redhat.com,
	pranav.sawargaonkar@gmail.com, p.fedin@samsung.com, pbonzini@redhat.com,
	agraf@suse.de
Date: Wed, 27 Jan 2016 13:51:53 +0000
Message-Id: <1453902715-25304-6-git-send-email-eric.auger@linaro.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1453902715-25304-1-git-send-email-eric.auger@linaro.org>
References: <1453902715-25304-1-git-send-email-eric.auger@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::22c
Cc: Bharat.Bhushan@freescale.com, suravee.suthikulpanit@amd.com,
	christoffer.dall@linaro.org
Subject: [Qemu-arm] [RFC 5/7] memory: add reserved_iova region type
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: biums8J3Iz+k

Introduce a new reserved_iova region type. This type of iova region
is bound to be used by the kernel to map some host physical addresses.

A new initializer, memory_region_init_reserved_iova is introduced, as
well as a test function, memory_region_is_reserved_iova.

Signed-off-by: Eric Auger <eric.auger@linaro.org>
---
 include/exec/memory.h | 29 +++++++++++++++++++++++++++++
 memory.c              | 11 +++++++++++
 2 files changed, 40 insertions(+)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index c92734a..616cb86 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -165,6 +165,7 @@ struct MemoryRegion {
     /* The following fields should fit in a cache line */
     bool romd_mode;
     bool ram;
+    bool reserved_iova;
     bool subpage;
     bool readonly; /* For RAM regions */
     bool rom_device;
@@ -359,6 +360,21 @@ void memory_region_init_ram(MemoryRegion *mr,
                             Error **errp);
 
 /**
+ * memory_region_init_reserved_iova:  Initialize reserved iova memory region
+ *
+ * @mr: the #MemoryRegion to be initialized.
+ * @owner: the object that tracks the region's reference count
+ * @name: the name of the region.
+ * @size: size of the region.
+ * @errp: pointer to Error*, to store an error if it happens.
+ */
+void memory_region_init_reserved_iova(MemoryRegion *mr,
+                                      struct Object *owner,
+                                      const char *name,
+                                      uint64_t size,
+                                      Error **errp);
+
+/**
  * memory_region_init_resizeable_ram:  Initialize memory region with resizeable
  *                                     RAM.  Accesses into the region will
  *                                     modify memory directly.  Only an initial
@@ -531,6 +547,19 @@ static inline bool memory_region_is_ram(MemoryRegion *mr)
 }
 
 /**
+ * memory_region_is_reserved_iova: check whether a memory region corresponds to
+   reserved iova
+ *
+ * Returns %true is a memory region is reserved iova
+ *
+ * @mr: the memory region being queried
+ */
+static inline bool memory_region_is_reserved_iova(MemoryRegion *mr)
+{
+    return mr->reserved_iova;
+}
+
+/**
  * memory_region_is_skip_dump: check whether a memory region should not be
  *                             dumped
  *
diff --git a/memory.c b/memory.c
index d2d0a92..d9ff1b7 100644
--- a/memory.c
+++ b/memory.c
@@ -1231,6 +1231,17 @@ void memory_region_init_ram(MemoryRegion *mr,
     mr->dirty_log_mask = tcg_enabled() ? (1 << DIRTY_MEMORY_CODE) : 0;
 }
 
+void memory_region_init_reserved_iova(MemoryRegion *mr,
+                                      Object *owner,
+                                      const char *name,
+                                      uint64_t size,
+                                      Error **errp)
+{
+    memory_region_init(mr, owner, name, size);
+    mr->reserved_iova = true;
+    mr->terminates = true;
+}
+
 void memory_region_init_resizeable_ram(MemoryRegion *mr,
                                        Object *owner,
                                        const char *name,
-- 
1.9.1

