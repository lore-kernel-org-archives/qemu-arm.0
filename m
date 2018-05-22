Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp1693807wme;
        Tue, 22 May 2018 09:17:08 -0700 (PDT)
X-Received: by 2002:a62:6883:: with SMTP id d125-v6mr24999441pfc.26.1527005828502;
        Tue, 22 May 2018 09:17:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527005828; cv=none;
        d=google.com; s=arc-20160816;
        b=r8klEZsP3EfpBA6ZbgaJZABtYDjYzuZVBy29UW81suD3RyO4n0IP1gZXZhJeo66nNP
         S1LowynrJJYMkhVAzr6lO4urANAtstmAdYmGWUk6MZ2NI9pK8CiK3OaMod9FmkBKNiu+
         Ph6ykxosBFwfc+r+dc+pp5bR4vFVdwum04kGQ6iDtwUBTI7IurCNdViv3vCSGQTAqq9r
         QCPFS4BX5GisMRpnCEeUZuIUHhP4SfsbxEsgM19EsSmX2UGO+MJSJN3nXYESOcaAHnX8
         Z/gd4QnVEfuGcuvlv+Py/EI/dCSitTjWxO6GR+fFfiSJc/soH50EXGAlC1cQLpUPHWii
         CUQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:cc:to
         :subject:sender:dkim-signature:arc-authentication-results;
        bh=4XyHDSQWNTySvEPYxN1IhFKXZA0X/tKalnGFreG72oY=;
        b=jNCLrjVtlis64WBjpoARgnUSXyBsyWl4Z/kwVmZCmz3wjqtYlcl4SRWdDaKfWzoHKH
         SJUVUPY91+5JuNKvw9VXxOQJF9UxdZc93GtGQOkJ3LKKRnf1yNpzrl9FK/uLgodVwEkJ
         qLMAO9IhKo0epKrMsU6s7eO+EVBxGHWj93iMlmELBbx9o4S8BfFTCUgBHSXo8pIY0zW8
         uvtYqrJAZI1Hqn3oc95t1aEtUuJ8NCXByQQNOZqFUSDqWssiPVEf6s/OOVPd9nsdzgBF
         3xRAPdRRc0lUXTi5Rda0ioHDWhIZwapp0tmZOPmlfZvqc/UNeq2Sf7f3j9zzpZ4bWjIM
         K8hw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=ExhgEscA;
       spf=pass (google.com: domain of rth7680@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Return-Path: <rth7680@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id h192-v6sor4519796pgc.332.2018.05.22.09.17.08
        (Google Transport Security);
        Tue, 22 May 2018 09:17:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of rth7680@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=ExhgEscA;
       spf=pass (google.com: domain of rth7680@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=rth7680@gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:openpgp:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=4XyHDSQWNTySvEPYxN1IhFKXZA0X/tKalnGFreG72oY=;
        b=ExhgEscApxcRYnxRx8I+OX1S5KlRWNWij0D5o7kgXmfyGwIIqkGMkigcI5v4Je2VMC
         EQ5Ycdwt2mcX4MhE1LhfXlEqUuKG+FpmuhPIwD9tCbGNlUEkpK/ta88nGBQEJkBHxCkb
         TlOO5gUyi21GQ0K772cRHK5cYbQK1TA6Z4tXiwhuRU58yYDtyqZBflLVRUZvIU6Zu+Or
         Vw/GxPzkLw2eJvSdVALhkrAOwn3hMZz2sRaXmHixAFW+Nw00rGvcNiEl27owZ4eZt9ZD
         vW8L27R+zFr0/WjTXlfsQ/pmHxFoleZYNEUiw6vpmLqbet6NCY9+LESS9SiE8qgH1ED3
         CLeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
         :autocrypt:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=4XyHDSQWNTySvEPYxN1IhFKXZA0X/tKalnGFreG72oY=;
        b=XtPzEvdNTF/PTh2F6Ab87zNBzut53Ow1vUqOgURZdLKQC2Akkooevfvkc4LeN1gk0e
         M66UjtTsBf0Q8eWpq/rHCPDgmYzDCYwDKdNH3+HlvkC8xQWU2ViRDAKGCj3qIztaDvdm
         uKmNYr0TAXBDjyInigza454IBtCGRCrBo9awhKfGUoebC4m+6u0TZazMfAvpQjyPt7d8
         L/ZK5/ArRXigoSO8MUWgcfndE+uW02H9E/iZE9KQM0HK/I3ikr1uxt0NIAamlsrTqgtU
         qbaqoYtXCvS1gLJHe0rW0VLZ5C2BYHKmryD9uEVjDcI/LUfpxeX+AGLCvTlEHolahdcJ
         t4QA==
X-Gm-Message-State: ALKqPwfpecHCFwfaLgeAhwTxFVcgMvKeeabYHFPWLc7C41fpcktrNpmr
	+7m4gAc9l8jsv7ljxzCwBqu1gmME
X-Google-Smtp-Source: AB8JxZrn1YlFGbl/veQKMjTogodicWAsRnbqytJG/8ZX39ljcI2rjPd0L1utGGGWE56O214cy0xYWw==
X-Received: by 2002:a65:4dc7:: with SMTP id q7-v6mr20070840pgt.48.1527005827834;
        Tue, 22 May 2018 09:17:07 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from cloudburst.twiddle.net (97-113-173-254.tukw.qwest.net. [97.113.173.254])
        by smtp.googlemail.com with ESMTPSA id j11-v6sm21179243pgp.2.2018.05.22.09.17.06
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 22 May 2018 09:17:07 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
Subject: Re: [PATCH 07/27] Make memory_region_access_valid() take a MemTxAttrs
 argument
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: patches@linaro.org, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20180521140402.23318-1-peter.maydell@linaro.org>
 <20180521140402.23318-8-peter.maydell@linaro.org>
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
Message-ID: <a6f30a3b-677f-f37a-e651-480b82d206aa@twiddle.net>
Date: Tue, 22 May 2018 09:17:05 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180521140402.23318-8-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: unuEgvKcZkdW

On 05/21/2018 07:03 AM, Peter Maydell wrote:
> As part of plumbing MemTxAttrs down to the IOMMU translate method,
> add MemTxAttrs as an argument to memory_region_access_valid().
> Its callers either have an attrs value to hand, or don't care
> and can use MEMTXATTRS_UNSPECIFIED.
> 
> The callsite in flatview_access_valid() is part of a recursive
> loop flatview_access_valid() -> memory_region_access_valid() ->
>  subpage_accepts() -> flatview_access_valid(); we make it pass
> MEMTXATTRS_UNSPECIFIED for now, until the next several commits
> have plumbed an attrs parameter through the rest of the loop
> and we can add an attrs parameter to flatview_access_valid().
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
