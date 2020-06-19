Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp660452lfm;
        Fri, 19 Jun 2020 07:52:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy5fkMefQJRKf7NJpQLiR3CXGGYZXhNHjdmwNEZLkSv6zizq6RmHz7U5ykkIlZEVI0UP9CM
X-Received: by 2002:a05:6902:532:: with SMTP id y18mr6681741ybs.122.1592578367889;
        Fri, 19 Jun 2020 07:52:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592578367; cv=none;
        d=google.com; s=arc-20160816;
        b=gy7SpbdQcITNadRLYQh5oxBuE4bWQpy9DkH/Q9EUkTGvYVRWcjTJgjKQ4YeFxlD1+k
         0kmpAk59jZhKxCFY1ylZWrpNcEzO3aFzsId1yNzYWkbb+XWEMOBjsUYNtT8km3s2tf70
         C2Cyhz0WfLYnQqlBsBoRwd/iwwwczLJucDHTpW7+1FwLDo0uhCNvsdJYpkVIm1LD88DV
         31SvB7ND/2ZV/EQTKlD6OlIywHHbfuj7aNf3McODEYbmnMMYSQnVM+dfH+KXVRui7pow
         WssgOfYY9uZ3sRhwjASdg+Q/Wvjn236nin/+RbLUddYZfh3JTYDGtH2AY59tThIGEymW
         3J4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=iBPUxckhtWZbcMu6/ZTaa1aw+MkUGsnzLuvvoya/1F0=;
        b=ZocuKLth4AR+iDqE4wNtV2b/g5Ofh7sX7mZBAlmHTs9G8dzCiXLrtKgfwdH/bwcoqT
         yVUtgdRUAGSlpATBC1oY7Bv5KeUxLIvkdzkiAXiz7gULbMOpX33gmS5MYRb7DuoLzQCF
         g4ZRgLNfWSEwRHV7xGXqennJqQRc6yZgZrhKhx5Xjk+XYC0NBZ71VTp7tiAPB5eHu/pe
         vZKsxG1nO4zLq/1KN6Ntcidr7BVlmBPyFDAYTV340R+JAqcA3zU6Dsz3nLlZvp68zrXL
         rhNzeoigYlnmLAK7SmL2UHCKRnYQQufWzyOqJ3Hkf7EbSyh+0WQt8LUrDiSUMjppHOex
         UYlg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=pzhKYbYm;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 71si5739533ybe.370.2020.06.19.07.52.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Jun 2020 07:52:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=pzhKYbYm;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:41176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jmINr-0006QL-9w
	for alex.bennee@linaro.org; Fri, 19 Jun 2020 10:52:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jmIMO-000446-7k; Fri, 19 Jun 2020 10:51:16 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:34504)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jmIMI-0003gT-N0; Fri, 19 Jun 2020 10:51:13 -0400
Received: by mail-wr1-x444.google.com with SMTP id v3so2477572wrc.1;
 Fri, 19 Jun 2020 07:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iBPUxckhtWZbcMu6/ZTaa1aw+MkUGsnzLuvvoya/1F0=;
 b=pzhKYbYmmmmHXSWQ2RLMrfyLJm6OQ56jWtnAzq0ocx+ED/9+drBnGjoxSF4V65Aq7p
 tkpg5inKW62B81F0P6Ch/s4O716TFBPGABBJP06+lsup16bHB9Psa82sHh7/Fm3qP0x/
 qdePjcaWPNf13ycJGAEV6KxKzJTWpo7dfkTIfydQam2LVcnKe/kShgD+BwjauS6Fu/ef
 KVb9PTR8sDCTf3r0vA55X9oc0Jtz470okXbBmZhQTyrySbO+WXOh0NzqbFLqIiCWfSQj
 muT5v06mjz32bVc47RxoMvqOQjgaWrfIuhfSRr34Nn1dnXpMp6WAcnBgltAAACeJOvZ7
 fyGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=iBPUxckhtWZbcMu6/ZTaa1aw+MkUGsnzLuvvoya/1F0=;
 b=EvSMbqV6YuMMhOYSOaoWkahZid+8yE/4B8L2jlKcegnQo6S6bwZ5m0SLZ4LIG+cUGY
 oInDw3x68K7m27xuBJ7D+LlJLobHtwOYqSe2muF80i3KvNXB0iPvAZM3RJ3++Bxm1IzJ
 LVwEIZh0b+wID4zpsoHSnnlscY0VCJmeVGAMM4Q6yaZ9573/5ZCIokU8M/YgLx3s7jif
 ASLwAYIw+BXE8MT+EuplRoqHKRVqlRNDMGkGorhazvsULz/hGPWmwMXpSM6C1f2x2/gm
 gXQaL+7untndA/xI/UgYARMLr34wLCNe3T6tiT6n0wnjzcft5Sj+oAMVo7TaHK9KjQXn
 /5tw==
