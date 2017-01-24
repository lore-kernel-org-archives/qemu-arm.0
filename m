Received: by 10.25.77.65 with SMTP id a62csp1854800lfb;
        Tue, 24 Jan 2017 09:04:42 -0800 (PST)
X-Received: by 10.159.38.229 with SMTP id 92mr18353005uay.102.1485277482088;
        Tue, 24 Jan 2017 09:04:42 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from mail-vk0-x229.google.com (mail-vk0-x229.google.com. [2607:f8b0:400c:c05::229])
        by mx.google.com with ESMTPS id k64si5009251vke.95.2017.01.24.09.04.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Jan 2017 09:04:41 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:400c:c05::229 as permitted sender) client-ip=2607:f8b0:400c:c05::229;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:400c:c05::229 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: by mail-vk0-x229.google.com with SMTP id r136so116232744vke.1
        for <alex.bennee@linaro.org>; Tue, 24 Jan 2017 09:04:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=TCzDPqhGkf3fjmWEBXxaL6KHgX57s7CjnymBF97X+Eg=;
        b=FxWmlVuTwe8BDoLMRokROtkTQXZRKuN9fQXS6RwMcSn84Z6gq1/n/GSFeoKZDuFrgC
         xaIHUur7Oo6S801ID96KREwWu7HtUX3too0LHuOj50FPuKM/Eabom0l78TiQAJ8rBVwt
         6G0lRUDECbqXCkrNTYrCLE2oNzgQ/NH5RCZlA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=TCzDPqhGkf3fjmWEBXxaL6KHgX57s7CjnymBF97X+Eg=;
        b=Sn1oBd59bpY2ISBRFHKzkkQLVjizbOuPm6bp2enoGfNfwq6aCy7M5Nupu+VkG5FV+Q
         bVXgxJDnn2cuyyfey7IyfDVW8brKQn2eiNFALpgfkNdiXkR8X8MwniTnk8utiGO1zAyn
         XRC1SIpxQG32IYjtXayzaBFfQIOt8vUQb8vIk6TcmWpQDf6KtmOV53eMDmrXXbrKX+80
         39QnXhjP1j7JOr02gjO3RfWOgQbggXG8wsyLqkCdTWekEyhLzqo47KUcSQYpxzbFMCYE
         qPjZ3YioVmVXA6ucmxh962GiXNzMDG8HoYwbw7hpUqM/j9TuBrzJpcTXP0Qkfgd0YC7w
         pnkA==
X-Gm-Message-State: AIkVDXIHoW1uMpiFVv0j7zTpi3psrZAH5L4Oyeq1PRMQgqCs176NsGJ1sh4tgHUCeyZuzCnHnyHjOiBjXuHT+p60060=
X-Received: by 10.31.65.74 with SMTP id o71mr13528846vka.3.1485277481569; Tue,
 24 Jan 2017 09:04:41 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.176.14 with HTTP; Tue, 24 Jan 2017 09:04:21 -0800 (PST)
In-Reply-To: <87r33s9yzr.fsf@linaro.org>
References: <1484937883-1068-1-git-send-email-peter.maydell@linaro.org>
 <1484937883-1068-6-git-send-email-peter.maydell@linaro.org> <87r33s9yzr.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 24 Jan 2017 17:04:21 +0000
Message-ID: <CAFEAcA9O+fOeMFvX3tcBVsgbZcrnzDgPz69Kin4gg3fmyJR8wA@mail.gmail.com>
Subject: Re: [Qemu-arm] [PATCH 5/6] armv7m: Fix reads of CONTROL register bit 1
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	Liviu Ionescu <ilg@livius.net>, Michael Davidsaver <mdavidsaver@gmail.com>, 
	"patches@linaro.org" <patches@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TUID: aAZHxmmfAVaM

On 24 January 2017 at 16:58, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>> --- a/target/arm/machine.c
>> +++ b/target/arm/machine.c
>> @@ -96,15 +96,13 @@ static bool m_needed(void *opaque)
>>
>>  static const VMStateDescription vmstate_m =3D {
>>      .name =3D "cpu/m",
>> -    .version_id =3D 1,
>> -    .minimum_version_id =3D 1,
>> +    .version_id =3D 2,
>> +    .minimum_version_id =3D 2,
>>      .needed =3D m_needed,
>>      .fields =3D (VMStateField[]) {
>> -        VMSTATE_UINT32(env.v7m.other_sp, ARMCPU),
>>          VMSTATE_UINT32(env.v7m.vecbase, ARMCPU),
>>          VMSTATE_UINT32(env.v7m.basepri, ARMCPU),
>>          VMSTATE_UINT32(env.v7m.control, ARMCPU),
>> -        VMSTATE_INT32(env.v7m.current_sp, ARMCPU),
>>          VMSTATE_INT32(env.v7m.exception, ARMCPU),
>>          VMSTATE_END_OF_LIST()
>>      }
>
> Not that it matters for this but is there a way to add another level of
> indirection to the reading and writing of these fields to keep the same
> migration format?

It's possible. One approach would be to make the fields
versioned, so that if the source doesn't have them they stay
at whatever the CPU's reset values are. Or you could have
them in a separate vmstate subsection with a needed function
that does something clever. But since we don't claim to
support cross-version migration for M profile yet (and I
suspect also that none of our M profile boards have working
migration in all the devices) I took the easy route of
just bumping the version_id on this subfield. (It doesn't
affect migration compat for anything that's not M profile.)

thanks
-- PMM
