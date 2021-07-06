Received: by 2002:ac2:5485:0:0:0:0:0 with SMTP id t5csp2129625lfk;
        Tue, 6 Jul 2021 05:48:00 -0700 (PDT)
X-Received: by 2002:a05:6000:256:: with SMTP id m22mr18331444wrz.307.1625575680156;
        Tue, 06 Jul 2021 05:48:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1625575680; cv=none;
        d=google.com; s=arc-20160816;
        b=i8qAjuZKIJFvA3PKiRrN/MtGfrXUxfAT8S9HBQWaok6w2qx8AGMitB0HqCffzf+127
         kq/pyGWjkdc6sfe7fvpHBE0EMUVpz0Ap9Z4madmeYt/AFLf+Jchwirj5tbKCV8ymgEyz
         mTRUuIhQdo9jw/lSG/ICNipUp49sQIYIEfmw5NJuoDzRY9K1KrVA860N4l38/SIlsqKO
         oZqApttRT84ulC2/W9960qGfG6fkosINIXXtyfPqkBNNkZDH0l5fd27puwB5gbn3aIx/
         HQsR6oflr29kgHoRuCWRk9OVnug6cagZOUPIJUce0M7/HqIVXsoyJ6p7AY0FDz/jPvb8
         6Ofg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:sender
         :dkim-signature;
        bh=NEhc5WhDYlEEKVlhSzUmANOUr6OiHh9Mh0E8nMqQW6U=;
        b=bmdQqvYEyKAw4o93XDxTgd6hEk3SF/DrVw0rUsLiPfB+yHLt70AVeGPrZjgfO1VoSt
         k/+rZz2S8ht9tiXR5lMhsepZuC1gXo0A32k5TU0aoAbuhS/4wHoYGeX6QIF+f2alLnuB
         nH0psB3gRc9U6wKHTcndPsV+9JfPuA0I41q+c1r65Yrpz4jtJboDoVixlggC4o1+qFBP
         ZYayapInPDLajzyYhC8yB9qRWwiwpQI5D/Lu0maTHUVK3IbQytjIy988wTC6RjqiXNlA
         WvxmfnWZOTPw8ZhPs1c/WgVkg4D57KMFq+X8sLQEmvgNK56QWkuNK1uft65qilHmLnoe
         mrXA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=qBJ5s8dB;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id b67sor7484356wmb.16.2021.07.06.05.47.59
        (Google Transport Security);
        Tue, 06 Jul 2021 05:48:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=qBJ5s8dB;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=NEhc5WhDYlEEKVlhSzUmANOUr6OiHh9Mh0E8nMqQW6U=;
        b=qBJ5s8dBix/ei+6rR/Fi/5PkDB8J6MDTafEpTEMru3KoB8fgdZCPWUxonYyjrp+Ijc
         yGW6wY6y29XYuPmJOTojJv8yUi85vHDhz2gZx5oUJiVMiTW2Z3ofL9jAfXryhIGXQEy6
         T3dMHNwoW9KepwkcpxmYAP1QOt9o+0wabXHifHtV6MBR0R/vYTQsCF6Q8kwwhHoX4nO+
         FInEh6+8wCTr/oy7N95L2/Ug/PpLdR9WtCu0mFtSqxcfwn4ZqvWg1Ggw5YFb0yFw8c5h
         LKvzFYVS9TDA3Oho23Fwyq6yvN0X8AX3eHc0mPgnh/ImCyIgjGggGgn0BVrhjxtb0pu0
         u+xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=NEhc5WhDYlEEKVlhSzUmANOUr6OiHh9Mh0E8nMqQW6U=;
        b=qF4lIMJBBrsmU5R68RzSM+KOJKFkThU29G7iMPw5CS83WyqK6iv7+xeDfRektqznD8
         MlvfnCPbhmxttkBXDOVHgrmqlda6PiRDowNtR12BHcYtoje0wcQgkI676Wr3eeBETghm
         bEoQufQqwTVDAOTgmBIATme4NjTyp4KyP/blVaK6Ia+PmdJOipMvHH5hkZiXbOlP5lpP
         AdygRvRlfAPaqscLt4dbo/jYzKSDRbmqadZSs/OVtnpBD2LdBoxTTtQxBg23MqOjvuvh
         xB/inl7RAshzxgL7uyERDYmZyb3QM5MKumfPnALoHt5Mf4XCwFSdsBGxXGpYZkzr9FFd
         lmFw==
