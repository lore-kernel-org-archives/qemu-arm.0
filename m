Received: by 10.25.208.211 with SMTP id h202csp110287lfg;
        Wed, 6 Apr 2016 12:28:12 -0700 (PDT)
X-Received: by 10.55.31.11 with SMTP id f11mr31644485qkf.69.1459970892758;
        Wed, 06 Apr 2016 12:28:12 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y185si3224620qka.55.2016.04.06.12.28.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 06 Apr 2016 12:28:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45272 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ant7c-0004I8-99
	for alex.bennee@linaro.org; Wed, 06 Apr 2016 15:28:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49500)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ant7a-0004HG-9P
	for qemu-arm@nongnu.org; Wed, 06 Apr 2016 15:28:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ant7Z-0004Cm-FU
	for qemu-arm@nongnu.org; Wed, 06 Apr 2016 15:28:10 -0400
Received: from mail-vk0-x22a.google.com ([2607:f8b0:400c:c05::22a]:34679)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ant7Z-0004C3-B1
	for qemu-arm@nongnu.org; Wed, 06 Apr 2016 15:28:09 -0400
Received: by mail-vk0-x22a.google.com with SMTP id e185so71674854vkb.1
	for <qemu-arm@nongnu.org>; Wed, 06 Apr 2016 12:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=bKM0uXORrgU0xdVkpW165dGYHRi5Ke1nYZZb79SPxVM=;
	b=FaoRAo1j2u79L3GYNwi+v4/OfbR0Y2PtzFeaYfXlhSgCHoNTicX+VYDgTgT1nAPLUG
	FI5pB6bE+53Cs4WLCLirhYYuBnarosPA22/4IVE400KT5S69oDF9ZeVaHtIL2PfS9Azx
	W9UelLyVFkUqOpWqWOct3MnBW75fdRjacaZN8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=bKM0uXORrgU0xdVkpW165dGYHRi5Ke1nYZZb79SPxVM=;
	b=FeqQ8fhXHiUVqaJnyRXdShYDDoYjMyFAHNt4mh1cH6J26jd/AwsjOeBrMpXm7C4NqZ
	XPZJbQdZDFQ1VjDi7j/vCQJZbWwO2sPchbkLZoNYaj0vT17V6oY/ni232XyMdUXlKsGI
	tZ90xy/XjlhjK+nS9xHsMlOhxa/i/d4qy6TmwfvrAZqYx3bSoARICVDjCMwvS6J6WTBN
	NDaaxoUw6RoRIjUJ2L3k8EZjuHL4C2krOUlzgCZHljGKilgBXjXHkLH5ENk/vKtUpc0d
	cH6QkKGK7AP+P2+xIzXyTGUu8heFo/fVcu1/vtntEQiyxrr1KBdPjXFRy4QwzK0lwPL9
	CN1g==
X-Gm-Message-State: AD7BkJJp8QATnIwrsywQT6thZ8v8Qx9S7BJVII11dMSicYNMMd4Rt2OhFwVGKkFpZyjPlTmV/WxZ62UG/k1xQCcM
X-Received: by 10.31.47.207 with SMTP id v198mr16660820vkv.6.1459970887827;
	Wed, 06 Apr 2016 12:28:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.216.1 with HTTP; Wed, 6 Apr 2016 12:27:48 -0700 (PDT)
In-Reply-To: <20160406175027.GA23359@flamenco>
References: <1458221140-15232-1-git-send-email-zhaoshenglong@huawei.com>
	<CAFEAcA_7ww3PBQ5Mf=ax69B2i6zOx4-pDaiEUVerGG5iru-pJg@mail.gmail.com>
	<20160406175027.GA23359@flamenco>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 6 Apr 2016 20:27:48 +0100
Message-ID: <CAFEAcA8EFZK-c_d6V49Mso0xg-UPYTMUX8rfyA9J526KuZyb+Q@mail.gmail.com>
To: "Emilio G. Cota" <cota@braap.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22a
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	"Huangpeng \(Peter\)" <peter.huangpeng@huawei.com>,
	qemu-arm <qemu-arm@nongnu.org>, Shannon Zhao <shannon.zhao@linaro.org>,
	Shannon Zhao <zhaoshenglong@huawei.com>
Subject: Re: [Qemu-arm] [PATCH 0/2] Add gpio_key and use it for ARM virt
	power button
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
X-TUID: Fjme8j2kDSTu

On 6 April 2016 at 18:50, Emilio G. Cota <cota@braap.org> wrote:
> I might be doing something wrong, but aarch64-softmmu @ master only works for me
> after reverting 94f02c5ea94 "ARM: Virt: Use gpio_key for power button". Bisect log
> appended.
>
> This is what I get when booting aarch64 as per [1]:
> $ aarch64-softmmu/qemu-system-aarch64 -machine virt -cpu cortex-a57 -machine type=virt \
>  -nographic -smp 1 -m 2048 -kernel img/aarch64/aarch64-linux-3.15rc2-buildroot.img  \
> --append "console=ttyAMA0"
>
> qemu-system-aarch64: Unknown device 'gpio-key' for default sysbus
> Aborted (core dumped)

Your tree isn't building right (this is a dependency bug in our
makefiles somewhere) -- it hasn't built the new object file
with the gpio-key device in it, which means a runtime failure
when the device can't be found. You should be able to fix this
by deleting the aarch64-softmmu/config-devices.mak file from
your build tree and then doing a rebuild.

(One day I may get round to figuring out what happens here.
The oddity is that it doesn't cause problems for an
incremental rebuild, only for a build after a 'make clean'.)

thanks
-- PMM
