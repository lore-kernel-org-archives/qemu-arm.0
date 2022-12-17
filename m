Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp1810338ejb;
        Fri, 16 Dec 2022 16:20:12 -0800 (PST)
X-Received: by 2002:a17:90a:f598:b0:218:f15f:4b41 with SMTP id ct24-20020a17090af59800b00218f15f4b41mr35173203pjb.27.1671236412099;
        Fri, 16 Dec 2022 16:20:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671236412; cv=none;
        d=google.com; s=arc-20160816;
        b=a//k3b066k/NGgbEDfvLYanqkEPI5UknfhJE8j7I748kjfjKJ+RA8cClNpJOkT5wjA
         JbhKZZM1nPd/gt+X4rNao0r1NwyGiHCmtN7sb45g01oNjp/gSVJfWWwntcy8CYKxWbNp
         NNiIULlipWHlohSSvi5hfmwUgFsevjCubqLD60O0sACjYp97mlU3JY12TjLiA7f28Kvw
         QvUHUPCXwHrE6XDcOISbnqB1E2qdzmAGfK7PQ7sdvm8VH/XlNgzQA2HUXA+qwNPyyyZY
         WWHe64c7j3XaTggaNr7QdVmJ1u0pGF0IXIqPwTWhY5KS29mrTfi8YuRSrDfLF2LQkpMU
         QD/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=w4v6UAzNL7fLzZHUFzW0vIVYiaqNZJRG4q5yNQ0pM+I=;
        b=Wf/PZOTX5cmrt4XhaUYUiC6c7l/1pXWwyfqsL7jOxwJwYSnKmFsXpMI1sWjAaEyQs0
         d6j0KHNULt9TX/AOw6vrgL0NqCgyT3z8qXZfwdK8VtNNZLhv7NcdVHaw5z6v5hSVlAM4
         lSpNl7Jurg2M/ukGOPiDvLqng+0CDKiOorR7l4nXRiZe+lgvuM+pPRsr6Bdy1u3ATghl
         XM1eHuu3/K95YroAD2/eZX2WSJoZFPpXRhZeRXbWM3Cgx41s5cq1uV/H9UD5xj8yT5fv
         OPwl1Ox75N5UAWRNXPwgFPjYQnqp1N3K/oXOe05Jsu7q4NvIVoT+sOGBfA65dZmMMoLj
         Y6PQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Q/c2aXvh";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id g7-20020a17090a300700b00219440ce278sor1555979pjb.15.2022.12.16.16.20.11
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 16 Dec 2022 16:20:12 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Q/c2aXvh";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w4v6UAzNL7fLzZHUFzW0vIVYiaqNZJRG4q5yNQ0pM+I=;
        b=Q/c2aXvh6xVtHFXVzoyTAz/MOEKf+w0kq2tDJyb+7qgjyhYdMHZ4MfPOynJ0BXYVh8
         lHOK31U9EA/zxeKBIZQNZhkGjt35abIZ+yCRGXSGQ6Dp7Lg5qPMJV5lowBQ4Dt9T2/I5
         jkXKgTd+9E/NG/XnpbI5n14dXHX73Ms67HLT5jSki0nCYFQUVs0IQrbbSkWyno9Jbvfs
         qQz1IlK6phWyT57pUxmLaZDPShHaUZITEs1EuZupcINggKNaFksVGXVuPxOAEFzwnJCB
         X45slcRbx2+X/xPQsEWAhOlvk5eG3PABPZeNfadx48NPjPG0TvV+5sO45geYkBqOAcph
         lQaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w4v6UAzNL7fLzZHUFzW0vIVYiaqNZJRG4q5yNQ0pM+I=;
        b=zJgs/BUfHFeOHD8JoSjQZsQzs1DKnLzXNU+J+xphY5xUmGlNQSJpfN8jVeTeFd2HdQ
         aVyHp4y5hZ7XInfE7QYR5y0IjGwOssL3ju7fBnRwROFNeqxPLLt+UnNT1UPgNrNfBkdT
         deZ7cpgy48CAeDYUwFaWGZJIhD7uow0wJ/NzTmkTnNhnC2Lz7QuRdsFupl9B8ELYoQtM
         iP9kw9wgso+lfPkPxXYfzyD3itsFclZze5Szgasbv/wJwnarvuFUzp+cLlRJF55wgZre
         YxqMk6nrimFCdDkBduEJfR3TXqsdUXFOYBb73pTJXEt54fFaUl0Bhqp9jukVB8/M2jfp
         x4VA==
X-Gm-Message-State: ANoB5pmWg0yGQx/0hIc0QOvSBY0d4R4gjBXY8HFeDVQP/fY6MKfbNWhw
	TclGAF5Z2l0bekrdn6nIS3CQc0Tm
X-Google-Smtp-Source: AA0mqf5ShgSuD9po5MbdLX0IkXQc+2BFv3/C1Y/ewrtY0Zr41J3QZe+CqgrbNUUoBPGFuWp6Udw3Zg==
X-Received: by 2002:a17:90a:9b0b:b0:219:28b7:c580 with SMTP id f11-20020a17090a9b0b00b0021928b7c580mr34584859pjp.22.1671236411531;
        Fri, 16 Dec 2022 16:20:11 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from ?IPV6:2602:47:d48c:8101:c606:9489:98df:6a3b? ([2602:47:d48c:8101:c606:9489:98df:6a3b])
        by smtp.gmail.com with ESMTPSA id f61-20020a17090a704300b00218fb211778sm5339354pjk.41.2022.12.16.16.20.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Dec 2022 16:20:10 -0800 (PST)
Message-ID: <42c455aa-c93f-9167-59ef-ddf2b46ca2e4@linaro.org>
Date: Fri, 16 Dec 2022 16:20:09 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 5/5] target/arm: only perform TCG cpu and machine inits if
 TCG enabled
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>
References: <20221216212944.28229-1-farosas@suse.de>
 <20221216212944.28229-6-farosas@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221216212944.28229-6-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: Zh/mw01Xif1Z

On 12/16/22 13:29, Fabiano Rosas wrote:
> -    /*
> -     * Misaligned thumb pc is architecturally impossible.
> -     * We have an assert in thumb_tr_translate_insn to verify this.
> -     * Fail an incoming migrate to avoid this assert.
> -     */
> -    if (!is_a64(env) && env->thumb && (env->regs[15] & 1)) {
> -        return -1;
> -    }
> +        /*
> +         * Misaligned thumb pc is architecturally impossible.
> +         * We have an assert in thumb_tr_translate_insn to verify this.
> +         * Fail an incoming migrate to avoid this assert.
> +         */
> +        if (!is_a64(env) && env->thumb && (env->regs[15] & 1)) {
> +            return -1;
> +        }

This is a sanity check rejecting malformed vmsave.  While hw virt won't have the same 
assert as mentioned in the comment, it won't be happy and will raise some sort of cpu 
exception later.  I think it's better to reject the bad vmload early.  I suppose we could 
expand the comment to that effect, so that it doesn't appear to be wholly tcg inspired.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
