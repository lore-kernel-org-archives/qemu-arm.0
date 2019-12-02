Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp12118879lfc;
        Sun, 1 Dec 2019 18:24:51 -0800 (PST)
X-Received: by 2002:a63:d351:: with SMTP id u17mr28511993pgi.84.1575253490775;
        Sun, 01 Dec 2019 18:24:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575253490; cv=none;
        d=google.com; s=arc-20160816;
        b=WRuaulLOCZ3bpdoYbzEQXBo7FYxZQZMCRoZY7EdnaCc9M8IrZtkccnsBCWZPRLDKze
         F4wvWge+ePikiZfZ5CeT3HWPL/yu5MJvqW9e0/LrDE0ZbrodGca+oRKLObxceeIffIFL
         t2K4dYSRCM8RABGfiY4tNM7/m1iTZngiS+T0qjOfRjq7UZnso9TG7A1G4QjGTgw+AjOw
         hWQkRvzoyNEWthJDl+P13ckvu24CTmYsC/650IYS8sVKLo6p9e601JrCxNqxaJqTCOYw
         lvpWUtp2KCufz7BPz5fVZbqqIN0UW5Ld5OgURF1QN55EMv3NaPxeQ3fkA1q0LCA+R/TO
         Eu+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=9uZMeOcjp69CcLk4kJoh51jLK8rzeIE59U8CnyNM9uw=;
        b=rwjuoOui2IJoM97M88VUAsxwoqrRNrcrKRF4KETJ/2Eb+zo7BcL351wYfQwMuzP2vY
         IEevfc4YiBwJRe7WznY4h51N8iL5741JamdQVI6eyhGFpKAWi9aHJ23d4qN4ekVFsOib
         ETtTTV1I9/TbYN3HmqpvUfMLLM/Xsat3U6nEOPRpIJyZ8JeSd4vJt/3Mr4L7mkvV2sqO
         s3cpTWaQZQf1YD4NKz14Pa/W53Nox4i7SbthTg8UfvECY4mEnQ9JqnDs9CNt1orGyVqv
         QUQakCejztADSQkuDf/NxU4J8O2OmuDiPgbW8aU0mJUN0Q/cXviS5mS0pd7GMGzzAa4V
         /Pug==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NdKXEZFP;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id m5sor26773172pjs.15.2019.12.01.18.24.50
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 01 Dec 2019 18:24:50 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NdKXEZFP;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=9uZMeOcjp69CcLk4kJoh51jLK8rzeIE59U8CnyNM9uw=;
        b=NdKXEZFPqImyiun752tSnpnNEyZG0dTjM0NwfMw7m/reaycfYDF5JhWaLkXPkOm+hW
         YtJqnFRYK+0i68KbHUGbwDX7xf2L5eRwOn0Z4XexdP5slDmA5M9LquKLrv4macGSEYB+
         s5lvW11sgcZfqb3Fz8f+XJD2vb21K0F+tofwnUu1/gRNzCoMkcxH2ttbHaiiykR0sR80
         zKnYQhYym+rUBSKupGJLIAaTPKdO44FmyaKa+ejylbqwcUx+cNLcEDR3D+he+esdPIw/
         sVYX/yIT9nXJNPQnA151wsnHZN1GMcCzCZX7udc5Evd2SyE0OrSvQbR5JwmWTD5ld3sc
         sV7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=9uZMeOcjp69CcLk4kJoh51jLK8rzeIE59U8CnyNM9uw=;
        b=VpGg4oSinxCsxICb4/JZF1v1sx8VXK/zbHs2fTE3Y87Y+5S0saM+VHeiYGwjBDyrCU
         LQiKas86ZTTirLk/kO+7rNctD8o20xsnLdvZOS/EWIYHYTVdf26wnyy0TIi5uyz9J4Ou
         qx94DhpYXQDZ5k4qDh38pSN7mNlKyN/nevoOhkqGEvkxetRZZjKvO5wKKsuqxbLFRi/a
         o4PkhtF8iRGwl26EisAKiEzYP/e4rIOMv7a/DSokhy/cghCCEkkJP8ismM8kKleFmC1Y
         YP7ptW1eqUfwf93IUIhJ40YA94MUaR+fVVjey6Uav64Vb9VIrPCc3itnFo/AATEjXGDR
         ovog==
X-Gm-Message-State: APjAAAWP2u0/ZV6mVewJSkvjDMKcK6Agv4NXDG2tFuDq5o+uvhVOKDQ1
	kyBpiSBibMLFKfnYcnC5UDkQ9T/f
X-Google-Smtp-Source: APXvYqwNCsLHCmgtq4yEB82YTo8Go2tM/yn6Jyk+zdoQ0lb8zpr6smFP27PzPme3sWBdki3UBROaiw==
X-Received: by 2002:a17:90a:30a4:: with SMTP id h33mr32078066pjb.50.1575253490309;
        Sun, 01 Dec 2019 18:24:50 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
        by smtp.gmail.com with ESMTPSA id h3sm20818336pji.16.2019.12.01.18.24.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Dec 2019 18:24:49 -0800 (PST)
Subject: Re: [PATCH v2 08/14] gdbstub: extend GByteArray to read register
 helpers
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: alan.hayward@arm.com, luis.machado@linaro.org,
 damien.hedde@greensocs.com, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <rth@twiddle.net>, Peter Maydell
 <peter.maydell@linaro.org>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Michael Walle <michael@walle.cc>,
 Laurent Vivier <laurent@vivier.eu>, Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>,
 Stafford Horne <shorne@gmail.com>, David Gibson
 <david@gibson.dropbear.id.au>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 "open list:PowerPC TCG CPUs" <qemu-ppc@nongnu.org>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 "open list:S390 TCG CPUs" <qemu-s390x@nongnu.org>
References: <20191130084602.10818-1-alex.bennee@linaro.org>
 <20191130084602.10818-9-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e052df9d-d2bc-b257-adf1-33299bf7b6a5@linaro.org>
Date: Sun, 1 Dec 2019 18:24:47 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191130084602.10818-9-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: wBAUhHQFBzW0

On 11/30/19 8:45 AM, Alex Bennée wrote:
> -static int cpu_read_virt_reg(CPUS390XState *env, uint8_t *mem_buf, int n)
> +static int cpu_read_virt_reg(CPUS390XState *env, GByteArray *mem_buf, int n)
>  {
>      switch (n) {
>      case S390_VIRT_CKC_REGNUM:
> @@ -296,9 +296,9 @@ static int cpu_write_virt_reg(CPUS390XState *env, uint8_t *mem_buf, int n)
>  /* total number of registers in s390-gs.xml */
>  #define S390_NUM_GS_REGS 4
>  
> -static int cpu_read_gs_reg(CPUS390XState *env, uint8_t *mem_buf, int n)
> +static int cpu_read_gs_reg(CPUS390XState *env, GByteArray *buf, int n)

Sometimes you're changing the name from mem_buf and sometimes not.  Perhaps
better not to change it anywhere, or change it everywhere first, without
changing the type.


r~
