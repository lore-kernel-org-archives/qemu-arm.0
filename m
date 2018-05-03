Received: by 10.28.4.212 with SMTP id 203csp1726212wme;
        Thu, 3 May 2018 03:26:39 -0700 (PDT)
X-Received: by 2002:aca:bb88:: with SMTP id l130-v6mr11108719oif.5.1525343199867;
        Thu, 03 May 2018 03:26:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525343199; cv=none;
        d=google.com; s=arc-20160816;
        b=pskwJsEwLphl72VH/GhsoTMS6tSWy8tdlOh0iXgw0UrSema2L651Q4/ZxOhvdiMX6H
         /t7bFFSe6OQyylEbSJO7PJUQxp8wMuVgZ6fXY4PxzSnVCXQt9WzBrvn8jCa4GnvYDfOM
         RKCB2E2dMh5BBS5E82bT7mwGWeEumorQ4BR+C+vUIekUpGnr/+ojwt2shBNpa5bWLOHN
         giJSj/mXK13bxwPQ70FzXnwyeILwPjTeEIqY0aMprTdEjITP/2I8AE+7jwtX2jObfu1F
         Ov7rHlY9DUYJMccN+j9gLbYrW2XQjgBKtBUws1oSaYJBhCey9a2V0rjugJzF59AufzRq
         /plQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=udeMujCESDo/f6N8tEj2Z9aleoM+P4e9WBCBYPHUGss=;
        b=oLEVghxgZgMkvX7cd8t2QbUY5l5YV0SO67roUIFQiffwufAdQngw/RGZtGF426dG5D
         cUjTH+wbj7avfvb/NAwhmp1bLXMygtUrXZlmovWR8Js/s1w/vZM4w7lKw1gWv0LjM/vv
         90h3NuKVgv34ic6+D22fgrBaSBraMtrRRayos7WIU73QY5S5g5ddUwTyeO65W1FYc3tA
         2DLAd5omamHNMNfDPJWy8zH9a0twyjEvDkRVmXxkAzKU+xt/EISnayOCo94SDKBQWlvz
         uaD8G564+OEef5vJ57tJWUY//sRqo1PIDv74fRTz+AehtqwtnyhqibsbqFGvI7fuvKFl
         HDwg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HeMxmhMv;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id e34-v6sor6758497ote.7.2018.05.03.03.26.39
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 03 May 2018 03:26:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HeMxmhMv;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=udeMujCESDo/f6N8tEj2Z9aleoM+P4e9WBCBYPHUGss=;
        b=HeMxmhMvLzbgegKwPfybr+P9oxD14wvP1xqxVTdg8WDr8rB5n6/AUkMiw7MlEiJel+
         9L+os4/4gHml2Vs6t4uV0kG1TH5ESwRA5JWmKEbErKIIk1ZQRBdk24ToNz5DEVwZUS6+
         d0Qz5c3v+Zh4u0+ejilAjbStZyK8Qdf5HNrMU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=udeMujCESDo/f6N8tEj2Z9aleoM+P4e9WBCBYPHUGss=;
        b=pF7EpkSHWYekQ9xZaakOxRpTUUV3/dGruLWgN2kUQT6V2T/0wVaBH5sLB2zQ5QVWTQ
         sAh+iKrVwHwcULaXdJ4ootlyFI0G5xp64gbzxaJz2NpkOkxBopvmACTRGw/SdR9pRBEn
         NOJgtx4ZS4d0A1VpfBzniA9y2qnl3ba9naeD1IJ6TGcU1RbLt4mTuVwqOyIHE1wU7PkC
         mw21yl8T8pzOZOHFugOedYJBuTTLJbFpSezmfqdJcJmpS7Lrcobw+hIhzs9NvkddCgKD
         VtQzHrvXqDFNtaOdCLvttvFNkRumJygs7wPEr5fzfTjN8fIjCMwoYH5jSYaXyeSSDWub
         ubMg==
X-Gm-Message-State: ALQs6tDDH5WGomlMUb4sRV/hFsdHkKy+wE4BxwLlgEaJ8E3yYvwOyT6S
	16EpeDQbSTTrGDerKQjQDRXZukHOZckY7bbbDPaduFTvnK0=
X-Google-Smtp-Source: AB8JxZq/k6mmbCRK8XyJss3TkoiRUauB6QhBRaKhHywLqZxZpAVRtZODGBwTcmyt3CtoxlLDpxrBKuURn+w3QnIdPPk=
X-Received: by 2002:a9d:5014:: with SMTP id a20-v6mr15120258oth.205.1525343199349;
 Thu, 03 May 2018 03:26:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40fb:0:0:0:0:0 with HTTP; Thu, 3 May 2018 03:26:18 -0700 (PDT)
In-Reply-To: <874ljp9h2z.fsf@linaro.org>
References: <1524153386-3550-1-git-send-email-abdallah.bouassida@lauterbach.com>
 <1524153386-3550-4-git-send-email-abdallah.bouassida@lauterbach.com> <874ljp9h2z.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 May 2018 11:26:18 +0100
Message-ID: <CAFEAcA8QoZdiCxRic9Ztekyi-e5hGwUSPUrbUmW_d2B9vJgYEg@mail.gmail.com>
Subject: Re: [PATCH v6 3/3] target/arm: Add the XML dynamic generation
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Abdallah Bouassida <abdallah.bouassida@lauterbach.com>, 
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	Khaled Jmal <khaled.jmal@lauterbach.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: ACdZs9A38sBd

On 3 May 2018 at 11:19, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrote:
>
> Abdallah Bouassida <abdallah.bouassida@lauterbach.com> writes:
>
>> Generate an XML description for the cp-regs.
>> Register these regs with the gdb_register_coprocessor().
>> Add arm_gdb_get_sysreg() to use it as a callback to read those regs.
>> Add a dummy arm_gdb_set_sysreg().
>>
>> Signed-off-by: Abdallah Bouassida <abdallah.bouassida@lauterbach.com>
>> ---
>>  gdbstub.c            | 10 +++++++
>>  include/qom/cpu.h    |  5 +++-
>>  target/arm/cpu.c     |  1 +
>>  target/arm/cpu.h     | 26 ++++++++++++++++++
>>  target/arm/gdbstub.c | 76 +++++++++++++++++++++++++++++++++++++++++++++=
+++++++
>>  target/arm/helper.c  | 26 ++++++++++++++++++
>>  6 files changed, 143 insertions(+), 1 deletion(-)
>>
>> diff --git a/gdbstub.c b/gdbstub.c
>> index a76b2fa..4b56a43 100644
>> --- a/gdbstub.c
>> +++ b/gdbstub.c
>> @@ -674,6 +674,16 @@ static const char *get_feature_xml(const char *p, c=
onst char **newp,
>>          }
>>          return target_xml;
>>      }
>> +    if (cc->gdb_get_dynamic_xml) {
>> +        CPUState *cpu =3D first_cpu;
>> +        char *xmlname =3D g_strndup(p, len);
>> +        const char *xml =3D cc->gdb_get_dynamic_xml(cpu, xmlname);
>
> Last time I asked:
>
> "although I'm confused as to why you need to g_strdup the string. You
> already have p and its not like gdb_get_dynamic_xml couldn't dup the
> string if it needed to (which it doesn't seem to)."

...and the answer is still the same: p is not NUL terminated.

thanks
-- PMM
