Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81877CC6B33
	for <qemu-arm@archiver.kernel.org>; Thu, 15 Oct 2026 15:12:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xHN6c-0005oX-4q; Thu, 15 Oct 2026 11:10:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xHN6a-0005o7-1M
 for qemu-arm@nongnu.org; Thu, 15 Oct 2026 11:10:52 -0400
Received: from mail-wm1-f54.google.com ([209.85.128.54])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xHN6Y-0001h6-9W
 for qemu-arm@nongnu.org; Thu, 15 Oct 2026 11:10:51 -0400
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-4a0213948d3so33735225e9.2
 for <qemu-arm@nongnu.org>; Thu, 15 Oct 2026 08:10:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792077049; x=1792681849;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=Hmi3ycbafsBZqQdN90IKJvQBv3NLUgGj3AYEGDMYcqU=;
 b=eikKHoLbE4aNqBmgyYFZ1DWjmwrKy+kbbE3piQPcTViEuZmg4VwBC7oh5I8pTBS9YH
 PASwTYVbyNre3lljxC4IkaK0tan9IRa4v8Dmx4aeV8QIji+jOAoBc6f5qRt75yJmqgL6
 EJ3/UHJq0OIhhhBhAmTarx4lo794uf76fYWt3AKFIIw4q29Qbf7/0JTEd++RRvqKBDny
 02TPIZUTc428n7GDNWd0WMvbGAvjrIKD23jUOssnpvAEFKqIUE1qBvaNDKqNX6XSy/V8
 2Mb9UozM4i6bJg83Knjr0yE5SI1k16Pc7p7YJSjK0u5Qi9+DcAsuEpj3FzkSzkGBxFqt
 wI/w==
X-Forwarded-Encrypted: i=1;
 AKwUvByzB3Nk0o2KjhYEgkKKRUtO4QY/p18yRjTZCcHexCxn+2oGjpnxaJcfIxEqQ2BBQlL3gqZDNQkWYQ==@nongnu.org
X-Gm-Message-State: AFq9FYK4Fc8hMel8xsJYWTEOtTnV/TF71QQVXDUQ3CAcQawi+Jxrd3K/
 yn3RowzuCt6o8RgX7JLlh8ISftD/r/5qBjtnFbIW+bquk5NIts+yOLNv
X-Gm-Gg: AYBFou16fg+blIRp3PssCX7vo001POEDtbP5Dlqehdg86US13ZOz9IRn3GJ2ZNWI/Gr
 15i1hIAGTCZ0Cx3c0CTwjXQd3Zvw2F3At5EDaSpknjv2HNGY4joZr2Rcs7o5Q169KOQCU+nft+q
 +q49zw9PTYfWZgijp5Vwd4MHgYWgnT4SXtdWp1gxBKXx0xv05uD7bPWFbm84mOjGiC9lMmiAgVt
 f2pYlEk/BrqIF3ainOc2o7WK+M7ZZw8HrQpVbmiyowbizqkUmvTr8dtZdfGuCgO8aeCU4GOPHot
 tqAFfJeKbJdWkbYDul8PtT/nq8j35LxCO3JWJuXrWo9s0WEWjAr1iVd3OQXTmDngXKBAhCMpHvg
 Ju3IuBMio9DK+1XCHS1EXCHKOO6n9zgjwnwXigFn7QkmGVvNzM2kyMwxMyNNBARJKc8gtS/xT1X
 HuUunnd4WakAnQJgwCLzk9yV11LAki7hIcB7bp1gN749XJqAEddAi3SVc6vyDzRTh2gqIPIY/MP
 Tkk8jPNuS4IV6aaxXY90zJFgTlddorQIB3FvHxW0P9Z6A==
X-Received: by 2002:a05:600c:c113:b0:4a1:985b:83a9 with SMTP id
 5b1f17b1804b1-4a1985b87f5mr232108635e9.4.1792077048648; 
 Thu, 15 Oct 2026 08:10:48 -0700 (PDT)
Received: from localhost (89-93-216-19.hfc.dyn.abo.bbox.fr. [89.93.216.19])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1bf63567esm111132515e9.10.2026.10.15.08.10.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Oct 2026 08:10:47 -0700 (PDT)
Date: Thu, 15 Oct 2026 13:57:45 +0200
Subject: [PATCH 07/22] hw/sensor: tmp421: describe the temperature properties
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-bmc-clemente-v1-7-bf591886b5b6@free.fr>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792065465; l=747;
 i=emmanuel.blot@free.fr; s=20260602; h=from:subject:message-id;
 bh=M1t+L7+uRqimR0C44vmJeOL7CEkGaHASB3lV1y0GENQ=;
 b=01ccWiDvVWr21jIf4Btm8NLVrKNY0zHN++JvPc+v0bFKRm5zQpB8LqkVvLQVolw6xbMJKHzUP
 bS75t4ZzwVCBPHqm/kA6be+hlCswf+uZfbBwRrDnTdZwkAbpD4qSxuz
X-Developer-Key: i=emmanuel.blot@free.fr; a=ed25519;
 pk=0qFrZ21FAAN8OfVsSoVcCFTk/NMYOWzxJz4paSAVm0g=
Received-SPF: pass client-ip=209.85.128.54; envelope-from=eblot.ml@gmail.com;
 helo=mail-wm1-f54.google.com
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

Attach a description to each temperature property so it shows up in
qom-list-properties.

Signed-off-by: Emmanuel Blot <emmanuel.blot@free.fr>
---
 hw/sensor/tmp421.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/sensor/tmp421.c b/hw/sensor/tmp421.c
index 9e1249afb8..ec3a9a9760 100644
--- a/hw/sensor/tmp421.c
+++ b/hw/sensor/tmp421.c
@@ -393,6 +393,8 @@ static void tmp421_initfn(Object *obj)
         object_property_add(obj, name, "int",
                             tmp421_get_temperature,
                             tmp421_set_temperature, NULL, NULL);
+        object_property_set_description(obj, name,
+                            "Temperature, in millidegrees Celsius");
     }
 }
 

-- 
2.53.0-Meta


