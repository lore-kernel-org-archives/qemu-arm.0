Received: by 2002:a17:906:3fc4:b0:a04:79f0:9a0e with SMTP id k4csp323476ejj;
        Thu, 23 Nov 2023 03:44:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFnz2Cm89cHWO1zPoIZCarY4h/7R1tkgIu17N7Hqaw+rqvePGWfM+CZuBDtYpJpSE8bpPll
X-Received: by 2002:ac8:5bd0:0:b0:421:c6ef:4b0b with SMTP id b16-20020ac85bd0000000b00421c6ef4b0bmr6973120qtb.17.1700739840808;
        Thu, 23 Nov 2023 03:44:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700739840; cv=none;
        d=google.com; s=arc-20160816;
        b=y/TNfAOSjIsluGPJb7OjbrZCGHDUMKcub+RXTt+r0R21YmjEVFyptXnTqvSsCFF3ww
         Q1BcckX5bDADgifthUUE64hct9Pt9UC9yR2AHOTddCjxau9LQHDjTFCd5wm4k/X2Pfw5
         xwQEN5sSOX6BrZQPDx6Dl7Ax0GKVVZyJBHvf96WwiLa1NVPGVhB0wSNl+a/naET02yMv
         aV0yPtivhHaDimPxXvEmRJZtoJyz385CyfrQSmRKptsfu3id46PeUTSUjofqdz1VqlU1
         ZOaQk5NgsFqputuklgeTJVKw9udldPPmip3hZChiv5otrVIv7uSdOCIYt2Tg/NtkfiSK
         PoJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=bIM5UEqWehBsQmzbJjzHyEtcHKBCJEdycvjvMpLIbZs=;
        fh=UMlouvVl3Ph4Ne7UvGTvosqVcNxKyKMHDiGsZppDwks=;
        b=zhMnzV0XJ5+3Xvl69NM20OrR03SfZdzIYdAwJUV02ccF4XW40gAht0V0DPQH+Mxlmx
         eZ6wXl4QvxAwpoAVBJww2yUFoLpaPP2xdHam/O6H8rAoiM5+FiEgeOCBG7dwtjV2p1UW
         81OtOMiL5I6dxLmZfR8d36nBmABhd5giWEEB4GK+JmpvfJ6zlnlnmsdXPAFasaSse5xL
         rOamFABT+/zhmJj4WeePgKwXzv9jSuVPBGtwqKwo6BaP8MYztpGRCeC1lMorsyRE9xZX
         EHdG/2+a6aWmSOJVgPjcOG/Ib+WG+zNYS2MG0kSCObv2RKYENw+jE9yETjm2bU+Bscrj
         NtoA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=a2wpClcy;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h9-20020a05622a170900b0042383e27757si1011734qtk.246.2023.11.23.03.44.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Nov 2023 03:44:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=a2wpClcy;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1r687a-0002BM-Pz; Thu, 23 Nov 2023 06:43:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r687Y-0002Ae-Ss
 for qemu-devel@nongnu.org; Thu, 23 Nov 2023 06:43:48 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r687X-0005sZ-1H
 for qemu-devel@nongnu.org; Thu, 23 Nov 2023 06:43:48 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-40b27726369so5041475e9.0
 for <qemu-devel@nongnu.org>; Thu, 23 Nov 2023 03:43:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700739824; x=1701344624; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bIM5UEqWehBsQmzbJjzHyEtcHKBCJEdycvjvMpLIbZs=;
 b=a2wpClcym2wZWhbvTN4wEof28Er0Im8H/zHmqHAIE82qOJcSEQnpu8wkfpH2eYFy8C
 O4IPrxiaQGYoAlIJ3pwXsXFWp0IA2CI/2Ivk2B0/AQerQUEmIcA+Rj8u+/zD5F+l4bnt
 UkQc//XzLn+Gwv7t5pcjPG3KpssDTztM+aXwm5ZL01vtPNY/dHoCfbLwTIdhG57xCd5l
 DRDHNP6urv0QoOUgg2OiY+3LsYtiMturR5Kj5Q6bABtNrWQcIjt0/gX2kgiruj9AxhmF
 AFtbkJeLXXaY2Wg0CN1Fpz8efe2UAu9PhalJ6QtqJohUXaBk0w9XsKGHgzuk3Gbf4a5H
 6gUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700739824; x=1701344624;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bIM5UEqWehBsQmzbJjzHyEtcHKBCJEdycvjvMpLIbZs=;
 b=Y6y67wV9pUF9r30jYmToOuWMbBk0fhaRpRQa+t81/4O6R1FZ2b60XshpY0u91ABlbD
 YQA8ePr1/VlFBELRZeMC/qGJ60quetNiqO2s3hHIHzCkPKkRBQdOGUqGuoWGE6PuBg1d
 9XH1Q/OiRBMKuo4mrh1QeZMOmyRfT+ePu446OaCGwyScXdoP84QnyC2g2pSWEPAASylG
 d99ERg3AtAtURqKXm4F1yTanjM68RjPFLBKWC9aS858Kf2O8+T/MC6HFHJ4mTMT77S77
 GTYtNaZ1koToNQp294rewVp4oVoQ+kfe7PkjAIp6/uDNfhrakjcAm4Wr4TNZ3YtJtm0O
 tKRg==
X-Gm-Message-State: AOJu0Yywv+30n5GkFC7ykKOdYTo6klpa/SCyH0ZS8vqTw/sV6AhvAYnO
 g70liZPUbN6CK1vP9M31YJPUgA==
X-Received: by 2002:a05:600c:4451:b0:40b:3854:30 with SMTP id
 v17-20020a05600c445100b0040b38540030mr110759wmn.8.1700739824634; 
 Thu, 23 Nov 2023 03:43:44 -0800 (PST)
Received: from [192.168.69.100] ([176.176.165.237])
 by smtp.gmail.com with ESMTPSA id
 h4-20020adfa4c4000000b0032d8eecf901sm1455905wrb.3.2023.11.23.03.43.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Nov 2023 03:43:44 -0800 (PST)
Message-ID: <da8dacbe-1f6d-46dc-89e9-c956e08246b2@linaro.org>
Date: Thu, 23 Nov 2023 12:43:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/21] target/arm/kvm: Move
 kvm_arm_reg_syncs_via_cpreg_list and unexport
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20231123044219.896776-1-richard.henderson@linaro.org>
 <20231123044219.896776-14-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231123044219.896776-14-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: H2/JgCXvL4hO

On 23/11/23 05:42, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/kvm_arm.h | 10 ----------
>   target/arm/kvm.c     | 23 +++++++++++++++++++++++
>   target/arm/kvm64.c   | 15 ---------------
>   3 files changed, 23 insertions(+), 25 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

