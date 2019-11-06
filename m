Received: by 2002:adf:db01:0:0:0:0:0 with SMTP id s1csp683616wri;
        Wed, 6 Nov 2019 04:20:04 -0800 (PST)
X-Received: by 2002:a5d:4d0f:: with SMTP id z15mr2313621wrt.195.1573042804237;
        Wed, 06 Nov 2019 04:20:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1573042804; cv=none;
        d=google.com; s=arc-20160816;
        b=nzFnJzxy6yPtQimCiXbBQk8jwCzOLY/DC/yOPY1LLoxIBljcjf71FjwIZ+79K7O/F3
         ZxFuvsGzrMDcKnbaDM+VbC7F8gbjuGpcOupFTmeZnBfitm95LMDWYUtax2iYLyHUy8RA
         gnlgt80t9U79TdSiJ3/CrEtUsCfO+EJ6n+y1K0q/+GxLs8zykpQAylJj0u2YlY/2S7oq
         8kbdV71Khi3MGcjoi/OwsORwN1HsYa/MjqMyJlcm8iBj68YNuQsdiagOeeigZFDOitBW
         hacvh6UkpWrZQCqLwVwnA0HNPtL5QiGv1nP+7yXSk/qfC+KkPVMPAft4vRM8Y4koD74u
         gYBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=RpgoQPK/LIDerO7lJEQ4U9SYduXiB2Zh7dzR1O0Iln0=;
        b=AHReqkjtSN/cz39ui/EXT8knnN2sKDEgw5lIvXF7EMN13iYhSoCkjJtePYD0b28ykm
         fzGp519t4X75h16KEx3HTG5jRo/gvZmoUayFv0v9I3cAHNps2jmauCbJ0e7awZ/iYe0l
         KggbT80Z4hSOdph2sXREH6Z3x6xYuSbbG4qKJt4N33XP9wcaOWqZXBtV2rDx1ZuVzx1R
         0WdpNzhKL4URBX/Mz0osG6smtCWbqhs6Kvw6zAgRhVrz+/+aILdYCtjDZBM8WqdCV3DZ
         vUU4ixnYo5gdeNoKpSjcUNCtWM4tIAij6ojhcNC88/EW74wHQ8llhCpeiWMA+bok0izZ
         WXQQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=htqJc+6b;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id z22sor1783312wml.11.2019.11.06.04.20.04
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 06 Nov 2019 04:20:04 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=htqJc+6b;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=RpgoQPK/LIDerO7lJEQ4U9SYduXiB2Zh7dzR1O0Iln0=;
        b=htqJc+6bldWKqzELJgsZtN7whFCVs7FF1pQeQgQkxhD9vhr41lA0i92w5eXrHyDX0v
         UgXIKW/pB0ma+i6/ZlDj51IKIAj1jUguoL7r7xqBpkBtdr7ZhoKgYVnLsNVsw///wwac
         kqfCIhG63FPxt6EEplOqzaTD/8H30JC/5TVdEH1/agwDwzXVJHnUU9W2KdiV29x9YXP/
         RC74yd5Tb+G5DzViPKv3htYVsPOvqF5wRxLLcgul8xss2iJ1eS+9VX5eYoEOXzE2q/VZ
         3vQVL53+uPcakZkyhtlf7iHa9R5YpPjvOx+g1TSBMI6DJXt5nngH3NKadLYRRkyNcj9s
         Y92g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=RpgoQPK/LIDerO7lJEQ4U9SYduXiB2Zh7dzR1O0Iln0=;
        b=aEA7mqJmICyHBmcbmoH/EV8mI0ZeQo4t3T5etnAQJWt149TQGMHS3twSzma+U1eJTg
         ueTxuI4+YYJBA52Ml87CVHFRMPp0InuEeswaGgzt0WqJp8DP9UMmZRSatj3XDptBKgil
         hOTR86Z32lrZiINXBCNUbeH84VXiflNL82xxPwqUnlyRaMzJU48OS4WJlgsIqn9bjTe3
         0N6+sQorjd+ENI9UUaZYhvej9upyxqgjpztfVf9sqxteCl+A0AhIU00lPwymIpfD3Cv8
         gFLu3hScmgTzUcsHUgLjbROoxUi0wN/YLdDxLfZg8xVjaU2rFT5weEXgmpAeTPSaGT0k
         y4TQ==
X-Gm-Message-State: APjAAAUoobdWL/p62LzKPCZ3WdY/ZWLYssAxlqq11brGUdG83lA7aW3F
	aVBZ80ZdEik0rV39m/6wKIN8UaEM
