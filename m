Received: by 2002:a17:906:80c9:b0:9a1:ac8c:26bb with SMTP id a9csp514123ejx;
        Mon, 21 Aug 2023 23:28:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHW1tRbrHT1xd26E1Kwi5zYuYidaWDbrsywQLdd5naGUoVnizyS2KUpqd4NgQB6HBysv5mF
X-Received: by 2002:a05:620a:4516:b0:767:22eb:6ed7 with SMTP id t22-20020a05620a451600b0076722eb6ed7mr12287576qkp.4.1692685716556;
        Mon, 21 Aug 2023 23:28:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692685716; cv=none;
        d=google.com; s=arc-20160816;
        b=zMX+ibXZvE1sGKGr5toD4jOixq1pDGzYtgo/4VE/WbnNU/ybg/gnxWHZDSooTu7fb/
         loI3zi1g14m2o9esBZ1klaKEt2XVuvtUVaXiJ/oFJrh595PlhlX5T2Qu52h+N88BGL+f
         W1immaJeIPAP8WwVZJH799gkLoUX9N2gUULSWQ+Nz4sEW86zyY+4PyzEFNJKrdMDDsFv
         l8ODwfCJTO7tC0w7Me0dVO22cHCfJpCf56tLT5fwuDZd3mSIByDbxZfBRcBxMDXff9A/
         LaAfhsagFzMIMQgEcXyD2ld5UVVxHORp+yIpoofA+GB3+eUJwGbtfnSqI+3fiO9B5osM
         B7Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=DcOmhX0UxImlx6JRWL0lqNFcdjPz8w1x8hhLYwR9o/k=;
        fh=S2omy7SEfx7ESgw9Sr4fD7xBGLvhpvSX4It8xV2BD5g=;
        b=MZAZLfczeSHXpqJEmSojyfUiz3oxEvXXPDTCtMCwrxf5WL9FfjBRmRAizu5Mi0snrE
         sSDFZuEQXqDR1mrXYRzHT5EARqaqEa+K1PD3RmLiFP90yzQqaGi4ENUAifinx6CRrtsQ
         Do1+7zOjdMRIGi2J8XRthz5/q0jLQd1UKFMMH4pALQIn7kcTidF5J/T9Jj/zlcXIWNMr
         UCjGZgRWwKPkWMrEXs0A69ibfSm+wi/pAuztrCCC3R4uzAJmmhafWrjxBZuiQI9xVOmX
         Dwws0EnEFojtxWmnwbrHrIUggj6qKbRdnzrCzfymF/kHhBLj/am+bPtu0+nnnc9rhhy9
         39bQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iI0RU52h;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id rr1-20020a05620a678100b0076cc9ea95a4si5523184qkn.220.2023.08.21.23.28.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Aug 2023 23:28:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iI0RU52h;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qYKsL-00018m-33; Tue, 22 Aug 2023 02:28:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qYKsC-00013U-2G
 for qemu-arm@nongnu.org; Tue, 22 Aug 2023 02:28:20 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qYKs8-0000wD-A9
 for qemu-arm@nongnu.org; Tue, 22 Aug 2023 02:28:15 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-3fee5ddc334so15724135e9.1
 for <qemu-arm@nongnu.org>; Mon, 21 Aug 2023 23:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692685689; x=1693290489;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DcOmhX0UxImlx6JRWL0lqNFcdjPz8w1x8hhLYwR9o/k=;
 b=iI0RU52hw3lmY9LDuvz5dGegFfFDZv1+DkCY3TYSgDTEThb75ikPjEiW/AxO8oakMg
 N2WNkMGubcf9o2d/vX4lHyih4RbJTxpZKHIXQGAHTwxFibMqibU1xQkZnxsuh3udRP/n
 NjuVb+paF2b4Pn4zfz0Z29frLUFfPnfyWMDAnvNh0Ge3Y+05C3ak555gfcaoii/Eb9+D
 626DGr/TGnaRTI1akOfmxIOQE2YDY42Yei7eig7guzYm/MqyoJr6bcGBar5exvJZ807s
 +d4N1a5guCLnAHNJRYWyPBWUAlrLYYDYfc9a35jVVjgtE4zWUQjXIzup2eObxHrURSlu
 LrJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692685689; x=1693290489;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DcOmhX0UxImlx6JRWL0lqNFcdjPz8w1x8hhLYwR9o/k=;
 b=ATS1tQTsJTrrdphpG6V1hVmYspLaiBEx2/PbaopNPak+w8juKUXdU4ighAZ3Zb56qa
 BIPYqiOtV9fxA2vVRsKTuIjtdX9B2JitVZzOJORNG/wvvYEovSQOkwabN5sJLUHBatkd
 jOKMxDF9qp5SYnbyP4cqBaj/b91pCt5FmC/lS5QqwlJhk++glx8+nDS2vv3eMCM8QCMm
 gmxdOzuHvi3xXw3VfY0RqQRiZ2jND978o85Kpc2CprGTSFHFNBb/hVXK3lTNCjRBjH9S
 xRy3oo3knBSQflsGoilAfSThZd4JqCaJkokub+JhLuhtq7+ZNTklW3Mek/DMtHOMkHRg
 HyPg==
X-Gm-Message-State: AOJu0YxC2/64Ilk/mPdQsp+NBESpY7RKESzMbP4bO20z3hS7yF46e2x8
 /qicCL98AN1QhFEnxM/Cv90yLw==
X-Received: by 2002:a7b:c459:0:b0:3fa:aeac:e978 with SMTP id
 l25-20020a7bc459000000b003faaeace978mr6499974wmi.0.1692685689268; 
 Mon, 21 Aug 2023 23:28:09 -0700 (PDT)
Received: from [10.2.0.2] ([37.19.214.4]) by smtp.gmail.com with ESMTPSA id
 s5-20020adff805000000b003143cb109d5sm14699699wrp.14.2023.08.21.23.28.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Aug 2023 23:28:08 -0700 (PDT)
Message-ID: <543fa35c-e8ad-2648-edaf-420f8b4722e8@linaro.org>
Date: Tue, 22 Aug 2023 08:28:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.14.0
Subject: Re: [PATCH v4 8/9] targer/arm: Inform helpers whether a PAC
 instruction is 'combined'
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Aaron Lindsay <aaron@os.amperecomputing.com>
References: <20230822042530.1026751-1-richard.henderson@linaro.org>
 <20230822042530.1026751-9-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230822042530.1026751-9-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.374,
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
X-TUID: aUfc8IB22un3

On 22/8/23 06:25, Richard Henderson wrote:
> From: Aaron Lindsay <aaron@os.amperecomputing.com>
> 
> An instruction is a 'combined' Pointer Authentication instruction
> if it does something in addition to PAC -- for instance, branching
> to or loading an address from the authenticated pointer.
> 
> Knowing whether a PAC operation is 'combined' is needed to
> implement FEAT_FPACCOMBINE.
> 
> Signed-off-by: Aaron Lindsay <aaron@os.amperecomputing.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Message-Id: <20230609172324.982888-7-aaron@os.amperecomputing.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/tcg/helper-a64.h    |  4 ++
>   target/arm/tcg/pauth_helper.c  | 71 +++++++++++++++++++++++++++-------
>   target/arm/tcg/translate-a64.c | 12 +++---
>   3 files changed, 68 insertions(+), 19 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

