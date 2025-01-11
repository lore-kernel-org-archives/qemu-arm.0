Received: by 2002:a17:504:998a:b0:1be9:327d:8ee3 with SMTP id i10csp896374njn;
        Sat, 11 Jan 2025 10:38:05 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUtRqxo+gjuL/BRgFj7NCt9D6p95UvlulhbX1XM+a95JdjYXsO/rQsVHrIaVtCqu8rAhePBHgYLj/A90Q==@linaro.org
X-Google-Smtp-Source: AGHT+IH1hkY97uqvfqIKEfYAaoXU33dNN04faKYh9cThHzs1dCDoKZNquWQX/cQNJitjEN3ecfy5
X-Received: by 2002:a05:6214:3018:b0:6d8:aa52:74a3 with SMTP id 6a1803df08f44-6df9b24265fmr219706026d6.28.1736620685137;
        Sat, 11 Jan 2025 10:38:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736620685; cv=none;
        d=google.com; s=arc-20240605;
        b=DkUXxXdCjG6OZu6685xPkkeqPceh6nFlGSRc2F0RMEdR1yX6arz2CtU1sC8PR9mtCt
         1wOETUpIrNWZSgMJ8wueyJ11Hh3+Zx0Gum63CO2PtDktkHDBBfOTj2WxjJNq/7Njs0ln
         W0QeKl2XICYjupeV/dfVZsqfUcc/hbQsRCj+RRX++qdJioSldObA8OELYkycpq2bPGy5
         bId4o1CL7kX8Ge9Z9AR68eitFnCX/xz0DYvUmjnCskLbTtzI6Z++oTO5HsPMYXvecFCI
         vwygbQd7r3OYevao7EySbjSh0rygn1iVDIx9QPLQVBzdiyAHP6UrR/vkiKTptj1z4hZX
         tLFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=0PqxDnBjevTT4lcWrIDnfXMGDt0Ne6U2zvgq/38zAcs=;
        fh=IR7wvOTIxJWWmpbZ/uAra2F6wqZ52TpMQR2ZIqVtCWc=;
        b=EXEpp0TLy/xlHUYxrCxSlUrDVHD1gMnPaKZByvGCWtFCEZXZ13J19guGh7ajg4B8Zq
         YWumF7XZUVFF6PX54TaWGantV1nPI2DSyZHjuxQaXFs953QfjMvlOK7BT8sEvFbHpPRI
         9Ot3Y3/tK6AngGBzVw2lv6pw8wmy1Gm6obxxcMhBJ4corhGvSqLsUkI0KLGHz60eARBm
         b3qCWn4ZGwVCN6Fv9qNhb6RHCuKMZ+jCcVdwOCWRV7F3V1etp9iS/iKRQpY3qROBl2mR
         AjxyaRlI0/1ThM+xiggJYqCFapzGXuMMDmnRN9OdUzsW+4sFj7sT5DnrnpAu5lGqeCOh
         4KaA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=bct1y9rZ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46c873fde55si49294541cf.377.2025.01.11.10.38.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 11 Jan 2025 10:38:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=bct1y9rZ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tWgMU-000733-AX; Sat, 11 Jan 2025 13:37:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1tWgMS-000713-7n; Sat, 11 Jan 2025 13:37:28 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1tWgMQ-0003uH-R1; Sat, 11 Jan 2025 13:37:27 -0500
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-aa6a92f863cso592340566b.1; 
 Sat, 11 Jan 2025 10:37:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736620644; x=1737225444; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0PqxDnBjevTT4lcWrIDnfXMGDt0Ne6U2zvgq/38zAcs=;
 b=bct1y9rZGKD2nbX2nL8QvscPDpf+dL9dVsV6OcRMSBz1mO0/qIeheyvd6Q8NoUPrli
 9nIo6I8yBX93JryBByTD+v0uUbUNtudwigx+b2vyzsqQC/lKSrJRg/ux7FgOwITiakTh
 xpzMyCzrzwWXmhWVj2WbC5COBg17WMFOtI1suzVdugpTKNwVrWUgH69Y0sQWyAzhw/dr
 8e016uioHKP4vtVTLH0spHNLJbipzttgM6H51OEFCAXuQyToqp7tfRCHxshvh694IWVd
 /ygmVRWvMAB5SfYKpK4rNaAyKIlNQ+fjUFiaWb3KE52gKU/POmQ+FBeMqCDwyte87Il/
 KKvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736620644; x=1737225444;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0PqxDnBjevTT4lcWrIDnfXMGDt0Ne6U2zvgq/38zAcs=;
 b=mEHWPZZgvQb2H/SZjXN9+9rlY7pxsd2GFZg8rz+qq7Gd7xoTtueR0kIanu2cTSwIVE
 epcA1qrUa6vZpAOCRCF0SxoqUFGhXrXA67Wj7WsTAFMs3yxZMorBZIYwJfuqp/eap5Nu
 bZBFcrdORiUTpxBnPK07v6FoKzNqAVFj4GsXiTbB+ZCW2tqJ0UM4KlBmHA/Uz1cNbiAB
 3A4UEJNIN90EUu3U5NNT85cmHoPqEMbWpWxMtSNZn2uQsObTXRSQUuOUsb7QgNbOigVK
 IUfJPOkR/RpIL5Hw6noTRZvm8jRhV8ooS3tjeulKNr/Xp50GWb9x/Wf5tk1+l6f5Z9pw
 DjGg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8scoBbj8F+lwXctejTUlbLdQW/dTog+k89MBMsO2t7rjvoPMQeQIw7fbT3lflriVqbtUjua7wpg==@nongnu.org,
 AJvYcCXAJGCisDJL99uqyO1FFprdhLEnk6pzapiSNYJJxCr4XfWyfraUqT1mzhysehEsywC/4JxJazPgw9uupw==@nongnu.org
