Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp731184wrg;
        Thu, 16 May 2019 07:50:03 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx7bvUbtXDgEsHB2EDQYgO8Uc+7FfoHINzObiayrOFKVSKCkh+MB8nWFA1ASbGESvEAkQRf
X-Received: by 2002:a17:906:7c12:: with SMTP id t18mr39767349ejo.59.1558018203045;
        Thu, 16 May 2019 07:50:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558018203; cv=none;
        d=google.com; s=arc-20160816;
        b=GTO3UwtomNBxnY/X9b1LYFlXZ8AccGGS02RWVSwENqDVGQoqspTxuv0kOdluYR2ym5
         5mTDsyabGRl5SJS80JoxyF5ZACQNYuPS2o+L7oAZezjA2vsXPzh2gKoSpCYwIqOV11qB
         5TSyL/7U8YZ8fXHMbl7hASzsGg32Y4kQx7DPgEAcONN0xq7evLqmPJlAEbEZVax3PVXq
         LXk04O2yJ4AiAFWzbgPYjZIjocunbE0qLDjVw1BSDik8jroBajoq7PHUxwmMi0kBIBud
         RaSjx+0gxJdbNm3HQK7yRx8k/FnStlbU2s8vSvo+/ISxJWaoZ/kskxQcWiCw+KAylgI/
         xiLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=ZzmBM+wcCb9270VyvJ51TIpyGicjAazonG2iWSjoQgc=;
        b=F5d6g2y2xmSYaI8hoAc97ADXhI/zB6PvBE59KN3MFfhfkAxItjOmYymv6tHKr2WmC5
         b0WANnFollxD4GjdsW9qgZiR/ChU48dj2q2423kXmS4gelycp0ne3Bwqcu4iYz3o9SKE
         v+golPH46VRnnvX4KPox7sde2vbtjxRVwXo6FFuwtCrQ1KBC/oMrVnfEqMo9X5LmBGK2
         Ni1YxmMfZ7aH4OE+JDBWUkqSOmSaxKsBWfHRZ9pkhrOWwOj5aC6pwzirDBiSprFeSc9f
         MtphrRybh4alramOEPTHNz/ADhQiUWE5g7WyxYTYWFHnwzFRM/cNFZvSV/78cCtjahMK
         20UQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dFH3g7ap;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l24si3995269edq.115.2019.05.16.07.50.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 16 May 2019 07:50:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dFH3g7ap;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:59417 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hRHhq-0003XY-4U
	for alex.bennee@linaro.org; Thu, 16 May 2019 10:50:02 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58851)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hRHfX-0002Za-6W
	for qemu-devel@nongnu.org; Thu, 16 May 2019 10:47:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hRHfW-0008E8-0G
	for qemu-devel@nongnu.org; Thu, 16 May 2019 10:47:38 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:36333)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hRHfV-0008D3-Pm
	for qemu-devel@nongnu.org; Thu, 16 May 2019 10:47:37 -0400
