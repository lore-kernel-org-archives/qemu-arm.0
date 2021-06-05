Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp2264413lfa;
        Sat, 5 Jun 2021 13:59:16 -0700 (PDT)
X-Received: by 2002:a05:6a00:88a:b029:261:6d37:dac6 with SMTP id q10-20020a056a00088ab02902616d37dac6mr10744851pfj.18.1622926755932;
        Sat, 05 Jun 2021 13:59:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622926755; cv=none;
        d=google.com; s=arc-20160816;
        b=XsZABpCKC6if2uh0Lb5TKNZdZk6NC8diFPSJPnG5yorSyoEfIkl8f/Et8R4Bp5cAGq
         Ol0h/2XSSEb3s1/iERZlO31CgFulA4JFQX//U8MPcVb8T1YomXEaZHg+EKGiIi1yCIPP
         AhYKqvUPXO2hX8tqyfuh+KyOTCi6qsIazQMO/BDjt4H03TBurlS2ZVNGblyMQBN95gfG
         DGO6Zz2Cr1sUReZQy3pgCis1Hs8V+15iCqyXFU9Hcg5rDs9KbSmlGMG+VArDBn03FMei
         eStazuItwvroon/tal6V4fvJcprdX4tLgAz2oabt7DoFwYEOFxL1f8niZESzafRIpZ1S
         BPUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=/8zyniDS8Fte2L4G45XLny30uhcnZm07GDsWx6TuVZA=;
        b=q/JPGcCxKxf6GS3D9dLzMIP6D2+4ePYWreo+wYWQeeSyzwP1sVOjyV285dQSzPNpO6
         ieGGsseFCtuDsmgkPlDjEmqJjwb9FriUDtrbsS6HVy85L3nu53YPDJIAbRuym1YnCUoH
         jzGZcQZjNsMVuNGrjfVybRQC9ui9CnV6tz0+eTdYZZ7josLVSrKoeLjfkpLF7Ow0iuwy
         K24SkTQiQSyxQUG6QHbiF2XKa7AVh22KMSARuSH1pf+JVYbQ+WCIKFBsMj5TqGw0lSwg
         aeJdFck7y/euOF+b3Ca7rvh24nca5nL3HC9D3pOgJODf7N1MCXPU96/atKviGKVwtHtW
         wd6w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FYdr1Kir;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id y192sor3035586pfg.31.2021.06.05.13.59.15
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 05 Jun 2021 13:59:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FYdr1Kir;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=/8zyniDS8Fte2L4G45XLny30uhcnZm07GDsWx6TuVZA=;
        b=FYdr1KirP3dPDAYKzxvYmSAhOzdfx+TRclgAHFZFlTGaK8uffCGL6wRdFLs8Z64vBz
         dw4x81wNsB56l/RrEKKS17ulIPpUUFmiv7iHpTB7w7Qy3MQkIPtApLCQo/dTo5tsATXm
         CXRZNO5anFatI+hRkXqrLOBnV33FyZXNo+tYkt1xNDpmmvyYksHeOfpRNAEqOB6kedf3
         Nc70rXARCmYoY7Nl4xtQ2xL+w/UagWVP0YSB6sOpNAEizd5wonAjUjQmaeSVNEuYt1hp
         u2xz/Sb4XriWBzOh+84SH0pgcezbPEeqQHoDRQcBo2UQ9aQTgByVA+jRlf50qOGGl5X7
         sKsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=/8zyniDS8Fte2L4G45XLny30uhcnZm07GDsWx6TuVZA=;
        b=kid6ArKHpjgEVmygGhnLnosvzhJWS6noQfPEehDylgOFzTOKB1eKolBjKZK8XRQpcq
         /skSlaha2cJqO4VHToO0AEx9Q2vx/OLjXgvRjHRl7zNEu6sUNWnH1PuFs/9dxccqenHc
         4R6XzFqiOqPTNNVgsKhbzl6vZu5XMo1Yo0sQDUBroZbUzJu2oXtKJ9XVZNI+As4SIkxR
         YC9daXGynzJwd4WURP7UsC8HnWzeWxWm/FKwjqUIo10ehS+xTXK5FEwxSjEnz5AwLn+1
         hwqt4nMqBgClUHTT4rp9J44zXls8XenEXsL97KAW/tLEAN2M3rV1pS4RX63tB9Wnp+mz
         ksqw==
X-Gm-Message-State: AOAM533cDrYJAVxkUgRgnoBWaITA6OiEC6NMGiLKfGyRHDSOji2aV4l9
	yT2CfjSdKDZtbf79n5iHfV3Qmhmv
X-Google-Smtp-Source: ABdhPJztcnWc28SOECgepOlA9ho6pepYVrzQE8jfpXXMWuoO/65GxFUb0Vq4t8LqfnmsPHmwc+sn8w==
X-Received: by 2002:a05:6a00:1630:b029:2c0:a1eb:d77 with SMTP id e16-20020a056a001630b02902c0a1eb0d77mr10532297pfc.81.1622926755516;
        Sat, 05 Jun 2021 13:59:15 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
        by smtp.gmail.com with ESMTPSA id br14sm7468846pjb.41.2021.06.05.13.59.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Jun 2021 13:59:15 -0700 (PDT)
Subject: Re: [PATCH v16 79/99] target/arm: tcg: restrict ZCR cpregs to
 TARGET_AARCH64
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Claudio Fontana <cfontana@suse.de>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-80-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f1dd8e73-654c-3e50-5443-a216ead17ce7@linaro.org>
Date: Sat, 5 Jun 2021 13:59:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210604155312.15902-80-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: hbVCrfpuN6ES

On 6/4/21 8:52 AM, Alex Bennée wrote:
> From: Claudio Fontana<cfontana@suse.de>
> 
> restrict zcr_el1, zcr_el2, zcr_no_el2, zcr_el3 reginfo,
> and the related SVE functions to TARGET_AARCH64.
> 
> Signed-off-by: Claudio Fontana<cfontana@suse.de>
> Reviewed-by: Richard Henderson<richard.henderson@linaro.org>
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   target/arm/tcg/cpregs.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/target/arm/tcg/cpregs.c b/target/arm/tcg/cpregs.c
> index 8422da4335..56d56f7f81 100644
> --- a/target/arm/tcg/cpregs.c
> +++ b/target/arm/tcg/cpregs.c
> @@ -5791,6 +5791,8 @@ static const ARMCPRegInfo debug_lpae_cp_reginfo[] = {
>       REGINFO_SENTINEL
>   };
>   
> +#ifdef TARGET_AARCH64
> +
>   static void zcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
>                         uint64_t value)
>   {
> @@ -5843,6 +5845,8 @@ static const ARMCPRegInfo zcr_el3_reginfo = {
>       .writefn = zcr_write, .raw_writefn = raw_write
>   };
>   
> +#endif /* TARGET_AARCH64 */
> +

Given that tcg/cpregs.c is > 7k lines, I wouldn't mind splitting the file on 
that principal.  But just sprinking ifdefs is not on.


r~
