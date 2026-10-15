Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76DA4CC6B33
	for <qemu-arm@archiver.kernel.org>; Thu, 15 Oct 2026 10:31:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xHIeM-0001Iu-Pz; Thu, 15 Oct 2026 06:25:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xHIeE-00017k-8P
 for qemu-arm@nongnu.org; Thu, 15 Oct 2026 06:25:18 -0400
Received: from mail-wm1-f51.google.com ([209.85.128.51])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xHIeB-0003g3-OP
 for qemu-arm@nongnu.org; Thu, 15 Oct 2026 06:25:17 -0400
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4a171b677d2so32034625e9.0
 for <qemu-arm@nongnu.org>; Thu, 15 Oct 2026 03:25:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792059914; x=1792664714;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=FE9EBUZhqaKkcddPc+39V0rw7VbXhB6SBbD4e6broq8=;
 b=jvf2vvVEnK19bBi66TVRfNnmDiMkUrllXSUr5Hpqy5UeupNqpWgdXB+w3yVtHmj0Oj
 QOvuM/EIRgLcpxaqroJ9stVSbn1lc8HQmTgI3Y2UT5vxf7/YvWzwjd5R8oEE9jEDBvE4
 vlcVjtZgXKCZaRJydch0RnSI0tJNC+OyNzI9xbBevhppJkQG2pS+NJ6moMFmkkU0disq
 QaA7d9aJBSZG54G+RFjXCq4fZ0jY7WD2GU/B29bAGQ5ENgysZTN4oIDCoEirxbo7fCti
 hGVudYdjcY9ngjKkYjCD9ezYBqKBq7NB1VzUG0bpLVXfbxMINdm7xkHST5djZqst2up6
 LN9Q==
X-Forwarded-Encrypted: i=1;
 AKwUvBzpkWaiNhfn0KlKhuPAHqsUamqkBXss0N8c8FAXeMFUVO68o8cpHFHaxc9uo97QthS7/zNOP59blg==@nongnu.org
X-Gm-Message-State: AFq9FYIZeQAkn6ragVimuUF+hsWCJvug4JWlZep6xaVitGnAmVDE0Rux
 cObYA7F+/E1B3LN/aXjUIkbQlDgBYGfjSNDM2BhTQpy9/iOX4DOcgT+B
X-Gm-Gg: AYBFou0MLBIBBfuZKiFkoy4pALr2OkXPYu4R3ZsjgfCfEstFUg3F2cRZNI4UdDXnMSt
 TvqE5jrKfkzn0VW9PrsWmO8ZCDh3sCdjb02Y1TSmvW1rID3RwI8Jyb4l1qRkD/e2UMqXagNT1tF
 e8bBnFgbFIjVB4TSSC6bYQrz4be/+xo6Fyq3yrUlWuzeIxTAKKg5TP364D9ZjL3RHpZ6hd+yfP8
 vl6iArpnMveuDnF/PHW917nvFtZOX4gZRct56Bofw24HK0oNlFFyPTUkCIvt/rHDdb/q/3i6XFp
 H1vvVW6ueIWWaj3kcnKgw8l62ZPMqweNWV7rcg1pnuFItNrDjLxibEocyamGQYFifQlY2cd0EHb
 gETe261HFu5VaKsBkNem1C/CkYHFejGrTUL9/mHgbSv2cPiOGS9UL7LEXVQsaODCu9X5UJ6lo3O
 OV69GQAH2iZ1rnqt3vufIrk4vC7chtDRUFCrCByTJUkgKiAy6che2sOkycnev6aHvAmFRg+4F/B
 c8MkQ1UaVhTojK6wGXhfJBUs3GDcqaywOWhtVh91rLULw==
X-Received: by 2002:a05:600c:8b01:b0:4a1:c4d3:2fc0 with SMTP id
 5b1f17b1804b1-4a1c4d32fe7mr12605005e9.6.1792059914206; 
 Thu, 15 Oct 2026 03:25:14 -0700 (PDT)
Received: from localhost (89-93-216-19.hfc.dyn.abo.bbox.fr. [89.93.216.19])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1bd96fed4sm61331865e9.2.2026.10.15.03.25.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Oct 2026 03:25:13 -0700 (PDT)
Date: Thu, 15 Oct 2026 11:27:57 +0200
Subject: [PATCH v3 10/50] hw/rtc: ds1338: implement Resettable reset
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261015-bmc-minerva-v3-10-7d50c8a108e5@free.fr>
References: <20261015-bmc-minerva-v3-0-7d50c8a108e5@free.fr>
In-Reply-To: <20261015-bmc-minerva-v3-0-7d50c8a108e5@free.fr>
To: qemu-devel@nongnu.org
Cc: =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>, 
 Jamin Lin <jamin_lin@aspeedtech.com>, Kane Chen <kane_chen@aspeedtech.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-arm@nongnu.org, 
 Patrick Leis <venture@google.com>, Fabiano Rosas <farosas@suse.de>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, 
 =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>, 
 Emmanuel Blot <emmanuel.blot@free.fr>, 
 =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792056475; l=1388;
 i=emmanuel.blot@free.fr; s=20260602; h=from:subject:message-id;
 bh=Yb1Zh34x6jrS484Xx/w7PuZZxma8LedPKe6tazap2S0=;
 b=SnOmwT7Zf8wEjEhQ9q5+5OYXjUkHVzgPRC4uRFLHLhKjBjCeOBnlqp61QxMFGSrZzocihtQvF
 QjyJPKbe9BpBHu3ThZUodPNKfvRzjtg8s0FevwM230g0L9sKfFjLkCY
X-Developer-Key: i=emmanuel.blot@free.fr; a=ed25519;
 pk=0qFrZ21FAAN8OfVsSoVcCFTk/NMYOWzxJz4paSAVm0g=
Received-SPF: pass client-ip=209.85.128.51; envelope-from=eblot.ml@gmail.com;
 helo=mail-wm1-f51.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.001, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-to:  Emmanuel Blot <emmanuel.blot@free.fr>
From:  Emmanuel Blot via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

The device relied on device_class_set_legacy_reset(), a compatibility
shim around the legacy DeviceState reset hook. Convert ds1338_reset()
into a proper Resettable hold phase, dropping the legacy shim.

Reviewed-by: Cédric Le Goater <clg@redhat.com>
Signed-off-by: Emmanuel Blot <emmanuel.blot@free.fr>
---
 hw/rtc/ds1338.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/hw/rtc/ds1338.c b/hw/rtc/ds1338.c
index f8b3340bf0..74aee6c746 100644
--- a/hw/rtc/ds1338.c
+++ b/hw/rtc/ds1338.c
@@ -208,9 +208,9 @@ static int ds1338_send(I2CSlave *i2c, uint8_t data)
     return 0;
 }
 
-static void ds1338_reset(DeviceState *dev)
+static void ds1338_reset_hold(Object *obj, ResetType type)
 {
-    DS1338State *s = DS1338(dev);
+    DS1338State *s = DS1338(obj);
 
     /* The clock is running and synchronized with the host */
     s->offset = 0;
@@ -224,11 +224,12 @@ static void ds1338_class_init(ObjectClass *klass, const void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
     I2CSlaveClass *k = I2C_SLAVE_CLASS(klass);
+    ResettableClass *rc = RESETTABLE_CLASS(klass);
 
     k->event = ds1338_event;
     k->recv = ds1338_recv;
     k->send = ds1338_send;
-    device_class_set_legacy_reset(dc, ds1338_reset);
+    rc->phases.hold = ds1338_reset_hold;
     dc->vmsd = &vmstate_ds1338;
 }
 

-- 
2.53.0-Meta


