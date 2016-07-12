Received: by 10.25.21.156 with SMTP id 28csp470436lfv;
        Tue, 12 Jul 2016 09:36:34 -0700 (PDT)
X-Received: by 10.200.48.112 with SMTP id g45mr4956411qte.70.1468341394650;
        Tue, 12 Jul 2016 09:36:34 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a34si1334552qte.3.2016.07.12.09.36.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Jul 2016 09:36:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:42085 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bN0fi-0006YW-3V
	for alex.bennee@linaro.org; Tue, 12 Jul 2016 12:36:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49180)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1bN0eg-0005nQ-BK
	for qemu-arm@nongnu.org; Tue, 12 Jul 2016 12:35:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1bN0ef-0005gf-AE
	for qemu-arm@nongnu.org; Tue, 12 Jul 2016 12:35:30 -0400
Received: from mail-oi0-x22e.google.com ([2607:f8b0:4003:c06::22e]:34887)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>)
	id 1bN0ef-0005gH-6f; Tue, 12 Jul 2016 12:35:29 -0400
Received: by mail-oi0-x22e.google.com with SMTP id r2so30675910oih.2;
	Tue, 12 Jul 2016 09:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=GWMJAp7fqm3sgCmGHW+v/3qo2nYhv3c7lDtATLOTT1c=;
	b=jVpDvKvj8lZTsBIFM1vevmPSBvtm39DbAhtljEYPOJGsiAiA8mrW4n9qJAx/tgaJmg
	qkYzT5CwjxVXEgICkR9XOvng/BqkcAdXNllfbDIqfAekfcCNgfu9PsjnuSCjz2mj/E57
	L2PSxKk6zVs0p0xZM7oX6gfkENGN41dANzlvY8pZJSFV7pbQEZo/KsnYWR+S9TV2L0JO
	HAv/dua/uNyhFCq9uDe4NvT7LABPdiAGZhOBr6II4FnFpnGDfm83I3obFJZjcoSJVghN
	S7hB38jTcQr1uIzDPMa4HZ3cQZgh+7K1ZMzcxYVp6cIfOY1+dxLlR2RHNWwTrnpqKT8/
	AVPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=GWMJAp7fqm3sgCmGHW+v/3qo2nYhv3c7lDtATLOTT1c=;
	b=G0novqtYdDvYoB4yPmJxsvGMfXHvRlLZDoYGIfhXlLNv64PV7NFiDBQkOtHvnw/QA1
	TTB2taI7C6JA3Q8l8cT/mg7W0S1K/S5UkylOcqheWBrVWPlsO5C79tvf4v5U2SOlUyCm
	yuwNp9tmio6dkmnSm1EpOsCGqWnRojzxD6F02iM//HBX4nSpGXrvtxbkz3VTzgia5iim
	K/AiIES9Sv+BCDzc42cLfsEjAoW2TiSg4FMFggOC8guNc8sdMbDDizjVOBeCFvpscKSS
	E+NcLzd+a77VN7UoVpNxn4oIesve7z8MSNKAMFBufH39OVeVBdI26XRii6Kvga4Gm/tr
	x69Q==
X-Gm-Message-State: ALyK8tIA9Qus/2Dsn3dI9jBg1RjENRRg4H459Uwxy7gT50WjXuJ+VT7ibMRe7pYxQOYGjbjTErPG8jw0pAH9xw==
X-Received: by 10.202.206.66 with SMTP id e63mr8472152oig.136.1468341328616;
	Tue, 12 Jul 2016 09:35:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.0.81 with HTTP; Tue, 12 Jul 2016 09:34:58 -0700 (PDT)
In-Reply-To: <CAFEAcA9V=dV8qiuQ_HOfU=9=GiCJ6u=+g075CU=x8h-iBMiC2A@mail.gmail.com>
References: <cover.1468279072.git.alistair.francis@xilinx.com>
	<CAFEAcA9V=dV8qiuQ_HOfU=9=GiCJ6u=+g075CU=x8h-iBMiC2A@mail.gmail.com>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Tue, 12 Jul 2016 09:34:59 -0700
X-Google-Sender-Auth: 0o_MNoGeDhdCY8MvRZ6TFMafq78
Message-ID: <CAKmqyKNqbpqfR=+yzXtMOzdUzMTP4m_82hL5gdW=KC1nKjeGtA@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c06::22e
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v1 0/5] Add support for Cadence
 GEM priority queues
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
Cc: Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tNU+12s9/f8M

On Tue, Jul 12, 2016 at 7:25 AM, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 12 July 2016 at 00:20, Alistair Francis <alistair.francis@xilinx.com> wrote:
>> This patch series adds initial priority queue support to the Cadence GEM
>> device. This is based on original work by Peter C, that has been ported
>> to the latest version of QEMU.
>>
>> There is more GEM work that I'd like to upstream after this, but I
>> figured this a good place to start. I have done limited testing on the
>> Xilinx machine, including running some of our GEM regressions, although
>> they don't cover everything. I can't really think of too many other test
>> cases that I can run at the moment.
>
> Hi; I'll get to a proper review at some point in the future, but
> for the moment I just wanted to let you know that I'm classifying
> this as "not for 2.7", given where we are in the release process.

That's fine, I should have sent it earlier.

Thanks,

Alistair

>
> thanks
> -- PMM
>
