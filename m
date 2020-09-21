Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp3621603lfq;
        Sun, 20 Sep 2020 20:47:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxFaaRfonv/chPy9hmzj7ASBLjUg4xTPDWyoZAMHxXW7HLqzRJLqEUhGDPmY8h5s1ZzCJJS
X-Received: by 2002:a25:8541:: with SMTP id f1mr28766463ybn.230.1600660077111;
        Sun, 20 Sep 2020 20:47:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600660077; cv=none;
        d=google.com; s=arc-20160816;
        b=gs/GzZAwanXKGVKzRF+98ZcRTSY5cfGwLdcWh/TzqhHRQ2ki2JBQsIK/mZaSjmoAYY
         MDdKdvcGPTVHjQbnoxwwV+j4QItLGqWhaZUHFmzxoHGa0/rvTRGTGJV57fgvRCK5ubIq
         50xfEU9MdqT8WCeIH9MUqxRyi19A9WexHJuZGne6Dg5ozYENOc++PSJu3fAWZVSIgtL8
         22d7f1SRwMwX767+z+QTDPcAQGmmmkMi40J8XLPrwEp+cmLrsanMXFWscrUKPne/66xt
         n5J2yxzpgytcolnthbsV9Yd9i4j2RUmfxVesXcIKoBuAZ6o1etPosnsPFpu2ZO0nvu67
         2HEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=KdvaemirANjxASMz4DV4dQ6pghmLGYonwRX/Dh0qzZc=;
        b=Zqx5lGT6IsZxTa72rTCwl3VjxlArxd3YxqXPz1c5RQontZmvm6tCY2NH8Qy+Qlsn4A
         y964IZIUUQZa1skRNR2DTR0D8mEIze0DV3KUR3Gou2xY3rJn116lc23HAsxzumF1DZjQ
         bk3O2BZ21AJ1CPzf0v48H6iA5syLDMz8JRN7e6u2o7niEs9bFvyNgP6kReMU9WQKcdSw
         7/HvJoXEyiT1PxBVxJ9eYKK8aAuBdkDVF2m1RN14lBG4rV2HvJA7Ejkti7UAaZCH687i
         VMhCUVdjZoyWu2sjMt4NQOZH9zpwwOEaeKm7awwC/Aa4tzg5m531V9Y3Mhdu+Ps2rzvk
         22zg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=jxiIAdJ7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a2si6057091ybc.216.2020.09.20.20.47.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 20 Sep 2020 20:47:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=jxiIAdJ7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:38278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kKCo0-0006oc-G5
	for alex.bennee@linaro.org; Sun, 20 Sep 2020 23:47:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kKCnh-0006OM-1G; Sun, 20 Sep 2020 23:47:37 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:36618)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kKCnf-0001wL-Iy; Sun, 20 Sep 2020 23:47:36 -0400
Received: by mail-wm1-x343.google.com with SMTP id z9so11039790wmk.1;
 Sun, 20 Sep 2020 20:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KdvaemirANjxASMz4DV4dQ6pghmLGYonwRX/Dh0qzZc=;
 b=jxiIAdJ77HW4opFpV5DRvKmQBqumR8pwmz3L/YxvsJpMOyN+n/GDDQKe5dCZfW0OyE
 J+kune1gasTRfaEIlrEE0rLBCA8ObmizUJu05tUQ1olc8Lj1eWH9WV/12wPtF2FpcqUD
 BzqRW9Cq3/Sra6gkjQaciEM/yS/zGDoYv/B0ddMBZXp3CMIn77iV6AUA8huE29ZhnWCy
 T7t6iqk0+wbb+sPNaTuB/IvxXFgvJlvQqsdTdHSvrVRs7nHuVnJZCl6A74ghfWgbwdQN
 lWnWVHLAOSQJIPR0H4dWf3BwLhIn9EjsDl/I3jR3y8w9jIX+fYsZKYk/raRrtzFilygn
 FtSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=KdvaemirANjxASMz4DV4dQ6pghmLGYonwRX/Dh0qzZc=;
 b=jW3GMyKvapG6/N5sjvr+G7wV2nVFSoWQpVD0Y9masVMJw3G5XgoqcFl4Qrod+zcUJt
 65qscCjPkZ2gwUgtHBGNS1/7qdmCBQuxOutDtqMFp+vGRz/RFR3M6+JZZkpOiBor5twK
 5Zn2tffxhV6rTjycLgEDLFdY6njLk12Q8OCix9u5X9Y5Uxgt4QJVaaaGQBw3rj831tZh
 pPFhwg0Kwa2WCLM7tc0Gj6j4072B2YqZUf5BoR5WVer+cqK1GNrD1cSqCU7zOEi2Kwwq
 pQt9XWLIAzd+/IKNsXmLNSJf4tulNogckkEJZIQ2J+LjCvneQdya58K8K5LdRcsrI4rs
 nRKQ==
