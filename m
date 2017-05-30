Received: by 10.25.0.6 with SMTP id 6csp1863686lfa;
        Tue, 30 May 2017 08:12:06 -0700 (PDT)
X-Received: by 10.233.223.196 with SMTP id t187mr24225282qkf.31.1496157126134;
        Tue, 30 May 2017 08:12:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1496157126; cv=none;
        d=google.com; s=arc-20160816;
        b=ChW5Q+BEwSu7Ak0BNjVb5eay0FYPcya4NrLqkmrO1T9ZkyehiQDHiqXV8mBXo6Depk
         ZcFjB/jFGsGOf7R2J1aGB3+vadBfPno+dG3KegzoLf1sU/7++qtnBJu7uz4CM0Ev7vFJ
         MCbNE+pR64vEr7gqY85VpvvdgvFAKi+7OsmWoImAQCHgsO8Mz592/ckHSmpjNeUa3bHs
         qkoH1ZEF/YPEXmIvyQbIJAfMAz0lbC+2H98gJmk4aJWzJ28ERn7kJ0CoFqt+e4aC2oTT
         Q1nLsrQOIP/2+7QzUiXsZHKpMKStIF3QKE5VLLuij9oJ5DoIAr4wBKfFtvciizFHTON1
         5BRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=LzCLTMK1/vKtoaTwJiIMuE+1/dCLbcWDtZipkZk5eMs=;
        b=TThCtBFWKImbWLVpWS3OBV4WMgbcFFkUkV2B2QWE8ip3cqwfVyzPsv4BWXPPtwTaS8
         3djXwHWwpquKAB4+8EsOIdfWZ0zXL3c3e5R2adi1x8FFuNqBMGbM+2acFGNOU6+qmHKb
         2IiSPlPA1veo4Q90bda9vkGb3S8mAVx4kdJARnTcVP5zYoP4SL9Pw8AJ5/Y/QLPrF0u7
         YfxVOWOC0+/Y++4e5sRmCnzflMl5epTZfOrmgACmYY3TrISpZXvrEAQvf6r96VDbcRY1
         l15XHu5CtMC9b4EC+5K9isiTamiqixpNxFIk5P6Gooas0sa+TXA1ah6rsV6oikjOSA2F
         nclA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v32si12952878qta.337.2017.05.30.08.12.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 30 May 2017 08:12:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54402 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dFioX-0007xQ-Hu
	for alex.bennee@linaro.org; Tue, 30 May 2017 11:12:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38248)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dFioS-0007vv-Hv
	for qemu-arm@nongnu.org; Tue, 30 May 2017 11:12:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dFioO-00072I-CC
	for qemu-arm@nongnu.org; Tue, 30 May 2017 11:12:00 -0400
Received: from mail-wm0-x22c.google.com ([2a00:1450:400c:c09::22c]:37738)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dFioO-00071u-2N
	for qemu-arm@nongnu.org; Tue, 30 May 2017 11:11:56 -0400
Received: by mail-wm0-x22c.google.com with SMTP id d127so100724264wmf.0
	for <qemu-arm@nongnu.org>; Tue, 30 May 2017 08:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=LzCLTMK1/vKtoaTwJiIMuE+1/dCLbcWDtZipkZk5eMs=;
	b=BqWoy2yzj6uSERkdr8YJcEeDPrVI639vKGn1OAf/cN7maknCI6Gz6QmmSMvE+nohWa
	8uptgkBYITmxrHydGv852Ei7uX1x3Ga/SUxQrZQPI/5kErDoFP34hg62qKJ4seL/2mha
	NLtGz0eB5vyGJko8BXtYDCCKMj7zEpWPeaWA8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=LzCLTMK1/vKtoaTwJiIMuE+1/dCLbcWDtZipkZk5eMs=;
	b=M2afQlS8QwxAHHjqp2EovvElw0udENtao6OAwBu/tSWhFwA1CRD33A0zVl5JodZXhV
	6Xe43dZEl3ehRgGoS5vjrgcgIQcOxDl+7hqDtRfTS5Bk0uch0hZeQ5WC1g34lxBH5/hP
	MpO6nyrkhQ6wwezT0RnCQcc1XglGQIHmp2YaCSpQQUHjlU9l4DDabRgoYe/0BNO/ES+E
	y9+S1Yvpv8C0c6CWgKznYQ7U0gJa1xJTrrFpk6aeWmssD82zteHdxb8251mIhD877BaN
	7/dnEa2AkfsVdJCawaI2oTuR8GezRqv2hsMBkHWBL0uetcatBMuZ/9z8Kgm58i3FpvLe
	YVxw==
X-Gm-Message-State: AODbwcA2py3CMGCjt8XnVvYUeGpTy/SivIhdnXPTFQwAnpHNlaYwfZd6
	G7oiP3IhBP6O46VH1wwWo6NgGvX7xbp6
X-Received: by 10.28.24.202 with SMTP id 193mr2223457wmy.125.1496157114866;
	Tue, 30 May 2017 08:11:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.135.82 with HTTP; Tue, 30 May 2017 08:11:34 -0700 (PDT)
In-Reply-To: <c9954451-ad9b-2365-5ed7-bc4c29f40abe@amsat.org>
References: <1493122030-32191-1-git-send-email-peter.maydell@linaro.org>
	<1493122030-32191-10-git-send-email-peter.maydell@linaro.org>
	<c9954451-ad9b-2365-5ed7-bc4c29f40abe@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 30 May 2017 16:11:34 +0100
