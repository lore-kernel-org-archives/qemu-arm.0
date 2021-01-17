Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp1966829lfq;
        Sun, 17 Jan 2021 11:26:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwqGtBC9s1t3LzIaxrYp1bp1Gql4WdjBMzlbLRbtxzRf3O0Rciq464GhVUuPb8DPSQ/lTr/
X-Received: by 2002:a25:7310:: with SMTP id o16mr29236469ybc.471.1610911603342;
        Sun, 17 Jan 2021 11:26:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610911603; cv=none;
        d=google.com; s=arc-20160816;
        b=sLjaJPiSBBpDCR+m8So0ykkFGpw3unLui+n21+W0QADRr9TBskJ3fjuvmy8o03Q8Bu
         K65HCTH3URPBUZgfxejHLpwjEFC3/+69OfqLK1NBevYTKMTIgzCuqxa/IBmQzDbKKNHA
         jTWq4c36xzhv+3r7vRcC8UPWB7YEg2vFl2Kk1Jlj+nOE6wxDegHxJMdmgZsozL+PvXEg
         UwnN3jlptZO1AIvIOdGNTFX4n5OmbZXe2vLGovLXZQmq9JQxAXKULTmESmRf4h+mqhAZ
         Z4MaN6L/EcQfyPLeopAyMZvQxStEYpd6cmy6lG9bSA+ZACU5vyUrDbkQP7x4Bv9OJDUk
         jAUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=B4YUxFFcqfLKGc47lrHSN4rEV4rWS7YudCY+3T61Wdo=;
        b=H7FRzYNlRpkjrBjtE2Wzkwx7pNr0IdfbalisV6tHiF4ZDdKNAk9mjzzCSqmoRWsnVh
         NbvBk7L935R0Fmg9+/Bz1/blFo+xh5C6IFQfHg4PI6k4bBvxsQs0hipcuy7AxiZStUvL
         fFKUJSK+9eAVdjZQLBawR4i3PPSA4dDHPtAsZ62FnxX/Z9ONPWS/ESOT9bFBfyhdneV/
         1sAi/lXarw3asKw6I1bYfZtHZgLletDYA+kLdReZGh2azkbbFYEB+doIQfQ1f9v5Zmkd
         BvvkuNTdhatsxZ21/zGJkfm/YbwStgT7PjlKbRhrQnB3pg7Idipc+ixHcVf0rON3E3r/
         aOhg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Hw+879i6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d17si9301116ybj.30.2021.01.17.11.26.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 17 Jan 2021 11:26:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Hw+879i6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:45348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l1DhC-0008JF-O8
	for alex.bennee@linaro.org; Sun, 17 Jan 2021 14:26:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l1Dfy-0007qJ-4G; Sun, 17 Jan 2021 14:25:28 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:44251)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l1Dfw-00058Q-Ph; Sun, 17 Jan 2021 14:25:25 -0500
Received: by mail-wr1-x42f.google.com with SMTP id w5so14425576wrm.11;
 Sun, 17 Jan 2021 11:25:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=B4YUxFFcqfLKGc47lrHSN4rEV4rWS7YudCY+3T61Wdo=;
 b=Hw+879i6FA5pURTaL7CQP+GLpMvdsoTGDwnuQ+9kmBYGhIiHk1hqFo/fNuYG49S7Wl
 2VviseMlvQfKy4hIX/zQDtdlIVAsWtfX+WMiImMd5c+/kdHvARiAQxuSb8t+GEJOV7QL
 Y5ZZzst3Q4Y1CXWklRHxqOOlpl3jwMDJ1hqORJP9N1QFTFnFc1Haq4r/FPLUOttFlGO1
 0v0F7W3WXOL5BWGK5dKbCN3NbtqsMULQMiAhSmBAuJ1bA4Dr3UWI4Pdy+4c2o4/MZrhK
 QC5cbq9CHb1EvOgXzYwwizz0TGeOI11Uvv0kfmwo9V9odEnabftjxLlu6nRGtwTlUPVl
 NGmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=B4YUxFFcqfLKGc47lrHSN4rEV4rWS7YudCY+3T61Wdo=;
 b=L3NPhxW5pTRqxaudwRgHXW/IpNe1SZkozztDOzrYOME16qlaFB0QWWiYPH+tH8Pedk
 GXDbufQPSAr1K1F1axtFLqPDsmMiq2agNYjpYX1n0a5zRyQ9UdT9bt4yObjh/StWtSHO
 URwB5n0PjiUx3ro6FE+cXqYZan/fgAQEsdqvOft/oeNf84YyxQKyFc7aikOWGagU3P5v
 WiEjcpFTuFAUjotX8qsiH70w18OdsiO6vocd0ixj5zo6tjWbdDiY/sw9ANqSnlYZP053
 S0U8mRSkGVo4mIsVOwRQLNf+eEHfnVdBPRdukDFnvyjh540T/QbupJY9s+SIBHlwDL59
 zf/Q==
