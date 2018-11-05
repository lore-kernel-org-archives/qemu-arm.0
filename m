Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp2782374wro;
        Mon, 5 Nov 2018 08:26:14 -0800 (PST)
X-Received: by 2002:a9d:60c2:: with SMTP id b2mr12567482otk.157.1541435174373;
        Mon, 05 Nov 2018 08:26:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541435174; cv=none;
        d=google.com; s=arc-20160816;
        b=hxslt3vLad8Ap1LYh/1Y/gRyd39wJYIwo9sXwFapB5KXGvkpplQaYjFxxQ9BrghdZW
         mTOwUvptPW+4eYtNO7+TxzCh8OnKjzYA4txePmY0BmD+JKQ1awJ7XO7mMGfrP4jB2KPX
         sA36G2OXeMl32VFxKYcr9F6yuQR/GQCT9vShnMxIAr+LlMwla7sc2nnuTBDFKeEgeXcf
         3bHFW6xgS4kd3t/1Ib2UyBttQfrkl+Bm9IYdJ0tuBLFUDvIBGF7hXRo7QFYjnca0+eC2
         SD8WFejF30swSMcWrK6vyx8Xfd6Gb1dhAs0D//Cf1+YEcN+QXCnNlzIPpmixTLCp/WI6
         9xrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature;
        bh=RzVRci/AsLDDNNQqfzXORYUqW8jOEkkxiJH6fFIp1Hk=;
        b=NqHDKuZoGplztbi7wCCoYRMmvHZKHc1EEagfhfUau8NHZVhyJe1zj2n7EQRSOK32BF
         nCRDcUsYOf4jpWzDFcgOyO1yQyULogz8OHF18FHIX3AgiMaHSokgqkSyGtq1b+AkQMN5
         45QtrWd2C9iBb+WrQ8CVNPQ37pZ5LK46U65732jTxehfi19MT5eh0GwUV2/xfkJevQKX
         G2ij1NH59e4QShK+caKK8cC7TbZf+ZRdWG1SJBhfBcgFM586USzZKplL043cg3pLw7/c
         AMNK2mQgR963TGUyMtXqq0Tz6NnVX090CsNSnaDy+wXgCtPp9Q0UdPltKRJ2FJJH07cU
         2bHQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fYMUqdeu;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id r132-v6sor6296466oih.58.2018.11.05.08.26.14
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 05 Nov 2018 08:26:14 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fYMUqdeu;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=RzVRci/AsLDDNNQqfzXORYUqW8jOEkkxiJH6fFIp1Hk=;
        b=fYMUqdeum8uzps4nW/3kcgXY75WL6n9cP2i/6FGuTpSFzTndVO8vLpKrBe/jVpFbm9
         1wz+PXn/URVG3TPYEfKXdmDqDnxkKluG5TKOjGrbYniqn45bUTdADsChW165HqKcSM+p
         ysmqQnRCBSrTFMee1XkfYcitosk7P+CnsDJzE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=RzVRci/AsLDDNNQqfzXORYUqW8jOEkkxiJH6fFIp1Hk=;
        b=JcHt7TVYiEHOmrKO5FRtPeg52fj8WEtSl3VwciwXBZtW5tB07wQnkU4rzBH21AmEvU
         lGgvdebBikX4wJy0QEpoIuB7SrnEAUPuHLMHeiYSthi3nwcP2HbxVl2XyYx23VNofS0H
         /o//7CDvOuWNcCnFM4HVUzEvfRsvIAw1SEfqbBexXGfbjDpj85NiSgivI86ssEeyHIkN
         UYGjb6xf8nslJhWNi9tVlQNrc+4d9VzAfm0r7aBRN8ryQyYpGpT94AYAPgNlTyje9yET
         +UIikwIIbx04qd5G9N3idm6tvO4JkGIGGUWeUcdEnY6s2r+ncvP6JNVXfgPSvzqfE17b
         Jwpg==
X-Gm-Message-State: AGRZ1gJyB+osz+iMTaYWlHGquz6LXk3LaxRUGebJB6w10LiwL/z/3dvD
	Qk+myEDDNpeQqHeDbe4BZLP30NTcmUoRgD4VtkoqH1b5Lm3vQw==
X-Google-Smtp-Source: AJdET5d9oe5GQ25AE9+FVcwhfHZ0GdJ8/+oJko/+cfQx0cdKs+fI/+pg1+6DgoV2fDV28yeGFOl3dHDr4JG/LtQPCQE=
X-Received: by 2002:aca:1c6:: with SMTP id 189-v6mr13915268oib.325.1541435173700;
 Mon, 05 Nov 2018 08:26:13 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a9d:4b0e:0:0:0:0:0 with HTTP; Mon, 5 Nov 2018 08:25:53 -0800 (PST)
In-Reply-To: <87tvkvebmd.fsf@linaro.org>
References: <20181016093703.10637-1-peter.maydell@linaro.org>
 <20181016093703.10637-2-peter.maydell@linaro.org> <87tvkvebmd.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 5 Nov 2018 16:25:53 +0000
Message-ID: <CAFEAcA8tPHFHFHeB5ty2x6GGgTs6aQG3ckD6NkzOR7OgAX-f9Q@mail.gmail.com>
Subject: Re: [Qemu-arm] [PATCH 1/2] target/arm: Set S and PTW in 64-bit PAR format
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	"patches@linaro.org" <patches@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: A0n78Gekwmq8

On 5 November 2018 at 16:24, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
>> In do_ats_write() we construct a PAR value based on the result
>> of the translation.  A comment says "S2WLK and FSTAGE are always
>> zero, because we don't implement virtualization".
>> Since we do in fact now implement virtualization, add the missing
>> code that sets these bits based on the reported ARMMMUFaultInfo.
>>
>> (These bits are named PTW and S in ARMv8, so we follow that
>> convention in the new comments in this patch.)
>>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>> ---
>>  target/arm/helper.c | 10 ++++++----
>>  1 file changed, 6 insertions(+), 4 deletions(-)
>>
>> diff --git a/target/arm/helper.c b/target/arm/helper.c
>> index 43afdd082e1..dc849b09893 100644
>> --- a/target/arm/helper.c
>> +++ b/target/arm/helper.c
>> @@ -2344,10 +2344,12 @@ static uint64_t do_ats_write(CPUARMState *env, u=
int64_t value,
>>
>>              par64 |=3D 1; /* F */
>
> To aid readability, mainly for those not familiar like me, maybe:
>
>   par64 |=3D 1; /* PAR_EL1.F =3D=3D 1, failed translation */

That's in the existing code...

>>              par64 |=3D (fsr & 0x3f) << 1; /* FS */
>> -            /* Note that S2WLK and FSTAGE are always zero, because we d=
on't
>> -             * implement virtualization and therefore there can't be a =
stage 2
>> -             * fault.
>> -             */
>> +            if (fi.stage2) {
>> +                par64 |=3D (1 << 9); /* S */
>> +            }
>> +            if (fi.s1ptw) {
>> +                par64 |=3D (1 << 8); /* PTW */
>> +            }
>>          }
>>      } else {
>>          /* fsr is a DFSR/IFSR value for the short descriptor
>
> Anyway:
>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

thanks
-- PMM
