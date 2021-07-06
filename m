Received: by 2002:ac2:5485:0:0:0:0:0 with SMTP id t5csp2176762lfk;
        Tue, 6 Jul 2021 06:40:31 -0700 (PDT)
X-Received: by 2002:a1c:59c3:: with SMTP id n186mr857824wmb.48.1625578831206;
        Tue, 06 Jul 2021 06:40:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1625578831; cv=none;
        d=google.com; s=arc-20160816;
        b=zhFumRLIsCwDINZGiWdxwPveS9gRfilLTE6SbI3vYyDOHCYnMBMAbx8yFNdRS2qYDG
         s66RgsHmCT292gZr1DERXUhm6W2+aH3yhzIN/ePn+l9evlHzop2/YUwdAA6rXph2UJ1C
         0t9EyCBvpjpPDH9h6st+0dIMT4BYYjP9uvQ7yAY63QnNWuXWFvATPafmWThaXQrDk/3R
         myBvgWqxm1BoYOmBzarLSymihBNcm9BAqWRYXXUX4uF69p2upxh+u2ZptSYONkJW2jn3
         gbn3izo5mC6vyeEd9giz3HBgskarGU/7ZzENrYdZBJI4nhntHRmwKCnxZoC51J0MNAYm
         JzGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:sender
         :dkim-signature;
        bh=mG8uwHwLtZdbbJXrNqeL0PlbQ4feuU2jH9RDQnv5Qao=;
        b=bSK529iLmdGW2cXwYBMTfIAG9UdFqLTVrfH/XQFFl9VWTnU5qHWpYOTdR0q9e2PcOS
         mM9mMzFccj4+Rl5uukHP+eOvGGgil2ptecIzD9r/vumxNCH5fUWzfK/G4fNOPoTh8QzM
         G+HNaU9DPiQmwjxM51QD+SgnKQ4ieT+kOr5eccHTxMa+ufB1BfNG/LkQ+2tRgJlfQ/Dk
         tlu2TPcpr5+d6DWlYn2uxjh4KPrUPpyFSqURqbz6C72mIDK3Maa/iUS6cCgyuJODgc6X
         3CSDGizyl+XtcJBCRGXkYQhGLHALoiAWncM5lVHjxCvnuxseBoEuTLqo+pRsOWXauPlE
         rynQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b="MLfs/Vxw";
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id g17sor7792063wmq.15.2021.07.06.06.40.31
        (Google Transport Security);
        Tue, 06 Jul 2021 06:40:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b="MLfs/Vxw";
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=mG8uwHwLtZdbbJXrNqeL0PlbQ4feuU2jH9RDQnv5Qao=;
        b=MLfs/Vxww/TFSoNf4P8ql/1R9v+zVvXPEjlPABnkTfGpHY3Gbz4pHp4LVBYuJACnob
         ad1sT1EmCZBewQR0i6wcImK4sbfLRICmSgiW7nCdioRjai/AARAxeHuvKNgCBxfLGNIz
         R03is1igWFUKADx1FPTPZpEZxgxhHonxVrjjokCRnZRje0GSLYv7hHqfsSDCXhmOgc6G
         067araEjZuNd9pbV2UYyKXvhcGghV3K04lWoSNY+HGA/iHO3ASSfqmj98M8UtHJqjEop
         jqTIQ+9DPJT/apSzzuHf7XGO/GQ1lRlAhcM9I84K406OqdosJR6czlzgHKi3r/FRJh60
         GhyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=mG8uwHwLtZdbbJXrNqeL0PlbQ4feuU2jH9RDQnv5Qao=;
        b=GsKjf6xe4HF0vIhTbB9DdJ3xQ1m82P79xiIv9Xk4CG8ZkWbt9smKdiRkwzLf62Y8gU
         TQcZEW4Y6Pq30Fj3DI47/sMUNfXoRDGJJaZvwqIQH8ge+7gs+ElGwT5Kj/XoxDnoYrwa
         fuVI0iGH+WGcwcWnj+T+XIodO1xCSfyprjpEc1KLo3KnvuxESjY8CPoAjeoMZfL2DwPa
         NvgEPdKc/r5bJBkHZSUqf9stZcgM4C55qnDPBXGfRan44X9xGUDrvBaKCkTKKMOdEJZx
         GMbyCWgYJZe+KKaOacFzSzYGE7MX8Ad0TKjvoQvhuxtfKe5JP/x21fpoecArwMRLmAkt
         Yu9w==
