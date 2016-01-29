Received: by 10.25.159.19 with SMTP id i19csp1054302lfe;
        Fri, 29 Jan 2016 08:55:58 -0800 (PST)
X-Received: by 10.55.73.69 with SMTP id w66mr11827818qka.39.1454086558788;
        Fri, 29 Jan 2016 08:55:58 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c41si18500745qge.64.2016.01.29.08.55.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 29 Jan 2016 08:55:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:35311 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aPCL0-0004yh-1n
	for alex.bennee@linaro.org; Fri, 29 Jan 2016 11:55:58 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36750)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@linaro.org>) id 1aPCJK-0001xB-He
	for qemu-arm@nongnu.org; Fri, 29 Jan 2016 11:54:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@linaro.org>) id 1aPCJH-0003zy-4U
	for qemu-arm@nongnu.org; Fri, 29 Jan 2016 11:54:14 -0500
Received: from mail-wm0-x236.google.com ([2a00:1450:400c:c09::236]:38660)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@linaro.org>) id 1aPCJG-0003zg-QA
	for qemu-arm@nongnu.org; Fri, 29 Jan 2016 11:54:11 -0500
Received: by mail-wm0-x236.google.com with SMTP id p63so76300355wmp.1
	for <qemu-arm@nongnu.org>; Fri, 29 Jan 2016 08:54:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=OWv/2//g5AYghjzg3bRGTTFY1I/sd5ewy4o6R2cO2CM=;
	b=S48kcVPIiUSIZz3l33cC+ygjqRoybRtHZYbkGLgwiyxWg8B2gfuE8l8114ZFZxRT1x
	jdqfsoY70n6hckqg4FuXV2ZWIM0fzJNZFxsQ8yQWdG4IZApTJGIW03PeFypNHT55EK9T
	e/YWdBKdX2q8CvCbtXspw8snQWDpNuD7KcOG8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=OWv/2//g5AYghjzg3bRGTTFY1I/sd5ewy4o6R2cO2CM=;
	b=SDbkKw7TYZ0tRYKNDdrOTA1ZhW4WuibEvKCiXY8Y5XKDGGPM8xjg1MlhhKP3dZLGRN
	VIGu73zcp/RpQLNdCOEadt6jQsqraURuT5r64FW6hvKPxOsfPYZyEiQ8F9Qxy5ScD3jK
	h8FPFkGEH3NR4yMcZ6J+4feD27lGSyblfC9bP/R472fbnU9H+7TxpqQY0jeeNzxqekKP
	qTm9hnZmqNi93ZjLCcOCgkS70VU01PRClHIlLGFpLlENEpKLnULmuDtvouIZ282Uj5nl
	0aLfwfItw7BXIgvBG7keTzbq8rx5P0b1wU2jKY/36XF48dUF6BMgT1JEroGk2u8yoL/a
	Q5KQ==
X-Gm-Message-State: AG10YOSlsS2bZxJhQWhXiBJ2qHLtS8noLn4GAbEAjpgx2rb4kZyGZxvRxAR7UMJ7r5ggOiJw
X-Received: by 10.194.22.101 with SMTP id c5mr11036477wjf.151.1454086450170;
	Fri, 29 Jan 2016 08:54:10 -0800 (PST)
Received: from new-host-12.home
	(LMontsouris-657-1-37-90.w80-11.abo.wanadoo.fr. [80.11.198.90])
	by smtp.gmail.com with ESMTPSA id
	ei9sm16415530wjd.40.2016.01.29.08.54.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 29 Jan 2016 08:54:08 -0800 (PST)
From: Eric Auger <eric.auger@linaro.org>
To: eric.auger@st.com, eric.auger@linaro.org, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org, alex.williamson@redhat.com,
	pranav.sawargaonkar@gmail.com, p.fedin@samsung.com, pbonzini@redhat.com,
	agraf@suse.de
Date: Fri, 29 Jan 2016 16:53:46 +0000
Message-Id: <1454086429-4373-6-git-send-email-eric.auger@linaro.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1454086429-4373-1-git-send-email-eric.auger@linaro.org>
References: <1454086429-4373-1-git-send-email-eric.auger@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::236
Cc: Bharat.Bhushan@freescale.com, suravee.suthikulpanit@amd.com,
	christoffer.dall@linaro.org
Subject: [Qemu-arm] [RFC v2 5/8] memory: add reserved_iova region type
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
X-TUID: 5rw4/sYQfQmO

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

