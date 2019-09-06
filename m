Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp767082wrp;
        Fri, 6 Sep 2019 07:24:48 -0700 (PDT)
X-Received: by 2002:a9d:5614:: with SMTP id e20mr7575172oti.148.1567779888235;
        Fri, 06 Sep 2019 07:24:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567779888; cv=none;
        d=google.com; s=arc-20160816;
        b=nrmDQVCF6/lMesY7auxBA0c4l2osT3xCImlixvcXpTx4haQwMWquQTXB82mssJvA5D
         ROOSW0UVKUkPxQ/65FWNTg5YGgeu8HQ7ODt+tUcSmjfrp+Gf35VU0c+ewszqXSZ88tGi
         M3U52+XkxG42ewqDaxXCaaj6p/3/El2lrbVpoK1YNwvpglF0Uh6/yBS+yCbzNfrLjYl9
         paPe1ZjDDDxewMyVZ5KQpwD2TBCkH4DrKL4tUDTuuCQ1P6gO+vLCC6JB/VlfhyySivaz
         zybmXknxl22g0d3P5cIzOM5mrwL6jbtsD6y+/v75eWNqcnwG8TPJtwh+27Ja/uKbNok0
         S6Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=lMiKSI/KiLROMZfuon/38GGDt/xmvodhfW5MQY62FPg=;
        b=pyryphj1phS4M+1QaXIuDC6SwaLEdUGFLj1IUnMx23DNa7r9TvL6o2EDt5RjKetSPX
         SYcD6Aj0u89kIct2y0pLnLEgIJhhCvw21kacWRBBsQ9rskeZ90D0ztenY4P71MkUcGeW
         T2OdZtFd8Cb6Ym6yWuYwJnSMGD8/oLZZf5gbblR4m1lsHc99Yk0iKhBFGrpE8ND3MUnM
         v9tWobalV9C/h44OGFg04Y96HbGV9FYUJH8ChbpfrnYAnS4jUfR9ifTDkj3MBE+WIf9R
         AeUv6D7jq6J1XM8HnrUopSVe5jsJW+hvW8BF/eLrAli55bXPvm3fc7hP55wOyPw2jOZC
         Ubag==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="FKn/l5zP";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id w11sor771947iot.92.2019.09.06.07.24.48
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 06 Sep 2019 07:24:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="FKn/l5zP";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=lMiKSI/KiLROMZfuon/38GGDt/xmvodhfW5MQY62FPg=;
        b=FKn/l5zPCBj+sVhLGMtqztILxVclX8WcdF4vme2+SKV93yJkbD5qhWMwX28GYR8jld
         3+PunhZdFOhHCP40mVxlcYKrQRQYyWzzHxBTGRnTNa7T8OA80+Wi6TZXh+9vynGODNoD
         FOR3TfZYqTzFwI/ULLZj/x2fwYIDtIz3R96eCTdLqu960OY5geI/pDS6LcK8iCqJft9y
         3Kg/HaBqndl4w4du9NA7Opgnckk/i6eBDm/UD0nsSvwxMtbPSeRzHU8eSbJ0PzqYlJun
         lbhZqnHmM/V6Qd1y+qm7IfBnKjym0SoHv6cu22ZjOIaKGPbA3liv/W/kHWzf6qoCsoOt
         wZjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=lMiKSI/KiLROMZfuon/38GGDt/xmvodhfW5MQY62FPg=;
        b=mVaKbBN4IZPzV9EGKPcsDvH0iNrlt98XD40iMG9z5Xk/VWj5tCE2UsldEmq1+be+//
         aoHbFRK8kKblbDDPUrj2NwvOzkSSvirl/BO6PdjIxfTxpczwGgoAmjGhAqNkvDKlqwws
         HLOtsxryH2cW0vT38rq8zp5IUFbIjrzY2GSkyq/aP0zfY3y8fKzG2ObPFYec2XGFuVfz
         43uQDAeiLfHGqaPZ3ccHGI5GZbmHxUc7YGnKh6mBae3zSYKlBi1FEpztlTtWrRX77t3N
         KhRY+DhcSmSlHbIS+sKqfvDU8CB++sClW1+MbwLL3mNCDsZabtw7ezMeVOJISFRVHHGb
         hfQw==
X-Gm-Message-State: APjAAAXf3MLXvBHTR/su/NaSWWYPpFZu4Y7uomyymQWVOgB9Fzo8pPV4
	EDOqBIpqm8gDrXeeOa9PuGA3q3W2Lkmq0PDK
X-Google-Smtp-Source: APXvYqzkltsPHA/f1mwT+GjKCYyNcxxhpk9oyDlnj4q7Vgdgm9OKo3BajFQwEod83Qq5DUb2Ba39Kg==
X-Received: by 2002:a02:a806:: with SMTP id f6mr8515311jaj.135.1567779887695;
        Fri, 06 Sep 2019 07:24:47 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from ?IPv6:2607:fea8:a260:81:78cf:74ad:c2b2:73ef? ([2607:fea8:a260:81:78cf:74ad:c2b2:73ef])
        by smtp.gmail.com with ESMTPSA id s201sm11183569ios.83.2019.09.06.07.24.46
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 06 Sep 2019 07:24:46 -0700 (PDT)
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH v5 02/17] target/arm: Split out
 rebuild_hflags_a64
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org
References: <20190820210720.18976-1-richard.henderson@linaro.org>
 <20190820210720.18976-3-richard.henderson@linaro.org>
 <875zm692za.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <f8112d1c-49f4-9e90-bbc2-280d91e8d8fc@linaro.org>
Date: Thu, 5 Sep 2019 23:26:19 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <875zm692za.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: BuDrz/i1tv44

On 9/5/19 11:28 AM, Alex Bennée wrote:
>> -
>> -        if (cpu_isar_feature(aa64_bti, cpu)) {
>> -            /* Note that SCTLR_EL[23].BT == SCTLR_BT1.  */
>> -            if (sctlr & (current_el == 0 ? SCTLR_BT0 : SCTLR_BT1)) {
>> -                flags = FIELD_DP32(flags, TBFLAG_A64, BT, 1);
>> -            }
>> +        flags = rebuild_hflags_a64(env, current_el, fp_el, mmu_idx);
>> +        if (cpu_isar_feature(aa64_bti, env_archcpu(env))) {
>>              flags = FIELD_DP32(flags, TBFLAG_A64, BTYPE, env->btype);
> 
> It seems off to only hoist part of the BTI flag check into the helper,
> was it just missed or is there a reason? If so it could probably do with
> an additional comment.

The part of the bti stuff that is hoisted is solely based on system registers.
 The BTYPE field is in PSTATE and is a very different kind of animal -- in
particular, it is not set by MSR.

But also, comments in cpu.h say which fields are (not) cached in hflags, and
BTYPE is so documented.

Is your proposed comment really helpful here going forward, or do you just
think it's weird reviewing this patch, since not all BTI is treated the same
after the patch?


r~
