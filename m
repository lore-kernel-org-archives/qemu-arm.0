Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp1711770wru;
        Sun, 30 Jun 2019 08:14:29 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwcpgkVAn+aoWBt5FeZU8J+d23SRmrbde160eZZG9TZYXFqbamFzyPT+ZbEhZxp6jjnqIX0
X-Received: by 2002:a50:9f81:: with SMTP id c1mr23483512edf.140.1561907669117;
        Sun, 30 Jun 2019 08:14:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561907669; cv=none;
        d=google.com; s=arc-20160816;
        b=L2lLBrXrPheWHR2TOSoZxJQ6r6EFS3onL9j/gqjtxXKDZYReeMoeG3MWqC59qbDJm5
         MEZeeT4H1ud3rm2rLXSL/eKUxnurcmIaXgwlPgU+vTbRXsoXlxqP6DT2T6fdzcVAd2ul
         UR+Q/Zpff/yNe33LCaOoQKFjF+t1kK6wrfzZDIcOofrtYa07m9ey5yLSmEdKxyVxZVhM
         Q4eurm0/dM6fCh4nTWLfBt16pg/IM1m2tw1vMMNtopfgr+sl49zdqJD+w7fouuj1bUZl
         6v5+n1jkWAt5RwkGzjynbaKN+JokQq7aq5QRPnf5+q78BV/pzk650UAsduAgAVZzrgQJ
         w0Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:mime-version:user-agent
         :date:message-id:from:to:dkim-signature;
        bh=NrRxKHKBNPnum80Loc7Jh0hI+kiFNxCjbi36HK5rd2I=;
        b=s+4AI31Dxj+UuBatF49zfuevMmw6cFq+3nSHXl0hY7bhaywbQqEAyXvyulNTsx1Hb/
         ticz1X+mtawO0Z6stRAu05nFQ7vvGHbpxfJe3j5zZwKx9uuza0OCP3SPIBNhUaH4U0Ke
         pO1o1NVoW1O5wW1gHZhoJ7BOuXpa1vmuLSVh1If96RxlW9IbIPHbrA6Qz4pJDrP9EZJh
         g3fYlN/BxKo9hPpeJcw6hS4nloZekrfzeiSVJcTXwFEbTQdhHmlZBGfNVpmElP/KJbPU
         SzNS+U0+78KOpnsZt/JnKVchwL6GK2k0FtAZ+ox4t9T1zYG4U4/xsQDxqahvZiO/RFPq
         Tp0w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@web.de header.s=dbaedf251592 header.b=GmjezbLz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h57si7156017ede.320.2019.06.30.08.14.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 30 Jun 2019 08:14:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@web.de header.s=dbaedf251592 header.b=GmjezbLz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:45172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hhbXA-0000XZ-5R
	for alex.bennee@linaro.org; Sun, 30 Jun 2019 11:14:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33708)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <jan.kiszka@web.de>) id 1hhbWi-0000WM-SR
 for qemu-devel@nongnu.org; Sun, 30 Jun 2019 11:14:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jan.kiszka@web.de>) id 1hhbWg-00046N-B6
 for qemu-devel@nongnu.org; Sun, 30 Jun 2019 11:14:00 -0400