X-Gm-Message-State: AOJu0YzHMaaVncs6uqEAx8TI9Bl/WK43XnhjhdbcB9An+9BdQFdbcxTb
 E9Ah3asdVMFsltqUWDh0wMaORlyg1PfO0SSI9uPGgEol2BquBHFBX4UzyA==
X-Gm-Gg: ASbGncvj+GC35E2MU3yM2IuUY2u5y/08g7GGCxWOuW1I0i7814y7AGC5b8ao75Z9ARx
 PONGxM3EqcbOAmslH0KhwkTMnnCOu88XR+mnP6jWzlW51gUc6vvzbe+Mq4UXZXaSmAiZiRl0K0B
 MfdcyEovZCU+qGb+AVwT4wqWBxBdhr+k8tTxRaRijSTPcj0sgyE1ACLWxqpKryjbFoQjDcuo8/Y
 dBGZRe8lnMJeNJPdvH2oqFRv50kFIsRGeQcTwXpxEu8858K/zOaJZqThBj32N9g1eCwfXD/yBKz
 MghtSd7dgDJBtVVfaipMtjxTQGaEz2exsd8dpAEIpaI=
X-Received: by 2002:a17:907:1c21:b0:aab:d8df:9bbb with SMTP id
 a640c23a62f3a-ab2abc925cbmr1429988466b.41.1736620643942; 
 Sat, 11 Jan 2025 10:37:23 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-078-054-101-099.78.54.pool.telefonica.de. [78.54.101.99])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab2c95af187sm299026666b.142.2025.01.11.10.37.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Jan 2025 10:37:22 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Fabiano Rosas <farosas@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Guenter Roeck <linux@roeck-us.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Laurent Vivier <lvivier@redhat.com>, Bin Meng <bmeng.cn@gmail.com>,
 qemu-block@nongnu.org, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v2 03/13] hw/char/imx_serial: Update all state before
 restarting ageing timer
Date: Sat, 11 Jan 2025 19:37:01 +0100
Message-ID: <20250111183711.2338-4-shentey@gmail.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250111183711.2338-1-shentey@gmail.com>
References: <20250111183711.2338-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x634.google.com
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
X-TUID: 6kCiFTOjfPvp

Fixes characters to be "echoed" after each keystroke rather than after every
other since imx_serial_rx_fifo_ageing_timer_restart() would see ~UTS1_RXEMPTY
only after every other keystroke.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/char/imx_serial.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/char/imx_serial.c b/hw/char/imx_serial.c
index f805da23ff..be06f39a4d 100644
--- a/hw/char/imx_serial.c
+++ b/hw/char/imx_serial.c
@@ -381,14 +381,14 @@ static void imx_put_data(void *opaque, uint32_t value)
     if (fifo32_num_used(&s->rx_fifo) >= rxtl) {
         s->usr1 |= USR1_RRDY;
     }
-
-    imx_serial_rx_fifo_ageing_timer_restart(s);
-
     s->usr2 |= USR2_RDR;
     s->uts1 &= ~UTS1_RXEMPTY;
     if (value & URXD_BRK) {
         s->usr2 |= USR2_BRCD;
     }
+
+    imx_serial_rx_fifo_ageing_timer_restart(s);
+
     imx_update(s);
 }
 
-- 
2.48.0

