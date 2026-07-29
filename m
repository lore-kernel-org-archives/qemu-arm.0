Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B89EC53219
	for <qemu-arm@archiver.kernel.org>; Wed, 29 Jul 2026 15:28:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wp6Ct-0001TL-67; Wed, 29 Jul 2026 11:28:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1wp6Cr-0001T3-Nc
 for qemu-arm@nongnu.org; Wed, 29 Jul 2026 11:28:29 -0400
Received: from mail-wr1-f46.google.com ([209.85.221.46])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1wp6Cq-00082K-5r
 for qemu-arm@nongnu.org; Wed, 29 Jul 2026 11:28:29 -0400
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-47362928f65so966670f8f.2
 for <qemu-arm@nongnu.org>; Wed, 29 Jul 2026 08:28:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785338907; x=1785943707;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=3wENbpzNy+/7ZpZ2nV5lBBRvhyhYJ6tzgYJmt0GLaJo=;
 b=ZA408nYlbOeh8JWoZjS/R6oY0fyNk72TYPJ9JF4t41+ZnlL0muvkQegVomGVmeOMnu
 XRRagIsCIGRwna9RLoPm7rjyhOoCUhFxh378nM/di7rLIFr2d3gCa2LDBw5j2qyFicPP
 Th8ys0k5a/ANJS5JzRiAx8R6IvETM953QKD/2GQYYRUExCpqZyU/cVAOO/6JwgrVrkdm
 JzuzdhpTSgByf5wYZMVmvWeLhhwuU8eTlEaB3dsMUTcalRsjlNeUWxEQDU1eW2chx/2d
 vyUVWCYoHMMOOYYaTu1jlz8zbJw/JzaNRaLt1vEROPjISLu71FBsLAhDFk4VeLLlE1nh
 Yidw==
X-Forwarded-Encrypted: i=1;
 AHgh+RoG3T4MtnKfIbHjB+QM9xVcP1IatauVrK4dn9WuiRox9IoEquJTeIoGkv2FchN3/Hzdod8c0dm0bw==@nongnu.org
X-Gm-Message-State: AOJu0Ywaxk/HYpgn91MQ+oDWtfeS63enEPQ8E7jfDYWSIZvKtP/O/sTn
 BtH+jBJqHzh9/TMhJjhIDF/l4eOzU7deeRwWkIZiGIOFItdcwXsPTrEA
X-Gm-Gg: AR+sD10FZyF6cjqna0IvzfwG5dJHm6im4wB1HtkHHad7R8+nTdYHJVIRKNi+2vG0XoG
 COTUZuyeC45FmyOBU5NqkIB6G20Yl4lFot8bH3KstmxFHRlTOZ4ozTgZ1LMPdeSfqPc8hu8FI2R
 TEAp1zJ8ShnORdtHTa272qWWtuVRuL36+GQBhUJjn2NdNZ8agFw2aP9NxMx/nPkKPaD+ju2Ez1S
 NYtyQSGJbvahZrhMuQN5uWJFme4pXaCPb/hsEdC45heRFvR6whtXpvs/1UqZVeGufvNp8waC6K4
 ztXeqtq1js0bq0I40HHsOnM+n0qRBN2z4Ia9rzsSTGOb3aau1r0vhPZy42KIZQwi9Je50/XvnYR
 lhHvH20jJ/Il9pFLi9cvn67/d0Qx9wegfFLqQtdrp+spuMWZP4FgICJm49sSLmj4n8AuhK6CIEZ
 lKAA3KOFTXjpEO5iwXZHWOsc2R+AFlaC0n7+uqkRgD0jltg5kQATRbQdKKzocLoZMw/5e6HkExh
 ZXCrtlfrE486sRPQV+a8quPC2MnHCnTzNGAb5S4gqxSseU=
X-Received: by 2002:a05:600c:4714:b0:496:bbce:fc with SMTP id
 5b1f17b1804b1-496c642c8d1mr89151645e9.12.1785338906579; 
 Wed, 29 Jul 2026 08:28:26 -0700 (PDT)
