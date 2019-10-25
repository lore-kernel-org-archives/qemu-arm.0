Received: by 2002:a5d:4890:0:0:0:0:0 with SMTP id g16csp3490690wrq;
        Fri, 25 Oct 2019 01:51:39 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzSPpGspuzhzrFrbitFLkFNSRch9TZbfW4GRpzrELN/htVEvT1UiHz7Ul8cOm2KFK+cP5YI
X-Received: by 2002:aa7:cfcf:: with SMTP id r15mr2662817edy.286.1571993499011;
        Fri, 25 Oct 2019 01:51:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571993499; cv=none;
        d=google.com; s=arc-20160816;
        b=i+VG6VKox+ek4yWdUzkJSSKXdvfAHw1AKIj24SgsD81BQbuzO1SUiGpH5W806uxUU/
         j5F7gTUAaT+6z+xRfuzVc1zBhazJwxDHFJCG3MYoC9ezHecY1NmWJAw5INiFqtohlCCQ
         gbPcdKAlVP6HkB2j6WIV+akAECM6PbR1AgCDwXkXTF3Vr94nVjN5DgbF4/iHRmorSf1R
         WD+DwW8+eXOtY6R8eueZDBc2l5sL6PqApA2+LcArmUvNYpOqxQqO+27CobPYSEeLvKV0
         wyR+s29RI8AK1lBFhwFXbJFomGB2Y5a4sVIhvBz9/opvTBeHpkYxYac7hH665ZvOuy0P
         ysgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=Z8E5VQIt+QRaX2cT5i/HLWpjWE1XZU7ggv0PWW2IKOk=;
        b=t1XicTdDh1N64poi8wpDJvccd2+IRojtbKBqdm2OW2DjSXoyP3CnbX0gTLFNI4/ZRb
         IVFZIaKuxYegYV/rjEV1TlyWkhwWZwAVrUgWVfhUJlMaUv0I2m3I0k3dPBNW9i9wnU3a
         VgvBQyGfIr6IyURzo7rbm5tFWXGK+DNQ3Jcg2X/+Wc9W9ZrVgnZmyMJcBKge0aXdY1Bu
         7gYyx+1KxsRfvyx7ZvFD44Gz/fAKU56Mf3J9a+OdGR33kubSDHP/tfZVfHsf1s0xi5Xj
         gVRuovQc3OUuuybOsWqZl6og0ucG/QUQUPGtSkPuna+ZeQutshIsoo/JOxPssOUKZ6L3
         GR4A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a11si1030834edj.143.2019.10.25.01.51.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 25 Oct 2019 01:51:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:57722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iNvJp-0002GV-D9
	for alex.bennee@linaro.org; Fri, 25 Oct 2019 04:51:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50122)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1iNv5B-00014o-7H
 for qemu-arm@nongnu.org; Fri, 25 Oct 2019 04:36:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1iNv5A-000836-6j
 for qemu-arm@nongnu.org; Fri, 25 Oct 2019 04:36:29 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:59807)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1iNv4z-0007sV-Mm; Fri, 25 Oct 2019 04:36:17 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MUGyh-1iWTVR1uV9-00REYB; Fri, 25 Oct 2019 10:35:30 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 05/19] qemu-timer: reuse MIN macro in qemu_timeout_ns_to_ms
