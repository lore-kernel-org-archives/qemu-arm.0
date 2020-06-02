Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp3583467lfc;
        Mon, 1 Jun 2020 17:37:47 -0700 (PDT)
X-Received: by 2002:a17:90b:897:: with SMTP id bj23mr2350114pjb.82.1591058267368;
        Mon, 01 Jun 2020 17:37:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591058267; cv=none;
        d=google.com; s=arc-20160816;
        b=vtz7yi0tWt23xJhP+cEldvdvOoMkIaWNhtZaFp3O9MRWhBEnl0HWfNzDoACIF2zyaz
         7dN6fsl6VcxVJa3JVQ1v+VDRH3nxXy+ZXqz0wQbAdKXjfoQ85QwYOAHYy+bXdPIzu/j7
         35vaHjY7iC55D7Kc/0ppRwmJE9ETh1JAw9E7jWHtVfCXwp6ykF5L7rsFY4oVAm8tcA7k
         U/fp/7MFJNX/6uKdLWDjkjZKpo5rSdka1G0tVXrkEVru3rKfxBewEvzb8NPTmrGG8tN0
         FGELgdt4KLVbgRo59JhaqTw9ga6tpfelAAp5L6uJUOELfrdtE9yUyFNLVaQdAuYvcvlR
         P4sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=dHv1+mBJymUru8raHPWEyEbhuB1uACIYgYiBMAk46qA=;
        b=W9SiYwDMUasfRroy4NUGsbkT7GLcdX/r9R4P/uZjkIM1NOjGJ2WtZ8auQUbgW5pa1b
         isRO/XUDqEoNhW9gdCn6jwm0BR9lyzzD65rCWpa0yF5irryx16hkmi58giSv+11FxLzL
         UDoAVl28OfeKLtUj2/rfQ44yRPFltFgMPEJ7uMgO8RptMMPPk/mLjXU9tQdV72H20qaU
         2RL2n6Fve/t5clYYQn5gf5TojXHy12ilgulZQDTOKQUfuzeLm40+QwR03duND5D9jT1k
         FPjJFVnsAHWFiuEGEod4DoFdfxFT9htWBFoEPhJ6dZbbwkgQTYJZzMBSJK88e3wCva0I
         hfEA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=B570lvj8;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id l4sor876879pgi.63.2020.06.01.17.37.47
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 01 Jun 2020 17:37:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=B570lvj8;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=dHv1+mBJymUru8raHPWEyEbhuB1uACIYgYiBMAk46qA=;
        b=B570lvj8PveTDIoodK9p+YHAy2HlsSQH+qJ6VjvSTS+oAKyQT+Kcpni7x7m26bwMx5
         xlsqPQ9W+D/p5E47qKhCQcl7LaOPw1NNOjlzObmcH/PRse+l1Mf9JTBYZT/YPTSZ6KKP
         eqRNNhhLLCr8uFZ+kSQf1RhHTd7L5W7ZsFiUqowZ4hLtfCc9qd3xvhPVUWe3GdDG0lXJ
         DYCMYDecv4hrrlPuYGzHPJzJoiMPDZQ8fE3OrDAQ5SFSmo6+6//f3YMIvZF5/zhzaHYX
         lApL+S7PAu4r6Maa1no7i2tj8zl0sFjEd7KKh6OyDLnSczs+ppzVt8h6kIqsH6MBapav
         vgVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=dHv1+mBJymUru8raHPWEyEbhuB1uACIYgYiBMAk46qA=;
        b=tI3sd3YZStzTgPmeXaAe7VOfyCjKkVt0g4gRjxxELpXjASyZ9qXuI39E/waG+8bUUM
         h95ZaCOo48nvzzk1ig4SloMh5wixq1iJEfKWP+LAeEnPUGSu1CB6YH5ItTgkZVX4xDS/
         EAvasVMlgdSwRTIUOcCCFCM8/NlePMmGNnvPPe8PTyKpY5r3BSeI+Pi1m5J2UVCTGyGi
         N7u/4fQewVTgzMq1oYDwtFDwOB2sWP99S/m1EatjXmdYza0TTASEhoChDsPWmd8uJ/qX
         HqZ6Dn9MgJasMH8Pbztt19kYyqv6LA0JbmVlDRTtkO4p+kT+4faX8VZRLC+i25fFOOte
         aAGg==
X-Gm-Message-State: AOAM531VugACEbVu9luMhzuExohO1PbyoNszu0wWzheXPpiNigPveene
	2IdubYofZjE5D9qKM9LTuWWrBFUw
X-Google-Smtp-Source: ABdhPJx1RH+yM1WJ9fan4fJ+hJfbGp+gOFf03pedskrxvK+PTw3YibTtjoerN21k8957vZZkZOro+w==
X-Received: by 2002:a63:6605:: with SMTP id a5mr20974818pgc.50.1591058266831;
        Mon, 01 Jun 2020 17:37:46 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
        by smtp.gmail.com with ESMTPSA id o21sm518660pfp.12.2020.06.01.17.37.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jun 2020 17:37:46 -0700 (PDT)
Subject: Re: [PATCH v1 1/3] linux-user: provide fallback pgd_find_hole for
 bare chroots
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Riku Voipio
 <riku.voipio@iki.fi>, qemu-arm@nongnu.org, Laurent Vivier <laurent@vivier.eu>
References: <20200527100546.29297-1-alex.bennee@linaro.org>
 <20200527100546.29297-2-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a3d126ad-8768-415d-d589-aa26b3136975@linaro.org>
Date: Mon, 1 Jun 2020 17:37:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200527100546.29297-2-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: 0rOVYXlZc7oJ

On 5/27/20 3:05 AM, Alex Bennée wrote:
> +static uintptr_t pgd_find_hole_fallback(uintptr_t guest_size, uintptr_t brk, long align)
> +{
> +    uintptr_t base;
> +
> +    /* Start at the bottom and work our way up */
> +    base = mmap_min_addr;
> +
> +    while (true) {
> +        uintptr_t align_start, end;
> +        align_start = ROUND_UP(base, align);
> +        end = align_start + guest_size;
> +
> +        /* if brk is anywhere in the range give ourselves some room to grow. */
> +        if (align_start <= brk && brk < end) {
> +            base += 16 * MiB;

You should skip the entire brk region with base = brk + 16 * MiB.

> +            base += qemu_host_page_size;

If align < qemu_host_page_size, then we'll try the same page multiple times.
Better as base = align_start + qemu_host_page_size.

Or even base = ROUND_UP(base, align) right at the beginning.


r~
