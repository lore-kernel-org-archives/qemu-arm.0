Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp2955549njc;
        Tue, 25 Mar 2025 15:44:33 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUsKThoQiwPT9Wr4dMEvYfuIZiOPNZ4Fd7fvGcVq59LIYKhnJso2kkQ7ZrYNS6Xh8RJPJ0j97Kv0u+S8w==@linaro.org
X-Google-Smtp-Source: AGHT+IEdJgtOIQ7ERvXfTctNCACDvecldkWQfsyghRnEao6Z1Syk/Q6NZsNoEaKEoCqVcSFrhRus
X-Received: by 2002:a05:620a:450f:b0:7c5:65ab:4ff2 with SMTP id af79cd13be357-7c5ba1e9f9bmr2736160385a.46.1742942673130;
        Tue, 25 Mar 2025 15:44:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742942673; cv=none;
        d=google.com; s=arc-20240605;
        b=XMSEXYV5qPDiTCEwkurzSL9Es8JAHZrIPeFFqfQv+PiBq53nDXlcpF3VjlKSppAaj3
         E13cf2cwPKSTrEeQeCOMv5Im3kRMlwbpk4PAq9ok6/Gkd708vSS98uTzWs7NKlR7KI7z
         Jmq1G/bANE/0p2zH+djsKcWLEzf45YT4Sbrz7PB0Zn+hflmGt2t2i0m7HpphOM8mhX+3
         VB34xeq2NHUdfmcap9z+A23AmkK20d/Ppbwsk0HXl12PRRIjn6BeLxKMU6wqoZ5YyPi4
         3FMBBOQcFqeYsTQ6mbAMIYJCF3HxYZAIjYY4/XoBHbyms5F/w0iw5YciX5Olj/lKZy+O
         kERg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=osjmsBy4EAioOK42b1HcZjn9rcVF3JF4Z8bCs6awJ0A=;
        fh=/qng2qHFv1bmnoQRR/MHYaqmFC7M7pX7KjKgf8AEOvs=;
        b=l0BmqTCCctSnvYKc/Y6+r5vT0sLl0ouOw2ZSUSdj04xNA7WzkC/VY9q9tnudRz1A8Z
         M0VO7GdVbSK3NZpzw6zK7+6GR/7SsIo+dB25j1h090VrE6qTtIJQw5Vbdz4gNJZ9ytO3
         RIdFwVvn9gkyR7Ia0a9riemGab0QizagfqOmXOQEkNfjdU8In289qP8vX+4qHQHaX1s2
         WMC7EcRP6i/WUnkbF2nEEBjdXtFpS4lgAEVtZAWEmn9xXT7Eov2qOITwtXr8s+/go29G
         Zqt+xfLsSBslj0re5EuDFBtEjV+4dTNhR/kdfRmmTUDExULKD0gfPT+JpuIGeAfUKNNT
         U7NA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SxpPUkJx;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c5b9386fc8si1014429885a.643.2025.03.25.15.44.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Mar 2025 15:44:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SxpPUkJx;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1txD0G-0001TG-S5; Tue, 25 Mar 2025 18:44:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1txD07-00015H-6R
 for qemu-devel@nongnu.org; Tue, 25 Mar 2025 18:44:04 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1txD04-00070e-Ca
 for qemu-devel@nongnu.org; Tue, 25 Mar 2025 18:44:02 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-43cfba466b2so57277675e9.3
 for <qemu-devel@nongnu.org>; Tue, 25 Mar 2025 15:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1742942638; x=1743547438; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=osjmsBy4EAioOK42b1HcZjn9rcVF3JF4Z8bCs6awJ0A=;
 b=SxpPUkJx9/wRQBKFc2+0g8HU8v9b0enq/JdvA6PVWTPjDScC99ZqryxnOQxR+wJnRJ
 ynvIj/8ulJXN+6GAiY03kvAvsI0Be/m7/wbZh8EUps54f25Nt5TRrMzN4Yo+VJFWVbWX
 x9udBFfjI/LA9bz+KpEoXXO7a9xliMne/8wRWjNQ8hGAGTJM3sbf0qmaz8R3PXOJ51Gl
 +kZgVS5E7FPie9vq2VDQ02Ys/OjoifYNZb29VhwGFSw1WGbgBhBoCc/gZHYV64tmUmkx
 pMxHZruD6Q1Ntnm+rDnrl5FsvALIbGgLTup+TiiYRYmdIIZyhM6Xh8K0tGXJvroBUN4t
 PcyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742942638; x=1743547438;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=osjmsBy4EAioOK42b1HcZjn9rcVF3JF4Z8bCs6awJ0A=;
 b=JZ12xpk7fjjRMJbP2l55JvvrwzJk3xWXg2jDjTdXci8AXpgZny7Q9cuM0SneExppm6
 zJKBifJ/tX8+kq/cpf4GkOHIIJ9ADMKudU0KSEDrl71/GDWniwssLzT7x6RU9DtuMPm5
 QPKGJsb0sl1os8EUqNR0K3nAdgNFG2Vpy0PGxD0YOIFOJNLW5YVkF1OQX/JXhsxAfnEl
 YcgvDhaBUNn4OJ/aX+4WxEr0rxV6K5MjIKEO0kNwXFuXAUp1yzUQquBCYuC5pNDHS/qq
 c+51hRVD3VGl8wSNNtBEy00tJDxsdWORG41T4KqYMktAhGv9tVN5nQz1bY6/DyHDrk+6
 NhBQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUi+zGNMSItscNPlYL/v+ICRdFqVKu0LPaxiyMBTEJOAMA8eBkp94ZjMi5kog2ucZEq5hOf5fFik9RA@nongnu.org
