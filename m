Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3334298wrt;
        Mon, 7 Jan 2019 03:23:48 -0800 (PST)
X-Google-Smtp-Source: ALg8bN6OCtKVo3bm247lLbfHgXZj0zzRdmfA/XbymrpwWXvkIJGuyJLTnGY6e8zFrAnSCUgEadUg
X-Received: by 2002:a5d:4b01:: with SMTP id v1mr48901885wrq.5.1546860228384;
        Mon, 07 Jan 2019 03:23:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1546860228; cv=none;
        d=google.com; s=arc-20160816;
        b=BibNb4xvX31WttBU+nfnvtBt4NtBvMuRef5GEKOcXAmt/pfgoOgpfkSi0Tefe0gvhG
         Ctfb9e40EQch4c3pvdnNmWedNMFomZdlwbBPHsaWhZ3VzcYQQHrqwBFhFUbi6VUVfoyf
         S2TZaP/btNRfx/uSXxFkJZYcgwDtQlVo7JQ5xPIdxO5Wegpwz+o/xp7PqjItkHOSeytg
         +7oYacB9w4b6yf3x9BQ5kFlOeOPWsa1KH0xqU/AC2J7gI/hLRFZQZV3OFUFeY3Gm9vl/
         UCl7CJ/E7/9/ipe9n7WqlTDVTOjFoKIlkLNlj8SqB3g7kV29XBEJv9KM7kpTBeEDDarz
         2E1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:mime-version:user-agent
         :date:message-id:from:to;
        bh=hF1cmjBog3yHYWECz5hBrbotdFBArU/Bf46gdfRTpxg=;
        b=EDG2Eqw57QLLhKzJfy/nWTFFa/K3fLEzdfJPXfVh2bZ2RmJ33lP1f1QIz/b5RsmeVA
         B43tisIuaiU8hEJdZAHRfOca0uoF4adUPfL8DyR5HRJKRgvCW/RPEM18Uu4vdGMys281
         r7J6Gj2HQd2BMOZpyLcmA8SJ+wtWu/x6FEDS5iSTQ0PWUQaOngoODbph2kTLvIDG4paa
         vqaM4/Ojk6v6E01lKig4N8p5TT9HpbHCjyC4xnyWp4HdW3CcFL2WulcmQ7qz21Uh8DBk
         eiIYLYVa6nq6sVQYU7+KtzhMz8y0afyzes3XaQOb4t8qxdxXhMfwN0Ojs68VL969EdcT
         bzZw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j186si5090860wma.7.2019.01.07.03.23.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 07 Jan 2019 03:23:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:42373 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ggT0V-000758-B8
	for alex.bennee@linaro.org; Mon, 07 Jan 2019 06:23:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52083)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <nick.hudson@gmx.co.uk>) id 1ggQKI-0007tR-NC
	for qemu-arm@nongnu.org; Mon, 07 Jan 2019 03:32:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <nick.hudson@gmx.co.uk>) id 1ggQKH-0002oB-Jl
	for qemu-arm@nongnu.org; Mon, 07 Jan 2019 03:32:02 -0500
Received: from mout.gmx.net ([212.227.15.19]:58731)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <nick.hudson@gmx.co.uk>)
	id 1ggQKD-0002lI-Lp; Mon, 07 Jan 2019 03:31:57 -0500
Received: from [192.168.0.37] ([2.122.9.171]) by mail.gmx.com (mrgmx001
	[212.227.17.184]) with ESMTPSA (Nemesis) id 0LcSAg-1h7XOp1GII-00jucz;
	Mon, 07 Jan 2019 09:31:53 +0100
