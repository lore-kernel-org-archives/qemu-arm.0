Received: by 10.80.163.71 with SMTP id 65csp3798427edn;
        Fri, 7 Oct 2016 07:24:08 -0700 (PDT)
X-Received: by 10.237.35.212 with SMTP id k20mr20009367qtc.151.1475850248717;
        Fri, 07 Oct 2016 07:24:08 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u66si10190710qkf.302.2016.10.07.07.24.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 07 Oct 2016 07:24:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36233 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bsW4G-0004xu-45
	for alex.bennee@linaro.org; Fri, 07 Oct 2016 10:24:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49364)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bsW1J-0002nv-98
	for qemu-devel@nongnu.org; Fri, 07 Oct 2016 10:21:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bsW1H-00029m-7v
	for qemu-devel@nongnu.org; Fri, 07 Oct 2016 10:21:04 -0400
Received: from mail-vk0-x233.google.com ([2607:f8b0:400c:c05::233]:35725)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bsW1H-00029c-45
	for qemu-devel@nongnu.org; Fri, 07 Oct 2016 10:21:03 -0400
Received: by mail-vk0-x233.google.com with SMTP id 192so46682757vkl.2
	for <qemu-devel@nongnu.org>; Fri, 07 Oct 2016 07:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=vvUd9zATZUUeNZADEJ4EWOrrxMgLMQiLPCJSi/Itzys=;
	b=SxqfKI1YMoc5wmDrqNFUA1uyZTZzlWM3qz9RctPSJqjEsQ9bMc489AbzEmpq+x1rVQ
	BgQd0ggaMR3qTPw1oQ2g4I/0NPo+fnR3par4kdBXtvEaqQhVf97Dl6IDN6qKpzJ/sFU4
	oeCxKcXt+Ek27kT5HyIoxHs8vn8qkWNzwBmks=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=vvUd9zATZUUeNZADEJ4EWOrrxMgLMQiLPCJSi/Itzys=;
	b=Lf3SbcjdRcFUzExQl+Athy8cSRxDNp11LITyixyhgZS1gcvamgtk9RYGyV8ki4N4we
	1lLA9IddOKYBfcBWFkipd0ZaRAi25veqDut/kC6Rmqks3SWyWdD7cjIEulG45OwmFrE9
	OcUzO5ZTrwSP/3B2KUA3FN6VhzeXEBCzsfW4QaK1dIeFHiUmS1Q0pTJ53Np9h1D685Kg
	aZbF9PFE6H15IbjXa5R6QalKCZst108ipfKa6TczTEdcK75M9C3ninrkgjBelFMYPh3A
	as/H08iR3Hx19i2KxPVsCWJO1pvG8XCfciYXTbvO3vEKX4Xu7v1g9nVMLUQgZtQJzB+U
	YOhw==
X-Gm-Message-State: AA6/9Rl4tYX3ISFWPeEhiSi0XQDW4w14nx/+8lJXjVhrsjxjVNvI4d6cZvvA8VyzTTrqgUZE/S9IodaruP+R9qZ6
X-Received: by 10.31.165.74 with SMTP id o71mr14672606vke.95.1475850062782;
	Fri, 07 Oct 2016 07:21:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.195.70 with HTTP; Fri, 7 Oct 2016 07:20:42 -0700 (PDT)
In-Reply-To: <CAFEAcA9wNtFSmoJD2jHOy2LWPNBa_f1WyG1VBO2d5pSD0LQjgA@mail.gmail.com>
References: <1466528974-12183-1-git-send-email-peter.maydell@linaro.org>
	<CAFEAcA8iPStWP4Pcf6Bxmn8gL5SnBDFyrPNDUpi8syc7PC_QiQ@mail.gmail.com>
	<BLUPR0701MB1684CF1920D922BD00E93EE6F2230@BLUPR0701MB1684.namprd07.prod.outlook.com>
	<CALicx6tbpSZDBYYzA0Uk5dHGoW-4_CTFuUnUDDe+NGieakts+g@mail.gmail.com>
	<CALicx6tk2xkVf=Rz9KG-v-0xLb5=Tz1VidjuBDiqP0j-p+x=Pw@mail.gmail.com>
	<CAFEAcA9wNtFSmoJD2jHOy2LWPNBa_f1WyG1VBO2d5pSD0LQjgA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 7 Oct 2016 15:20:42 +0100
Message-ID: <CAFEAcA8+zb4BAQ4FFrY89U5SnuLnmzSOXZMRMXeX5F3zTLZFEw@mail.gmail.com>
To: Vijay Kilari <vijay.kilari@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::233
Subject: Re: [Qemu-devel] Fw: [Qemu-arm] [PATCH v2 0/6] Runtime pagesize
 computation
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "prasun.kapoor" <prasun.kapoor@cavium.com>,
	Patch Tracking <patches@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>, "Kumar,
	Vijaya" <Vijaya.Kumar@cavium.com>, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xKC2uXXYdRGc

On 19 July 2016 at 12:04, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 19 July 2016 at 12:01, Vijay Kilari <vijay.kilari@gmail.com> wrote:
>> Hi Peter,
>>
>>   Any update on this patch set. Is it merged?
>
> No. It's an RFC patchset really, and it was posted during softfreeze,
> so I never expected or intended it to be merged before the 2.7
> release. It also needs a respin to address some of the review comments
> I got on it.
>
> What would be useful in getting it further forward would be
> some good performance benchmarking of more than just migration.
> In particular whether it improves the speed in TCG emulation
> mode of aarch64 guests and whether that assert in the definition
> of TARGET_PAGE_BITS is particularly performance-draining.

If I do a respin of this patchset is anybody willing to do
the actual perf benchmarking of the TCG emulation?
Otherwise this is unlikely to go into 2.8.

thanks
-- PMM
