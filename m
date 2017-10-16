Received: by 10.223.197.9 with SMTP id q9csp3883902wrf;
        Mon, 16 Oct 2017 13:10:22 -0700 (PDT)
X-Received: by 10.159.197.73 with SMTP id d9mr9772330plo.415.1508184621956;
        Mon, 16 Oct 2017 13:10:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508184621; cv=none;
        d=google.com; s=arc-20160816;
        b=omsFWr4ZAFByM3K+JoaTOjmiWnySMyG1vxKiM0uvjG9GrwufbaKDBE8ssNbQWb1Xvv
         WX0OYTOlx5TI6iHafT59Gxe9LGii3a7qJ4awb1QVix2h5K6vJtWEJpIIYG9MNPGxH06G
         lyHwWuNtrdfrmTpRfNrGzcmf0MDN5EjSGJuJc3lnE3Rc3S781U3UUOUXJL5Rosm15mo/
         mzQt1smaqrcU7QWxLyQJi3+rgwrUCBPgA9BOOIdR36gHWAsoufdp2pAs9frYpRktxSu/
         PCeDQeqqdMZGpYAkMmTE+4MqQGR0ajWaLQxrGuej/944OYo2gNRFvK5B5m9j/tuEOfoU
         Fihg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature:arc-authentication-results;
        bh=ObqBv66cePDz9Kjp5bwDaARknJ2rfJejrs2IU9tem50=;
        b=g+LKhshbb1CY+00T4iyxawRe/3bSKmWoeyNcrZRg4mh2K8Sv/AeLorn8ITB/4j0L+E
         0rNz+pjXd4Pl3uztBxgSmTl/GyvJ1AOheN12giHeryNgeqkb2BBJ5Ui4jgifVK+Qp/vm
         eF5LGI92BsmiVBxSV+cFZ0fiHDjURAlTQSmmxu2kFGiCUYGqdqyPamFxJ8+IUJvpOR5U
         /XM/zLK3a5OiSm/O9LI57od9YrdK7WVigkYX6K7RBbudo8NNZOLgbpGkP/skcNm4gA94
         N0M7X5wFyMNhaD06QzZmu4xnNiqXSz6KWWP1zt73RtSJ1v1IIpEOewPC+BGJw1oLau0M
         3x2g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=A5PfokOT;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id l5sor1752779pli.125.2017.10.16.13.10.21
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 16 Oct 2017 13:10:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=A5PfokOT;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ObqBv66cePDz9Kjp5bwDaARknJ2rfJejrs2IU9tem50=;
        b=A5PfokOTNeGusso7NdSmu8l/vsfNp/jCPRSb1gcB9I/TMaeZPOgF2TXM5uT3a4A2Kr
         MyP+rZlYXQZNTad0C8UjqTVtMksJXMtiNiZg0NZzdX91YhaY9mSu6+PmSgrxADsUnl1k
         0ryM/9xEveqZR0WkGJhl1hfpLypgMWViJtyHY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ObqBv66cePDz9Kjp5bwDaARknJ2rfJejrs2IU9tem50=;
        b=piU6J5n9NVkztnjSUSsIJW1y6DO1bpE4G4ImTm7IB44Gh2OIS5i47I9zFdIbFB++Ko
         MSA5u0FW01TPszikFK1YBmwP/4LYsdOuRLZj7dQuxocc29U9wISrCzFa/SR2GSQOnnd8
         99sjJSmfG4dnRXn84mo0q+jXdYrppXm3XNnFPPbYSPwzsJn1W68dkIYrklhZ4zM7M6kR
         baMKATmbQyobfsOS8kjo7EKdD+HE1t9Gq2ABaJoH+zU+LQKkIgjuI5fkLqoY+/uh6Fz5
         6oVPtJ5oN9czfAFoM7/3iOa89hSqNAUteyKaNbAVJKT+HKthON+daf16STTv1kdY3CO+
         kp5w==
X-Gm-Message-State: AMCzsaU8Fth8BnNIURLRrzIG/6aBvNIdAhtXh4yQfzdKnO4BRJGcsJEx
	jR6TG7Z+VvqXFJy2sa4zY7cvaFCQ
X-Google-Smtp-Source: AOwi7QCeBOhvh3+XSxIJ6PgWpGOCkXKHt58s2d9E2e9rVu6+1aiXrGNZb55l/Q+S8WfO1wRGTUs9jA==
X-Received: by 10.159.253.142 with SMTP id q14mr9918202pls.82.1508184621486;
        Mon, 16 Oct 2017 13:10:21 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from cloudburst.twiddle.net (97-126-104-76.tukw.qwest.net. [97.126.104.76])
        by smtp.gmail.com with ESMTPSA id 77sm17494915pfl.133.2017.10.16.13.10.19
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Oct 2017 13:10:20 -0700 (PDT)
Subject: Re: [RFC PATCH 11/30] target/arm: implement half-precision
 F(MIN|MAX)(V|NMV)
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20171013162438.32458-1-alex.bennee@linaro.org>
 <20171013162438.32458-12-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d1091101-7397-54a6-70b9-8c46df86a3a2@linaro.org>
Date: Mon, 16 Oct 2017 13:10:18 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20171013162438.32458-12-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: 0+LpUX//hz86

On 10/13/2017 09:24 AM, Alex Bennée wrote:
> +/*
> + * do_reduction_op helper
> + *
> + * This mirrors the Reduce() pseudocode in the ARM ARM. It is
> + * important for correct NaN propagation that we do these
> + * operations in exactly the order specified by the pseudocode.
> + *
> + * This is a recursive function, TCG temps should be freed by the
> + * calling function once it is done with the values.
> + */
> +static TCGv_i32 do_reduction_op(DisasContext *s, int fpopcode, int rn,
> +                                int esize, int size, int vmap, TCGv_ptr fpst)
> +{
> +    if (esize == size) {
> +        int element;
> +        TCGMemOp msize = esize == 16 ? MO_16 : MO_32;
> +        TCGv_i32 tcg_elem;
> +
> +        /* We should have one register left here */
> +        assert(ctpop8(vmap) == 1);

I think you should match the ctpop to the size of vmap.  It's true you only
need uint8_t at present, so maybe use that?  At least it's self-consistent.

> +        tcg_hi = do_reduction_op(s, fpopcode, rn, esize, bits, vmap_hi, fpst);
> +        tcg_lo = do_reduction_op(s, fpopcode, rn, esize, bits, vmap_lo, fpst);
> +        tcg_res = tcg_temp_new_i32();

You can re-use one of the two inputs for the output, fwiw.

> +        /* Bit 1 of size field encodes min vs max and the actual size
> +         * depends on the encoding of the U bit. If not set (and FP16
> +         * enabled) then we do half-precision float instead of single
> +         * precision.
>           */
>          is_min = extract32(size, 1, 1);
>          is_fp = true;
> -        size = 2;
> +        if (!is_u && arm_dc_feature(s, ARM_FEATURE_V8_FP16)) {
> +            size = 1;

You do still need to check size[0] == 0.


r~