To: QEMU Developers <qemu-devel@nongnu.org>
From: Nick Hudson <nick.hudson@gmx.co.uk>
Message-ID: <11488a08-1fe0-a278-2210-deb64731107f@gmx.co.uk>
Date: Mon, 7 Jan 2019 08:31:50 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:cyGUaS8P4aSV1ejMHQgofEbZSQ2ukMo8imhLnSxEiMPbxlOkgcL
	STRLDk7MYqlemRK2QhdtwWUEfMAeTvjQ1ZQDekiSwiGzlYO9bHsyJll2GRpza6anPe5npAm
	g/MWzRg41TPpPB0gorUk8p448T3pltn7rPGNcYsQhs2N6FJbI6/ihAu6h5/tww6gQQcJpXC
	LSzX4ZYsInY/FVyuGC4RQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:FC5/hQ86dQQ=:tV38vkRoK96AzFYntAPugh
	UTXNZnWtMO+eT2/A4oln+HUutgikGxYdo6tDpzv56YOKixb9ON99gOoBADmUtUgZKLIlTUKW4
	C+ax0U1y9ivNrFV24WJMHshs3nnG4RQAE6DNANOM3k5NVSi70qHchN6+om0ndkZz31CBT/B44
	ndg5IY2bfQJUITFW/EoRPFpTJaqkJ4oexMwNAeURnEhZyF/cc0Mg+SlVNQlhHk7wtig7C7G7k
	VsdeuxR9Cp0F68Rjot39/mAnlC3ZVkDsNiIgHTtA+B8UJ1+vQiyfCCud/dnnmBWYBkUE/xQ/A
	i/w4JUX6RRHzLTDpDJaGlP7prHQ2P/Kueu0QuX6D617aSV2PpyxhwpG5LN6Dp7iOT9sybwurA
	4j88xpnw9wBD62cZID5PBDvuZAQWvgKZbS/TCMSGbEPg9E/DF2cXM6KS1L/ntnjIAM1oL4QyC
	zBanfsFwJ1EYP6sbZZUP5ZV9e/Fhm7iMKUt1qpYYq7qOg9jo0CZrZ5Z1AYPj7J301AbXyAtyf
	A5vMYbnZgIjG7RrbLnBlmckhnN8LR8QJxGLXkaKyoM/HkZmLGZ+UDLC5Bxp4VvQ+iSiqa8BLp
	4FHmpRC98mHhQxHj0d62vobNgnud36tmD1tXOnxIqqdloIcc0UKCUvFhQyFOKFGH4Ma+sORMi
	lTwk8O4xWL9XWeAnQFcrbmUeXQSx9YUDfoFs8EKLd+DDOYki7LXPzFGm1hKg4CLgS325jA+nW
	A6YpVd1DBLTc/zO6pM2Euf8VjFxVwcopcx4GKX3ovsGd7o5DKMom6/qmQQTkNDU7Pd7crAQwv
	Bnc/C2m0qchy8/8swoTMIBQZfUbFetln5TnxJ7ojthKLA+5C4k/kinnzt0pzY5XmHOM5phRgH
	9m+dYMFGj2BVG+1rganCgusLikxd468f5duJBLbHreomRJnwcY/SGfVHyH2L4+U+7oPSHIBY0
	NjQQeSX8rlg==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.15.19
X-Mailman-Approved-At: Mon, 07 Jan 2019 06:23:38 -0500
Subject: [Qemu-arm] [PATCH v5] Support u-boot noload images for arm as used
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Bp36OMJgYAOw


noload kernels are loaded with the u-boot image header and as a result
the header size needs adding to the entry point.  Fake up a hdr so the
kernel image is loaded at the right address and the entry point is
adjusted appropriately.

The default location for the uboot file is 32MiB above bottom of DRAM.
This matches the recommendation in Documentation/arm/Booting.

Clarify the load_uimage API to state the passing of a load address when an
image doesn't specify one, or when loading a ramdisk is expected.

Adjust callers of load_uimage, etc.

Signed-off-by: Nick Hudson <skrll@netbsd.org>
---
 hw/arm/boot.c          |  8 +++++---
 hw/core/loader.c       | 19 ++++++++++++++++---
 hw/core/uboot_image.h  |  1 +
 hw/microblaze/boot.c   |  2 +-
 hw/nios2/boot.c        |  2 +-
 hw/ppc/e500.c          |  1 +
 hw/ppc/ppc440_bamboo.c |  2 +-
 hw/ppc/sam460ex.c      |  2 +-
 include/hw/loader.h    |  7 ++++++-
 9 files changed, 33 insertions(+), 11 deletions(-)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index 94fce12802..c7a67af7a9 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -30,8 +30,9 @@
  * Documentation/arm/Booting and Documentation/arm64/booting.txt
  * They have different preferred image load offsets from system RAM base.
  */
-#define KERNEL_ARGS_ADDR 0x100
-#define KERNEL_LOAD_ADDR 0x00010000
+#define KERNEL_ARGS_ADDR   0x100
+#define KERNEL_NOLOAD_ADDR 0x02000000
+#define KERNEL_LOAD_ADDR   0x00010000
 #define KERNEL64_LOAD_ADDR 0x00080000
 
 #define ARM64_TEXT_OFFSET_OFFSET    8
