Received: by 10.25.44.15 with SMTP id s15csp182913lfs;
        Fri, 28 Jul 2017 01:52:18 -0700 (PDT)
X-Received: by 10.55.81.139 with SMTP id f133mr8870094qkb.194.1501231938047;
        Fri, 28 Jul 2017 01:52:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501231938; cv=none;
        d=google.com; s=arc-20160816;
        b=zm2++c0aKQeCdL6vlaKEBBd6+TCck1POhdbk6X95cVUSAIJ3L1dqb3G/bzCn5qYrxq
         cD5sY8W5j8LuhqM9CY5f4jpnXt1dbfcyPx9vsqbVLHrWg/5hL8txyDftXjAVm1NDKJJP
         lDfG2DK1bbEcjocfmloesc7EzXDgFeNx7E2cuqy4ZUTT2vEGcKWnvNmIFOI3zkWK5MvW
         LtQM9VJsKSbyhsl/bJT9pTLjY4Tfcm7C6jEnjqC8/yOF2bLO4rpmZkk+vPKdyO8mdoZE
         KQ07y8Cso6R4PuSUFv3c9XwoSNBJMa/vFa+TmyenbH98QkWjEH8I7HvH1qX92uuCvThE
         tqXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=ZzBxIAYsh8XqrxCvVV5Do0/Y4Kxwy66yjqOeGnhsd60=;
        b=Fa1mcYk+WOZpug/KS1keUurCSk2dzw+byDLijk+cSS37r7MwRNgaJ8ZBPX2I2X4lpE
         65kN3OT1l18vhf9oFIahWNQDHHLbfzRUv/K5Yl6+6fh3XXwXIcN0gE/a9UN9eK07UoGj
         R1pCZxHQKAa8TUpFK9wyvTVNtxuB7KgZWYVe4b4jIhpOBgyF4Z7Nok+TZMNzBSDoXmMW
         N2I3qN2ti8KqpSs4SOJ3yZazQXY/gfdx1F8DzjWc2Re4EvG4odqhzB1I8yMYUufcJTXY
         apshB5WX7B2V9r/G7advTaKvlwTVr/swTVXw7CspXCVpjjihbMHkcyo2Vpki23nGQnR7
         THtQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.b=E84tVvTc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d189si17047044qkc.170.2017.07.28.01.52.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 28 Jul 2017 01:52:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.b=E84tVvTc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46859 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1db10J-0006yl-AR
	for alex.bennee@linaro.org; Fri, 28 Jul 2017 04:52:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44688)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1db106-0006wR-Ko
	for qemu-arm@nongnu.org; Fri, 28 Jul 2017 04:52:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1db105-0003RF-BH
	for qemu-arm@nongnu.org; Fri, 28 Jul 2017 04:52:02 -0400
Received: from mail-wr0-x22b.google.com ([2a00:1450:400c:c0c::22b]:38363)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1db105-0003Qe-44
	for qemu-arm@nongnu.org; Fri, 28 Jul 2017 04:52:01 -0400
Received: by mail-wr0-x22b.google.com with SMTP id f21so96050955wrf.5
	for <qemu-arm@nongnu.org>; Fri, 28 Jul 2017 01:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=ZzBxIAYsh8XqrxCvVV5Do0/Y4Kxwy66yjqOeGnhsd60=;
	b=E84tVvTcTIAn2ta6L+dyPG76tf1LOI+E19brcXMToWzZW/DSSCG6Tmh3b7Bor+Vrp0
	EtYFcTOjguvYi/zL/xsI5j1clW0kcTdZ8FQAAsS51aUog4e+JYxBUvqjxAAIbSo0ejuD
	nLk1t4K/eOgPlELslBIc03t19ktMN7zS2GkrQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=ZzBxIAYsh8XqrxCvVV5Do0/Y4Kxwy66yjqOeGnhsd60=;
	b=MVicv2C/zARmu8hxpdUqGEAATRXEv4sI2+6Q8wER52Qa5vQCcPpx6/sScpCJDdwObU
	KSQpXYvcrHz5dCMdeK/7szpDOnZSXXGkSiQveAM5rOj1Hi3uFrrwfJA26PKbqAbxnJ9V
	TskWGyOF+D0UrG4o2TWlrB2KTR027kFyQupcxAc6gqByXCHMMJsEQnLzFCEEGiUOzWTG
	0ZoOTZrzcK79wfDw5S9rOcw98s/udBqtmOdqy5UI/utVFPKVAgEUzXELFLyeLRleXL2h
	NBxn+QrObJ+t21yMR4cMkei9SBzA/H0WWybCFac32JaPRDc7Oy+FMPSRH3nTiktArKNX
	xvKA==
X-Gm-Message-State: AIVw112/YtUsZRxw4djXxfzYUc9NA0t8VWQqCJYimM6aWxWuwPnd922u
	2Pbw0v35iRgrCVPPpZ5LCe7FtgItMJB2
X-Received: by 10.223.163.16 with SMTP id c16mr6054661wrb.173.1501231919769;
	Fri, 28 Jul 2017 01:51:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.134.54 with HTTP; Fri, 28 Jul 2017 01:51:39 -0700 (PDT)
