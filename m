Received: by 10.25.0.147 with SMTP id 141csp1943198lfa;
        Tue, 7 Mar 2017 09:50:05 -0800 (PST)
X-Received: by 10.200.54.46 with SMTP id m43mr2117288qtb.127.1488909005406;
        Tue, 07 Mar 2017 09:50:05 -0800 (PST)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-qk0-x242.google.com (mail-qk0-x242.google.com. [2607:f8b0:400d:c09::242])
        by mx.google.com with ESMTPS id m5si641351qkd.24.2017.03.07.09.50.05
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 07 Mar 2017 09:50:05 -0800 (PST)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 2607:f8b0:400d:c09::242 as permitted sender) client-ip=2607:f8b0:400d:c09::242;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 2607:f8b0:400d:c09::242 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com
Received: by mail-qk0-x242.google.com with SMTP id n141so2963776qke.3;
        Tue, 07 Mar 2017 09:50:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=SAhEWPN0U2U66oHkUjCncENymBbFEVOcMh0eXFDCFh0=;
        b=G9sM09YZ5lu3o8ikJMsyq8972/e3CbKytbh+rVU1ejvP/6V2kpA9rANYujZ44EAO/k
         saECJvXsUyBbEwd8BxtO5Ms+kOc974NVZB44uAqe6NQ2KmeNbl0Fpr38Y75kemTYe9Y6
         RRyoRXKj9POI1Fs3LhtvYMkHbpUPXmT0fyWLJzDw+rCQ+VA6VFxXaxMp3RNRfw84cC1H
         lOo2GSFDAVpmLC3gfF8JT7+dWqxiUDdGLfQgZfrsDi448tuUCSHjJ/skoZbGuq3oSnBO
         8kZLKdnsjYT1iHpENMy9Uf5I/0JAl3miCU6h+V6aivRJwBua34bP+ZWsNeEqJjp/idEZ
         gDEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=SAhEWPN0U2U66oHkUjCncENymBbFEVOcMh0eXFDCFh0=;
        b=t9pkbGJgMJIPtBC2LH5uuBTKOWG9m2yKBw26BABXnhjoNXC8YLmptUr94cKL1H1xsg
         zBQgvZEp9eDqp4dH9rNl/YgLJ53cwZCkabG5nTZ2/ZJ0/W5SxjI+N3wC3qdfuKyz7N1c
         krazl6Z7+ZGeo9HnB0HivsLz8Rlyh9JIjNwiz9LQN0C/FTJMnwGMQWjDtNwzKPP609D6
         5XEM9uhJF96ECe/ChhImPBMi5Vmq9+7cQyAUIdmVz64JsClIHprgtBcOB88hctg8guZs
         58sZCAiT3++qBlamrFbpPDpYnQRqsns0Nmf2KitjBeXgYch9aB7Nq2TChTXhlAeK2n1a
         eq4A==
X-Gm-Message-State: AMke39lgJ/HZlI7SDB9hlOLPRt2I85IfL7qybYjMUdTU9zV75hVmWfkwPxj+ua8aAvr47A==
X-Received: by 10.200.39.97 with SMTP id h30mr1977936qth.18.1488909005011;
        Tue, 07 Mar 2017 09:50:05 -0800 (PST)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from [192.168.1.10] ([138.117.48.226])
        by smtp.gmail.com with ESMTPSA id e19sm424718qta.68.2017.03.07.09.50.01
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 07 Mar 2017 09:50:03 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
Subject: Re: [Qemu-arm] [PATCH v3 10/11] target/arm/helper: make it clear the
 EC field is also in hex
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 peter.maydell@linaro.org, rth@twiddle.net, pbonzini@redhat.com
References: <20170307155054.5833-1-alex.bennee@linaro.org>
 <20170307155054.5833-11-alex.bennee@linaro.org>
Cc: mttcg@listserver.greensocs.com, nikunj@linux.vnet.ibm.com,
 a.rigo@virtualopensystems.com, qemu-devel@nongnu.org, cota@braap.org,
 "open list:ARM" <qemu-arm@nongnu.org>, bobby.prani@gmail.com,
 fred.konrad@greensocs.com
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <1bfd4dce-1be3-2176-8731-ea5b9a677d30@amsat.org>
Date: Tue, 7 Mar 2017 14:49:59 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <20170307155054.5833-11-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: +T0E53JFZ/cF

On 03/07/2017 12:50 PM, Alex Bennée wrote:
> ..just like the rest of the displayed ESR register. Otherwise people
> might scratch their heads if a not obviously hex number is displayed
> for the EC field.
>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: KONRAD Frederic <fred.konrad@greensocs.com>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  target/arm/helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 3f4211b572..76b608f0ba 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -6857,7 +6857,7 @@ void arm_cpu_do_interrupt(CPUState *cs)
>                    new_el);
>      if (qemu_loglevel_mask(CPU_LOG_INT)
>          && !excp_is_internal(cs->exception_index)) {
> -        qemu_log_mask(CPU_LOG_INT, "...with ESR %x/0x%" PRIx32 "\n",
> +        qemu_log_mask(CPU_LOG_INT, "...with ESR 0x%x/0x%" PRIx32 "\n",
>                        env->exception.syndrome >> ARM_EL_EC_SHIFT,
>                        env->exception.syndrome);
>      }
>
