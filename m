Received: by 10.25.159.19 with SMTP id i19csp971144lfe;
        Fri, 5 Feb 2016 02:53:21 -0800 (PST)
X-Received: by 10.140.19.52 with SMTP id 49mr15209464qgg.65.1454669601315;
        Fri, 05 Feb 2016 02:53:21 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x143si15263382qka.122.2016.02.05.02.53.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 05 Feb 2016 02:53:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:47457 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aRe0u-0008NC-VZ
	for alex.bennee@linaro.org; Fri, 05 Feb 2016 05:53:20 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43457)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aRe0s-0008MQ-OQ
	for qemu-arm@nongnu.org; Fri, 05 Feb 2016 05:53:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aRe0r-0002QY-Md
	for qemu-arm@nongnu.org; Fri, 05 Feb 2016 05:53:18 -0500
Received: from mail-vk0-x230.google.com ([2607:f8b0:400c:c05::230]:33010)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aRe0r-0002QG-Fw
	for qemu-arm@nongnu.org; Fri, 05 Feb 2016 05:53:17 -0500
Received: by mail-vk0-x230.google.com with SMTP id e64so54571678vkg.0
	for <qemu-arm@nongnu.org>; Fri, 05 Feb 2016 02:53:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=WEZxcXOkQlzVPmkzU+oxOVOKvTvf+ElOsJ+WXqbyVvU=;
	b=GdkTMNHwDREKN4pOtIH7glFX0aiP08xwmIKnw6DiCpbiCGynVRKG6fffmZz0LRSf7W
	V+XnZ0JJrVGXB+UbM/wSRv1LEVIl5BhlbWbOWfb7a4Wrr/xyOOft1+bf+9Jmw81Q6HRr
	EIkQIScovHt+t49nH0Ufnnrr8O0VInZzjGPLs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=WEZxcXOkQlzVPmkzU+oxOVOKvTvf+ElOsJ+WXqbyVvU=;
	b=fHIyemLjUVcO2FFgiQ5NQf5XnWlDBCgShdB3gAo9JcNLhSrCSgMyc65u491wDIxmzl
	xsYNC1T80Vc3rz4tOaImyrKXlFgomnTmWDGT3j+02rNvpQEKui50dOv0Ad64M3kVFQAh
	2ch6yFdyxqlYVeNoCOS3g77Y2Mp6sx3nff7MNwHSO8DmmlUYJSpqCLC1MsyLrc1JIK8w
	ygYiVYALBLiyXEhktI4HVcCW8nlEjBF0/KuX2vFI/FF+dDo6PsrGfP9DLNJzsdmOgQZW
	0F+/WLc5GofLoAHogF0sDDxhRFWe7a1ivoS3ojKuJ7BeJNDgq2accNlbNZ8YxaueZW3p
	ONdA==
X-Gm-Message-State: AG10YOT2KkzKXHkcbB3SkWugSIlFZDbuC9px/H1mQPKJDFid3goEliWDZKrOAE4aNglEcFMPyM35si+m9C9o5bWw
X-Received: by 10.31.180.85 with SMTP id d82mr7967301vkf.83.1454669595553;
	Fri, 05 Feb 2016 02:53:15 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.56.216 with HTTP; Fri, 5 Feb 2016 02:52:56 -0800 (PST)
In-Reply-To: <CAHyh4xiVysLUreprtNnKMOLf0VUH2bTsF4thPwbkeFOfpDXFCw@mail.gmail.com>
References: <CAHyh4xiVysLUreprtNnKMOLf0VUH2bTsF4thPwbkeFOfpDXFCw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 Feb 2016 10:52:56 +0000
Message-ID: <CAFEAcA9P7OBcL4sAnLLoppUo8q40yEeyAt_5M_MYnNgJAxB7RA@mail.gmail.com>
To: Jintack Lim <jintack@cs.columbia.edu>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::230
Cc: qemu-arm <qemu-arm@nongnu.org>,
	Christoffer Dall <christofferdall@gmail.com>
Subject: Re: [Qemu-arm] Adding sp804 timer to the virtboard
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
X-TUID: nmNf3kUbV2m7

On 3 February 2016 at 20:57, Jintack Lim <jintack@cs.columbia.edu> wrote:
> I'd like to replace an arm arch timer with sp804 timer in the virtboard.
> What would be the easiest way to do that?

(I'm assuming this is all just for local testing purposes, rather than
with any intention of upstreaming a patch to add an sp804.)

Do you need to actually remove the arch timers, or just provide
the sp804 as well?

(You can't remove the architected timers easily from emulated,
or at all if you're using KVM, but you can straightforwardly
comment out the bits of code in virt.c that advertise them in the dtb.)

> I'm thinking to add sp804 node to DT as follows which is from
> arch/arm/boot/dts/vexpress-v2m.dtsi.
> v2m_timer01: timer@11000 {
>         compatible = "arm,sp804", "arm,primecell";
>         reg = <0x11000 0x1000>;
>         interrupts = <2>;
>         clocks = <&v2m_sysctl 0>, <&v2m_sysctl 1>, <&smbclk>;
>         clock-names = "timclken1", "timclken2", "apb_pclk";
> };
>
> The values of reg and interrupts will be replaced properly.
> About the clock property, should I also add the original clock providers
> such as sp810 and in turn 32k, 1M and smb clocks?
> Or canI just use apb-pclk, which is an existing clock provider in the
> virtboard, for all three clocks?

For a virtual machine the clocks are all irrelevant anyway, I think
(we don't actually have any kind of 24MHz clock) -- we just provide
them because the kernel insists that the dtb says something about
clocks. So I would start by just borrowing the apb-pclk and seeing
if that works.

thanks
-- PMM
