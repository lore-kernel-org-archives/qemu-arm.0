Received: by 2002:a17:906:5615:b0:9d0:bf65:29fa with SMTP id f21csp1052875ejq;
        Fri, 10 Nov 2023 01:08:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE2zOoLPks8GYIm9sPnzHbo4hMGLm8mV+O6qWnMnE6wvG7+AGqfHhjkSNAbyaT9q6UIvNxZ
X-Received: by 2002:a05:622a:1b8e:b0:418:11ab:1bf7 with SMTP id bp14-20020a05622a1b8e00b0041811ab1bf7mr2628602qtb.30.1699607287549;
        Fri, 10 Nov 2023 01:08:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699607287; cv=none;
        d=google.com; s=arc-20160816;
        b=m2Q0n08aPgWjcbote9QrVENNhnqhdopG5hFU4IBd5E0THSDQ13l7vatD1srD6W0Ca/
         stsARrirO0yt5LPHNu71Lm3Wh4a+hNwASOeMDdrVtiz/0ReSdFu/vIzP8PvjkJPxaACf
         RYXgZlTTxR25MOnpmWs6nhlDwxpNfkGnuOq+QbEwRcgiOv9I2RYcfhJ0DpvgeIikNwcr
         6aEZFmgFUStIjsXrUwaYbUuLlL2OK5oOonwUxtarPMgBlYCuhb0q514Oeu/GsnLu+x0t
         2fMPKZ7clT1XMn+9bKSPFSbJ9py94z7FMfGw7iCPIQh6RKL737VsgVe02OK01nnsOIpj
         itsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=EzWAd4i8SfrnOVX1XV2s9b3+InPfyVDmDF/a6BICHBE=;
        fh=C2FsmRbQ7EWUl7lfPdfXyVHemm/cZPyko4K0Xw3sclA=;
        b=UNmeCRBIE9dEH7YoQcTTUDclUIr7/iVxv96zUJ1Pn03wwIk9Xj8o208bDOQe7Ss3RR
         lbLCj0cukRXg5AU9iCJcTS+EzFdzlTg0KwC8f0YuvgOUK+e/clSp6HVs+BrWSCC+L4DT
         9aSzvsYpuA3WvqCinwE576xgxxsYpI6S9vuvmDzmbi5nFJ/ZMRyJxz4JyoSjkXRS6xQC
         wr6vKCV74Jw79QOtM/4heobtI8G2hIgk0NaaRrpebnifIDmBJI/4rR/1dkhHEO6sQOye
         OwJbDo/ypel6rfhiHaVQ8w7/qRrTlKOr50+6EhmnDeM3dmExDG9t/HMbxSqKGDi+Cz3b
         lnng==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=elfKYo5s;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e21-20020a05622a111500b00419905d39ebsi4210256qty.205.2023.11.10.01.08.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 Nov 2023 01:08:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=elfKYo5s;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r1NUT-0005yX-Lr; Fri, 10 Nov 2023 04:07:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1r1NUS-0005yG-Pk
 for qemu-arm@nongnu.org; Fri, 10 Nov 2023 04:07:48 -0500
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1r1NUO-0000qz-0O
 for qemu-arm@nongnu.org; Fri, 10 Nov 2023 04:07:45 -0500
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2c523ac38fbso22756731fa.0
 for <qemu-arm@nongnu.org>; Fri, 10 Nov 2023 01:07:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699607261; x=1700212061; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=EzWAd4i8SfrnOVX1XV2s9b3+InPfyVDmDF/a6BICHBE=;
 b=elfKYo5sfA+dHJSFEjHuVknPtwRegB0+YWVERW8Sxiq9jw1f4D3+c4mbb+pcbOzhIi
 QA4aRI3tdlYQN5k7FrNsT2gwkQkclD9DuEwfRcf42BghRFDv6YqwbLTvNOcBTTTGl9Sh
 blmS/RPKzEdh9b5iDe2uXhK4Kd/XfIXi2mIpZsX/Rkvs79aFxN2igUW304KFzzkd4HJQ
 RDjqvMzOD1+PgKiu6kibZdr6ZL9vD2Kb8OiB4xQrFCx/Ow59WAOhs2rbclrLQE7eFNWT
 qc3Tf8bGgMmCobJ32wWIlDJMvXktGlr8qTpD6PzFoSEQdrIzSWGpyJddm+6OJwKSERxC
 74ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699607261; x=1700212061;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EzWAd4i8SfrnOVX1XV2s9b3+InPfyVDmDF/a6BICHBE=;
 b=V7G5r5eZlRh/zpLzEdw3z8tIOcFd5QFrIBoYdaPLE5S2JH7Ph14LoRFX4BpzuNsRVn
 NAn3ccdNkXpUlaWTlxsQZKaJXd5odJ4sivwh8fs+fIBtnWT2+5rLpkA0l9SsIiznt4AR
 6OA1dlamARnl+q2vHvIVOdvUJjJ1I5UBdAXnz66kHwW8OgKi8myWy6YiRj0mJ+HcDuMF
 S9d+2aa+jfEapkaNS7L0rW72cC845nECWNWjMPsXfBe6ojGQ0V8Dda1Q4W7C1yetU0J1
 5ugLmcnHbicA7aV8L2Ap+YQoHognPTLL5y6s5ivQ907xsauTd8mPgRBdXkUpiGU9pWIx
 RvhQ==
