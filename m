Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp6070712wrt;
        Wed, 6 Feb 2019 07:29:33 -0800 (PST)
X-Google-Smtp-Source: AHgI3IbKI035SHAX7+YMEyvG/zkrd4oMi45Cl0Z/MW8M9aNfTglz4xVoVxYqNtjrsUmulegkZywC
X-Received: by 2002:a5d:5409:: with SMTP id g9mr8605194wrv.88.1549466973301;
        Wed, 06 Feb 2019 07:29:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549466973; cv=none;
        d=google.com; s=arc-20160816;
        b=uE/k7wWPo6Cfyd2FqUsmH9RSiHwByy0MxtqlVQBgMpBTo3cuCijN5JEnYXho/Ym41D
         6GfV0CMvSNPpD1f9tJRhUT9bGEG3VjTHyJWbnrIOIzGNp/5TsB8DVa2mAejnSek8Q9tN
         jyMTrFeyWGXcSN6Th9+IsjPSDej6GfvlKkg9a1yAIK47ZOiHo2XlpMj4mcLr3CUIlrsQ
         vZAJ1ARmXoGg6ColO5E4CKqobcvuDlTtsOT753Q97SHhLaZgoy+jQYU+SAzcuf1hFFQw
         XQmCvWodnyKFsVTvvy8Ydmtr/OC2MMVhrtB3OaWmEAzID/QCdq4oDRV8xwDJiSasMsuG
         7DQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=J4yEgw2XkPfskhiYqlypog4UGgDVdC3wEp2w4VR04Bk=;
        b=hEQgjD30gOecZB7n8WLpUgFDmukz81P8X+3QpT59qf5eFlsBEpCA/oe7qm9kQGSVl5
         zsgUgJnq8NT/aPqJ3vi7mHng5Gc4POuHaNU7RBXH/p1k3P9JRuNsVVOg81B8iwfz0Fls
         wdxRPVlJaeWecmEIE+wtx+2HUaJsp+qNALjsZXvKxGMNwp38/1xGSYeDuoWn9WlBwdj8
         Kd2gj4X0xQrI46M7vCNk2UIifPZki8gBMPiz0kczB0A+BPjk7M9+lOCkflLh908LegAK
         zcjPXxybrF5+XeTEqzmwVR/6NVkWArQIZHVedsKIQsvawoRgwuYIECv0GSb5mTv2PiZH
         Jn2g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v15si8394014wrp.335.2019.02.06.07.29.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 06 Feb 2019 07:29:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:52631 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1grP8l-0000m4-Ih
	for alex.bennee@linaro.org; Wed, 06 Feb 2019 10:29:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55867)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1grP81-00009N-TV
	for qemu-arm@nongnu.org; Wed, 06 Feb 2019 10:28:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1grP80-0004Pv-6t
	for qemu-arm@nongnu.org; Wed, 06 Feb 2019 10:28:45 -0500
Received: from mout.kundenserver.de ([212.227.126.133]:54505)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1grP7y-0004MF-7T; Wed, 06 Feb 2019 10:28:43 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue009 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1Mdvyo-1hR0rH2Ah4-00b6Hi; Wed, 06 Feb 2019 16:28:25 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Date: Wed,  6 Feb 2019 16:28:07 +0100
Message-Id: <20190206152807.31896-8-laurent@vivier.eu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190206152807.31896-1-laurent@vivier.eu>
References: <20190206152807.31896-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:phOavywWNVsBXnFLU/hFHxIScoTktw3Qh/cVYO372smu4BBlmfV
	XUNo2yZVTe/BsPKV/y/aH3A1JX7WQsx93NvEXfuTAokUN9QkxOjXSMiHwTivcYWdExj9NNL
	QhLIH23R1KLOyamY7xPolasgu52p2sSMZli94sXl6a2e3giG6pxSGx+GOoy2zkfXF6L/HIA
	oMKqUfAGcp9J5XK+7WS4g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:sdjldisaT/0=:X/4oGKqGeTTdlov8fhN/Ke
	IQoqbwXHMiJ6v1ywy/NiLpo7nc9u3+DF730xIpzqcMgWQMAfn2GGpcW96t/c5UHbSMcK+8R/i
	omziyUBz7sCmpGnjOnOIEeMW7Xtx3uZBlP4zzlhxq0QBfFFMRI0I1T5ua97bNThgR8h4O+wMY
	SKB/8WQyqkyflj5/B25SUt/1NVSRuKD1CoA3ioL6m8tL33hnajgTtvA/mys1UdUb2CCZ/GZLD
	u1OqevcVVcSbloRxh7nYX/3a8+zTT3fBiDe1dhxtA3FhNFhA8gE4VaeAtIwQGrNxuDI4XH69M
	LqVyawOZZy522PClRruNp7JF8Hf+69WpcUNIgdieDdNmaHVi/YuzZeaR/kwTiLmpkF5eNNh81
	W7tclnk0kySxybCXxK29zQTLuyWaV6BNgPy6z2Pt5Nz+2vzCpLCjU4IFgjBeOmcmJ2nS3v6BD
	tzNC+Ph8DHifE/A55TYFuOneYBNmjoDrBOpC86q/wel5OMfzP9qmG7y9gB9RfQVt1gu7kmC65
	vWmwMmQIey4W0PxgyKzWAkyTeW5An4bs9ri7gKXQSBjw1DqUY9UL4Rw3a0hNzJWvUc/SmFTbw
	nlOBKXrUuQSwr0H+yWtR5qhj0Lyvt2RVVmDEVDpzkIMyimyRMhucwQSPZNjSiFBMTMHUeBonQ
	8K3gsFc8ACZqTPhK1lFbxM28uLnxOJWZllnYkhL9zKj1jV9g5qd+DH5zWPcU6YBhN+wwlE0DM
	9sJwB9o+sFQZopacDLDAhmj6OXrvfRHnEVr3e4ellcRCBAxAyJQmSvYPYj4=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.133
