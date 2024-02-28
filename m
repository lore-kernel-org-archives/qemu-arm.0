Received: by 2002:a05:7022:120c:b0:76:3752:a982 with SMTP id ox12csp14488dlb;
        Tue, 27 Feb 2024 21:09:02 -0800 (PST)
X-Received: by 2002:a17:902:db01:b0:1dc:6373:3cc with SMTP id m1-20020a170902db0100b001dc637303ccmr12568258plx.50.1709096942631;
        Tue, 27 Feb 2024 21:09:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709096942; cv=none;
        d=google.com; s=arc-20160816;
        b=G8KYFOP5j57Rx0hwvwx4Ut5FiBBgN3LuSoVg2ikytGAvjd7CKoSrAk2vP7bKfSDbY7
         Ikt5KEiG4W6TgFRxq3ZkpLl0QTsxLDoTkGsSTUSeHfWyRZr6I0GRa1vaMGN9oNRB7/qY
         3g2HdkVhc0onw4jgBXZwTQDHwCfLL/Mg+TvH0M37/V4T9nSQJOqDjgZuY9GMjMHsmV6I
         +IhqxNAjVk7R/CS/YoWb/4t5Hs2Xp77zJLLlJkRgb7lFHjslJHHyiCxKFdDQQF9GFnQz
         S/LOLVMX1Il74qZ8axJFysG03ooJsaswFGGGMzUOtrw3JgjWEr0MCA2cIMRA9HhBvg5I
         JR8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=cslmreSRbrQ1KYjx5gJYbed1Ss6prRm6Ac4nj/FDVd0=;
        fh=KML6omqy75XiJbgKKwSnN1Nk2AKhL1cqEM/aRaICH5o=;
        b=JwF9ufpsbDUTzOXpu5ZHGxW3J+VgzS+N/0+na6dZvTukMlUdOGJoYYE4eHWEvdOUD2
         0+3rADav0E0S5IOs87e4Ycb95Em/MMyeDbNRBN67Npt97Ma0u19Yr5hYeTpHJCNLyNJo
         3FvbN3dok5OXXl/0jZAxj46ul4tGjZRPd67WoVfJ2UdTTImesIlXNMi2AQZLOfb4sggc
         uCrXj9zw3nQFPkooSQydDkh+RSAFHvaAEr4rbUFpzH0Qi5zJApQuMXfVG5QqpY9R31HK
         0eQaLUMPgBghXqxbnX37bS0sMZgTmRawfjxu0bT59R8lRoLkrxY6nUxroZjGbUB7gJ00
         X7cA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=Cx+vIP4W;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id f1-20020a170902e98100b001db4b23a75bsor4059481plb.15.2024.02.27.21.09.02
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 27 Feb 2024 21:09:02 -0800 (PST)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=Cx+vIP4W;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1709096942; x=1709701742; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cslmreSRbrQ1KYjx5gJYbed1Ss6prRm6Ac4nj/FDVd0=;
        b=Cx+vIP4WCOSh1JPsjDMtlMLIJL7Tz27+FWzs4dcPTCeyx8k3FmvxLXKFhKp/0BfpAY
         W4fucxzju3yr6EUJx7Li+L7Nj8n8UieYOVh7U/wqSkfhF8o1/MnF2V9FYwDhsK+q+m9e
         ftf0q2A9MrEhm/+k3yX4f8dafROhRVs9qqv0D8t+LhusbvVG6ZFGRqBu16Yy2yqtXEOu
         sV+TTOUG18f7jET1jH4eve918Ys2a7Xx+npB4OMF2u8t6g4BIZpavdZOA0aqCNqEWTjv
         opzt3kBMrcSsRlter3AnlD4E7GjzAjSqhcaxKT9+P44RofhhpkO62p7Wwa3xs1BPIWY1
         23UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709096942; x=1709701742;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cslmreSRbrQ1KYjx5gJYbed1Ss6prRm6Ac4nj/FDVd0=;
        b=JebWbpxkR/5tDwYddfNSI+JHrcfyKAGOm7VU0X2SEWFpvNG06qSmDN5WAso5RrijPa
         wlUJjmCsjzttowU9zKTVU5UVSUJyYKDkZMwTl7Y5gxUmNXqEsbeTD30eniC46asP7x4o
         UL6RKuWOxaKFiWPfU60y+x4M2v9gsXG+cNWYLSPRxbCMJcSBotlotcivwXYpF0wURwqz
         g0cDZaLoyPt7wAbhds4RnUcq1b65+dWuEkus2Du4hzMfoeYp4Nh8WhAhl4n5Wt2Bk0Tx
         Hc6i7cQuq1FB+keRB4EvFyT4KY719G2eIpQVaHWLpKcQqMWcfxUQkx57NJTGBCyDni0D
         rc/w==
X-Gm-Message-State: AOJu0YyKp4U9AEsDopKIkJRWYLcIVXnvrxIDK469Rb2eOjYCLCivVCAF
	CI/9AzJSkxUbQ4zLHmqwrMdkrSSJCvTP2dV16xuaKzwbJufGwA5gjzE0UBQkIE8bP9MJ6e/ExUQ
	7
X-Google-Smtp-Source: AGHT+IFNE9qxi2xbfuI0Uw+IMseWdlT6n78xSU1nbtCMaZDWvoU4Y3Qy/kKFYK79bAUdUounxM9n/w==
X-Received: by 2002:a17:902:eccb:b0:1dc:c17d:6edd with SMTP id a11-20020a170902eccb00b001dcc17d6eddmr2707125plh.20.1709096941959;
        Tue, 27 Feb 2024 21:09:01 -0800 (PST)
