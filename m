Received: by 2002:a19:5509:0:0:0:0:0 with SMTP id n9csp2052133lfe;
        Sat, 21 Mar 2020 04:51:23 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vtudmeV1uOGqCKJ+DHP6k//jxKXortjTKW2byiZfpfhT6i0wz32nFMbPkDWQZj0Pzkadtsk
X-Received: by 2002:a37:44c:: with SMTP id 73mr12519616qke.376.1584791483238;
        Sat, 21 Mar 2020 04:51:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584791483; cv=none;
        d=google.com; s=arc-20160816;
        b=P8y3V4WKa8KKd2SGgBoyVY+K9Kg5RkqSsL9Ys9JDp7JsqsgAvgg1drWC58g/wnCnoN
         /2ZcmgEmexsL49+5O6X54+5QK0dpKZXlzA/m7cVJrUx0mvfCZyKEZCHEmTX/JMev85HD
         P2CNHfkNAtL0kUDZgJ2MxD2gU21Got+NIMqF2OF+ocvHg1iYoFKwveunK8GthJzOeJJM
         J2Kopkrt3saJBXQv99xUKJ97es6oeKmwQNM11KnCdnn57DMGgdNpQr9Cb7sBke/mJwte
         WulFtJqNiNn5a67W2sUcMKGtb2CWuJFmNFLHTSOPD8ZsXbXktcB6KxoFqh2UdLr9s5at
         Z8gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=H2ZxNlM8IiHu0dxI+a0SAXUIREttoqtshJPpfqAJ9kA=;
        b=m36P1x1chrL+GYe0W7n5hbRGzuZ72ovL42xBLvKNfkGaIdd0sHYPHZB87y4mRU0I13
         JgCug//FQ5u1jM/na1LUjRYmgxJKgHcXBacs7nXhx/U9/hh7P1pZTRi93tCMDXl/v18P
         Z7zjshPGqxjBgLIDcT+g0zbhJmAZ5NWKqPFhZKKSRjZEEUUmusMPccPU6KaAYbfjOrT+
         oBfFR3jlZSCtpAV+SvDKHWbCC1B1CnHSMFt5w+QGtbKYQCT3xFEE3sFGFrw6mkJ+1nMM
         j/rNPgN4uagDHDQj3YKz6zaRIVibXQqejB4jHO2jWbCQ3eltD4HPEkUagEDHZKNQGBhr
         EUYA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=bH35ds0D;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h137si5335577qke.212.2020.03.21.04.51.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 21 Mar 2020 04:51:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=bH35ds0D;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jFcew-0001bl-KA
	for alex.bennee@linaro.org; Sat, 21 Mar 2020 07:51:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35195)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jFcbG-0002K2-Mz
 for qemu-arm@nongnu.org; Sat, 21 Mar 2020 07:47:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jFcbF-00071P-MY
 for qemu-arm@nongnu.org; Sat, 21 Mar 2020 07:47:34 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:24790)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jFcbF-000715-Jg
 for qemu-arm@nongnu.org; Sat, 21 Mar 2020 07:47:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584791253;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H2ZxNlM8IiHu0dxI+a0SAXUIREttoqtshJPpfqAJ9kA=;
 b=bH35ds0DMoZduKLgjBHWO9f4IJp1Ixr6/U+vBxA8umgGbczJIih/Mel+U6PAYq4D1c6Xo7
 VCPcuPUHJ1LiJijEUyNr7X9d79IhgEAwCkA+ME46Gq4VFXFENfEVhMD6CGMHVXigXjaeYP
 ABThzzCkxrdwxfeD/UxE3Ah855agx14=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-7-78lNXhrlMdO9mLFNigMsiA-1; Sat, 21 Mar 2020 07:47:29 -0400
X-MC-Unique: 78lNXhrlMdO9mLFNigMsiA-1
Received: by mail-wm1-f70.google.com with SMTP id g9so690999wmh.1
 for <qemu-arm@nongnu.org>; Sat, 21 Mar 2020 04:47:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=860B2IkAp+GSKWrMYmt9BxqMmpnco8VZzzV9xEgKT/A=;
 b=lxowBC1R29gQCH7vIay8BOaKDsXMFkO2wWI7/a6j2O9L3Xnek12mTrpI87+mSP7+d1
 oqhYJpzgwI5SsoG3LY4Kd+99+ZbGjFzK9dxlmtuJBClb89jCYNJzEE5+O34gQM57y3rR
 a0Ju1jSwVcaxA2GrNLyCYoHp2tLN+XaGZNkguElTba96Q0AvoUe1ueyWHE0YmhCQiS9I
 ppv5ZV9L5HHod1XlCfliqdm0szsg4S0rFhNv9jw91e+KvujUx3E5dkQ/0VeWSmY0t3tp
 QNKJacUIqcdQpiRVEHpYnDOYJPR2OOTViq8TIKOLOwC4YaJb3tNamoVOZHrrAZDPXQhg
 TvmA==
X-Gm-Message-State: ANhLgQ21Nl7TO6SrCaS0RzSJq5A9iJtXN4z1hhdxvX27/2OaUecV6B1j
 hFGB63bpdVcQnXp3EFhPxPOYRPOUso1K7e+AA7bXGi2/O2ZhEBwmlx/KOfma3XkoD4mVhchJZIk
 FxyrG0djsJLbW
X-Received: by 2002:a5d:6082:: with SMTP id w2mr17078563wrt.300.1584791248579; 
 Sat, 21 Mar 2020 04:47:28 -0700 (PDT)
X-Received: by 2002:a5d:6082:: with SMTP id w2mr17078523wrt.300.1584791248363; 
 Sat, 21 Mar 2020 04:47:28 -0700 (PDT)
Received: from localhost.localdomain (37.red-83-52-54.dynamicip.rima-tde.net.
 [83.52.54.37])
 by smtp.gmail.com with ESMTPSA id s22sm11269798wmc.16.2020.03.21.04.47.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Mar 2020 04:47:27 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-5.0 09/11] hw/timer/stm32f2xx_timer: Remove dead assignment
Date: Sat, 21 Mar 2020 12:46:13 +0100
Message-Id: <20200321114615.5360-10-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200321114615.5360-1-philmd@redhat.com>
References: <20200321114615.5360-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 216.205.24.74
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 BALATON Zoltan <balaton@eik.bme.hu>, qemu-block@nongnu.org,
 qemu-trivial@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>, Andrzej Zaborowski <balrogg@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 John Snow <jsnow@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
 Kevin Wolf <kwolf@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Max Reitz <mreitz@redhat.com>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zGxe5w2AEdsO

Fix warning reported by Clang static code analyzer:

    CC      hw/timer/stm32f2xx_timer.o
  hw/timer/stm32f2xx_timer.c:225:9: warning: Value stored to 'value' is nev=
er read
          value =3D timer_val;
          ^       ~~~~~~~~~

Reported-by: Clang Static Analyzer
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/timer/stm32f2xx_timer.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/timer/stm32f2xx_timer.c b/hw/timer/stm32f2xx_timer.c
index 06ec8a02c2..ba8694dcd3 100644
--- a/hw/timer/stm32f2xx_timer.c
+++ b/hw/timer/stm32f2xx_timer.c
@@ -222,7 +222,6 @@ static void stm32f2xx_timer_write(void *opaque, hwaddr =
offset,
     case TIM_PSC:
         timer_val =3D stm32f2xx_ns_to_ticks(s, now) - s->tick_offset;
         s->tim_psc =3D value & 0xFFFF;
-        value =3D timer_val;
         break;
     case TIM_CNT:
         timer_val =3D value;
--=20
2.21.1

