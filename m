Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp733224wrg;
        Thu, 16 May 2019 07:52:05 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyPtXwENbnXd14l/Ls7aSkVZwV/Un9V/mwJaglP86+8o6EGXLje1I6bVjx/6PLuxx9ReOTx
X-Received: by 2002:a05:6402:1484:: with SMTP id e4mr51037495edv.57.1558018325771;
        Thu, 16 May 2019 07:52:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558018325; cv=none;
        d=google.com; s=arc-20160816;
        b=FSZx8pn/zufOmNYw5D8YmYCd5w6K1Ae+olG5ZL8ltayWpqueZT06uPCE0Fqio0F+UZ
         +klm6sNMH/DWPkBhrZZFCzD1e4aXpVtuTtyAzCfshtLFkL0IpZPksxTQofHKWlvHyXe5
         AzSdPk94BcKt8clXiMIo6i1nJ+DKeuDHhxSVB+HOddEC6cK5XQyzU9EKIhlkL22gMCGl
         JUWi8BYcrS+JkAEK9qmMFfGuYXEag3gMFRvSkxdGrnLC+0dwsZ/dBYhml3AaHb3DXnwv
         P5pF7/ESIrVWEvLVeg0h7jyCrmJrnIgC3humhZ76nML0XRWxop0k4TmDoX1g8udWTsmv
         4atQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=GibGcyTIcznIDyrFlRM3SJZWG0A8Mzt1f5zkapp7jhE=;
        b=HSQIQiYUlZeknWmohk+IhXGQGcRTLrMk8iT1klYnGgFEaaZTaZ+mHb2ocA4pRhfwkJ
         HdBpaKLMPGAGGT4Z5/tokAxMSjd34Df6YtsUBKdtmaAfpqzOgAP6FuXflk5VVDtcqlTD
         dCvhuyswEPV16AcgDviIw+uZaVdw+ah3B0GUETg0lq1qn6IDV6MNvIWB9McJomfq+wma
         71DvHW0sOIzAuF30HaBktD0xlEOPxJYbbppueV2MjNhEDaUkYDh+CDq0PqKT1tevedtY
         Xax+jPLDuA3w8BT3ljzWwp2q60NauAiNGDBxy1kjnaNptynv8e0iv8gNJW7QvECtq9lu
         eHyg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=H8Vw5e9C;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l20si533131edc.154.2019.05.16.07.52.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 16 May 2019 07:52:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=H8Vw5e9C;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:59485 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hRHjn-00055K-NC
	for alex.bennee@linaro.org; Thu, 16 May 2019 10:52:03 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58944)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hRHfb-0002cl-0J
	for qemu-devel@nongnu.org; Thu, 16 May 2019 10:47:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hRHfZ-0008JW-MS
	for qemu-devel@nongnu.org; Thu, 16 May 2019 10:47:42 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:50458)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hRHfZ-0008Hp-94
	for qemu-devel@nongnu.org; Thu, 16 May 2019 10:47:41 -0400
Received: by mail-wm1-x341.google.com with SMTP id f204so3965740wme.0
	for <qemu-devel@nongnu.org>; Thu, 16 May 2019 07:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=GibGcyTIcznIDyrFlRM3SJZWG0A8Mzt1f5zkapp7jhE=;
	b=H8Vw5e9C8/9W/6OsKd81L4/LvbBc2gh2ltRh2oswyCqbSq88kWs6lpAxp3orCMc/jX
	LCRa8pEa+gCuox1nRe5+hcUgLe71W5es9StoMYW3KMGiNcEkhxCxuBWYFFap1+qnxidU
	k10jihy6GbiOWzv3rojFlAddeW8nDmQEr69j7y8zdyAOWSJH6yeatDF2EEnqvoSddlBh
	8sNdUl67gTOYxS9p92PwAX7iW3fqI75WB3tJghGZ1qR7CuQAefC/NUQnRuUDotGMfppT
	znBGqXo8hvBXnrb4gNRgs9Yo85PsoIZpostZBcXPCkCI6BKAKhXiAbyDBFub22lvpDT5
	EFDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=GibGcyTIcznIDyrFlRM3SJZWG0A8Mzt1f5zkapp7jhE=;
	b=mRZVcRksXlONYLh7nQe86EQ3KVwchCfsd4q1+khbgZyk39E7O896OubeHBbPEuswXP
	hgbY+9TaWIlb5AbYW/8MZUOCZirK7AAaz6aZ1+3q8hcf5Ghi1a3DS34U63rG/jEn526A
	ub2hIxMK9rnOAHPLPXKoL+oValZ3rmZCFKqVU0hFxLXVDpAlmYk1d4vaDOEtR9lK/oiZ
	ALczErWfF65/C6ZTxQpCUxqngh/oNtqePao+l9/2F14+1IHSSdzA2f4wny6P4K7vJ+Du
	vXTcI2NiQUyCSUOa1ZOizCwKGfOJlD0TiOpCfzg0P3JDuLnC6O7AaWKSzSHfTpM2AtEa
	UBhg==
