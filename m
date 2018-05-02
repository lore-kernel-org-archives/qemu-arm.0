Received: by 10.28.4.212 with SMTP id 203csp912455wme;
        Wed, 2 May 2018 09:28:16 -0700 (PDT)
X-Received: by 2002:a63:6385:: with SMTP id x127-v6mr16473569pgb.50.1525278496158;
        Wed, 02 May 2018 09:28:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525278496; cv=none;
        d=google.com; s=arc-20160816;
        b=hogHaTliDPJMcAPacFNSKXtFDSmKLCdvIFxwJEq55kxQEP45ioD9ByhWqiiymCxhyF
         ZXBd+EmhY5mHgMdkXbEaxhRrsqoAlIoG05o5aEBIzLCz//WehmrLIAdT4Yler31nK+kG
         eAhuYB6Ug8Vdh+9VIldKPng5DBKff/r3RbrKG+TzfXnsGdvuvZmjps+CVRpwdf/9Y9VI
         84K7dHUkMyBOG7ra/3iJoMFKdRHsSd1MdAzXjMKnbS/oUploEP7W9Moq5w6SyyQAYLI0
         z0q06cuZgehP1lWDbjbzYoivOVrTwHRXJGevPDD0PaB+85XLbYFS9XYMJElk3hzlNwnh
         S4sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature:arc-authentication-results;
        bh=X5ZZacJJuUvy93h8jrsrdkB1O8N6TfQ2UL9Mf4nEjpI=;
        b=NSAn8o3eW+LuVszl4uijyelDtftWczX6LK+tqUBSKHMbVk45DOBKqWZvEs0fWBoFv2
         EbQoravEafn6PR1dkRMr9czsHrps8bsLRsKByBCnRCv2NotwOqVkujM+qKUINVM9IRtb
         5PQLfeymcJSuCN6L5BlPT4YP/nhIOU7378SSdesTOKvD1srd7OcnW9YoayGW4mbqqMAK
         5gTmNOr4AwwA/WK8mAAniCXK1n21xEahO7EO4n15Zm6cSh+VKb2w8zkBE6zz5nG8Wjmg
         bpxUOXlVJnfLXw3fwxiZBUWWJvbsrnVmBmLXNfpQYzJRItsidTWZ4irW9bB4V4u/8SD/
         WIFA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=N+uKuYE8;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id x4sor1939689pfb.12.2018.05.02.09.28.15
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 02 May 2018 09:28:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=N+uKuYE8;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=X5ZZacJJuUvy93h8jrsrdkB1O8N6TfQ2UL9Mf4nEjpI=;
        b=N+uKuYE8RuXs4JQWPeWtypx4gYiZlaRbzTxzCFdUW5uSE8ABviwtsRg7SQZZ9yh97Q
         fZDrVbUpuv06zSUjPBsjE33kIrUuBuFFuKDI4s1RCeHQGN4+fwgDK0/YTvbrNZr6if5K
         U5fTfCFUSO/CjVTaDLBFKpt3nxp/9KDsYEVTg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=X5ZZacJJuUvy93h8jrsrdkB1O8N6TfQ2UL9Mf4nEjpI=;
        b=HpJCNccqdg4PVLBfnY50bVqhx5yDxjSoeAcwJ1VOJDHgnWhcjcsTbuYvtXlQR3fbU8
         USldnbdhaAOSKybY7/q6StMAsrIBTqW1o46V4FaACUIuomAS1W399UzwNv5ocqSYjZDD
         ktIs0nyJ4SXt8cJBWnP+AhOUcsru8bFcysnhAe2BjRza1KSlNiEuuxfiIK1GKIw58eko
         BXRf1OhJIWj5t4CuR6eSBKpE3//rJWkxRkS9UVmHD717k/c5tZTOT02sG6ODdng2sWyE
         aic/l1TP+uSrzWNTu5fNiIGd89TdE2KhTNT1MSuQmRXrqPw0U53KQL3WOWcJ0KjOG2p4
         Gr7Q==
X-Gm-Message-State: ALQs6tBEji0Ismyvm/8juQm3uNrMbdyjxT8L1uSk6B4nVm5kDP/lpVTl
	9h2EeQAgIjhxOqgAnu1e8IVBq8HT
X-Google-Smtp-Source: AB8JxZrdnrGjbhPddAgd5M7z1eMVymwzLcZP0SN/Ywz1KaKlkCrvBFiNPbi/HEfeDZV3jG4ups1GdQ==
X-Received: by 10.98.16.74 with SMTP id y71mr19683751pfi.188.1525278495719;
        Wed, 02 May 2018 09:28:15 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from cloudburst.twiddle.net (97-113-2-170.tukw.qwest.net. [97.113.2.170])
        by smtp.gmail.com with ESMTPSA id s20-v6sm18245244pgv.14.2018.05.02.09.28.14
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 02 May 2018 09:28:14 -0700 (PDT)
Subject: Re: [PATCH v2 0/3] refactor float-to-float conversions and fix AHP
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20180502154344.10585-1-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <6c4608ca-1fe7-5b08-0014-99181c5385ac@linaro.org>
Date: Wed, 2 May 2018 09:28:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180502154344.10585-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: lI0FIRgBEZoE

On 05/02/2018 08:43 AM, Alex Bennée wrote:
> This is a more polished version of the re-factoring of the softfloat
> fcvt code. I've split apart the fixes for ARM alternative
> half-precision format for easier review. Rather than rely on some
> questionable hacks it introduces a new FloatFmt to allow cleaner
> handling of the differences in the common code. If there are other
> alternative floating point formats they can follow a similar approach.
> 
> I've included the test case for reference although I expect it to be
> merged with my tcg-testing revival code which has the rest of the
> build and test machinery for the test case.
> 
> checkpatch dumps a bunch of false-positives as it doesn't like
> scientific notation for floats or inline assembler used in the test
> case.
> 
> Cheers,
> 
> Alex Bennée (3):
>   fpu/softfloat: re-factor float to float conversions
>   fpu/softfloat: support ARM Alternative half-precision
>   tests/tcg/aarch64: add fcvt test cases for AArch64 (!UPSTREAM)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
