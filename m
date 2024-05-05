Received: by 2002:a17:907:a09:b0:a52:4db9:938b with SMTP id bb9csp1018446ejc;
        Sun, 5 May 2024 07:06:52 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWbLvnARi/xr6i1ACxg4ZEhJ4xjPNNsqASX80LNCLgaaUVL9QvPIrq+5yuELshwvZqKKztbcCA6wTJ/+x5xs99DUfKtXR0R
X-Google-Smtp-Source: AGHT+IETdzGkFA5vlLlODjpdCx3PDl+ziu4g3q9TpGa7zMvred8vTXIN1Lne7rrv/JVrOYGcorft
X-Received: by 2002:ad4:5d65:0:b0:6a0:d548:ce5 with SMTP id fn5-20020ad45d65000000b006a0d5480ce5mr9819991qvb.53.1714918012161;
        Sun, 05 May 2024 07:06:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714918012; cv=none;
        d=google.com; s=arc-20160816;
        b=ltGkTRCR3a3s8w+fikZxtMzvviNvJxdKYpY1BiV06qA/z/zP+DmAvYg5wrODpqokwD
         gJdqqKxhgcIAZ/NumnwqId7JKrlSq07g25d7chRoY7mQ1SOAFdNrKrk9ITehSiatWMoE
         AwvC1WZjBYD8gSVvo6MST+Brkmh9kFWYLJ6Wpe9ks4jtQ37Q6zmyZ0em8IW4DZWbmrR2
         g94PJDbK8CawDWMipItaOcH79F52oI/jLxxvdJPNxElCGXat2tJG9BoosWY5znU8EH+U
         LOYQHVSdn571yqB3zIPvwDXSx+pm4pRgEwNc/plg7cT36HwQg53hpOu4b3jRAiSjnk5R
         2o9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature:dkim-filter;
        bh=zMFeulWVkOYx/BzjKpb4Lr6JnGmx5OooPNZDwt3CYjs=;
        fh=HZifwXm5fvflHYf2cbKVplOT47ne2uF6SUUZ3w7LV4M=;
        b=gCHU2iFGbS3ocQHN88GsQ620YHnvzTvRpg5t/gmQp7fQpRDsHsdEe/J0p+P4SbhyBH
         gSGXpV2QQc8sG9henKrN00Kxu/4HpALLy5wsp8w1L4B6i04nyqVLlBTiR5ywSoo4djLe
         5S0cDshlyOhTdMLY3cr8TEEO2r304evQE2MljzmQ47beTHZL2uxcLs8NPBLexAzspB9o
         5tnGhpNc8LHFPUeFFbF4mWFh5bYcY+ZQbfv3nbQQKbvwBPMMnjPGzYKInamyoQMZzGjS
         /XQOxG61b0WEBMUZv666XZBu45XPmHVZP8pXVhulponVCVjid1M4JjW7VRkqSSQd5gDX
         Vdqg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@telecom-paris.fr header.s=A35C7578-1106-11E5-A17F-C303FDDA8F2E header.b="8CxpRlC/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=telecom-paris.fr
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id pt11-20020a056214048b00b006a0a964a741si7442436qvb.345.2024.05.05.07.06.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 05 May 2024 07:06:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@telecom-paris.fr header.s=A35C7578-1106-11E5-A17F-C303FDDA8F2E header.b="8CxpRlC/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=telecom-paris.fr
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s3cVS-0005vb-JS; Sun, 05 May 2024 10:06:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ines.varhol@telecom-paris.fr>)
 id 1s3cVK-0005sr-II; Sun, 05 May 2024 10:06:14 -0400
Received: from zproxy3.enst.fr ([137.194.2.222])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ines.varhol@telecom-paris.fr>)
 id 1s3cVH-00086E-2r; Sun, 05 May 2024 10:06:12 -0400
Received: from localhost (localhost [IPv6:::1])
 by zproxy3.enst.fr (Postfix) with ESMTP id D7A63A071D;
 Sun,  5 May 2024 16:06:06 +0200 (CEST)
Received: from zproxy3.enst.fr ([IPv6:::1])
 by localhost (zproxy3.enst.fr [IPv6:::1]) (amavis, port 10032) with ESMTP
 id wrd_UPYNM3jm; Sun,  5 May 2024 16:06:06 +0200 (CEST)
