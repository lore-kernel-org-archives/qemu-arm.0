Received: by 2002:adf:f011:0:0:0:0:0 with SMTP id j17csp959895wro;
        Thu, 14 Mar 2019 08:09:22 -0700 (PDT)
X-Received: by 2002:a17:902:8a8b:: with SMTP id p11mr15814069plo.162.1552576162499;
        Thu, 14 Mar 2019 08:09:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552576162; cv=none;
        d=google.com; s=arc-20160816;
        b=QBQlpVpITJGj3CnV4lCRKjStikCoGC+2AbQxJjHUFoQjO1VC8fgDKjLJmtFGRfv+Wv
         sdCCNVsjrIayDe6r3ccx9zp4Uv1eQRMkZdPfhkQNFT9Zpo4j93oi5uXFIz8+eGXq2hpo
         ioWqiHirNuhGPTb6lLSUwhsacRuihx2cxnIGl5uZ+wk7GwDk6lpyqaQbqdKOnwl1O9W6
         h6EDImXWCTMUC0/1U0JrCyI9wtka65OsfOgfFWdMSoleHQw8DXlU0j+dB7SOvi5fGrun
         +OrQxggTpJDj4EOyaFs5hyjtP7GQGMYkHdn1ueBCWnpkTNmMOLJbq2K6Pb+hZ6K4h4yO
         U/zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=POMcYpah3/oNEg11uuLEejfY9SJbF4Q7Oz5cQwfbSlk=;
        b=ZEbRgV6fAa8QkSzGypWgsvTex4wFrLfELY0T46OoW2P7fCQx302Okr2QLpedMwWIUD
         BrvIzqMUGn5LKgYlbhU/IJtz5rpcdd4BqEPKN+bQXo44Xr6VxxOBITEYNA93wXg4AKM6
         Tkrc+AiVr21asuvhVaXx05/Phu66oE/6G2/GpSb3HCbvgiR0DpEDQG4OgOcCRGi8S0sd
         UVsGxweq2bIlDnCW8vjLcM+Ha8gLSBjETc6kEwfUOd0dXzdexBRcCfP8aau5Eu3aa8ff
         3KjBKC+FElL7Ntx/heu7aE4nZtjiVeiYIONC6LIJ7msvSdITIhsUKANJbPS6NtO6e63Q
         BgLg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MnSckAWV;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id v24sor23596270pgh.43.2019.03.14.08.09.22
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 14 Mar 2019 08:09:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MnSckAWV;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=POMcYpah3/oNEg11uuLEejfY9SJbF4Q7Oz5cQwfbSlk=;
        b=MnSckAWVUBDkLclp1xJSzzG4BSgOnXM0W6F7DkmjuAEX2L+cGvvdRfCbMeblcK53cz
         CS1XAkW+bV2OZEQBc1+zhiNjPrwXG8WiNNUfys1up9T37eEdKXIrzm0souI8uLv78+Mq
         Rxv3AJnyL9RookSWTrOPEZq74OVQPvTHKvNZ8K66Z7JRL78Pb2E25jSOU0z9fJfokNu+
         vLTx9J/XN35rnWgYl+zcZnwfeZXSeJgn2b91qxtBUtDqjoZZmuXKBaANFS++gNhkOtG5
         WJXQMs+/4/g7LVDrMO7YD0vy8MaQXCUJT8hIQGP+ByGTs0itjOGJlOFP5QRkiU7KJ06i
         m62Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=POMcYpah3/oNEg11uuLEejfY9SJbF4Q7Oz5cQwfbSlk=;
        b=Nnk5qoPDdzuPIffWuIIsqj7QGMEAW7JK5KuvBHqYZjfpzS3WI42MvgslbtpklQqEdV
         0kzFiFzXWmTRcjPaRuIImzKwnf1DwudXzJq3NqNYCquE9MG/u2o/zLQ7SJwT+UobkXnj
         jLZ/5jkieT2+WMjT0bjDlResILMfn6TEOCVtAAtQtL2PgeTj9CKm9FAed6+l2hCH2a7/
         YFNKGCz1PocLXtHCyyZ2EyeFrDgyw9bLhGadubldgIXgyuLqgEjj8H6lEhxWIoyijlhK
         WzRm9dDgx0G+/22/nRCEW4GM49Zlso9Wh2Es7wCSn206FsdRHNz5SvIhfcfMn79T0Vvm
         zlGw==
X-Gm-Message-State: APjAAAXtloEIOL8XYYFne+k8Lpaafc/T5FNtVLm/RsFlP7zBK0HFavTx
	ufXjwCJe670v+q/CFTzRPebRxDNkvxbP0w==
X-Google-Smtp-Source: APXvYqyQpeuAFLPaWd6dhIblH8/ULAtNywunYLjykfiELp99Qa/LR2hjhkI+g6YEuzQzeK9yXgZfgA==
X-Received: by 2002:a63:4c13:: with SMTP id z19mr19927194pga.71.1552576161862;
        Thu, 14 Mar 2019 08:09:21 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from cloudburst.twiddle.net (97-113-188-82.tukw.qwest.net. [97.113.188.82])
        by smtp.gmail.com with ESMTPSA id 73sm23320475pfr.55.2019.03.14.08.09.20
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 14 Mar 2019 08:09:21 -0700 (PDT)
Subject: Re: [Qemu-devel] [PATCH] Re-evaluate SVE vector length everytime
 ADDVL is executed
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
References: <1552488086-4025-1-git-send-email-amir.charif@cea.fr>
 <0d61f67b-26b2-33e0-cf4d-13c7d998eed8@linaro.org>
 <82FD2C51B435F943BACD9C947966BF2F0A0E3ACA@EXDAG0-A1.intra.cea.fr>
 <87va0l4tm3.fsf@zen.linaroharston>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <605edaa5-b840-15ff-2895-63b1f1fc5fe7@linaro.org>
Date: Thu, 14 Mar 2019 08:09:18 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <87va0l4tm3.fsf@zen.linaroharston>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: qUI5yVQ/tb5Z

On 3/14/19 3:51 AM, Alex Bennée wrote:
> Amir CHARIF <amir.charif@cea.fr> writes:
> 
>> Hello,
>> Thanks for your answer.
>>
>> The wrong size was definitely being stored in the TB, and, it only affected ADDVL/RDVL/ADDPL (i.e. not all instructions are wrong). Here is what I think was happening:
>>
>> - The kernel disables SVE in EL0 (ZEN= 01).
>> - When the user space application is entered, the TB containing ADDVL has its length set to 0 (16 bytes), as we are in EL0 (so sve_exception_el!=0), and FP is enabled.
>> - ADDVL is executed (without trapping) on the basis of the current
>> length (16). (Nested function calls in the same context will cause a
>> ton of ADDVL instructions to be executed with a vecsize of 16.)
> So this looks like the error. Certainly the pseudo code says:
> 
>   CheckSVEEnabled();
>   bits(64) operand1 = if n == 31 then SP[] else X[n];
>   bits(64) result = operand1 + (imm * (VL DIV 8));
> 
>   if d == 31 then
>       SP[] = result;
>   else
>       X[d] = result;
> 
> so we should trap to the kernel and we won't without sve_access_check()
> 

Yes.  A browse through the file suggests ADDVL, ADDPL, and RDVL are missing the
check.  I'll write up a fix.


r~
