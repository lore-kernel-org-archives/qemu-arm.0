Received: by 10.25.0.147 with SMTP id 141csp931079lfa;
        Wed, 22 Feb 2017 03:57:04 -0800 (PST)
X-Received: by 10.200.43.50 with SMTP id 47mr27617374qtu.150.1487764624876;
        Wed, 22 Feb 2017 03:57:04 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o54si698327qtf.186.2017.02.22.03.57.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 22 Feb 2017 03:57:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:51718 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cgVXa-0003DL-81
	for alex.bennee@linaro.org; Wed, 22 Feb 2017 06:57:02 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59663)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1cgVXQ-0003BD-Vg
	for qemu-arm@nongnu.org; Wed, 22 Feb 2017 06:56:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1cgVXQ-0006vD-3p
	for qemu-arm@nongnu.org; Wed, 22 Feb 2017 06:56:53 -0500
Received: from mail-lf0-x242.google.com ([2a00:1450:4010:c07::242]:36798)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <vijay.kilari@gmail.com>)
	id 1cgVXP-0006uf-RX; Wed, 22 Feb 2017 06:56:52 -0500
Received: by mail-lf0-x242.google.com with SMTP id p197so21230lfp.3;
	Wed, 22 Feb 2017 03:56:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=bmmITywT6figH+3yLDEJ5xbKs376MUT6tnOveBA2RG8=;
	b=f08BQubUMVE90XB4u/2ozTGvmjjFpJitJcwTHlqGeW10v7eYB0yrVejotpwhCRVVsC
	lvQeKwGbhPfCm+0a2sIew/gMYfOoOnkSdbYZ1xWSvb1L0+yjrbtciS2DakICU9l0zSOQ
	S5QP2aKWHu6nqu0RZGtxM34KJ2ZCasFJEn4rfeTn0TzwRLZG8A87LHgScqg4Hc1rpc5r
	FOe30pkIa1WnYn+PFIJdb457oqeS65Nt9zPqNIecTfa1B58AEuw6ALSZRlqWFJg/1rQd
	dJqHwdXPF0pAY4D8/VBNmNznJNbRxoNpZWbIVOOnqROABVc6RnxqPKw94UJN5CYQkCrr
	6zgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=bmmITywT6figH+3yLDEJ5xbKs376MUT6tnOveBA2RG8=;
	b=YGhX8jwA/jB3/klrAJTlJX1rZcIobxdevyWrT3TUB/ElgSI8qIzfLyNsODdxA8i2Op
	5pz+iTL98zCoJUYp9YWdU8VwL41nvHsxDIlLeLudc/9FUjTpOFOI/CSmv1FwYE0du2fe
	6n/7UFjKOZUra6o6oPxNQ2Sn9srFUQ6k4y9pv2rGaHsxDJvdiJ2xnKIl3P/0zCBGpdgX
	lpjMlbGOpyiu3LB7RbJCsIkAiYJUEERBbPKhIcjH/GFqFNxHPRW5u6zqAM7lvUk9DQ4g
	vHves+FYvmAli8Wlei/afflKRpKL6Lkxvnoz+DIXrIaTANevzN1XvK1wH+oSielFZOd4
	zY6g==
X-Gm-Message-State: AMke39k+nsdGl1AGaDO/XZlYoAgFCLzX067p72FCH73RCwRyADbqQGGFpQJsN3SbpOpQCjpXzDzvd474QqfB0A==
X-Received: by 10.46.92.196 with SMTP id q187mr4358294ljb.51.1487764608626;
	Wed, 22 Feb 2017 03:56:48 -0800 (PST)
MIME-Version: 1.0
Received: by 10.46.20.15 with HTTP; Wed, 22 Feb 2017 03:56:47 -0800 (PST)
In-Reply-To: <CAFEAcA_NbQNzrUUCAS2e5Xso0rg6H3+nzDjTc9i8Tc+GLpXvLw@mail.gmail.com>
References: <1487313115-9510-1-git-send-email-vijay.kilari@gmail.com>
	<1487313115-9510-3-git-send-email-vijay.kilari@gmail.com>
	<CAFEAcA8618+LGejFq6SpBEwGrNpfamBBX3MFWjss-ZxJ7Xk8mg@mail.gmail.com>
	<CALicx6tqxXZxBTxYvF55ydBg5CB1to3MsEkhaohucx4EAZcEJA@mail.gmail.com>
	<CAFEAcA_NbQNzrUUCAS2e5Xso0rg6H3+nzDjTc9i8Tc+GLpXvLw@mail.gmail.com>
From: Vijay Kilari <vijay.kilari@gmail.com>
Date: Wed, 22 Feb 2017 17:26:47 +0530
Message-ID: <CALicx6uiFYXsOMaiCH9HYW_jxbMSg+QSCrbVr0D-UKWwtf+TwA@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>, 
	Christoffer Dall <christoffer.dall@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::242
Subject: Re: [Qemu-arm] [PATCH v8 2/5] hw/intc/arm_gicv3_kvm: Add
 ICC_SRE_EL1 register to vmstate
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
Cc: Marc Zyngier <marc.zyngier@arm.com>, Pavel Fedin <p.fedin@samsung.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Vijaya Kumar K <Vijaya.Kumar@cavium.com>,
	Eric Auger <eric.auger@redhat.com>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lKrSvNMPAEPS

Hi Christoffer,

On Mon, Feb 20, 2017 at 3:21 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 20 February 2017 at 06:21, Vijay Kilari <vijay.kilari@gmail.com> wrote:
>> Hi Peter,
>>
>> On Fri, Feb 17, 2017 at 7:25 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
> [on the guest-visible ICC_SRE_EL1 value]
>>> Is there a situation where KVM might allow a value other
>>> than 0x7?
>>
>> In KVM, the SRE_EL1 value is 0x1. During save, value
>> read from KVM is 0x1 though we reset to 0x7.
>
> 0x1 meanss "System Register Interface enabled, IRQ
> bypass enabled, FIQ bypass enabled". This seems
> rather a weird setting, because it means "the GICv3
> CPU interface functionality is disabled and the GICv3
> should signal interrupts via legacy IRQ and FIQ".
> Does KVM really support IRQ/FIQ bypass and does Linux
> really leave it enabled rather than turning it off
> by writing the value to 1?
>
> My expectation was that the KVM GICv3 emulation would
> make these bits RAO/WI like the TCG implementation.
> Is there maybe a bug in the kernel side where it
> doesn't implement bypass but has made these bits be
> RAZ/WI rather than RAO/WI ?

Do you have any inputs on this?
