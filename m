Received: by 10.25.77.4 with SMTP id a4csp1708292lfb;
        Tue, 14 Mar 2017 09:53:02 -0700 (PDT)
X-Received: by 10.28.170.4 with SMTP id t4mr644061wme.89.1489510382443;
        Tue, 14 Mar 2017 09:53:02 -0700 (PDT)
Return-Path: <peter.maydell@linaro.org>
Received: from mail-wm0-x22b.google.com (mail-wm0-x22b.google.com. [2a00:1450:400c:c09::22b])
        by mx.google.com with ESMTPS id r15si5753131wrr.217.2017.03.14.09.53.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 14 Mar 2017 09:53:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c09::22b as permitted sender) client-ip=2a00:1450:400c:c09::22b;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c09::22b as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: by mail-wm0-x22b.google.com with SMTP id n11so3972249wma.0
        for <alex.bennee@linaro.org>; Tue, 14 Mar 2017 09:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=5ntnyjaSgBYML5SdSl2CRUa7AiH3U6MUsc+qxIsZhCk=;
        b=SRGFr1tApSB511/fcCABSEgTqZh5WN6mEsSXKjr7+871dR1dhD7/mUbbUnRI/C52cP
         ZrB0zxPAybWmK1atvq1YOsFEExQF4oW7LdJ833mJJJFk3tElgm0Ew/S5+YW1+ux4bXzI
         XVWtDKTP2BJ0fOSCZEFwoeQw+QG4C38FaOLNs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=5ntnyjaSgBYML5SdSl2CRUa7AiH3U6MUsc+qxIsZhCk=;
        b=bnR1FJCKKVPVhIS2pCZDn2rTWzmo2Tg76khClJOQQ0scDFEDm52JIOoTRd77Laj9/w
         anmtmB7s/ITGc7M/HXLyqhxheHb/OcPqmbd3swHU/uT631L+H7DZoFpbrgQm496j8Jsn
         ohBMZjFWBKD7n6nVMbu175uurCauHGL6ojebKjT9aHb28imcoFoWvVzzWlFm8MzW6Cgi
         3YI8kqn5mE6ncRBo7g9sEAJIJxEFf+HzExgB7dGRxScRbyvTHwaDhfl3hSO6QdR0u+Lr
         NX65xS2TdR1okR4PxG5L7KLXUzDBHF9byK0LE4Hx0cipT0MElnjUd+3Bc/Ox+MycOyRW
         JmxQ==
X-Gm-Message-State: AFeK/H1VFFH2JSgJr/A/2BmKIrvbTVQEhsICYxvNCM1x+oHjGKm3eraDq/+UroZNl0lvm9qOgLn2wVU+dLvaj0P4qjY=
X-Received: by 10.28.4.10 with SMTP id 10mr16670350wme.142.1489510382189; Tue,
 14 Mar 2017 09:53:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.145.33 with HTTP; Tue, 14 Mar 2017 09:52:41 -0700 (PDT)
In-Reply-To: <87pohjq1lp.fsf@linaro.org>
References: <1488542374-1256-1-git-send-email-peter.maydell@linaro.org> <87pohjq1lp.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 14 Mar 2017 17:52:41 +0100
Message-ID: <CAFEAcA_dwsj=Ck9xOj-ONbLqedwn7ejj5=cPXiiLdS37iB90hA@mail.gmail.com>
Subject: Re: [PATCH for-2.9] hw/misc/imx6_src: Don't crash trying to reset
 missing CPUs
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	"patches@linaro.org" <patches@linaro.org>, Peter Chubb <peter.chubb@nicta.com.au>, 
	Jean-Christophe DUBOIS <jcd@tribudubois.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TUID: NkVAsykwpb2/

On 14 March 2017 at 17:12, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrote:
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
>> Commit 4881658a4b introduced a call to arm_get_cpu_by_id(),
>> and Coverity noticed that we weren't checking that it didn't
>> return NULL (CID 1371652).
>>
>> Normally this won't happen (because all 4 CPUs are expected
>> to exist), but it's possible the user requested fewer CPUs
>> on the command line. Handle this possibility by silently
>> doing nothing, which is the same behaviour as before commit
>> 4881658a4b and also how we handle the other CPU operations
>> (since we ignore the INVALID_PARAM returns from arm_set_cpu_on()
>> and friends).
>>
>> There is a slight behavioural difference to the pre-4881658a4b
>> situation: the "reset this core" bit will remain set rather
>> than not being permitted to be set. The imx6 datasheet is
>> unclear about the behaviour in this odd corner case, so we
>> opt for the simpler code rather than complicated logic to
>> maintain identical behaviour.
>>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>> ---
>> I couldn't actually get this to crash even with -smp 1 with
>> my test image, but we should fix it anyhow.
>>
>>  hw/misc/imx6_src.c | 8 ++++++--
>>  1 file changed, 6 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/misc/imx6_src.c b/hw/misc/imx6_src.c
>> index edbb756..cfb0871 100644
>> --- a/hw/misc/imx6_src.c
>> +++ b/hw/misc/imx6_src.c
>> @@ -143,13 +143,17 @@ static void imx6_defer_clear_reset_bit(int cpuid,
>>                                         unsigned long reset_shift)
>>  {
>>      struct SRCSCRResetInfo *ri;
>> +    CPUState *cpu =3D arm_get_cpu_by_id(cpuid);
>> +
>> +    if (!cpu) {
>> +        return;
>> +    }
>>
>>      ri =3D g_malloc(sizeof(struct SRCSCRResetInfo));
>>      ri->s =3D s;
>>      ri->reset_bit =3D reset_shift;
>>
>> -    async_run_on_cpu(arm_get_cpu_by_id(cpuid), imx6_clear_reset_bit,
>> -                     RUN_ON_CPU_HOST_PTR(ri));
>> +    async_run_on_cpu(cpu, imx6_clear_reset_bit, RUN_ON_CPU_HOST_PTR(ri)=
);
>>  }
>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

Thanks; applied to master.

-- PMM
