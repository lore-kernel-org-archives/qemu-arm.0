Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2250AC54F54
	for <qemu-arm@archiver.kernel.org>; Fri, 31 Jul 2026 12:30:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wpmNK-0004Qd-Sd; Fri, 31 Jul 2026 08:30:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1wpmNH-0004Q8-Oi
 for qemu-arm@nongnu.org; Fri, 31 Jul 2026 08:30:05 -0400
Received: from mail-wr1-f53.google.com ([209.85.221.53])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1wpmNF-0000ET-SU
 for qemu-arm@nongnu.org; Fri, 31 Jul 2026 08:30:03 -0400
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-4798bea72f9so661038f8f.1
 for <qemu-arm@nongnu.org>; Fri, 31 Jul 2026 05:30:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785501000; x=1786105800;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=CfEjIUkd1zt60lZLBgFbE1W+Iz0xdud8IZhMTmuXKvc=;
 b=lDawiwvzt1friRtwj5auer68bwOQAWjl+ktnZJ7W45PJ4w3bqmecQC6RHkcZSpGlte
 eASbp3KRqIWOLRVex7Hu3LIhV9HJfDMQRKnpc4X03cbjgGMbW73URe+uhq7GHjRq5Xha
 6RR7Itb763ey1qFMF0hBOCFOf1/enuadJyTq3D75LrRrdUbpwFc2+kVc4lw4eSBDUo8E
 l7ZERYTRfHxHUXKQh8dbfOr+iKbOVTzrdmkltoy0puW/O7l55uQno3VmnMl2gtWiaqby
 T2j3Jo4FIJl94Dj+D6OWGTY0sOufbMWCn9dYqFzaTnhD+7btO/Fdip/F3C6ZCi350JGp
 HHag==
X-Forwarded-Encrypted: i=1;
 AHgh+RqHek10fAfAP4rKTia35WbA9FDUUxovtdVzSIopkuh2cqUbSIVPL/cB32fX++BOWSCmuFhFRt7d9A==@nongnu.org
X-Gm-Message-State: AOJu0Yzt+/Kl4gGaOCEbhxyHnkVqYT+V6WdWoh9FD01S/tapsJBEUkxz
 F3ihz4kfrS+fdeFwOTuB8XWA5vxHlK2MXCYEErkBVgMWesYECoXB3fV2
X-Gm-Gg: AR+sD10UZopwpwROvXCV3++Jv1h86nLCWbjKstT7/a+/MfSuW6XBIesMbSNPIDGEzqx
 YBi3NZ/wY3fzIpEo8QYoHs2dff2LlDFx8nVzEv/quxM5i2o1hdD0cxIl2C4vZcGq3lwyQN2gFHv
 mCVgy17LdEWB8J3fZMQUG5NslKMxC9x9jLJDKS4t93HfBDBm6sH92LjDz85qLQyNQ1S650avXoX
 o62niWU2m5gOenog7KfXQPVai9d43zwAWey4ugm8jFs3gYRT5BN+YsSwjsOUUDQIgdjMWTHBIKt
 cEnowgQs9KWosYomJwUQDmdrzHWEBwX5tmLYMvIy8m3ieZDz3ARFl4CRBIsNmo8dtjZz8FNTBmN
 WUuYMRPDrEGTeqMSvEgvvZe+QFpSCyk8vIW1ayMO06Xf9eCXTnxSQBTv2Fb3n/5aoSvYmXReDwU
 Byn1cYwspIgUajHcwax93kQuYsrz/ivTEZbH/WvQ7w782L2hmfdzBTyCFGpkytGy//KM7oSvO9c
 NVKXtaZTkGTUfHgyCNZ1UPpqx0BGH+n2Ea5kMKsWZgDEl8=
X-Received: by 2002:a05:6000:41c5:b0:47f:7526:598 with SMTP id
 ffacd0b85a97d-47fd2abbb81mr4753469f8f.12.1785501000152; 
 Fri, 31 Jul 2026 05:30:00 -0700 (PDT)
