Received: by 10.25.21.156 with SMTP id 28csp1682317lfv;
        Fri, 5 Aug 2016 01:14:22 -0700 (PDT)
X-Received: by 10.55.169.79 with SMTP id s76mr11807583qke.131.1470384862587;
        Fri, 05 Aug 2016 01:14:22 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t20si8244499qkg.335.2016.08.05.01.14.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 05 Aug 2016 01:14:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43308 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bVaGs-0004Kh-1c
	for alex.bennee@linaro.org; Fri, 05 Aug 2016 04:14:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33851)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bVaGp-0004KX-2Z
	for qemu-arm@nongnu.org; Fri, 05 Aug 2016 04:14:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bVaGi-0007dx-QM
	for qemu-arm@nongnu.org; Fri, 05 Aug 2016 04:14:17 -0400
Received: from mail-vk0-x22c.google.com ([2607:f8b0:400c:c05::22c]:34756)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bVaGi-0007dt-M9
	for qemu-arm@nongnu.org; Fri, 05 Aug 2016 04:14:12 -0400
Received: by mail-vk0-x22c.google.com with SMTP id s189so186453096vkh.1
	for <qemu-arm@nongnu.org>; Fri, 05 Aug 2016 01:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=zheBUlyV10e5eERXd7f9DJQBMqwcvklDffeAdH7N2Do=;
	b=ATUH4D82ejAdaPdzk3amf/qmAq0+pkh1mZRetAjSNAs3pG2mClGi00RMn4mu+5t4/g
	2xn84hq9EIZqbNZz24n/rh6tTl+YtlRk6Ble+XU390jKhgar52Zml8zHHROAvknaCr0I
	dCTwbbXZVdDfUmBOjW7QpAAIo8xWRMFKQvUAM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=zheBUlyV10e5eERXd7f9DJQBMqwcvklDffeAdH7N2Do=;
	b=hBtCeUGi33Mg7A9eDR53bSHbD8yMqA+hqGpg5L1/qRK2S2QI3NvGVNpLXQYNSgSw8O
	B8VW2CdfkkZeoed7LDwHHtdBQafp0u0jvFYEaPBKX3GKuRI5objpL8/vW8bSK2pU/QZt
	Yg7gnV3OyBluXTX2cGaSGWVNmGyDNYkz2/HSk89VIPM+lsjZSzhH5h9Vik5VJauceCHb
	4vUPCORGp73T+m+h9IjkMwgPbdwhCS9GyBaLftzqtZTxHdxLGs96j/qM0uV7lVZPhoi8
	/9W5GMQJIQ+WNe7WDaGSSMOLDNQuY92Xm4JyerzRs6XEs3uLi5YwU1mDTtwxKcD6aEM6
	HT/w==
X-Gm-Message-State: AEkoouuzF4sg4GNF28Ek93vdg8WqNhgvOMQwV+hbjpaSvmhFYgDgbKXNjGG8/d1ITz2jqK4f0hBMFhYwTC9/3je2
X-Received: by 10.31.81.199 with SMTP id f190mr33992943vkb.139.1470384851544; 
	Fri, 05 Aug 2016 01:14:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.150.200 with HTTP; Fri, 5 Aug 2016 01:13:50 -0700 (PDT)
In-Reply-To: <CAN76PtTfrRFDNDXHFiOvavk4EkOqdXvfKOYJh5AmZPzErxmOkw@mail.gmail.com>
References: <CAN76PtTfrRFDNDXHFiOvavk4EkOqdXvfKOYJh5AmZPzErxmOkw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 Aug 2016 09:13:50 +0100
Message-ID: <CAFEAcA9_+casyz4-nVSMMC-M-B44eYEx4f_b0fy_RodYdRNpfg@mail.gmail.com>
To: Kevin Zhao <kevin.zhao@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22c
Subject: Re: [Qemu-arm] [Help]: Does qemu-system-aarch64 support virtio-9p?
 I got a problem when remap host file to guest in AArch64.
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 00UbgSiTZ4AQ

On 5 August 2016 at 03:23, Kevin Zhao <kevin.zhao@linaro.org> wrote:
> Hi All,
>      I have a problem may about Qemu and kindly need your help. Does
> qemu-system-aarch64 support virtio-9p ?

virtio-9p isn't guest architecture specific so in theory it
should. However I've never tried it.

>      The Qemu version is QEMU emulator version 2.5.0 (Debian
> 1:2.5+dfsg-5ubuntu10.2). Besides test fedora24 guest, I have got the same
> problem in Debian jessie.

It may be worth trying a more recent QEMU, like the 2.7.0rc1
release candidate we just put out.

thanks
-- PMM
