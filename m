Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp1688278wme;
        Tue, 22 May 2018 09:12:31 -0700 (PDT)
X-Received: by 2002:a63:7f11:: with SMTP id a17-v6mr5887814pgd.453.1527005551750;
        Tue, 22 May 2018 09:12:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527005551; cv=none;
        d=google.com; s=arc-20160816;
        b=lQI8/EyuM+BsdiHdynVv57cNXpNh7/SI2HQifMupXCq8TRmHDjAN4YiSPz16T+Q+H2
         gyteP42vSlu3bv7BQ1EiJo7jAuaybDfNKZRUbgJQTy09YbU8kv7pdBNoJi6Z599xsd4a
         Da22/1dSWhnkXL8NKRTWU6rL9LrDG+ub3xVuslgBJOnULqweFJSR3/DrlMSvHz0R3neQ
         9+dT62BS9iin5TJXOHwO7pM1M5hyuy9wXG+KkBQtmrPP7p96m469sM0P0KPC4Zq4nQAY
         wJYiC0Ke/qBcrKPwim2VX10sf4TFixPaF440Z22dK7z/kb8/LTCSwSoiGd/d9jjXtmxW
         HErg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:cc:to
         :subject:sender:dkim-signature:arc-authentication-results;
        bh=v4QSX8EJ6t43263l73QWFP8TD8UbEkA9sX4EdEOIY1s=;
        b=VDM6CyLU1IuthOtOcncMrMjgwA9vTs7S1h5piKRdrkSDuh9F2VwPwqBal+9n3lyYpU
         14s2V0eCMy5YEIk3SpLisw0CBMwK1R5n3M++RMspKKxuPxii6c4rbeTGdMJvZDQeDrQj
         sWYxKOZ2u8WkIa+QwNPTkBodnnPwS3Fmkqz+1CppvHHDsQaBLvYKtCT1j4webkgH+0jw
         +oEb6T4/Ld2HtQnaAu/UU7wMTUNdOZPVaAEHJhuI/PY49K0s1g1ES7+c1RSsRoFDHug4
         0WFbzqQhxnZNkj7XXZQeiPTZ8Wv3QKLEkz9H/04cWfZbiyCGK7JZmesIpuOYWaLd7B4+
         llnA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=IpWv9MAk;
       spf=pass (google.com: domain of rth7680@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Return-Path: <rth7680@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id a125-v6sor4521805pgc.268.2018.05.22.09.12.31
        (Google Transport Security);
        Tue, 22 May 2018 09:12:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of rth7680@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=IpWv9MAk;
       spf=pass (google.com: domain of rth7680@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=rth7680@gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:openpgp:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=v4QSX8EJ6t43263l73QWFP8TD8UbEkA9sX4EdEOIY1s=;
        b=IpWv9MAkWRH1jsT55KC0Q5X6TTg5xm2c/vFL7tYTIhyWdJCBzTTBFM6pcn+oss03wq
         ml+yXTOQ3UvMA8iQ70iEkZAAeIQskgxEkSoHNivN0eqBtDb0KN/aM94vLW7XnVlU/uly
         w44VS+7lmSGI9UhEKIelL9isR/TKvmuT1VD99mfaFYhfait2DdzBO2t58puTT7K+bOvE
         iPgK8aHQ5ggfq/SLWteKWvUHwWfJ7pYfC3LsZsbWkz7uBMLeiu8EOhr7f+/iXbFEcR3L
         OoiXNsngeB69yy8f6+0q09YRsMTVO+2ein3CUJlzSolkMPg9olKJEHMt8IakdQEc3H5X
         u5Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
         :autocrypt:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=v4QSX8EJ6t43263l73QWFP8TD8UbEkA9sX4EdEOIY1s=;
        b=eMEnrgzXlxYs7CaxZRi8WzJOYWZa5iHt58v+/tDEo50LMb93IJ/N9q29JzLiTmAzFo
         nxi31IurHDskGycWc2Okl9Bv8qGMc8N2FE9mgVEUGY/bG3dFxTM8d1Bdp7TB0QBH71VV
         lfS1+cj3r5LLwUCYXuI6sHhUrxL2mtEaIb+xezglRa5/f7ptZtLy+3Fa5cCXkYqqzOOG
         zNzgFFdBX0jvQ+sPAk9VNk1/hPQlrS2DQgnCigfggJZydNVuBeETfOrK9V9ldd+GEYxx
         Gn0qxA07Ox5DfrGJ97q8wDNq4YSd4ekoAoxXc/INkaIsdkOkjCYigN4w0tXBcEMEozA0
         quRg==
X-Gm-Message-State: ALKqPwfkSetP7uHoDmSBXV1FhL+6IBKpekpSI1xqa86dSkusQNa+wGLA
	9djVqBP8AB3iP3JGjQyb0OSxFQLR
X-Google-Smtp-Source: AB8JxZo/IyOUf/okgNbj28W1q0ISf+h6tcqkSMfgbbJdeOGPyq6QgakyCResKP0jpFoE2udyqBTDNA==
X-Received: by 2002:a65:5382:: with SMTP id x2-v6mr8704593pgq.160.1527005551070;
        Tue, 22 May 2018 09:12:31 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from cloudburst.twiddle.net (97-113-173-254.tukw.qwest.net. [97.113.173.254])
        by smtp.googlemail.com with ESMTPSA id i1-v6sm34532287pfi.133.2018.05.22.09.12.30
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 22 May 2018 09:12:30 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
Subject: Re: [PATCH 03/27] Make address_space_translate{,_cached}() take a
 MemTxAttrs argument
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: patches@linaro.org, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20180521140402.23318-1-peter.maydell@linaro.org>
 <20180521140402.23318-4-peter.maydell@linaro.org>
From: Richard Henderson <rth@twiddle.net>
Openpgp: preference=signencrypt
Autocrypt: addr=rth@twiddle.net; prefer-encrypt=mutual; keydata=
 xsBNBFGuLC8BCADcAoWcnW9lTsDMzbO3MBU+KbiGaj5JPatEUscRDkQYM2fyNjJp2tIWDK5a
 n4yngeXB3eX61WbYR3QraRK8mlYLGxyAdHMEQfPipbqf3TmN043fssT2bc82ApJcs1zvLYgI
 rhMht7Dck7A0wNC1jo+ZjVVFig5gDTN7gOzaAdBtV8tVNUddwkLzzaGpfihhSD6U46NdqKOG
 Wlnn6TrkMy0QGdQ5NaXHkRlUjnnUTSW/nKfoxD+EI+A9V4sYOd8mc/TL4aJh/i/AiU57eLbo
 n17uQI6/VTWDUWl8USiz4x9c8vmqlywLx00tAFxxoRWqk4KVJlj+Sh0up/D/sJ+vPpgBABEB
 AAHNI1JpY2hhcmQgSGVuZGVyc29uIDxydGhAdHdpZGRsZS5uZXQ+wsCBBBMBAgArAhsDBgsJ
 CAcDAgYVCAIJCgsEFgIDAQIeAQIXgAUJC7UHogUCWaDNVgIZAQAKCRCtEnDMTdAnm9N5CADO
 cB8F/SudJ72IupxQf40hbJdBK176+gb3sHMsixyLtrU59lee+lIM1OZmlNjsnCYmiSnbA5ks
 Q7p0HfO7DgdmfLzcK6xsHZukqSZy5LByw348Y913ZyjOrJZFdPP7kDg1MnqRqH4+3ZdzxV4y
 eYBWFU9GYMIF06JbUubossOOO4ArNVZbnIPu8Vn2tDZVVqsCBqkoCSBMj519xrvyOu5z4mHS
 LkCglXmVDOXMbqLuNAC3rfNXSnyM4hYkLUyfALJlAAy1Ro+jUqYhu7XUFV/MiwRuFMh5GbtY
 Urkx7tqsWQXLT3GeDk/LqvpWJQwk4cHHckYjRih+70CHIenm81PVzsBNBFGuLC8BCACyEx3x
 94HIkTX0CHu2sA0w75+h9wuoA8ggJ7+S4ri0y2YsijWad5TTt6z6MMiqxk9kSA5bppaj4HXh
 86hBF/dWCtMpNr3Rb8FNOKyeA/qkYHVD6HiAiw9c6D8Dr9hWmOk3/HSmGrNURxeUFOckDXsv
 I+yGGKBNshj59j7QZr7ZiuIi2rWlBL8dFN/OWa/o3x7HKsE4k6K8ngwvCKP/QbDLwLLBOWH+
 VEUtpyeyxTr3OJ47ECTxdYvXoAV2iJaKr+6doVQiiR5eVFiMYrUPUECJeolOCwqc/JlWE18L
 +PCAFaW1H+/mpPVfSpN4wnkJ5cQiQVB41IaCM4p20iRzx7ZJABEBAAHCwGUEGAECAA8CGwwF
 AlmgzYEFCQu1CEoACgkQrRJwzE3QJ5s7rggAwABzDAGrZ6uWsMxg5PeiiAYPy6LBnCBJSpB5
 Tfy5jH8QTmLfXW+u4Ib4sWXG7PYNR7sIrtqUHjRqXLVXrSnBX9ASGcYw/Xil45khW6LsRpO1
 prHv9gkwQfa6fTiWXVfSfm2Nant6u02q+MaYtQpCVTiz/9ki4FfftUwUHFLU0MhIQogjd11y
 /E08RJsqBwaHQdt14PwU1HphDOzSkhOXRXQLSd3ysyeGUXvL+gqQoXl5XYdvk8IId4PoJRo4
 jcyJ4VbnldvXh5gdGhFA/f9JgkLk9tPW+C3wNtNWyRUq8azR9hF2fg2HJUf4IXQlIu8OOgh1
 VcROBqvtH3ecaIL9iw==
Message-ID: <7f39f710-addc-5500-1207-85ec85651bc8@twiddle.net>
Date: Tue, 22 May 2018 09:12:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180521140402.23318-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: RKeJ3BxZuPst

On 05/21/2018 07:03 AM, Peter Maydell wrote:
> As part of plumbing MemTxAttrs down to the IOMMU translate method,
> add MemTxAttrs as an argument to address_space_translate()
> and address_space_translate_cached(). Callers either have an
> attrs value to hand, or don't care and can use MEMTXATTRS_UNSPECIFIED.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
