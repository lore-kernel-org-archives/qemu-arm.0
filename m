Received: by 2002:a17:504:26c2:b0:1be9:327d:8ee3 with SMTP id j2csp853630nji;
        Thu, 29 Aug 2024 06:32:19 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWnd5Mut++KVE3tcKlyI/zvjAticz1chxDVC6pQIyt+/9v038yt+2E/Ow9TmCLomCsinu/R4opmkPPvsg==@linaro.org
X-Google-Smtp-Source: AGHT+IF/d/V3x71HjKdlVni0d21ohijrLcb9/16bXOU27Yfs9O3bQbpFV+kMHx0qGy41g/mLnRbm
X-Received: by 2002:a5d:58f8:0:b0:371:7e1b:871b with SMTP id ffacd0b85a97d-3749b551e81mr2093762f8f.29.1724938339317;
        Thu, 29 Aug 2024 06:32:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1724938339; cv=none;
        d=google.com; s=arc-20240605;
        b=HXXSQfOM31DuIIylEHwhFmBwjZe9U3B3yUaVeKcsU3J3RpoiMAWjjvd82eDUIqqysq
         h00MxZTWp/ygsnlL3SlyM0MB8NnU7OFAaHJVxuHO/Lly6tDFEUHL9LA9J1pVd8IVFguJ
         t+5NrpEupymnDSVnMalTUc/F82rDhYaeVaPUc816IjvlHQT+/Zr+Fxm8NMjtUo7qGKmb
         PFufUo+9sdBsq2XsA2kIC4iCxY9ANu2AuSm/ozNGsb6TRDgsClmsP8GP2M2At8tPMMYu
         IM38TSdK5mw3zwzOxuKybh9jsbek2YPAHn/7euEJ6ueCKyPvD+Uo4Q3HpJ0G4YWoyGEx
         G51g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:thread-index:thread-topic
         :content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date;
        bh=amzGSGLTSLWXQyCq3hatF+Hv0OyXKYodG+BQadiVbfk=;
        fh=7cN3o/iiqCA14FYy9nF21q5HztgiH/zsfdp2UmfZI0Y=;
        b=HxjbgoWtO40xBi4TCHtfjYz9ONRrp5DNDgs4uwN+QiMAPShH/95QYPPKFi9MxKXMwo
         elyZ/1rDg/xbhVKv/2rjTjzg7TdM4V9xNbP+41QXBf1vJv5yyZol3ThzV1LafIS12Xa2
         Z+P19/Z8EppKsNtYlps+CLOjfswPo1zW8E/AdqhXRYdIPXtb8KV7FarMudDGv6RsQJeg
         yqgbtp4XhGU2RvQ9qwm+d62Ptkt5Yd0ryrlGpnqrTB215xN6e8NjHr0qAR3cTfUow0/g
         8EfSlMzsDmaJ2w9OCFzQj7B7WWhiT2w7N7dj4EnjlmC1tt0xByzTLRuGagY6D8BJahBw
         BLJQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 5b1f17b1804b1-42bb6deacb2si7139505e9.3.2024.08.29.06.32.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Aug 2024 06:32:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sjfFl-0002TS-Cl; Thu, 29 Aug 2024 09:31:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebastian.huber@embedded-brains.de>)
 id 1sjfFk-0002ST-2t; Thu, 29 Aug 2024 09:31:56 -0400
Received: from dedi548.your-server.de ([85.10.215.148])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebastian.huber@embedded-brains.de>)
 id 1sjfFh-0003L2-W4; Thu, 29 Aug 2024 09:31:55 -0400
Received: from sslproxy04.your-server.de ([78.46.152.42])
 by dedi548.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.96.2) (envelope-from <sebastian.huber@embedded-brains.de>)
 id 1sjfFc-000KqY-0q; Thu, 29 Aug 2024 15:31:48 +0200
Received: from [82.100.198.138] (helo=mail.embedded-brains.de)
 by sslproxy04.your-server.de with esmtpsa (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.96) (envelope-from <sebastian.huber@embedded-brains.de>)
 id 1sjfFc-0008hG-1A; Thu, 29 Aug 2024 15:31:48 +0200
Received: from localhost (localhost [127.0.0.1])
 by mail.embedded-brains.de (Postfix) with ESMTP id DDD5A480180;
 Thu, 29 Aug 2024 15:31:47 +0200 (CEST)
