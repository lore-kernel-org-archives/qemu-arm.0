Received: by 2002:ac2:5ccb:0:0:0:0:0 with SMTP id f11csp592632lfq;
        Sat, 9 Apr 2022 11:14:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz/2ghTOdSEny5QJrDDcJZ35Yxewkjj1gA01VcEW1E2MaEKQy51m/FNHOtrbRU6abbDEtmj
X-Received: by 2002:a05:622a:188:b0:2ed:8ef:1f94 with SMTP id s8-20020a05622a018800b002ed08ef1f94mr6501534qtw.116.1649528077895;
        Sat, 09 Apr 2022 11:14:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649528077; cv=none;
        d=google.com; s=arc-20160816;
        b=itUCF/eRAwRr6sOAlReWwSL7hWWp9Bhgy4eVI8P0You9QzpPjnxj0wdcDTfchN1u9l
         X801ZioWH+19VzX1dvdz4O2aN1Obph7bnKXoGdZfelYVLxNsRyvi/mId1ZDyckKvJ7xZ
         UfuLLAhlgN/Sz0lssMQtg1nPOh2RIHScCZBOp7DCINAH2o0LmdiY2fKPG5zJqnXEHICB
         GFGRh+/QPYVqmSR169VbjCc4Di/usZ55VtNG+6NYIP7JgBR+oTvFJcdSLPto/7Luhltw
         g+4V0m/Xdt5bQJLb3SsQ/fItNARjrLKK5V+r8OctIZ+384/KOgmO14PYY8BE3gjzT21i
         A8Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=rRPxEgwcJ3oWKHXb9mESMq/3LvO0S26tuvaC6anwg9U=;
        b=a0Pb3tq5RvsHu1SOVWMGyYud2oUarxrYtcmgK6DlXysax+vBjk0/N90YLF0T6XLOOn
         1V9x6fiUdz9mz7cFeVD63BTwKvvLLtk+GHaxh0KWXQorodcgbKddXfsc6NOo+U1h9S1U
         g+csz60eQuxA1wYY0itWHK/ICf/ZIRmsmIap7DBkOxoDNQOaPf9WesqsuUwVLMk0GaMX
         B5ANp6G/fOvRBnZD1EQrU30jBGIPXe1zrF0djM9k3VVc31/YYp3Wijg7KjkA4x2X7ARv
         Y06mdlP+FNOpL2dXYhyAdN5TqehVURMM0EUsy6RchzdsHqCbuT5DN7GLEJn37KtvstCQ
         /AVg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bQtjQedD;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gw8-20020a0562140f0800b00440e46a7c9asi2300429qvb.312.2022.04.09.11.14.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 09 Apr 2022 11:14:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bQtjQedD;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ndFbZ-00073b-CU
	for alex.bennee@linaro.org; Sat, 09 Apr 2022 14:14:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndFaB-0006DU-R8
 for qemu-devel@nongnu.org; Sat, 09 Apr 2022 14:13:11 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:46715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndFa9-00085k-01
 for qemu-devel@nongnu.org; Sat, 09 Apr 2022 14:13:10 -0400
