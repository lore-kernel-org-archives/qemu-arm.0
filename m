Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F632C54F54
	for <qemu-arm@archiver.kernel.org>; Fri, 31 Jul 2026 12:27:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wpmKK-0002Ol-N2; Fri, 31 Jul 2026 08:27:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1wpmKI-0002Nl-CQ
 for qemu-arm@nongnu.org; Fri, 31 Jul 2026 08:26:58 -0400
Received: from mail-ej1-f42.google.com ([209.85.218.42])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1wpmKG-0007X6-Sy
 for qemu-arm@nongnu.org; Fri, 31 Jul 2026 08:26:58 -0400
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-c1c52d920b8so130908666b.2
 for <qemu-arm@nongnu.org>; Fri, 31 Jul 2026 05:26:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785500815; x=1786105615;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=3wENbpzNy+/7ZpZ2nV5lBBRvhyhYJ6tzgYJmt0GLaJo=;
 b=F6g7P613UOfu0pLNS2kplOv/De2JxlRVfuyN1onePO6NMv29dO9JW7o9DbC71Ezx2U
 bK7D2yGduc8h2hqgKindi49B6saQRZIl8vOV7ijwkHgYTmg3jSEjqYxzHvFjfyFJkgkX
 YGpb0oo/7fuwNYbb0V3OhpmhFCGxWQI8rLd2uQ1sIs8AJDCyOEgNnboBrUOXSMRXQDy+
 lHRsuo1LDbSMy/44qbRMvX5Dkw6dxAHRv7p0PrANF2vN7DQjHNhxMDd7QGEUq7hsD7Z+
 BwvUjMI8dTYI6V+Tr91p1A/x+nJJeiEVYWmKk3nKqi6gjG2c3gMysXWuYHTCCKY1bicP
 KilQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RqPhkeCTC6ElL6yU59QKfEy49X24eotPgy6BnQXK5B4fOcROBp5cxyDvvkzf2fO5TS5i+74tdvmbQ==@nongnu.org
X-Gm-Message-State: AOJu0YynZoyZYrRoFVO0oIfKfMHds//0p1B7k6kliR8modcIAathTOLJ
 jFFaB+dZ4rXBlpoRO0LF/TInU7jPGA5T6BxzgSL4M6R9b1LVxoVspFRI
X-Gm-Gg: AR+sD11EKafUtVwHC1ooosgkwWP3QM743++m076b0RPJt5tXS9Gk+3rEYri5t1rG8DX
 m6fjxywnRYGXAaFTjSsoxY7Vyxk9VdmLVfMcikuhg1bEIfE/5h22e+u62kRtRHEovIKpyyu3kWy
 jxJucmO/JCK3GiIrcXHtO1nMTtnVKRKx7c8rlWHViQ+DQnr6SJqkOkVjkkWXgnlzglZ+2ry9Snf
 TGIfcBcEuCdoKghW01V9uPYonLIjolgBUR2zGFAyUFliK3CDdS5Wjzj9LHNCFHbRAGtlxJCc5Lm
 6Ghx+09HRwxGn9XmvZfzDzpII4zwIU3XOiyQ/xOoCZfiVaAPfd9ZokQ6xmJaxAm5lz4L/0K4xWj
 l1sS0xfFELz8w8GKzF8BmpF8c0IRH8sxDaO55a32uF41NevjeH+GpBaQuzxsz5dG9q+VHmQ/FL9
 /Xh1Dn0eSddWE7O60DTa7gCKurLJVWKtrKMRRTyAgJPZNuoZW7DgnVG6C4/0Y0qpPVAXRZ6ANWV
 eau6TW9DVPmN4BXmrD2xYRyRaF8XKrsJFcXUOZtyEZ4qTU=
X-Received: by 2002:a17:907:d12:b0:c19:8408:5b54 with SMTP id
 a640c23a62f3a-c1fd23bf417mr107265366b.60.1785500815072; 
 Fri, 31 Jul 2026 05:26:55 -0700 (PDT)
Received: from localhost (89-93-216-19.hfc.dyn.abo.bbox.fr. [89.93.216.19])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47fd458b73asm3745852f8f.29.2026.07.31.05.26.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jul 2026 05:26:54 -0700 (PDT)
Date: Fri, 31 Jul 2026 12:45:02 +0200
Subject: [PATCH v2 03/25] hw/sensor: tmp105: implement Resettable reset
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-sanmiguel-bmc-locator-v2-3-1266926ba769@free.fr>
References: <20260731-sanmiguel-bmc-locator-v2-0-1266926ba769@free.fr>
In-Reply-To: <20260731-sanmiguel-bmc-locator-v2-0-1266926ba769@free.fr>
To: qemu-devel@nongnu.org
Cc: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@mailo.com>, 
 =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Steven Lee <steven_lee@aspeedtech.com>, 
 Jamin Lin <jamin_lin@aspeedtech.com>, Kane Chen <kane_chen@aspeedtech.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, 
 qemu-arm@nongnu.org, Fabiano Rosas <farosas@suse.de>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Thomas Huth <th.huth+qemu@posteo.eu>, 
 =?utf-8?q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Emmanuel Blot <eblot@meta.com>, Emmanuel Blot <emmanuel.blot@free.fr>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785494707; l=1784;
 i=emmanuel.blot@free.fr; s=20260602; h=from:subject:message-id;
 bh=lLLQDRXOnOUwL5qjxtcvmlFJBgBQ1Ly1Z6iI78mZFws=;
 b=6ff3sW5/LgtO78dRx0lJRIDtGD0GUi0ab6nkhIWFAZhkmYWw3OqHtoFaqn+oNOIl+nKXSKQHT
 YnFgxVnnK7rAZPgdpYwAsk1wdSHT0cpL8gWccPbLsW/GSaHFcrpMPs7
X-Developer-Key: i=emmanuel.blot@free.fr; a=ed25519;
 pk=0qFrZ21FAAN8OfVsSoVcCFTk/NMYOWzxJz4paSAVm0g=
Received-SPF: pass client-ip=209.85.218.42; envelope-from=eblot.ml@gmail.com;
 helo=mail-ej1-f42.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.001, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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