In-Reply-To: <7834a272-4106-f076-a62b-9cff45f4ae42@amsat.org>
References: <1501153150-19984-1-git-send-email-peter.maydell@linaro.org>
	<1501153150-19984-3-git-send-email-peter.maydell@linaro.org>
	<7834a272-4106-f076-a62b-9cff45f4ae42@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 28 Jul 2017 09:51:39 +0100
Message-ID: <CAFEAcA8pSnin+c90RAutxckifw1HTpeZ75OUMwC3kBurSpVBjg@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::22b
Subject: Re: [Qemu-arm] [PATCH for-2.10 2/5] target/arm: Don't allow guest
 to make System space executable for M profile
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
	"patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BvD9u/0BRdHQ

On 28 July 2017 at 00:59, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wro=
te:
> Hi Peter,
>
> On 07/27/2017 07:59 AM, Peter Maydell wrote:
>>
>> For an M profile v7PMSA, the system space (0xe0000000 - 0xffffffff) can
>> never be executable, even if the guest tries to set the MPU registers
>> up that way. Enforce this restriction.
>>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>> ---
>>   target/arm/helper.c | 16 +++++++++++++++-
>>   1 file changed, 15 insertions(+), 1 deletion(-)
>>
>> diff --git a/target/arm/helper.c b/target/arm/helper.c
>> index ceef225..169c361 100644
>> --- a/target/arm/helper.c
>> +++ b/target/arm/helper.c
>> @@ -8251,6 +8251,14 @@ static inline bool is_ppb_region(CPUARMState *env=
,
>> uint32_t address)
>>           extract32(address, 20, 12) =3D=3D 0xe00;
>>   }
>>
>
>
> I wonder if these should renamed pmsav7_is_ppb_region() and
> pmsav7_is_system_region().

Yeah, perhaps better; I'm never quite sure how much disambiguation
to put in to file-local function names. Maybe m_is_ppb_region()?
PPB and system region are M profile concepts, not PMSAv7 ones.
That doesn't seem any clearer than where we started though :-(

>> +static inline bool is_system_region(CPUARMState *env, uint32_t address)
>> +{
>> +    /* True if address is in the M profile system region
>> +     * 0xe0000000 - 0xffffffff
>> +     */
>> +    return arm_feature(env, ARM_FEATURE_M) && extract32(address, 29, 3)
>> =3D=3D 0x7;
>> +}
>> +
>>   static bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
>>                                    int access_type, ARMMMUIdx mmu_idx,
>>                                    hwaddr *phys_ptr, int *prot, uint32_t
>> *fsr)
>> @@ -8354,6 +8362,12 @@ static bool get_phys_addr_pmsav7(CPUARMState *env=
,
>> uint32_t address,
>>               get_phys_addr_pmsav7_default(env, mmu_idx, address, prot);
>>           } else { /* a MPU hit! */
>>               uint32_t ap =3D extract32(env->pmsav7.dracr[n], 8, 3);
>
>
> Maybe names access_perms/execute_never are easier to read..

Following existing practice in the LPAE code, we use the
field names that the architecture spec uses.

>> +            uint32_t xn =3D extract32(env->pmsav7.dracr[n], 12, 1);
>> +
>
>
> clear MemManage exceptions:
>
>                *fsr &=3D ~0xff;

>> +            if (is_system_region(env, address)) {
>> +                /* System space is always execute never */
>> +                xn =3D 1;
>
>
>                } else {
>                    xn =3D extract32(env->pmsav7.dracr[n], 12, 1);
>
>> +            }
>>                 if (is_user) { /* User mode AP bit decoding */
>>                   switch (ap) {
>> @@ -8394,7 +8408,7 @@ static bool get_phys_addr_pmsav7(CPUARMState *env,
>> uint32_t address,
>>               }
>>                 /* execute never */
>> -            if (env->pmsav7.dracr[n] & (1 << 12)) {
>> +            if (xn) {
>>                   *prot &=3D ~PAGE_EXEC;
>
>
> and here we now can set eXecuteNever violation:
>
>                     *fsr |=3D R_V7M_CFSR_IACCVIOL_MASK;

No, *fsr is not an M profile CFSR, it's an A/R profile short
descriptor format fault status value (because on R profile
that's what it will be used as, and M profile is using the
same MPU handling code here). We do the conversion in
arm_v7m_cpu_do_interrupt(), where we look at the exception_index
and the exception.fsr to identify what CFSR bits to set.

>>               }
>>           }
>>
>     }
>     *fsr =3D 0x00d; /* Permission fault */
>
> I don't understand this mask, I don't have bit [2] defined in my datashit=
,
> maybe it was expected to turn on exception Entry/Return which I have defi=
ned
> as bits 4 and 3 respectively, so I'd rather see here:
>
>     *fsr |=3D R_V7M_CFSR_MUNSTKERR_MASK | R_V7M_CFSR_MSTKERR_MASK;

See above, *fsr isn't a v7m CFSR.

thanks
-- PMM
