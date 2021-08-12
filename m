Received: by 2002:a19:c144:0:0:0:0:0 with SMTP id r65csp194658lff;
        Thu, 12 Aug 2021 02:41:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw4HB9r43f08R4AlwHhDzgDaPGfjP7qxafbGZCR7jK5ICbE5DKOSu+jZ8cXjvkY9Lc6lcAO
X-Received: by 2002:a02:2a88:: with SMTP id w130mr3006245jaw.60.1628761285556;
        Thu, 12 Aug 2021 02:41:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1628761285; cv=none;
        d=google.com; s=arc-20160816;
        b=xdULJWdHzd6GqYKmdIJPjJpBGymNeVu+soEPOqlPWm5eDwbdEdEh9Fo27tiE7XVc+B
         ZpgMwn+nWOHPNW5nxuIsH+VQL4ORN7FKFRqVFpw0Qmox6EVUIyFfJEdA2vNmaANy4e0n
         TY3DAhm3syF4B0AC+jLeAhbS8yG+f/rZalZX3ZiGPZdy+AUc9hHLgt+0GTeT/SuKbmlD
         /j2+WVDB3rM2ut4ueFAwQKeSIfhO3saS5brYrLp7d+HVyxeqhINByUUAeWl4IeDEZ4uC
         QPwhtsDh4D4e2HH5qNVUhHZLmqSBy2xB6jRAuKs/1VWBaZADoEeMzH4PNBfUB53j5xdg
         /7/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=UWrCXYmtjRAj4C2W/jwTV681ZVj1OFk4kh1hAJn5cf8=;
        b=ug94rl00/4qxBuPXNsRBlFt7TbQV7l4c8etKY/GHOhi1EsyEtfWAB+QJo/4Dg3WPDp
         w1QqcP2WCrnJMgMSlPm0wMtZ38fsL1Zg4x03PJoq8/FH8I+JenkugXc//e/TJS5Ze8lZ
         MPmuOzbGtEUkszcfFnNBvYysjgK2iYDGnHJJsTcgN/8wbFFToTja3N8lvnfnSc5sEqdW
         Nma2MEUFPGjBLls5QarnfyEWR+HsUAhn0NyZ8dGv2iZha+WD7WWXr8tOuZg9OKmjqrOV
         YXpdPXXeD/M/5ikHaqF93JvuMSwMO6sojuARLovc37f4FrtZNyy/Q/yYzrZ6JUq5Hdbz
         Ilmw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ldLtkpcQ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l10si2425297jap.106.2021.08.12.02.41.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 Aug 2021 02:41:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ldLtkpcQ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mE7DI-0002Jc-Of
	for alex.bennee@linaro.org; Thu, 12 Aug 2021 05:41:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mE76S-0005iF-5Q
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 05:34:20 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:53052)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mE76P-0007zP-4r
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 05:34:19 -0400
Received: by mail-wm1-x32a.google.com with SMTP id f10so874963wml.2
 for <qemu-devel@nongnu.org>; Thu, 12 Aug 2021 02:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UWrCXYmtjRAj4C2W/jwTV681ZVj1OFk4kh1hAJn5cf8=;
 b=ldLtkpcQfIO4X9+Fs0T3dRlRaZw9qUzoA3obUNyGcTPXsVSuU/7VIN1FC7AZ7OJqe4
 czs9/8JexnaqVQrk0qQNYMW+6EGjEXosVauGqOZSMO0MNqcworSvhWjNUafGyP1JjW0/
 +498IjTp2iuNBFZJBB51gk3SL7GKMzUq1pnek6HsM1zUI7ZbLGNeV1RZACKrbTuGuFo5
 z2X7Xzniy7U+GAD1srek2QRXHjKb1ZZrA+YxtjRCdce4DM2ikeehVnv6DoybgHCYAp5V
 Fvhl7KwreuhB7wm+Ezhbw3e7E3s/ZEXXi7huPy7+LX2A9u30RFdNfOPGdRTSc3zu21tg
 3Z1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UWrCXYmtjRAj4C2W/jwTV681ZVj1OFk4kh1hAJn5cf8=;
 b=q3YHulR70Lhx2DRWJ9zO+YdsjTQ71S2n46/rSjAX9UDSVfACvXSpofEKPUN/e+fiJX
 c9LRtzfHCb4fFRPaeM+uTvJvg2NVoJkp89INbb419T4exGJKrMk14YQJuIVrvnik00Ss
 v29xx6arAGzhpj3Qb7a6wGiNRa9v4B95jCrZQdG4DDgq8TCCIWUpSuCt+8lPaR0+k8W3
 wtaH/syD/HSVhJWaKmKVeLF22HGwdh228gvhcpg0WeOitkXYZqD2m5TO8AvWkNa+aY0p
 i7F6x5meYotKqsxtFg3k70COnaYWVSJjCwcwuPOm2QJ4bblrSdlthmfZRp+HflsXOTli
 e+rw==
X-Gm-Message-State: AOAM531Wt07Hc3QEJFkjkqMeQ+nN9xHqRAc23zrzd9fNUbykAwaTpAbZ
 q9DerV6WoWMWXaijBoVUPbgtnA==
X-Received: by 2002:a05:600c:19cd:: with SMTP id
 u13mr10377886wmq.143.1628760855171; 
 Thu, 12 Aug 2021 02:34:15 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id l38sm8158506wmp.15.2021.08.12.02.34.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Aug 2021 02:34:14 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 17/25] hw/arm/stellaris: Wire sysclk up to armv7m
Date: Thu, 12 Aug 2021 10:33:48 +0100
Message-Id: <20210812093356.1946-18-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210812093356.1946-1-peter.maydell@linaro.org>
References: <20210812093356.1946-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, Luc Michel <luc@lmichel.fr>,
 Alistair Francis <alistair@alistair23.me>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, Joel Stanley <joel@jms.id.au>,
 Alexandre Iooss <erdnaxe@crans.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ow3kmJOVUpLy

Connect the sysclk to the armv7m object.  This board's SoC does not
connect up the systick reference clock, so we don't need to connect a
refclk.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/stellaris.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
index bf24abd44fd..8c8bd39e2fe 100644
--- a/hw/arm/stellaris.c
+++ b/hw/arm/stellaris.c
@@ -1322,7 +1322,7 @@ static void stellaris_init(MachineState *ms, stellaris_board_info *board)
     DeviceState *ssys_dev;
     int i;
     int j;
-    uint8_t *macaddr;
+    const uint8_t *macaddr;
 
     MemoryRegion *sram = g_new(MemoryRegion, 1);
     MemoryRegion *flash = g_new(MemoryRegion, 1);
@@ -1364,6 +1364,9 @@ static void stellaris_init(MachineState *ms, stellaris_board_info *board)
     qdev_prop_set_uint32(nvic, "num-irq", NUM_IRQ_LINES);
     qdev_prop_set_string(nvic, "cpu-type", ms->cpu_type);
     qdev_prop_set_bit(nvic, "enable-bitband", true);
+    qdev_connect_clock_in(nvic, "cpuclk",
+                          qdev_get_clock_out(ssys_dev, "SYSCLK"));
+    /* This SoC does not connect the systick reference clock */
     object_property_set_link(OBJECT(nvic), "memory",
                              OBJECT(get_system_memory()), &error_abort);
     /* This will exit with an error if the user passed us a bad cpu_type */
-- 
2.20.1

