Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp3431025lfm;
        Mon, 22 Jun 2020 11:37:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxFKBib3axDH+liN2DnbemOP1ZWEXX3o7edslT40FLmglnRUivjr9mPJ+fyFOXWfhNGF26A
X-Received: by 2002:a25:e08d:: with SMTP id x135mr29112589ybg.482.1592851071553;
        Mon, 22 Jun 2020 11:37:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592851071; cv=none;
        d=google.com; s=arc-20160816;
        b=rMrh6AS2malpOA/4FyK84Xf+SeC7pHhAt2+kGXjnIGHd8gm1s4K59mNYRk6BMvIV4f
         RiJDAhAjT53Jg8vDH1FCDd08DlOvPu7A/jAeCuCZmmFAomHtA3MMZSOiPw/Y8Ehz8BHz
         viRwPR2jwDIqyvmCulo6UweTUfoIYukJ9JmyaTCdr9p7gewYnLgRSH5h+T34rsPpm6v5
         U7gdqXNgmheOZL0ATxqdkupmNlYLPFR9WvVCEaZ5keAzbgnYA6YA/Sdx+EeGLPOjW7C5
         0N53AlkMbbcfVKwkzpHeeFiKCegn2Aammg2YcyNViabSVvIWXCgjSGx0VMkRJPT9V0Pe
         jBQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=ZQhKNZfSYqShQVnzUnYQe3jjUWQ7noSiOCxZDTyth74=;
        b=LbR9kzHji4zsJeXw6CCa5g7N6cwftEeMEO+T4ABi4vD3vWOaAhmvg99wcJshe1z8Dc
         F1wojkBjeVWQWiR5arPLQpF94geZ4gG241j6or/JA4e4Jd41jdiszXZMZx3zuXn6xWRK
         3egDbDm4ROcpt3UA3FSW3maAQwGjiO1eXkibds4wka5ey5Y/ImC8M5+ru89dQoJNK1eU
         Dym2PeipwjV4TIo6bY5Y18I++7q4BqF399X59QDYi18oBlTauBUWm1IVc/+xITpS8nrU
         cwkkHFHSlbPsXgjlaQRLhW3epoTCAUmSaXUkDi2URXt3RmTh3e9bxI6QKBaUTrrqVF1T
         qyzw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=dQCXc2li;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r204si15859945ybc.324.2020.06.22.11.37.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Jun 2020 11:37:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=dQCXc2li;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:47300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jnRKI-0001od-Uo
	for alex.bennee@linaro.org; Mon, 22 Jun 2020 14:37:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jnRHB-0005Jz-3N; Mon, 22 Jun 2020 14:34:37 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:33391)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jnRH9-00080v-Kt; Mon, 22 Jun 2020 14:34:36 -0400
Received: by mail-wm1-x344.google.com with SMTP id a6so576225wmm.0;
 Mon, 22 Jun 2020 11:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZQhKNZfSYqShQVnzUnYQe3jjUWQ7noSiOCxZDTyth74=;
 b=dQCXc2liZ7oP7mnVWleNs7GYO2WLl8IEwhMUkKgppRtOoRJbqsIWRHDmDpmV7ifeq/
 9UKWIF/RlspqO8rc79gaC++y3MU6PHQ4Nj4wt4mOQ9iqT51ST/S7R2RhV8+Lh7o5geVP
 7Z75SxLGCYzy6XKsFoKyudpV7mA0Hf361PS6vVOcNNC3PXYKbDhiCMVNf949KsQMGzIw
 VgXXYPlB5apW7sTltUfUHyRGMXu5N77fENymce+5bLyZszJKOrP+bHCAPlF7hRaL1g5N
 bn7Oa3UvWJEqhvceFyvKS7eGIa/AdcCvumC/m5vbRjfH46rq72jE6K7y3WTwZHplevG2
 3lWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ZQhKNZfSYqShQVnzUnYQe3jjUWQ7noSiOCxZDTyth74=;
 b=grnhVnUF21tsB3lZF/1Q5fa7G5WKmxTtYrhBJNYdkcQiwA/HZ+BK0HTC0DEvoc6exf
 ZgQ26omrBYEqXIBO/zZ0HxS43TfxETGObMDxHy/+zbl8NHf8tpgOzHM0hHIxQfwf2N8l
 3Pam14WHepVJuvSnxTs0rP540LJgP1ZkCSvAQHyr4kYxIkB0xs9Z0wi2rogCrWp7lr+6
 6P4xxahYEMnko6A6PD6dZsY0pSDu4qbEamIUHqrmUbhhWiX6o6I2J5n5VXPW73tNmRXw
 nNDQcXdDmupILQm7Q0IMmg83F7xzy5GfSsb2RgAQW60o0tVG3T0bRVgqllxBRRfdZ9pG
 nr8g==
