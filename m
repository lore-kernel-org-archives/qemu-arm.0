Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp3476048lfk;
        Sun, 12 Dec 2021 12:38:33 -0800 (PST)
X-Received: by 2002:a65:6145:: with SMTP id o5mr48904919pgv.134.1639341513717;
        Sun, 12 Dec 2021 12:38:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1639341513; cv=none;
        d=google.com; s=arc-20160816;
        b=xwhlOK5BciC/9ixQCS6h7igbBLKwfbgc3oZFFxJTheo5QiSVUpJcCVyKlQxguKG44S
         zZI3cct4s8eXWEfGJG7vMTAgCGXP8Z+mw3L/D5GT/J5EMEynqJMRbnNaiTCHZ630NtFU
         elEEnPaiF/ALduobKDwbDwZKwbI/Wu2vKnlmC1fjC1o+b2UZBRMEipBZ74eN0bPCHPGl
         JL0YDBVlZLPpWIr+4tCY5FEHlsWC0MvRrZtOPO4Zl5lE0ioFqxnfXrRzKeMzPdPzLPgm
         1BV4ZHzG5fyFNgG/6JcGv2pU1gQWYKEae6KtTSsEzN8Sb1L5UHcfbzsdp+rRABGYHjRs
         Sf8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=cvPvqo2FilxMBtkYK9T5V8F/Uou8nC0AK9u3IHB6g8A=;
        b=AkG9CKKR0lLt26CoPN/ulvPPbCyH6QaY0U4wDE6/gPMK/d74RcBZAaNOH3PIcdUrvc
         C9KSc9ru+Jn8KuuCDuNGk8Doq/BsnVilbYG2C8+3brmAM0DScPfy3MkL1MPYpzN2XhiU
         vdOopVnAux9GbIB0+wut7Gj805AEBv7lmthgPS7OKl81RcR7dJuuxRkqpo5nQr1FCbr5
         atB4fthWYL8RrSZhN7eQeBFfOBFcL+ppWWLndM/pQv6tGieFwo8MiJBkzoiNf0lGKubZ
         ZWpybGYwM9dpfoQ63eaVW/mg2YrYY2lsDi5ZZNSbnhxBfYlx5t1BhbBp9mdbJ/f64NC6
         ZKBg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kkiUJMGG;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id o13sor2101970pjs.26.2021.12.12.12.38.33
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 12 Dec 2021 12:38:33 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kkiUJMGG;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=cvPvqo2FilxMBtkYK9T5V8F/Uou8nC0AK9u3IHB6g8A=;
        b=kkiUJMGG4KsK5iH77Ld7ueXbkpPRKSkRMh22xKgJnMPQpdumN12e+fipfcg36gpe7A
         ijeSR8s6QfWl3Hb7cYXdt+lM0EIxW4kpUFSwVTmD2kZO4OMIBPqHckbMVY4FBmpRxuNR
         1y97ch4cn8eB1aFawXVV+HpOclupmpk2ssu7n9MkvtQ86cG2qD3myAdofe5vOJXOznM1
         tzMk6cgJVAk4yC7qUxI10ybdzbmVjERhTEGHawHhIisMAU7MiV145ApenifstHYATnoJ
         CPm2yh+s+YplOCUj+jlrmDtf3mcR41gxFeAqSHjwQEjCK2SkvZCx5SBnDsArvPvHM9NB
         bbww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=cvPvqo2FilxMBtkYK9T5V8F/Uou8nC0AK9u3IHB6g8A=;
        b=faUxh1XxtURie8gJAAlTk7ANIUKpurm0HIIXKcar0vrVqmbJAGAecikN162qBDF8eI
         HmsjeIjtSnyXioomU9QqIjdANKK2MWNUY/fYI5sQ7DZn3sXoaG7XYj4tfBO4pcKOF3N0
         XrzEaDwsX0pcV/hjZlBmDKyopBXWkybDO6RE8TPvJdvw33xr+qoJIFMvWdBao5Ft3zfg
         +qWpl0eXCcyVVjoFc9qNFC6SQFhe3I+s08LXeFTVkTd7q+XbboSvDcODTnBuTkFx8uRZ
         WyDiVwbELibqzi/NJkngY4dkuZ3TsZBChG0lc/C4jNJSrnc+3aWg7+UAe4XEJ5DwniZq
         cL0Q==
X-Gm-Message-State: AOAM5314iSHvnCO15xXuZsYWpINheo+os1EK6GUp+lqfbgL4l+Vzgu9I
	MpWnPJ5mcoSSoLZYp+EXJs9M75ao7KFq7u1m
X-Google-Smtp-Source: ABdhPJyQhNz5vAw9SjVv1lAHurrZ8mjzAkTuSdI2ZgchxrYCsgHRhb3E9pglGq2TVe6L6eAcy3itEQ==
X-Received: by 2002:a17:90a:e7d1:: with SMTP id kb17mr39329507pjb.124.1639341513285;
        Sun, 12 Dec 2021 12:38:33 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
        by smtp.gmail.com with ESMTPSA id oj11sm4825150pjb.46.2021.12.12.12.38.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Dec 2021 12:38:32 -0800 (PST)
Subject: Re: [PATCH 15/26] hw/intc/arm_gicv3_its: Rename max_l2_entries to
 num_l2_entries
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
 <20211211191135.1764649-16-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1f080d8e-b1a2-f6f8-1871-48f38f603075@linaro.org>
Date: Sun, 12 Dec 2021 12:38:31 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211211191135.1764649-16-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: 9OsnxZPeFQpG

On 12/11/21 11:11 AM, Peter Maydell wrote:
> In several places we have a local variable max_l2_entries which is
> the number of entries which will fit in a level 2 table.  The
> calculations done on this value are correct; rename it to
> num_l2_entries to fit the convention we're using in this code.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gicv3_its.c | 24 ++++++++++++------------
>   1 file changed, 12 insertions(+), 12 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
