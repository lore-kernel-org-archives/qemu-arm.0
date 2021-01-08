Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp751137lfq;
        Fri, 8 Jan 2021 11:12:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwShMBQRajNhBFmbXjWRBJ140cF3Uq/ytuGCvos5qz8Xhzp+1RATXVOJb4kCYU3Bx6VRnyL
X-Received: by 2002:a25:874c:: with SMTP id e12mr6719669ybn.143.1610133141878;
        Fri, 08 Jan 2021 11:12:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610133141; cv=none;
        d=google.com; s=arc-20160816;
        b=ZHig8Bg6nQZpaky/OJXpNQ9EaX/EK0iBCj1MZsW4C2W1/woYY0BaQDOdWK+FYwT+kj
         ReN3yi5F92LAFZguJUb2/k/BMJTfwOGgo8nlyDJkje0fzD+zvW1DVTTbgyYVk2Hmys87
         BCUNrBHiVP7f+ZfSMl2oOAVRuOsa1Eci3SjULcktKMHCvTLZeMFaRSSFEIHnrJPPOpIJ
         1YQPwsw2C1g8lFFRLwqMpzMubc9El7bKcoDwghfzezjf73JE6XdxFpdWGOEW6XUetgCn
         0VDzLSK9b2760/r51IgGkoPcsZAZ1a6JxTfco6689obcwbTbrVaa1qeLenqEQeLo3pp2
         zkig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=from:reply-to:sender:errors-to:cc:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:to
         :subject:references:mime-version:message-id:in-reply-to:date
         :dkim-signature;
        bh=hNm0ut2O+1mIOJ9J+86PhKTX0lwSI4vyPoH9VqTzsXI=;
        b=I2+xz9X0rcmzbJ6Wm7S+VA2nWF6J403JB/aglVZlTyf4Dox+c16bcTdySnqm5pX1+C
         voTv9kxlGg9CrFweNlSjAoJ9yw/GHSanfD7CTzOG1wTukwm6NtiqUl6IpBUp3sYPfc80
         1TCnp8CPAiLjZuVXmoJkR34tnkaXZEXs4YFE1rxPiOX8Z9YiwTAuyuQ/HV8B3Y2BIKAk
         doV73nB8kl8dHgK3E0c6V6Yu10oNTIFT4NUygQMWerwM9s8Qp12krCTZVNaKel4Ia1zb
         4DXx/pciO6aX7Bxu9Xk4qBnfQ95XbV6ypYU6XXz3FsYW3r/E+e7aIfROBgQUuIRkE5tQ
         07wQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@google.com header.s=20161025 header.b=VfBXqzEC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n4si11172491ybc.282.2021.01.08.11.12.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Jan 2021 11:12:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@google.com header.s=20161025 header.b=VfBXqzEC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1]:48458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kxxBN-0002KP-9Y
	for alex.bennee@linaro.org; Fri, 08 Jan 2021 14:12:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3Ka74XwgKCG4igTMafeTSaaSXQ.OaYcQYg-MdYZaZSZg.adS@flex--wuhaotsh.bounces.google.com>)
 id 1kxx9j-00019S-Dt
 for qemu-arm@nongnu.org; Fri, 08 Jan 2021 14:10:40 -0500
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449]:35498)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3Ka74XwgKCG4igTMafeTSaaSXQ.OaYcQYg-MdYZaZSZg.adS@flex--wuhaotsh.bounces.google.com>)
 id 1kxx9f-0007MU-H7
 for qemu-arm@nongnu.org; Fri, 08 Jan 2021 14:10:39 -0500