X-Gm-Message-State: AOAM530U5doEn7uubbctF9R4ph3HbY7kjCzOBTYvsXJVBCJk3ysv0AQH
 XEHRwxKTxgrrd27p79ze78w=
X-Received: by 2002:a5d:47c3:: with SMTP id o3mr17313895wrc.175.1610911523243; 
 Sun, 17 Jan 2021 11:25:23 -0800 (PST)
Received: from localhost.localdomain (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id c11sm22974584wmd.36.2021.01.17.11.25.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Jan 2021 11:25:22 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-devel@nongnu.org
Subject: [RFC PATCH v2 06/20] hw/arm/msf2-soc: Mark the device with no
 migratable fields
Date: Sun, 17 Jan 2021 20:24:32 +0100
Message-Id: <20210117192446.23753-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210117192446.23753-1-f4bug@amsat.org>
References: <20210117192446.23753-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Joel Stanley <joel@jms.id.au>, Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 qemu-arm@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: A6aKuXpDlb8P

This device doesn't have fields to migrate. Be explicit
by using vmstate_qdev_no_state_to_migrate.

Add a more descriptive comment to keep a clear separation
between static property vs runtime changeable.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/arm/msf2-soc.h | 11 ++++++-----
 hw/arm/msf2-soc.c         |  1 +
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/include/hw/arm/msf2-soc.h b/include/hw/arm/msf2-soc.h
index d4061846855..41a328c77f9 100644
--- a/include/hw/arm/msf2-soc.h
+++ b/include/hw/arm/msf2-soc.h
@@ -52,6 +52,12 @@ struct MSF2State {
 
     ARMv7MState armv7m;
 
+    MSF2SysregState sysreg;
+    MSSTimerState timer;
+    MSSSpiState spi[MSF2_NUM_SPIS];
+    MSF2EmacState emac;
+
+    /* Properties */
     char *cpu_type;
     char *part_name;
     uint64_t envm_size;
@@ -60,11 +66,6 @@ struct MSF2State {
     uint32_t m3clk;
     uint8_t apb0div;
     uint8_t apb1div;
-
-    MSF2SysregState sysreg;
-    MSSTimerState timer;
-    MSSSpiState spi[MSF2_NUM_SPIS];
-    MSF2EmacState emac;
 };
 
 #endif
diff --git a/hw/arm/msf2-soc.c b/hw/arm/msf2-soc.c
index d2c29e82d13..2d163710f54 100644
--- a/hw/arm/msf2-soc.c
+++ b/hw/arm/msf2-soc.c
@@ -224,6 +224,7 @@ static void m2sxxx_soc_class_init(ObjectClass *klass, void *data)
     DeviceClass *dc = DEVICE_CLASS(klass);
 
     dc->realize = m2sxxx_soc_realize;
+    dc->vmsd = vmstate_qdev_no_state_to_migrate;
     device_class_set_props(dc, m2sxxx_soc_properties);
 }
 
-- 
2.26.2

