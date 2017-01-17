Received: by 10.25.205.13 with SMTP id d13csp719301lfg;
        Tue, 17 Jan 2017 14:16:55 -0800 (PST)
X-Received: by 10.55.69.74 with SMTP id s71mr33957424qka.162.1484691415436;
        Tue, 17 Jan 2017 14:16:55 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n142si15339985qkn.84.2017.01.17.14.16.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 17 Jan 2017 14:16:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:37992 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cTc3g-0001GD-QE
	for alex.bennee@linaro.org; Tue, 17 Jan 2017 17:16:52 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35478)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1cTc3Y-0001Dz-6X
	for qemu-arm@nongnu.org; Tue, 17 Jan 2017 17:16:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1cTc3X-0005Vf-AZ
	for qemu-arm@nongnu.org; Tue, 17 Jan 2017 17:16:44 -0500
Received: from mail-wm0-x242.google.com ([2a00:1450:400c:c09::242]:33545)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1cTc3V-0005UJ-3m; Tue, 17 Jan 2017 17:16:41 -0500
Received: by mail-wm0-x242.google.com with SMTP id r144so41847286wme.0;
	Tue, 17 Jan 2017 14:16:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=ZfpgVVPVmR/y6r1yuh0rUxY0+8r+tN+wKwDdUYHD3X4=;
	b=Xztu2PyM+BVGozitOPl8zUsUOuMFd0+SLA6YFEoNMwCWrOLQh8+aOCltOHkUBA9mpU
	7gAYD09DdBcOjITac7fBNP40cBEu50dVV3J8Zg2BipBNzXkIec/jAH0FH3QIqTZah440
	jPHLYdRxL/RaQSLymB0fwdp9qR5OnwJt0eRx65I4oCAv1AiTTlhgj76tVF02b1fo2iIE
	zymtkLi0glDEckGkf21ivvVuMwT5mk8ZRMq/eUYZManQvsNkFULhmQE+R5WbdjvNjwdl
	qExB63U/TqEF2zv25W2hhxygm046iRQUNCv7m1Qtrt8dCtHd+2pu0DnLJCSjTXERU2ku
	56mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=ZfpgVVPVmR/y6r1yuh0rUxY0+8r+tN+wKwDdUYHD3X4=;
	b=Vi1+h95etAe2WpxdCMn89ZTrbLt/8JvpKBv4Xs/dLQnPWUk7zTrGSAToW1UJBBgCTy
	mkdhzVq4LWV57/I6Dr6KTcQijMTW/zFCQ4KO7U5uP9UlQitC7A3e7YtoWjmfqiabfp0O
	+ha5pzDkIQvRIKINUGsqbDJT50tYW6jB1NjQmbNG9btS8Md3hfGswjxYyJYQCoSerp9u
	fMlXFkRocT/KAyBMDbMIxpJdvcK8xYvvihNgpAZAP9732tbH/gGLOFSD/yocR9KsJBkH
	8QINsXVJLbGO8myNsyJk4kyKagIQj4kj3q14+Vf2bkQYYo3Y63nYm3vXZNQSs4IYHhHr
	ZjCg==
X-Gm-Message-State: AIkVDXIMt3cMsCKwSSiMcA1yQskw4/xlBnxR7BQc9iV8t7CY3wcSDWi5eB0SdNLdGJ0Gde3rDr15jIhxlKECvA==
X-Received: by 10.223.169.114 with SMTP id u105mr30186502wrc.173.1484691400131;
	Tue, 17 Jan 2017 14:16:40 -0800 (PST)
MIME-Version: 1.0
Received: by 10.80.154.68 with HTTP; Tue, 17 Jan 2017 14:16:09 -0800 (PST)
In-Reply-To: <20170117144954.rgw53vmavygrctlo@kamzik.brq.redhat.com>
References: <1483977924-14522-1-git-send-email-peter.maydell@linaro.org>
	<CAFEAcA9N_YXFCPo8ja-Nan3roL=gdNpFQHoLk_aw6tDixwoT3w@mail.gmail.com>
	<20170117144954.rgw53vmavygrctlo@kamzik.brq.redhat.com>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Tue, 17 Jan 2017 14:16:09 -0800
X-Google-Sender-Auth: Yi5yKMD_ZCZxN1WuvmEbRw9wXUE
Message-ID: <CAKmqyKNWnXzs=ZKO94s-tmxCEZva050Cjb14HoYmig9UqBJUrg@mail.gmail.com>
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::242
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 00/18] arm: Add
 virtualization to GICv3, and enable EL2 on 64-bit CPUs
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	"patches@linaro.org" <patches@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	Christoffer Dall <christoffer.dall@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HY0LBBAKXLn1

On Tue, Jan 17, 2017 at 6:49 AM, Andrew Jones <drjones@redhat.com> wrote:
> On Tue, Jan 17, 2017 at 02:07:31PM +0000, Peter Maydell wrote:
>> On 9 January 2017 at 16:05, Peter Maydell <peter.maydell@linaro.org> wrote:
>> > This patchset adds support for the Virtualization extensions to QEMU's
>> > GICv3 emulation. This was the last missing piece that was stopping
>> > us from turning on the EL2 support in the CPU model, so the patchset
>> > also adds support for enabling it all on the virt board via the
>> > '-machine virtualization=on' option.
>>
>> > Patches 1, 4-13, 15, 16 still need review.
>>
>> So is anybody interested in reviewing the complicated
>> bits in the middle of this patchset (5-13) or shall I
>> just throw it into target-arm.next? :-)

I have Acked and Reviewed what I can. I don't know much about GICv3 so
I can't really judge those patches. Overall they look good to me
though.

Thanks,

Alistair

>
> Unfortunately I don't have time right now to give them the justice
> they deserve. FWIW, I've done light testing and light reviewing and
> I don't have any complaints.
>
> Thanks,
> drew
>
>>
>> thanks
>> -- PMM
>>
>
