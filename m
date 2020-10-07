Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp268799lfq;
        Wed, 7 Oct 2020 03:11:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyPD6Dp1D4BeVvYmn8kyYQKhe4qAgTQfRKQan0Cl4wyYF+8yQH+zTorRhka59rnISUq+mib
X-Received: by 2002:a25:d795:: with SMTP id o143mr3152168ybg.440.1602065505252;
        Wed, 07 Oct 2020 03:11:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602065505; cv=none;
        d=google.com; s=arc-20160816;
        b=0jdN38g5KWYrZUG1FnP6+HVEla/drm0INrp6hprCpLatu8JsWRIjzpOBDLjSLk1+PP
         ttgIL+YBGfZRs4Tx+peQOxsClJMe3U9vg81Q/QydsYD0JIxDVEiozc9I5/qPqOm307L4
         YzSAJGVDbmdaAnSLGMmbBu9dx/lk+pcm//i+a6HqnsK0LM19MwxSvt5WahiwFn+3b0Mm
         LoewmDQp8Yd2RKUO3JlAp5GRpLl1XlRU9CpUs/i5PUvGf2eoP5zfOoRQIHzIJSi8dgpT
         BLMIiYoiWlx1QuDRJevg/dXT2VbnmKsjUU+wENpeA9HPurSDnU6j9dr5ALIIrMdm6IwH
         paRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=YihA7yp+FeuvnOD+ItdPRKyM2WwnF/945pTZ2qmhEKM=;
        b=GRp/94/G3N4ovTUbKoSCH0378G2oa/YAotRxkL+fXTsvdG8QQjZa94m2QoYhVuUv56
         l5B6xfdPao8g5Uhx69dSwHxnNhw6NzUQ3bONea13G1ul3h3XvRlRZaZDXjcFeysR0mnB
         uONAPZ83Aw64fIQSLvg+4ZUEncJhV9ccDjMTPiZq+IyjR0h1c35CFRpTaMRgK8QiadRg
         c2wTzDJwwQx2iegeNTURO+P2VqDWpcEGORgN8TVSgweZjOdsuRYXOk/oNINpeijxeGfI
         Z94Pe+Rgs8DO0xDOR4Bngnq6sjAdo0uMl7rSrq2wjmIJKQjYpGw1iZsOUJIxlCRAZsLV
         dt6A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=QGY03Oiv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t5si1511106ybf.296.2020.10.07.03.11.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Oct 2020 03:11:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=QGY03Oiv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:49112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kQ6QC-0000HR-Kz
	for alex.bennee@linaro.org; Wed, 07 Oct 2020 06:11:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <graeme@nuviainc.com>)
 id 1kQ6MV-0005TY-AQ
 for qemu-arm@nongnu.org; Wed, 07 Oct 2020 06:07:55 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:51195)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <graeme@nuviainc.com>)
 id 1kQ6MS-0004UY-Np
 for qemu-arm@nongnu.org; Wed, 07 Oct 2020 06:07:54 -0400
Received: by mail-wm1-x341.google.com with SMTP id 13so1689734wmf.0
 for <qemu-arm@nongnu.org>; Wed, 07 Oct 2020 03:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YihA7yp+FeuvnOD+ItdPRKyM2WwnF/945pTZ2qmhEKM=;
 b=QGY03OiviP3VO8EJ6Vrq0gX9uVLmo3GVKeYMImS2UtdssGZGUlh1kFYF/PN+2+McO0
 XBZYCSVIlY7HACV9cyVv7jSrBeFq3qtoUP+pKU29J7+PQujinyZnFImVM+pIVBz+ltE3
 Yqtd08BgIA2/L+AyQtmRW2NcD3sC5mJ6i0hdjyhTypXen2B4HQUzGMDrMwjB42urnJMM
 3tTz0vcjp98ZfFFWFQ3YrAjNVjo5op7vhCZNjOa5Occwv6i1UIK+i3u/dp65VmIJO9IJ
 uhnoXDH87tksEm0r3w2AxMvucx5mnF7e0bw3M+aIK4FsuYemmGlqTwr6el1deyCM/9yg
 ksbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YihA7yp+FeuvnOD+ItdPRKyM2WwnF/945pTZ2qmhEKM=;
 b=DAwR1MTEvVXzs3HowBO+rcjjupKH/YmsHNqEdh9OtDnPG0DD4lIKFawOArUa26gFVw
 3YrCiO5bj8p88nMoj4lZ72JW3Yj9S8dR6G0XzB5Db5AnPzYsuYgMpGgnJ7sK2fJ0AvdW
 v2TZ47rZFqV7U8IWBrynglwRU+wGJUVZDhxtLRKzszVGA+oy2cqGJkanLsB/3eO2boBa
 y9IeftF+Wkc2J+Srm2RcAFsWwNo0VvVYBWr5hKmdgSnW9plHDhNd3DTS/zAEepE3k+Yw
 sb6rhTK//Gos0cldnc7fNl6fZMVGv8RN7Tv4GwKocIu6548gEMY+RxE4n+sAHTkkNWV0
 cFFA==
X-Gm-Message-State: AOAM532U8OestGID8tYsUaCmq7xCRpXrzD/fDZ/GxksSJUBCjKBJ+TWt
 ePDSf+iVKkEXQG+VNnbmB2rZ6fQESwUTIR9coO8f14Yxt7Bodz3OfU2aUtDk1MT8Lrjpjeldvh3
 GTHdYybw23Okloa/sSOnakxZ6ClfC6iL6mXPLA9frlOCF9scsYu8r0xedQkl91TkOEtOSEw==
X-Received: by 2002:a1c:b707:: with SMTP id h7mr2578043wmf.105.1602065270332; 
 Wed, 07 Oct 2020 03:07:50 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8010:64d6::1d89])
 by smtp.gmail.com with ESMTPSA id y6sm2208504wrt.80.2020.10.07.03.07.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Oct 2020 03:07:49 -0700 (PDT)
From: Graeme Gregory <graeme@nuviainc.com>
To: qemu-arm@nongnu.org
Subject: [PATCH v2 1/2] hw/arm/sbsa-ref : Fix SMMUv3 Initialisation
Date: Wed,  7 Oct 2020 11:07:31 +0100
Message-Id: <20201007100732.4103790-2-graeme@nuviainc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201007100732.4103790-1-graeme@nuviainc.com>
References: <20201007100732.4103790-1-graeme@nuviainc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::341;
 envelope-from=graeme@nuviainc.com; helo=mail-wm1-x341.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Graeme Gregory <graeme@nuviainc.com>, peter.maydell@linaro.org,
 rad@semihalf.com, f4bug@amsat.org, qemu-devel@nongnu.org, leif@nuviainc.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LRBG7bv4pi5/

SMMUv3 has an error in a previous patch where an i was transposed to a 1
meaning interrupts would not have been correctly assigned to the SMMUv3
instance.

Fixes: 48ba18e6d3f3 ("hw/arm/sbsa-ref: Simplify by moving the gic in the machine state")
Signed-off-by: Graeme Gregory <graeme@nuviainc.com>
---
 hw/arm/sbsa-ref.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index 9c3a893bed..65e64883b5 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -525,7 +525,7 @@ static void create_smmu(const SBSAMachineState *sms, PCIBus *bus)
     sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, base);
     for (i = 0; i < NUM_SMMU_IRQS; i++) {
         sysbus_connect_irq(SYS_BUS_DEVICE(dev), i,
-                           qdev_get_gpio_in(sms->gic, irq + 1));
+                           qdev_get_gpio_in(sms->gic, irq + i));
     }
 }
 
-- 
2.25.1