Subject: [Qemu-arm] [PULL 7/7] hw/input/tsc210x: Fix building with no
 verbosity
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, qemu-trivial@nongnu.org,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Anthony Green <green@moxielogic.com>, Michael Tokarev <mjt@tls.msk.ru>,
	Laurent Vivier <laurent@vivier.eu>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	qemu-arm@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Guan Xuetao <gxt@mprc.pku.edu.cn>, Andrzej Zaborowski <balrogg@gmail.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TdHEbA9a+uFA

From: Philippe Mathieu-Daudé <philmd@redhat.com>

When building with TSC_VERBOSE not defined, we get:
      CC      arm-softmmu/hw/input/tsc210x.o
    hw/input/tsc210x.c: In function ‘tsc2102_data_register_write’:
    hw/input/tsc210x.c:554:5: error: label at end of compound statement
         default:
         ^~~~~~~
    hw/input/tsc210x.c: In function ‘tsc2102_control_register_write’:
    hw/input/tsc210x.c:638:5: error: label at end of compound statement
         bad_reg:
         ^~~~~~~
    hw/input/tsc210x.c: In function ‘tsc2102_audio_register_write’:
    hw/input/tsc210x.c:766:5: error: label at end of compound statement
         default:
         ^~~~~~~
    make[1]: *** [rules.mak:69: hw/input/tsc210x.o] Error 1

Fix this by replacing the culprit fprintf(stderr) calls by a more
recent API: qemu_log_mask(LOG_GUEST_ERROR). Other fprintf() calls
are left untouched.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
Message-Id: <20190204204517.23698-1-philmd@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/input/tsc210x.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/hw/input/tsc210x.c b/hw/input/tsc210x.c
index ded0db9351..2eb3cb9518 100644
--- a/hw/input/tsc210x.c
+++ b/hw/input/tsc210x.c
@@ -552,10 +552,8 @@ static void tsc2102_data_register_write(
         return;
 
     default:
-#ifdef TSC_VERBOSE
-        fprintf(stderr, "tsc2102_data_register_write: "
-                        "no such register: 0x%02x\n", reg);
-#endif
+        qemu_log_mask(LOG_GUEST_ERROR, "tsc2102_data_register_write: "
+                                       "no such register: 0x%02x\n", reg);
     }
 }
 
@@ -636,10 +634,8 @@ static void tsc2102_control_register_write(
 
     default:
     bad_reg:
-#ifdef TSC_VERBOSE
-        fprintf(stderr, "tsc2102_control_register_write: "
-                        "no such register: 0x%02x\n", reg);
-#endif
+        qemu_log_mask(LOG_GUEST_ERROR, "tsc2102_control_register_write: "
+                                       "no such register: 0x%02x\n", reg);
     }
 }
 
@@ -764,10 +760,8 @@ static void tsc2102_audio_register_write(
         return;
 
     default:
-#ifdef TSC_VERBOSE
-        fprintf(stderr, "tsc2102_audio_register_write: "
-                        "no such register: 0x%02x\n", reg);
-#endif
+        qemu_log_mask(LOG_GUEST_ERROR, "tsc2102_audio_register_write: "
+                                       "no such register: 0x%02x\n", reg);
     }
 }
 
-- 
2.20.1

