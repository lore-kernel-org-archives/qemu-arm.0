Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp229881ejb;
        Wed, 31 May 2023 13:37:42 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7q6HuLCzRQnj7Fm5e5ex84pXw+CId44OZvJ8FQ6uDcobW+Fn9+voJ7C/XmMrpjsfxfx3yO
X-Received: by 2002:a05:6214:aca:b0:623:82ae:8a63 with SMTP id g10-20020a0562140aca00b0062382ae8a63mr8076567qvi.30.1685565462156;
        Wed, 31 May 2023 13:37:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685565462; cv=none;
        d=google.com; s=arc-20160816;
        b=IUq/10V71p8FO9ogjBs+98DTDIh1VwLuH5Ts7q7vvuK0eDY9f0ElAGcg+ESE4iSz3l
         ytuHwQO09rm7zZBojhnCEUmanfc3k3vRDjTOWju1H1BRTsQjAuclXBvZ6UtefeG81puE
         EssLYYP/su5+8I4ea1V5IbmpMOTxVyDlPPD8PyOlcz8Kn694/TXyaNbs2Q4IGnUTtsQZ
         y1LbVP0tzFKY+aVyDaZUyzRIwhwkjfl+zXHXhXM9LefMY9cXTzqNf8GEkUCc49uB/H51
         cnePS86A3spHM36oFKO+IYmHDioOZDQUTA3MkKuu06+hBrxKSvJR18KjjUL8tuFEQGJt
         Kf+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=RDY2GDiaOE1sTafU5g56yTJAkbGCsjHJ/M+/hUiSBu4=;
        b=I6ZzgYpqGLKwEceVh1jcvGwxI4R5ZOqeWzweFYyLNn1UKIwKwmD0derJkhvaMngFA+
         zntXRiKCgFmoXqdr1g5dBKV2MTp0KoZkTugmyZ8wGsewnewsl1z2tFZe9Xwj6tX0K67d
         H8bOKCoNu/WK5NugjLN2yop+C7UbtRrM+oVxaNP0VCmBsZ9HbNQ9LP1jKq88TWfvH7t7
         KMpBrAzS/8eiNgWfoqx28ihDr/TXV7iI+nzqFDas5dd60GIpeiPNky1GlqoHyhJzTlAc
         gJ8oBejmRqWVXZxFnoBoIz+jUd54zcH6yAdLhmU4Jd5AQTpueMIAPGvIKMvKnfvNEzLh
         cbzg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IHo+kDOw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id js8-20020a0562142aa800b0061b5be7c8bcsi8500922qvb.226.2023.05.31.13.37.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 31 May 2023 13:37:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IHo+kDOw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q4SYd-0007YZ-So; Wed, 31 May 2023 16:36:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q4SYX-0007RO-Ps
 for qemu-arm@nongnu.org; Wed, 31 May 2023 16:36:31 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q4SYU-0003Fi-Nu
 for qemu-arm@nongnu.org; Wed, 31 May 2023 16:36:29 -0400
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-30ae95c4e75so60854f8f.2
 for <qemu-arm@nongnu.org>; Wed, 31 May 2023 13:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685565385; x=1688157385;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RDY2GDiaOE1sTafU5g56yTJAkbGCsjHJ/M+/hUiSBu4=;
 b=IHo+kDOwJImA5YiH2NVzB4/KqHBgQRPNvtS71relVd6IrNBqEwhZcpCTM5IYdaGu9W
 arrFrGjqPIakvJdSTa4c4A4epln8Jn4Lb5FolnwOOnrsUG8VqiGXz1LOQ74vcYf8zINa
 JV/Q7VBjDNBSWWbNnOIw0fiSjccy7kX4zOXolt9PlZ3/cDzUH14kpe3dXImpZu+PRXSu
 AatfMW2VMR3HMd2ZaXCNqf1tpDA4YrrpNrSOccZZtBfBcCw+jzowr9U8pq7dbZ1H4JW3
 STbwV0nJUdIkCJKwPuP46P0OIHuai8gk+JKm0c4jecYBpAyqdawr/U4Tw9LI6bWBKxqX
 zsQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685565385; x=1688157385;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RDY2GDiaOE1sTafU5g56yTJAkbGCsjHJ/M+/hUiSBu4=;
 b=NouhytznYTwjIPRy2jgFX1q7DTpx0FvDWMtPWAYy+5BZ7EZWVurigBTOMff3GFirz3
 lMCwuRAq4R1sCc7EeGtwrzVYSl0CfZv24sQ+p9+yr5eygNODXgyB4TsLsaAhwsX/5jhQ
 xYomMMOGqOYPiKu6kg5gU15RuPAIoKRASP423JnSL/y5QRbW7LhKhC1VNaBs7Dfinvba
 6g0IZX1tYe0M6MKZFrKPs590Cyf42ZR9laAPgf1xR+2GG5eEuhB+INkBE4LnkcwGmspl
 t1wb1fKeO7eORar0vc8HtFbMSkVQNl4S2V/Bf93Y9nsAy7C5XZjdVFVaXIZnMM63gUiD
 dVAg==