X-Gm-Message-State: AOAM531bKsdZ/YO4WfAmHwzNFV8ZB02If03e2VWUPdIS6N6ratuALceY
 f4k+qu2El21WYBBnqhdvIaF32M9c
X-Received: by 2002:a5d:4385:: with SMTP id i5mr4436175wrq.420.1592578268521; 
 Fri, 19 Jun 2020 07:51:08 -0700 (PDT)
Received: from localhost.localdomain (93.red-83-59-160.dynamicip.rima-tde.net.
 [83.59.160.93])
 by smtp.gmail.com with ESMTPSA id e12sm7512548wro.52.2020.06.19.07.51.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Jun 2020 07:51:08 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 4/4] hw/misc/pca9552: Trace LED change events
Date: Fri, 19 Jun 2020 16:51:01 +0200
Message-Id: <20200619145101.1637-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200619145101.1637-1-f4bug@amsat.org>
References: <20200619145101.1637-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x444.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Joaquin de Andres <me@xcancerberox.com.ar>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Esteban Bosse <estebanbosse@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pjW/8fqAkcqd

Emit a trace event when a LED change its value.

Example booting obmc-phosphor-image:

  $ qemu-system-arm -M witherspoon-bmc -trace pca9552_led_change
  23367@1592575218.896117:pca9552_led_change 0x557cb6896d80 LED id:0 status: 0 -> 1
  23367@1592575218.897072:pca9552_led_change 0x557cb6896d80 LED id:1 status: 0 -> 1
  23367@1592575218.897487:pca9552_led_change 0x557cb6896d80 LED id:2 status: 0 -> 1
  23367@1592575218.897855:pca9552_led_change 0x557cb6896d80 LED id:3 status: 0 -> 1
  23367@1592575218.898256:pca9552_led_change 0x557cb6896d80 LED id:13 status: 0 -> 1
  23367@1592575218.898663:pca9552_led_change 0x557cb6896d80 LED id:14 status: 0 -> 1
  23367@1592575218.899138:pca9552_led_change 0x557cb6896d80 LED id:15 status: 0 -> 1
  23367@1592575281.593379:pca9552_led_change 0x557cb6896d80 LED id:14 status: 1 -> 0
  23367@1592575282.102994:pca9552_led_change 0x557cb6896d80 LED id:14 status: 0 -> 1
  23367@1592575282.613558:pca9552_led_change 0x557cb6896d80 LED id:14 status: 1 -> 0
  23367@1592575283.122774:pca9552_led_change 0x557cb6896d80 LED id:14 status: 0 -> 1

We notice the LED #14 (front-power LED) starts to blink.

This LED is described in the witherspoon device-tree [*]:

  front-power {
      retain-state-shutdown;
      default-state = "keep";
      gpios = <&pca0 14 GPIO_ACTIVE_LOW>;
  };

[*] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts?id=b1f9be9392f0#n140

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/misc/pca9552.c    | 15 +++++++++++++++
 hw/misc/trace-events |  1 +
 2 files changed, 16 insertions(+)

diff --git a/hw/misc/pca9552.c b/hw/misc/pca9552.c
index 50c149077d..096ec3112a 100644
--- a/hw/misc/pca9552.c
+++ b/hw/misc/pca9552.c
@@ -62,6 +62,16 @@ static void pca9552_update_pin_input(PCA9552State *s)
     }
 }
 
+static void pca9552_update_led(PCA9552State *s, unsigned id, unsigned new_state)
+{
+    /*
+     * We display the state using the PCA logic ("active-high").
+     * This is not the state of the LED, which signal might be
+     * wired "active-low" on the board.
+     */
+    trace_pca9552_led_change(s, id, !new_state, new_state);
+}
+
 static void pca9552_display_leds(PCA9552State *s)
 {
     uint16_t leds_status, led_changed;
@@ -86,6 +96,11 @@ static void pca9552_display_leds(PCA9552State *s)
         buf[i] = '\0';
         trace_pca9552_leds_status(s, buf);
     }
+    for (i = 0; i < s->nr_leds; i++) {
+        if (extract32(led_changed, i, 1)) {
+            pca9552_update_led(s, i, extract32(leds_status, i, 1));
+        }
+    }
 }
 
 static uint8_t pca9552_read(PCA9552State *s, uint8_t reg)
diff --git a/hw/misc/trace-events b/hw/misc/trace-events
index 5d9505ad0f..29892c8b28 100644
--- a/hw/misc/trace-events
+++ b/hw/misc/trace-events
@@ -209,3 +209,4 @@ grlib_apb_pnp_read(uint64_t addr, uint32_t value) "APB PnP read addr:0x%03"PRIx6
 
 # pca9552.c
 pca9552_leds_status(void *object, const char *buf) "%p LEDs 0-15 [%s]"
+pca9552_led_change(void *object, unsigned id, unsigned prev_state, unsigned current_state) "%p LED id:%u status: %u -> %u"
-- 
2.21.3

