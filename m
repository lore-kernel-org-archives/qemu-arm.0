Received: by 2002:a17:504:959a:b0:1be9:327d:8ee3 with SMTP id e26csp1452093njl;
        Thu, 3 Oct 2024 06:54:02 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW+mguQrp76K5XvDATuSk6nB9O/f7MJBPyLW26i9xXaywTpu6+noawfUvamY4TUAyOxrTfnF2SL43IOYA==@linaro.org
X-Google-Smtp-Source: AGHT+IENzQG1u/IleIzaJS4mbtPTfez57OFjPSriBDX5I2cJ7feSWLXo1GLmJNk1Ucp9fXAzSnQz
X-Received: by 2002:a05:622a:1313:b0:458:2756:fdb with SMTP id d75a77b69052e-45d804e561dmr102501751cf.29.1727963641878;
        Thu, 03 Oct 2024 06:54:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1727963641; cv=none;
        d=google.com; s=arc-20240605;
        b=ljZQ3RkoU3HKIJ4quT86jxX9SEXG5z4wDZRr29hGmtawHEsh2a8zIyyxRTvPB0R2+d
         Fd4OFhkmsB0exiBK5QyVXgXjRD7ZMi5N5jjzSocvHYcWS/T2rLVO5vHQcEu/wG8mGPT0
         qINsRMSL9vcscpfcb9kvh+vbErnbfiEWrVefmlzWpCrrCgiJ1HH6rioWLyrXaZ6ER23c
         dIWZ+mm90KwYL8Yvah+8e6pkfEuaWQojeles3PgIUrzRhBsN6RT/cUt2QEgPoFjpsFh9
         RQu4cHSQecn3VExnOKhu5KHGuz18AuiLt93guLmYe59ME8jFORqEV7zlPfXqkG09hkqm
         z51A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=Y21cd3Mlo1rSCOVF7OXO2uYDEWo70U3Lo9wLvPMq9f4=;
        fh=YHagO+DpjeaKnF7fEO4uu0Vr2xMkjJeY6q4PFvjfBiE=;
        b=HWJQmQk0jfckl+7KSCd37uoKvSSVo+nPQbfBywLATy0MArtcEY5+1iDMNExSFBkD69
         po9gqY6ZRB8e0X2OfJJjgYDHgjWuolq02jZdBJUawt6hUxrU4Qfz1GDOfUPoLZUcnmCj
         aVAqvRDptNWfGuF0Uyl9v/Qaff/xUccDyTzN7ekpwm/wFKZBaAichA2jOM/nIe87jVSv
         OIc9YpJOk8GRrqcmvZoWB3DlRNSiNQT6nS/4LazhqiEfy4hJ7hOgfXgTo81n+QT9VMhS
         P9B8+bA4Ws1PbiiurArXghp8nbwYU58EtiEc/5PP5PviWUzdmTeH4ZyeH7VEeLKctbQ2
         k7iQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=txncFebg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-45d956f8b66si9006211cf.567.2024.10.03.06.54.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Oct 2024 06:54:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=txncFebg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1swMGo-0002FT-Fp; Thu, 03 Oct 2024 09:53:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1swMGm-0002F5-Uk
 for qemu-arm@nongnu.org; Thu, 03 Oct 2024 09:53:29 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1swMGl-0001O9-4n
 for qemu-arm@nongnu.org; Thu, 03 Oct 2024 09:53:28 -0400
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-37cd0b5515fso637715f8f.2
 for <qemu-arm@nongnu.org>; Thu, 03 Oct 2024 06:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727963605; x=1728568405; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Y21cd3Mlo1rSCOVF7OXO2uYDEWo70U3Lo9wLvPMq9f4=;
 b=txncFebg1qj+oesfbUlI0JoYhm0n5B4gjSdzdsK94OYpfeKX+KYHBwLAs0/5c0nV67
 wRdP8iySPCG7CeTINf5drHTZGJV9KLgao98+lOHI7jRoMycMIZ/4I6nfqlkNZVlWDNVC
 Pxn0sakdu98GuEj0KuVHCBm6DxGWWf1Hw3OeiO6sPtZHbSb5BcP8GGP6HCIgLLtnUewH
 03m5G2gScPJPUYw/n5xsDoG83Yo9+jzApP9ok5dh3d24Z3o0M/Pi+WM4QncA2RGsrbb9
 JbTCYwrCiNm47tMRF/ZZqblCaUSt+vUDDikc2z7fDTwahrn3y/x0C3wl3cH05bj/TiVG
 26OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727963605; x=1728568405;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Y21cd3Mlo1rSCOVF7OXO2uYDEWo70U3Lo9wLvPMq9f4=;
 b=MBuhw4iGbtiaj349SzpPfSgcOJZnH1JsQ168zk5mf2v66h7ivFvjq3mIoUJfjPyqyq
 y2WZdPNCbLoS5mqrrdtGlxlC594epVXNmqW9Q3wBaK3R9zmodT1o9VmUs6V/qDAlfgky
 8+AlBO/um3MmQs6EI4nuWYTd14gEfF57sdwa2j/fBLfoVGkbtxigdVZEMA4YAO9iSCxK
 LqRmbgc6+6CFKPDR6t+w3TAkRPHt402+96+i0n8Yx3P/QTBaHdqGzObmwZmfAdML3uFL
 TSJYgStFdXB8F3yBlkufPFgJ8h8myVSbeRWIPv8C+m2RCiEPalpn/9jhh5ePthb675pj
 wl3g==
