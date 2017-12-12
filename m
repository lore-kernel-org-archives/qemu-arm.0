Received: by 10.223.159.74 with SMTP id f10csp3819017wrg;
        Tue, 12 Dec 2017 05:29:11 -0800 (PST)
X-Google-Smtp-Source: ACJfBovni6Gf5x7CCynPFhqbVzeen8MwDbGwN7NenFlVjViFsQyhBCP2dDAiUCIiU7EwlTijeJ95
X-Received: by 10.129.90.135 with SMTP id o129mr2858562ywb.28.1513085350974;
        Tue, 12 Dec 2017 05:29:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513085350; cv=none;
        d=google.com; s=arc-20160816;
        b=E9fJODmj00dpkGqfG0ZIOz7eqpuDsQiC3Fst02UZONdQw/ctKncH+P63cjn3he7fVa
         uITfYdcnEqeCzy0Ed851SEFt0zz7sBqC0Zm5eYlHaB8lY76i13w6w0iQ3bQG8gCbii4/
         atBqD6Y9PfRf/aTVmKr9oYLQNb2zc2tcYVbczLKm3InbHUmn/ISq9B46M+I0KGlpjyCP
         8G/9VbZNHTm073oiyInifikGHVY3JXPZLyjJbWnrWPGUcx6wFoHGw5g874mYrsO58P1i
         4YoC0sNG70oxm/MgvWi4F3UEEu4i0Z+IqIthgKUoyuSA+Qrpl9HN5aXF2GknE4g/jrwB
         UoCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=LCJy5DcNYJ4NP2FdE2wum989AQc3alEnf0vrvdewhNQ=;
        b=p50p75p1W0teRMfJPq6ElYSKhnNyezAPq7IcwNqdAjQxifzpVihgL12i6y1hAz/5bu
         bmzB8htqb2g5ZACT9B8En9X+asMW8KcsywGvDOp7h8LZNUC90Oi8Y8VopFLcLHUpXzpJ
         1b3Lcls2DOUay85A7PoVGSi6TpLg8P7MtbJbjCX4OdLuUFyumUS7ArPjCPZP+J9Q0S/S
         4SrGCWPV8LbcfADjlicK6NEgWfUSCVgLaJ+kFE23hcbJj2z7S+kNGiDrb7t+cZb3Us8V
         HWlt/SjIowh+TDVInAs8rBjAzLJiTl33GAq4uiRgnAX8zzbYskeD2MepoDfX3dhiYTr8
         9+nA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r19si3519125ywa.295.2017.12.12.05.29.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Dec 2017 05:29:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58317 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eOkcQ-0002tr-E7
	for alex.bennee@linaro.org; Tue, 12 Dec 2017 08:29:10 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50640)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1eOkcF-0002tT-DD
	for qemu-arm@nongnu.org; Tue, 12 Dec 2017 08:29:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1eOkcC-0004Gm-9A
	for qemu-arm@nongnu.org; Tue, 12 Dec 2017 08:28:59 -0500
Received: from mx1.redhat.com ([209.132.183.28]:45522)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lersek@redhat.com>)
	id 1eOkcB-0004EX-VC; Tue, 12 Dec 2017 08:28:56 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 037AF5D5E6;
	Tue, 12 Dec 2017 13:28:55 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-120-105.rdu2.redhat.com
	[10.10.120.105])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 043B75C542;
	Tue, 12 Dec 2017 13:28:52 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1512745328-5109-1-git-send-email-peter.maydell@linaro.org>
	<1512745328-5109-4-git-send-email-peter.maydell@linaro.org>
	<5A2F6ED9.5030605@huawei.com>
	<ac182406-8011-9f19-38e7-37328434095b@redhat.com>
	<CAFEAcA_9pee99KpL4zwVS5jJuiv2MCGp79crufpU1kH1Okg-Hg@mail.gmail.com>
	<6b4b6351-eeb4-a4d3-8ddf-5401516671ae@redhat.com>
	<CAKv+Gu-Ugm1g8twoKwgXAPtDfETvXntk2h4WzMVuUTDF7GhMvA@mail.gmail.com>
	<5e3798f7-e280-b6c3-1504-828283617c52@redhat.com>
	<CAFEAcA_+NnpeP9Le7bp9yrYQDwtuP79pt8GpVzJ4RBDMx1iomA@mail.gmail.com>
	<09e7b89f-27f2-1787-b371-7b0c0eff78b8@redhat.com>
	<CAFEAcA-357eVt3s_7ULWxssQttvAV0DkUv_tGkyk8umVgfH1QA@mail.gmail.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <d776710c-2255-947b-22c6-336e9491bb81@redhat.com>
