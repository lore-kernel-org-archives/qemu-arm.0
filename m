Received: by 2002:a19:87d7:0:0:0:0:0 with SMTP id j206csp1847651lfd;
        Tue, 26 Jan 2021 17:14:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzr2svJdlyAB4mt6VkqMS3WC8BU9zA3P8vUnlht1vD4CTF6aSm64xNV4kAtbmnmiUuy1bUB
X-Received: by 2002:a25:4843:: with SMTP id v64mr12195918yba.24.1611710048121;
        Tue, 26 Jan 2021 17:14:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611710048; cv=none;
        d=google.com; s=arc-20160816;
        b=giz1bM4+0evlNUek8HjIlDE487E2r0MwdE3uiZDFtOUlcM35TfhDocLy9687iCMjns
         HBaUP3iPx/S4nHXTXPBKT/hPLVg4YqGLTzdMWwzCud1Appq+L39ztxN6Mr4jhHjPFD8o
         GXOYqVLDy8/HsN6Txs7XRMzv5cFHlKbLoj3rvGw/u+dlBagzlYf0Goyr5DMlH03AAVcR
         SRHbEvNjj1m2ENlznYC6Sx9FUaE4W6UHUM0e1b7hxPvIt53mh+8D+h5aOBN3J7H2mIi+
         NQl16kiMRKltTRGNFLhd5lfchfXn0xoaIFz5upQPEd4DI0Zn999zxV9L2P26vBY/CaFm
         pxnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=from:reply-to:sender:errors-to:cc:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:to
         :subject:mime-version:message-id:date:dkim-signature;
        bh=CYEX7CEkLzQdqs4pMJDm4ewLslaQwNz5Up0FfqGNcqc=;
        b=Alja70LAvjuNcRlDi5Fa0EEu16lbdshsKWA8x9BBQKEBbaSmcUgvulBHg9Pqv949rs
         bGIuNSWTD7YleosEZ64Lzyt4OG/d7hfd3F6ThidpytdEcVfprgs+K71ZFiKHLyKTqgCF
         n+IpJcMg+zIcUeOQNxwZANQTAK0vNxGdBkx4QGe68nAX0AuW6Vl9mxJZH72laZfMLK31
         PTuZkF64OpxepfcURufiYEUzifCzrbvpjDI6EWMW/+I70cy0uwtFts5MsjHLZ0ysAQIV
         1eSc10cc3OO3gL296DGZh0Bpe5GuMaz0XJ7clNAOao7PRNnOV5ypF3RFlooBCjPQZusG
         TH+A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@google.com header.s=20161025 header.b=slN3QB5Z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u6si314326ybc.379.2021.01.26.17.14.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 26 Jan 2021 17:14:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@google.com header.s=20161025 header.b=slN3QB5Z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1]:56128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l4ZPH-0005oL-LA
	for alex.bennee@linaro.org; Tue, 26 Jan 2021 20:14:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <30b0QYAgKCJYMK70EJI76EE6B4.2ECG4CK-0HCDED6DK.EH6@flex--wuhaotsh.bounces.google.com>)
 id 1l4ZNA-0004Wm-Sm
 for qemu-arm@nongnu.org; Tue, 26 Jan 2021 20:11:53 -0500
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049]:39675)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <30b0QYAgKCJYMK70EJI76EE6B4.2ECG4CK-0HCDED6DK.EH6@flex--wuhaotsh.bounces.google.com>)
 id 1l4ZN7-0001eF-UD
 for qemu-arm@nongnu.org; Tue, 26 Jan 2021 20:11:52 -0500