X-Gm-Message-State: AOJu0YyioUgEPwggOP1bzIO4A8fJyJ9cWTttqhYAYc+1rW81cDBKsn/c
 0B0u9AqU2Cb7gHc2F/QqHfd5Mg==
X-Received: by 2002:a2e:92d7:0:b0:2c5:1f57:1ef5 with SMTP id
 k23-20020a2e92d7000000b002c51f571ef5mr6588095ljh.39.1699607260695; 
 Fri, 10 Nov 2023 01:07:40 -0800 (PST)
Received: from localhost.localdomain ([2.221.137.100])
 by smtp.gmail.com with ESMTPSA id
 u8-20020a05600c138800b004075d5664basm4631372wmf.8.2023.11.10.01.07.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Nov 2023 01:07:40 -0800 (PST)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [PATCH] hw/arm/virt: fix GIC maintenance IRQ registration
Date: Fri, 10 Nov 2023 09:05:58 +0000
Message-ID: <20231110090557.3219206-2-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22f;
 envelope-from=jean-philippe@linaro.org; helo=mail-lj1-x22f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: TWHvH/VIMkr2

Since commit 9036e917f8 ("{include/}hw/arm: refactor virt PPI logic"),
GIC maintenance IRQ registration fails on arm64:

[    0.979743] kvm [1]: Cannot register interrupt 9

That commit re-defined VIRTUAL_PMU_IRQ to be a INTID but missed a case
where the maintenance IRQ is actually referred by its PPI index. Just
like commit fa68ecb330db ("hw/arm/virt: fix PMU IRQ registration"), use
INITID_TO_PPI(). A search of "GIC_FDT_IRQ_TYPE_PPI" indicates that there
shouldn't be more similar issues.

Fixes: 9036e917f8 ("{include/}hw/arm: refactor virt PPI logic")
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 hw/arm/virt.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 783d71a1b3..f5e685b060 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -591,7 +591,8 @@ static void fdt_add_gic_node(VirtMachineState *vms)
 
         if (vms->virt) {
             qemu_fdt_setprop_cells(ms->fdt, nodename, "interrupts",
-                                   GIC_FDT_IRQ_TYPE_PPI, ARCH_GIC_MAINT_IRQ,
+                                   GIC_FDT_IRQ_TYPE_PPI,
+                                   INTID_TO_PPI(ARCH_GIC_MAINT_IRQ),
                                    GIC_FDT_IRQ_FLAGS_LEVEL_HI);
         }
     } else {
@@ -615,7 +616,8 @@ static void fdt_add_gic_node(VirtMachineState *vms)
                                          2, vms->memmap[VIRT_GIC_VCPU].base,
                                          2, vms->memmap[VIRT_GIC_VCPU].size);
             qemu_fdt_setprop_cells(ms->fdt, nodename, "interrupts",
-                                   GIC_FDT_IRQ_TYPE_PPI, ARCH_GIC_MAINT_IRQ,
+                                   GIC_FDT_IRQ_TYPE_PPI,
+                                   INTID_TO_PPI(ARCH_GIC_MAINT_IRQ),
                                    GIC_FDT_IRQ_FLAGS_LEVEL_HI);
         }
     }
-- 
2.42.0

