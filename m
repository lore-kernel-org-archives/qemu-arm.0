Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp2139461wrw;
        Wed, 7 Nov 2018 05:34:43 -0800 (PST)
X-Google-Smtp-Source: AJdET5ctYOwlvhtNo9QXSlT+rmpRgd+R6mEnkYk9mT8SWeXnA5G+eoSfLnIZ6HRcqXiF6A9q1OKH
X-Received: by 2002:ac8:478f:: with SMTP id k15mr195304qtq.281.1541597683460;
        Wed, 07 Nov 2018 05:34:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541597683; cv=none;
        d=google.com; s=arc-20160816;
        b=MmTCGN6aQudFM9mo6AtPJ3XCI0BN1L7sLrOK3xpOCwWv4DDfs/PlKiGWoPCS45k6zN
         AdWZEsJn7CIKpFXSrlRzANZEj9GwD+oQsNvCysrS/llwUSWgzio5QQFidmySme3htPsa
         SWAlfIp1zFhJIWZomBWDzKDhmtHp9rlaSDSgjUHyTJ5bpsWqAvGYELTRBYiUnN23NVgq
         098t1Nh+2KG5AlSY+X7nQ4RtoABKz3YEpT8hsQd00SEePHUhAVXNx041ucD0FfQnajtC
         QRAs5kU1PQSS61f5WHfi3iXYbAClBsZbbh1uarxnCn5MZDoPRtczLiY3Q1z9nNNgrVjY
         nSig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:content-language
         :content-transfer-encoding:mime-version:user-agent:date:message-id
         :to:from:dkim-signature;
        bh=mADRNCaQxmO9LzgrEcKBqrU6gGW7lSHwsqYZuCquPDM=;
        b=nmvStDE59+GGkymICq7AKf17IlvUlWkFLQMp5V446yr584wKdp4cZD/P6wr6p9gNx/
         ZbXKXeKHB+OHTbtTSq8vw9rpTz01wt9JRtSqha7nNn+OjyrIuaJN1kfSBeFusgJcgID6
         3bMU/PRGVqeufo0yU05eDi3In+V+als2iJZWwfW2VsykXvShQodVsAIAIQ9hfLY/jbOs
         qzKpvhxoXMyag4MtFv0tn2GgePfS2tkzdXIvtC9d8b/WLwQ/0EB3ouuDxw2JDrbPYp6Y
         XTHsm7GELMWOXARS2wRwlUXiETDZPGDrceV2eh8ncSz2w2MIGoivvn3Z5qyYHLSbyEb4
         /wpA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=snPI8Wil;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m68si482626qkd.120.2018.11.07.05.34.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 07 Nov 2018 05:34:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=snPI8Wil;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:48382 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gKNyl-0007jg-0H
	for alex.bennee@linaro.org; Wed, 07 Nov 2018 08:34:43 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53261)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <nicholas.a.hudson@gmail.com>) id 1gKNjs-00016n-NJ
	for qemu-arm@nongnu.org; Wed, 07 Nov 2018 08:19:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <nicholas.a.hudson@gmail.com>) id 1gKNje-0002MQ-Pz
	for qemu-arm@nongnu.org; Wed, 07 Nov 2018 08:19:14 -0500
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:33807)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <nicholas.a.hudson@gmail.com>)
	id 1gKNje-0002Ln-Bg; Wed, 07 Nov 2018 08:19:06 -0500
Received: by mail-wr1-x441.google.com with SMTP id j26-v6so17390629wre.1;
	Wed, 07 Nov 2018 05:19:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:message-id:date:user-agent:mime-version
	:content-transfer-encoding:content-language;
	bh=mADRNCaQxmO9LzgrEcKBqrU6gGW7lSHwsqYZuCquPDM=;
	b=snPI8WilfHn6w9DQ32BcEn1gZhhbmG/rrNKq8iDr+/+AA2i03VMBpF0dSbousAXFMV
	BujpGLsDTyF1oQzpt2qgLoU+kPSdWWV/9PsUlPb217PuCvFHa9qtbEZJY3OTw5U5ygG8
	T5bJ9IDDLJ7Z/f1QFRx+9XKe4qVFR+Qu78uALjjsHWnPgrH/H3gwNUPbzPwk5oM2GKA5
	Eqoh5EGf+8cryEtXrEIauzVP3sVsVQ8BBN00t1iWnsDvxHoaf7jhzyjnOWnTqLEa6gWe
	vIojMM8lR9hjpxoE8ekYt2CkOTHnxDXMx5zRZLJfhfkR4yqZDeAQmcnJJZcNMhSJQwyo
	lCQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:message-id:date:user-agent
	:mime-version:content-transfer-encoding:content-language;
	bh=mADRNCaQxmO9LzgrEcKBqrU6gGW7lSHwsqYZuCquPDM=;
	b=seqg2dzfzHy2gJbyEPn95grJx1SMBBdXMzySEKo9cm8FK6J5JXtrYqS6hd1yF7dhJZ
	QH8EhB8EbyuAJ8IU2b06SMk7i/H4oVHhEXFD1wyK2dxtiZlRA6Tku3bW3Xzzmh7Dd39n
	w6ug5VxPJnUOIvqyVw2HOZsm70zrshfcTKv9EhS5KjbVmgCBZeb2KYSiUlNSuupTGLSb
	yFAfJKo7tvWc+h/66/BIBKAH15dQIKQX4VCHH03ww4k0M19Ef8/+de6XO9Je3ySy5aRs
	WpsxjqFc3VQspA0teNFGx3aHfIwyKCG3t/ySSKJMLJNlTFTuftwAfcTOn9sUhxbQcZsd
	VbfA==