Date: Fri, 25 Oct 2019 10:34:57 +0200
Message-Id: <20191025083511.11463-6-laurent@vivier.eu>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191025083511.11463-1-laurent@vivier.eu>
References: <20191025083511.11463-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:uBpOxXMuLPxHKWK6/kD7EFF3c9UQZLvuAXfyn9fhAoa/clsGmUA
 K55b5ayMJJ4ds1bIRDXooVDF9dB2H3+0+zqjNy3OBx07di4AlLlQ4J9st0OPM0Re+ss4RYy
 zrw7Lr9je/Sz9awOZYYkQu1X8HLdZAeYIrHK1GbcqFZ/kJCbEvEtJMkbil2t0W/wPpHx8UX
 4+U0vZbfLQjurmXs6scJg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:yW8U9yc4Kh0=:7oXwoqjFFLnDYPJG07KtHS
 /JMkSNQJF/7qCculq4xK7/PBaJEU+4LbJKTn5tyBsqpBp/OkqYrK9424puhfi66VTB+0uFZM3
 cO0DpIWNnErxZhh9FSxDXgRLzWvSS4e2tUFltxN/aER8he/Y6O9giH8DhmjiPwV7W/NiORlPN
 0mjhkWI4qaQezpvL+1ssS5cSggm/fqmnUnP4QzEgUKnotLRU+QUabDFgftn+RRPQKFeKONAPh
 ISX7koluDhGcz7hGx2yAOJw+erchTBJ3OX2s1Lg0BAsYczkQ88p9Lw0DLmwRce8EQkhrsT0B9
 AOB9Ju6Q6fSKiWOFW5m4qoq+kQ+12uK6JXgBGTZGQyWrmgQ6/Y+ww6MYG/dSrjAjtqvjn3Xg8
 01nfLN8ODwih56jbeesczywVMzi3VXyYPZQYlpT1Fm2TzdBfAnvCIQI8c4GoJFaVaPw0XoGuJ
 +z6Kdm6RC+kAgtG5ZT04tObCNPSEF6YSGmJ1thCKvPzvf0T+n11Ss6lrjCeSY5nG9Afda8mKp
 KHxz3RtRg5JX9GhMkuDMU61QHaOIqYqs2nB0p4hcPKCoLe9UvscQPSs97YH0LfeHp3/aDs60j
 KNfYHs4ZKOC3+aU3bjpo42HGAfuVE7qKaz/x5O6RyYsjudt3Qiwt4ubWmlBP+q+yDVekSrucy
 QGP1nvkdyRTAhRm3224vQdDvyDpJBeoJEIff0gqs1EKNtCz3R8Xl+69KmOPVkDC2mp0aOjcY5
 TKioR2/aO2T7xu14TJWK8ebe7DkhYPNmZuWAAKLu4JqAqXU11gVDidnwyQ0TkXwm3VNprJGw3
 Gu+6mQSTIB2Pl+XsVFbL6NT2gi6lwUVjj8mn4I10G+TODDIzl1321zkULQKWRNRWK05sxD3PH
 b/TLPtdOomhaZSPmIk0Q==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 212.227.126.134
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
 Eric Blake <eblake@redhat.com>, qemu-block@nongnu.org, qemu-trivial@nongnu.org,
 Helge Deller <deller@gmx.de>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Andrew Jeffery <andrew@aj.id.au>,
 Laurent Vivier <laurent@vivier.eu>, Aleksandar Rikalo <arikalo@wavecomp.com>,
 qemu-ppc@nongnu.org, Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Frediano Ziglio <fziglio@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: J5VfNo2Zg48b

From: Frediano Ziglio <fziglio@redhat.com>

Signed-off-by: Frediano Ziglio <fziglio@redhat.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20191023122652.2999-3-fziglio@redhat.com>
[lv: removed the two useless casts]
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 util/qemu-timer.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/util/qemu-timer.c b/util/qemu-timer.c
index d428fec56772..ef52d28d3753 100644
--- a/util/qemu-timer.c
+++ b/util/qemu-timer.c
@@ -322,11 +322,7 @@ int qemu_timeout_ns_to_ms(int64_t ns)
     ms = DIV_ROUND_UP(ns, SCALE_MS);
 
     /* To avoid overflow problems, limit this to 2^31, i.e. approx 25 days */
-    if (ms > (int64_t) INT32_MAX) {
-        ms = INT32_MAX;
-    }
-
-    return (int) ms;
+    return MIN(ms, INT32_MAX);
 }
 
 
-- 
2.21.0