X-Gm-Message-State: AOAM530saYGxpuVxSGhNh+5x4yYa8cEdQBQYBEyJrhVHSu2SYw6ozp0z
	/yMfe0qE+j/tg78SL6XmY+g=
X-Google-Smtp-Source: ABdhPJwQtC6NNBrNsDqRvuXI5Ir2okga/KjJe1cEm0SYBG4+SFPp5vGkrJQRpzuzZoOvbmIUEQmKNQ==
X-Received: by 2002:a05:600c:1d28:: with SMTP id l40mr831039wms.130.1625578830900;
        Tue, 06 Jul 2021 06:40:30 -0700 (PDT)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
        by smtp.gmail.com with ESMTPSA id b15sm20214959wrr.27.2021.07.06.06.40.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jul 2021 06:40:30 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH v1 1/5] meson: Introduce target-specific Kconfig
To: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Chris Wulff
 <crwulff@gmail.com>, David Hildenbrand <david@redhat.com>,
 Bin Meng <bin.meng@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>, Marek Vasut <marex@denx.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Palmer Dabbelt <palmer@dabbelt.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz
 <groug@kaod.org>, "open list:S390 general arch..." <qemu-s390x@nongnu.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 Michael Rolnik <mrolnik@gmail.com>, Stafford Horne <shorne@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 "open list:PowerPC TCG CPUs" <qemu-ppc@nongnu.org>, pbonzini@redhat.com,
 Aurelien Jarno <aurelien@aurel32.net>
References: <20210621152120.4465-1-alex.bennee@linaro.org>
 <20210621152120.4465-2-alex.bennee@linaro.org>
 <c3d33a80-b3bb-5aa5-50c7-7c1a379814ba@redhat.com>
 <8d018805-8e1f-4c1e-b1a4-45a34c8d2e63@amsat.org>
 <bd97210a-04d4-939f-b3b7-1e250d7d250a@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <b0b09bf7-71d7-1bd9-1aaf-717b66692304@amsat.org>
Date: Tue, 6 Jul 2021 15:40:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <bd97210a-04d4-939f-b3b7-1e250d7d250a@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: pi+ghEAAHigE

On 7/6/21 3:10 PM, Thomas Huth wrote:
> On 06/07/2021 14.47, Philippe Mathieu-Daudé wrote:
>> On 7/6/21 12:52 PM, Thomas Huth wrote:
>>> On 21/06/2021 17.21, Alex Bennée wrote:
>>>> From: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>>>
>>>> Add a target-specific Kconfig. We need the definitions in Kconfig so
>>>> the minikconf tool can verify they exit. However CONFIG_FOO is only
>>>
>>> s/exit/exist/ ?
>>>
>>>> enabled for target foo via the meson.build rules.
>>>>
>>>> Two architecture have a particularity, ARM and MIPS:
>>>> their 64-bit version include the 32-bit subset.
>>>
>>> Why do you mention these here, but not x86, Sparc, PPC and RISC-V which
>>> also have 32-bit and 64-bit variants?
>>
>> Because we consider them as different targets, they don't include
>> (kselect) the subset.
> 
> And why is that done this way? There is certainly a big difference
> between Sparc and Sparc64, but for x86 and PPC, the 64-bit variant is a
> superset of the 32-bit variant, so why is it done different here
> compared to ARM and MIPS?

I don't know these targets well. Maybe the 64-bit variants do include
their 32-bit subset. If you know, I can easily send a new patch.