X-Gm-Message-State: AGRZ1gKj4z4uVCi+M7KoZzLqzijtyJbK7Pmi5J7TXNt/m8EnlwUTu264
	epDnMl1wO/uwzySQQVTZfaI=
X-Received: by 2002:a5d:4747:: with SMTP id o7-v6mr181835wrs.256.1541596745094;
	Wed, 07 Nov 2018 05:19:05 -0800 (PST)
Received: from [192.168.0.45] ([90.200.74.20])
	by smtp.gmail.com with ESMTPSA id
	r14-v6sm929330wro.8.2018.11.07.05.19.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 07 Nov 2018 05:19:04 -0800 (PST)
From: Nick Hudson <nicholas.a.hudson@gmail.com>
X-Google-Original-From: Nick Hudson <skrll@netbsd.org>
To: qemu-devel@nongnu.org
Message-ID: <d9876015-2126-79fe-415f-ca7427ab3059@gmail.com>
Date: Wed, 7 Nov 2018 13:19:00 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::441
X-Mailman-Approved-At: Wed, 07 Nov 2018 08:34:36 -0500
Subject: [Qemu-arm] [PATCH] Support u-boot noload images for arm as used by
 NetBSD/evbarm GENERIC kernel.
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bgM6bXqbvFbF

noload kernels are loaded with the u-boot image header and as a result
the header size needs adding to the entry point.  Fake up a hdr so the
kernel image is loaded at the right address and the entry point is
adjusted appropriately

Signed-off-by: Nick Hudson <skrll@netbsd.org>
---
  hw/arm/boot.c         |  8 +++++---
  hw/core/loader.c      | 12 +++++++++---
  hw/core/uboot_image.h |  1 +
  3 files changed, 15 insertions(+), 6 deletions(-)

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
+#define KERNEL_ARGS_ADDR   0x100
+#define KERNEL_NOLOAD_ADDR 0x00000000
+#define KERNEL_LOAD_ADDR   0x00010000
  #define KERNEL64_LOAD_ADDR 0x00080000

  #define ARM64_TEXT_OFFSET_OFFSET    8
@@ -1078,7 +1079,8 @@ void arm_load_kernel(ARMCPU *cpu, struct 
arm_boot_info *info)
      }
      entry = elf_entry;
      if (kernel_size < 0) {
-        kernel_size = load_uimage_as(info->kernel_filename, &entry, NULL,
+        uint64_t loadaddr = info->loader_start + KERNEL_NOLOAD_ADDR;
+        kernel_size = load_uimage_as(info->kernel_filename, &entry, 
&loadaddr,
                                       &is_linux, NULL, NULL, as);
      }
      if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64) && kernel_size < 0) {
diff --git a/hw/core/loader.c b/hw/core/loader.c
index aa0b3fc867..952562c2da 100644
--- a/hw/core/loader.c
+++ b/hw/core/loader.c
@@ -638,13 +638,19 @@ static int load_uboot_image(const char *filename, 
hwaddr *ep, hwaddr *loadaddr,
          goto out;

      if (hdr->ih_type != image_type) {
-        fprintf(stderr, "Wrong image type %d, expected %d\n", hdr->ih_type,
-                image_type);
-        goto out;
+        if (image_type != IH_TYPE_KERNEL && hdr->ih_type != 
IH_TYPE_KERNEL_NOLOAD) {
+            fprintf(stderr, "Wrong image type %d, expected %d\n", 
hdr->ih_type,
+                    image_type);
+            goto out;
+        }
      }

      /* TODO: Implement other image types.  */
      switch (hdr->ih_type) {
+    case IH_TYPE_KERNEL_NOLOAD:
+        hdr->ih_load = *loadaddr + sizeof(*hdr);
+        hdr->ih_ep += hdr->ih_load;
+
      case IH_TYPE_KERNEL:
          address = hdr->ih_load;
          if (translate_fn) {
diff --git a/hw/core/uboot_image.h b/hw/core/uboot_image.h
index 34c11a70a6..608022de6e 100644
--- a/hw/core/uboot_image.h
+++ b/hw/core/uboot_image.h
@@ -124,6 +124,7 @@
  #define IH_TYPE_SCRIPT        6    /* Script file            */
  #define IH_TYPE_FILESYSTEM    7    /* Filesystem Image (any type)    */
  #define IH_TYPE_FLATDT        8    /* Binary Flat Device Tree Blob    */
+#define IH_TYPE_KERNEL_NOLOAD  14    /* OS Kernel Image (noload)    */

  /*
   * Compression Types
-- 
2.17.1