X-Gm-Message-State: AOAM533T8RzPsILFX/vuC+oRPas49XkfFuJAVOgFplK2h0sNH9WreGZP
 U+ha7rKfdSV7WbzwsVQIZ87WWpDNC+k=
X-Received: by 2002:a1c:4303:: with SMTP id q3mr27817605wma.158.1600660053209; 
 Sun, 20 Sep 2020 20:47:33 -0700 (PDT)
Received: from localhost.localdomain (65.red-83-57-170.dynamicip.rima-tde.net.
 [83.57.170.65])
 by smtp.gmail.com with ESMTPSA id u63sm11751440wmb.13.2020.09.20.20.47.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Sep 2020 20:47:32 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/3] hw/arm/bcm2835: Add more unimplemented peripherals
Date: Mon, 21 Sep 2020 05:47:28 +0200
Message-Id: <20200921034729.432931-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200921034729.432931-1-f4bug@amsat.org>
References: <20200921034729.432931-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Paul Zimmerman <pauldzim@gmail.com>, qemu-arm@nongnu.org,
 Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AKpk4lLa0cm3

The bcm2835-v3d is used since Linux 4.7, see commit
49ac67e0c39c ("ARM: bcm2835: Add VC4 to the device tree"),
and the bcm2835-txp since Linux 4.19, see commit
b7dd29b401f5 ("ARM: dts: bcm283x: Add Transposer block").

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/arm/bcm2835_peripherals.h | 2 ++
 hw/arm/bcm2835_peripherals.c         | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/include/hw/arm/bcm2835_peripherals.h b/include/hw/arm/bcm2835_peripherals.h
index b4d3ae121ac..ccd9eb11102 100644
--- a/include/hw/arm/bcm2835_peripherals.h
+++ b/include/hw/arm/bcm2835_peripherals.h
@@ -47,6 +47,7 @@ struct BCM2835PeripheralState {
 
     BCM2835SystemTimerState systmr;
     BCM2835MphiState mphi;
+    UnimplementedDeviceState txp;
     UnimplementedDeviceState armtmr;
     UnimplementedDeviceState cprman;
     UnimplementedDeviceState a2w;
@@ -68,6 +69,7 @@ struct BCM2835PeripheralState {
     UnimplementedDeviceState otp;
     UnimplementedDeviceState dbus;
     UnimplementedDeviceState ave0;
+    UnimplementedDeviceState v3d;
     UnimplementedDeviceState bscsl;
     UnimplementedDeviceState smi;
     DWC2State dwc2;
diff --git a/hw/arm/bcm2835_peripherals.c b/hw/arm/bcm2835_peripherals.c
index a9d7f53f6e9..15c5c72e465 100644
--- a/hw/arm/bcm2835_peripherals.c
+++ b/hw/arm/bcm2835_peripherals.c
@@ -343,6 +343,7 @@ static void bcm2835_peripherals_realize(DeviceState *dev, Error **errp)
         qdev_get_gpio_in_named(DEVICE(&s->ic), BCM2835_IC_GPU_IRQ,
                                INTERRUPT_USB));
 
+    create_unimp(s, &s->txp, "bcm2835-txp", TXP_OFFSET, 0x1000);
     create_unimp(s, &s->armtmr, "bcm2835-sp804", ARMCTRL_TIMER0_1_OFFSET, 0x40);
     create_unimp(s, &s->cprman, "bcm2835-cprman", CPRMAN_OFFSET, 0x1000);
     create_unimp(s, &s->a2w, "bcm2835-a2w", A2W_OFFSET, 0x1000);
@@ -356,6 +357,7 @@ static void bcm2835_peripherals_realize(DeviceState *dev, Error **errp)
     create_unimp(s, &s->otp, "bcm2835-otp", OTP_OFFSET, 0x80);
     create_unimp(s, &s->dbus, "bcm2835-dbus", DBUS_OFFSET, 0x8000);
     create_unimp(s, &s->ave0, "bcm2835-ave0", AVE0_OFFSET, 0x8000);
+    create_unimp(s, &s->v3d, "bcm2835-v3d", V3D_OFFSET, 0x1000);
     create_unimp(s, &s->sdramc, "bcm2835-sdramc", SDRAMC_OFFSET, 0x100);
 }
 
-- 
2.26.2