X-Gm-Message-State: AC+VfDxyKmvqIKG8mKeUmUMVl5KEstViwIW3yqebTHR5xHbgPM5eXd+0
 7UXQc2dKX0XFqX8H+lsJy/pOydxGJui8RW3EPlg=
X-Received: by 2002:a5d:4d46:0:b0:30a:8e83:5b1a with SMTP id
 a6-20020a5d4d46000000b0030a8e835b1amr242708wru.13.1685565385335; 
 Wed, 31 May 2023 13:36:25 -0700 (PDT)
Received: from localhost.localdomain ([176.176.146.12])
 by smtp.gmail.com with ESMTPSA id
 c18-20020a5d4152000000b0030aeb3731d0sm7774189wrq.98.2023.05.31.13.36.24
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 31 May 2023 13:36:24 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Sergey Kambalin <serg.oker@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 04/15] hw/timer/arm_timer: Remove pointless cast from void *
Date: Wed, 31 May 2023 22:35:48 +0200
Message-Id: <20230531203559.29140-5-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230531203559.29140-1-philmd@linaro.org>
References: <20230531203559.29140-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: RWg/vkfdl+0N

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/timer/arm_timer.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/hw/timer/arm_timer.c b/hw/timer/arm_timer.c
index 5caf42649a..3dda3a73f8 100644
--- a/hw/timer/arm_timer.c
+++ b/hw/timer/arm_timer.c
@@ -52,7 +52,7 @@ static void arm_timer_update(arm_timer_state *s)
 
 static uint32_t arm_timer_read(void *opaque, hwaddr offset)
 {
-    arm_timer_state *s = (arm_timer_state *)opaque;
+    arm_timer_state *s = opaque;
 
     switch (offset >> 2) {
     case 0: /* TimerLoad */
@@ -99,7 +99,7 @@ static void arm_timer_recalibrate(arm_timer_state *s, int reload)
 static void arm_timer_write(void *opaque, hwaddr offset,
                             uint32_t value)
 {
-    arm_timer_state *s = (arm_timer_state *)opaque;
+    arm_timer_state *s = opaque;
     int freq;
 
     switch (offset >> 2) {
@@ -154,7 +154,7 @@ static void arm_timer_write(void *opaque, hwaddr offset,
 
 static void arm_timer_tick(void *opaque)
 {
-    arm_timer_state *s = (arm_timer_state *)opaque;
+    arm_timer_state *s = opaque;
     s->int_level = 1;
     arm_timer_update(s);
 }
@@ -214,7 +214,7 @@ static const uint8_t sp804_ids[] = {
 /* Merge the IRQs from the two component devices.  */
 static void sp804_set_irq(void *opaque, int irq, int level)
 {
-    SP804State *s = (SP804State *)opaque;
+    SP804State *s = opaque;
 
     s->level[irq] = level;
     qemu_set_irq(s->irq, s->level[0] || s->level[1]);
@@ -223,7 +223,7 @@ static void sp804_set_irq(void *opaque, int irq, int level)
 static uint64_t sp804_read(void *opaque, hwaddr offset,
                            unsigned size)
 {
-    SP804State *s = (SP804State *)opaque;
+    SP804State *s = opaque;
 
     if (offset < 0x20) {
         return arm_timer_read(s->timer[0], offset);
@@ -255,7 +255,7 @@ static uint64_t sp804_read(void *opaque, hwaddr offset,
 static void sp804_write(void *opaque, hwaddr offset,
                         uint64_t value, unsigned size)
 {
-    SP804State *s = (SP804State *)opaque;
+    SP804State *s = opaque;
 
     if (offset < 0x20) {
         arm_timer_write(s->timer[0], offset, value);
@@ -349,7 +349,7 @@ struct icp_pit_state {
 static uint64_t icp_pit_read(void *opaque, hwaddr offset,
                              unsigned size)
 {
-    icp_pit_state *s = (icp_pit_state *)opaque;
+    icp_pit_state *s = opaque;
     int n;
 
     /* ??? Don't know the PrimeCell ID for this device.  */
@@ -365,7 +365,7 @@ static uint64_t icp_pit_read(void *opaque, hwaddr offset,
 static void icp_pit_write(void *opaque, hwaddr offset,
                           uint64_t value, unsigned size)
 {
-    icp_pit_state *s = (icp_pit_state *)opaque;
+    icp_pit_state *s = opaque;
     int n;
 
     n = offset >> 8;
-- 
2.38.1

