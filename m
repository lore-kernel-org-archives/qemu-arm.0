Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp1993078lft;
        Sat, 2 Jul 2022 07:06:03 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1smx0YP0qu4T3p/hT/Sk1SJoptXEbfYnnI0DLu1n9hs7OnSR/XojvZoq2I3aI2RzIdgaVe0
X-Received: by 2002:a67:ebcf:0:b0:354:2c34:9a76 with SMTP id y15-20020a67ebcf000000b003542c349a76mr13600743vso.46.1656770763029;
        Sat, 02 Jul 2022 07:06:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656770763; cv=none;
        d=google.com; s=arc-20160816;
        b=fxPLyH2yP7zZxpvlUWwxrd7GxgXBmL6DE3pZZKdibpDVrvLNV5eGAvjUAeBhCUkbxK
         GezS+kjcHG006ctMnFdCL1ZTpuEhhGPpQVVRD2DnPSf4E4mlwgzTe0HvF/xEHP65H2/2
         mv6fSyaNTAQigmMACg7AeTcCuHZLDBBBLPG1wxd10+WSWXOpVrAt+YavKoUO6H3UMMhy
         Y9W9KZGtDoY4PeIlitwnnRpCgfIUQr644YwjWjFTavpYt/aVdzIWMmXVXqWPcNZ4j0EU
         q7bp3BoZOojxJ5IxitRuVLN0RRvRXune+nxsofpQcou77mHhuG0xXhStv/SOaqrF3C4D
         lisQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=1JuR33BzYqyr6+KeHpsJC16sqyi/shf227lMYu09cj8=;
        b=Qw0D8kDdmMrqTPYfuA0zbw4Kt7pABlylGPlEwVeSkSp0OnoeSABxgp2m7xAzIGhM0n
         3E0OEiLHNPW9WmH4BdrUduEqKN0jmxdzPDKMpDxbfJxFgTmcbdt4bLwit74k7euZKmc8
         0LHDYafuehw19RjCzhNTzrwZ4dvZE6VL/5IrgxsHKfR9z1tzdszCPHgVDS0ehBXUFERd
         7Q5dacM2K6D9SFRsrnauT44JGKN0FpDAo5snI8PEGuI5+7pDbtF6UxevzE5LEdhZeSDD
         1AC/scXJot3rymTWEa9WG+yDWaVOn0KE7+DqEwGwIJlIznqVt8QxlUbjQtUPch8qf49H
         xVBg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=glUC1gwL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q135-20020a1fa78d000000b0036fe20a6fdcsi6466858vke.107.2022.07.02.07.06.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 02 Jul 2022 07:06:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=glUC1gwL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o7dl4-0004ZD-7d
	for alex.bennee@linaro.org; Sat, 02 Jul 2022 10:06:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7dgB-0004ed-BI
 for qemu-arm@nongnu.org; Sat, 02 Jul 2022 10:01:00 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:45030)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7dg9-0001Ee-Kx
 for qemu-arm@nongnu.org; Sat, 02 Jul 2022 10:00:58 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 n16-20020a17090ade9000b001ed15b37424so5319941pjv.3
 for <qemu-arm@nongnu.org>; Sat, 02 Jul 2022 07:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=1JuR33BzYqyr6+KeHpsJC16sqyi/shf227lMYu09cj8=;
 b=glUC1gwLD5JxgLW3rZFWAOWD/kk9BrUAyIDp418U9SIZkkYytPVpoRdLLaDB+AoAYj
 KkY5fY3m15D3WpudQznxFoObf77PZ+34FmE8+EEzgUn53aK542TTt3q8T4d6eBRpBTrV
 p2mxk6wF5hMLJ+VNMjcA041E2YIPQytoypqGG+rX8nAL0JCOeFn6XQg2l4+xSCkPBkQf
 IACsJhjR328kz80DC2q2syGvQL1FRNvQDqOq9xTBhvxAB98KLDnfHDPF+h5UvcxRsHkP
 tZtkzJyO5Ivqdryaqjzn7ubEFy80+4EfRsu+MFl+m/3Yhh7DfSLoih8/luixeWeeQgkg
 ThGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1JuR33BzYqyr6+KeHpsJC16sqyi/shf227lMYu09cj8=;
 b=vlDxNh3JB2nyu0Sp5oynbGH8qpaFqYhOjFm9BbdmBGWBVtBiJZPBt+x3MAcvoDrK0d
 YK12EP5P/Exb+TmMfZHyDN0cIqdrWE9rpD2Q6cfNrn92ionMhJzm6hAv6nR05ZXVSkgE
 trLLZ35ExqB4XPRxWrGY/wA4OjGCUcjSMUibTpRFTbMbAto1T53JIpV9GwoK2SZkXqlp
 GnNF3zL0jhiqPUufebD87u/s/6rCwJZ2iJA5VB1n+XkpUrXjz8Y2SrvWichd8RtG4jjk
 2/hkLKJocCOa9sdpq++1gSAnDZ6pNSyK2/jdZA1jKcLoGCJuKk/CiSIserYMFtSU9Jfq
 MYQw==
X-Gm-Message-State: AJIora/HoxMoU1TUljH4iLQXDYDI0468l8ZazVY8a0iKPsjy0ffM1aaI
 kYbsgRKZyMHC8n+gQLnGyJPgEg==
X-Received: by 2002:a17:90b:3ec7:b0:1ed:ded:abd1 with SMTP id
 rm7-20020a17090b3ec700b001ed0dedabd1mr22414420pjb.56.1656770455934; 
 Sat, 02 Jul 2022 07:00:55 -0700 (PDT)
Received: from [192.168.138.227] ([122.255.60.245])
 by smtp.gmail.com with ESMTPSA id
 a25-20020aa79719000000b0052551c1a413sm17793142pfg.204.2022.07.02.07.00.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 02 Jul 2022 07:00:54 -0700 (PDT)
Message-ID: <621fa4a0-27d3-1ca3-3e23-71dc6c4408d9@linaro.org>
Date: Sat, 2 Jul 2022 19:30:49 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 3/5] target/arm: Suppress debug exceptions when OS Lock set
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220630194116.3438513-1-peter.maydell@linaro.org>
 <20220630194116.3438513-4-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220630194116.3438513-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YkTMiTv5wtTl

On 7/1/22 01:11, Peter Maydell wrote:
> The "OS Lock" in the Arm debug architecture is a way for software
> to suppress debug exceptions while it is trying to power down
> a CPU and save the state of the breakpoint and watchpoint
> registers. In QEMU we implemented the support for writing
> the OS Lock bit via OSLAR_EL1 and reading it via OSLSR_EL1,
> but didn't implement the actual behaviour.
> 
> The required behaviour with the OS Lock set is:
>   * debug exceptions (apart from BKPT insns) are suppressed
>   * some MDSCR_EL1 bits allow write access to the corresponding
>     EDSCR external debug status register that they shadow
>     (we can ignore this because we don't implement external debug)
>   * similarly with the OSECCR_EL1 which shadows the EDECCR
>     (but we don't implement OSECCR_EL1 anyway)
> 
> Implement the missing behaviour of suppressing debug
> exceptions.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/debug_helper.c | 3 +++
>   1 file changed, 3 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