Received: by mail-pl1-x633.google.com with SMTP id be5so4655745plb.13
 for <qemu-devel@nongnu.org>; Sat, 09 Apr 2022 11:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=rRPxEgwcJ3oWKHXb9mESMq/3LvO0S26tuvaC6anwg9U=;
 b=bQtjQedDAMYO1xEgNlHlG1oJfRVTV2i+Kvs6+m9qy39YU45Z6vIWwWds+e7xshbT9c
 GQdJAdJ6RwSuWcvRBOpDsWqRfqBBUMWbFjo2RwWHAEBrcdx7HNnqMObw4biuwoHhAZsF
 zAaf57I4F6mPXSmUGipS72n/C0fl2tyixhy6P2AWgrTswuo+8c+eSbXE04GwGVQoNn3J
 qY7y4zF7QTnLRRSWcbUKr7nX8sKy5CsT9Mdx5fRCdYfBN2gOSu8DQC41gBFB6zL0TDnd
 dDVT4L4tu19BtjnVmIRALmXnD9dig/3aUO4laIIAP52t7Wrf4N8WyjwQAcFT4UFbnype
 VzhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=rRPxEgwcJ3oWKHXb9mESMq/3LvO0S26tuvaC6anwg9U=;
 b=n1t1ocxFXiHCMH1EvkD6yfjMnzmTVATh3vhvIOa1YHSQacphgmlSv8Fzhy7kaLybSv
 MhcizMvmJyrjAsRN6a4p+Bc0Y1rhUfdXQS+opE9caeZnwXb0v/qtU7NqhBFyNYunn91y
 PfO5yzCThe7lj/D8gw6EZNIDpMZl09yBqnQpM6OirPQQurq0Se8qR3YVQZaCi0OfG5eb
 n6cSJDDcQnj/OupHsemonDe0984yeaH1cvWCn8j2ZkYxtCDkz32eIjEZTGQMNtSH78BG
 YMtGMmihRzJjwL1GiRDs27zT4zprlscUju9kbL5hPrHS9ksCEmpRhZdT0NNQ24/7HE5+
 RWbg==
X-Gm-Message-State: AOAM532glhPd03ZemSPQtY0AUAH2Gbou6H4Mj31nEFwwrVONcxgQeSSr
 5P3qUn7ddhNk6tCFDNNaYSPW6Q==
X-Received: by 2002:a17:902:ec89:b0:156:c5db:356d with SMTP id
 x9-20020a170902ec8900b00156c5db356dmr24734182plg.74.1649527987477; 
 Sat, 09 Apr 2022 11:13:07 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 196-20020a6300cd000000b0039940fd184dsm16523171pga.9.2022.04.09.11.13.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Apr 2022 11:13:07 -0700 (PDT)
Message-ID: <9016c2e2-b665-686d-43db-b80f0a6344b1@linaro.org>
Date: Sat, 9 Apr 2022 11:13:05 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 16/41] hw/intc/arm_gicv3_its: Implement VMOVP
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220408141550.1271295-1-peter.maydell@linaro.org>
 <20220408141550.1271295-17-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220408141550.1271295-17-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Marc Zyngier <maz@kernel.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 18Jm4M9dHT0W

On 4/8/22 07:15, Peter Maydell wrote:
> Implement the GICv4 VMOVP command, which updates an entry in the vPE
> table to change its rdbase field. This command is unique in the ITS
> command set because its effects must be propagated to all the other
> ITSes connected to the same GIC as the ITS which executes the VMOVP
> command.
> 
> The GICv4 spec allows two implementation choices for handling the
> propagation to other ITSes:
>   * If GITS_TYPER.VMOVP is 1, the guest only needs to issue the command
>     on one ITS, and the implementation handles the propagation to
>     all ITSes
>   * If GITS_TYPER.VMOVP is 0, the guest must issue the command on
>     every ITS, and arrange for the ITSes to synchronize the updates
>     with each other by setting ITSList and Sequence Number fields
>     in the command packets
> 
> We choose the GITS_TYPER.VMOVP = 1 approach, and synchronously
> execute the update on every ITS.
> 
> For GICv4.1 this command has extra fields in the command packet and
> additional behaviour.  We define the 4.1-only fields with the FIELD
> macro, but only implement the GICv4.0 version of the command.
> 
> Note that we don't update the reported GITS_TYPER value here;
> we'll do that later in a commit which updates all the reported
> feature bit and ID register values for GICv4.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/intc/gicv3_internal.h | 18 ++++++++++
>   hw/intc/arm_gicv3_its.c  | 75 ++++++++++++++++++++++++++++++++++++++++
>   hw/intc/trace-events     |  1 +
>   3 files changed, 94 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