Received: from localhost (89-93-216-19.hfc.dyn.abo.bbox.fr. [89.93.216.19])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-496fa88552bsm47835435e9.3.2026.07.29.08.28.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jul 2026 08:28:26 -0700 (PDT)
Date: Wed, 29 Jul 2026 17:12:39 +0200
Subject: [PATCH 03/25] hw/sensor: tmp105: implement Resettable reset
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260729-sanmiguel-bmc-locator-v1-3-c8f9a8d101f6@free.fr>
References: <20260729-sanmiguel-bmc-locator-v1-0-c8f9a8d101f6@free.fr>
In-Reply-To: <20260729-sanmiguel-bmc-locator-v1-0-c8f9a8d101f6@free.fr>
To: qemu-devel@nongnu.org
Cc: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@mailo.com>, 
 =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>, 
 Jamin Lin <jamin_lin@aspeedtech.com>, Kane Chen <kane_chen@aspeedtech.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, 
 qemu-arm@nongnu.org, Fabiano Rosas <farosas@suse.de>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Thomas Huth <th.huth+qemu@posteo.eu>, 
 =?utf-8?q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Emmanuel Blot <eblot@meta.com>, Emmanuel Blot <emmanuel.blot@free.fr>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785337963; l=1784;
 i=emmanuel.blot@free.fr; s=20260602; h=from:subject:message-id;
 bh=lLLQDRXOnOUwL5qjxtcvmlFJBgBQ1Ly1Z6iI78mZFws=;
 b=wmpAoOb1vlCAo4gw1g3e1nycH1UDUEQCPa2rN2iZNatrvc/BYEHslfL0nBj9iv5JnlHiHWGDy
 WD2Vz50Xe17Bd7GIAeg/wy1qWSviyhqm0WICs7CQRIf9UFPtrywVeD4
X-Developer-Key: i=emmanuel.blot@free.fr; a=ed25519;
 pk=0qFrZ21FAAN8OfVsSoVcCFTk/NMYOWzxJz4paSAVm0g=
Received-SPF: pass client-ip=209.85.221.46; envelope-from=eblot.ml@gmail.com;
 helo=mail-wr1-f46.google.com
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

Previously the device reset routine was invoked once from realize() and
never registered with the reset subsystem, so a system or bus reset left
the TMP105 registers untouched. Convert tmp105_reset() into a proper
Resettable hold phase (tmp105_reset_hold) registered through
ResettableClass::phases.hold, and drop the manual call from realize() as
the reset framework now drives it. This matches the scheme used by the
other hw/sensor I2C devices.

Signed-off-by: Emmanuel Blot <emmanuel.blot@free.fr>
---
 hw/sensor/tmp105.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/sensor/tmp105.c b/hw/sensor/tmp105.c
index aabeb34f08..f7d0c738ca 100644
--- a/hw/sensor/tmp105.c
+++ b/hw/sensor/tmp105.c
@@ -314,9 +314,9 @@ static const VMStateDescription vmstate_tmp105 = {
     }
 };
 
-static void tmp105_reset(I2CSlave *i2c)
+static void tmp105_reset_hold(Object *obj, ResetType type)
 {
-    TMP105State *s = TMP105(i2c);
+    TMP105State *s = TMP105(obj);
 
     s->temperature = 0;
     s->pointer = 0;
@@ -337,8 +337,6 @@ static void tmp105_realize(DeviceState *dev, Error **errp)
     TMP105State *s = TMP105(i2c);
 
     qdev_init_gpio_out(&i2c->qdev, &s->pin, 1);
-
-    tmp105_reset(&s->parent_obj);
 }
 
 static void tmp105_initfn(Object *obj)
@@ -352,11 +350,13 @@ static void tmp105_class_init(ObjectClass *klass, const void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
     I2CSlaveClass *k = I2C_SLAVE_CLASS(klass);
+    ResettableClass *rc = RESETTABLE_CLASS(klass);
 
     dc->realize = tmp105_realize;
     k->event = tmp105_event;
     k->recv = tmp105_rx;
     k->send = tmp105_tx;
+    rc->phases.hold = tmp105_reset_hold;
     dc->vmsd = &vmstate_tmp105;
 }
 

-- 
2.50.1


