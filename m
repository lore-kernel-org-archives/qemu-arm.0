Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp5184353ejb;
        Tue, 7 Feb 2023 02:12:07 -0800 (PST)
X-Google-Smtp-Source: AK7set+6SJr4rLXHMrN16lvwGRzEhLixE/SKaQbuTcJi2EYPhZy2IPJcK4TDl/EnTUmDTGxq6zvF
X-Received: by 2002:a05:6214:e81:b0:537:649f:747c with SMTP id hf1-20020a0562140e8100b00537649f747cmr3711725qvb.11.1675764727728;
        Tue, 07 Feb 2023 02:12:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675764727; cv=none;
        d=google.com; s=arc-20160816;
        b=mBS4Hsy7CWjAvFZTskxgz3HBKDMJDsv6LBeEAg0+s84Z3yVd3R+Vhhn5xUgvAYBGAG
         uDwrbz8IowQZSTzeAwCxRqeJYw/+XjPpR2260R4k06HOCnHcy71InOhhRBZUq4AfC+0/
         hds/RB/G9C3R0Rt/E8YYqVPcJkQ9/+q0xonwmnCzOG59N8/gXSlED69OmcAN1uaJ5lxA
         NtRvzphoJwCyVyAFMOgmmCq+jDMBjSCzhwnm4mILWPFKIerCrUMekRQjTN0tpirRkE5o
         R2R289+CrqU8HlsX+p73E7D94UVdylalAsZX9EuckNKxX2658eg69y/8CjdLM01sv/Mw
         Ryxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=U0tPq/MgJ1p49vSmMiZfr6foh16b/XnXScyGLcLtr8o=;
        b=h3T60GIHFRoBLEsU3hKj5GzyWWZB1ow7SnLrk0ppQQfQM/0k+Cl0ARdvk1sUc2xa2M
         KJF5Fu0yE7lCYZmdNG9XaJEGS+cG9m7V1X2e5yQdVtSPRfGuc3rW+0fF+PhH7FNUtzfp
         lTt/HjOURxow9GV4yO8+ododzWPiy7M1cqT0vnKUp5nLaokQdU4goIVm7fQ3+SbM13TM
         8ml1Navg442yqmdGaHk4v9aYqLGiPq79eGMOpqk9qTmPvtWNROYvy1EyfmvR+3rtzJyU
         HFKqdri2Ilk5KPCvmLMbriHC7mGea4IwUBf1X3p6yLKl9aLM865FlmTmNb/m4104OR3E
         S8VA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a16-20020a0ce390000000b0056bf1e34c8esi5496869qvl.165.2023.02.07.02.12.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Feb 2023 02:12:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pPKuC-0000kN-T0; Tue, 07 Feb 2023 05:08:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=a43c=6D=kaod.org=clg@ozlabs.org>)
 id 1pPKtu-0000V2-0X; Tue, 07 Feb 2023 05:08:35 -0500
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=a43c=6D=kaod.org=clg@ozlabs.org>)
 id 1pPKts-0002Sb-1E; Tue, 07 Feb 2023 05:08:33 -0500
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4P9zNb00rSz4xyj;
 Tue,  7 Feb 2023 21:08:31 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4P9zNX5Dl2z4xyF;
 Tue,  7 Feb 2023 21:08:28 +1100 (AEDT)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Peter Delevoryas <peter@pjd.dev>,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Corey Minyard <cminyard@mvista.com>
Subject: [PULL 14/25] hw/nvram/eeprom_at24c: Make reset behavior more like
 hardware
Date: Tue,  7 Feb 2023 11:07:33 +0100
Message-Id: <20230207100744.698694-15-clg@kaod.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230207100744.698694-1-clg@kaod.org>
References: <20230207100744.698694-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=a43c=6D=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: EoHhZgBjEOjf

From: Peter Delevoryas <peter@pjd.dev>

EEPROM's are a form of non-volatile memory. After power-cycling an EEPROM,
I would expect the I2C state machine to be reset to default values, but I
wouldn't really expect the memory to change at all.

The current implementation of the at24c EEPROM resets its internal memory on
reset. This matches the specification in docs/devel/reset.rst:

  Cold reset is supported by every resettable object. In QEMU, it means we reset
  to the initial state corresponding to the start of QEMU; this might differ
  from what is a real hardware cold reset. It differs from other resets (like
  warm or bus resets) which may keep certain parts untouched.

But differs from my intuition. For example, if someone writes some information
to an EEPROM, then AC power cycles their board, they would expect the EEPROM to
retain that information. It's very useful to be able to test things like this
in QEMU as well, to verify software instrumentation like determining the cause
of a reboot.

Fixes: 5d8424dbd3e8 ("nvram: add AT24Cx i2c eeprom")
Signed-off-by: Peter Delevoryas <peter@pjd.dev>
Reviewed-by: Joel Stanley <joel@jms.id.au>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Corey Minyard <cminyard@mvista.com>
Link: https://lore.kernel.org/r/20230128060543.95582-6-peter@pjd.dev
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/nvram/eeprom_at24c.c | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/hw/nvram/eeprom_at24c.c b/hw/nvram/eeprom_at24c.c
index 05598699dc..3328c32814 100644
--- a/hw/nvram/eeprom_at24c.c
+++ b/hw/nvram/eeprom_at24c.c
@@ -184,18 +184,6 @@ static void at24c_eeprom_realize(DeviceState *dev, Error **errp)
     }
 
     ee->mem = g_malloc0(ee->rsize);
-
-}
-
-static
-void at24c_eeprom_reset(DeviceState *state)
-{
-    EEPROMState *ee = AT24C_EE(state);
-
-    ee->changed = false;
-    ee->cur = 0;
-    ee->haveaddr = 0;
-
     memset(ee->mem, 0, ee->rsize);
 
     if (ee->init_rom) {
@@ -213,6 +201,16 @@ void at24c_eeprom_reset(DeviceState *state)
     }
 }
 
+static
+void at24c_eeprom_reset(DeviceState *state)
+{
+    EEPROMState *ee = AT24C_EE(state);
+
+    ee->changed = false;
+    ee->cur = 0;
+    ee->haveaddr = 0;
+}
+
 static Property at24c_eeprom_props[] = {
     DEFINE_PROP_UINT32("rom-size", EEPROMState, rsize, 0),
     DEFINE_PROP_BOOL("writable", EEPROMState, writable, true),
-- 
2.39.1