X-Gm-Message-State: AOJu0YyJri5I09GYDASKmQm/FVef2noNogQUA4fTbMFYVN/0pw/BKyQc
 tqA3p6fq3oSejcJgm7o61XiM+fpgFBDVMNSYKCdrPP4Lv3NBUblGw1WA6lzASe0=
X-Gm-Gg: ASbGncune5ruJzTLTNo99h8i8/GmwzHawAdCTNK69x0/y0fNA9S8hbo7MkjSHpNL7ol
 FhdhV2U5a7PcSi+2x8ch1PAadmemVPqWQz/Pevk8QZxazMoUiZQl9GkajRpehzux11b8CEZcML4
 HvlAswzTbPYOKP5LxqA26BP3lwWUgVPKPbHg13LMNiXd97msy+IMmJl9wJqQGrA+fevA8SfXXb8
 hYSPgXlgrFjcaslE7p6ECWgKY3leSth1IQGGGwE05hn9ApCjksNvsqjQNgUS2T8FJIIlRLRfF2q
 w1/lB/Wp3sZLRJunr0UoGEYBE1depu8MWytD2mFXpJfHngenLUE8elUcs9EgfHPovIShKb1OvyL
 QU2QM83psrd10MjV+Ie4=
X-Received: by 2002:a05:600c:b8e:b0:43c:e7ae:4bc9 with SMTP id
 5b1f17b1804b1-43d5a369745mr110172185e9.1.1742942638565; 
 Tue, 25 Mar 2025 15:43:58 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d43f3328bsm213438795e9.1.2025.03.25.15.43.55
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 25 Mar 2025 15:43:57 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Thomas Huth <thuth@redhat.com>,
	qemu-devel@nongnu.org
Cc: Ilya Leoshkevich <iii@linux.ibm.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Glenn Miles <milesg@linux.ibm.com>, Samuel Tardieu <sam@rfc1149.net>,
 qemu-block@nongnu.org, Patrick Leis <venture@google.com>,
 David Hildenbrand <david@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Tyrone Ting <kfting@nuvoton.com>, Eric Farman <farman@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Kevin Wolf <kwolf@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 Bernhard Beschow <shentey@gmail.com>, Hanna Reitz <hreitz@redhat.com>,
 Hao Wu <wuhaotsh@google.com>, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH-for-10.0 08/12] hw/misc/pll: Do not expose as user-creatable
Date: Tue, 25 Mar 2025 23:43:06 +0100
Message-ID: <20250325224310.8785-9-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250325224310.8785-1-philmd@linaro.org>
References: <20250325224310.8785-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: BY0igl96ymzG

All these devices are part of SoC components and can not
be created manually.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/misc/bcm2835_cprman.c | 8 ++++++++
 hw/misc/npcm_clk.c       | 6 ++++++
 hw/misc/stm32l4x5_rcc.c  | 4 ++++
 3 files changed, 18 insertions(+)

diff --git a/hw/misc/bcm2835_cprman.c b/hw/misc/bcm2835_cprman.c
index aa14cd931f5..0c4d4b7de50 100644
--- a/hw/misc/bcm2835_cprman.c
+++ b/hw/misc/bcm2835_cprman.c
@@ -137,6 +137,8 @@ static void pll_class_init(ObjectClass *klass, void *data)
 
     device_class_set_legacy_reset(dc, pll_reset);
     dc->vmsd = &pll_vmstate;
