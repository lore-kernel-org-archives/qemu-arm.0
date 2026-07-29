Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13AC7C54F51
	for <qemu-arm@archiver.kernel.org>; Wed, 29 Jul 2026 15:30:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wp6EC-0002rw-Op; Wed, 29 Jul 2026 11:29:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1wp6E8-0002rB-6D
 for qemu-arm@nongnu.org; Wed, 29 Jul 2026 11:29:48 -0400
Received: from mail-wm1-f47.google.com ([209.85.128.47])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1wp6E6-0008HB-M4
 for qemu-arm@nongnu.org; Wed, 29 Jul 2026 11:29:47 -0400
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-49553515a8bso13857015e9.1
 for <qemu-arm@nongnu.org>; Wed, 29 Jul 2026 08:29:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785338984; x=1785943784;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=CfEjIUkd1zt60lZLBgFbE1W+Iz0xdud8IZhMTmuXKvc=;
 b=iWuzga04GFr0rXXn+K4roHUvOTCf6Y5+/fVGGpDBOwztBgoWV+BpAH2vab1Jpauect
 lAoSrfGVlrZ6opOJ8wmAjDI+STD14HLMuIEC6kp828lQiq7oQbv1GO9ri7eRz9BoMeF0
 9KY5VmOUMn/VY0kBTmpS2NMtVFQpLwA33XeoM3UP7FTlvix9T6qOK0n8JrIRTGXIe7/F
 nc3KO7GB5vPpO7ODNSmmienySuAJuG7iSxw5UURJAnIRiv/APwRm3UUqUTmPEQ0oIrcZ
 cpVsDeh+RCb1IH7gTElCHcDg44RY16Wnfei8R31rVwxyEI8lojthDMBsSSrE9WUqOoTl
 sk3g==
X-Forwarded-Encrypted: i=1;
 AHgh+Rqa7Y4Wz3e5dPon9QNvjF1+AnnRqDCBQCPf8zosiM/dsZjfEyVZ7H8fHEvOGn6texocQ5dLLnnMIw==@nongnu.org
X-Gm-Message-State: AOJu0YyeYS4Fpa9x8xSWALzuuXWjdJt90DLVOroLCcHLgVN4sVt6thIC
 VCCuh//2Zg4VzKGW5apKaROvH0v0+i5uOqNemFeBbEdaw+Yf0SWpmislyhkm3jU3
X-Gm-Gg: AR+sD10bnLzQE/a1X8jb52TlSAwFLS5hSjVFg02gSPy+emSTV0G8B/uwGtWAeqxLQKq
 YbYJudrfsDGsOx6cCQJOqsBxYF2chF/yodm1uKNbKs1q3R71n2iOWz8pAM7hxNPohLPxr4krP+X
 CBrjKYHeq5YRvs0jSUxFGW4ICBz6EA/Y4lBKRVMX4+vIz7/hYGi3f2oaLzmzlKN4bxl0OFYyA4u
 tDRdJ8QnyOLNx09l4q2TS5npc+/rRMYSf2pO244IupTNoqxGKLco8afx0HtuwA+WVXlSt42SP8e
 /pZPBw0z3zaWL8A8VCgabvVW0kLfnJd+cxCMji+5Y2p851G7NkTTfeLoK10mfGkAWQ0mSZDq/OP
 U7kXHqopgtSVq8pYXSJQ3/MVYqDxAESCfsKv+gLelstyuNEp+e0b4uIW6xyc2x58HoJm6rLPNFS
 Bs4fy/yn48l8zyz/mevYsTk66BigYtFadD2Ee53cDtJr73k2UXZ7klWN8PVF4Dy2XMQGpaRvQFF
 B40U65rpPWWTuRsuTzaYJE2rniuX6u01Xqt
X-Received: by 2002:a05:600c:1d1b:b0:493:bb0:3b43 with SMTP id
 5b1f17b1804b1-496c6426bc8mr88334435e9.2.1785338983588; 
 Wed, 29 Jul 2026 08:29:43 -0700 (PDT)
Received: from localhost (89-93-216-19.hfc.dyn.abo.bbox.fr. [89.93.216.19])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-496fa42effasm51998495e9.2.2026.07.29.08.29.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jul 2026 08:29:43 -0700 (PDT)
Date: Wed, 29 Jul 2026 17:12:42 +0200
Subject: [PATCH 06/25] hw/arm: aspeed: guard board-local temperature-sensor
 aliases
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260729-sanmiguel-bmc-locator-v1-6-c8f9a8d101f6@free.fr>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785337963; l=1761;
 i=emmanuel.blot@free.fr; s=20260602; h=from:subject:message-id;
 bh=0daG7vmYYOhBzkb799hhbKaLINYeD4dhpsEpss5vX3s=;
 b=/Hx/kpQyWinE0jKj7tGWmxccvsmNreGxOPzUT/P9BqQZIjlL7eZFPq9UzQfrZ48K+ziC+zm5l
 l+xRsImQyi4DTDc6/oziggsZPMRmAIPJ+sKLYbETBgfLz2NgtyuP6B3
X-Developer-Key: i=emmanuel.blot@free.fr; a=ed25519;
 pk=0qFrZ21FAAN8OfVsSoVcCFTk/NMYOWzxJz4paSAVm0g=
Received-SPF: pass client-ip=209.85.128.47; envelope-from=eblot.ml@gmail.com;
 helo=mail-wm1-f47.google.com
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