Received: from localhost (localhost [IPv6:::1])
 by zproxy3.enst.fr (Postfix) with ESMTP id 9182FA06FC;
 Sun,  5 May 2024 16:06:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.10.3 zproxy3.enst.fr 9182FA06FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=telecom-paris.fr;
 s=A35C7578-1106-11E5-A17F-C303FDDA8F2E; t=1714917966;
 bh=zMFeulWVkOYx/BzjKpb4Lr6JnGmx5OooPNZDwt3CYjs=;
 h=From:To:Date:Message-ID:MIME-Version;
 b=8CxpRlC/Au55lrun1lofuvo9ge8gNCIRdDrY2zTeZfi3nwM8hnDSIyXPlTBWdIFiX
 cu6zwiEDuKdNedjYVbfDsi4nnt+RRxHVy2Ak4Hkc99HGxha1T4vWeabvMZZVYTJ2cB
 HdUv72iaamRA+HnzKjXEoTiNbXAOoW82Pt3plzHw=
X-Virus-Scanned: amavis at enst.fr
Received: from zproxy3.enst.fr ([IPv6:::1])
 by localhost (zproxy3.enst.fr [IPv6:::1]) (amavis, port 10026) with ESMTP
 id gRja93ZjF1SQ; Sun,  5 May 2024 16:06:06 +0200 (CEST)
Received: from inesv-Inspiron-3501.enst.fr (unknown
 [IPv6:2a04:8ec0:0:124::190c])
 by zproxy3.enst.fr (Postfix) with ESMTPSA id A96F1A072C;
 Sun,  5 May 2024 16:06:05 +0200 (CEST)
From: =?UTF-8?q?In=C3=A8s=20Varhol?= <ines.varhol@telecom-paris.fr>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Arnaud Minier <arnaud.minier@telecom-paris.fr>,
 Laurent Vivier <lvivier@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?In=C3=A8s=20Varhol?= <ines.varhol@telecom-paris.fr>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 Samuel Tardieu <samuel.tardieu@telecom-paris.fr>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 3/4] hw/char: Add QOM property for STM32L4x5 USART clock
 frequency
Date: Sun,  5 May 2024 16:05:05 +0200
Message-ID: <20240505140556.373711-4-ines.varhol@telecom-paris.fr>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240505140556.373711-1-ines.varhol@telecom-paris.fr>
References: <20240505140556.373711-1-ines.varhol@telecom-paris.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=137.194.2.222;
 envelope-from=ines.varhol@telecom-paris.fr; helo=zproxy3.enst.fr
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: bFnPvIW/FMf/

Signed-off-by: In=C3=A8s Varhol <ines.varhol@telecom-paris.fr>
---
 hw/char/stm32l4x5_usart.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/hw/char/stm32l4x5_usart.c b/hw/char/stm32l4x5_usart.c
index fc5dcac0c4..ee7727481c 100644
--- a/hw/char/stm32l4x5_usart.c
+++ b/hw/char/stm32l4x5_usart.c
@@ -26,6 +26,7 @@
 #include "hw/clock.h"
 #include "hw/irq.h"
 #include "hw/qdev-clock.h"
+#include "qapi/visitor.h"
 #include "hw/qdev-properties.h"
 #include "hw/qdev-properties-system.h"
 #include "hw/registerfields.h"
@@ -523,6 +524,14 @@ static Property stm32l4x5_usart_base_properties[] =3D=
 {
     DEFINE_PROP_END_OF_LIST(),
 };
=20
+static void clock_freq_get(Object *obj, Visitor *v,
+    const char *name, void *opaque, Error **errp)
+{
+    Stm32l4x5UsartBaseState *s =3D STM32L4X5_USART_BASE(obj);
+    uint32_t clock_freq_hz =3D clock_get_hz(s->clk);
+    visit_type_uint32(v, name, &clock_freq_hz, errp);
+}
+
 static void stm32l4x5_usart_base_init(Object *obj)
 {
     Stm32l4x5UsartBaseState *s =3D STM32L4X5_USART_BASE(obj);
@@ -534,6 +543,9 @@ static void stm32l4x5_usart_base_init(Object *obj)
     sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->mmio);
=20
     s->clk =3D qdev_init_clock_in(DEVICE(s), "clk", NULL, s, 0);
+
+    object_property_add(obj, "clock-freq-hz", "uint32",
+                        clock_freq_get, NULL, NULL, NULL);
 }
=20
 static int stm32l4x5_usart_base_post_load(void *opaque, int version_id)
--=20
2.43.2