Received: by mail-pj1-x1049.google.com with SMTP id t10so150994pjw.4
 for <qemu-arm@nongnu.org>; Tue, 26 Jan 2021 17:11:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:message-id:mime-version:subject:from:to:cc;
 bh=CYEX7CEkLzQdqs4pMJDm4ewLslaQwNz5Up0FfqGNcqc=;
 b=slN3QB5ZyBQvCoFgPJ5OUpGvtfwH0lUOesuoir0crXVHGLdA66VsBFkomEFxOFb2R6
 Ga+6VJvxr2qpgf16vkpCR2fZkLavQkmvfpkiaB+LXyTx9az36BUhEe+J+VSCmp1Ub8BW
 zAOiclf3b0Tg/nJbrG6oJn3YTIvstbQF/DwzaKt2Lnp45G4/kc9EsnixuTLtOTetd3wv
 COnKsRpfqp5YdY5ghxMYfNwVDwv1A4XKY/Z3zc4IQsYO5AJPIlpiWz9rE5JFu4uC5bf+
 F6RW8roCKq3UQ4ZUtgTrucZf9Eb2U1Jq6+1Y9DMoYjiIPP2Q/MYEsnfemu2ey/DzNfSh
 co8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
 :to:cc;
 bh=CYEX7CEkLzQdqs4pMJDm4ewLslaQwNz5Up0FfqGNcqc=;
 b=b/KLCTBaChbEX3Iy4xOg7htjfQQq2valy/76Zz/hPSjD4Wk+i92AYktJBOfEEHn8Vx
 M4x1wIstZ48W/juiQJVyiTlbpA+MnhUOEsC2Oh0pnRdaJTIn972CHoU41Sn8omBLkj9O
 o6PWsz9Y5n7ETdWv8+77Eqh9fpluwAoZ2m3tTNQ6iBEQQtkAoGRq8Pgx9BP2bN6NleZC
 eaxptGd+huhDBLsZQVlkQXIiEUeh+mRnvipqaRgBKECGYDUPfmRKZrv+v5Qi8WCrhqvL
 OPivz42/cwZRZZqb7opSuL0Ra2OIf/WPgu1eqI0gvk5Sro8J9iNfAVt9hzyBkkPPAL9s
 q4Vw==
X-Gm-Message-State: AOAM533w1hflRjT0e9TKXxD/HXbeZ1GBAXZakHTYS5t4w5sR7VgWiBjE
 efbsY4Mn3frkqr0Sclio/OoKNmAvFQ5K7g==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:10:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a17:902:d48a:b029:de:ae4d:2c7b with SMTP
 id c10-20020a170902d48ab02900deae4d2c7bmr8559923plg.62.1611709905391; Tue, 26
 Jan 2021 17:11:45 -0800 (PST)
Date: Tue, 26 Jan 2021 17:11:42 -0800
Message-Id: <20210127011142.2122790-1-wuhaotsh@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.30.0.365.g02bc693789-goog
Subject: [PATCH v2] hw/misc: Fix arith overflow in NPCM7XX PWM module
To: peter.maydell@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1049;
 envelope-from=30b0QYAgKCJYMK70EJI76EE6B4.2ECG4CK-0HCDED6DK.EH6@flex--wuhaotsh.bounces.google.com;
 helo=mail-pj1-x1049.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, f4bug@amsat.org, qemu-devel@nongnu.org,
 wuhaotsh@google.com, qemu-arm@nongnu.org, hskinnemoen@google.com,
 dje@google.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Reply-to:  Hao Wu <wuhaotsh@google.com>
From: wuhaotsh--- via <qemu-arm@nongnu.org>
X-TUID: Amy+uBzH6NCz

Fix potential overflow problem when calculating pwm_duty.
1. Ensure p->cmr and p->cnr to be from [0,65535], according to the
   hardware specification.