@@ -1082,7 +1083,8 @@ void arm_load_kernel(ARMCPU *cpu, struct arm_boot_info *info)
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
index fa41842280..c7182dfa64 100644
--- a/hw/core/loader.c
+++ b/hw/core/loader.c
@@ -613,13 +613,26 @@ static int load_uboot_image(const char *filename, hwaddr *ep, hwaddr *loadaddr,
         goto out;
 
     if (hdr->ih_type != image_type) {
-        fprintf(stderr, "Wrong image type %d, expected %d\n", hdr->ih_type,
-                image_type);
-        goto out;
+        if (!(image_type == IH_TYPE_KERNEL &&
+            hdr->ih_type == IH_TYPE_KERNEL_NOLOAD)) {
+            fprintf(stderr, "Wrong image type %d, expected %d\n", hdr->ih_type,
+                    image_type);
+            goto out;
+        }
     }
 
     /* TODO: Implement other image types.  */
     switch (hdr->ih_type) {
+    case IH_TYPE_KERNEL_NOLOAD:
+        if (!loadaddr || *loadaddr == LOAD_UIMAGE_LOADADDR_INVALID) {
+            fprintf(stderr, "this image format (kernel_noload) cannot be "
+                    "loaded on this machine type");
+            goto out;
+        }
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
 #define IH_TYPE_SCRIPT		6	/* Script file			*/
 #define IH_TYPE_FILESYSTEM	7	/* Filesystem Image (any type)	*/
 #define IH_TYPE_FLATDT		8	/* Binary Flat Device Tree Blob	*/
+#define IH_TYPE_KERNEL_NOLOAD  14	/* OS Kernel Image (noload)	*/
 
 /*
  * Compression Types
diff --git a/hw/microblaze/boot.c b/hw/microblaze/boot.c
index 35bfeda7aa..489ab839b7 100644
--- a/hw/microblaze/boot.c
+++ b/hw/microblaze/boot.c
@@ -156,7 +156,7 @@ void microblaze_load_kernel(MicroBlazeCPU *cpu, hwaddr ddr_base,
 
         /* If it wasn't an ELF image, try an u-boot image.  */
         if (kernel_size < 0) {
-            hwaddr uentry, loadaddr;
+            hwaddr uentry, loadaddr = LOAD_UIMAGE_LOADADDR_INVALID;
 
             kernel_size = load_uimage(kernel_filename, &uentry, &loadaddr, 0,
                                       NULL, NULL);
diff --git a/hw/nios2/boot.c b/hw/nios2/boot.c
index 4bb5b601d3..ed5cb28e94 100644
--- a/hw/nios2/boot.c
+++ b/hw/nios2/boot.c
@@ -161,7 +161,7 @@ void nios2_load_kernel(Nios2CPU *cpu, hwaddr ddr_base,
 
         /* If it wasn't an ELF image, try an u-boot image. */
         if (kernel_size < 0) {
-            hwaddr uentry, loadaddr;
+            hwaddr uentry, loadaddr = LOAD_UIMAGE_LOADADDR_INVALID;
 
             kernel_size = load_uimage(kernel_filename, &uentry, &loadaddr, 0,
                                       NULL, NULL);
diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
index b20fea0dfc..0581e9e3d4 100644
--- a/hw/ppc/e500.c
+++ b/hw/ppc/e500.c
@@ -995,6 +995,7 @@ void ppce500_init(MachineState *machine)
          * Hrm. No ELF image? Try a uImage, maybe someone is giving us an
          * ePAPR compliant kernel
          */
+        loadaddr = LOAD_UIMAGE_LOADADDR_INVALID;
         payload_size = load_uimage(filename, &bios_entry, &loadaddr, NULL,
                                    NULL, NULL);
         if (payload_size < 0) {
diff --git a/hw/ppc/ppc440_bamboo.c b/hw/ppc/ppc440_bamboo.c
index b8aa55d526..fc06191588 100644
--- a/hw/ppc/ppc440_bamboo.c
+++ b/hw/ppc/ppc440_bamboo.c
@@ -179,7 +179,7 @@ static void bamboo_init(MachineState *machine)
     CPUPPCState *env;
     uint64_t elf_entry;
     uint64_t elf_lowaddr;
-    hwaddr loadaddr = 0;
+    hwaddr loadaddr = LOAD_UIMAGE_LOADADDR_INVALID;
     target_long initrd_size = 0;
     DeviceState *dev;
     int success;
diff --git a/hw/ppc/sam460ex.c b/hw/ppc/sam460ex.c
index 4b051c0950..84ea592749 100644
--- a/hw/ppc/sam460ex.c
+++ b/hw/ppc/sam460ex.c
@@ -402,7 +402,7 @@ static void sam460ex_init(MachineState *machine)
     CPUPPCState *env;
     PPC4xxI2CState *i2c[2];
     hwaddr entry = UBOOT_ENTRY;
-    hwaddr loadaddr = 0;
+    hwaddr loadaddr = LOAD_UIMAGE_LOADADDR_INVALID;
     target_long initrd_size = 0;
     DeviceState *dev;
     SysBusDevice *sbdev;
diff --git a/include/hw/loader.h b/include/hw/loader.h
index 0a0ad808ea..de8a29603b 100644
--- a/include/hw/loader.h
+++ b/include/hw/loader.h
@@ -175,10 +175,15 @@ void load_elf_hdr(const char *filename, void *hdr, bool *is64, Error **errp);
 int load_aout(const char *filename, hwaddr addr, int max_sz,
               int bswap_needed, hwaddr target_page_size);
 
+#define LOAD_UIMAGE_LOADADDR_INVALID (-1)
+
 /** load_uimage_as:
  * @filename: Path of uimage file
  * @ep: Populated with program entry point. Ignored if NULL.
- * @loadaddr: Populated with the load address. Ignored if NULL.
+ * @loadaddr: load address if none specified in the image or when loading a
+ *            ramdisk. Populated with the load address. Ignored if NULL or
+ *            LOAD_UIMAGE_LOADADDR_INVALID (images which do not specify a load
+ *            address will not be loadable).
  * @is_linux: Is set to true if the image loaded is Linux. Ignored if NULL.
  * @translate_fn: optional function to translate load addresses
  * @translate_opaque: opaque data passed to @translate_fn
-- 
2.17.1

