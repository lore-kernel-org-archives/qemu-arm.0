Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp2709063ejb;
        Mon, 20 Feb 2023 15:31:31 -0800 (PST)
X-Google-Smtp-Source: AK7set9aKdi2FwLTm9HvK3FcFu297WQmPpDb/boVet4kz0s3J3yiMvgGvLdlHUCK0Amu0CZjzRC5
X-Received: by 2002:a05:6214:2508:b0:56f:8a99:1a7a with SMTP id gf8-20020a056214250800b0056f8a991a7amr4187797qvb.23.1676935890808;
        Mon, 20 Feb 2023 15:31:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676935890; cv=none;
        d=google.com; s=arc-20160816;
        b=OxloVPALg7PDa4V6aNfEkf/z+dck2PzfTgyctUu7wQFbxa2XBj3+lnSkHcha/yeIdQ
         kuqyObRxSVzBpPP0sst50AfaxDeYh3xBZ8gyXsk6igbYS9LP67hd3fjSkS3tewHdR/Ws
         LGFU3gvX8S6J6OpMUFHOcSYENgsmGcUlejZFLPUjuL2+RbDvRiW37nwxi+HNX5gRkovX
         /q7FvvmQRMv1Jv8TV/jGZCyM4VtVqmZCDrC3HFEmiugobLNi877PESy0Np59Ja2uMt8m
         fXmwRAx7LN6dOfuJypgzDwH4JD6EcEHEDWxuoiVEXe4hAV3TLn0G8KmUEgtCLW6hSVzf
         YcTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=Z4WfDmG+GycnFhNsHkQnhebQ3MP2RsxeLNc7lNelRjs=;
        b=GP349I3AKAFxYKMP1AiocarX53mHi1Fwu+e0Qt2E/M3uTD6/R9rWCIhMy+TpGISoqA
         A9Ae9hnh+ZYvASQq1krOU8slgnKk7kACSM9zcHdrKoY6HcIJxAfos7yRFTN2bZ6dsy9r
         CNgapiauE1uNgCi7u2se41hvucvHLpqORGS4rdjRtzRmLzIVgT6s6esQk4nLvCTCHRHG
         ytDtb0YAmMCLQ7/04tqha9lcvacAi2pIlFpCyWG2riNgMQVZDkk3H9Ryuw2Vg8NnILDV
         rZpMszHm+73fLeEBfg3EFMk4JRbS38WA7Pn7a6YjjB0fSmTr+mSbkbH3mqaar5aTfnMx
         8qTw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="iaJa6/U6";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k5-20020a05620a414500b0071b29b9792dsi11079230qko.351.2023.02.20.15.31.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Feb 2023 15:31:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="iaJa6/U6";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pUFcr-0002t8-Mn; Mon, 20 Feb 2023 18:31:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUFcp-0002ji-SM
 for qemu-arm@nongnu.org; Mon, 20 Feb 2023 18:31:15 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUFco-0001BF-BZ
 for qemu-arm@nongnu.org; Mon, 20 Feb 2023 18:31:15 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 nw10-20020a17090b254a00b00233d7314c1cso3023794pjb.5
 for <qemu-arm@nongnu.org>; Mon, 20 Feb 2023 15:31:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Z4WfDmG+GycnFhNsHkQnhebQ3MP2RsxeLNc7lNelRjs=;
 b=iaJa6/U63SuyO0+6UE9RLSkXI86YSpOa032JPSCCxR3UwB6wK+n6E3BGxpaT+mqqiQ
 vqhwjDN+Sig6N9MYhg1ICShR4w/NDG2/k2ZUt6Fl3ch6NWCRYj6nV4kJCIkU5Zh1gdGR
 00roEhU4bzJl3RNOIhMpS4PRTbuXKNrP5pxkGHCV+ZBNDzLWJ+NlSkeVQMQgutB6zMsk
 WvYIpdvOVLPcB41xaCS5LTUERnGTpopbAeuXerZpkbtBWUWBA4pH2Mz5kRsBQfzaId1x
 xne6uglZf/H3oy+cnilBsqcvp7ejAhu6NgL7Iam1HzSsL+1Regmrc8QGZ2xGg2Qcpv/m
 3r/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Z4WfDmG+GycnFhNsHkQnhebQ3MP2RsxeLNc7lNelRjs=;
 b=s6zjx03cdO6ONaV2qcGLdO2yo9oRHE2hrswTreXSs2NXn5rbp2tuBsqJT7JNgD2BSp
 I4tDPRKOZEDvl4ZCsF0X4njnxwHgt0hswku1nWlItsm1PVtqmoscs++uKivAloTBaFAK
 EAYihim7UdrWpkyiVmZ99xGXiy61NC+1dgjiIiopJ5fWkkDWtDvCQV4dBLX7r/NG/JcB
 YhOJ0beWHjcGkDwhp3WKnYXaG6vbIbQ+l7p67DpfVRnwZxjAcf5SKzDp8zK32qfv1DAN
 DFdG8/yJfsjDn5GsnFQOUUoPzIPk0Y2lWQaV73HWsZDSyHcJXu8rEMRJRLav41tRxhwV
 cvrg==
X-Gm-Message-State: AO0yUKXaavmc9aSV4ON38jImJy3/p+KWXqGjuiAYQivYdDwuyTGw2s8f
 bOL6x17d4a2/HGE8O9KJhcig+g==
X-Received: by 2002:a17:903:230b:b0:198:b945:4108 with SMTP id
 d11-20020a170903230b00b00198b9454108mr4040443plh.0.1676935872812; 
 Mon, 20 Feb 2023 15:31:12 -0800 (PST)
Received: from [192.168.6.128] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 j4-20020a170902c3c400b00196519d8647sm8504966plj.4.2023.02.20.15.31.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Feb 2023 15:31:12 -0800 (PST)
Message-ID: <44e82a43-648b-79bf-63d6-cfd4475495ca@linaro.org>
Date: Mon, 20 Feb 2023 13:31:08 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 21/22] target/arm: Enable RME for -cpu max
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, yier.jin@huawei.com,
 jonathan.cameron@huawei.com, leonardo.garcia@linaro.org
References: <20230124000027.3565716-1-richard.henderson@linaro.org>
 <20230124000027.3565716-22-richard.henderson@linaro.org>
 <CAFEAcA_NQ=-nS4qQ3QQE6_9fn01YkJgPiwsPq6XDCCpYy4NkjQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA_NQ=-nS4qQ3QQE6_9fn01YkJgPiwsPq6XDCCpYy4NkjQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: TDyTZMiUN9Ba

On 2/10/23 04:20, Peter Maydell wrote:
> On Tue, 24 Jan 2023 at 00:01, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Add a cpu property to set GPCCR_EL3.L0GPTSZ, for testing
>> various possible configurations.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> 
> Looks OK, but I think we probably shouldn't enable RME by default
> until we're happy with what we're planning to do at the
> system/board level (eg should it be like MTE where it's only
> turned on if the board has support and turns it on?)

You're probably right about not enabling by default, and certainly right about figuring 
out what firmware actually expects and needs.


r~