Received: by mail-pf1-x449.google.com with SMTP id k13so7209831pfc.2
 for <qemu-arm@nongnu.org>; Fri, 08 Jan 2021 11:10:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=hNm0ut2O+1mIOJ9J+86PhKTX0lwSI4vyPoH9VqTzsXI=;
 b=VfBXqzECNGvBewlj3It9ry2PgO5f0nywYkp74DWkdaQtCaptakXmNFarrXlSu3TaCL
 J3mCIqNUT4/1sU4Ppm3+kopykDmEtn2UkE6sDLujaDEJCtRI3sr6ouxNvExVHpCpB1EK
 3WMNBoLVj2afTYTTjFzAIr/Rj4BTI7Z8KabH5i6syzCiFS50Q1hu4d11RRn898N9bxRJ
 XFY9I7hCV5AEPax3RC7yH5qW1pG4K81Lfs6DdQl9F4UoVu7ECwkwaXAX3X1OmVh/7ZTF
 tgQ8BnSByfYHVWTIURpw9LGzteZqul35vxkvdbuEZxOoMRxJNIi7XrkEcwm0wzev04Ur
 VjRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=hNm0ut2O+1mIOJ9J+86PhKTX0lwSI4vyPoH9VqTzsXI=;
 b=N/ShHoiPVHskpkJfl/Wo+vMl1xb8kEl4rQes8q5cbJKrHWKon3l2zlTs4NJ7gBODpb
 GgNzma53YMidrJ78dCiVd5p8SdO+mPxnX+svgJCZV8hgmMAzu5RGmfVyWTyTFgesRF0m
 nBR80okcdQ0ftUWSoP8AhKeErzAUSVYBkfoi0W9imXBKODxSQVQL9yOhYlKheli5hy5w
 WEbssTE39gdX81JQiSOIhoFtuydjaYxfFD2nvngg9LSp03PvbgXn90d0ZugBEAcJrJwu
 1cx695GcDoKWw0UaalybTd07lWNTmjz8+IOwTquD0PSGLDL1f/5RteX04mJ7Ozb4MfZL
 laOQ==
X-Gm-Message-State: AOAM533+MhVO4ak/GL1ZDPTzo60TE5Sc0i2YAEZG3FVryzxjDvtdwB33
 uazhTBnUiUAf8Mk1+zPgZ3AWZN0K824iPg==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:10:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a17:90a:a485:: with SMTP id
 z5mr5279205pjp.160.1610133033191; Fri, 08 Jan 2021 11:10:33 -0800 (PST)