Message-ID: <CAFEAcA8aAwM-_9h1L23kjmfoabvivYdbKcC5e6YEkMXyUfTt5w@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::22c
Subject: Re: [Qemu-arm] [PATCH 09/13] armv7m: Implement M profile default
 memory map
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	"patches@linaro.org" <patches@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NLY1vHTG/7lm

On 30 May 2017 at 15:56, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wrot=
e:
> Hi Peter,
>
> On 04/25/2017 09:07 AM, Peter Maydell wrote:
>>
>> From: Michael Davidsaver <mdavidsaver@gmail.com>
>>
>> Add support for the M profile default memory map which is used
>> if the MPU is not present or disabled.
>>
>> The main differences in behaviour from implementing this
>> correctly are that we set the PAGE_EXEC attribute on
>> the right regions of memory, such that device regions
>> are not executable.
>>
>> Signed-off-by: Michael Davidsaver <mdavidsaver@gmail.com>
>> [PMM: rephrased comment and commit message; don't mark
>>  the flash memory region as not-writable]
>
>
> "not-writable by system caches" maybe to clarify?

(Note that this is a comment describing something I
deleted from Michael's original patch.)
No, by 'not-writable' here I mean "not writeable by the CPU".

>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>> ---
>>  target/arm/helper.c | 35 ++++++++++++++++++++++++++---------
>>  1 file changed, 26 insertions(+), 9 deletions(-)
>>
>> diff --git a/target/arm/helper.c b/target/arm/helper.c
>> index 9e1ed1c..51662ad 100644
>> --- a/target/arm/helper.c
>> +++ b/target/arm/helper.c
>> @@ -8129,18 +8129,35 @@ static inline void
>> get_phys_addr_pmsav7_default(CPUARMState *env,
>>                                                  ARMMMUIdx mmu_idx,
>>                                                  int32_t address, int
>> *prot)
>>  {
>> -    *prot =3D PAGE_READ | PAGE_WRITE;
>> -    switch (address) {
>> -    case 0xF0000000 ... 0xFFFFFFFF:
>> -        if (regime_sctlr(env, mmu_idx) & SCTLR_V) { /* hivecs execing i=
s
>> ok */
>> +    if (!arm_feature(env, ARM_FEATURE_M)) {
>> +        *prot =3D PAGE_READ | PAGE_WRITE;
>> +        switch (address) {
>> +        case 0xF0000000 ... 0xFFFFFFFF:
>> +            if (regime_sctlr(env, mmu_idx) & SCTLR_V) {
>> +                /* hivecs execing is ok */
>> +                *prot |=3D PAGE_EXEC;
>> +            }
>> +            break;
>> +        case 0x00000000 ... 0x7FFFFFFF:
>
>>              *prot |=3D PAGE_EXEC;
>
> I checked at Table B3-1 on the ARMv7-M Architecture Reference Manual I go=
t
> at https://static.docs.arm.com/ddi0403/e/DDI0403E_B_armv7m_arm.pdf and th=
e
> on-chip peripheral address space at 0x40000000 is eXecute Never.

This is the arm of the if() that deals with R profile, and R profile's
background region is completely different to M profile. (In any
case the patch shouldn't change the behaviour there.)

>> +            break;
>> +        }
>> +    } else {
>> +        /* Default system address map for M profile cores.
>> +         * The architecture specifies which regions are execute-never;
>> +         * at the MPU level no other checks are defined.
>> +         */
>> +        switch (address) {
>> +        case 0x00000000 ... 0x1fffffff: /* ROM */
>> +        case 0x20000000 ... 0x3fffffff: /* SRAM */
>> +        case 0x60000000 ... 0x7fffffff: /* RAM */
>> +        case 0x80000000 ... 0x9fffffff: /* RAM */
>> +            *prot =3D PAGE_READ | PAGE_WRITE | PAGE_EXEC;
>> +            break;
>> +        default: /* Peripheral, 2x Device, and System */
>> +            *prot =3D PAGE_READ | PAGE_WRITE;
>
>
> This body is correct, however what do you think about using cases with
> comments instead of 'default'? This would be clearer.

Yeah, we could do that. I think this is one of those cases where
I opted to go with how Michael had already written the code rather
than rewriting it.

        /* Default system address map for M profile cores.
         * The architecture specifies which regions are execute-never;
         * at the MPU level no other checks are defined.
         */
        switch (address) {
        case 0x00000000 ... 0x1fffffff: /* ROM */
        case 0x20000000 ... 0x3fffffff: /* SRAM */
        case 0x60000000 ... 0x7fffffff: /* RAM */
        case 0x80000000 ... 0x9fffffff: /* RAM */
            *prot =3D PAGE_READ | PAGE_WRITE | PAGE_EXEC;
            break;
        case 0x40000000 ... 0x5fffffff: /* Peripheral */
        case 0xa0000000 ... 0xbfffffff: /* Device */
        case 0xc0000000 ... 0xdfffffff: /* Device */
        case 0xe0000000 ... 0xffffffff: /* System */
            *prot =3D PAGE_READ | PAGE_WRITE;
            break;
        default:
            g_assert_not_reached();
        }

would be the explicit version.

>>          }
>> -        break;
>> -    case 0x00000000 ... 0x7FFFFFFF:
>> -        *prot |=3D PAGE_EXEC;
>> -        break;
>>      }
>> -
>>  }
>>
>>  static bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,

thanks
-- PMM
