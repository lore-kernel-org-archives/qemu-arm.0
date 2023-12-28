Received: by 2002:a17:907:c9e:b0:a27:13b6:eed5 with SMTP id gi30csp1243787ejc;
        Wed, 27 Dec 2023 16:36:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHYUcB5ZTT+mtuN2GA79uDH1DCltKLeKtc99NRu1x87eV1UdtJFod1HVEplA0JH6NxLwPl2
X-Received: by 2002:ac8:5a11:0:b0:427:eaba:8e55 with SMTP id n17-20020ac85a11000000b00427eaba8e55mr3535503qta.27.1703723777493;
        Wed, 27 Dec 2023 16:36:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1703723777; cv=none;
        d=google.com; s=arc-20160816;
        b=miAO2KPMczxWoq0A44EFr4dtGuARbadHezc2Jscnk+wGJIA9MWhtRM8cdQ3VcbnGXN
         SOk5VQE4whuHTndn7YFJrkC497VTMLB1J7XakePGlSgdw77sfC2pKI1FcoDqoPdlK7en
         AilKD2hvPfKvNJXboCEnr1vUpbeNqUiTir+tochINbsBqn3aPcGZTQfaGpWDpirWdQN7
         g1LochaTytWwf5P1nRs2zD1xOa3ckIL0TteOJN4JKQI0z27ck2CgVIfeju8qZdi05+zZ
         yq6HRdlbcnaKIinste2MXRKTj5175Hz63R3Yv5xDgT0buk9FMzxnOV/okHjsFhFlYLJ5
         Oh2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=psuphBxHsi+8TV4IpOtqt9VCOF2n/GnOnM6qRWZGDrs=;
        fh=+xj4Yfkfa7hWRbLS+DTrcNY2o0evBrBbm0gAigyTnIw=;
        b=X08q1g7TZaJnOcu2bdjJgA4BRqUdSNVM+0o80qs1c4QgGFKDwlJPU2OFO9KGY+5Rxo
         qHxLOWInUJd19kb0TgDfiBqqwKuIWcVE2bUSl0zphmNtmvvxF/FgO8A1e4sTNebIjHlR
         6mwBqkdc1fkFntt0+EyFxJ0pkcXBazanPh2/PBMSAmcaLrYUKAfbRAwTFilnqI0RF7Kb
         II791B5BasEAMUQ8VWWvRe/4a0FlxdUKcGvBi4IsR2VJWKQ3oj31Ogn0LaYiwPKNqKXN
         hlG1U1DpCAXjBaisgtRQflMkEOpiHQeckqFB0NmZsEZvZEV301jImvLZ+/TFKq7Nnijd
         WJug==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YeJnGV2M;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a6-20020a05622a02c600b00425814dc80fsi15533019qtx.333.2023.12.27.16.36.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 27 Dec 2023 16:36:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YeJnGV2M;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rIeNI-0004ZL-7f; Wed, 27 Dec 2023 19:35:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rIeN6-0004OZ-Ts
 for qemu-arm@nongnu.org; Wed, 27 Dec 2023 19:35:38 -0500
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rIeN3-0002fZ-Ik
 for qemu-arm@nongnu.org; Wed, 27 Dec 2023 19:35:36 -0500
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-6d9344f30caso3733220b3a.1
 for <qemu-arm@nongnu.org>; Wed, 27 Dec 2023 16:35:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1703723731; x=1704328531; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=psuphBxHsi+8TV4IpOtqt9VCOF2n/GnOnM6qRWZGDrs=;
 b=YeJnGV2MMK9mH1qsHJQcK755Xi8Z4te1nD3xYI9cs0PeDLdJ9ssZegiBlg8QKmhQO3
 AtvRGEEVvFqhB/8Yr1t1rdCDHGNg+z+UBuTJbHDG4w4h4uosAvvSBG94EHce1B0EEfg7
 cFSCmDs3/1oYNmV4yuqNlsGKVgwWHMmIZ8x4pI97zif//TjJGO9OpWZEixRFlR0DmSBe
 AMcYqltDuvVeM8UXhVRaoCssqCrqoSzLHoDfWKBBvjAv8aTM2PE+5aWcbaybDUWHyfDa
 L4FDddQPtZqV2HwUwGn9Zxspy+AyK63uYrRgIKXCmB3FwrVXOuSw06PMcksS31psG87n
 rzIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703723731; x=1704328531;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=psuphBxHsi+8TV4IpOtqt9VCOF2n/GnOnM6qRWZGDrs=;
 b=LzZSRriKR/ge5gIV0q08+A1bfb98WJ7rl26Uw7jIsZ3D0t+oJdnfnVu1zErTbjPd0t
 dddv2jPiOzg4juCYism6pVQLzPSw038kkYSxIgssLgnqNc9GkWK3dFg5Q3E7UPitTeFp
 z22tyZ5bBpISwQfDDm5d8ViV5fzr4IGqgPdmiuoe44uoc2fWiUljr+8qYCSfA0H2R73a
 NcXV9OsZqEgQBGOa2RlevX/s7XcGW5MMEoCdEUZ9wqLHmTKi9oWY6NZSagQ7x1S3YuJP
 a6cSJ9XcjWEYUGQFNRHaX7B4zuVVCYPjPz/t7m604tkdiQcTngIVQu9cTO//TWooMeIY
 Xjkw==
X-Gm-Message-State: AOJu0YyogXwQvIX5Hqj0B4a94FZ+kSvIUH5zUIlzIOUn5inGyZmwtxn5
 k6Zwk2HYjC26C0q71Bh+3ptFq67jiRCtlA==
X-Received: by 2002:a05:6a00:1d0a:b0:6d9:be60:9b93 with SMTP id
 a10-20020a056a001d0a00b006d9be609b93mr6105884pfx.12.1703723731250; 
 Wed, 27 Dec 2023 16:35:31 -0800 (PST)
Received: from ?IPV6:2001:8003:c020:6900:12c1:9684:874a:fb3a?
 ([2001:8003:c020:6900:12c1:9684:874a:fb3a])
 by smtp.gmail.com with ESMTPSA id
 w22-20020a634756000000b005cd945c0399sm11861840pgk.80.2023.12.27.16.35.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Dec 2023 16:35:30 -0800 (PST)
Message-ID: <e0bcbc40-6d5d-443d-9003-6dd76f96c771@linaro.org>
Date: Thu, 28 Dec 2023 11:35:23 +1100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 28/35] target/arm: Mark up VNCR offsets (offsets 0x0..0xff)
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20231218113305.2511480-1-peter.maydell@linaro.org>
 <20231218113305.2511480-29-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20231218113305.2511480-29-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: dWsAG08TlFmU

On 12/18/23 22:32, Peter Maydell wrote:
> Mark up the cpreginfo structs to indicate offsets for system
> registers from VNCR_EL2, as defined in table D8-66 in rule R_CSRPQ in
> the Arm ARM. This commit covers offsets below 0x100; all of these
> registers are redirected to memory regardless of the value of
> HCR_EL2.NV1.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper.c | 12 ++++++++++++
>   1 file changed, 12 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