Received: from localhost (89-93-216-19.hfc.dyn.abo.bbox.fr. [89.93.216.19])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47fd41e296csm4410974f8f.12.2026.07.31.05.29.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jul 2026 05:29:59 -0700 (PDT)
Date: Fri, 31 Jul 2026 12:45:05 +0200
Subject: [PATCH v2 06/25] hw/arm: aspeed: guard board-local
 temperature-sensor aliases
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-sanmiguel-bmc-locator-v2-6-1266926ba769@free.fr>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785494707; l=1761;
 i=emmanuel.blot@free.fr; s=20260602; h=from:subject:message-id;
 bh=0daG7vmYYOhBzkb799hhbKaLINYeD4dhpsEpss5vX3s=;
 b=X6XAvRIGXOe0nU6oj3CGAdAZ28H4gnbOLnb1J3bnnFcb3+FODW6RJMzWUeOGOpiV0Uv+QO+dv
 Q8xHBheY5RhCoJZXbu5wm2pDnejfc2CVUXBSehwXCt3axX+cIOzwkxZ
X-Developer-Key: i=emmanuel.blot@free.fr; a=ed25519;
 pk=0qFrZ21FAAN8OfVsSoVcCFTk/NMYOWzxJz4paSAVm0g=
Received-SPF: pass client-ip=209.85.221.53; envelope-from=eblot.ml@gmail.com;
 helo=mail-wr1-f53.google.com
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

The Catalina and Fuji machines define TYPE_TMP75 (and, on Fuji,
TYPE_LM75) as local aliases of TYPE_TMP105 because no distinct model
existed. A following change adds a canonical TYPE_TMP75 to
hw/sensor/tmp105.h that would clash with these aliases.

Guard each alias with an #undef so the header definition can be
introduced without a redefinition warning, ahead of switching the boards
to the real models. No functional change.

Signed-off-by: Emmanuel Blot <emmanuel.blot@free.fr>
---
 hw/arm/aspeed_ast2600_catalina.c | 5 +++++
 hw/arm/aspeed_ast2600_fuji.c     | 6 ++++++
 2 files changed, 11 insertions(+)

diff --git a/hw/arm/aspeed_ast2600_catalina.c b/hw/arm/aspeed_ast2600_catalina.c
index f714c9d1b32..33e75338efc 100644
--- a/hw/arm/aspeed_ast2600_catalina.c
+++ b/hw/arm/aspeed_ast2600_catalina.c
@@ -22,6 +22,11 @@
 #define CATALINA_BMC_HW_STRAP2 0x00000800
 #define CATALINA_BMC_RAM_SIZE ASPEED_RAM_SIZE(2 * GiB)
 
+/*
+ * Guard the alias against the TYPE_TMP75 that hw/sensor/tmp105.h now
+ * defines.
+ */
+#undef TYPE_TMP75
 #define TYPE_TMP75 TYPE_TMP105
 #define TYPE_TMP421 "tmp421"
 #define TYPE_DS1338 "ds1338"
diff --git a/hw/arm/aspeed_ast2600_fuji.c b/hw/arm/aspeed_ast2600_fuji.c
index 37db252e276..6dc3535f0cb 100644
--- a/hw/arm/aspeed_ast2600_fuji.c
+++ b/hw/arm/aspeed_ast2600_fuji.c
@@ -15,7 +15,13 @@
 #include "hw/sensor/tmp105.h"
 #include "hw/nvram/eeprom_at24c.h"
 
+/*
+ * Guard the aliases against the TYPE_TMP75 that hw/sensor/tmp105.h now defines;
+ * TYPE_LM75 is guarded too for consistency (no LM75 model exists yet).
+ */
+#undef TYPE_LM75
 #define TYPE_LM75 TYPE_TMP105
+#undef TYPE_TMP75
 #define TYPE_TMP75 TYPE_TMP105
 #define TYPE_TMP422 "tmp422"
 

-- 
2.50.1


