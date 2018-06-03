Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp2139160wre;
        Sat, 2 Jun 2018 17:12:32 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKItj957AU/Aj3LIczF4tje+WZen/3jypSUL8sYH/45j0Dva2hInKfrEUOHMFM2duVunfvaY
X-Received: by 2002:ac8:31d9:: with SMTP id i25-v6mr15177587qte.247.1527984752642;
        Sat, 02 Jun 2018 17:12:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527984752; cv=none;
        d=google.com; s=arc-20160816;
        b=FomF8tGJQo6HEpu08E7MTIUj/PLJZVprIQWFT6VMKZQtkJNPrEzQiJ1Q1v7aZiYiIh
         iGgWocBdOEwMIbgwFuLQ5OyKotUYr+5WP6aA/Htkhff7pwgFnuPPAkQ0Rt85A1Ko6X77
         yrzTqdePARKCi/FeO2sxa0aXtvLoVEavs8e6XIdiSKCyyMK/QQawy0G0AJpW/T0J0MxG
         bgJ0dkvHRpyrGMf1vcXj4+nyDBnUCKdhnt7bueJm+aPOyfuW6JAMIDTn28gsXpe7GgCI
         Vk8OTIFCSwfh1NLwVR/KzV14LyJw4TCROlZXRpZGX4WpDEmdF52TttoMNDvMt8IqWuAj
         QBHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=IAGyLwpv3a5J8f3RNphJ9yfBZT3vwTiwYcQDW4gDTOg=;
        b=fBAFwMKdUTm6MeUN5Wu5ld8VOeiQpKMPEXQ943pddDC8dDcNvRqkcwqjzvVh1c5CFb
         dCqbRmixcfLbwyxcGlk7d0KRUdsGdu2j7c0joLS77mi08RM0cZ9BEIOPVRQiCZ0mAkog
         BNrERZtjPRtp55zrhu8DeUaoxf/HzhibO75Qe2MyDhAaVMR/MrRbrGoE4fezDD0q++az
         KsJEzKIATV9WNPi6QjDB9Nti2lQyZ5hIHE1PL9rF+mNq+qjvEBpeJ0gKaXEg/FgXFFN3
         akw3r8zgJg+WkxSFv7VUOhq5ocqqadcqaXpjVpgnqr7bZHluVmgO6AtpdbD3KgFd6OsC
         e5Tw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=n4H8D9QZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j15-v6si1107213qvf.89.2018.06.02.17.12.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 02 Jun 2018 17:12:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=n4H8D9QZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33136 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fPGdM-0006hp-3U
	for alex.bennee@linaro.org; Sat, 02 Jun 2018 20:12:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59601)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fPGZw-00044n-T5
	for qemu-arm@nongnu.org; Sat, 02 Jun 2018 20:09:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fPGZv-00031G-W1
	for qemu-arm@nongnu.org; Sat, 02 Jun 2018 20:09:00 -0400
Received: from mail-qt0-x230.google.com ([2607:f8b0:400d:c0d::230]:39856)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fPGZt-0002zy-Kg; Sat, 02 Jun 2018 20:08:57 -0400
Received: by mail-qt0-x230.google.com with SMTP id p23-v6so11831491qtn.6;
	Sat, 02 Jun 2018 17:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=IAGyLwpv3a5J8f3RNphJ9yfBZT3vwTiwYcQDW4gDTOg=;
	b=n4H8D9QZehbxCCFjBsNgYgK3+9ocBfGsM5oJ4PxOEEL0lrIrmuP6TTeRTgTaK2gqj7
	8asjxw7KDc+mU15breNHxAB+hF4vcakZOrQyQghAbtKlwn+uhmcUqr0bEBsjyq4971lR
	NcL+Lc4eYUQnO01cYZO+9Gx0Ux1/HQeTMzf31i+8wCAM0sU997ndvHo/2m0zVSK5xl9o
	KUW2hh6wbTl4xBJVSdVbLuwqjo8cCtitHw39iWDtDQQcnFL94rWpXbXQa8MCBSkB237+
	Yll+nJhM434XekvvfgPciKbYH03Ur5gJoz7S1UOo/WRa0NaHDUuyZ/vLxelK2+1jl2F3
	4H+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=IAGyLwpv3a5J8f3RNphJ9yfBZT3vwTiwYcQDW4gDTOg=;
	b=rxrhi4JEHAdblNuIiHfqv1B2HYTdAOu4b64W7I3CU3r4zTyMGCPwKSdnvL+rl8vOOU
	1HdB+H1IJZVQ1r2V1OM20YRKdTgghUpOHs6JnYfqjjtwSY89Gcr1213L0KNGbF45owF0
	qcQKuVzv+oxfs0fFxFu5x7b3l/1rA+8D8Yt5NtVoeGmYgPCkR7oxRO3BpSefjSSPIxZx
	CacgiFjSxOGa+BurWeuWjZY4m7HsOfQ4nvIMeJBsETA9qyiYSqbXQ+izCMZjxQGkJT4a
	m88rMsKnkm0iaeY+YcgpnZoN2ixnr8BvmhJ+V81VrVdxYqhjNPWguujAW3dvV3mN0vqH
	PVog==
