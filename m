Received: by 2002:a17:906:9502:b0:9a1:fa4e:495e with SMTP id u2csp386125ejx;
        Sat, 9 Sep 2023 09:04:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHjEvQJ+5gSciPGOFSGQrTsgR9Kf5c3EYbc9Q9vUTI6qiecmkl09l/YXq5QjH0drsrDzAzh
X-Received: by 2002:a05:620a:44d4:b0:76f:1614:577f with SMTP id y20-20020a05620a44d400b0076f1614577fmr7780275qkp.5.1694275441130;
        Sat, 09 Sep 2023 09:04:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694275441; cv=none;
        d=google.com; s=arc-20160816;
        b=FBUqhR0c9n6HhPFeV+sCbCLAnQLbYLHNFoUAheSyxrkcxueEpDL9euYEZD8JYLh1+P
         jD49SdE3KFjU4hfQpo22BX3yVFKFGXLtogYvGOfHc4d04gb8wnnCV7hZiTMkPHO/cJsL
         ituHu7brc+m8V6u1MNMxGQAbRQQChJm1ArmueRm+VnTtyVBk9KRW79d+jCC4mdCWYCgA
         067NNZ0zQ+fLVdek1t56usgSO0WLYJ4jkCUqqdPWFs7P98K5gw3NTjjE8+oEkSSl+suS
         iDgDEMQ4T2hJDqT8ZwYjKU1rcPom2MFG6B+alBk8t9Sogohm5db7/rbe0aqY1pmSu6Ys
         4wpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=w7nWhNtsV3di0blxBdyHCDW/RE3siec7s2CQf2wEgmE=;
        fh=+xj4Yfkfa7hWRbLS+DTrcNY2o0evBrBbm0gAigyTnIw=;
        b=vPrPRb2XVntxWVBmT3LrTCq3yVkN6ry+L6NGM1KIVZbEYfVAjxRbE1FrMXc+zF/OMa
         6jOCK5WNGoci8lQUMJ2Yc13rovymxy28OTccl8SHeVWXK67eTLFA758N0sYC30+NFq8O
         1bu4WQOmECo13+UrkPxF1exkSfTPzrHdUVr+Za4OfUi0/cwCr5PEiRElLU0mgdR8UUhd
         hNoJs8azHKZTISR5kHlG2TbiabuQ7MoBzaFQ0/g/SARrGQQI6mZjn2ZuDL1/BxwuMGAl
         uVVyxtDF2e5c+FcFSpdhj3rCeuXdeVgQ48G8RFRZR1N3UaDh6YGy9BQKS5wPgvtWzKIN
         L5yg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Xv4Ofm9Z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f11-20020a05620a280b00b007680efd52bdsi2477858qkp.368.2023.09.09.09.04.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 09 Sep 2023 09:04:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Xv4Ofm9Z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qf0Qy-0005AA-Ey; Sat, 09 Sep 2023 12:03:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qf0Qw-00059s-QD
 for qemu-arm@nongnu.org; Sat, 09 Sep 2023 12:03:43 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qf0Qu-0004Yb-J4
 for qemu-arm@nongnu.org; Sat, 09 Sep 2023 12:03:42 -0400
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-68bed2c786eso2555146b3a.0
 for <qemu-arm@nongnu.org>; Sat, 09 Sep 2023 09:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694275419; x=1694880219; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=w7nWhNtsV3di0blxBdyHCDW/RE3siec7s2CQf2wEgmE=;
 b=Xv4Ofm9Z2yGvXJVlHMGFY8OsPdludU7JFaZcqMWPw+efUAkOHJoH0EgSNhAkeAMx3S
 ADFkZfiADbMAGm+X73hcYJrt0Vy49PRn8mSwwHulBpS1Wiuw1O82xte5zjpdgqd2UpdJ
 mWOQMe8bPuBSGwliqOh+ln5yHbR6vc/9/Ynbej0ZFIuICFB6BgVzTNDtbMP+qfmxB0Y7
 Xy6zXb3jPhE3EjX8MjGb06euqMkaiZb5msrBL0LgGzj3agUNiJPFplivKx6NwSO4P+/z
 sKfLS3MW8jTiE5hIK5KwPnA4SQ97H6SMeSKVQ9YV6jgMpxZ30hNpvPC2iBaZiZt12PYT
 BR2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694275419; x=1694880219;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=w7nWhNtsV3di0blxBdyHCDW/RE3siec7s2CQf2wEgmE=;
 b=FvcxjulnII95ctXc0p8LWpolJyUJAOykUM1le50eM+ewco+g7sIL7APyIT3YeLvJli
 VAAZodyceyPwnZR3D9TMg4GRWg8/T2OhcYmDl9Nxx1CvcNDSjHwase9RHTfR3vOnDHLw
 P4uj2zpRVhyojdLFuFClppt7vEQWQE7zJblS7pzG2aaKt7SrS2BNTSOjJ/jCfHuoVe5C
 gU8RdNpAhN4PG/HGyTnQlr5T7gcQuZa4gs01WtHRT6ZkfiTLq+674XubIa3X+wQZTe8H
 Hznxb+JJezfSclax11u/A3ULkms5ZwNEHny/k1XJx4EGvg5PY4/uIAc0oLdtl35riv/u
 PRag==
X-Gm-Message-State: AOJu0YwMh1gCh4PQv5GUME0u99dlWMwSaFdYgAgYTRs9D7aOWPWygqey
 4J63f5WcMvRSPmMXlBV76QlhxgOsSsp7ZOrYypk=
X-Received: by 2002:a05:6a00:4c8b:b0:68f:b3ed:7d4d with SMTP id
 eb11-20020a056a004c8b00b0068fb3ed7d4dmr554561pfb.15.1694275418905; 
 Sat, 09 Sep 2023 09:03:38 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.131.115])
 by smtp.gmail.com with ESMTPSA id
 n24-20020a62e518000000b0068a4b944beasm2876187pff.78.2023.09.09.09.03.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Sep 2023 09:03:38 -0700 (PDT)
Message-ID: <183eb928-ce6f-365d-06e1-3eb21bddc9fc@linaro.org>
Date: Sat, 9 Sep 2023 09:03:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 10/14] target/arm: Define new TB flag for ATA0
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230907160340.260094-1-peter.maydell@linaro.org>
 <20230907160340.260094-11-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230907160340.260094-11-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.473,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: hiJngMRAtTMZ

On 9/7/23 09:03, Peter Maydell wrote:
> Currently the only tag-setting instructions always do so in the
> context of the current EL, and so we only need one ATA bit in the TB
> flags.  The FEAT_MOPS SETG instructions include ones which set tags
> for a non-privileged access, so we now also need the equivalent "are
> tags enabled?" information for EL0.
> 
> Add the new TB flag, and convert the existing 'bool ata' field in
> DisasContext to a 'bool ata[2]' that can be indexed by the is_unpriv
> bit in an instruction, similarly to mte[2].
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/cpu.h               |  1 +
>   target/arm/tcg/translate.h     |  4 ++--
>   target/arm/tcg/hflags.c        | 12 ++++++++++++
>   target/arm/tcg/translate-a64.c | 23 ++++++++++++-----------
>   4 files changed, 27 insertions(+), 13 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
