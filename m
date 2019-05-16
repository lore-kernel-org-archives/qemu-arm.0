Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp732532wrg;
        Thu, 16 May 2019 07:51:24 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzjRuUeGk/prOv4uzJfA+p/tAN5GJO0i8ZW2+YYXafEbQIWnIMcIKq7Y7IvgGGJH+70Te8B
X-Received: by 2002:a17:906:4988:: with SMTP id p8mr3947148eju.220.1558018284636;
        Thu, 16 May 2019 07:51:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558018284; cv=none;
        d=google.com; s=arc-20160816;
        b=YztFTZDnNl2NXBGe8gHjUV751KdwFpEZBtjt2tyPN7BTt/ho7Tr+fxZbWpRYoIzL6i
         Wetz3JKuEFgZlx1kFxWFyhxL2v1eFZfJyl7MMdzgU+d4ZfjQgKSy4KQJLZvnHWJ1u8RK
         tTQS6SYlkLoelCu0luPVHR7MLTyXh9liOx6VYaMOkAXB2szE4oXekNMG3fPJAhBOimub
         g33RMjPPm0queWHG1IiDWOCJPu+EtjHD/RYmhr/0kSlJgw68NYNAAtiXrOAJ2b/ucONJ
         v46a9YVHS8yIKbgCjogPCCTM+c/moyS/N89bPTuLPWygHxfAT1zkYHigsfv5Icjbxg4f
         qJlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=l9q7KvmjaLy6huMCLkNzLHAGghAhe5aW2pE9iFxRei4=;
        b=kyHf4/BKR7KxvdyECfWZg3CBBkC+fxOAZaaHjIOyW1qZ6p8Ur1jyigcWrNr42Ugdeh
         kDfUaxGhbl5gxyP79f8I7D1JV6PAA1jcOrDhLRICFc7cnGUdgWz+3K8MowCLI/VVtAKa
         4c76B2tp7vqht6HRbDPS/KQtAYTaRE9f0yRIzQot9QBIjuOkIcOl2jbrWZWHNBhhCYQd
         glZNbt4VpAg/qLSE9ajKzzw46xcpO92HmHteF1rv9IWK0H8tmC0UZkloKCcdxxRP3HGm
         lT8q7jZps6ZYK2rLr/h1o/K3+8MsSCeNsE1wRlR0xbr7nuJUccypiyTwaN1rSOQib4Do
         Fhiw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=siYCmilX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c16si3677629ejb.245.2019.05.16.07.51.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 16 May 2019 07:51:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=siYCmilX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:59487 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hRHj9-00057I-JZ
	for alex.bennee@linaro.org; Thu, 16 May 2019 10:51:23 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58917)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hRHfZ-0002bM-Oz
	for qemu-arm@nongnu.org; Thu, 16 May 2019 10:47:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hRHfY-0008I2-Kh
	for qemu-arm@nongnu.org; Thu, 16 May 2019 10:47:41 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:33463)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hRHfY-0008GW-Ca
	for qemu-arm@nongnu.org; Thu, 16 May 2019 10:47:40 -0400
Received: by mail-wr1-x442.google.com with SMTP id d9so3782582wrx.0
	for <qemu-arm@nongnu.org>; Thu, 16 May 2019 07:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=l9q7KvmjaLy6huMCLkNzLHAGghAhe5aW2pE9iFxRei4=;
	b=siYCmilXdCQxs0pTnh8rf295KB88n2tg3pdX3QvoPyXQqmhksf1Kxuw127Sy048LOb
	Pj7IWwFOatj83QodTxOm2oRAE5okdEmtYzdFlB2a0zIowtMOhmgSHlW16JMK/dF6LWN+
	pezYWy7mS2OLXXYlevM3XFwFZTu9ptLUUkbXzUS8n2NSSdqtHhr0y8G0/OyNnfZLTw99
	eUuKHFTLxIiTR43JE+LVlWfrkj0Y26zcSWK7FfsUabYMHTeqqWgfrKVrY0dXPXlPP0fI
	3FvQyMznOc8CM0mZkPfr2H0j8bTzQOlXhjRA9k+R1V2E4PmvbICdROlfbZZzOl5gO+xx
	fHXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=l9q7KvmjaLy6huMCLkNzLHAGghAhe5aW2pE9iFxRei4=;
	b=NT1gcKPYl3v8qJ1KSrgjDlWAyirNRf1ut3ouvbBng/YIFIiituVrawEnmcR+8+RIlk
	B0AsYBMvRUmeeA8zEPUp8eDPGsm/5cYqG+axAztEjyiJSFEyrDkPISC3zB+ZTk+XhXD5
	NNWEzbuUytM2oBOOd5AdFqk2lSol6YecbMSyIVz+4DCod841PELCKfqdKhuC99ZJ54+2
	kv4xKm0Qg+ACIcHudSA9gXTxJWmdfuyJPnLFnHmQT4d0pOVkAQL2lkLpe9MG5ZVHbIeJ
	QysMqd/vmyxGSu9hc2kTRwLVGNDqfOZ2lE4HI4A5XMCW7gZx7nfNF6+rXR55LHSqYtX6
	IdxA==
