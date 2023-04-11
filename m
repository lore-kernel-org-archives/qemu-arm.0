Received: by 2002:a17:907:2c4d:b0:94e:1233:1117 with SMTP id hf13csp408483ejc;
        Tue, 11 Apr 2023 03:53:35 -0700 (PDT)
X-Google-Smtp-Source: AKy350baQIEhEGuW6O/+Pi2MWfLAfCDPS0p7EvRomuO4mZq3NQOzj+EwVMJqoLjASaSuddjnQmwq
X-Received: by 2002:ac8:5b8e:0:b0:3e3:8502:fbcb with SMTP id a14-20020ac85b8e000000b003e38502fbcbmr3056036qta.40.1681210415715;
        Tue, 11 Apr 2023 03:53:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1681210415; cv=none;
        d=google.com; s=arc-20160816;
        b=zFSg5wkjCyRlxsgNYYOUT14fKPFr9SAUskf3BBc7Zzf1coOyenJ/pUfqofpM7Yk4Ne
         nuc7U2S3F9xCpoB7y5PKY4A7wA3sjON1vBHwfk98yga59E+LrXKrLVPc3CbwLRyMbRBM
         BOwsB1fXjQczOEQJrB+ErLXbdLvxlhAJlz6eaI4Kuetmstu+CX6z7siz9kkspqIfJhbY
         RXbCWAbfqDsgrwVQCskjLrA73Bn90PgGJD0t33LG54IVDHu9I6Ug7X/pZc+S8Psl75jl
         kePdFWfbHxYpUN5/t0xw3ztowqkDu0WQQ/lDwr4iOIGAkPu9np1PvHyJ1PR6B/nukbgo
         chtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=L3CwoKV5LuALpCo5PXpMcPu39Sbz3HucxkjjMnt5HNo=;
        b=B0929No08aL7J3K2sXbCy1aLjZxKuVnKsOyA0LV0uoKIQ0i/zClctM85ArEEdoXJLM
         79a8TC+mYu6wxeIYB7fHvzbezzbUBLyVkMx3v9ZzuWGBNpqzI1x6//pqNjGktuF+Z06a
         odFc3Kci4BtYDBKnNvyukJucD/LVKWG/csMMtr20park3CB53x6O+S2Kbno/0sBjzYYl
         3qFemk76g3M+tj82z/VISdj7yo8S2e4H3o0kKHPRV0ZGweXtdCik9S8FZlNsjOb17O62
         nmF4F5sYZjthaggSOoyUs9OVbZCD6UYAk/R4uHwJ04fYgPJUhGAtNKGbn9U8QBW113vQ
         zWJw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=U0E31ric;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 8-20020ac85708000000b003adff1955edsi8706004qtw.662.2023.04.11.03.53.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Apr 2023 03:53:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=U0E31ric;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pmBcw-00045U-G4; Tue, 11 Apr 2023 06:53:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pmBcv-000455-Pb
 for qemu-arm@nongnu.org; Tue, 11 Apr 2023 06:53:29 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pmBct-0003g9-SG
 for qemu-arm@nongnu.org; Tue, 11 Apr 2023 06:53:29 -0400
Received: by mail-wr1-x436.google.com with SMTP id g5so10465915wrb.5
 for <qemu-arm@nongnu.org>; Tue, 11 Apr 2023 03:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681210405;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=L3CwoKV5LuALpCo5PXpMcPu39Sbz3HucxkjjMnt5HNo=;
 b=U0E31ric7SxoCG+uQ/U7kWtifhIiaF2pQ3w/hawO2GPXY8/7mFoa0kqwwnOFw+WJgB
 59KRYC963uiNZFPivip8PExH4XX3BMEHG7SqvcRmM/X0hoAI6wks3sf/FFsSBILE4Ntu
 cpsPxHH5f1H5PIuJVxgClj2PlPY1sYLZmqY1ZE4Xb3riwb0Q7yzZiP6VWDjDCwNi8VqK
 Fm6i7x4Dkg5OW1/p55RElcVXypF2otz/rSaWjJfYqHbGuhoZj4DtrzrDIKrJ75uaFwPq
 BGj53yPnCt/N6YoePIp49Bf+x9WU7jys4gOifFRIgNsck+CZ95bLWUKYqvyTo1GEMbjE
 /FAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681210405;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=L3CwoKV5LuALpCo5PXpMcPu39Sbz3HucxkjjMnt5HNo=;
 b=DQGMTHl++62gsS67nrNK82DuD4jlKHcy8A5NI3C+ARqFS87odYukWW+ByClDAO2pg1
 nX7TQg/n/ypbCR+Uy9djctjomk2+2ypW4ULc83yK6wWlUneM1f/9TgOY6g3pDraMiqQd
 ypra35sJpKw4qgN8e9CS/H4f1DhBjUbLsL/AEcLbqFEJ/niIDavCFBv5KDxhpOs0+rQJ
 GoBglY/fNLPf5yy4QEhWOWJrsffzFLOWlsKUvbna/XSX0CADlEBvgqkN2LusJxasd+1f
 vThoc3MpGhXoT8af62z7j0mnQ32P8+71VJ51Hez5uOWAwsaLhbOrL3bmXwaGHBVkn8i5
 s3wA==
X-Gm-Message-State: AAQBX9fBskyN7lFmOTc9aN2nJScI56cvVks94K4ZoSW0r8JUaNexQaes
 0QrB3S34UMRuSnAJa8QPBzLoLA==
X-Received: by 2002:adf:e2c3:0:b0:2ef:bae0:25a3 with SMTP id
 d3-20020adfe2c3000000b002efbae025a3mr7037166wrj.11.1681210405477; 
 Tue, 11 Apr 2023 03:53:25 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.195.239])
 by smtp.gmail.com with ESMTPSA id
 l13-20020adff48d000000b002d45575643esm14172760wro.43.2023.04.11.03.53.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Apr 2023 03:53:25 -0700 (PDT)
Message-ID: <4d828a37-96ca-8908-cb32-79f2824e7389@linaro.org>
Date: Tue, 11 Apr 2023 12:53:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.1
Subject: Re: [PATCH 02/42] tcg: Replace tcg_abort with g_assert_not_reached
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
References: <20230408024314.3357414-1-richard.henderson@linaro.org>
 <20230408024314.3357414-4-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230408024314.3357414-4-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.17,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
X-TUID: 04J2P2K/uLr7

On 8/4/23 04:42, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/tcg/tcg.h            |  6 ------
>   target/i386/tcg/translate.c  | 20 ++++++++++----------
>   target/s390x/tcg/translate.c |  4 ++--
>   tcg/optimize.c               | 10 ++++------
>   tcg/tcg.c                    |  8 ++++----
>   tcg/aarch64/tcg-target.c.inc |  4 ++--
>   tcg/arm/tcg-target.c.inc     |  2 +-
>   tcg/i386/tcg-target.c.inc    | 14 +++++++-------
>   tcg/mips/tcg-target.c.inc    | 14 +++++++-------
>   tcg/ppc/tcg-target.c.inc     |  8 ++++----
>   tcg/s390x/tcg-target.c.inc   |  8 ++++----
>   tcg/sparc64/tcg-target.c.inc |  2 +-
>   tcg/tci/tcg-target.c.inc     |  2 +-
>   13 files changed, 47 insertions(+), 55 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

