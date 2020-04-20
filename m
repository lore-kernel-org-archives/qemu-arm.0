Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp3687132lfm;
        Mon, 20 Apr 2020 03:49:54 -0700 (PDT)
X-Google-Smtp-Source: APiQypI4vqQxenJUpUinL3pNDLe55AP1b+AaIXtRNxXx+Rq/Du3My8CrEVRwN15eQmluYe5IhuIE
X-Received: by 2002:a50:e107:: with SMTP id h7mr14141931edl.124.1587379794067;
        Mon, 20 Apr 2020 03:49:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587379794; cv=none;
        d=google.com; s=arc-20160816;
        b=YqG7dkUkpbwj2F51hSixhQSnHhl0ueIjlDc8dHtJOIwhcALcLaToGkVUBJqPNLUVHn
         JN51wbROrDBFb1xocPHu3RDQ7kH1p7zOeNVL+zI1ICbTg3QSrYhb/KD5P9gLnnN25SG4
         IzlWx4gsSCBcI4wzKPK08fg0mlmd4A7dI5MglbzqF6ysbt+zEpsLQ9WYu1eRWkYPqLMM
         uEOntJy8WafMsQNw4Jp92qbFpAoYnJBEoiGcjRaOLk/svE222lJaKK8MvOws85GEhS6Y
         c0n0v7gQNtN5ErCSEUgFbiuMbCgYgJJO/F/4Tc/b+z4BRR+fJoNfbYfforUsCSE1pPtP
         Pdug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=g5ZmDAwxxKcEK/Xod0AdLrgpUtUVRDMXm8mgD35N7qE=;
        b=fvIf3F2fSocpJj26GUHvE1RrhW1Ay/eHgg3CPPm2VHftDZX1uoRI8HQt2Kgg87r5+p
         toEzt6P0AeAaVervrMxYA9V2Bl8zxB5oku0z7el2tbA/tdKG6QAJoYhnxOxKFgyiDEUv
         TJtJpHnYnockhEKp15gGYCius7fDlBznSX5BCoy2y4DJtl4MT7rQOr4H+P0zzkRvsl7H
         EyHYT3KMgqOiQ2ShH+hHgfMsMCa92tOxqU6Kf/L0r0VP9iSf7AbmSSMT8xBi7VJsjHs9
         rxwPicZjxhmIxYe2Im3PwVnJE/UHyYHLPEsqtWwR339t5MGwWiEkBY0w4+rWkXZ0vUun
         rdyQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Vyo/LQ9X";
       spf=pass (google.com: domain of philmd@redhat.com designates 207.211.31.120 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id y5si362952edm.492.2020.04.20.03.49.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 20 Apr 2020 03:49:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 207.211.31.120 as permitted sender) client-ip=207.211.31.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Vyo/LQ9X";
       spf=pass (google.com: domain of philmd@redhat.com designates 207.211.31.120 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1587379793;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g5ZmDAwxxKcEK/Xod0AdLrgpUtUVRDMXm8mgD35N7qE=;
	b=Vyo/LQ9XSa+guODnjtsqiml7C2EWOHMb7yepYDJfVxmZ7vY0wGRFHcKaqg3qxkwPCEyWqk
	QG6EJ0hJkpNenik8/k5FrfokqBjt9vVmfOw+t1Xy53Fn94vsHI+xjfOHRO/btf89YOnxVo
	cZj2VrfurJQYRdYKcAl7DeKUCjaKSKw=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-17-RU6prcF_OECG510XGAsVew-1; Mon, 20 Apr 2020 06:49:50 -0400
X-MC-Unique: RU6prcF_OECG510XGAsVew-1
Received: by mail-ej1-f69.google.com with SMTP id j19so6143082ejs.1
        for <alex.bennee@linaro.org>; Mon, 20 Apr 2020 03:49:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=rtRzTRehi0O6bAYAyvwFPzRkMeZJfRli4FPebqPOExY=;
        b=CuA2i9ZDN4SQBNBDkfvjhaW/ajcy+M580Dt8BEDxHZsNA+VlNw0V+w9UPlyxsC4/rz
         YioH/0wW6xHWdtdoqHQAVLMnvPAXVft4Q16TQca4mEj6jGk+oqYO9ObDMZY9fFLwC4r9
         Mvq2c7D9x3gv+tuuiD10c4/xqqyJTs5Up9HlVOaGa4J3M931qXxq7cUiEgNCcqxL7kPm
         uudjQiMtA2gcC/FPDMDcZowMe3/7ce+5xCAAi6fnJ1hRF69YyisY/B/KROuVV2JM7OM+
         5cZQQa6vtMWy3fEQ5DmJ+Rj8KC333oUnx9J9/ZBnyB+BWJTv7N/hoZBSYI+s5b9uQEO2
         WDnA==
X-Gm-Message-State: AGi0PubkUrkC1qV+tSQ4QjUoWHMYMuKDda+0Nr3HHTHe3NfCf3+YhvTM
	6W9sS4U4qHLdS76PGYPCcW71g5JpIwwe/uiTP8yk18tlzN2u0P2EhoGeGNJILKyDyq1HUPZn8J6
	pj3TxoPfEn5pYsK6A
X-Received: by 2002:a50:d942:: with SMTP id u2mr13893156edj.116.1587379789757;
        Mon, 20 Apr 2020 03:49:49 -0700 (PDT)
X-Received: by 2002:a50:d942:: with SMTP id u2mr13893142edj.116.1587379789573;
        Mon, 20 Apr 2020 03:49:49 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.39] (116.red-83-42-57.dynamicip.rima-tde.net. [83.42.57.116])
        by smtp.gmail.com with ESMTPSA id gh8sm108359ejb.32.2020.04.20.03.49.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2020 03:49:49 -0700 (PDT)