Date: Fri,  8 Jan 2021 11:09:45 -0800
In-Reply-To: <20210108190945.949196-1-wuhaotsh@google.com>
Message-Id: <20210108190945.949196-7-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20210108190945.949196-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.29.2.729.g45daf8777d-goog
Subject: [PATCH v5 6/6] hw/*: Use type casting for SysBusDevice in NPCM7XX
To: peter.maydell@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::449;
 envelope-from=3Ka74XwgKCG4igTMafeTSaaSXQ.OaYcQYg-MdYZaZSZg.adS@flex--wuhaotsh.bounces.google.com;
 helo=mail-pf1-x449.google.com
X-Spam_score_int: -99
X-Spam_score: -10.0
X-Spam_bar: ----------
X-Spam_report: (-10.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.386,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
Cc: minyard@acm.org, venture@google.com, qemu-devel@nongnu.org,
 hskinnemoen@google.com, wuhaotsh@google.com, kfting@nuvoton.com,
 qemu-arm@nongnu.org, Avi.Fishman@nuvoton.com, f4bug@amsat.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Reply-to: Hao Wu <wuhaotsh@google.com>
From: Hao Wu via <qemu-arm@nongnu.org>
X-TUID: GkUhuyc5RhKU

A device shouldn't access its parent object which is QOM internal.
Instead it should use type cast for this purporse. This patch fixes this
issue for all NPCM7XX Devices.

Signed-off-by: Hao Wu <wuhaotsh@google.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/npcm7xx_boards.c | 2 +-
 hw/mem/npcm7xx_mc.c     | 2 +-
 hw/misc/npcm7xx_clk.c   | 2 +-
 hw/misc/npcm7xx_gcr.c   | 2 +-
 hw/misc/npcm7xx_rng.c   | 2 +-
 hw/nvram/npcm7xx_otp.c  | 2 +-
 hw/ssi/npcm7xx_fiu.c    | 2 +-
 7 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/hw/arm/npcm7xx_boards.c b/hw/arm/npcm7xx_boards.c
index 306260fa67..3fdd5cab01 100644
--- a/hw/arm/npcm7xx_boards.c
+++ b/hw/arm/npcm7xx_boards.c
@@ -82,7 +82,7 @@ static NPCM7xxState *npcm7xx_create_soc(MachineState *machine,
                                         uint32_t hw_straps)
 {
     NPCM7xxMachineClass *nmc = NPCM7XX_MACHINE_GET_CLASS(machine);
-    MachineClass *mc = &nmc->parent;
+    MachineClass *mc = MACHINE_CLASS(nmc);
     Object *obj;
 
     if (strcmp(machine->cpu_type, mc->default_cpu_type) != 0) {
diff --git a/hw/mem/npcm7xx_mc.c b/hw/mem/npcm7xx_mc.c
index 0435d06ab4..abc5af5620 100644
--- a/hw/mem/npcm7xx_mc.c
+++ b/hw/mem/npcm7xx_mc.c
@@ -62,7 +62,7 @@ static void npcm7xx_mc_realize(DeviceState *dev, Error **errp)
 
     memory_region_init_io(&s->mmio, OBJECT(s), &npcm7xx_mc_ops, s, "regs",
                           NPCM7XX_MC_REGS_SIZE);
-    sysbus_init_mmio(&s->parent, &s->mmio);
+    sysbus_init_mmio(SYS_BUS_DEVICE(s), &s->mmio);
 }
 
 static void npcm7xx_mc_class_init(ObjectClass *klass, void *data)
diff --git a/hw/misc/npcm7xx_clk.c b/hw/misc/npcm7xx_clk.c
index 48bc9bdda5..0bcae9ce95 100644
--- a/hw/misc/npcm7xx_clk.c
+++ b/hw/misc/npcm7xx_clk.c
@@ -913,7 +913,7 @@ static void npcm7xx_clk_init(Object *obj)
 
     memory_region_init_io(&s->iomem, obj, &npcm7xx_clk_ops, s,
                           TYPE_NPCM7XX_CLK, 4 * KiB);
-    sysbus_init_mmio(&s->parent, &s->iomem);
+    sysbus_init_mmio(SYS_BUS_DEVICE(s), &s->iomem);
 }
 
 static int npcm7xx_clk_post_load(void *opaque, int version_id)
diff --git a/hw/misc/npcm7xx_gcr.c b/hw/misc/npcm7xx_gcr.c
index 745f690809..eace9e1967 100644
--- a/hw/misc/npcm7xx_gcr.c
+++ b/hw/misc/npcm7xx_gcr.c
@@ -220,7 +220,7 @@ static void npcm7xx_gcr_init(Object *obj)
 
     memory_region_init_io(&s->iomem, obj, &npcm7xx_gcr_ops, s,
                           TYPE_NPCM7XX_GCR, 4 * KiB);
-    sysbus_init_mmio(&s->parent, &s->iomem);
+    sysbus_init_mmio(SYS_BUS_DEVICE(s), &s->iomem);
 }
 
 static const VMStateDescription vmstate_npcm7xx_gcr = {
diff --git a/hw/misc/npcm7xx_rng.c b/hw/misc/npcm7xx_rng.c
index f650f3401f..b01df7cdb2 100644
--- a/hw/misc/npcm7xx_rng.c
+++ b/hw/misc/npcm7xx_rng.c
@@ -143,7 +143,7 @@ static void npcm7xx_rng_init(Object *obj)
 
     memory_region_init_io(&s->iomem, obj, &npcm7xx_rng_ops, s, "regs",
                           NPCM7XX_RNG_REGS_SIZE);
-    sysbus_init_mmio(&s->parent, &s->iomem);
+    sysbus_init_mmio(SYS_BUS_DEVICE(s), &s->iomem);
 }
 
 static const VMStateDescription vmstate_npcm7xx_rng = {
diff --git a/hw/nvram/npcm7xx_otp.c b/hw/nvram/npcm7xx_otp.c
index b16ca530ba..c61f2fc1aa 100644
--- a/hw/nvram/npcm7xx_otp.c
+++ b/hw/nvram/npcm7xx_otp.c
@@ -371,7 +371,7 @@ static void npcm7xx_otp_realize(DeviceState *dev, Error **errp)
 {
     NPCM7xxOTPClass *oc = NPCM7XX_OTP_GET_CLASS(dev);
     NPCM7xxOTPState *s = NPCM7XX_OTP(dev);
-    SysBusDevice *sbd = &s->parent;
+    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
 
     memset(s->array, 0, sizeof(s->array));
 
diff --git a/hw/ssi/npcm7xx_fiu.c b/hw/ssi/npcm7xx_fiu.c
index 5040132b07..4eedb2927e 100644
--- a/hw/ssi/npcm7xx_fiu.c
+++ b/hw/ssi/npcm7xx_fiu.c
@@ -498,7 +498,7 @@ static void npcm7xx_fiu_hold_reset(Object *obj)
 static void npcm7xx_fiu_realize(DeviceState *dev, Error **errp)
 {
     NPCM7xxFIUState *s = NPCM7XX_FIU(dev);
-    SysBusDevice *sbd = &s->parent;
+    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
     int i;
 
     if (s->cs_count <= 0) {
-- 
2.29.2.729.g45daf8777d-goog