X-Google-Smtp-Source: APXvYqzroIhHkQSdGLo6acutV3vLksrRmQeHFLbXl0uC87zPIgBoz3VIDgdpv2lCs7HFkt2fKb+D7Q==
X-Received: by 2002:a1c:9ccd:: with SMTP id f196mr2247964wme.152.1573042803847;
        Wed, 06 Nov 2019 04:20:03 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.8.102] (31.red-176-87-122.dynamicip.rima-tde.net. [176.87.122.31])
        by smtp.gmail.com with ESMTPSA id i3sm24118569wrw.69.2019.11.06.04.20.01
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 06 Nov 2019 04:20:03 -0800 (PST)
Subject: Re: [PATCH v2 2/4] Memory: Enable writeback for given memory region
To: Beata Michalska <beata.michalska@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org, alex.bennee@linaro.org,
 pbonzini@redhat.com, quintela@redhat.com, dgilbert@redhat.com,
 eric.auger@redhat.com, shameerali.kolothum.thodi@huawei.com
References: <20191105234100.22052-1-beata.michalska@linaro.org>
 <20191105234100.22052-3-beata.michalska@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <5c75bd31-213f-88a4-2eee-0046f99f65fe@linaro.org>
Date: Wed, 6 Nov 2019 13:19:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191105234100.22052-3-beata.michalska@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: 3gqocRoEUs+b

On 11/6/19 12:40 AM, Beata Michalska wrote:
> +void qemu_ram_writeback(RAMBlock *block, ram_addr_t start, ram_addr_t length)
> +{
> +    void *addr = ramblock_ptr(block, start);
> +
> +    /*
> +     * The requested range might spread up to the very end of the block
> +     */
> +    if ((start + length) > block->used_length) {
> +        qemu_log("%s: sync range outside the block boundaries: "
> +                     "start: " RAM_ADDR_FMT " length: " RAM_ADDR_FMT
> +                     " block length: " RAM_ADDR_FMT " Narrowing down ..." ,
> +                     __func__, start, length, block->used_length);
> +        length = block->used_length - start;
> +    }

qemu_log_mask w/ GUEST_ERROR?  How do we expect the length to overflow?

> +#ifdef CONFIG_LIBPMEM
> +    /* The lack of support for pmem should not block the sync */
> +    if (ramblock_is_pmem(block)) {
> +        pmem_persist(addr, length);
> +    } else
> +#endif

Perhaps better to return out of that if block than have the dangling else.

> +/**
> + * Sync changes made to the memory mapped file back to the backing
> + * storage. For POSIX compliant systems this will simply fallback
> + * to regular msync call (thus the required alignment). Otherwise
> + * it will trigger whole file sync (including the metadata case
> + * there is no support to skip that otherwise)
> + *
> + * @addr   - start of the memory area to be synced
> + * @length - length of the are to be synced
> + * @align  - alignment (expected to be PAGE_SIZE)
> + * @fd     - file descriptor for the file to be synced
> + *           (mandatory only for POSIX non-compliant systems)
> + */
> +int qemu_msync(void *addr, size_t length, size_t align, int fd)
> +{
> +#ifdef CONFIG_POSIX
> +    size_t align_mask;
> +
> +    /* Bare minimum of sanity checks on the alignment */
> +    /* The start address needs to be a multiple of PAGE_SIZE */
> +    align = MAX(align, qemu_real_host_page_size);
> +    align_mask = ~(qemu_real_host_page_size - 1);
> +    align = (align + ~align_mask) & align_mask;
> +
> +    align_mask = ~(align - 1);

I don't understand what you're trying to do with align.

You pass in qemu_host_page_size from the one caller, and then adjust it for
qemu_real_host_page_size?

Why pass in anything at all, and just use qemu_real_host_page_mask?

> +    /**
> +     * There are no strict reqs as per the length of mapping
> +     * to be synced. Still the length needs to follow the address
> +     * alignment changes. Additionally - round the size to the multiple
> +     * of requested alignment (expected as PAGE_SIZE)
> +     */
> +    length += ((uintptr_t)addr & (align - 1));
> +    length = (length + ~align_mask) & align_mask;
> +
> +    addr = (void *)((uintptr_t)addr & align_mask);
> +
> +    return msync(addr, length, MS_SYNC);
> +#else /* CONFIG_POSIX */
> +    /**
> +     * Perform the sync based on the file descriptor
> +     * The sync range will most probably be wider than the one
> +     * requested - but it will still get the job done
> +     */
> +    return qemu_fdatasync(fd);
> +#endif /* CONFIG_POSIX */
> +}


r~
