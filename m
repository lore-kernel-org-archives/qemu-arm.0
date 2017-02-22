Received: by 10.25.0.147 with SMTP id 141csp935390lfa;
        Wed, 22 Feb 2017 04:06:27 -0800 (PST)
X-Received: by 10.55.175.195 with SMTP id y186mr22158947qke.26.1487765187318;
        Wed, 22 Feb 2017 04:06:27 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c126si726902qkd.37.2017.02.22.04.06.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 22 Feb 2017 04:06:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51762 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cgVge-0001VA-Cc
	for alex.bennee@linaro.org; Wed, 22 Feb 2017 07:06:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33212)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cgVgV-0001T5-OX
	for qemu-arm@nongnu.org; Wed, 22 Feb 2017 07:06:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cgVgU-0001AJ-V2
	for qemu-arm@nongnu.org; Wed, 22 Feb 2017 07:06:15 -0500
Received: from mail-wm0-x235.google.com ([2a00:1450:400c:c09::235]:37216)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cgVgU-00019V-OI
	for qemu-arm@nongnu.org; Wed, 22 Feb 2017 07:06:14 -0500
Received: by mail-wm0-x235.google.com with SMTP id v77so418704wmv.0
	for <qemu-arm@nongnu.org>; Wed, 22 Feb 2017 04:06:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=xjT3lfhsN35sSw3JUIKui/YbfzJtOSZ+bVfWELjfsCg=;
	b=U3IFD/pYWTuaX5xIeyLqToBAtXrnhpXRk/yO7hyWUPHn8FWJ7Ozk2dE6XZJJxfqjd5
	+ITfA6cSFJTa1H9hsHvlRHHchusKPYujQBpD4iXsexddDJMuGk7+NeJCYLOQgEFrFz0x
	QzNSD6NiYf74RZmiljmgNEuUhiMXsOQXub5kY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=xjT3lfhsN35sSw3JUIKui/YbfzJtOSZ+bVfWELjfsCg=;
	b=skdJHrsl/w2AYNs83psgInQF4inG0uoOy+uq1/0095lxGVJWVv0MXWl5GhlNG2JUZ/
	Ai7CNtW7TGY+odK/xoQzaR/xF3jPDT4womNjzwbwykFJnupIC8HJbUpODA72dEtTRgWI
	fCcDFh0SdsXyFCJCnsXB/SV/76R6WF8deEFWIr5YjA2E2ADhUlDrBQ1TDz2A8gg4jeTk
	WWZ6KEzPJbTXmobSZbchqvE6GuPv73SY8fIdcpucJfzx1WkrYZ4wOQ5lALhP3Of1a7Vn
	Ub6MZiq5wZRfUdtxgij8ivmbUt0yKGI6r7+zRehmeSy0bpi8PFeSX9Yfdp1A41bRVsg/
	CVnA==
X-Gm-Message-State: AMke39m17A86CMhvJy7g4M4z7nvFsE6+aSJCIEAJJCg5WdqpYp9Or+3oXhNDZlC5VfVke3NhI/dqXf2hqxQP29pQ
X-Received: by 10.28.16.70 with SMTP id 67mr2247078wmq.142.1487765171951; Wed,
	22 Feb 2017 04:06:11 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.69 with HTTP; Wed, 22 Feb 2017 04:05:51 -0800 (PST)
In-Reply-To: <CALicx6uiFYXsOMaiCH9HYW_jxbMSg+QSCrbVr0D-UKWwtf+TwA@mail.gmail.com>
References: <1487313115-9510-1-git-send-email-vijay.kilari@gmail.com>
	<1487313115-9510-3-git-send-email-vijay.kilari@gmail.com>
	<CAFEAcA8618+LGejFq6SpBEwGrNpfamBBX3MFWjss-ZxJ7Xk8mg@mail.gmail.com>
	<CALicx6tqxXZxBTxYvF55ydBg5CB1to3MsEkhaohucx4EAZcEJA@mail.gmail.com>
	<CAFEAcA_NbQNzrUUCAS2e5Xso0rg6H3+nzDjTc9i8Tc+GLpXvLw@mail.gmail.com>
	<CALicx6uiFYXsOMaiCH9HYW_jxbMSg+QSCrbVr0D-UKWwtf+TwA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 22 Feb 2017 12:05:51 +0000
Message-ID: <CAFEAcA8sTEtJGpvrL3qCQ7OfUaQ5Ym0siQfGMnTpaUQw+Uzh_A@mail.gmail.com>
To: Vijay Kilari <vijay.kilari@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::235
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
	Eric Auger <eric.auger@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	Christoffer Dall <christoffer.dall@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zf8AmLCthxbM

On 22 February 2017 at 11:56, Vijay Kilari <vijay.kilari@gmail.com> wrote:
> On Mon, Feb 20, 2017 at 3:21 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
>> My expectation was that the KVM GICv3 emulation would
>> make these bits RAO/WI like the TCG implementation.
>> Is there maybe a bug in the kernel side where it
>> doesn't implement bypass but has made these bits be
>> RAZ/WI rather than RAO/WI ?
>
> Do you have any inputs on this?

I talked to Marc Z who agreed this is a KVM bug -- the kernel
should have these bits be RAO/WI like TCG. I think Marc
was going to write a patch...

thanks
-- PMM
