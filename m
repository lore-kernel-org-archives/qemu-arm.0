Received: by 2002:a17:907:1006:b0:9d0:bf65:29fa with SMTP id ox6csp2291160ejb;
        Mon, 20 Nov 2023 08:08:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IExVOAHBl+SdBcCKWrshxq3OJbpoNYz4BrcrJNTSR/YA54Wds6ZMkeESj5U/jclXw8jP6W8
X-Received: by 2002:a05:6214:1247:b0:658:997f:79b7 with SMTP id r7-20020a056214124700b00658997f79b7mr12193495qvv.3.1700496533995;
        Mon, 20 Nov 2023 08:08:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700496533; cv=none;
        d=google.com; s=arc-20160816;
        b=hHpsHuos5nDtrOCpgIiTZqC3VMLymJ70jN9LZyXH9gKr6cLdUuGMSuK2E2ffpKjmQ/
         Me32oyWq6as88V2VpI5OIJVZbFaPVy62XhppKV86rffhXA4Susi+0nKoK9xOiuXqVbjK
         he02qF+lMyHLzSIVjhPPhYo70V2ppWKXPFDG9eBHjy7UYWu1y+y+RqhhslE2ymeeu9/P
         A1tG8xFa8bOMbr0lT0t6T5UwdoL5s4SfF9SVcIXAlLxjbjlxxlcPNeuODLQQr7xzea9C
         l+rdaE4YHBldTkiI2Jr2AMDN6YUMd3DRpFP4/MMroxNq/xCCT0b4AcP/wUjH8TvL0miU
         Y0+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=spY+bVUctbutBFaAWliQ/V61LM81iYfTCR6LfYrcRI8=;
        fh=PRoHjD/djUAHQXeMIrzpgUv27otx4sratw48fpw7M0k=;
        b=gWQm/oe2lv74xB6mdE/wjast0HXVT0kzmNyu5AOkF4Q/You2inoG2wuhLYpAFyWVIe
         AqGo5OmT2NhWHntOigm4RedDzjeaUdkbF5q5Y+s76UPJnAv5azCeUb8zvgMYUHjKmQ7C
         85w5Q1fecAqXFQ2QhFvEmMnxXIc2eZOC16vsanWfdmSZHonP5Gy7gUat4kujyjv8lo1q
         HwLRI60GTPznSd6tqTSi1dCdsFHkS0FSFg1P9xEAcp5TkhC/7cDPowFXtDlKKzMxYScK
         wfV3TbTvjgALYoXlHq1OMViRWWUkcwS2Fmg3PV+bhUBmjG7Iys+S94gOgYEzZ4QSXxVi
         bljw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EGUtEXa1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v17-20020a0ccd91000000b0066d0a9f4d0fsi7537599qvm.527.2023.11.20.08.08.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Nov 2023 08:08:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EGUtEXa1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r56p8-0007pZ-Gi; Mon, 20 Nov 2023 11:08:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1r56p6-0007nl-DT
 for qemu-arm@nongnu.org; Mon, 20 Nov 2023 11:08:33 -0500
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1r56p4-00062k-Pe
 for qemu-arm@nongnu.org; Mon, 20 Nov 2023 11:08:32 -0500
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2c874286f4dso22690421fa.0
 for <qemu-arm@nongnu.org>; Mon, 20 Nov 2023 08:08:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700496508; x=1701101308; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=spY+bVUctbutBFaAWliQ/V61LM81iYfTCR6LfYrcRI8=;
 b=EGUtEXa1Qanh+NhfZ1n8cANciZGW4Cpu6ZnzQp63/4LIFmcGlF61Qc+bPe4p/HSGQ+
 wF7LJnISMCDl7CvmahvBqS/3pMPbbMee5tEwX+etx3PyBEpOeutIu7FSm31Jqe7L2/DB
 EVw9esgw3XVfDWv+R2ZQg8DjZ+SyZ3H+Qu/TJigwoql7kokrpT91wNQko99uWOjZNv9W
 u8vShho9c7dEeehdfScd2rAg7NIB5V3YLVvfNq+dAgU0s6jcn1hV5skW4f5mMmqIni0V
 6XSxWcSfn0b8bVR8x4/gWoG/USaXoZXrf93HBojKbtyq0Ojd/h0S/ub9tnhJ7E+1RU/k
 1twQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700496508; x=1701101308;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=spY+bVUctbutBFaAWliQ/V61LM81iYfTCR6LfYrcRI8=;
 b=KEpNGJea4LB3H4acZjA8FA5owT4poSzDh1bMmJAmrhw/RV57s+kGoVZQDqKBAnnzV3
 VNDpfjVyNjQNg0XTCUxiZgURhXC4sGQNwXshRZ7amgjm6c5uZQVY/yGlmgTMAqoU9feK
 MvxvEg+ebyefK4t7lXWd5cUERfZQPP9u49rF+0igH2UbmHSXyi3emZ+dIhl4EepevZn8
 q3DmNRFw8sHeCt6uTu0nPlPKA2RYOZH9uJrYIwqFA2yD78frrYkbLwOjqvtuKlu3HQTx
 e8EE8IBrxWrZSyhAninYCmQCPbTTZ8rOs3nLA0p5BPLOsl86N6sXcu2EqF2BncmPQ6n4
 /J/A==
X-Gm-Message-State: AOJu0YyMtQg2zXEUtC1QngG23clCqoLAtuYeh29Lc3Yy0GwObt95JsO8
 2FbsqQqTxILtE88VikxsADfD6Q==
X-Received: by 2002:a2e:a367:0:b0:2c8:8479:51ff with SMTP id
 i7-20020a2ea367000000b002c8847951ffmr949726ljn.26.1700496508024; 
 Mon, 20 Nov 2023 08:08:28 -0800 (PST)
Received: from [192.168.174.227] ([91.223.100.4])
 by smtp.gmail.com with ESMTPSA id
 r13-20020a2e994d000000b002b9e5fe86dasm1059373ljj.81.2023.11.20.08.08.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Nov 2023 08:08:27 -0800 (PST)
Message-ID: <8960014b-9f2e-469d-8e6c-5c44d26c2304@linaro.org>
Date: Mon, 20 Nov 2023 08:08:20 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-8.2] target/arm: Set IL bit for pauth, SVE access, BTI
 trap syndromes
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org
References: <20231120150121.3458408-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20231120150121.3458408-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::231;
 envelope-from=richard.henderson@linaro.org; helo=mail-lj1-x231.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: cTvFCo/9V1SR

On 11/20/23 07:01, Peter Maydell wrote:
> The syndrome register value always has an IL field at bit 25, which
> is 0 for a trap on a 16 bit instruction, and 1 for a trap on a 32
> bit instruction (or for exceptions which aren't traps on a known
> instruction, like PC alignment faults). This means that our
> syn_*() functions should always either take an is_16bit argument to
> determine whether to set the IL bit, or else unconditionally set it.
> 
> We missed setting the IL bit for the syndrome for three kinds of trap:
>   * an SVE access exception
>   * a pointer authentication check failure
>   * a BTI (branch target identification) check failure
> 
> All of these traps are AArch64 only, and so the instruction causing
> the trap is always 64 bit. This means we can unconditionally set
> the IL bit in the syn_*() function.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> Cc: qemu-stable@nongnu.org
> ---
>   target/arm/syndrome.h | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
