Received: by 10.25.208.211 with SMTP id h202csp504551lfg;
        Thu, 17 Mar 2016 08:21:46 -0700 (PDT)
X-Received: by 10.140.40.138 with SMTP id x10mr14924648qgx.2.1458228106831;
        Thu, 17 Mar 2016 08:21:46 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a29si8218368qkj.13.2016.03.17.08.21.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 17 Mar 2016 08:21:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=neutral (body hash did not verify) header.i=@yandex.ru;
       dmarc=fail (p=NONE dis=NONE) header.from=yandex.ru
Received: from localhost ([::1]:35875 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1agZkA-0002sO-Ai
	for alex.bennee@linaro.org; Thu, 17 Mar 2016 11:21:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55486)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afarallax@yandex.ru>) id 1agZk7-0002pJ-FD
	for qemu-arm@nongnu.org; Thu, 17 Mar 2016 11:21:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afarallax@yandex.ru>) id 1agZk4-0007pC-4r
	for qemu-arm@nongnu.org; Thu, 17 Mar 2016 11:21:43 -0400
Received: from forward12j.cmail.yandex.net ([5.255.227.176]:33333)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afarallax@yandex.ru>)
	id 1agZk3-0007nu-Qa; Thu, 17 Mar 2016 11:21:40 -0400
Received: from web26j.yandex.ru (web26j.yandex.ru [5.45.198.67])
	by forward12j.cmail.yandex.net (Yandex) with ESMTP id 0729421127;
	Thu, 17 Mar 2016 18:21:35 +0300 (MSK)
Received: from web26j.yandex.ru (localhost [127.0.0.1])
	by web26j.yandex.ru (Yandex) with ESMTP id CB203558166D;
	Thu, 17 Mar 2016 18:21:34 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1458228095; bh=ReJJFQKEZxns5PeisalfeArWvC3SFR4crFRpNzGxIJI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=RrpVbC8NFX1Z6UZZsb30B2x9xa9VFT7mZeo1i8YBrYn+fk7YyXn/+bR6wjFMuh+kS
	zEe/o4/eQQXKTS+vmw/OmygXK/O6dYTvRGfC1RXFgVX9wryHfqDRjMOhxynOUQmvsO
	Rw+CpOR/ILq/POJNxJXjobvRx4bOqo/z0U3srYn8=
Received: by web26j.yandex.ru with HTTP;
	Thu, 17 Mar 2016 18:21:34 +0300
From: Sergey Sorokin <afarallax@yandex.ru>
To: Peter Maydell <peter.maydell@linaro.org>
In-Reply-To: <CAFEAcA_s+YmPJSwmWYc4coMXzdRHhB3bsHew_AfRunD1pWhB_Q@mail.gmail.com>
References: <1457107473-26292-1-git-send-email-afarallax@yandex.ru>
	<CAFEAcA8F9AdePC4h8ZqPftbBatnhbge=1jpoe1gdrYstpdiwzA@mail.gmail.com>
	<1022901457739899@web28h.yandex.ru>
	<CAFEAcA_+MD=Cf26wZ_C9AH_NbRm_Lim492ugWUx3WqEzNrN8eQ@mail.gmail.com>
	<4542001457893724@web22h.yandex.ru>
	<CAFEAcA_s+YmPJSwmWYc4coMXzdRHhB3bsHew_AfRunD1pWhB_Q@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <628941458228094@web26j.yandex.ru>
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Thu, 17 Mar 2016 18:21:34 +0300
Content-Type: text/plain; charset=koi8-r
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 5.255.227.176
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] [PATCH] target-arm: Fix descriptor address masking
	in ARM address translation
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
X-TUID: OR7ELCmoHqBK

17.03.2016, 14:40, "Peter Maydell" <peter.maydell@linaro.org>:
> On 13 March 2016 at 18:28, Sergey Sorokin <afarallax@yandex.ru> wrote:
>>> If you want to implement the AddressSize checks that's fine,
>>> but otherwise please leave this bit of the code alone.
>>
>> =9AYou said me that my code is not correct, I have proved that it conf=
orms
>> =9Ato the documentation.
>> =9AIt's a bit obfuscating when the doc explicitly says to take bits up=
 to 39
>> =9Afrom the descriptor, but in QEMU we take bits up to 47 relying on t=
he check in
>> =9Aanother part of the code, even if both ways are correct.
>
> The way the code in QEMU is structured is that we extract the
> descriptor field in one go and then will operate on it
> (checking for need to AddressSize fault, etc) as a second
> action. The field descriptors themselves are the sizes I said.

Well, may be it's enough just to change this comment as you intend:

>> -    /* The address field in the descriptor goes up to bit 39 for ARMv=
7
>> -     * but up to bit 47 for ARMv8.
>> +    /* The address field in the descriptor goes up to bit 39 for AArc=
h32
>> +     * but up to bit 47 for AArch64.
>>       */
>
>This is not correct -- the descriptor field widths are as the comment
>states before your patch:
> * up to bit 39 for ARMv7
> * up to bit 47 for ARMv8 (whether AArch32 or AArch64)

I could describe there, that the descriptor field is up to bit 47 for ARM=
v8,
but we use the descaddrmask up to bit 39 for AArch32,
because we don't need other bits in that case to construct next descripto=
r address,
as it is described in the doc.