Date: Tue, 12 Dec 2017 14:28:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-357eVt3s_7ULWxssQttvAV0DkUv_tGkyk8umVgfH1QA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Tue, 12 Dec 2017 13:28:55 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 3/3] hw/arm/virt-acpi-build: Add
 second UART to ACPI tables
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
Cc: "Jason A . Donenfeld" <Jason@zx2c4.com>,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>,
	Drew Jones <drjones@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Andrea Bolognani <abologna@redhat.com>,
	Shannon Zhao <zhaoshenglong@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: B6+CkltSgopA

On 12/12/17 13:47, Peter Maydell wrote:
> On 12 December 2017 at 12:41, Laszlo Ersek <lersek@redhat.com> wrote:
>> I agree. There's one user-visible complication: while with one UART,
>> it's not possible to mix things up, with two UARTs, users will
>> inevitably want to assign inverse roles to them, relative to what QEMU /
>> the firmware assigns originally.
>>
>> E.g. if one PL011 is redirected to a regular file (debug messages) and
>> the other one to stdio (console), there will be complaints that "I
>> wanted it the other way around". The redirection happens on the backend
>> (chardev) level, but the firmware won't see the difference on the
>> frontend (PL011) level.
>>
>> Is it possible to add a new property to the UART nodes in the DTB, like
>> "purpose"?
> 
> This is what the "chosen" stdout-path node in the DTB is for,
> but you said you didn't want to look at that :-) (it means
> "device to be used for boot console output".)

:(

Ard is right that we really shouldn't do that kind of parsing magic in
very early UEFI stuff.


>> Or can we make a virt-arm policy that "first -serial is always ...,
>> second -serial is always ..."?
> 
> Well, the first -serial will always be the 0x09000000 one
> that we have today, and the second -serial will be the other
> one (unless you have -machine secure=yes, in which case
> second -serial is the secure-only UART and third -serial is
> the second NS UART).
> 
> Is this any different to the x86 case, where there are two
> UARTs at different IO port/IRQ locations?

OVMF (x86) uses two distinct devices for the two purposes discussed.

* It uses the "debug console device" for debug message output, at
hard-coded IO port 0x402; so if you'd like to capture those messages,
then you have to add:

  -chardev file,id=debugfile,path=debug.log \
  -device isa-debugcon,iobase=0x402,chardev=debugfile \

(or the more traditional

  -debugcon file:debug.log \
  -global isa-debugcon.iobase=0x402 \
)

* For console I/O, it uses the first serial port. (I think I have once
investigated what it takes to use other serial ports for console I/O --
I'm no longer sure if "it happens to be impossible in OVMF", or just
"nobody ever does that".)


The important distinction (on the UEFI level anyway) is that the debug
messages need to go to a super dumb device, while console I/O can use a
much higher-level serial IO abstraction ("protocol").


> I think the only thing users really expect is that if you're
> using just the one serial port for anything then it's the
> first one.

You are right -- we've never had two (non-secure) UARTs on virt-arm, so
we can invent whatever assignment, as long as:

- the single UART case doesn't break (keeps receiving both debug output
and console IO),

- whatever we invent for the two UARTs case now, it remains consistent
over time. I think this implies we can rely on the FDT node ordering in
the firmware (if we want to use the 2nd UART at all, that is), and then
QEMU shouldn't change the serial_hds[] <-> FDT node mapping in the
future, in machvirt_init() and the callees thereof.

Thanks!
Laszlo
