Received: by 2002:a17:505:ab84:b0:1be9:327d:8ee3 with SMTP id pj4csp750671njc;
        Thu, 20 Mar 2025 00:09:15 -0700 (PDT)
X-Received: by 2002:a05:600c:3556:b0:43c:eea9:f45d with SMTP id 5b1f17b1804b1-43d437c2dc4mr48049115e9.18.1742454555088;
        Thu, 20 Mar 2025 00:09:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742454555; cv=none;
        d=google.com; s=arc-20240605;
        b=JJCybTBYGxjIwWFSkosHzlJ0dxv64cnQTkgZKO6FbIj3xUyWRQ9qm7ZnNm5KGgsne/
         GPpmbxG3P1Da8kv4u328BJl1cSVdoaQRpMbYOgG0qUraD+6rvZiyEGE1BwRKPdmTJJ4j
         eST0sskXxxdTmVAhN5yMuZwOn0YS2uQxkyQDdIykEjiz9nVt0J9bkrSSLz1beiMiqthy
         9H+N7vmOE0FbxgHvzRmjEqLAOJ7iCHt4YXfr6uNZg/KrIzg0igIlEl6UHMq5GYU5nfef
         khGsM5Xc2p10g3L8Xq8CNwSWvwf3tLJ27Zcq22Yp0z0n6kqdpEAcTeV9iq65tz1NWArB
         Qcaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=p0WLjJlFUa5B3XVkqtixZuzuCE3gjB8V9d9wqEIT7mI=;
        fh=VTjyscoH3jg4EEBGXGBCijT0Cth03TkL5RpTsM1FyIc=;
        b=h9mIlfUVmgM91Ad0zFBKnS4uU5eVqv6erXQmN0DeZLYWRXworOR1evwiFqOrteb5Lw
         wNBFeFmv71m1dpElh0A+Aibwyo8snHerRmkOV7E9XU6XraEvVTTRxm852KVUQJKktsRn
         SoMpgR4SUqFbqthYQL2EtXEZMYKIVLfekMKVeze2fewEmNO2PJsJRG7fBnxVgDpVt9LR
         AeuC+zhYNxlxh8Gwrio4s6EHpSqvp6TawQAFIN4hNeDIXyGrlj+6GDtefzvXmoLWLPC3
         JXSb7A96i3syW3LrBI0sDlw1scyGtezZ7eSrEUnuNIMyAI+9EnTwm34dDSJJQpatgOmo
         xUBQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=E4eDyOGk;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-43d4a68c3aesor2249755e9.0.2025.03.20.00.09.14
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 20 Mar 2025 00:09:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=E4eDyOGk;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742454554; x=1743059354; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=p0WLjJlFUa5B3XVkqtixZuzuCE3gjB8V9d9wqEIT7mI=;
        b=E4eDyOGk0SsZDXaFE7rwyQYDzYC+q5EUXVsJpwUUp6eK4SWC6W/n0BdwNE0yJY/bLo
         2Sn0r0+bLWn9RJgl8VzbWFUP6bJne3emNR1P8awTbHOIELogT/XcaJFMw1s+ZfHymmJe
         9oJLgGC9ppuRYlor3jiWPt55s++uNzClY7O1kKLIWmeUABHdHoeyU9dfE0ZjcWAOx/8a
         AAOHQSxSZ1OXxFU4d3XfQ76sDuW6Mj78DWz6WkjSzl3HYeDCUGY0cqcomwtobKLPeEBv
         xrmxbJZhDshYQA1vrVx4z2gnho3o4rQGaf+euNcI7dwuo4fqwsLzM2tpittUiz45VEfT
         j9Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742454554; x=1743059354;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p0WLjJlFUa5B3XVkqtixZuzuCE3gjB8V9d9wqEIT7mI=;
        b=MSdZ1L2ZytsCLK9PydnalZLjFKyy8phQFJ+afpdVyN0/LXoBd7eWzZBlcrT2iQbNiC
         m/ezrzZeaMiXVtU2zkybOf14uPAi7gMOLOqtSLCYwXacDCKbS4i3NrUW4afQ5TvRKQ5J
         XeXQQT9ulQ48QoJU66hbDNwjDrAyBzPkMdvwRrks+Qukwsuf9dftAyKxnawekJle98t4
         +1qFegpO1UGg8oHRO94XYfEJrxTtOjs7AKpp8oLWf2eX3KeNcUZtCgQmERCW4EvAXgX7
         3OAzMqsRrR6VFo9xm1BmQKn8wlOOA+LB/2sVOYCGsQqxss8GilFOhILIoKStMAm4BWSA
         3AlA==
X-Gm-Message-State: AOJu0YyGO1GyIQZup8c6HGTBK47qBn2OrgmP1e424DgW160fZGcdfcDq
	6HJIz6i3mjHB8QYkruTJjpA7RQllvl5e9uHx5eaOGKU/saObkavTQ03bdKDU7liQsKs908cTskC
	Xfp4=
X-Gm-Gg: ASbGncuknGQN6W26nsg9T3O95sOUVFxpLr3rBKEFqql9W6F+cFXbnyxyHB60TJ9yq3V
	46PMIiiStQ8OJdonUOmBBI7Z2LRjrQeiCGiC9c1W2FKztr5LA67OQv+W0sqWCCmKNC0/Lh9JX/Y
	xKaR53Ej0IXU6SPCNpB6BNDxOCQ0ccJKOvqVxYZK6fUW0xAjh6+yREDjmsLs2l3lNlGAQGfbA/M
	GLRbB38pxnX5qF+PmqPaddyOD4tuwMt4QLUC2qRyRs+S4yRAf5P69WtUqU4MxskFuxKo9h2W9DU
	cVTEqKC3UrkbmzMeA9bj1r7CETFhx3r7v32sCIfgewo00T8E02hfcVQVHeXFFYE3uclcY15k92S
	vKi5hc15/7F2J