Received: from mout.web.de ([212.227.15.4]:45597)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <jan.kiszka@web.de>)
 id 1hhbWf-00043I-Rh; Sun, 30 Jun 2019 11:13:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1561907629;
 bh=alf1ZB0GMEYVJjvAyTZXbZPl5lNaMI8bb6k1cgD7oac=;
 h=X-UI-Sender-Class:To:From:Subject:Date;
 b=GmjezbLzfekGlartjG9xfhq9XsZIdaNqSpN0Juox/zvtC+hXmqsLXOgk236lLX4wZ
 GWPC5FCSiS6EajOIZU2B2ceb3WnoWSD/EsMqFhNI0Oztnpa9g9rBU/JqmX/OkWw++d
 ds+P0KqOuNK9iAyLAmh/3u/Mco8+ziCt1kDA/644=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.10] ([95.157.54.22]) by smtp.web.de (mrweb002
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0Mare6-1hxUmN2jhy-00KOFq; Sun, 30
 Jun 2019 17:13:49 +0200
To: Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <fc5404f7-4d1d-c28f-6e48-d8799c82acc0@web.de>
Date: Sun, 30 Jun 2019 17:13:45 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:UpL+pBZwu7CpeucXmLNWuM44Bz03JywYZc9St6YcBFiqFA+M4Nx
 csR51t1D9OWvjRHIY7VyJA2gWn5AN5yTvTbJZtFoI/T4m3JWrKv7icSIZY5dBTP24QgXj9G
 xE1phOh/5pS5ztzBNzxBWpv2J5lxYiN+AW1zLT36DMh9nULHHMzVepiNeHYHf2D8IKc9q5A
 PBwWTf+3oMVIc9ztnU9aQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:H4r+a8+HF0w=:2MpzlHQHXtKzs7/mN0uQf2
 ozA4oCBmu+7uSdaTQpbiZkAIp+Qn6KmkaDaxCB2FL2U5512zYg5bv4ZvVMrelwvuOFowTU0FE
 vtxbSXVjI59NwG1j0y82V6LzYee2yRdQHBCZsz8U/JaNXaoAWYlBLWYvHB1DhcxEY26Aihh7B
 34skhlRBbdzc9gdWdFIcdT/BdikDxiAZkjl4fAsFoEyXeWIUexJQTe9GPVeGuuuFkd3rvZ9L6
 6knoDDamwWRaeVHK1TK36mQmjRPSCvn7Plk+ptepIkfFPcntTmN7pW+7Mc7HiSczJUTTP1Cmp
 yXNApHkxDeFhUV/VUw7hDymQxd5GGuZ6DGmbmZ0mWheXhZj6s1XGIaloRcx3krNYp7zSFRCni
 iVGJ44LWFGE54ONwSpXI+CQc9q+XCaNJA7aLcD00JY6Ot4RZDmwkxR+Pt2tfpm/JpGvvOVwbc
 6gXrAiafpz0ydrQ3DDHzxHVeIVOTV9RuCDUlQ8nXb/BeD7fFpm9HU0es3LgmrWWb9Z+dLZiPa
 3uWsoxl1ECaPwQBMKAchPp+7dd8oomN0y6BgSvUL7tChdFW07J0BmHWqEm+V1e6hK8xk5rT/X
 dfxmffhLRoKkjoI3bu62TPyuEhLVEqQhHLfeKEr9E8FVxvbqn7g4po1WKUnQvwN1cMfxxgJUi
 /pom3tYlkn5i4LRiVN7rI+LcfLfGQgafo9FW9tIxz9Vxl6tfsMzfxZY6mPthwjxObbaXnKRPB
 rrgN/Mv6WKZicFol97QLBEHl+HbxCp4kPB5SWwYFWSA5dK61nmv/7o8AH3wS1LAD398jYMdQL
 KpGFcg9wpKJ19LneTzHUMSs6bhNy6Sqd3PTMfqHNBV71mKzg74Et7kOhHHS6LesC+l7zMupWA
 EbHdVvl+zUpTWV835SRk1wooRzcix1oOONi8u3UBvxLFFh8GWkNIxFTMd8ZIluwPJ91G5lI9L
 niaJixIDxMBXjN1Qc3WyXd6YUkhHJD5HVR6mKF3iNTh8Hw66738v6fcM64IoO4dr0VtqeS4Sx
 sIuaQWI0N2QbEmPirUtJnokRQe6lpFHxMTNYwrWVhzYWPNG6M9ma6uo1Y+nWeZww/Gv43Ww6P
 Qc9GgpnIu0r3H3zamioxcDByKs94zAMqctw
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.15.4
Subject: [Qemu-devel] [PATCH] hw/arm/virt: Add support for Cortex-A7
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dAMYE7bvb8Kf

From: Jan Kiszka <jan.kiszka@siemens.com>

No reason to deny this type.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
=2D--
 hw/arm/virt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 431e2900fd..ed009fa447 100644
=2D-- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -176,6 +176,7 @@ static const int a15irqmap[] =3D {
 };

 static const char *valid_cpus[] =3D {
+    ARM_CPU_TYPE_NAME("cortex-a7"),
     ARM_CPU_TYPE_NAME("cortex-a15"),
     ARM_CPU_TYPE_NAME("cortex-a53"),
     ARM_CPU_TYPE_NAME("cortex-a57"),
=2D-
2.16.4
