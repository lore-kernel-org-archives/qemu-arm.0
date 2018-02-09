Received: by 10.28.71.27 with SMTP id u27csp1250009wma;
        Fri, 9 Feb 2018 10:27:12 -0800 (PST)
X-Received: by 10.36.19.5 with SMTP id 5mr4510675itz.11.1518200832888;
        Fri, 09 Feb 2018 10:27:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518200832; cv=none;
        d=google.com; s=arc-20160816;
        b=dP9P3xOGTWBuES5IQpLPZqa4QNjtRga0iZZWP8h5wOgTawFXl8VnvXY13yUB2QDwK4
         0ctUHaPTfCus6qZjK5BkRQI5lHBnCjmWONbDO7H7mksALwNt2G2RzglrAvlfVKNP5F2J
         8BCKGhWFq4WHlFD3oQxPfQRIsnkkiCDWKzbmDUVp8HrxYdgpL6NJOJgK4A9KeVG3wtyk
         p8nJC/MZ2eZs4GEfqUNkcCh9JyGQ885QU3YWJTbwP9qokdzKXu30GWfAxaQvoyJMEH1n
         tq71zY5q1HWWyxH3Y53xWxkMyuLlb4Knugd4XLBMqWdOKwbci8Yy/NDPhScGR14LRKlm
         PZnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature:arc-authentication-results;
        bh=THgxTpDmapRZfjNYmktPML2/c7YDu+jWEkobW+kbLis=;
        b=YLqUB12qRWr3f5i1ZCdcI2BHkNYu4dRI56ilMDH+/dmixZDal+kke7u3UIUQnjNANz
         rf0A8Plg1WiHoBDFWeHeX7pDt8H/HI0kuxqnZZae/6kg9Fs+YuPlvALtZCJw0rVKvIaK
         vZraZv3vW2RdQctOFfEm4EwxYVcVBKkmDJptq9zqw/Ip8wTH9P0QvK3Br/EIjTZoD6UH
         Nn7U/8Kr877LPsMWShNPIcaPrZPR07AoGWIDRWa7n6rjw/QCEYn5mtbuMZ4xoyTvlZrf
         z+anIcA6DIRIJ+I/fd7W8glO111vvMtpbbVDq1lZFy8enbkpsn5pgvg5le8dXjaA+U9u
         omCw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=H9+gE2IA;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id v62sor1963007itb.4.2018.02.09.10.27.12
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 09 Feb 2018 10:27:12 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=H9+gE2IA;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=THgxTpDmapRZfjNYmktPML2/c7YDu+jWEkobW+kbLis=;
        b=H9+gE2IAwC9EwqD6RHzXTaCVwOwXvbrbLmfxz3NN7O9EdbDUFAAm3BQ85EqVaipaS/
         rjC1l0dK3USHbBon61fosAHHO2ZTJw7n1+QVXJGne1ZCAzxA02MchLJKkvmB4alECNqw
         YO0EWYRrkkxEUE/Xm0yO9z3tDW93u16SkszXo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=THgxTpDmapRZfjNYmktPML2/c7YDu+jWEkobW+kbLis=;
        b=OXDYppWzXmpqjZBHiO4GiCalEdNTXpiaCgJmAiphe4AxTiLwyNx6lccY/Ccc6tFu6n
         8X259tp742YHmyMC1NF5OxkwBg+dGJ51U0DgE9UgLhSFyRWG7C5MB3PCYNXPwwZrqd+O
         cTCx2upqf0tXAZr6MttALrAl8OTcy+JLgEHKyQH1RombLRGI8Md/j1KJMhV+lGfBZYL8
         l3NIAbHaoKXdsLa8Xb0/BwqWN1589VA3iCUk1FoV4b1+3TGDMlO5liNEd5USxT8bqZk1
         izqxT5a6jAsxdV4oqpMjTd1c+nCue7uLJ7re0v1CreDGhGHdU2s15XC6KVuuB8WLD0ZD
         IsmA==
X-Gm-Message-State: APf1xPBPr/roPFwWpTaljJUnytQFD4qmu7kH4R3ezSH45tpqPgWcMDKy
	a18meS5BC/6rEL44JNuT5p/rZjCN
X-Google-Smtp-Source: AH8x225Id5vpwLVtGoZqEYfm0tg9o3rZnPMsJhxmJ59tCa1gausf1V/OOjrKzrfaNeX9bH2IL0c3Vw==
X-Received: by 10.36.46.22 with SMTP id i22mr4813307ita.23.1518200832484;
        Fri, 09 Feb 2018 10:27:12 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from cloudburst.twiddle.net (174-21-6-47.tukw.qwest.net. [174.21.6.47])
        by smtp.gmail.com with ESMTPSA id e98sm3936612itd.3.2018.02.09.10.27.10
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 09 Feb 2018 10:27:11 -0800 (PST)
Subject: Re: [Qemu-devel] [PATCH v2 30/32] arm/translate-a64: add all FP16 ops
 in simd_scalar_pairwise
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20180208173157.24705-1-alex.bennee@linaro.org>
 <20180208173157.24705-31-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <cf5584fe-3da6-f4c5-560f-851e2b8f64d5@linaro.org>
Date: Fri, 9 Feb 2018 10:27:09 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180208173157.24705-31-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: XM2Z4DCfZ/kB

On 02/08/2018 09:31 AM, Alex Bennée wrote:
>      case 0x2f: /* FMINP */
> -        /* FP op, size[0] is 32 or 64 bit */
> +        /* FP op, size[0] is 32 or 64 bit*/

If you're going to frob the whitespace, you might as well update to include the
fact that it can be 16 bit too...

>          if (!u) {
> -            unallocated_encoding(s);
> -            return;
> +            if (!arm_dc_feature(s, ARM_FEATURE_V8_FP16)) {
> +                unallocated_encoding(s);
> +                return;
> +            } else {
> +                size = MO_16;
> +            }
> +        } else {
> +            size = extract32(size, 0, 1) ? MO_64 : MO_32;
>          }

Otherwise,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
