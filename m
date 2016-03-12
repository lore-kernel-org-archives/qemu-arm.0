Received: by 10.25.208.211 with SMTP id h202csp1290962lfg;
        Fri, 11 Mar 2016 16:18:56 -0800 (PST)
X-Received: by 10.140.157.7 with SMTP id d7mr16414831qhd.17.1457741936338;
        Fri, 11 Mar 2016 16:18:56 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f68si10972155qge.89.2016.03.11.16.18.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 11 Mar 2016 16:18:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:58351 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aeXGh-00069P-RC
	for alex.bennee@linaro.org; Fri, 11 Mar 2016 19:18:55 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44507)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aeXGe-00069A-SA
	for qemu-arm@nongnu.org; Fri, 11 Mar 2016 19:18:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aeXGd-0001HX-Gg
	for qemu-arm@nongnu.org; Fri, 11 Mar 2016 19:18:52 -0500
Received: from mail-vk0-x233.google.com ([2607:f8b0:400c:c05::233]:36655)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aeXGd-0001HQ-Am
	for qemu-arm@nongnu.org; Fri, 11 Mar 2016 19:18:51 -0500
Received: by mail-vk0-x233.google.com with SMTP id c3so153195052vkb.3
	for <qemu-arm@nongnu.org>; Fri, 11 Mar 2016 16:18:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=BMqtG0KLH6mz9eUJCXd3AOoLRcpYmWyLuhjjct0Z758=;
	b=gUTFQ8ETQDxgVw/Bo3mofkzTtBaDodhPIWFxJqOyI57B/cAo5t0RTbW177KT4CzF4E
	SDbtTl5JpwNab84StVdQtDSbkCp8FzBQBL+fHwq+JWmZFgvRKcFBn0ZAwH3dvgplJsHu
	3vo8jJbUXUsfKqK0xQ8cH9+uQRSFIZQkaVzUU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=BMqtG0KLH6mz9eUJCXd3AOoLRcpYmWyLuhjjct0Z758=;
	b=LSSa6YUkXP2nhdYrHIKIO9j26Fmm1LCH5Xo6yqChnD42blogFPwIQkH5Zv7vlWbYI0
	ChKLTFZyVsYrleKk77cU0AcSVQjLFHPM8F8LL2IsH8nMEPpdci0w7VLqv4JMHmR1LGJ+
	eBcqZBWePQsbJ/+Ce7f141oKyXqWTGJHEVH/s0eFPuerLNbhN3A+N5goZC2K5cUzQjho
	u5j1C4QqxotBStifwbhKppg9VooelS+ZeD2fKB/oHCZBM4p3i6ySWD5ZNLYAa8LZ5RSm
	glI0Go6avnrifQktuJkguYTqR5Xz90LTOPMfpkMJIOVEIV+UqaANZRXp9JAAFwg5FBek
	IqPA==
X-Gm-Message-State: AD7BkJLQ/9ngQaMeV6gpiJ00R+o5EW3ns9bl7plrMmzGFvJZDTK1iEfOL0/kOCHiWAX+IKCxIQOxtinZn77Zzz3D
X-Received: by 10.31.8.17 with SMTP id 17mr11304398vki.139.1457741930678; Fri,
	11 Mar 2016 16:18:50 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.216.1 with HTTP; Fri, 11 Mar 2016 16:18:30 -0800 (PST)
In-Reply-To: <1022901457739899@web28h.yandex.ru>
References: <1457107473-26292-1-git-send-email-afarallax@yandex.ru>
	<CAFEAcA8F9AdePC4h8ZqPftbBatnhbge=1jpoe1gdrYstpdiwzA@mail.gmail.com>
	<1022901457739899@web28h.yandex.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 12 Mar 2016 07:18:30 +0700
Message-ID: <CAFEAcA_+MD=Cf26wZ_C9AH_NbRm_Lim492ugWUx3WqEzNrN8eQ@mail.gmail.com>
To: Sergey Sorokin <afarallax@yandex.ru>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::233
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
X-TUID: j0m3a3pjJqRM

On 12 March 2016 at 06:44, Sergey Sorokin <afarallax@yandex.ru> wrote:
> 11.03.2016, 11:41, "Peter Maydell" <peter.maydell@linaro.org>:
>>On 4 March 2016 at 23:04, Sergey Sorokin <afarallax@yandex.ru> wrote:
>>> There is a bug in ARM address translation regime with a long-descriptor
>>> format. On the descriptor reading its address is formed from an index
>>> which is a part of the input address. And on the first iteration this index
>>> is incorrectly masked with 'grainsize' mask. But it can be wider according
>>> to pseudo-code.
>>> On the other hand on the iterations other than first the descriptor address
>>> is formed from the previous level descriptor by masking with 'descaddrmask'
>>> value. It always clears just 12 lower bits, but it must clear 'grainsize'
>>> lower bits instead according to pseudo-code.
>>> The patch fixes both cases.
>>
>>This is pretty confusing to understand -- it might help if you
>>could give an example.
>
> According to documentation (ARMv8 ARM DDI 0487A.i J1.1.5:
> aarch64/translation/walk/AArch64.TranslationTableWalk):
>
> bits(48) index = ZeroExtend(inputaddr<addrselecttop:addrselectbottom>:'000');
> descaddr.paddress.physicaladdress = baseaddress OR index;
>
> For a first iteration of the descriptor reading:
>
> addrselecttop = inputsize - 1;
> addrselectbottom = (3-level)*stride + grainsize;
>
> Let's assume grainsize == 12 (so stride == 9), level == 1, inputsize == 43.
> Then index is
> inputaddr<42:30>:'000';

...which is more than 9 bits, so when does this happen?
I think this can only happen for the Stage-2 only
concatenated translation-tables case...

(I agree we have a bug here, I'm just trying to work out when it
can trigger; if it's only possible for S2 page tables then it's
not a visible bug yet because no CPUs have EL2 support enabled.)

>>> -    /* The address field in the descriptor goes up to bit 39 for ARMv7
>>> -     * but up to bit 47 for ARMv8.
>>> +    /* The address field in the descriptor goes up to bit 39 for AArch32
>>> +     * but up to bit 47 for AArch64.
>>>       */
>>
>>This is not correct -- the descriptor field widths are as the comment
>>states before your patch:
>> * up to bit 39 for ARMv7
>> * up to bit 47 for ARMv8 (whether AArch32 or AArch64)
>>
>>See the v8 ARM ARM AArch32.TranslationTableWalkLD pseudocode and in
>>particular note the width which it uses for AddressSizeFault checks.
>
> I see in ARMv8 ARM DDI 0487A.i J1.2.4
> aarch32/translation/walk/AArch32.TranslationTableWalkLD:
>
> Before 'repeat' cycle:
> baseaddress = baseregister<39:baselowerbound>:Zeros(baselowerbound);
>
> Inside the cycle:
> baseaddress = desc<39:grainsize>:Zeros(grainsize);

Yes, but this happens only after we have done the check:

  if !IsZero(desc<47:40>) then
     [take the AddressSize fault]

which tells us that the descriptor field really is up to bit 48.
We just haven't yet implemented the check in QEMU which will
generate the AddressSize fault if the top bits are nonzero.
(In contrast, in ARMv7 there really are only 40 bits there.)

If you want to implement the AddressSize checks that's fine,
but otherwise please leave this bit of the code alone.

thanks
-- PMM