X-Gm-Message-State: AOAM5336EKB3JUon/C9teaZaUHTcIJVwiaWnhBkjDg/q3VnmPn5evqPR
	7JyAnZM6gjRPNnwV++yz/b4=
X-Google-Smtp-Source: ABdhPJzA7h0Ajc7fujgjB/Xv1LlickoIHZuPkeEk8lL+ygfFTP6GlWEZlOHZ24Au2tMaRm7f2Lw/QA==
X-Received: by 2002:a05:600c:b48:: with SMTP id k8mr507814wmr.180.1625575679578;
        Tue, 06 Jul 2021 05:47:59 -0700 (PDT)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
        by smtp.gmail.com with ESMTPSA id h21sm14983105wmq.38.2021.07.06.05.47.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jul 2021 05:47:58 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH v1 1/5] meson: Introduce target-specific Kconfig
To: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>, David Hildenbrand <david@redhat.com>,
 Bin Meng <bin.meng@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Laurent Vivier <laurent@vivier.eu>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>, Marek Vasut <marex@denx.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 "open list:PowerPC TCG CPUs" <qemu-ppc@nongnu.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz
 <groug@kaod.org>, "open list:S390 general arch..." <qemu-s390x@nongnu.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 Michael Rolnik <mrolnik@gmail.com>, Stafford Horne <shorne@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Chris Wulff <crwulff@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 pbonzini@redhat.com, Aurelien Jarno <aurelien@aurel32.net>
References: <20210621152120.4465-1-alex.bennee@linaro.org>
 <20210621152120.4465-2-alex.bennee@linaro.org>
 <c3d33a80-b3bb-5aa5-50c7-7c1a379814ba@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <8d018805-8e1f-4c1e-b1a4-45a34c8d2e63@amsat.org>
Date: Tue, 6 Jul 2021 14:47:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <c3d33a80-b3bb-5aa5-50c7-7c1a379814ba@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: 54CkiBnCsEEj

On 7/6/21 12:52 PM, Thomas Huth wrote:
> On 21/06/2021 17.21, Alex Bennée wrote:
>> From: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>
>> Add a target-specific Kconfig. We need the definitions in Kconfig so
>> the minikconf tool can verify they exit. However CONFIG_FOO is only
> 
> s/exit/exist/ ?
> 
>> enabled for target foo via the meson.build rules.
>>
>> Two architecture have a particularity, ARM and MIPS:
>> their 64-bit version include the 32-bit subset.
> 
> Why do you mention these here, but not x86, Sparc, PPC and RISC-V which
> also have 32-bit and 64-bit variants?

Because we consider them as different targets, they don't include
(kselect) the subset.

> 
> The patch itself looks fine to me, so once you've clarified the commit
> message:
> 
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> 
> 
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> Message-Id: <20210131111316.232778-6-f4bug@amsat.org>
>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>
>> ---
>> vajb:
>>    - removed targets that no longer exist
>>    - reword commit message to show why we need the Kconfigs
>> ---

>> diff --git a/target/arm/Kconfig b/target/arm/Kconfig
>> new file mode 100644
>> index 0000000000..3f3394a22b
>> --- /dev/null
>> +++ b/target/arm/Kconfig
>> @@ -0,0 +1,6 @@
>> +config ARM
>> +    bool
>> +
>> +config AARCH64
>> +    bool
>> +    select ARM

>> diff --git a/target/mips/Kconfig b/target/mips/Kconfig
>> new file mode 100644
>> index 0000000000..6adf145354
>> --- /dev/null
>> +++ b/target/mips/Kconfig
>> @@ -0,0 +1,6 @@
>> +config MIPS
>> +    bool
>> +
>> +config MIPS64
>> +    bool
>> +    select MIPS