+    /* Reason: Part of BCM2835CprmanState component */
+    dc->user_creatable = false;
 }
 
 static const TypeInfo cprman_pll_info = {
@@ -241,6 +243,8 @@ static void pll_channel_class_init(ObjectClass *klass, void *data)
 
     device_class_set_legacy_reset(dc, pll_channel_reset);
     dc->vmsd = &pll_channel_vmstate;
+    /* Reason: Part of BCM2835CprmanState component */
+    dc->user_creatable = false;
 }
 
 static const TypeInfo cprman_pll_channel_info = {
@@ -362,6 +366,8 @@ static void clock_mux_class_init(ObjectClass *klass, void *data)
 
     device_class_set_legacy_reset(dc, clock_mux_reset);
     dc->vmsd = &clock_mux_vmstate;
+    /* Reason: Part of BCM2835CprmanState component */
+    dc->user_creatable = false;
 }
 
 static const TypeInfo cprman_clock_mux_info = {
@@ -416,6 +422,8 @@ static void dsi0hsck_mux_class_init(ObjectClass *klass, void *data)
     DeviceClass *dc = DEVICE_CLASS(klass);
 
     dc->vmsd = &dsi0hsck_mux_vmstate;
+    /* Reason: Part of BCM2835CprmanState component */
+    dc->user_creatable = false;
 }
 
 static const TypeInfo cprman_dsi0hsck_mux_info = {
diff --git a/hw/misc/npcm_clk.c b/hw/misc/npcm_clk.c
index 0e85974cf96..b6a893ffb22 100644
--- a/hw/misc/npcm_clk.c
+++ b/hw/misc/npcm_clk.c
@@ -1108,6 +1108,8 @@ static void npcm7xx_clk_pll_class_init(ObjectClass *klass, void *data)
 
     dc->desc = "NPCM7xx Clock PLL Module";
     dc->vmsd = &vmstate_npcm7xx_clk_pll;
+    /* Reason: Part of NPCMCLKState component */
+    dc->user_creatable = false;
 }
 
 static void npcm7xx_clk_sel_class_init(ObjectClass *klass, void *data)
@@ -1116,6 +1118,8 @@ static void npcm7xx_clk_sel_class_init(ObjectClass *klass, void *data)
 
     dc->desc = "NPCM7xx Clock SEL Module";
     dc->vmsd = &vmstate_npcm7xx_clk_sel;
+    /* Reason: Part of NPCMCLKState component */
+    dc->user_creatable = false;
 }
 
 static void npcm7xx_clk_divider_class_init(ObjectClass *klass, void *data)
@@ -1124,6 +1128,8 @@ static void npcm7xx_clk_divider_class_init(ObjectClass *klass, void *data)
 
     dc->desc = "NPCM7xx Clock Divider Module";
     dc->vmsd = &vmstate_npcm7xx_clk_divider;
+    /* Reason: Part of NPCMCLKState component */
+    dc->user_creatable = false;
 }
 
 static void npcm_clk_class_init(ObjectClass *klass, void *data)
diff --git a/hw/misc/stm32l4x5_rcc.c b/hw/misc/stm32l4x5_rcc.c
index fd8466dff34..158b743cae7 100644
--- a/hw/misc/stm32l4x5_rcc.c
+++ b/hw/misc/stm32l4x5_rcc.c
@@ -150,6 +150,8 @@ static void clock_mux_class_init(ObjectClass *klass, void *data)
     rc->phases.hold = clock_mux_reset_hold;
     rc->phases.exit = clock_mux_reset_exit;
     dc->vmsd = &clock_mux_vmstate;
+    /* Reason: Part of Stm32l4x5RccState component */
+    dc->user_creatable = false;
 }
 
 static void clock_mux_set_enable(RccClockMuxState *mux, bool enabled)
@@ -302,6 +304,8 @@ static void pll_class_init(ObjectClass *klass, void *data)
     rc->phases.hold = pll_reset_hold;
     rc->phases.exit = pll_reset_exit;
     dc->vmsd = &pll_vmstate;
+    /* Reason: Part of Stm32l4x5RccState component */
+    dc->user_creatable = false;
 }
 
 static void pll_set_vco_multiplier(RccPllState *pll, uint32_t vco_multiplier)
-- 
2.47.1

