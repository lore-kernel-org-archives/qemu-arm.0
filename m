Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp150250lfo;
        Thu, 28 Jan 2021 03:51:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyndexqwuTvgTVdq3ZGGjMEO2qSsd0WfhEN88NnrErif1VoGL1u8Z72scJOMLSulcmvIbJq
X-Received: by 2002:a25:1086:: with SMTP id 128mr22765373ybq.375.1611834683833;
        Thu, 28 Jan 2021 03:51:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611834683; cv=none;
        d=google.com; s=arc-20160816;
        b=KytpPAkDJgIiL8dMvH38CxovH4iNpwxQaqLYIcqZU9HVehWnR/zmosXLjtJw4XckIC
         iyaAa3OHYaHwpaMD787nLkSD27fQnVXzxK5S/Z11a+tTPD/M0a55BYKa4yWAIQYtI/RJ
         ubVzjD7fU3Z99NmGVpqKqEecBVbsNetKz6uy+mmV/Uch98e/Zk4AUjseDxREv++9e5qd
         TwPTp9N+EO+fHDZ7Gf1wVUnUTM7Z2t4gJK2qK/C+r5DaQSfJtywRUEnL2DenUwsLS855
         E6BTd25GkUUx38PMV8/w/AlOKem24ZIXW+oB9rvZa5nL78J7IkXhHCdcjJ5P99pW5Gwf
         MxmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=dejnN+1TE+bIdVsXEIIkkiDTxwZNugqOzXyFunr0NOY=;
        b=ZDx4RXKyPtD42Xt23TOJiZ8uBMMQvzFIlfKK17HmKer5y3Bcz0yutYOP3irWx6qdhl
         p3tQjO4omNBxtCxawR/Zv3Y34q7XKJpAOakmkBdComzDDvCvXKfM/pgG4yCfFc+Mfy39
         4jf4c0h7her48JyI3c2A6itHYqXE1cvXCdkuqsZ8WIDP1zPje4tWwclLejs9nkeIGELF
         Q61qLo+Na1spYnuPm/aP+fL0eDj6ScOGI1edK404r0TkXKyz3Q3oM3eEAlHh3ZcgmXWt
         qJ31mpTfMEZjHKPHN9U9oGUIkzlg+F16YM981lVcK2UJf5JHXoV3kpOfnNrALPuROx3e
         8N0Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dpZlRgzd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g7si4911550ybi.440.2021.01.28.03.51.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Jan 2021 03:51:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dpZlRgzd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l55pa-0005r5-Sj
	for alex.bennee@linaro.org; Thu, 28 Jan 2021 06:51:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l55gs-0001is-7l
 for qemu-arm@nongnu.org; Thu, 28 Jan 2021 06:42:22 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:36649)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l55gh-0006E7-Sn
 for qemu-arm@nongnu.org; Thu, 28 Jan 2021 06:42:21 -0500
Received: by mail-wm1-x332.google.com with SMTP id i9so4317269wmq.1
 for <qemu-arm@nongnu.org>; Thu, 28 Jan 2021 03:42:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dejnN+1TE+bIdVsXEIIkkiDTxwZNugqOzXyFunr0NOY=;
 b=dpZlRgzdCo/g1pxVEUJCNQOzV46NEadFGZUmVYhIW9hAFmvKTKQcU94WQwsKytPdbh
 qUxi0VyHrjNdnEUJPrQ4m/oDQtNJmMFwKZsqMU/vnyCbEwBCfcAh9uqA7/kkgaHxItws
 +WVIge7vcM1La+a4gAzsoiVsDXhodDikSZXOsza+JvOU4+RHfbC1ZvyPh5aCZwMhXLMD
 83NMYS1hers4buC3QL1l9qZ78zGIdecZu165rl2AklfMF/Nneaabt3wEzNKXXdfGJz8v
 KEqUYr/VMwpuRPzIXkIS0VrtSEky6Bpl5RyMgwxAFpTNdCsC2PqVwFkktSZjqMNR1o/Y
 Vlrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dejnN+1TE+bIdVsXEIIkkiDTxwZNugqOzXyFunr0NOY=;
 b=fRqLtoJ7R++Cw79H/N5qlHB8WLyWVffMEPvTNbELZGtpo1G4oKG276hiws18BAZGnh
 b2ZEzh+FSgAfQfTcx41SkmT6J43H7J3kNtJZlufoidKAUdgHgi/yUs7jsDjrYdx2vyyQ
 A3s7aqjbSxKfSkDrGgnW9+Xe54GKv5/QzBIi8P5PEBMxLs0Wr2I2cjNl9TDxwFE/4IQe
 PG/ueHR9NV02Maq6Lvy3W3MFnsyaHvEa6z6FCtH+3EkZUvx6seQ3iJR0tFmzzmcuCXPB
 Mr9I3RMZseRObJyFlIEVbWRHc/R5qF8pSPlbzXggFYmFw7U0Mb2e8Ry+oe3wW/96JXG9
 gj2A==