X-Google-Smtp-Source: AGHT+IHsiLcx/k7ZdP9QfOhg5TgNH/YjasQHlID+mpeEdAHUYFcN/8PAgEK0sxi211VRJHaCquHdqw==
X-Received: by 2002:a05:600c:c16:b0:43c:eeee:b70a with SMTP id 5b1f17b1804b1-43d43815e66mr51154205e9.22.1742454554137;
        Thu, 20 Mar 2025 00:09:14 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.235] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d43f58a66sm39340265e9.20.2025.03.20.00.09.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Mar 2025 00:09:13 -0700 (PDT)
Message-ID: <82e16c74-e60c-45b9-b269-a8d35d0b64d8@linaro.org>
Date: Thu, 20 Mar 2025 08:09:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/10] target/microblaze: convert gdbstub to new helper
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Juan Quintela <quintela@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, Akihiko Odaki <akihiko.odaki@daynix.com>,
 qemu-ppc@nongnu.org, David Gibson <david@gibson.dropbear.id.au>,
 qemu-s390x@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Peter Xu <peterx@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Hildenbrand <david@redhat.com>, Yonggang Luo <luoyonggang@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Beraldo Leal <bleal@redhat.com>, qemu-arm@nongnu.org,
 Greg Kurz <groug@kaod.org>, Nicholas Piggin <npiggin@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
References: <20250319182255.3096731-1-alex.bennee@linaro.org>
 <20250319182255.3096731-11-alex.bennee@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250319182255.3096731-11-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: QkjlhLRWnvjy

On 19/3/25 19:22, Alex Bennée wrote:
> This is a pretty simple conversion which will be trivial to update
> once TARGET_BIGENDIAN is replaced with a helper function.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   target/microblaze/gdbstub.c | 44 ++++++++++++++-----------------------
>   1 file changed, 17 insertions(+), 27 deletions(-)
> 
> diff --git a/target/microblaze/gdbstub.c b/target/microblaze/gdbstub.c
> index d493681d38..106d6efbab 100644
> --- a/target/microblaze/gdbstub.c
> +++ b/target/microblaze/gdbstub.c
> @@ -19,7 +19,7 @@
>    */
>   #include "qemu/osdep.h"
>   #include "cpu.h"
> -#include "gdbstub/helpers.h"
> +#include "gdbstub/registers.h"
>   
>   /*
>    * GDB expects SREGs in the following order:
> @@ -50,62 +50,52 @@ int mb_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
>   {
>       MicroBlazeCPU *cpu = MICROBLAZE_CPU(cs);
>       CPUMBState *env = &cpu->env;
> -    uint32_t val;
> +    MemOp mo = TARGET_BIG_ENDIAN ? MO_BEUL : MO_LEUL;

Since commit 415aae543ed TARGET_BIG_ENDIAN isn't doing what you'd
expect on microblaze, I think you want:

        MemOp mo = mb_cpu_is_big_endian(cs) ? MO_BEUL : MO_LEUL;

>   
>       switch (n) {
>       case 1 ... 31:
> -        val = env->regs[n];
> -        break;
> +        return gdb_get_register_value(mo, mem_buf, (uint8_t *) &env->regs[n]);
>       case GDB_PC:
> -        val = env->pc;
> -        break;
> +        return gdb_get_register_value(mo, mem_buf, (uint8_t *) &env->pc);
>       case GDB_MSR:
> -        val = mb_cpu_read_msr(env);
> -        break;
> +        uint32_t msr = mb_cpu_read_msr(env);
> +        return gdb_get_register_value(mo, mem_buf, (uint8_t *) &msr);
>       case GDB_EAR:
> -        val = env->ear;
> -        break;
> +        return gdb_get_register_value(mo, mem_buf, (uint8_t *) &env->ear);
>       case GDB_ESR:
> -        val = env->esr;
> -        break;
> +        return gdb_get_register_value(mo, mem_buf, (uint8_t *) &env->esr);
>       case GDB_FSR:
> -        val = env->fsr;
> -        break;
> +        return gdb_get_register_value(mo, mem_buf, (uint8_t *) &env->fsr);
>       case GDB_BTR:
> -        val = env->btr;
> -        break;
> +        return gdb_get_register_value(mo, mem_buf, (uint8_t *) &env->btr);
>       case GDB_PVR0 ... GDB_PVR11:
>           /* PVR12 is intentionally skipped */
> -        val = cpu->cfg.pvr_regs[n - GDB_PVR0];
> -        break;
> +        return gdb_get_register_value(mo, mem_buf,
> +                                      (uint8_t *) &cpu->cfg.pvr_regs[n - GDB_PVR0]);
>       case GDB_EDR:
> -        val = env->edr;
> -        break;
> +        return gdb_get_register_value(mo, mem_buf, (uint8_t *) &env->edr);
>       default:
>           /* Other SRegs aren't modeled, so report a value of 0 */
> -        val = 0;
> -        break;
> +        return 0;
>       }
> -    return gdb_get_reg32(mem_buf, val);
>   }
