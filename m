Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp11134419wrx;
        Tue, 26 Feb 2019 06:31:55 -0800 (PST)
X-Google-Smtp-Source: AHgI3IZTC4+hlvFJ27toCLOAUeVHGPUvKWmUMnnVl32hmaE1YO+pPtft2BuulPHMaJcmuFVTL2XY
X-Received: by 2002:a81:11d5:: with SMTP id 204mr18386558ywr.287.1551191515744;
        Tue, 26 Feb 2019 06:31:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551191515; cv=none;
        d=google.com; s=arc-20160816;
        b=n8LVsjh3LJPUqqUAFp8kKV6Iw4VlfNrz1tRDFBYv5eFpuFqp2vjkJ7FymlYttDhv4v
         Mal0tjMDYZqKS00z8Zi6Zi7HjhASR0VfVdyvNxgFfgdt4oRWLS8o23iXUYs07RVEiae3
         M4XlLjTnJ+d5BnJ5Td8aK2Hd2WfHZgQbipLNOHMUbgQ7YMzcsH0suUyU+Iq/1gZ5kyEb
         viWH68e4TlGLzH0XYXoeUk4IOVIRx+X74OZKP+th3jDb59cuQl4tHQPBlLuD9AL2dFIu
         nW9Zg5lugzaFNVOyHreaxw3b8HWk5oq4dRr1ydd6IUPlBLZFu6qnS0rtwFMmbyjVnKfB
         OWGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TDjPI/8ayyXucymfn8BG0+HRbPlLvF4+ZvFwPDDXfSk=;
        b=ZMJuv2pBDlBa+GGSaLE64OMVTZC2dRo15iOc+L4beMKb+tK/etZCAWaGEMEvcm8dd9
         poOD5ZWbt6OCQihgI+oGREcyUW/m9eIcusACcDq1OPlsmbpCz4uLs1HI6tspDC/YuucP
         WWXQ934+kC9WsWkH3SSDd36g7BBN4valVOdvUDQdq7lVXbc93UPUakwN0AVUtP4a8fEl
         gqMdztnRQGWQbPASdFOjoaushyxM+0nmOUR+0xi1XtlMwdHMH/0vrm7hz06HupgDZcPe
         gKoT3vOZArzNxPYRqLx+Gekz3Ay5DauOFyvyM/VDum3SEqXy1C7RdWPStjeAiAbwLkBw
         T4cA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="K0/Tr23A";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o2si6752133ybp.230.2019.02.26.06.31.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Feb 2019 06:31:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="K0/Tr23A";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:56406 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gydlz-0002bQ-7s
	for alex.bennee@linaro.org; Tue, 26 Feb 2019 09:31:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58119)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gydlj-0002aH-Ip
	for qemu-arm@nongnu.org; Tue, 26 Feb 2019 09:31:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gydlh-0001Ib-KW
	for qemu-arm@nongnu.org; Tue, 26 Feb 2019 09:31:39 -0500
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:37521)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gydlf-0001DJ-St
	for qemu-arm@nongnu.org; Tue, 26 Feb 2019 09:31:36 -0500
