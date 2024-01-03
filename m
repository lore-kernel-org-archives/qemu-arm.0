Received: by 2002:a17:906:cc9:b0:a28:7ef3:d049 with SMTP id l9csp634189ejh;
        Wed, 3 Jan 2024 09:50:15 -0800 (PST)
X-Received: by 2002:a05:6000:1885:b0:337:4bab:dd68 with SMTP id a5-20020a056000188500b003374babdd68mr1390092wri.82.1704304215209;
        Wed, 03 Jan 2024 09:50:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704304215; cv=none;
        d=google.com; s=arc-20160816;
        b=0H6YZtTylV1cTdQ3Sz6nlAU10ofPVoPaA2VTlW2aNEXbfAdJ3MU7eJywe8esgCCKBO
         0U8bn2MwqsqSyzTlyJYvK0YDX7Nae57wFi/WnWmL3a2ZSvX4j27r2y5Oh/59LLAVAXiK
         9JVK5Hh2hsalhiPcGVOODsHJZO6pc5wky2FmHMfPCMiMn4NBvPWgiccy3f/nLn9xb4iG
         jzRbPBqyAsBmAZlnBq6HNyMoOscgqMkO14f9x+eP+wyi8XjZAOneFAmxP5MzUGvEBlkc
         yU0faMDjvXFURBav5p5x3vwq2SEACpO1YyifKjFEUZo3efIGsSwFC7Frwrq6oocN67qr
         VdYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=5F2VXYkjrYII2wHzAQk4L5HsWOBoBNWS2pQ57+FVJgY=;
        fh=D0Odi6nYqqNhU0T1NFJPAV9GuK5M2uQe2atjYsAy/LU=;
        b=rkuQdQHPWHUi6ljxrbpbz8txGts6YOTAUwBOlccqj8JV5nb3xKA7j+6jaXOmAdYyxK
         gqjdJHHUkW36HVgxuQOj7HhGC25in7k10fhETyvSo9JVxAbvG5XL1AWAFwvFf65Z9SC2
         TW58vRU/vww4/6aYbEo1lm3lAmjGK1LeYUJU41bFhe/Tj9LbWM+uXj2ec7VyKDq2/Ers
         CxfFKZhGz4KpxrC437GbKmINcBXAGjTEMuPjoFaH9wXEzu32oODSnzDYIP2kidV3vdm6
         GzqEqIoY9FfhMIjxxviwBIsihpmq0/wLy4Gmu5iajrHUfqhqbw4/2TuIsCtCRPO1Ulhe
         uwHQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DsXbURPT;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id bs3-20020a056000070300b0033686b04bf6sor195477wrb.6.2024.01.03.09.50.15
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 03 Jan 2024 09:50:15 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DsXbURPT;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704304214; x=1704909014; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5F2VXYkjrYII2wHzAQk4L5HsWOBoBNWS2pQ57+FVJgY=;
        b=DsXbURPTgfIDVSyNg7YkZBS6zkb83LYMUUYk+DZhw8Y+4MqERpNi20YQhe5C4ZnxzK
         oTD9dTY3JVaU+2XeeUQPnXQIWkI9v5R32UeDADVklOcoXDRyR5W1wC2q1eh0ymiGLU4h
         amxEk59QtbfFrb4nHvfMWb9Wc11qKF09s1+c489CCCkOGTSkOCYRlOmeAYaF0nzLOukw
         FwdzASLIjqDDV28l9+UcD2yEx3SaHV9NZ+qSLHLqDFsCKy4692sdzc4uWjN1PiKGr0bZ
         GQuWyoZHy+Ikpg+k8Y45DQLty47JOMAK/c1In/5mvYDg+NyLdS9HAelpPt/aKWQbl8Bb
         GpPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704304214; x=1704909014;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5F2VXYkjrYII2wHzAQk4L5HsWOBoBNWS2pQ57+FVJgY=;
        b=CGq+3UjegtBzrWg9kNRtobt3zRf3mhZzERc5eID/C1Qvu2iBI061/aFmCs/xdQ2biL
         CpylrGJHeqWspUqgoeJhcN1lk18ntXFCMczFS5LzfIf1s+UNtF5SHn/2D8sg3xehEKL2
         TJ0FWDAYIIH3mZRKvCN+i2j88YybuzFENs+dPeAkwxkxZXXYiuF3x3J5JfF/NW3tHUiV
         T3zRDuUS9FTea0G1K7QwN4WwFGMRmVLU7yvt5QDBtWihwSUEK5UFJZqWeKvLv/tWN6Jw
         lnCCw1udU37wz5A5OK54OjX6cMM1O8lB77Qw5aHwaQ+qa//vIU0pKCXMsE2XAdmvEHrv
         n6FQ==
X-Gm-Message-State: AOJu0YzBHY4P7ucHDiTO/cLmE7eCCbttzyQ9iJ4Q6ktiICV/i7o8QOzr
	WI5JAZOynYfC36LN0C5rN6v5vtIhrEtUDm8HDEU5kPK4qrIbEw==
X-Google-Smtp-Source: AGHT+IHOec9oNkIrnlY9NK6/rK0VGc1b4NubPs5VB1Dj8nGfMZLG0FwRX19cqc26uA170W2Jd13kLQ==
X-Received: by 2002:a5d:6910:0:b0:336:6dd7:4a13 with SMTP id t16-20020a5d6910000000b003366dd74a13mr10911726wru.121.1704304214537;
        Wed, 03 Jan 2024 09:50:14 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.100] (tre93-h02-176-184-7-144.dsl.sta.abo.bbox.fr. [176.184.7.144])
        by smtp.gmail.com with ESMTPSA id c9-20020a056000104900b003368849129dsm30420818wrx.15.2024.01.03.09.50.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jan 2024 09:50:14 -0800 (PST)
Message-ID: <1a923274-8a4a-4811-a836-9a0866e2c852@linaro.org>
Date: Wed, 3 Jan 2024 18:50:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 30/43] gdbstub: Use GDBFeature for GDBRegisterState
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Song Gao <gaosong@loongson.cn>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 David Hildenbrand <david@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Yanan Wang <wangyanan55@huawei.com>, Bin Meng <bin.meng@windriver.com>,
 Laurent Vivier <lvivier@redhat.com>, Michael Rolnik <mrolnik@gmail.com>,
 Alexandre Iooss <erdnaxe@crans.org>, David Woodhouse <dwmw2@infradead.org>,
 Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
 Brian Cain <bcain@quicinc.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Beraldo Leal <bleal@redhat.com>, Paul Durrant <paul@xen.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Cleber Rosa <crosa@redhat.com>,
 kvm@vger.kernel.org, Peter Maydell <peter.maydell@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-arm@nongnu.org,
 Weiwei Li <liwei1518@gmail.com>, John Snow <jsnow@redhat.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Nicholas Piggin <npiggin@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-riscv@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
References: <20240103173349.398526-1-alex.bennee@linaro.org>
 <20240103173349.398526-31-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240103173349.398526-31-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: nRnRGjx2yy0V

On 3/1/24 18:33, Alex Bennée wrote:
> From: Akihiko Odaki <akihiko.odaki@daynix.com>
> 
> Simplify GDBRegisterState by replacing num_regs and xml members with
> one member that points to GDBFeature.
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20231213-gdb-v17-5-777047380591@daynix.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   gdbstub/gdbstub.c | 14 ++++++--------
>   1 file changed, 6 insertions(+), 8 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