Received: from mail.embedded-brains.de ([127.0.0.1])
 by localhost (zimbra.eb.localhost [127.0.0.1]) (amavis, port 10032)
 with ESMTP id 5UqitALMj2Q1; Thu, 29 Aug 2024 15:31:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.embedded-brains.de (Postfix) with ESMTP id 749BA4801BB;
 Thu, 29 Aug 2024 15:31:47 +0200 (CEST)
X-Virus-Scanned: amavis at zimbra.eb.localhost
Received: from mail.embedded-brains.de ([127.0.0.1])
 by localhost (zimbra.eb.localhost [127.0.0.1]) (amavis, port 10026)
 with ESMTP id GJ3th0uv7_34; Thu, 29 Aug 2024 15:31:47 +0200 (CEST)
Received: from zimbra.eb.localhost (zimbra.eb.localhost [192.168.96.204])
 by mail.embedded-brains.de (Postfix) with ESMTP id 4F259480180;
 Thu, 29 Aug 2024 15:31:47 +0200 (CEST)
Date: Thu, 29 Aug 2024 15:31:47 +0200 (CEST)
From: Sebastian Huber <sebastian.huber@embedded-brains.de>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 Alistair Francis <alistair@alistair23.me>
Message-ID: <694012793.134674.1724938307291.JavaMail.zimbra@embedded-brains.de>
In-Reply-To: <CAFEAcA-p+CBeKTgH-YXzrATKDpwG5iY+A3WGaVkbEeHCXxTzug@mail.gmail.com>
References: <20240828005019.57705-1-sebastian.huber@embedded-brains.de>
 <CAFEAcA-p+CBeKTgH-YXzrATKDpwG5iY+A3WGaVkbEeHCXxTzug@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/xilinx_zynq: Enable Security Extensions
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [192.168.96.204]
X-Mailer: Zimbra 9.0.0_GA_4615 (ZimbraWebClient - FF115 (Linux)/9.0.0_GA_4615)
Thread-Topic: hw/arm/xilinx_zynq: Enable Security Extensions
Thread-Index: xRCJRVSMo8Gofd7M0UxQXxVZXgJSAA==
X-Authenticated-Sender: smtp-embedded@poldi-networks.de
X-Virus-Scanned: Clear (ClamAV 1.0.5/27382/Thu Aug 29 10:52:14 2024)
Received-SPF: pass client-ip=85.10.215.148;
 envelope-from=sebastian.huber@embedded-brains.de; helo=dedi548.your-server.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: Mo8BLHZig43s

Hello Peter,

----- Am 29. Aug 2024 um 14:50 schrieb Peter Maydell peter.maydell@linaro.o=
rg:

> On Wed, 28 Aug 2024 at 01:51, Sebastian Huber
> <sebastian.huber@embedded-brains.de> wrote:
>>
>> The system supports the Security Extensions (core and GIC).  This change=
 is
>> necessary to run tests which pass on the real hardware.
>>
>> Signed-off-by: Sebastian Huber <sebastian.huber@embedded-brains.de>
>=20
> (Added the maintainers to cc.)
>=20
> Does the system have any secure-only devices, RAM, etc?
>=20
> How much testing have you done with this change? (The main
> reason we disabled has-el3 on this board back in 2014 was
> as a backwards-compatibility thing when we added EL3 support
> to the CPU model -- we didn't have a ton of images for the
> board so we erred on the safe side of not changing the
> behaviour to avoid potentially breaking existing guest code.)

I only tested this change with the RTEMS test suite. I added new tests for =
the exception handling and this change was necessary to trigger FIQs.

I haven't used this machine to work with Linux so far.

--=20
embedded brains GmbH & Co. KG
Herr Sebastian HUBER
Dornierstr. 4
82178 Puchheim
Germany
email: sebastian.huber@embedded-brains.de
phone: +49-89-18 94 741 - 16
fax:   +49-89-18 94 741 - 08

Registergericht: Amtsgericht M=C3=BCnchen
Registernummer: HRB 157899
Vertretungsberechtigte Gesch=C3=A4ftsf=C3=BChrer: Peter Rasmussen, Thomas D=
=C3=B6rfler
Unsere Datenschutzerkl=C3=A4rung finden Sie hier:
https://embedded-brains.de/datenschutzerklaerung/