X-Gm-Message-State: APt69E3We5PBKPU16HIadPXYWQLC1QQJtNMlVSfh4KPICf1+r0Ecqsfa
	TUZHEbcuVY05DRGNQWcJolU=
X-Received: by 2002:ac8:3f24:: with SMTP id
	c33-v6mr7541192qtk.235.1527984537220; 
	Sat, 02 Jun 2018 17:08:57 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	17-v6sm10610894qkg.97.2018.06.02.17.08.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 02 Jun 2018 17:08:56 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair@alistair23.me>,
	Peter Maydell <peter.maydell@linaro.org>
Date: Sat,  2 Jun 2018 21:08:26 -0300
Message-Id: <20180603000827.30872-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180603000827.30872-1-f4bug@amsat.org>
References: <20180603000827.30872-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::230
Subject: [Qemu-arm] [PATCH 7/8] sdcard: Reflect when the Spec v3 is
 supported in the Config Register (SCR)
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PIvg2KZsp1cs

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/sd/sd.h | 1 +
 hw/sd/sd.c         | 7 +++++--
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/include/hw/sd/sd.h b/include/hw/sd/sd.h
index 7c6ad3c8f1..b865aafc33 100644
--- a/include/hw/sd/sd.h
+++ b/include/hw/sd/sd.h
@@ -57,6 +57,7 @@
 enum SDPhySpecificationVersion {
     SD_PHY_SPECv1_10_VERS     = 1,
     SD_PHY_SPECv2_00_VERS     = 2,
+    SD_PHY_SPECv3_01_VERS     = 3,
 };
 
 typedef enum {
diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index da65f2b178..83426da133 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -315,11 +315,14 @@ static void sd_set_scr(SDState *sd)
     if (sd->spec_version == SD_PHY_SPECv1_10_VERS) {
         sd->scr[0] |= 1;        /* Spec Version 1.10 */
     } else {
-        sd->scr[0] |= 2;        /* Spec Version 2.00 */
+        sd->scr[0] |= 2;        /* Spec Version 2.00 or Version 3.0X */
     }
     sd->scr[1] = (2 << 4)       /* SDSC Card (Security Version 1.01) */
                  | 0b0101;      /* 1-bit or 4-bit width bus modes */
     sd->scr[2] = 0x00;          /* Extended Security is not supported. */
+    if (sd->spec_version >= SD_PHY_SPECv3_01_VERS) {
+        sd->scr[2] |= 1 << 7;   /* Spec Version 3.0X */
+    }
     sd->scr[3] = 0x00;
     /* reserved for manufacturer usage */
     sd->scr[4] = 0x00;
@@ -2067,7 +2070,7 @@ static void sd_realize(DeviceState *dev, Error **errp)
 
     switch (sd->spec_version) {
     case SD_PHY_SPECv1_10_VERS
-     ... SD_PHY_SPECv2_00_VERS:
+     ... SD_PHY_SPECv3_01_VERS:
         break;
     default:
         error_setg(errp, "Invalid SD card Spec version: %u", sd->spec_version);
-- 
2.17.1

