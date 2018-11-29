Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2779043wrt;
        Thu, 29 Nov 2018 12:23:07 -0800 (PST)
X-Google-Smtp-Source: AFSGD/WfqTmrNmmvJFco5IzONLskXX207G7dr3h1MRShrsTFcCiT3yQrHWvHSakMH/aLrXH2enc3
X-Received: by 2002:a5b:807:: with SMTP id x7-v6mr2989214ybp.0.1543522986995;
        Thu, 29 Nov 2018 12:23:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543522986; cv=none;
        d=google.com; s=arc-20160816;
        b=AeUhvBDWDWgZ/pLfCuxOae1O5/rhfUJhqEHYR2ofy/bUILD26R0uYPabFbY2A3B2SA
         u9kJYs+HLhNBsmlJtINFRXsZUB8SxrZhWH9jkSyam8ahcCvvEEhcpW5XNKKmlxPTw8KP
         TJuIemt3OAE08DolaOT6SPkbh5Hj7cvRygr+SObYP8KlhH3UyLRZoqdwX0lzv4CIMcmq
         LQCyX+xs7cZxycPRmApfgAairn2tnv17zju5boRi/N7gaYfsZhNqppYhB+zduQBKAPcc
         8n0UcBxjo3s53FFCmP+4HC4vhtYQjjk46K/rwETW2dStnPE64dmBI9JwL1/V8hyX0eGU
         w74w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:mime-version:user-agent
         :date:message-id:to:from:dkim-signature;
        bh=f0qLraRY151DnldRikjh/w7Z322fEPljgTfbEOlyjV4=;
        b=Y4SY9naCIRx4XKPzBQhRJvZAA3iRR9g6uqzqZmnNlWPi6tiks6cziYTW9VASgLjxnj
         YHa4X46B3g9V8WCDzrPNWP4GX4OK9FdejUamDK//obxfL7N2Wr5ar5/LGDVA7MUcgz6u
         gSIVQwZ5JEARvP3cyHar/bQ8S+2nr2miyWhhpsH2IEshkM+jf0ZuK9rbclG3NS7t8LM9
         NuLh47Zb4rNxg+s+DpVVZXyYkwx/Dsmcdqgr9uFKT6a9tJIyLsUgQr3kgKm2pfcio6K0
         IxmIJxizy0lNk5URcondeJSGXZUKv6Lcqbuq8KxFJelySQFKJnwidxecPrEWYypuElq0
         RNZA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=nXGZFFF+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v189-v6si1656738ybv.425.2018.11.29.12.23.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 29 Nov 2018 12:23:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=nXGZFFF+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:56229 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gSSq2-0000ik-CX
	for alex.bennee@linaro.org; Thu, 29 Nov 2018 15:23:06 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41917)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <nicholas.a.hudson@gmail.com>) id 1gSSps-0000iS-AJ
	for qemu-arm@nongnu.org; Thu, 29 Nov 2018 15:22:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <nicholas.a.hudson@gmail.com>) id 1gSSpr-0006BH-0s
	for qemu-arm@nongnu.org; Thu, 29 Nov 2018 15:22:56 -0500
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:43540)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <nicholas.a.hudson@gmail.com>)
	id 1gSSpq-0006Ap-Ni; Thu, 29 Nov 2018 15:22:54 -0500
Received: by mail-wr1-x441.google.com with SMTP id r10so3178289wrs.10;
	Thu, 29 Nov 2018 12:22:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:message-id:date:user-agent:mime-version
	:content-language:content-transfer-encoding;
	bh=f0qLraRY151DnldRikjh/w7Z322fEPljgTfbEOlyjV4=;
	b=nXGZFFF+CfKujVGpC71C0B2pwV4CnrnYM0OhFUuhXp93hzhRuUWJGlRRhYYiwWc9nU
	STzgY5HE11CJHi3D+EjDIh33i8UquggINZ6fQfL66MSPcahYruZ0lwSshgJoKLpmjLWM
	cDWWGQ+nu9IvONqTiJdpOOLK9YzkZh3VRXOPTFNhvX/MaRnZhrBntcgi7qoTNnw4meS/
	NFDV/ytpBnAQmdAdi3BtC9ZtYDJPpSYq62qyKy3i2e7eittW9UEuIS6yarRsyncifbFH
	Ub4UG338t948MuBXAUPRALWpolgnguuMd8d5rMzhwb9XY+rVwqMgZUI5f4LOYSshI4xm
	n+0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:message-id:date:user-agent
	:mime-version:content-language:content-transfer-encoding;
	bh=f0qLraRY151DnldRikjh/w7Z322fEPljgTfbEOlyjV4=;
	b=S/uurB3O49rzVfzqhTO1Vn15A/hA1tz+huDqjz7VHSGz4EzzUuXRrmPH/K7uzVjUdC
	0iY1WOvIhkXQGgdyGVvBBbqpoDw/c6ug1H6WUDzqkJfQx48IUeuvZD1nmvolXEkhzmgI
	bHgIeaGa4KmW+V315guyckKlXzOo/GWB8S+YBu89NW/dZ1T4nPMLUupDQN6zkxf/46FT
	mKB1prNen2V2Vkq6UlCwk78TPnKhN8utpV3PzYJVdShkajKeZFuoUn5uZHrbu36iQF8h
	7QGwWa5y9h3XTetL/A35QW//3/PkiK5qVDw9GvLYBUdIDTDhXq5b9SCQd9NOuwuliq43
	V7mg==
X-Gm-Message-State: AA+aEWZSX6Zbtkvvzda/aVjWntcBCKrmtJAUJO5oXdh4GYXPLwlzcvHj
	k/Km48tDIKAiMdmaV0FQh5M=
