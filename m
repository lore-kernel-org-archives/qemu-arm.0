Received: by 10.223.161.27 with SMTP id o27csp773207wro;
        Thu, 26 Oct 2017 07:30:18 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+TF79dbeY3k9D5/y1BjFquO4CW6F6GdP8LpTaTXVJopkGSSYiQpRMwdI2G6QSPUv2OTjkpG
X-Received: by 10.37.224.140 with SMTP id x134mr3513781ybg.440.1509028218141;
        Thu, 26 Oct 2017 07:30:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1509028218; cv=none;
        d=google.com; s=arc-20160816;
        b=ObnGmMW5+sqsUC0dDFxZgelO7K05faUhfldBrK7IrrqI7OlIb80Uw6uXqvRe1YAWOX
         cMxKJFs+xhna+qmEgDXV24JWdNFZx8h+M9CfHJpOGvzZPspTz7ZJmG/hjtvvzRAzWCTs
         Mi0OoUUG8DPQS7c2+i6wbXogdiYzlu887gfjR1dnfpNaZYZSOyTsRgiNanjRnESY7Pjq
         +flSUjmrnj8oAewKX8u/Et+lvDAQVJvvw9BGJCVoju6sVsMty9PIEHNGcpoUpVNh4Wws
         y2jNuRwsoM2lKt20yn/CeTRDWK80QW5lxoocxSAV/LBkuO37NQ11jpxj266i9EziNHC1
         Q48g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=bQiHjmuZqywaTED/i7Xly9GyW+2j9cpvwySffkTKNbg=;
        b=Cfzc+zW3kKErPhdgiH4gO7bUNTlArFd0tiB0yUxX39wKciTugND8K4XAwXhPj9roV0
         DL84w0WM95SPHsxJoqEQHzEQBJIHX6hVQpJtL+GWYcY0QRxa6k8wiZY3TrEFcc2KIUjh
         XMNEX8Q3WxWPwc9IV9Q1O6YAObW+Q2l3mTXaLN6nXLlZj9SyRuV5608M8cwHROUg4kRo
         w+0Jir7+ahbdsCm3NaKeQ6T+iGTkXStN6cw0/P/vMnkaalgQXYHRllUsQ9DA1AUEuye6
         5lf0lwGcZAG6BXr85hAS0PtOZWfrK+UWH2IRCIPLva5L2S9OVuzSGfQCiwnT7ttWMNJn
         nSEw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@zx2c4.com header.s=mail header.b=tgczhzkB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=zx2c4.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id u202si841139ywe.551.2017.10.26.07.30.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 26 Oct 2017 07:30:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@zx2c4.com header.s=mail header.b=tgczhzkB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=zx2c4.com
Received: from localhost ([::1]:53235 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e7jAn-0000Jh-Ei
	for alex.bennee@linaro.org; Thu, 26 Oct 2017 10:30:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47746)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Jason@zx2c4.com>) id 1e7ium-000394-Gz
	for qemu-arm@nongnu.org; Thu, 26 Oct 2017 10:13:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Jason@zx2c4.com>) id 1e7iug-0005cU-Lw
	for qemu-arm@nongnu.org; Thu, 26 Oct 2017 10:13:44 -0400
Received: from frisell.zx2c4.com ([192.95.5.64]:37917)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <Jason@zx2c4.com>)
	id 1e7iug-0005al-HX; Thu, 26 Oct 2017 10:13:38 -0400
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 07bbe21a;
	Thu, 26 Oct 2017 14:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
	:in-reply-to:references:from:date:message-id:subject:to:cc
	:content-type; s=mail; bh=dlj7yJdmEjt7KilWiYqaQFN08fY=; b=tgczhz
	kB/M6k7flLHdfhzKX86OjNhTvOKpLcb5z3Ji1VnsE4AWRZyTc6zLZRMyVDmaSzDx
	YmsiUWvGTitoO2MtGhR1yXV6pYcjMqnV5GoQIaNyMNb1CutSoBqM8E4SYhylyaeN
	W/NpVWtU6+F1SfVo46092U5Yjtjt6LeXPJh9+sOPJBTRrKuQMBZBzEUxSKCLeJRL
	9NupR7VfvvGJTLBqdPUvG1tV34WZcoQ1Jvv0D7mbtbmCMukQ1e6IW47A4loU8g5A
	3xpWo/rBPuZNePxqhHxx2EwcGm792VQMRomhztgbznarcw3SLbRtpamCUczS48yj
	y2snMCdeOeUsZ4qw==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 2d19ff14
	(TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO); 
	Thu, 26 Oct 2017 14:11:51 +0000 (UTC)
Received: by mail-oi0-f45.google.com with SMTP id h6so5841672oia.10;
	Thu, 26 Oct 2017 07:13:35 -0700 (PDT)
X-Gm-Message-State: AMCzsaX/WSEvRY4dihy+8jiQHJMxBgCV/o2bAPyWEDrse37CW2wsC6l1
	4R23jt6qc1sy7h3/fOdnyQQREbx+LlAwKSOD0os=
X-Received: by 10.202.204.150 with SMTP id c144mr2942690oig.343.1509027214410; 
	Thu, 26 Oct 2017 07:13:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.74.41.205 with HTTP; Thu, 26 Oct 2017 07:13:33 -0700 (PDT)
In-Reply-To: <20171026133445.kemzfgvpbmtcogsl@kamzik.brq.redhat.com>
References: <20171023122719.17199-1-Jason@zx2c4.com>
	<CAFEAcA_PM5Fjx2Pk58h75p9vaZwFcusQdXuwy9tbDtc=EaoOJg@mail.gmail.com>
	<10e16ca3-175b-9f34-65e7-031b883b7201@amsat.org>
	<CAHmME9qtBiuAEnkCeuMd7EdeZveTVa4UOf+AQhMCFye0SYJY=Q@mail.gmail.com>
	<20171026133445.kemzfgvpbmtcogsl@kamzik.brq.redhat.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 26 Oct 2017 16:13:33 +0200
X-Gmail-Original-Message-ID: <CAHmME9oyBvAV8FF9QMHyF46n8Ct6KZqThQVih2ipQmivD94Cag@mail.gmail.com>
Message-ID: <CAHmME9oyBvAV8FF9QMHyF46n8Ct6KZqThQVih2ipQmivD94Cag@mail.gmail.com>
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 192.95.5.64
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] hw/arm/virt: support 4 serial
 ports
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: THh/ZrCVrBMs

On Thu, Oct 26, 2017 at 3:34 PM, Andrew Jones <drjones@redhat.com> wrote:
> You could make the PL011 user instantiate-able and make the necessary
> changes to use the dynamic FDT node generation framework (sysbus-fdt),
> and then you'd be able to add as many additional UARTs as you like to
> mach-virt's platform bus. I played around with that idea once, and have
> some patches rotting somewhere that could maybe be dug back up.

The problem with this approach is that then different architectures
need different fancy options, which makes things a hassle. With the
old guarantee of each machine providing four serial ports, you could
just do -serial 1 -serial 2 and not have to worry about it. Much
nicer.

Making FDT dynamic also sounds complicated.

Could we just do the simple patch of adding four pl011s in there?
