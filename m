Received: by 2002:a17:504:998a:b0:1be9:327d:8ee3 with SMTP id i10csp6271405njn;
        Mon, 20 Jan 2025 12:41:42 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW8lXjTRt9vVuAYhT1nM6N9IiEHmGrh3/wY3ZFne/ZZQ16r4pFtbfUt4klPie5FR/NVvJUIFWebWdfdMg==@linaro.org
X-Google-Smtp-Source: AGHT+IFDaGB2J9UEhz8AUAIk41K+WhCTt2XvMqnT+rVx2cGdhOMd8y3+ld0Fn/3J1YUwu70Zjn8Q
X-Received: by 2002:a05:6214:1306:b0:6cb:e648:863e with SMTP id 6a1803df08f44-6e1b2235398mr226653616d6.43.1737405702255;
        Mon, 20 Jan 2025 12:41:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737405702; cv=none;
        d=google.com; s=arc-20240605;
        b=Xs+paOF6FSMO7q7E8eRw2ILHji3gqdODhEonP+O/hqF36Yy16CvJCPGfWKCvjat2iu
         jdPabhvab6rUkfBLz5kY5eTAhqO3sVebfcz2PA+RTQdbxamkS8SHGvTsTdYA/5c1cw5E
         qSDHQfUle9cdqOVHGIqDwKqT+hQBjbu2jBAGBqTslX0jpUP+8cpDTwqhm6U8Nwnbgisy
         eYjD17oFlaK5ls/nb4PqAmm2av3D67aF1/oLb//PecpBE2NrXuLpUXs2nwecMquVFvSn
         4CiF4gylXihhSlcSsyGthHP82cUgkLriOZQmBhcWCaCSXGQhyeWrBorRQ4zcuWqR5qa0
         S+FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Dduh5qxzvgywVTMZ79RZj2ewixgRwgKTdJW6HsnUmTY=;
        fh=vWaJ+/02MvVIDHKioGhIhtRKbo9zdQ8z/Zl24bUYGOY=;
        b=V0fqWDoCKzNk4np15jrObmoVTrYBDvO9DqxeffVnrgaLknnUZMXAfU8g6WWSBvACOD
         vILYjEDpU3v6UzlCQx3lm71fMitco+uiZv0isMeoQVHCcN62Tf6o/nIoMqpU5NDR/ii0
         swpi9e9GQeNc7Zi66p/QDvyKayawQ3S69HAZlJcCrWi53fqOiGgbRkYmdHLn/XQaMQ3n
         VV7C8QMD+yDL+4qmCYBNObhJRQKsC03DGQuMk+wnn6H450KsPfW5viaeJe0Q8+ox7KQH
         juFhQliZVYCJXUBagR2xziGniUC2HHN7w1awaxVO91ricCu9gwZ+JGKWZMriYEb8Mgm/
         QH/A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=LQeKg4Hv;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e1afc006a5si107057466d6.55.2025.01.20.12.41.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Jan 2025 12:41:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=LQeKg4Hv;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tZyXj-00048O-Ju; Mon, 20 Jan 2025 15:38:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1tZyXW-000459-EU; Mon, 20 Jan 2025 15:38:30 -0500
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1tZyXV-0002ac-14; Mon, 20 Jan 2025 15:38:30 -0500
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5d96944401dso8752993a12.0; 
 Mon, 20 Jan 2025 12:38:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737405507; x=1738010307; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Dduh5qxzvgywVTMZ79RZj2ewixgRwgKTdJW6HsnUmTY=;
 b=LQeKg4HvlHJ1q90PlT6FXHOpo/i6xAM6CBd9lvnMi3P4HZWOgqadfJpEJ0z1nwy8P+
 w+gJaIihI7m1aU+c4ivxwCCZ8jIZXmHNjcLUztYOva/OGsoaxyddkl2q2fdyJuJvf+h7
 3FOP7oTkztQMRjGfKE2+uX0FVCZBLce8LqOPMjeedXww8fJudXAzDcezzjjCKo5HW5so
 K9CYmwvXZgwMTNsabG9Ct6cKiVMLRL8jX1AeKNi8ulqOzQh4rTY/iYkvsLSb9izOZnSs
 orKUKotuWeig0HVco1Xyu745qjeIDjgdDEwUylzR60Pi6LQJ8vGxffrbN1LgsYNamKcf
 2FyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737405507; x=1738010307;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Dduh5qxzvgywVTMZ79RZj2ewixgRwgKTdJW6HsnUmTY=;
 b=MMwKxaVjVsc+Z6LR7QEbEXdEanCBISqIXaxE03dNr+2TMV7cZ6NfJ5PMQ8KsZcVN8H
 Uh0m+lSk1FzjkdMGN3SGwGwpaMOJyrulOsldyVXqs8AX8OsmodC05hM7+bPDExNsPZqI
 W7y4fdo3WUUOHDaQSAhpYQ2w7BcSga0uFZ+IEgBi0/DP7m4YSX5BWZbIWfEydtlFvvbd
 IV9/O1m5W9cLT1mGq4IDehkfptoLz5xuZXXku+uDj7lWhAizElGYt6SX2w6eJvTFFcLi
 KumYvq6KE66MjaDE5OTNr0zzzi/zXvrncuNl8mHZP2LxZRLNIUjvTHjzZjMF0Sw3L7Dz
 yCkw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWG1fFhpDkMGAF8QKX/w+UuZwTFOzCwaWL+BRmYEAT44ALCfW+93Gt5G1AFLbDR2GcqQM9jbL1HQw==@nongnu.org