X-Gm-Message-State: APjAAAXcv3EVmHRgynUdTA+Jnc5CqUZiw6ljVnc1u19E6ma+K0SKTdQZ
	96WCsnoiBrYFU1qXaYyjfHoi53eTcA0=
X-Received: by 2002:adf:dcc4:: with SMTP id x4mr5709889wrm.107.1558018059213; 
	Thu, 16 May 2019 07:47:39 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id o8sm7629018wra.4.2019.05.16.07.47.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 16 May 2019 07:47:38 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu, 16 May 2019 15:47:32 +0100
Message-Id: <20190516144733.32399-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190516144733.32399-1-peter.maydell@linaro.org>
References: <20190516144733.32399-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::442
Subject: [Qemu-arm] [PATCH v2 3/4] hw/arm/boot: Avoid placing the initrd on
 top of the kernel
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
Cc: Mark Rutland <mark.rutland@arm.com>,
	Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AZsON3dIriRc

We currently put the initrd at the smaller of:
 * 128MB into RAM
 * halfway into the RAM
(with the dtb following it).

However for large kernels this might mean that the kernel
overlaps the initrd. For some kinds of kernel (self-decompressing
32-bit kernels, and ELF images with a BSS section at the end)
we don't know the exact size, but even there we have a
minimum size. Put the initrd at least further into RAM than
that. For image formats that can give us an exact kernel size, this
will mean that we definitely avoid overlaying kernel and initrd.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/boot.c | 34 ++++++++++++++++++++--------------
 1 file changed, 20 insertions(+), 14 deletions(-)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index 935be3b92a5..e441393fdf5 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -999,20 +999,6 @@ static void arm_setup_direct_kernel_boot(ARMCPU *cpu,
     if (info->nb_cpus == 0)
         info->nb_cpus = 1;
 
-    /*
-     * We want to put the initrd far enough into RAM that when the
-     * kernel is uncompressed it will not clobber the initrd. However
-     * on boards without much RAM we must ensure that we still leave
-     * enough room for a decent sized initrd, and on boards with large
-     * amounts of RAM we must avoid the initrd being so far up in RAM
-     * that it is outside lowmem and inaccessible to the kernel.
-     * So for boards with less  than 256MB of RAM we put the initrd
-     * halfway into RAM, and for boards with 256MB of RAM or more we put
-     * the initrd at 128MB.
-     */
-    info->initrd_start = info->loader_start +
-        MIN(info->ram_size / 2, 128 * 1024 * 1024);
-
     /* Assume that raw images are linux kernels, and ELF images are not.  */
     kernel_size = arm_load_elf(info, &elf_entry, &elf_low_addr,
                                &elf_high_addr, elf_machine, as);
@@ -1064,6 +1050,26 @@ static void arm_setup_direct_kernel_boot(ARMCPU *cpu,
     }
 
     info->entry = entry;
+
+    /*
+     * We want to put the initrd far enough into RAM that when the
+     * kernel is uncompressed it will not clobber the initrd. However
+     * on boards without much RAM we must ensure that we still leave
+     * enough room for a decent sized initrd, and on boards with large
+     * amounts of RAM we must avoid the initrd being so far up in RAM
+     * that it is outside lowmem and inaccessible to the kernel.
+     * So for boards with less  than 256MB of RAM we put the initrd
+     * halfway into RAM, and for boards with 256MB of RAM or more we put
+     * the initrd at 128MB.
+     * We also refuse to put the initrd somewhere that will definitely
+     * overlay the kernel we just loaded, though for kernel formats which
+     * don't tell us their exact size (eg self-decompressing 32-bit kernels)
+     * we might still make a bad choice here.
+     */
+    info->initrd_start = info->loader_start +
+        MAX(MIN(info->ram_size / 2, 128 * 1024 * 1024), kernel_size);
+    info->initrd_start = TARGET_PAGE_ALIGN(info->initrd_start);
+
     if (is_linux) {
         uint32_t fixupcontext[FIXUP_MAX];
 
-- 
2.20.1

