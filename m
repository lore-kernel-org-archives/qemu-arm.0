Received: by 10.25.208.211 with SMTP id h202csp31784lfg;
        Mon, 4 Apr 2016 12:39:19 -0700 (PDT)
X-Received: by 10.140.228.68 with SMTP id y65mr25588558qhb.78.1459798758951;
        Mon, 04 Apr 2016 12:39:18 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t90si23385956qgd.103.2016.04.04.12.39.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 04 Apr 2016 12:39:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60757 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1anALG-0005bf-FI
	for alex.bennee@linaro.org; Mon, 04 Apr 2016 15:39:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48866)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1anALC-0005Ya-U3
	for qemu-arm@nongnu.org; Mon, 04 Apr 2016 15:39:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1anALC-0006eb-1y
	for qemu-arm@nongnu.org; Mon, 04 Apr 2016 15:39:14 -0400
Received: from mail-vk0-x234.google.com ([2607:f8b0:400c:c05::234]:35568)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1anALB-0006eO-St
	for qemu-arm@nongnu.org; Mon, 04 Apr 2016 15:39:13 -0400
Received: by mail-vk0-x234.google.com with SMTP id e6so193942584vkh.2
	for <qemu-arm@nongnu.org>; Mon, 04 Apr 2016 12:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=7X+C1QBZkhTnV07K30exfdX/y3N6IIKDsIb7YeeaJXk=;
	b=AxpTpyetpjoGpV2bsOkWkUnathVtMfsy7MdN2a1aTl2tRxKJIs5T/ztG+iMBn7RJ2N
	t7UH3G/lYEgqtmkbYzjrPO3LRcP7qDVloT6YYRaVNgone7A31eQ3PjuLV3MccyI5SM8Z
	KBeN6+b7w23rGESJAKm9VsrvaOJlEd7SP31jY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=7X+C1QBZkhTnV07K30exfdX/y3N6IIKDsIb7YeeaJXk=;
	b=VTZU0Cj3f5K9XIpSf0xQrLhak00x6AFKSIRi1bWR7A05T4VdpkuoG/ICSRB6tgd9SM
	eWNMBt+Kdbn69A8CtlxZRu6Js8bGqvJ/tdg/z2TiouuEdEv2jytLBjm5yuUjwkegsh/Y
	dbxrmt0lWULKdMBlt8b0K/6ythVnRNOL0lMN59RjpwNTR7G3Rd+bXi2aBYHHB2DIS1l4
	+CuHa3igQr7oOj0oAJ9GSnyaxhPy2tJ/MdSBC9QjAmjiC8MuQ6ykYsOsbqRQ/f7jSJfv
	y+R42I8n8/0Xpo/b4g1ZVGW80yE29r9ojamvub8IvmJltPOquAh2We0m09byZOTGD/bW
	8Tmw==
X-Gm-Message-State: AD7BkJLTgpJevlLA9WCYeHzK6LAH6LWa5nmPotBXGXWRI9JNDc2FyOgFdm4PMFjBVqjQshaH8/6+/L1QE6HmKWmX
X-Received: by 10.31.52.147 with SMTP id b141mr8150519vka.82.1459798753478;
	Mon, 04 Apr 2016 12:39:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.216.1 with HTTP; Mon, 4 Apr 2016 12:38:54 -0700 (PDT)
In-Reply-To: <20160404193723.GD22665@thinpad.lan.raisama.net>
References: <1458910214-12239-1-git-send-email-aleksandar.markovic@rt-rk.com>
	<1458910214-12239-2-git-send-email-aleksandar.markovic@rt-rk.com>
	<56F9A3D1.2050402@twiddle.net>
	<EF5FA6C3467F85449672C3E735957B859168FB0A@BADAG02.ba.imgtec.org>
	<CAFEAcA_Rp+8hGC6sos3H3t2A8UDgLUf3KvrM3-C3zZAFCc_WEA@mail.gmail.com>
	<20160404193723.GD22665@thinpad.lan.raisama.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Apr 2016 20:38:54 +0100
Message-ID: <CAFEAcA9axhkDC0tDT1ujNZUpHbCnMqSxaL-KTD2=TV=XOyEbuw@mail.gmail.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::234
Cc: "proljc@gmail.com" <proljc@gmail.com>,
	"kbastian@mail.uni-paderborn.de" <kbastian@mail.uni-paderborn.de>,
	"mark.cave-ayland@ilande.co.uk" <mark.cave-ayland@ilande.co.uk>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"agraf@suse.de" <agraf@suse.de>,
	"blauwirbel@gmail.com" <blauwirbel@gmail.com>,
	"jcmvbkbc@gmail.com" <jcmvbkbc@gmail.com>,
	Aleksandar Markovic <Aleksandar.Markovic@imgtec.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
	Petar Jovanovic <Petar.Jovanovic@imgtec.com>,
	"pbonzini@redhat.com" <pbonzini@redhat.com>,
	Miodrag Dinic <Miodrag.Dinic@imgtec.com>,
	"gxt@mprc.pku.edu.cn" <gxt@mprc.pku.edu.cn>,
	Leon Alrae <Leon.Alrae@imgtec.com>, "afaerber@suse.de" <afaerber@suse.de>,
	"aurelien@aurel32.net" <aurelien@aurel32.net>,
	Richard Henderson <rth@twiddle.net>
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 1/2] softfloat: Enable
 run-time-configurable meaning of signaling NaN bit
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
X-TUID: nn6fOU4l6A/k

On 4 April 2016 at 20:37, Eduardo Habkost <ehabkost@redhat.com> wrote:
> On Mon, Apr 04, 2016 at 02:31:47PM +0100, Peter Maydell wrote:
>> On 4 April 2016 at 14:21, Aleksandar Markovic
>> <Aleksandar.Markovic@imgtec.com> wrote:
>> > B. arm - explicitely sets other fields of float_status,
>> >       explicit invocation of set_snan_bit_is_one(0) added
>>
>> We zero the float_status structs on reset, because they are earlier
>> in the CPUARMState structure than the 'features' field (and so the
>> memset() in arm_cpu_reset() will clear them). So you don't
>> need to explicitly zero a field like this. I expect the other
>> architectures are the same.
>
> Even if it is not zeroed on reset, it is zeroed on object_new().
> Isn't that enough?

It must be zeroed on reset, otherwise we won't get the right
behaviour if you reset the CPU after running it for a bit.
object_new() zeroing is not sufficient.

thanks
-- PMM