X-Gm-Message-State: AOJu0YzwSqKYv8GMXP59V/cF/mF4oaNJiHhErgWLjkAbgvU3O4EjH67v
 OYDIwVHgLvFh7N2Vl7uhM2DoRM7raTg5k/5PDRY2XFD5r9CZH03xTrGN0Sf5
X-Gm-Gg: ASbGncvub88i6gwxR0T//6DL8sIR7u9KrveVRtdckeBB/J0lX9YJXhjG1FB+DGtZrHy
 NAhyaq5wCu2wNdTKa6Ql0kwSV7Yu6NecWeuHuHYOrZjoXx7Rds7UH3VjEJx1PXumtyb1t7XeWqO
 kdlHdo3KQRk6XEAm/ZYdqqQDW+rbKqgN50tUpgoHMpst9bJDWV+bOyTWw2xahS4pDC123yJKai6
 nSSeJvbnu5Fuib1o3g/mcskspHJMJhsTmClRuHf8U8ADF7E9/ct9M6kntG/lX/bf/xt7v1Sbx79
 xlT61MsRLtYj8sxDzAEgVt7trze+WytwdigzymlO8aVmsTV7Bw9qwcQ1BlKL
X-Received: by 2002:a17:907:7243:b0:aa6:87e8:1d08 with SMTP id
 a640c23a62f3a-ab38b0b9b3amr1278335866b.8.1737405506640; 
 Mon, 20 Jan 2025 12:38:26 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-077-183-181-102.77.183.pool.telefonica.de. [77.183.181.102])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5db7364258csm6021077a12.1.2025.01.20.12.38.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jan 2025 12:38:26 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm@nongnu.org,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 21/21] hw/gpio/imx_gpio: Don't clear input GPIO values upon
 reset
Date: Mon, 20 Jan 2025 21:37:48 +0100
Message-ID: <20250120203748.4687-22-shentey@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250120203748.4687-1-shentey@gmail.com>
References: <20250120203748.4687-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: tTXikOzxD0Ra

Input GPIO values such as a present SD card may get notified before the GPIO
controller itself gets reset. Claring the input values thus loses data. Assuming
that input GPIO events are only fired when the state changes, the input values
shouldn't be reset.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/gpio/imx_gpio.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/gpio/imx_gpio.c b/hw/gpio/imx_gpio.c
index 549a281ed7..25546221e0 100644
--- a/hw/gpio/imx_gpio.c
+++ b/hw/gpio/imx_gpio.c
@@ -298,7 +298,6 @@ static void imx_gpio_reset(DeviceState *dev)
 
     s->dr       = 0;
     s->gdir     = 0;
-    s->psr      = 0;
     s->icr      = 0;
     s->imr      = 0;
     s->isr      = 0;
-- 
2.48.1

