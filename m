Received: by 2002:a17:906:494d:b0:a0d:e0d9:b5bf with SMTP id f13csp1799256ejt;
        Tue, 28 Nov 2023 03:24:06 -0800 (PST)
X-Received: by 2002:ac2:53b4:0:b0:50b:bddf:a870 with SMTP id j20-20020ac253b4000000b0050bbddfa870mr625823lfh.58.1701170646282;
        Tue, 28 Nov 2023 03:24:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701170646; cv=none;
        d=google.com; s=arc-20160816;
        b=YvjpCwagB2GP2y06Ac+bYkrO+tn62QuOZIBvaodXt9S1PsH5eLxHpQSnOj74yuCPho
         k5iRegOcfLDHElw5tQUWsaIkHBHypbe+I7C5dtdBhQ6PNUTmi5ndNqbyENRXitJNI5m9
         Xlxu++fN7k0nQ+uZRxZzvVscfDsX6F0omrGujZUSgy/OwcFcrAijzWHoIpjt3BbYM/cf
         nWcyE4GFNmtRZ7nYIoFPwDSzYAF4KloWd2DB3tTJjRqnRXkmRYSgKt/FXp4FmPF97g7S
         hR9Iiviz7z6XD4i94qWDTm9s9YZSHQg+jPTzuAEb2rAMbczIwS+SqZLQMRExxhNj2yp3
         xO4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=lkgqpMWNN9aIWkoN208jbZ0DCwqJ9JVKRs3aY9WvOQI=;
        fh=/0EgXGqzibNfc+P+1wXCbjIcNyE8FKF28gd2KuMh/UY=;
        b=ZWERSbbPuRXs1H48jDkV4J5z5iMaaDOD8TTkQE6BzTQqx6Tpts7IAprvh1bViFJXZG
         slq84Ym1owPPfzeY6jPrTVfsGI3dMwM9d0C4HUEPVWv16sMGmGyuSOzzoL5TdqiXyn+F
         8GKqTvrKBwNl1hBQofWo0l3eFcZ5l0hyLeRzbpujrTeUixmsyO3oEWHA3U0o4gTiP2zU
         36d/DESspS/fdi8X/4rcEqacsmvJ3pYhDYye9K7rc6G/1jGZDazOLbgtco5mPpq4P740
         AqZh0u9M7wCv2i9sTO/NgsYmkZgYDTU89b5qb4iuHFi/ypNHQpsZ+HiPq8qruNt6vOGW
         By+w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZulgWhvy;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id v3-20020a197403000000b0050bc05d8c46sor94280lfe.25.2023.11.28.03.24.06
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 28 Nov 2023 03:24:06 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZulgWhvy;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701170646; x=1701775446; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lkgqpMWNN9aIWkoN208jbZ0DCwqJ9JVKRs3aY9WvOQI=;
        b=ZulgWhvyDkfZ8DP8KgPmT7VYXjQ8iNH5xROFe+u4y031wH/8sb7/XlRzSLx4d40EKP
         x0oN5JsLzJo9J6b+XTCCCzTrD1rnXslIMvwgdSjVNyEJD3uNPaF068leSBRPxM6oyqAu
         CVbDmliRyTwCrc4QZZ2nbrV6GT63FV+X1genDWtyUBtAbh8tJBo1yIGS1GHKoT2zooS1
         cUpHtfKziVP55zp8cxnndXZfZBMHmduCQy0hGk/UT4qj2mWEghI03cZcv2NFezWTBSGo
         T3Mn1P43gP5PzMxWv1jOeVyZURhpBx+w6gUTaZnGhqxusczwvU5RKQwE3ZWEECYchVCW
         lVWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701170646; x=1701775446;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lkgqpMWNN9aIWkoN208jbZ0DCwqJ9JVKRs3aY9WvOQI=;
        b=Tm9fni6FYvsfgPu0KV4NACS9SHNGiwp8cfTJ2wNG27SOedU+PiNlJqiPfbMpiJpNcq
         CIFSX1GDM3ykmLzIZvsDXpMlFDOELH11o3xqi1486KWy6vCahPJFLwavFlLTDj/fGb6L
         wWIcFUdZDomC0qG+sozjo/UdUm3gIassiwJMUhSYR/Ic2cZmY5HVReCm9PSoVZ053KDT
         vdZEU2y2NHbj3wMA1zxx5pGmjMOOyrr6WSS4+6BsURCcQ8K5LedPP4nD+3jpkIeuyW12
         ZIGEtcSbat7zkyeLgvihYBZiCx3GwbzRIEcQFHgJcUaS4S+UzjUi5FURZvkmNsZm4Ye/
         2+qA==