Received: by mail-ot1-x341.google.com with SMTP id b3so11221295otp.4
	for <qemu-arm@nongnu.org>; Tue, 26 Feb 2019 06:31:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=TDjPI/8ayyXucymfn8BG0+HRbPlLvF4+ZvFwPDDXfSk=;
	b=K0/Tr23AiZRZQh05IdpMNeN/s5xCSS3tc6X4lwXhhG9wBuA+WNFaAbp/T9HyB38l/c
	I1icV1G2uR5QyCi2m1Vxb/ESR1vpQgQbchbcgetPckGJ9lsEELsYon+I3kDQBubYMXxm
	m5iUiejOP5ZXB8tohi50kFmbfsMkGRvAV4eRAFxN0Z8OkCYRlEJCqpS1Cjk87jrbzRYA
	nDj8/aV87+Zl67FEZ4SLbICitbaTs2vQzoeyfe/hxOoYRovDHpfwZLsKhMMXRGSwAvVC
	bBkDB0D04p8p9mqmJeaUyu8AWbCQKSNorPSqSVh8K+BZ9EUUfX7zqY6qaal/kGwnG51u
	qpOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=TDjPI/8ayyXucymfn8BG0+HRbPlLvF4+ZvFwPDDXfSk=;
	b=UatvSxMvJcuWRWW+gjTn0E41X9DUnVD7nOW93wB/2TM0RWt5CAsV+HWRInfCeL6dVu
	S4UJF0XsZ9wroXJFVcBqavDZ2WGEL1E6xn8JaPD7v2WTsIWf0wNBLeecDos9UxNOutUW
	lXDlTsgQ8dlxmDKYVzfcYK89mrR5BYLOsEfS6easgqoNxHYSY7BkZRBzzoBdGOC3V8Ip
	E7xjcHV5T0GWtowztd9jMBOBgMwW4K0YD2R1Ui0yYjaSOQTDXRay9hQxmq8RjJt6DpqO
	TAXNdIRDVsuGQZy7bSTcCFzl6LK160FvnRcIGDFJr7cDFTNLMNLcEF99aIaTCMnI/vaf
	AuDw==
X-Gm-Message-State: AHQUAubXRVohZbkldnn4KoHPTsLOKZ2B28PFRzmqkeeIAJbO4G1LXhrc
	saH0WoUThizsZ2rwohZpgVbqNr1f/Z5llYhyq54w+w==
X-Received: by 2002:a9d:4e8b:: with SMTP id v11mr14735859otk.316.1551191488850;
	Tue, 26 Feb 2019 06:31:28 -0800 (PST)
MIME-Version: 1.0
References: <20190215155919.GA10823@nyan>
	<CAFEAcA9yEBy-=-2oSDqAXLffGjU7Aa9MeVtYFCU29qxerWb23A@mail.gmail.com>
In-Reply-To: <CAFEAcA9yEBy-=-2oSDqAXLffGjU7Aa9MeVtYFCU29qxerWb23A@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 26 Feb 2019 14:31:16 +0000
Message-ID: <CAFEAcA8mJ=69NkrO_7_9WoCPq+GYCN9WRf6PuUtGv+4LXXDRow@mail.gmail.com>
To: Mark <alnyan@airmail.cc>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::341
Subject: Re: [Qemu-arm] [v4 PATCH] hw/arm/bcm2835_peripherals: add bcm283x
 arm timer
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
Cc: "open list:Raspberry Pi" <qemu-arm@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	"open list:All patches CC here" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dDOwaRtTawoi

On Thu, 21 Feb 2019 at 11:31, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Fri, 15 Feb 2019 at 15:59, Mark <alnyan@airmail.cc> wrote:
> > +    s->irq = qemu_allocate_irq(bcm283x_timer_set_irq, s, 0);
>
> I know this code has come from the sp804 code, but it's
> actually wrong (and I should fix the sp804). qemu_allocate_irq()
> is for interrupt lines that come into a device, not for ones
> that go out from it, like this one. The call happens to have
> no visible bad effects because what it does will be overrriden
> later when the board code wires up the interrupt to the
> interrupt controller. (There will be a tiny memory leak.)

Looking more closely at this, my analysis here is wrong -- sorry.
For the sp804, this call is necessary, because the sp804
has a dual layer structure between the arm_timer_state
layer and the SP804State layer. It creates outbound IRQs
from the arm_timer_state with qemu_allocate_irq(), and
effectively connects them to the SP804State via the
sp804_set_irq() function (which raises the outbound IRQ from
the SP804State if either of the arm_timer_state lines is high).

In your case there is no dual-layer structure, so you don't
need to call qemu_allocate_irq() at all. (You're effectively
trying to use BCM283xTimerState as both the inner layer IRQ
and the outer layer IRQ, and it happens to work because the
setup of the outer layer happens last so the bogus inner
layer initialization is ignored.)

> You can just delete the qemu_allocate_irq() call here, and
> the bcm283x_timer_set_irq() function.

So my recommendation here was correct, but my reasoning was
not right.

thanks
-- PMM