2. Changed duty to uint32_t. However, since MAX_DUTY * (p->cmr+1)
   can excceed UINT32_MAX, we convert them to uint64_t in computation
   and converted them back to uint32_t.
   (duty is guaranteed to be <= MAX_DUTY so it won't overflow.)

Fixes: CID 1442342
Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Doug Evans <dje@google.com>
Signed-off-by: Hao Wu <wuhaotsh@google.com>
---
 hw/misc/npcm7xx_pwm.c          | 23 +++++++++++++++++++----
 tests/qtest/npcm7xx_pwm-test.c |  4 ++--
 2 files changed, 21 insertions(+), 6 deletions(-)

diff --git a/hw/misc/npcm7xx_pwm.c b/hw/misc/npcm7xx_pwm.c
index e99e3cc7ef..dabcb6c0f9 100644
--- a/hw/misc/npcm7xx_pwm.c
+++ b/hw/misc/npcm7xx_pwm.c
@@ -58,6 +58,9 @@ REG32(NPCM7XX_PWM_PWDR3, 0x50);
 #define NPCM7XX_CH_INV              BIT(2)
 #define NPCM7XX_CH_MOD              BIT(3)
 
+#define NPCM7XX_MAX_CMR             65535
+#define NPCM7XX_MAX_CNR             65535
+
 /* Offset of each PWM channel's prescaler in the PPR register. */
 static const int npcm7xx_ppr_base[] = { 0, 0, 8, 8 };
 /* Offset of each PWM channel's clock selector in the CSR register. */
@@ -96,7 +99,7 @@ static uint32_t npcm7xx_pwm_calculate_freq(NPCM7xxPWM *p)
 
 static uint32_t npcm7xx_pwm_calculate_duty(NPCM7xxPWM *p)
 {
-    uint64_t duty;
+    uint32_t duty;
 
     if (p->running) {
         if (p->cnr == 0) {
@@ -104,7 +107,7 @@ static uint32_t npcm7xx_pwm_calculate_duty(NPCM7xxPWM *p)
         } else if (p->cmr >= p->cnr) {
             duty = NPCM7XX_PWM_MAX_DUTY;
         } else {
-            duty = NPCM7XX_PWM_MAX_DUTY * (p->cmr + 1) / (p->cnr + 1);
+            duty = (uint64_t)NPCM7XX_PWM_MAX_DUTY * (p->cmr + 1) / (p->cnr + 1);
         }
     } else {
         duty = 0;
@@ -357,7 +360,13 @@ static void npcm7xx_pwm_write(void *opaque, hwaddr offset,
     case A_NPCM7XX_PWM_CNR2:
     case A_NPCM7XX_PWM_CNR3:
         p = &s->pwm[npcm7xx_cnr_index(offset)];
-        p->cnr = value;
+        if (value > NPCM7XX_MAX_CNR) {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s: invalid cnr value: %u", __func__, value);
+            p->cnr = NPCM7XX_MAX_CNR;
+        } else {
+            p->cnr = value;
+        }
         npcm7xx_pwm_update_output(p);
         break;
 
@@ -366,7 +375,13 @@ static void npcm7xx_pwm_write(void *opaque, hwaddr offset,
     case A_NPCM7XX_PWM_CMR2:
     case A_NPCM7XX_PWM_CMR3:
         p = &s->pwm[npcm7xx_cmr_index(offset)];
-        p->cmr = value;
+        if (value > NPCM7XX_MAX_CMR) {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s: invalid cmr value: %u", __func__, value);
+            p->cmr = NPCM7XX_MAX_CMR;
+        } else {
+            p->cmr = value;
+        }
         npcm7xx_pwm_update_output(p);
         break;
 
diff --git a/tests/qtest/npcm7xx_pwm-test.c b/tests/qtest/npcm7xx_pwm-test.c
index 63557d2c06..3d82654b81 100644
--- a/tests/qtest/npcm7xx_pwm-test.c
+++ b/tests/qtest/npcm7xx_pwm-test.c
@@ -272,7 +272,7 @@ static uint64_t pwm_compute_freq(QTestState *qts, uint32_t ppr, uint32_t csr,
 
 static uint64_t pwm_compute_duty(uint32_t cnr, uint32_t cmr, bool inverted)
 {
-    uint64_t duty;
+    uint32_t duty;
 
     if (cnr == 0) {
         /* PWM is stopped. */
@@ -280,7 +280,7 @@ static uint64_t pwm_compute_duty(uint32_t cnr, uint32_t cmr, bool inverted)
     } else if (cmr >= cnr) {
         duty = MAX_DUTY;
     } else {
-        duty = MAX_DUTY * (cmr + 1) / (cnr + 1);
+        duty = (uint64_t)MAX_DUTY * (cmr + 1) / (cnr + 1);
     }
 
     if (inverted) {
-- 
2.30.0.365.g02bc693789-goog

