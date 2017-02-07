Received: by 10.25.77.65 with SMTP id a62csp2270219lfb;
        Tue, 7 Feb 2017 09:17:52 -0800 (PST)
X-Received: by 10.28.143.204 with SMTP id r195mr13581107wmd.32.1486487872362;
        Tue, 07 Feb 2017 09:17:52 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from mail-wm0-x234.google.com (mail-wm0-x234.google.com. [2a00:1450:400c:c09::234])
        by mx.google.com with ESMTPS id c63si12915167wmf.132.2017.02.07.09.17.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 07 Feb 2017 09:17:52 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c09::234 as permitted sender) client-ip=2a00:1450:400c:c09::234;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c09::234 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: by mail-wm0-x234.google.com with SMTP id r141so160661028wmg.1
        for <alex.bennee@linaro.org>; Tue, 07 Feb 2017 09:17:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=5cBjCyYMmGU1WcwNWDUhfGNkX0iSPRA9zfYZ39bpanE=;
        b=cX48cnFUmfNgr5KvmwNJQooPjgH9e6XpeUI5gTi9FIrKTBT4E40ll+kMwv87yAf4Da
         nnRcJcAJCsX4SQunOsfeCfEOO7HuHp08wQKy2IrEYk5FlvUEJHiBS0NiUcTpmp5WpGVN
         T1iQoOIMmM1EvKQ1CO+hxejmWun+oWd/T4Fxg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=5cBjCyYMmGU1WcwNWDUhfGNkX0iSPRA9zfYZ39bpanE=;
        b=mm0E+iJqaotTevmRLLvx4VJphj6kvMndJ+IdC/kxByKEVjvtE9lmXyU/w+zydV3HsH
         7PkYgfgUS3eV0KdQHvsJARMnZNzvHCUEYZzmw3wkXdftWtxEwmAat9v/9EIbiqa2Iizx
         Ibcj4X6F8pHxaxh/JXeaMVZ+9LAs15kzWMprz/nrmyAjJ80cf8ELBlvIrG7JWstWwwcW
         I1o0eHK9TKYw5l3EGhEn5+2AIldeh9ZOCSREmJoJZFRmsJoo5hBU5zpslC55CdRteJQ7
         gbd6lRcwvHeTgWwhWjS21/vMmEHKxlyeAmEcDOOV0TU08ots8dAOQHIxHK/NhzVUdV1V
         o12Q==
X-Gm-Message-State: AIkVDXImK1HBLuhhwyw1QBlbO1sO/jEIbMfRqFQ1iCbhH6FRQNpEUpymq/PDKgZUx0jHym24PnJbxmyB9GOJQrfjUiI=
X-Received: by 10.223.142.131 with SMTP id q3mr14692475wrb.195.1486487869956;
 Tue, 07 Feb 2017 09:17:49 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.69 with HTTP; Tue, 7 Feb 2017 09:17:29 -0800 (PST)
In-Reply-To: <877f52x7sx.fsf@linaro.org>
References: <20170206153113.27729-1-alex.bennee@linaro.org>
 <20170206153113.27729-21-alex.bennee@linaro.org> <CAFEAcA9YEo2+_9jc4V_aEds_tQV-f5pU+W49zUs1Ls0JOiQTLg@mail.gmail.com>
 <877f52x7sx.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Feb 2017 17:17:29 +0000