X-Gm-Message-State: AOAM531whldhx+oWx94By/6tIUq31HUruD+nKgRpZAUZg019jALRqK3y
 3Bp8xLH7iSn0MwUPIvVf+MDLXv2+mOdjUQ==
X-Received: by 2002:a7b:c08f:: with SMTP id r15mr8407531wmh.22.1611834129473; 
 Thu, 28 Jan 2021 03:42:09 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q9sm6431033wme.18.2021.01.28.03.42.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 03:42:08 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 22/25] hw/arm/armsse: Use Clock to set system_clock_scale
Date: Thu, 28 Jan 2021 11:41:42 +0000
Message-Id: <20210128114145.20536-23-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210128114145.20536-1-peter.maydell@linaro.org>
References: <20210128114145.20536-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Luc Michel <luc@lmichel.fr>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KwJ027Nf+8eA

Use the MAINCLK Clock input to set the system_clock_scale variable
rather than using the mainclk_frq property.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20210121190622.22000-23-peter.maydell@linaro.org
---
v1->v2: wire armsse_mainclk_update() up as the Clock callback
---
 hw/arm/armsse.c | 24 +++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/hw/arm/armsse.c b/hw/arm/armsse.c
index 4349ce9bfdb..9a6b24c79aa 100644
--- a/hw/arm/armsse.c
+++ b/hw/arm/armsse.c
@@ -232,6 +232,16 @@ static void armsse_forward_sec_resp_cfg(ARMSSE *s)
     qdev_connect_gpio_out(dev_splitter, 2, s->sec_resp_cfg_in);
 }
 
+static void armsse_mainclk_update(void *opaque)
+{
+    ARMSSE *s = ARM_SSE(opaque);
+    /*
+     * Set system_clock_scale from our Clock input; this is what
+     * controls the tick rate of the CPU SysTick timer.
+     */
+    system_clock_scale = clock_ticks_to_ns(s->mainclk, 1);
+}
+
 static void armsse_init(Object *obj)
 {
     ARMSSE *s = ARM_SSE(obj);
@@ -242,7 +252,8 @@ static void armsse_init(Object *obj)
     assert(info->sram_banks <= MAX_SRAM_BANKS);
     assert(info->num_cpus <= SSE_MAX_CPUS);
 
-    s->mainclk = qdev_init_clock_in(DEVICE(s), "MAINCLK", NULL, NULL);
+    s->mainclk = qdev_init_clock_in(DEVICE(s), "MAINCLK",
+                                    armsse_mainclk_update, s);
     s->s32kclk = qdev_init_clock_in(DEVICE(s), "S32KCLK", NULL, NULL);
 
     memory_region_init(&s->container, obj, "armsse-container", UINT64_MAX);
@@ -451,9 +462,11 @@ static void armsse_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    if (!s->mainclk_frq) {
-        error_setg(errp, "MAINCLK_FRQ property was not set");
-        return;
+    if (!clock_has_source(s->mainclk)) {
+        error_setg(errp, "MAINCLK clock was not connected");
+    }
+    if (!clock_has_source(s->s32kclk)) {
+        error_setg(errp, "S32KCLK clock was not connected");
     }
 
     assert(info->num_cpus <= SSE_MAX_CPUS);
@@ -1115,7 +1128,8 @@ static void armsse_realize(DeviceState *dev, Error **errp)
      */
     sysbus_init_mmio(SYS_BUS_DEVICE(s), &s->container);
 
-    system_clock_scale = NANOSECONDS_PER_SECOND / s->mainclk_frq;
+    /* Set initial system_clock_scale from MAINCLK */
+    armsse_mainclk_update(s);
 }
 
 static void armsse_idau_check(IDAUInterface *ii, uint32_t address,
-- 
2.20.1

