Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp3799431wrv;
        Mon, 29 Jul 2019 19:11:57 -0700 (PDT)
X-Received: by 2002:a63:f304:: with SMTP id l4mr105982773pgh.66.1564452717250;
        Mon, 29 Jul 2019 19:11:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564452717; cv=none;
        d=google.com; s=arc-20160816;
        b=j6OpJRb5X+k17KzaUSS3pkbMacLiOdjZB9Zgis2A6ftZVenMwq79lQMRJYEdLR1Da7
         oooe6ZfZFb9QSA3dIsZHehJJ1wRwqxgNwR19o3mF5qPlQiXJ1enIUMeGTb0mRG9tGRmJ
         Cq7H59ap3Vj1et1IX6LJg9NK2a1vGgJeMTeGAV5HX3wBGXsXP5fAtwDL9LxpvlbymrqQ
         cVQSRDOQYGatlc3Ei9dhEN6b4SgRLrNWhQmwmJ2Ytz9xvZz9ha4zabt0Jhx+KL8uWBwy
         I53gwXsxo/SudkYcSlskr3xCm9q/Viy1NGCquyNgUeZ7/53rgDOWNjOm0vC3XzGinsKD
         a6KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=MXKsa4ZZukKO+/Awb3SeWnZHOK6Chwd+S4t8E6g5bMo=;
        b=iZ7baN8bdfFrtilQhT7UlQ6pcAIAYOUw3M8MGo+7/u7oWwKLvfxnaSSXYZ63tT/JLF
         wkvIWJytT12EDJ9wvvoRNFkkLZUQAJjUbRVCAZFSBZQcgfRrPbzGr6zo65vLbdA/J0YF
         Ff79eZE7U99HUCNyCco32WStVX+5P9wyi4kmOWLYNeiiKiSWXIeRYj9u53OxP+ZZ0aoo
         lXA+N7Eg/Xqow1cyUkGW9Y0bbHQQxr3f5oJH9Gw8PJLQblztORedkKbZuEo3GXupINg2
         no97Ryu+VdBzBGXliNkGbj28p3Bis5CKo5lP3tL8RcPi60kaJ/FF71Pe5mwt3MDakMLZ
         xHzw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CwJsxsCX;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id j19sor44330727pfd.55.2019.07.29.19.11.57
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 29 Jul 2019 19:11:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CwJsxsCX;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=MXKsa4ZZukKO+/Awb3SeWnZHOK6Chwd+S4t8E6g5bMo=;
        b=CwJsxsCX4vvqzM9szGcxNw9zvfpYnfCgUV7bn/76s3buVSb19T2zK0PHl8mPJs7QJ9
         bTNu1cs38v+wDokUi44vzJz2/ZX1hhE0iIMF+L/+iOU+e8cfXbIBSxln3QDGc43a3Fhn
         sRPWqQHtWfkxyyUVOvpt73xLfQ88onYuMpxHeFagXkPh2fO+9rXmhhhfgR9BFTd9lCo9
         yiIaRMqmKUUn6HrYffzw6ZAbohq4mnDzYNINE4JS3fctLaeiAyZTmbRboqqWf+SjW9Os
         KZLko6b0TshT7N+0qcYHikLdJjs2OKT/xHO+njY+XmW8+QToRE9iDmAdUEIEiFZj37Fe
         8JMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=MXKsa4ZZukKO+/Awb3SeWnZHOK6Chwd+S4t8E6g5bMo=;
        b=OBoZ17KDfOa2IgTYcnnzamrORGvucluMkg9JIIMyw3bzHgKxr8q1rJFVQ+7eYW0+qz
         1XYS9boMknRzBQitKjZAOcgiAMHW4UN9VRMZ4xr280Nx5P5TotaQgZ/o5TYqN6+17aGT
         PGJeb5diQFallK95wdAkyd8IPOQy12ZzRAokfaZzWhlJR3WVKtfpiqjHwasW+32YGVi7
         XFLFX4vDsbilNuJ2t8JN5bwmEb7T0DOVSWrnmd9SXq3cSgJqYmUBKVfXTnAz+D7h6Khw
         r2YQRyK93fWQwqckAFNKG2alWVkhGD3j9O9cGwmE2ouXPzZJlbOMx9EakhPrrEvgBikd
         KxFA==
X-Gm-Message-State: APjAAAVMwH2cQDEWoru9P8D69kS9xqCq22bABaXWsDgzfLd1pd2HFCZG
	VVVC8wqpUMD5s80qCNbORUSchX1jlTuzcw==
X-Google-Smtp-Source: APXvYqxnoCVjuN0mxPSlbZyhymVmkXHeiIe3EAw9OlrGIPjOtbyJesbeCY4MO2EIrXvRDNChqPR9DQ==
X-Received: by 2002:a62:2f04:: with SMTP id v4mr38496132pfv.14.1564452716183;
        Mon, 29 Jul 2019 19:11:56 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.101.105] ([75.147.178.105])
        by smtp.gmail.com with ESMTPSA id f197sm62189737pfa.161.2019.07.29.19.11.54
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Jul 2019 19:11:55 -0700 (PDT)
Subject: Re: [PATCH 04/67] target/arm: Remove offset argument to
 gen_exception_internal_insn
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20190726175032.6769-1-richard.henderson@linaro.org>
 <20190726175032.6769-5-richard.henderson@linaro.org>
 <CAFEAcA-W7idBRdD-DHxrVqfnBsKmAOPZoQAJkaUVOcjnLnGugw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <c7a3ef78-d541-aa0a-21a5-8b4f48db1fd7@linaro.org>
Date: Mon, 29 Jul 2019 19:11:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-W7idBRdD-DHxrVqfnBsKmAOPZoQAJkaUVOcjnLnGugw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: yiSHHaZT0BVz

On 7/29/19 6:52 AM, Peter Maydell wrote:
> I'm not so convinced about this one -- gen_exception_insn()
> and gen_exception_internal_insn() shouldn't have the
> same pattern of function prototype but different semantics
> like this, it's confusing. It happens that both the cases
> of wanting to generate an "internal" exception happen to want
> it to be taken with the PC being for the following insn,
> not the current one, but that seems more coincidence to
> me than anything else.

I don't like "offsets", because they don't work as expected between different
modes.  Would you prefer the pc in full be passed in?  Would you prefer that
the previous patches also pass in a pc, instead of implicitly using
base.pc_next (you had rationale vs patch 2 for why it was ok as-is).

Shall we shuffle these patches later, after the Great Renaming of Things Named
PC, as discussed wrt patch 6 (pc_read and friends), so that the "offset"
parameter immediately becomes the Right Sort of PC, rather than some
intermediary confusion?


r~
