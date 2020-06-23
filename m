Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp3869965lfm;
        Tue, 23 Jun 2020 00:27:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzegSGRDOz5lXy6jDBdbAfYAfwpScSfkDvEH8/K05jKPbb1OzjjKBIXUaQjQE43lO7dI37b
X-Received: by 2002:a25:ef42:: with SMTP id w2mr36108024ybm.50.1592897261503;
        Tue, 23 Jun 2020 00:27:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592897261; cv=none;
        d=google.com; s=arc-20160816;
        b=Za/ndvcFbqpTbLyXLqC4qBF2DAMok3lg6m5c2u/0GamDLYRpRWztV8+OsP5Lhp6Tzw
         Tj+Tk74EdLh27u+mQAc8RKu9bNiaVMdiY2gwLaSmt0beQ99lxnJsvR896bXeKi0AYRRO
         u4eb4WpL/46N5odC4XsB/ywqWdVIqCmGMrUG59q6bX6gFzWGU/Nf7GnW3TPZVa4pJkfu
         /yGA367z7hLJgqRt6VPPY0TVL+kyhOE3F39gOi32D56wkcy2ualWqR/SIYKIq4TTVuIr
         q6vxxUPD8OqwH4IU9X6YbHvpCMpTsBMIOB9zV8bGvjLrn2xT6M9sHOHsw0xLZ1zG2dYD
         ZY6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Sd994PF98g37kBZeJeMNMVNRQ9Le/d7u2/DGlesu4Nw=;
        b=idUqt5FfMQhn8vE5NTEJXj/Xr3CjpRryGxzQl0k87lSrcw0hbDppuwJD7+ipTJvYSY
         0idPWxt+ddPuWKVFvg5p7aRDq739R2XisdFPrsKXJdAPalapziCOu5Y4mxMLfFh/w6l1
         fgZFTIU6qkY4guw4lJ0tBd1FuRdPpZVzmcOYKJaZS22A0liUZ+JuO0Msm0bqyJ0Pvx01
         lb3qQaceSBtgMjo2bgUTpdqB6sp10X9Z9tnCqUvBgJATg/QHPlg2VrgfH6AFTeQQBJZE
         iMA6AgMA3XpxSPAHNRWRFs64QTSwvOipbhfNApd8I1+KwnBYv2bhfkLMVTqh6I+MRW7M
         9Qlg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Ffm6A4U6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p1si14910932ybm.466.2020.06.23.00.27.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 Jun 2020 00:27:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Ffm6A4U6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:38434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jndLI-00077Y-T4
	for alex.bennee@linaro.org; Tue, 23 Jun 2020 03:27:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jndL9-000757-AC; Tue, 23 Jun 2020 03:27:31 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:34617)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jndL7-0004yn-Ko; Tue, 23 Jun 2020 03:27:31 -0400
Received: by mail-wm1-x341.google.com with SMTP id u26so1570588wmn.1;
 Tue, 23 Jun 2020 00:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Sd994PF98g37kBZeJeMNMVNRQ9Le/d7u2/DGlesu4Nw=;
 b=Ffm6A4U6hXk+hbMR2gCs4/ho/eF/qxeDDoMM9JgMiTUhE1mda8ObSB2V5VcSKazH6c
 noXZJS7QWWG42LhRQGPjb7n6XAgmvixg2vJ07FuQeRHQFgoBHANl2bpxl86mN9g9iRM9
 hNwftjgq5m4d7zewr1gGAEqD4Gf0cwYvzeNQURzq4jGolhz737v9jo+lTb8D57wDGsnG
 KOjrJ3aFAON9cko+hqQYVEbm44uQLczBVH/K+Yl4wlem62mE/MIdKgg96BWS921iS31g
 tlTGUm2n+FcGnUetA5fZZs/sp2ORUY86w2GvqvcTlkyXNNigtrYLoTnKwOOJjAiMp8xB
 Mr5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Sd994PF98g37kBZeJeMNMVNRQ9Le/d7u2/DGlesu4Nw=;
 b=j/NDJMeixNaf2J1WioeTj/YjUYRnYziduNcfiRJBaxHTRzpPEfUM5QHL07vXMRxUCc
 LgGmYrWYPiOEPOcted50ep1lAakGhNRT/qZcAIvKIEL7cOu329w706RuFsEqxAOZd+Cb
 TgQoM4W2r2V6J7pZxOigb6vODzgvqMi3bcAriWg4cfkgycd+FhHqF4VSkeSFqBAm1Oy2
 s1YbyGzbi4ZKKEu/E5Ih1KN4TQomzM1iB8ztUdAZh1arf4Ej9oSy2NUo8GAHLwLhc+0J
 +yZ8/laJIxjV68YBaKCWxRJcdeyHZkFRfujsh0LjAKZgraNW07yXIhi8lvEa1BTzKLfi
 bsfQ==
X-Gm-Message-State: AOAM530+2w4FOk0xXekH7igyFezHNhctv5127uY+a01Lem4U2KCqZNg8
 GFtzxuKZ5vHW4/m9ARg2JlVnzV7P
X-Received: by 2002:a7b:c5c1:: with SMTP id n1mr21827141wmk.21.1592897247888; 
 Tue, 23 Jun 2020 00:27:27 -0700 (PDT)
Received: from localhost.localdomain (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id l14sm4200059wrn.18.2020.06.23.00.27.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jun 2020 00:27:27 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 2/9] hw/misc/pca9552: Rename 'nr_leds' as 'pin_count'
Date: Tue, 23 Jun 2020 09:27:16 +0200
Message-Id: <20200623072723.6324-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200623072723.6324-1-f4bug@amsat.org>
References: <20200623072723.6324-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::341;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x341.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Corey Minyard <cminyard@mvista.com>, Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jQnfZMYLJxWr

The PCA9552 device does not expose LEDs, but simple pins
to connnect LEDs to. To be clearer with the device model,
rename 'nr_leds' as 'pin_count'.

Reviewed-by: Cédric Le Goater <clg@kaod.org>
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

