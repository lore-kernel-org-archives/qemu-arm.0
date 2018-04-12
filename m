Received: by 10.28.71.155 with SMTP id m27csp1708203wmi;
        Thu, 12 Apr 2018 02:55:45 -0700 (PDT)
X-Received: by 2002:aca:1704:: with SMTP id j4-v6mr5371675oii.173.1523526945746;
        Thu, 12 Apr 2018 02:55:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523526945; cv=none;
        d=google.com; s=arc-20160816;
        b=KGfToegaduvpGDqB5CNWWovOhRcyCsZJvmody+euOufle7kRpGcp4OApztQaRqFKZq
         Wkv5XxEf0UPLToUZEQZeSKs39BbrzIOEgl5PB60S/OXcLJbUViZh5pqZu8kNDMqYxNC6
         uZAnZ8beZyn/4d8cfxAwViY+0rpjG0+h8cPtLuOG5y7Jqu3YMUCzV8xns/krk0/Lepbg
         pMselN8MYQoJn+G67qOZ63gV9fbkHojEVtlSMQkDrdWa6bKVFZISt09No8WRfLCSfane
         Z2+6GCVfwOJxjNV39SfWkRZqrPTFRZmfYyT2+m3v+v4lqaPL1k1RADOti3IztP2mLwAe
         TgRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=ehpNl4PUuIrUySk087Hp7sd7sW8e74oiQAsEWADcsw0=;
        b=GmDeEpWIMYtD12RhSbFGfdzNczuYAonchgNb+dlg6Sd0cgEaeWOBm+bY5GQetBDK3t
         XqeFpK2k96Oe6A6ABQUzsJbmkDZDdhioWbfZ02o8FrBa11/HIwtQbQSQWrufn5Haqj/b
         4YgE9b4OjpdWh5dAO1NAPTyA4oOwC/x/R8WadviuYccnP0OGVAyj+B60IhEwGv7XCU1V
         53cSVY72fOKKlLxsM/8L0ZT1pZq6FjR4srlOHOiNTN9fbuo+UBZZnI/Y8nSH16fWqzbn
         hJUMZVoKHJlVXydPyNSnQQq6lcxFm+Rm/G6HtnHyRmZfEMfG3MGz5XF3Eok3o+uSkXGK
         5IWA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Q+WyeBiK;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id p41-v6sor1325878oth.77.2018.04.12.02.55.45
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 12 Apr 2018 02:55:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Q+WyeBiK;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ehpNl4PUuIrUySk087Hp7sd7sW8e74oiQAsEWADcsw0=;
        b=Q+WyeBiKzZrecySyywHvAbyam2Vi8mTn5xgsjGmmF/03xLEvm/Lesej4GCh8kkMIAl
         yQD1vDawIEiwvFWs9yaWAaGuf4FxvXd4aq06UCBIGu3a3mfuETaWVmlm2TVouI9W77GD
         HNglsdDM1xrqUbWlig2poBtrQBctnlj2n02UE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ehpNl4PUuIrUySk087Hp7sd7sW8e74oiQAsEWADcsw0=;
        b=EE/eUYkFWNBRP8lVNodI/kXg8npUbKcwAiLCM/FAymDtHN3ZRG/lFs9h/IkSOiAAPs
         v8bLHPQ8txVPXkrxRWgITioK47FU5wzSx7RmqbxCWrorijCBKZbB1OM0Eyt3S65IxIa1
         SCphoOcNi5NinvHu/dyx4OfwfRHjmnGzfo/mZpum/enpTqj2cOadHJaQlx9J8hAdC6b7
         6uWW4xgrmplzHAk8CmEG8r1mCUi/CYHRVEgdKogchr9fPVw3p7xERXopnpoXetVu1jYD
         pDMbsab3HTLW0XEHY3wmO7r+Zqyd9skMYuvroWT1mWAndzZTyTkhYEwFlCG6fKUp49s1
         tZEQ==
X-Gm-Message-State: ALQs6tD7vyu1rM8rqNVFsZW6ed0t+KCG7LsxTzpnW3RYivtrQxJ3VTAE
	2e9MhbVbCR35lSHvttJYIpG3bG6B8uEFZ6WmJ8YgeMh/JqI=
X-Google-Smtp-Source: AIpwx4/qu/o/0VXMGUKXnuJRQ9hJSIUcpsRW6/skALtJTVtjqSRDrL2u0lcmitBoxfDr+UrWv7w7u7oN6zGZD59Uq7Q=
X-Received: by 2002:a9d:285d:: with SMTP id h29-v6mr124457otd.205.1523526945312;
 Thu, 12 Apr 2018 02:55:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:2286:0:0:0:0:0 with HTTP; Thu, 12 Apr 2018 02:55:24
 -0700 (PDT)
In-Reply-To: <87h8orcg3a.fsf@linaro.org>
References: <1521034084-17344-1-git-send-email-abdallah.bouassida@lauterbach.com>
 <1521034084-17344-4-git-send-email-abdallah.bouassida@lauterbach.com> <87h8orcg3a.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Apr 2018 10:55:24 +0100
Message-ID: <CAFEAcA-VyVH+6bbtsDcm5idR-hVD7dVaBvpdqA-0qBQ8k9-uxQ@mail.gmail.com>
Subject: Re: [Qemu-arm] [PATCH v5 3/3] target/arm: Add the XML dynamic generation
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Abdallah Bouassida <abdallah.bouassida@lauterbach.com>, 
	QEMU Developers <qemu-devel@nongnu.org>, Khaled Jmal <khaled.jmal@lauterbach.com>, 
	qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: DML5zo/3M9mW

On 4 April 2018 at 13:26, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrote:
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
>>  gdbstub.c            | 10 ++++++++
>>  include/qom/cpu.h    |  5 +++-
>>  target/arm/cpu.c     |  1 +
>>  target/arm/cpu.h     | 26 +++++++++++++++++++
>>  target/arm/gdbstub.c | 71 +++++++++++++++++++++++++++++++++++++++++++++=
+++++++
>>  target/arm/helper.c  | 27 ++++++++++++++++++++
>>  6 files changed, 139 insertions(+), 1 deletion(-)
>>
>> diff --git a/gdbstub.c b/gdbstub.c
>> index f1d5148..09065bc 100644
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
>> +
>> +        free(xmlname);
>
> g_free for a g_strndup'ed string please - although I'm confused as to
> why you need to g_strdup the string. You already have p and its not like
> gdb_get_dynamic_xml couldn't dup the string if it needed to (which it
> doesn't seem to).

This is strndup, not strdup. p is not a NUL-terminated string,
so we're creating one to hand to the hook function rather than
requiring it to deal with a non-terminated string.

thanks
-- PMM