Return-Path: <akihiko.odaki@daynix.com>
Received: from [157.82.203.206] ([157.82.203.206])
        by smtp.gmail.com with ESMTPSA id km13-20020a17090327cd00b001db5ecb2899sm2376359plb.162.2024.02.27.21.08.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Feb 2024 21:09:01 -0800 (PST)
Message-ID: <ec233087-c919-47d9-b48f-044495d0a74a@daynix.com>
Date: Wed, 28 Feb 2024 14:08:54 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 21/29] gdbstub: expose api to find registers
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 qemu-arm@nongnu.org, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Michael Rolnik <mrolnik@gmail.com>, Yanan Wang <wangyanan55@huawei.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 David Hildenbrand <david@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Song Gao <gaosong@loongson.cn>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>, Warner Losh <imp@bsdimp.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Ilya Leoshkevich <iii@linux.ibm.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, qemu-s390x@nongnu.org,
 Kyle Evans <kevans@freebsd.org>, Brad Smith <brad@comstyle.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, John Snow
 <jsnow@redhat.com>, Alistair Francis <alistair.francis@wdc.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Brian Cain <bcain@quicinc.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-riscv@nongnu.org, Bin Meng <bin.meng@windriver.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Mahmoud Mandour <ma.mandourr@gmail.com>
References: <20240227144335.1196131-1-alex.bennee@linaro.org>
 <20240227144335.1196131-22-alex.bennee@linaro.org>
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20240227144335.1196131-22-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: DBn720BWeY3p

On 2024/02/27 23:43, Alex Bennée wrote:
> Expose an internal API to QEMU to return all the registers for a vCPU.
> The list containing the details required to called gdb_read_register().
> 
> Based-on: <20231025093128.33116-15-akihiko.odaki@daynix.com>
> Cc: Akihiko Odaki <akihiko.odaki@daynix.com>
> Message-Id: <20240103173349.398526-38-alex.bennee@linaro.org>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>

> 
> ---
> v3
>    - rm unused api functions left over
> ---
>   include/exec/gdbstub.h | 28 ++++++++++++++++++++++++++++
>   gdbstub/gdbstub.c      | 27 ++++++++++++++++++++++++++-
>   2 files changed, 54 insertions(+), 1 deletion(-)
> 
> diff --git a/include/exec/gdbstub.h b/include/exec/gdbstub.h
> index da9ddfe54c5..eb14b91139b 100644
> --- a/include/exec/gdbstub.h
> +++ b/include/exec/gdbstub.h
> @@ -111,6 +111,34 @@ void gdb_feature_builder_end(const GDBFeatureBuilder *builder);
>    */
>   const GDBFeature *gdb_find_static_feature(const char *xmlname);
>   
> +/**
> + * gdb_read_register() - Read a register associated with a CPU.
> + * @cpu: The CPU associated with the register.
> + * @buf: The buffer that the read register will be appended to.
> + * @reg: The register's number returned by gdb_find_feature_register().
> + *
> + * Return: The number of read bytes.
> + */
> +int gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
> +
> +/**
> + * typedef GDBRegDesc - a register description from gdbstub
> + */
> +typedef struct {
> +    int gdb_reg;
> +    const char *name;
> +    const char *feature_name;
> +} GDBRegDesc;
> +
> +/**
> + * gdb_get_register_list() - Return list of all registers for CPU
> + * @cpu: The CPU being searched
> + *
> + * Returns a GArray of GDBRegDesc, caller frees array but not the
> + * const strings.
> + */
> +GArray *gdb_get_register_list(CPUState *cpu);
> +
>   void gdb_set_stop_cpu(CPUState *cpu);
>   
>   /* in gdbstub-xml.c, generated by scripts/feature_to_c.py */
> diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
> index a55b5e6581a..2909bc8c69f 100644
> --- a/gdbstub/gdbstub.c
> +++ b/gdbstub/gdbstub.c
> @@ -490,7 +490,32 @@ const GDBFeature *gdb_find_static_feature(const char *xmlname)
>       g_assert_not_reached();
>   }
>   
> -static int gdb_read_register(CPUState *cpu, GByteArray *buf, int reg)
> +GArray *gdb_get_register_list(CPUState *cpu)
> +{
> +    GArray *results = g_array_new(true, true, sizeof(GDBRegDesc));
> +
> +    /* registers are only available once the CPU is initialised */
> +    if (!cpu->gdb_regs) {
> +        return results;
> +    }
> +
> +    for (int f = 0; f < cpu->gdb_regs->len; f++) {
> +        GDBRegisterState *r = &g_array_index(cpu->gdb_regs, GDBRegisterState, f);
> +        for (int i = 0; i < r->feature->num_regs; i++) {
> +            const char *name = r->feature->regs[i];
> +            GDBRegDesc desc = {
> +                r->base_reg + i,
> +                name,
> +                r->feature->name
> +            };
> +            g_array_append_val(results, desc);
> +        }
> +    }
> +
> +    return results;
> +}
> +
> +int gdb_read_register(CPUState *cpu, GByteArray *buf, int reg)
>   {
>       CPUClass *cc = CPU_GET_CLASS(cpu);
>       GDBRegisterState *r;
