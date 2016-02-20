Received: by 10.25.208.211 with SMTP id h202csp292668lfg;
        Sat, 20 Feb 2016 03:32:19 -0800 (PST)
X-Received: by 10.55.198.129 with SMTP id s1mr22251971qkl.18.1455967938838;
        Sat, 20 Feb 2016 03:32:18 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r4si19162402qki.12.2016.02.20.03.32.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 20 Feb 2016 03:32:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:60207 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aX5lq-0005mh-Bg
	for alex.bennee@linaro.org; Sat, 20 Feb 2016 06:32:18 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50177)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aX5lo-0005mA-DF
	for qemu-arm@nongnu.org; Sat, 20 Feb 2016 06:32:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aX5ln-00083p-J0
	for qemu-arm@nongnu.org; Sat, 20 Feb 2016 06:32:16 -0500
Received: from mail-vk0-x234.google.com ([2607:f8b0:400c:c05::234]:33872)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aX5ln-00083b-EY
	for qemu-arm@nongnu.org; Sat, 20 Feb 2016 06:32:15 -0500
Received: by mail-vk0-x234.google.com with SMTP id e185so95630635vkb.1
	for <qemu-arm@nongnu.org>; Sat, 20 Feb 2016 03:32:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=oLPKpnutouMOX5cSD6UxTG44cjYIyPOc/hCZdU5t7bE=;
	b=TpAztf6MU3oFMhgaJzFgk1OnLooLbQZrIo0Itha+oo0EOVATJ2Y+RbbN6LY7BmJd+E
	BdwsfCyOebxAo2nPzpyUk0oHmUkwwp9AxVF3su/b0oVZXR6C5UVlAz+kHfldTP3vnCGK
	Yd6aDvso6TGr4xNstyNnLfgRxBSUo+KgF9l1I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=oLPKpnutouMOX5cSD6UxTG44cjYIyPOc/hCZdU5t7bE=;
	b=OWcN6SzSGi0lJWytykQ9ML+8nm5Pg8e9gUfg+mbZ7Wkx0wBeDk2TykPXCsae2Q08yL
	9uTXuhoR+U8SchsNpDNVp3k3Kd0wZsc3cYE2IMi1wHOUcgKMCaTaQVc0iIBj2cGLYCWl
	N19Eg8LQpy1mzW7XFuJQ/1ln5sqrkJEavNppDZxhhC+UGM3Os55lCt7HjHhymp5QnsLa
	nblFYG4/H5gXaRXEhSK04Ey7PssD43IS9PIywGUAIMPWPMEoeWMuLTmuQc9TfunprN+T
	jTk+G2ztntFxLvZ/7ZLU17/4cCrfvLLYijGrX9qJfLJlVl5yTk9qsZyVfcrXFUFdxkBP
	2Dnw==
X-Gm-Message-State: AG10YOT6ivFLkHnNCWIG+2moXzYTB2q4IPivUz/sjDo9ILmIuWgAj4Ui1eIprMbw8hx0PC1G2yMN2IrfLTh1Y29R
X-Received: by 10.31.180.85 with SMTP id d82mr12967090vkf.83.1455967935059;
	Sat, 20 Feb 2016 03:32:15 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.56.216 with HTTP; Sat, 20 Feb 2016 03:31:55 -0800 (PST)
In-Reply-To: <56C78FFA.1090609@redhat.com>
References: <1455898919-13868-1-git-send-email-peter.maydell@linaro.org>
	<56C78330.7050107@redhat.com>
	<CAKv+Gu-D=s895j7Phyx7AfFejcC1+gAZu1WK7oNkGN9p=UxSTQ@mail.gmail.com>
	<56C78FFA.1090609@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 20 Feb 2016 11:31:55 +0000
Message-ID: <CAFEAcA-nzx2JwaC64NfBm2bpWURxezwmZoC+HOXmhrBzWptZqw@mail.gmail.com>
To: Laszlo Ersek <lersek@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::234
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Patch Tracking <patches@linaro.org>,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] hw/arm/virt: Assume EL3 boot
 rom will handle PSCI if one is provided
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 3s59aRVFCai2

On 19 February 2016 at 21:58, Laszlo Ersek <lersek@redhat.com> wrote:
> On 02/19/16 22:41, Ard Biesheuvel wrote:
>> On 19 February 2016 at 22:03, Laszlo Ersek <lersek@redhat.com> wrote:
>>> Ard, any opinion on this?
>>>
>>
>> I agree with Peter. Note that this is strictly about emulation, under
>> KVM we always run at EL1 or below and PSCI calls are handled by the
>> host kernel, not QEMU
>
> Great, that's all I wanted to hear -- out of scope for me. :)
>
> Actually, I have now read the patch even, and I have the following comments:
>
> - As long as "using_psci" is true, the behavior doesn't change. Great.
>
> - The only place where using_psci *changes* to false is reachable only
> with (vms->secure && firmware_loaded). That's what wasn't immediately
> obvious from the patch -- when vms->secure is true (-machine secure=on),
> it's out of scope for me. :)
>
> - However, I think I might have noticed a bug -- or rather missed
> something trivial --, namely, where is "using_psci" *initially* set to
> true? The "machines" static array is not touched.

Derp. I changed at the last minute from having using_psci be a
local bool in the machvirt_init() function to putting it in the
vbi struct, and forgot that when I deleted the "bool using_psci = true;"
I needed to add something to init vbi->using_psci to true.

thanks
-- PMM