Received: by mail-wr1-x444.google.com with SMTP id s17so3759008wru.3
	for <qemu-devel@nongnu.org>; Thu, 16 May 2019 07:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=ZzmBM+wcCb9270VyvJ51TIpyGicjAazonG2iWSjoQgc=;
	b=dFH3g7apCsFiSnQ2IZ2+IxFvBA512Pz9PeYAWM4u3CIt80+JQzjym49JE2DGBwhMtN
	BoI4Zt7gWyn2jKFh2AapYyYPsqIU+HRUR8PpHaZf+wIwbb357YNddL1MZ3cMTmZDDrsy
	dgFdwil6BkvO6u/ksdDsqY7A+IN+97kYRrajt88UTMolwNa05NEZiiO1W3+DYp6fxcT6
	381b7K6K6XIi2g1chgiONKrCU3zzO4Ux47rmSubsnh6JIkC8tQm41idgbTz27KONAq3x
	zyI/HSzB/oZxWlwq6KKRdNcwCBZbuTBhEAzgDtSFKAGsVZhctaqneKCnnLGya+ojIjgJ
	kM7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=ZzmBM+wcCb9270VyvJ51TIpyGicjAazonG2iWSjoQgc=;
	b=sDa2noDmsRZwHFmIJRd3EF2Q6jsSXU35IUjVMJUX66e8oGnN/7tm55IetVaaDcLyQU
	3X8MPD5GRXhf0YJBwO45MsVDMPrya+ESfAZLKTywXeIDJ+4WJGLOYFwOv9phKbYc8DUW
	JUW4ok42jbXzu6qPqTyd/cxCg1SRUBQR5DnBzNYr99wOQCwUcPHSHxJy+qSqqJYoP1MZ
	C19xqNEhGzXkzBFefOwVfeZcPKjPz7SlLGXMM2fmIKtMsV8lvmgdoSpjZXfzSmGFl3i0
	PcMTPtyayiF9LOzEh6bGlIhFMPVg4J8njW8+s94Ci3beE132vBr9vTTsBNwQbrN9gXFZ
	FViw==
X-Gm-Message-State: APjAAAVqGaZVznndXIlkACuzJMQtIQEaXpv/AvKHddzEbXLcyXVr8rkF
	nmrr29Z/YDo3RKWI/viZW27AHA==
X-Received: by 2002:adf:c188:: with SMTP id x8mr20036758wre.256.1558018056982; 
	Thu, 16 May 2019 07:47:36 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id o8sm7629018wra.4.2019.05.16.07.47.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 16 May 2019 07:47:36 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu, 16 May 2019 15:47:30 +0100
Message-Id: <20190516144733.32399-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190516144733.32399-1-peter.maydell@linaro.org>
References: <20190516144733.32399-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::444
Subject: [Qemu-devel] [PATCH v2 1/4] hw/arm/boot: Don't assume RAM starts at
 address zero
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
X-TUID: TaNUFzsjG7r2

In the Arm kernel/initrd loading code, in some places we make the
incorrect assumption that info->ram_size can be treated as the
address of the end of RAM, as for instance when we calculate the
available space for the initrd using "info->ram_size - info->initrd_start".
This is wrong, because many Arm boards (including "virt") specify
a non-zero info->loader_start to indicate that their RAM area
starts at a non-zero physical address.

Correct the places which make this incorrect assumption.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/boot.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index a830655e1af..0bb9a7d5b5c 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -976,6 +976,7 @@ static void arm_setup_direct_kernel_boot(ARMCPU *cpu,
     int elf_machine;
     hwaddr entry;
     static const ARMInsnFixup *primary_loader;
+    uint64_t ram_end = info->loader_start + info->ram_size;
 
     if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
         primary_loader = bootloader_aarch64;
@@ -1047,8 +1048,7 @@ static void arm_setup_direct_kernel_boot(ARMCPU *cpu,
         /* 32-bit ARM */
         entry = info->loader_start + KERNEL_LOAD_ADDR;
         kernel_size = load_image_targphys_as(info->kernel_filename, entry,
-                                             info->ram_size - KERNEL_LOAD_ADDR,
-                                             as);
+                                             ram_end - KERNEL_LOAD_ADDR, as);
         is_linux = 1;
     }
     if (kernel_size < 0) {
@@ -1062,12 +1062,11 @@ static void arm_setup_direct_kernel_boot(ARMCPU *cpu,
         if (info->initrd_filename) {
             initrd_size = load_ramdisk_as(info->initrd_filename,
                                           info->initrd_start,
-                                          info->ram_size - info->initrd_start,
-                                          as);
+                                          ram_end - info->initrd_start, as);
             if (initrd_size < 0) {
                 initrd_size = load_image_targphys_as(info->initrd_filename,
                                                      info->initrd_start,
-                                                     info->ram_size -
+                                                     ram_end -
                                                      info->initrd_start,
                                                      as);
             }
-- 
2.20.1

