Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id c27sm1792541wrb.44.2017.06.22.06.27.37
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 22 Jun 2017 06:27:37 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 114903E0201;
	Thu, 22 Jun 2017 14:28:23 +0100 (BST)
References: <20170622111845.5296-1-alex.bennee@linaro.org> <CAFEAcA_cUBfzUyCs60e3O9TpqyvXTmkU9Uh25EL1Vy23Lw0fXw@mail.gmail.com>
User-agent: mu4e 0.9.19; emacs 25.2.50.3
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, Andre Przywara <andre.przywara@arm.com>, Christoffer Dall <cdall@linaro.org>
Subject: Re: [PATCH] target/arm/helper: document potential CNTV register bear trap
In-reply-to: <CAFEAcA_cUBfzUyCs60e3O9TpqyvXTmkU9Uh25EL1Vy23Lw0fXw@mail.gmail.com>
Date: Thu, 22 Jun 2017 14:28:23 +0100
Message-ID: <87zid0rw20.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: rYMOX49Q1l4e


Peter Maydell <peter.maydell@linaro.org> writes:

> On 22 June 2017 at 12:18, Alex Bennée <alex.bennee@linaro.org> wrote:
>> The ARM KVM encodings have been inadvertently switched for
>> CNTV_CVAL_EL0/CNTVCT_EL0 in the register API since its introduction.
>> Fortunately this doesn't currently mater as the reset values for both
>> are the same. However if this ever changes things will break in
>> interesting ways.
>
> Augh.
>
>> Migration is currently unaffected as we just use
>> cpu->cpreg_vmstate_indexes/cpreg_vmstate_values verbatim. However this
>> would break if we ever supported migration between KVM and TCG models.
>>
>> For now we just warn future generations who may touch this code.
>>
>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>> Cc: Andre Przywara <andre.przywara@arm.com>
>> Cc: Christoffer Dall <cdall@linaro.org>
>> ---
>>  target/arm/helper.c | 16 ++++++++++++++++
>>  1 file changed, 16 insertions(+)
>>
>> diff --git a/target/arm/helper.c b/target/arm/helper.c
>> index 2594faa9b8..e7a0e39583 100644
>> --- a/target/arm/helper.c
>> +++ b/target/arm/helper.c
>> @@ -211,6 +211,11 @@ static bool raw_accessors_invalid(const ARMCPRegInfo *ri)
>>      return true;
>>  }
>>
>> +/*
>> + * FIXME: the KVM API has switched encodings for
>> + * CNTV_CVAL_EL0/CNTVCT_EL0 which need to be fixed if we want to
>> + * change the reset values or support KVM<->TCG migration.
>> + */
>
> I don't really like just peppering the code with FIXMEs like this.
> How much work would it be to determine what the actual required fix
> is (whether kernel side or QEMU side) and implement it?

We can't fix it kernel side as it is now a feature of the ABI (arguably
the indexes are just unique numbers rather than the register encoding).

While discussing the impact with Christoffer we came to the conclusion
that we are safe at the moment but it may well bite in the future -
hence the FIXME patch. I guess we could fix it up now, I guess one
approach would be:

  Add an ARM_CP_QUIRK flag bit to the affected registers
  Check for ARM_CP_QUIRK in write_list_to_cpustate/write_cpustate_to_list
    if hit lookup the fixup

>
> thanks
> -- PMM


--
Alex Bennée
