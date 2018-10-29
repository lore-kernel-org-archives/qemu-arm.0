Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp4675077wro;
        Mon, 29 Oct 2018 13:16:27 -0700 (PDT)
X-Google-Smtp-Source: AJdET5eyvXI9DQfHiV9DObf+ikO2Mxs78WTbOcLrNxkMe9Ap3gB/befQ3o0O3SbJF/UwNQAzTTuU
X-Received: by 2002:ac8:2f0d:: with SMTP id j13-v6mr13987325qta.87.1540844187013;
        Mon, 29 Oct 2018 13:16:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540844187; cv=none;
        d=google.com; s=arc-20160816;
        b=Xcz1Dt57W1ZM0xoS+KXqdksYHH2V+s80Nmo+rMD/wkuPXozqaDiK4FqCJco1XAKlZD
         IfXOCUxvw4+ioqrhqzUjlm3WgwKbNiM1lyiwbn99ZDtk66LxpX7VhWTX2ij+m0rLdobg
         k5er+jr5ga3XipcBUygexO6KxiRF+fJ2mQ5i80/AtxlltOBuJ3g9JDLU6ClGmwaGTxW3
         2WWUDHV9Lll80tmZeOf0Ugmv8VkYr+TwQSeoGaLB0I3XQvnci45Mgr/QhDymKkFPwTuj
         CMH4yaImhvJswWWKPCi+7UlMPcfuwkdfgyy+1fXtlr429oNJuuGsdShJwaBIg8O3Ekfp
         vUCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=A1T+m++PdbIA101eWdv54x+Q3PCbU/wHxUxyAV5/xl4=;
        b=GSqM2pFaDabrodBq87/0i5NdVzKrnhf+7e1Usz5y/Ca0ZP90SD/YtEvYn3UcHWZqXB
         84vIrCOTP0oWt7R9loF3/5ER+PgiFlzUkdbNvI6HAbCezSUb0PWEWM695p3EqPw9GsML
         akHZ7Hx3xPUFvIqJpM1VnnGzYRLATLjrFvA1bVuM2BKjZvD7CzZApAoYBBBt5VC6Lx85
         SBlwWq1blGFMA9eXxBObnmIF6trVou6Dq6ItkSX6RVSU2M9BbzKY9yrq2aPY8u91Vivb
         4T7ny0eurQk3pi6/n4xtWTK/5x/UMgEpEcM4BHe7XQDwnSQGt2S+360BYU0mJhZkAkgr
         wukg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=iV6KJ+kY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u3-v6si16781055qtj.69.2018.10.29.13.16.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 29 Oct 2018 13:16:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=iV6KJ+kY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:48762 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gHDxa-0002CY-9C
	for alex.bennee@linaro.org; Mon, 29 Oct 2018 16:16:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54595)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1gHDx5-000216-MB
	for qemu-arm@nongnu.org; Mon, 29 Oct 2018 16:15:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1gHDx5-00064W-2K
	for qemu-arm@nongnu.org; Mon, 29 Oct 2018 16:15:55 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:40504)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <stefanha@gmail.com>)
	id 1gHDx3-0005yy-Bk; Mon, 29 Oct 2018 16:15:53 -0400
Received: by mail-wm1-x343.google.com with SMTP id b203-v6so9255485wme.5;
	Mon, 29 Oct 2018 13:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=A1T+m++PdbIA101eWdv54x+Q3PCbU/wHxUxyAV5/xl4=;
	b=iV6KJ+kYmCQ5ydZ1szh43zkFKS5zuOoaFD1T14NaykDU+LEenBLJcqTkELvGF18Qnd
	FMT3CSYGi/5IZ8s00k3zTRWE9NV3HKYn010AZqQ3W5pNwYuE3UQLVbMR2Z2InovVuFn8
	o2usIgX36ZRrecdpf7Kq0n07wC/jZhVRCH+MaWevjKNYoTdWvNh73pV6lMvtNOrcdn41
	vnpKHBpCRxIoMjJQOH38nzPK94m+ueSd7t1Qse2DHFFt9DxKZ+chQqX8BoluyBN9LAIg
	blTe+SC9yE8xVjgRIkO11nEUqHY1Bgmja+o3PTeJje9lpB7X6160TyHth3rpPSI8kOl1
	tvtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=A1T+m++PdbIA101eWdv54x+Q3PCbU/wHxUxyAV5/xl4=;
	b=deeUPS80i0i57VcBrA7RNxC2jDV9NbqA4EHTaUKYyzhWI2NWiqZ2zx3wsEVDwicjtG
	2etPZEIz8O3Sc12si1Fh0kuPOlFGg8XqyGBKr6PCAh+qQTW4HNuDZYUjjNTf9lM2Inre
	ILqdCZ8OQbP4jLaxn8d92po9Kgk061gv4V5qIYr2cg09YtlH9nBuO3wmlOMrvozIW8Vh
	GRYQmzgoK8rUXGS0x/VzwrlqDkHyAws4rnlyYUfMf9N9IeKhtM8lcxVW0okI6diVxZud
	3MYLu1f7/gY3h0gePi4QeEtk3Xe3wPhJaBx3YX0Pg0j7S5uVFXxDHfYYqwF4bAdp5hXk
	95uA==
X-Gm-Message-State: AGRZ1gK6f1eALeciunhe+0lKNjvpWfxebVL2zNw53bU2rDD2a+KwxBhQ
	8XJ5M6AcPBqBlTUTVopPsL177BQv0N/uo2Qxpag=
X-Received: by 2002:a1c:bce:: with SMTP id
	197-v6mr14187460wml.15.1540844152284; 
	Mon, 29 Oct 2018 13:15:52 -0700 (PDT)
MIME-Version: 1.0
References: <20181029194519.15628-1-stefanha@redhat.com>
In-Reply-To: <20181029194519.15628-1-stefanha@redhat.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Mon, 29 Oct 2018 20:15:39 +0000
Message-ID: <CAJSP0QX9oLmpFzZ48Xj5fJ_jy=Upbf3xiGLYw1Ptw9K5C3FS0w@mail.gmail.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::343
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] microbit: do not rely on
 -kernel option
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Jim Mussared <jim@groklearning.com>, qemu-devel <qemu-devel@nongnu.org>,
	=?UTF-8?Q?Steffen_G=C3=B6rtz?= <qemu.ml@steffen-goertz.de>,
	qemu-arm <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
	Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QgwRUBhHlZTY

On Mon, Oct 29, 2018 at 7:46 PM Stefan Hajnoczi <stefanha@redhat.com> wrote:
> @@ -39,8 +47,12 @@ static void microbit_init(MachineState *machine)
>                               &error_fatal);
>      object_property_set_bool(soc, true, "realized", &error_fatal);
>
> -    armv7m_load_kernel(ARM_CPU(first_cpu), machine->kernel_filename,
> -                       NRF51_SOC(soc)->flash_size);
> +    if (machine->kernel_filename) {
> +        error_report("-device loader,file=<filename> must be used instead of -kernel");
> +        exit(1);
> +    }

NACK

Julia pointed out this breaks boot-serial-test.

Stefan