X-Gm-Message-State: AOJu0Yw3Kif8pS71uxCZUW4bQTf4r9ZA+hvKwIX4ak6zeAhm8lfXfFub
 tKEP0pzihW1YIzyzZapoWXC4YOOXfsCvERL92NfzncMyucJOtz2HzvzHcmTKY0eq6hQLLU7HgRb
 /
X-Received: by 2002:a05:6000:18a6:b0:36b:bb84:33e2 with SMTP id
 ffacd0b85a97d-37cfb9f9d0fmr4570817f8f.37.1727963605227; 
 Thu, 03 Oct 2024 06:53:25 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42f79ead8d8sm45285905e9.19.2024.10.03.06.53.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Oct 2024 06:53:24 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH] hw/intc/omap_intc: Remove now-unnecessary abstract base class
Date: Thu,  3 Oct 2024 14:53:23 +0100
Message-Id: <20241003135323.1653230-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: 3k3U8kYEXsDk

The OMAP interrupt controller code used to have an omap-intc
class and an omap2-intc class, which shared common code via
the abstract class common-omap-intc. Now we have deleted
omap2-intc, we don't need the separate abstract base class;
fold int into omap-intc.

Suggested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/omap.h |  2 +-
 hw/intc/omap_intc.c   | 13 +++----------
 2 files changed, 4 insertions(+), 11 deletions(-)

diff --git a/include/hw/arm/omap.h b/include/hw/arm/omap.h
index cf5f0219a2f..4d28f391fb4 100644
--- a/include/hw/arm/omap.h
+++ b/include/hw/arm/omap.h
@@ -59,7 +59,7 @@ int64_t omap_clk_getrate(omap_clk clk);
 void omap_clk_reparent(omap_clk clk, omap_clk parent);
 
 /* omap_intc.c */
-#define TYPE_OMAP_INTC "common-omap-intc"
+#define TYPE_OMAP_INTC "omap-intc"
 typedef struct OMAPIntcState OMAPIntcState;
 DECLARE_INSTANCE_CHECKER(OMAPIntcState, OMAP_INTC, TYPE_OMAP_INTC)
 
diff --git a/hw/intc/omap_intc.c b/hw/intc/omap_intc.c
index a48e6fcd6d3..a98358d92e2 100644
--- a/hw/intc/omap_intc.c
+++ b/hw/intc/omap_intc.c
@@ -392,22 +392,15 @@ static void omap_intc_class_init(ObjectClass *klass, void *data)
 }
 
 static const TypeInfo omap_intc_info = {
-    .name          = "omap-intc",
-    .parent        = TYPE_OMAP_INTC,
+    .name          = TYPE_OMAP_INTC,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(OMAPIntcState),
     .instance_init = omap_intc_init,
     .class_init    = omap_intc_class_init,
 };
 
-static const TypeInfo omap_intc_type_info = {
-    .name          = TYPE_OMAP_INTC,
-    .parent        = TYPE_SYS_BUS_DEVICE,
-    .instance_size = sizeof(OMAPIntcState),
-    .abstract      = true,
-};
-
 static void omap_intc_register_types(void)
 {
-    type_register_static(&omap_intc_type_info);
     type_register_static(&omap_intc_info);
 }
 
-- 
2.34.1

