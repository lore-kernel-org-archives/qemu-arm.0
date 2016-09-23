Received: by 10.80.163.71 with SMTP id 65csp318688edn;
        Fri, 23 Sep 2016 01:53:37 -0700 (PDT)
X-Received: by 10.200.49.145 with SMTP id h17mr6722322qte.59.1474620816944;
        Fri, 23 Sep 2016 01:53:36 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 3si4452377qtm.52.2016.09.23.01.53.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Sep 2016 01:53:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42366 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bnMEi-0001Eo-BC
	for alex.bennee@linaro.org; Fri, 23 Sep 2016 04:53:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44189)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bnLgb-00089y-AD
	for qemu-arm@nongnu.org; Fri, 23 Sep 2016 04:18:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bnLgZ-00088X-98
	for qemu-arm@nongnu.org; Fri, 23 Sep 2016 04:18:20 -0400
Received: from mail-ua0-x230.google.com ([2607:f8b0:400c:c08::230]:34126)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bnLgZ-00088H-4p
	for qemu-arm@nongnu.org; Fri, 23 Sep 2016 04:18:19 -0400
Received: by mail-ua0-x230.google.com with SMTP id q42so29124839uaq.1
	for <qemu-arm@nongnu.org>; Fri, 23 Sep 2016 01:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=4IG9ppHFKqQrWNabAfakC3q2XOCOy14KiPKFNJs7vdM=;
	b=NkghOx4BixCeGzOqMbBNQ9CjRaVliL/ha3Inhy/IMiW6+Um8dVzPmKo7a1nRocY1Qv
	ojEuX9aE2tATyFpqlyrE4MrKZFTupLWdKaFf3QC/Zw9yS1ZHrvhYmnQYbxFvnXkrjDwY
	a6/1DEiD9sHHlV9paRq5Qq5nW6L0Ytebh+0Rw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=4IG9ppHFKqQrWNabAfakC3q2XOCOy14KiPKFNJs7vdM=;
	b=T8KO7OWAHgBD9DXZbyRuq0V7Q79Wtv72/3XCCdeeYw3HIycyA+YX3ss0BYdKy2Y0fM
	tkkA91u5Xe+hhLdbwcq/Wdiai1lpOflD7LnNzoA4WV8Y0eacbwbiwUqGVnlo7wm2Nupm
	yaaRcOt+pqXMJRYa2W08ELaRVgJmkHlo3bsD+7WG7+C8rehLRgANnLThmkFBN5OWTxLK
	02zOKO/QYC1BWHp/nlZytrZsvqSVvbbpPKiYE0ZIuZV+yUrFp3BNRyl2pD09Ni+ALIvd
	+cDV3b7+PQ+vh2hQGY1vV7N3COYu0Hr96jXZm9LtkIzvDe4hytz8a2bfeBA6LyECD3br
	4DOQ==
X-Gm-Message-State: AA6/9Rm8zDzAImMjmEY2c3jWhrHQxMVhGuQH6mk7WZSURFskB9IlP6WBozsc08129umkr2JytnxP4it/uuX+Eyge
X-Received: by 10.176.4.43 with SMTP id 40mr2697815uav.160.1474618698710; Fri,
	23 Sep 2016 01:18:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.16.98 with HTTP; Fri, 23 Sep 2016 01:17:58 -0700 (PDT)
In-Reply-To: <2c52c156-2a32-b437-acd2-af13faaef55d@kaod.org>
References: <1467634738-28642-1-git-send-email-clg@kaod.org>
	<1467634738-28642-5-git-send-email-clg@kaod.org>
	<577AA388.3060100@gmail.com>
	<2c52c156-2a32-b437-acd2-af13faaef55d@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Sep 2016 09:17:58 +0100
Message-ID: <CAFEAcA_MOhS04HiAVWg5xB8xBQ=krfZC6OBnH+X7UBo2_rf1uA@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::230
Subject: Re: [Qemu-arm] [PATCH 4/7] m25p80: add a m25p80_set_rom_storage()
 routine
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	"mar.krzeminski" <mar.krzeminski@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: M8JhzxGr6nML

On 23 September 2016 at 08:19, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> But the goal is to boot from the device, so I added a memory region alias
> at 0 to trigger the flash module mmios at boot time, as this is where
> u-boot expects to be.
>
> and I fell in this trap :/
>
>         aspeed_smc_flash_read: To 0x0 of size 1: 0xbe mode:0
>         Bad ram pointer (nil)
>         Aborted (core dumped)
>
> There is a failure in get_page_addr_code(), possibly because qemu uses
> byte per byte reads of the code (cpu_ldub_code). But this is beyond my
> understanding of qemu's internal.

This is a bug in how we report the problem, but the underlying
issue here is attempting to execute from something that's not RAM
or ROM. You can't execute code out of something backed by MMIO.

thanks
-- PMM