X-Gm-Message-State: AOJu0Yz8J8aOR3iZp7OQ9hBwuirpyxs/1f1l2dWE7CiRVX0+2p4JLon5
	3jfgszJJ7X+YTxV+b3bef+orD71GAvwked8tlnF+Nw==
X-Google-Smtp-Source: AGHT+IGXeLI2wCQpXZNzdB4uxDCqUyCp1OJlpKs9UU+Sg1bL32mP6ZiclXPs1YQBkS3f5h9N7YLHFQ==
X-Received: by 2002:a05:6512:3b0b:b0:509:1301:8470 with SMTP id f11-20020a0565123b0b00b0050913018470mr13302170lfv.45.1701170645773;
        Tue, 28 Nov 2023 03:24:05 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.100] (crb44-h02-176-184-13-61.dsl.sta.abo.bbox.fr. [176.184.13.61])
        by smtp.gmail.com with ESMTPSA id h9-20020a05600c314900b0040b32edf626sm11521547wmo.31.2023.11.28.03.24.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Nov 2023 03:24:05 -0800 (PST)
Message-ID: <95cc7c22-939f-4ce0-aecd-d0ff7b0e7c9c@linaro.org>
Date: Tue, 28 Nov 2023 12:24:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] target/arm: Add support for DC CVAP & DC CVADP ins
Content-Language: en-US
To: peter.maydell@linaro.org, richard.henderson@linaro.org,
 Beata Michalska <beata.michalska@linaro.org>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: quintela@redhat.com, dgilbert@redhat.com,
 shameerali.kolothum.thodi@huawei.com, eric.auger@redhat.com,
 qemu-arm@nongnu.org, pbonzini@redhat.com
References: <20191105234100.22052-1-beata.michalska@linaro.org>
 <20191105234100.22052-5-beata.michalska@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20191105234100.22052-5-beata.michalska@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: ZTxFOnni90Y0

Hi,

On 6/11/19 00:41, Beata Michalska wrote:
> ARMv8.2 introduced support for Data Cache Clean instructions
> to PoP (point-of-persistence) - DC CVAP and PoDP (point-of-deep-persistence)
> - DV CVADP. Both specify conceptual points in a memory system where all writes
> that are to reach them are considered persistent.
> The support provided considers both to be actually the same so there is no
> distinction between the two. If none is available (there is no backing store
> for given memory) both will result in Data Cache Clean up to the point of
> coherency. Otherwise sync for the specified range shall be performed.
> 
> Signed-off-by: Beata Michalska <beata.michalska@linaro.org>
> ---
>   linux-user/elfload.c |  2 ++
>   target/arm/cpu.h     | 10 ++++++++++
>   target/arm/cpu64.c   |  1 +
>   target/arm/helper.c  | 56 ++++++++++++++++++++++++++++++++++++++++++++++++++++
>   4 files changed, 69 insertions(+)


> +#ifndef CONFIG_USER_ONLY
> +static void dccvap_writefn(CPUARMState *env, const ARMCPRegInfo *opaque,
> +                          uint64_t value)
> +{
> +    ARMCPU *cpu = env_archcpu(env);
> +    /* CTR_EL0 System register -> DminLine, bits [19:16] */
> +    uint64_t dline_size = 4 << ((cpu->ctr >> 16) & 0xF);
> +    uint64_t vaddr_in = (uint64_t) value;
> +    uint64_t vaddr = vaddr_in & ~(dline_size - 1);
> +    void *haddr;
> +    int mem_idx = cpu_mmu_index(env, false);
> +
> +    /* This won't be crossing page boundaries */
> +    haddr = probe_read(env, vaddr, dline_size, mem_idx, GETPC());
> +    if (haddr) {
> +
> +        ram_addr_t offset;
> +        MemoryRegion *mr;
> +
> +        /* RCU lock is already being held */
> +        mr = memory_region_from_host(haddr, &offset);
> +
> +        if (mr) {
> +            memory_region_do_writeback(mr, offset, dline_size);
> +        }
> +    }
> +}


> +#ifndef CONFIG_USER_ONLY
> +    /* Data Cache clean instructions up to PoP */
> +    if (cpu_isar_feature(aa64_dcpop, cpu)) {

Am I correct understanding this is a TCG-only feature?


> +        define_one_arm_cp_reg(cpu, dcpop_reg);
> +
> +        if (cpu_isar_feature(aa64_dcpodp, cpu)) {
> +            define_one_arm_cp_reg(cpu, dcpodp_reg);
> +        }
> +    }
> +#endif /*CONFIG_USER_ONLY*/
>   #endif
>   
>       /*
