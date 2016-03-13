Received: by 10.25.208.211 with SMTP id h202csp2022521lfg;
        Sun, 13 Mar 2016 11:28:59 -0700 (PDT)
X-Received: by 10.140.91.35 with SMTP id y32mr25132968qgd.42.1457893738893;
        Sun, 13 Mar 2016 11:28:58 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f80si18104248qkh.107.2016.03.13.11.28.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 13 Mar 2016 11:28:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@yandex.ru;
       dmarc=fail (p=NONE dis=NONE) header.from=yandex.ru
Received: from localhost ([::1]:37099 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1afAl8-0002cM-Cv
	for alex.bennee@linaro.org; Sun, 13 Mar 2016 14:28:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51647)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afarallax@yandex.ru>) id 1afAl5-0002cE-3B
	for qemu-arm@nongnu.org; Sun, 13 Mar 2016 14:28:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afarallax@yandex.ru>) id 1afAl0-00043S-Ky
	for qemu-arm@nongnu.org; Sun, 13 Mar 2016 14:28:55 -0400
Received: from forward10h.cmail.yandex.net ([87.250.230.221]:54038)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afarallax@yandex.ru>)
	id 1afAl0-00043L-50; Sun, 13 Mar 2016 14:28:50 -0400
Received: from web22h.yandex.ru (web22h.yandex.ru [IPv6:2a02:6b8:0:f05::32])
	by forward10h.cmail.yandex.net (Yandex) with ESMTP id 55083214EB;
	Sun, 13 Mar 2016 21:28:46 +0300 (MSK)
Received: from web22h.yandex.ru (localhost [127.0.0.1])
	by web22h.yandex.ru (Yandex) with ESMTP id 9BFD83C8198E;
	Sun, 13 Mar 2016 21:28:45 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1457893726; bh=zRyfWA1TUoDKvNoEAK6kiLpAqcIv3VQm6LMaU7H8Z00=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=EFuzQuW2n3eypVAC4qApXmkccqm0tzQfV03MQb2kKGmy9HVb6DOOjc2kkOQPbLxmY
	3+J05Zj2wCtMnfU3U9FttioDEtA5nqcTHqTKfA/SDVu5rW8RbAF/QSI56gRnlXfjZ0
	862BIHLDpZTkUMyl2XLmvBqm48tih0rMLO21shhY=
Received: by web22h.yandex.ru with HTTP;
	Sun, 13 Mar 2016 21:28:44 +0300
From: Sergey Sorokin <afarallax@yandex.ru>
To: Peter Maydell <peter.maydell@linaro.org>
In-Reply-To: <CAFEAcA_+MD=Cf26wZ_C9AH_NbRm_Lim492ugWUx3WqEzNrN8eQ@mail.gmail.com>
References: <1457107473-26292-1-git-send-email-afarallax@yandex.ru>
	<CAFEAcA8F9AdePC4h8ZqPftbBatnhbge=1jpoe1gdrYstpdiwzA@mail.gmail.com>
	<1022901457739899@web28h.yandex.ru>
	<CAFEAcA_+MD=Cf26wZ_C9AH_NbRm_Lim492ugWUx3WqEzNrN8eQ@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <4542001457893724@web22h.yandex.ru>
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Sun, 13 Mar 2016 21:28:44 +0300
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 87.250.230.221
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
X-TUID: DRj4Avs5ntwP