Subject: Re: [PATCH v3 05/19] target/arm: Restrict Virtualization Host
 Extensions instructions to TCG
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 kvm@vger.kernel.org, Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Fam Zheng <fam@euphon.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20200316160634.3386-1-philmd@redhat.com>
 <20200316160634.3386-6-philmd@redhat.com>
 <9cff4a7a-e404-fcc4-eb04-fdbc48ceb7c2@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <ad90c620-8594-aac8-75f6-da342861211c@redhat.com>
Date: Mon, 20 Apr 2020 12:49:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <9cff4a7a-e404-fcc4-eb04-fdbc48ceb7c2@linaro.org>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TUID: fukSRRBlorkZ

On 3/16/20 9:17 PM, Richard Henderson wrote:
> On 3/16/20 9:06 AM, Philippe Mathieu-Daud=C3=A9 wrote:
>> Under KVM the ARMv8.1-VHE instruction will trap.
>>
>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>> ---
>>   target/arm/helper.c | 22 ++++++++++++----------
>>   1 file changed, 12 insertions(+), 10 deletions(-)
>=20
> What happened to the uses of these functions?

Sincerely I don't remember... I got this branch working again without=20
this patch, so I'll just drop it.

>=20
> r~
>=20
>>
>> diff --git a/target/arm/helper.c b/target/arm/helper.c
>> index a5280c091b..ce6778283d 100644
>> --- a/target/arm/helper.c
>> +++ b/target/arm/helper.c
>> @@ -2897,16 +2897,6 @@ static void gt_virt_ctl_write(CPUARMState *env, c=
onst ARMCPRegInfo *ri,
>>       gt_ctl_write(env, ri, GTIMER_VIRT, value);
>>   }
>>  =20
>> -static void gt_cntvoff_write(CPUARMState *env, const ARMCPRegInfo *ri,
>> -                              uint64_t value)
>> -{
>> -    ARMCPU *cpu =3D env_archcpu(env);
>> -
>> -    trace_arm_gt_cntvoff_write(value);
>> -    raw_write(env, ri, value);
>> -    gt_recalc_timer(cpu, GTIMER_VIRT);
>> -}
>> -
>>   static uint64_t gt_virt_redir_cval_read(CPUARMState *env,
>>                                           const ARMCPRegInfo *ri)
>>   {
>> @@ -2949,6 +2939,17 @@ static void gt_virt_redir_ctl_write(CPUARMState *=
env, const ARMCPRegInfo *ri,
>>       gt_ctl_write(env, ri, timeridx, value);
>>   }
>>  =20
>> +#if !defined(CONFIG_USER_ONLY) && defined(CONFIG_TCG)
>> +static void gt_cntvoff_write(CPUARMState *env, const ARMCPRegInfo *ri,
>> +                              uint64_t value)
>> +{
>> +    ARMCPU *cpu =3D env_archcpu(env);
>> +
>> +    trace_arm_gt_cntvoff_write(value);
>> +    raw_write(env, ri, value);
>> +    gt_recalc_timer(cpu, GTIMER_VIRT);
>> +}
>> +
>>   static void gt_hyp_timer_reset(CPUARMState *env, const ARMCPRegInfo *r=
i)
>>   {
>>       gt_timer_reset(env, ri, GTIMER_HYP);
>> @@ -2976,6 +2977,7 @@ static void gt_hyp_ctl_write(CPUARMState *env, con=
st ARMCPRegInfo *ri,
>>   {
>>       gt_ctl_write(env, ri, GTIMER_HYP, value);
>>   }
>> +#endif /* !CONFIG_USER_ONLY && CONFIG_TCG */
>>  =20
>>   static void gt_sec_timer_reset(CPUARMState *env, const ARMCPRegInfo *r=
i)
>>   {
>>
>=20