X-Gm-Message-State: APjAAAWksxsxQ6+LwKX38KnVAT6STCvjZ8oaM1ddVLoF8WdxdMZQTfFZ
	mYu+ejeBG2MLblijP8d8pfXGRQ==
X-Received: by 2002:a1c:e916:: with SMTP id q22mr27842504wmc.148.1558018060254;
	Thu, 16 May 2019 07:47:40 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id o8sm7629018wra.4.2019.05.16.07.47.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 16 May 2019 07:47:39 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu, 16 May 2019 15:47:33 +0100
Message-Id: <20190516144733.32399-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190516144733.32399-1-peter.maydell@linaro.org>
References: <20190516144733.32399-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::341
Subject: [Qemu-devel] [PATCH v2 4/4] hw/arm/boot: Honour image size field in
 AArch64 Image format kernels
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SPM2LJ0ELtIi

Since Linux v3.17, the kernel's Image header includes a field image_size,
which gives the total size of the kernel including unpopulated data
sections such as the BSS). If this is present, then return it from
load_aarch64_image() as the true size of the kernel rather than
just using the size of the Image file itself. This allows the code
which calculates where to put the initrd to avoid putting it in
the kernel's BSS area.

This means that we should be able to reliably load kernel images
which are larger than 128MB without accidentally putting the
initrd or dtb in locations that clash with the kernel itself.

Fixes: https://bugs.launchpad.net/qemu/+bug/1823998
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/arm/boot.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index e441393fdf5..fc6f37ba6cf 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -910,6 +910,7 @@ static uint64_t load_aarch64_image(const char *filename, hwaddr mem_base,
                                    hwaddr *entry, AddressSpace *as)
 {
     hwaddr kernel_load_offset = KERNEL64_LOAD_ADDR;
+    uint64_t kernel_size = 0;
     uint8_t *buffer;
     int size;
 
@@ -937,7 +938,10 @@ static uint64_t load_aarch64_image(const char *filename, hwaddr mem_base,
          * is only valid if the image_size is non-zero.
          */
         memcpy(&hdrvals, buffer + ARM64_TEXT_OFFSET_OFFSET, sizeof(hdrvals));
-        if (hdrvals[1] != 0) {
+
+        kernel_size = le64_to_cpu(hdrvals[1]);
+
+        if (kernel_size != 0) {
             kernel_load_offset = le64_to_cpu(hdrvals[0]);
 
             /*
@@ -955,12 +959,21 @@ static uint64_t load_aarch64_image(const char *filename, hwaddr mem_base,
         }
     }
 
+    /*
+     * Kernels before v3.17 don't populate the image_size field, and
+     * raw images have no header. For those our best guess at the size
+     * is the size of the Image file itself.
+     */
+    if (kernel_size == 0) {
+        kernel_size = size;
+    }
+
     *entry = mem_base + kernel_load_offset;
     rom_add_blob_fixed_as(filename, buffer, size, *entry, as);
 
     g_free(buffer);
 
-    return size;
+    return kernel_size;
 }
 
 static void arm_setup_direct_kernel_boot(ARMCPU *cpu,
-- 
2.20.1