X-Received: by 2002:a5d:5182:: with SMTP id k2mr2640240wrv.121.1543522973113; 
	Thu, 29 Nov 2018 12:22:53 -0800 (PST)
Received: from ?IPv6:2a02:c7d:860f:7601:7503:9d7c:2958:5e7d?
	([2a02:c7d:860f:7601:7503:9d7c:2958:5e7d])
	by smtp.gmail.com with ESMTPSA id n9sm3214924wrx.80.2018.11.29.12.22.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 29 Nov 2018 12:22:52 -0800 (PST)
From: Nick Hudson <nicholas.a.hudson@gmail.com>
X-Google-Original-From: Nick Hudson <skrll@netbsd.org>
To: qemu-devel@nongnu.org
Message-ID: <fe1367d1-33f7-21fa-be84-20b9795a2157@gmail.com>
Date: Thu, 29 Nov 2018 20:22:47 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::441
Subject: [Qemu-arm] [PATCH v2] Support u-boot noload images for arm as used
 by, NetBSD/evbarm GENERIC kernel.
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MLsJMmWCotwV

noload kernels are loaded with the u-boot image header and as a result
the header size needs adding to the entry point.  Fake up a hdr so the
kernel image is loaded at the right address and the entry point is
adjusted appropriately.

The bootloader fits in the space that the uboot header would have occupied.

Update the load_uimage API to allow passing of load address when an image
doesn't specify one.

Signed-off-by: Nick Hudson <skrll@netbsd.org>
---
 hw/arm/boot.c         |  8 +++++---
 hw/core/loader.c      | 15 ++++++++++++---
 hw/core/uboot_image.h |  1 +
 include/hw/loader.h   |  3 ++-
 4 files changed, 20 insertions(+), 7 deletions(-)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index 586baa9b64..450267566a 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -30,8 +30,9 @@
  * Documentation/arm/Booting and Documentation/arm64/booting.txt
  * They have different preferred image load offsets from system RAM base.
  */
-#define KERNEL_ARGS_ADDR 0x100
-#define KERNEL_LOAD_ADDR 0x00010000
+#define KERNEL_ARGS_ADDR   0x100
+#define KERNEL_NOLOAD_ADDR 0x00000000
+#define KERNEL_LOAD_ADDR   0x00010000
 #define KERNEL64_LOAD_ADDR 0x00080000

 #define ARM64_TEXT_OFFSET_OFFSET    8
@@ -1078,7 +1079,8 @@ void arm_load_kernel(ARMCPU *cpu, struct arm_boot_info *info)
     }
     entry = elf_entry;
     if (kernel_size < 0) {
-        kernel_size = load_uimage_as(info->kernel_filename, &entry, NULL,
+        uint64_t loadaddr = info->loader_start + KERNEL_NOLOAD_ADDR;
+        kernel_size = load_uimage_as(info->kernel_filename, &entry, &loadaddr,
                                      &is_linux, NULL, NULL, as);
     }
     if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64) && kernel_size < 0) {
diff --git a/hw/core/loader.c b/hw/core/loader.c
index aa0b3fc867..5537e88817 100644
--- a/hw/core/loader.c
+++ b/hw/core/loader.c
@@ -638,13 +638,22 @@ static int load_uboot_image(const char *filename, hwaddr *ep, hwaddr *loadaddr,
         goto out;

     if (hdr->ih_type != image_type) {
-        fprintf(stderr, "Wrong image type %d, expected %d\n", hdr->ih_type,
-                image_type);
-        goto out;
+        if (image_type != IH_TYPE_KERNEL && hdr->ih_type != IH_TYPE_KERNEL_NOLOAD) {
+            fprintf(stderr, "Wrong image type %d, expected %d\n", hdr->ih_type,
+                    image_type);
+            goto out;
+        }
     }

     /* TODO: Implement other image types.  */
     switch (hdr->ih_type) {
+    case IH_TYPE_KERNEL_NOLOAD:
+       if (loadaddr == NULL)
+            goto out;
+
+        hdr->ih_load = *loadaddr + sizeof(*hdr);
+        hdr->ih_ep += hdr->ih_load;
+        /* fall through */
     case IH_TYPE_KERNEL:
         address = hdr->ih_load;
         if (translate_fn) {
diff --git a/hw/core/uboot_image.h b/hw/core/uboot_image.h
index 34c11a70a6..608022de6e 100644
--- a/hw/core/uboot_image.h
+++ b/hw/core/uboot_image.h
@@ -124,6 +124,7 @@
 #define IH_TYPE_SCRIPT         6       /* Script file                  */
 #define IH_TYPE_FILESYSTEM     7       /* Filesystem Image (any type)  */
 #define IH_TYPE_FLATDT         8       /* Binary Flat Device Tree Blob */
+#define IH_TYPE_KERNEL_NOLOAD  14      /* OS Kernel Image (noload)     */

 /*
  * Compression Types
diff --git a/include/hw/loader.h b/include/hw/loader.h
index 67a0af84ac..10ff0ff76d 100644
--- a/include/hw/loader.h
+++ b/include/hw/loader.h
@@ -163,7 +163,8 @@ int load_aout(const char *filename, hwaddr addr, int max_sz,
 /** load_uimage_as:
  * @filename: Path of uimage file
  * @ep: Populated with program entry point. Ignored if NULL.
- * @loadaddr: Populated with the load address. Ignored if NULL.
+ * @loadaddr: load address if none specified in the image. Populated with the
+ *            load address. Ignored if NULL.
  * @is_linux: Is set to true if the image loaded is Linux. Ignored if NULL.
  * @translate_fn: optional function to translate load addresses
  * @translate_opaque: opaque data passed to @translate_fn
--
2.17.1