X-Gm-Message-State: AOAM531fYRcsmp2je/qoOafwwAgoHAXj/7j8gEaTlExOUX1Rho8Znq0m
 7NgzJzoES1kUQJcAf9OT+lv8GHaY
X-Received: by 2002:a1c:9c49:: with SMTP id f70mr19311888wme.74.1592850873473; 
 Mon, 22 Jun 2020 11:34:33 -0700 (PDT)
Received: from localhost.localdomain (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id h29sm20286161wrc.78.2020.06.22.11.34.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jun 2020 11:34:32 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 2/9] hw/misc/pca9552: Rename 'nr_leds' as 'pin_count'
Date: Mon, 22 Jun 2020 20:34:21 +0200
Message-Id: <20200622183428.12255-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200622183428.12255-1-f4bug@amsat.org>
References: <20200622183428.12255-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::344;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x344.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Corey Minyard <cminyard@mvista.com>, Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qPH0I9WQLbvv

The PCA9552 device does not expose LEDs, but simple pins
to connnect LEDs to. To be clearer with the device model,
rename 'nr_leds' as 'pin_count'.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/misc/pca9552.h |  2 +-
 hw/misc/pca9552.c         | 10 +++++-----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/include/hw/misc/pca9552.h b/include/hw/misc/pca9552.h
index ebb43c63fe..bc5ed31087 100644
--- a/include/hw/misc/pca9552.h
+++ b/include/hw/misc/pca9552.h
@@ -26,7 +26,7 @@ typedef struct PCA9552State {
 
     uint8_t regs[PCA9552_NR_REGS];
     uint8_t max_reg;
-    uint8_t nr_leds;
+    uint8_t pin_count;
 } PCA9552State;
 
 #endif
diff --git a/hw/misc/pca9552.c b/hw/misc/pca9552.c
index cac729e35a..81da757a7e 100644
--- a/hw/misc/pca9552.c
+++ b/hw/misc/pca9552.c
@@ -37,7 +37,7 @@ static void pca9552_update_pin_input(PCA9552State *s)
 {
     int i;
 
-    for (i = 0; i < s->nr_leds; i++) {
+    for (i = 0; i < s->pin_count; i++) {
         uint8_t input_reg = PCA9552_INPUT0 + (i / 8);
         uint8_t input_shift = (i % 8);
         uint8_t config = pca9552_pin_get_config(s, i);
@@ -185,7 +185,7 @@ static void pca9552_get_led(Object *obj, Visitor *v, const char *name,
         error_setg(errp, "%s: error reading %s", __func__, name);
         return;
     }
-    if (led < 0 || led > s->nr_leds) {
+    if (led < 0 || led > s->pin_count) {
         error_setg(errp, "%s invalid led %s", __func__, name);
         return;
     }
@@ -228,7 +228,7 @@ static void pca9552_set_led(Object *obj, Visitor *v, const char *name,
         error_setg(errp, "%s: error reading %s", __func__, name);
         return;
     }
-    if (led < 0 || led > s->nr_leds) {
+    if (led < 0 || led > s->pin_count) {
         error_setg(errp, "%s invalid led %s", __func__, name);
         return;
     }
@@ -291,9 +291,9 @@ static void pca9552_initfn(Object *obj)
      * PCA955X device
      */
     s->max_reg = PCA9552_LS3;
-    s->nr_leds = 16;
+    s->pin_count = 16;
 
-    for (led = 0; led < s->nr_leds; led++) {
+    for (led = 0; led < s->pin_count; led++) {
         char *name;
 
         name = g_strdup_printf("led%d", led);
-- 
2.21.3