Message-ID: <CAFEAcA86k-q+wG2e_tzD_0DcoywBCe39jb0nr1peC0j=1jkSPQ@mail.gmail.com>
Subject: Re: [PATCH v10 20/23] target-arm/powerctl: defer cpu reset work to
 CPU context
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Richard Henderson <rth@twiddle.net>, MTTCG Devel <mttcg@listserver.greensocs.com>, 
	QEMU Developers <qemu-devel@nongnu.org>, =?UTF-8?B?S09OUkFEIEZyw6lkw6lyaWM=?= <fred.konrad@greensocs.com>, 
	Alvise Rigo <a.rigo@virtualopensystems.com>, "Emilio G. Cota" <cota@braap.org>, 
	Pranith Kumar <bobby.prani@gmail.com>, Nikunj A Dadhania <nikunj@linux.vnet.ibm.com>, 
	Mark Burton <mark.burton@greensocs.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Jan Kiszka <jan.kiszka@siemens.com>, Fedorov Sergey <serge.fdrv@gmail.com>, 
	Bamvor Zhang Jian <bamvor.zhangjian@linaro.org>, "open list:ARM" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 4YTfjgpLDWUY

On 7 February 2017 at 16:52, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>> I find this too hard to reason about :-(  We store the current
>> CPU state in not one but two CPU structure fields, and then
>> we check and manipulate it not by doing "take lock; access
>> and update; drop lock" but by doing successive atomic
>> operations on the various different flags. This seems unnecessarily
>> tricky, and the patch doesn't provide any documentation about
>> what's going on and what the constraints are to avoid races.
>
> I was trying to avoid changing the powered_off state to a new variable
> (maybe pcsi_power_state?) because it meant I didn't have to touch the
> kvm code that treated powered_off as a simple bool. However I can unify
> the state into one variable if you wish.

Changing it also makes migration compatibility awkward.
(Speaking of which, your new flag needs a migration subsection
and appropriate needed function to only transfer it if it's set.)

> As for locking do we have a handy per-CPU lock already or would it be
> enough to use the BQL for this? Although that may be problematic as the
> cpu_reset/on can come from two places (the initial realization and the
> runtime switching of power state.)

Nobody's going to put powering CPUs up and down in their critical
path, so I think the BQL would be fine.

>>> -    /* Start the new CPU at the requested address */
>>> -    cpu_set_pc(target_cpu_state, entry);
>>> +    /* To avoid racing with a CPU we are just kicking off we do the
>>> +     * final bit of preparation for the work in the target CPUs
>>> +     * context.
>>> +     */
>>> +    info =3D g_new(struct cpu_on_info, 1);
>>> +    info->entry =3D entry;
>>> +    info->context_id =3D context_id;
>>> +    info->target_el =3D target_el;
>>> +    info->target_aa64 =3D target_aa64;
>>>
>>> -    qemu_cpu_kick(target_cpu_state);
>>> +    async_run_on_cpu(target_cpu_state, arm_set_cpu_on_async_work,
>>> +                     RUN_ON_CPU_HOST_PTR(info));
>>>
>>>      /* We are good to go */
>>>      return QEMU_ARM_POWERCTL_RET_SUCCESS;
>>>  }
>>
>>> @@ -221,8 +284,9 @@ int arm_reset_cpu(uint64_t cpuid)
>>>          return QEMU_ARM_POWERCTL_IS_OFF;
>>>      }
>>>
>>> -    /* Reset the cpu */
>>> -    cpu_reset(target_cpu_state);
>>> +    /* Queue work to run under the target vCPUs context */
>>> +    async_run_on_cpu(target_cpu_state, arm_reset_cpu_async_work,
>>> +                     RUN_ON_CPU_NULL);
>>
>> The imx6 datasheet says that the RST bit in the SCR register
>> is set by the guest to trigger a reset, and then the bit
>> remains set until the reset has finished (at which point it
>> self-clears). At the moment the imx6_src.c code does this:
>>
>>         if (EXTRACT(change_mask, CORE0_RST)) {
>>             arm_reset_cpu(0);
>>             clear_bit(CORE0_RST_SHIFT, &current_value);
>>         }
>>
>> ie it assumes that arm_reset_cpu() is synchronous.
>
> Well for this case the imx6 could queue the "clear_bit" function as
> async work and then it will be correctly reported after the reset has
> occurred.

It could, but as of this patchset it doesn't...

thanks
-- PMM