12.03.2016, 03:18, "Peter Maydell" <peter.maydell@linaro.org>:
>On 12 March 2016 at 06:44, Sergey Sorokin <afarallax@yandex.ru> wrote:
>> 11.03.2016, 11:41, "Peter Maydell" <peter.maydell@linaro.org>:
>>>On 4 March 2016 at 23:04, Sergey Sorokin <afarallax@yandex.ru> wrote:
>>>> There is a bug in ARM address translation regime with a long-descriptor
>>>> format. On the descriptor reading its address is formed from an index
>>>> which is a part of the input address. And on the first iteration this index
>>>> is incorrectly masked with 'grainsize' mask. But it can be wider according
>>>> to pseudo-code.
>>>> On the other hand on the iterations other than first the descriptor address
>>>> is formed from the previous level descriptor by masking with 'descaddrmask'
>>>> value. It always clears just 12 lower bits, but it must clear 'grainsize'
>>>> lower bits instead according to pseudo-code.
>>>> The patch fixes both cases.
>>>
>>>This is pretty confusing to understand -- it might help if you
>>>could give an example.
>>
>> According to documentation (ARMv8 ARM DDI 0487A.i J1.1.5:
>> aarch64/translation/walk/AArch64.TranslationTableWalk):
>>
>> bits(48) index = ZeroExtend(inputaddr<addrselecttop:addrselectbottom>:'000');
>> descaddr.paddress.physicaladdress = baseaddress OR index;
>>
>> For a first iteration of the descriptor reading:
>>
>> addrselecttop = inputsize - 1;
>> addrselectbottom = (3-level)*stride + grainsize;
>>
>> Let's assume grainsize == 12 (so stride == 9), level == 1, inputsize == 43.
>> Then index is
>> inputaddr<42:30>:'000';
>
>...which is more than 9 bits, so when does this happen?
>I think this can only happen for the Stage-2 only
>concatenated translation-tables case...
>
>(I agree we have a bug here, I'm just trying to work out when it
>can trigger; if it's only possible for S2 page tables then it's
>not a visible bug yet because no CPUs have EL2 support enabled.)

I can not anwer you to this question. The bug was found by our internal
corporate test suite with EL2 enabled.

>
>>>> -    /* The address field in the descriptor goes up to bit 39 for ARMv7
>>>> -     * but up to bit 47 for ARMv8.
>>>> +    /* The address field in the descriptor goes up to bit 39 for AArch32
>>>> +     * but up to bit 47 for AArch64.
>>>>       */
>>>
>>>This is not correct -- the descriptor field widths are as the comment
>>>states before your patch:
>>> * up to bit 39 for ARMv7
>>> * up to bit 47 for ARMv8 (whether AArch32 or AArch64)
>>>
>>>See the v8 ARM ARM AArch32.TranslationTableWalkLD pseudocode and in
>>>particular note the width which it uses for AddressSizeFault checks.
>>
>> I see in ARMv8 ARM DDI 0487A.i J1.2.4
>> aarch32/translation/walk/AArch32.TranslationTableWalkLD:
>>
>> Before 'repeat' cycle:
>> baseaddress = baseregister<39:baselowerbound>:Zeros(baselowerbound);
>>
>> Inside the cycle:
>> baseaddress = desc<39:grainsize>:Zeros(grainsize);
>
>Yes, but this happens only after we have done the check:
>
>  if !IsZero(desc<47:40>) then
>     [take the AddressSize fault]
>
>which tells us that the descriptor field really is up to bit 48.
>We just haven't yet implemented the check in QEMU which will
>generate the AddressSize fault if the top bits are nonzero.
>(In contrast, in ARMv7 there really are only 40 bits there.)
>
>If you want to implement the AddressSize checks that's fine,
>but otherwise please leave this bit of the code alone.

You said me that my code is not correct, I have proved that it conforms
to the documentation.
It's a bit obfuscating when the doc explicitly says to take bits up to 39
from the descriptor, but in QEMU we take bits up to 47 relying on the check in
another part of the code, even if both ways are correct.

Nevertheless there is another bug in descaddrmask in QEMU.
From ARM ARM:
baseaddress = desc<39:grainsize>:Zeros(grainsize);

But currently QEMU does:
descaddrmask = 0xfffffffff000ULL;

It assumes that grainsize is always 12, but it can be greater
in AArch64 translation regime.
The patch fixes the bug,
and completely conforms to the doc, doesn't it?
