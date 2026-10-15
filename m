Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DE1FCC6B3A
	for <qemu-arm@archiver.kernel.org>; Thu, 15 Oct 2026 15:14:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xHN60-0005gE-Fm; Thu, 15 Oct 2026 11:10:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xHN5q-0005Wj-7D
 for qemu-arm@nongnu.org; Thu, 15 Oct 2026 11:10:07 -0400
Received: from mail-wr1-f41.google.com ([209.85.221.41])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xHN5o-0001XM-14
 for qemu-arm@nongnu.org; Thu, 15 Oct 2026 11:10:05 -0400
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-48afbd2c386so3259865f8f.3
 for <qemu-arm@nongnu.org>; Thu, 15 Oct 2026 08:10:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792077003; x=1792681803;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=ICRLGSZ/DEoudJkKLVJVk8LBp8oLkoBLzgOCyFtFqxo=;
 b=UggWiPrtuhBvJVil3pqeyrlHX5Od+7UzCM2srY4B99o3gqY5EbJG7qJOy7xOsLA87h
 lz0aiDUwM15HdaXq9p9JoznA+R0sKpzeTb0sek3dlqG7RkWKUNKanvqPKvxFtTUtsg/W
 fI610TZyUAGTH19Ayhl6LkQg+NGlnnqiJd5sRsk8OtLL95tv3a1Qtsu6oXMd3irTRaDY
 BHCZJDmo8bIIWuHwlORXzbJzkqHAMtkLHmi6vbrXxUtiYh9hQJiBLI3f6j2E+N2G45Fj
 IqJOiOQU2xWSUl//0SKmalxdAavx0g6/sKwcmQmfcHqel/AtkOP77+GisCOX0enzPnv3
 v+jA==
X-Forwarded-Encrypted: i=1;
 AKwUvBzdZbEfmJSpU+zikMwm8TlhL3pyvwcjelw4eq75GpyCm/eTIa2+sMrm+a6PlEgqeEFK/gaWK++4PQ==@nongnu.org
X-Gm-Message-State: AFq9FYLJ8EZmsI/Hq6cH5tQp/xFGYOiIf8HBl7I83DkWxhvadupSifmS
 tURr9yqkVrlU3NXQEPVWTEOz7looBxej3f5+kElnkWLbOw2Yg7XkUsdm
X-Gm-Gg: AYBFou3f21/VKg/B6ThGT3V5TuIvXwn22xyG8kE0SupfYHnfw1vEt1yAKeESLLrS2Sl
 AA5UG4HoPieNqnMrauS4QeK2fKwaxzWCMxsQ3rhgZqAy0kkj2FvlTjScpqjQnsbVezhfvyWxRG6
 9AOoXfmN8UnNA4Pz7NZB2jQkXjUMyXXvKgjF4MPTFpS/7anyzxbnpKEo/OmktGUdm7cWc4DwfPG
 Fa/ovRyt6sz/P4toTUJjeZgJxWBwX7PjqmJwVBFYfJohZmI0pqwpaRl1DK0uaNBoJ9dyzbhan4p
 k1Rb9yHCpsqUjxYVoSZhHi9RFhlDw5R9fZSnBA2/Mgw8QaeakQwrXXzbnyv3KdixY3nl1GelXmO
 GBxZQ3HE5Idl070WM7KLY9c6vskRxMnnHFlAbqOl+1mvlC5kh3enjc7HR/4kMzkL0PuXWmDISez
 xtdcWzcfUAZqARDe6so0LAEZdDLAFSb7gr3ivY6v7n6eiP+aRmf0G9LSm3/wbttimVSZ6OOHMHr
 CPhORA1BHCX0hg8lCXBVigXjpi6WJgsEUcKYH8aGKRSuA==
X-Received: by 2002:a5d:64cb:0:b0:48d:f34e:7561 with SMTP id
 ffacd0b85a97d-48df34e7658mr5958821f8f.14.1792077002424; 
 Thu, 15 Oct 2026 08:10:02 -0700 (PDT)
Received: from localhost (89-93-216-19.hfc.dyn.abo.bbox.fr. [89.93.216.19])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48de09693c7sm24117519f8f.4.2026.10.15.08.10.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Oct 2026 08:10:01 -0700 (PDT)
Date: Thu, 15 Oct 2026 13:57:40 +0200
Subject: [PATCH 02/22] hw/sensor: tmp421: name the parent object field
 parent_obj
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-bmc-clemente-v1-2-bf591886b5b6@free.fr>
References: <20261015-bmc-clemente-v1-0-bf591886b5b6@free.fr>
In-Reply-To: <20261015-bmc-clemente-v1-0-bf591886b5b6@free.fr>
To: qemu-devel@nongnu.org
Cc: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>, 
 =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>, 
 Jamin Lin <jamin_lin@aspeedtech.com>, Kane Chen <kane_chen@aspeedtech.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, 
 qemu-arm@nongnu.org, Fabiano Rosas <farosas@suse.de>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, 
 Emmanuel Blot <emmanuel.blot@free.fr>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792065465; l=1266;
 i=emmanuel.blot@free.fr; s=20260602; h=from:subject:message-id;
 bh=X/kN3xjDzBiaRkUauZ8mdXFMaJnkPfrAonUxOqKT35c=;
 b=WjB09hui7HQXWFAbEC8wG6Br3jLUb4uI/kqiCrexynUPB01RTw+KxlLcc/cnDMJpAtlBfB1qa
 lLLAd96LyHRDF2VdMjjv0UuN12QZQ0G9jLnDyPXruz6egHsUT8/nipp
X-Developer-Key: i=emmanuel.blot@free.fr; a=ed25519;
 pk=0qFrZ21FAAN8OfVsSoVcCFTk/NMYOWzxJz4paSAVm0g=
Received-SPF: pass client-ip=209.85.221.41; envelope-from=eblot.ml@gmail.com;
 helo=mail-wr1-f41.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_03_06=1.592,
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

Follow the QOM convention for the embedded I2CSlave, matching the other
hw/sensor I2C devices. No functional change.

Signed-off-by: Emmanuel Blot <emmanuel.blot@free.fr>
---
 hw/sensor/tmp421.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/sensor/tmp421.c b/hw/sensor/tmp421.c
index fde41b2323..e7927699ce 100644
--- a/hw/sensor/tmp421.c
+++ b/hw/sensor/tmp421.c
@@ -51,7 +51,7 @@ static const DeviceInfo devices[] = {
 
 struct TMP421State {
     /*< private >*/
-    I2CSlave i2c;
+    I2CSlave parent_obj;
     /*< public >*/
 
     int16_t temperature[4];
@@ -298,7 +298,7 @@ static const VMStateDescription vmstate_tmp421 = {
         VMSTATE_UINT8(status, TMP421State),
         VMSTATE_UINT8(rate, TMP421State),
         VMSTATE_INT16_ARRAY(temperature, TMP421State, 4),
-        VMSTATE_I2C_SLAVE(i2c, TMP421State),
+        VMSTATE_I2C_SLAVE(parent_obj, TMP421State),
         VMSTATE_END_OF_LIST()
     }
 };
@@ -334,7 +334,7 @@ static void tmp421_realize(DeviceState *dev, Error **errp)
 {
     TMP421State *s = TMP421(dev);
 
-    tmp421_reset(&s->i2c);
+    tmp421_reset(&s->parent_obj);
 }
 
 static void tmp421_class_init(ObjectClass *klass, const void *data)

-- 
2.53.0-Meta


