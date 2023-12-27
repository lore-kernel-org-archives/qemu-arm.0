Received: by 2002:a17:907:c9e:b0:a27:13b6:eed5 with SMTP id gi30csp1169542ejc;
        Wed, 27 Dec 2023 13:08:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF1r4aDK34fhRbuTbkMfpuYd9WYiPaIH0MGkeUeULIW+/IHKyxGNszD4nf2A98D8sYr6uOS
X-Received: by 2002:ac8:7c4b:0:b0:425:4042:f45f with SMTP id o11-20020ac87c4b000000b004254042f45fmr14190055qtv.67.1703711336140;
        Wed, 27 Dec 2023 13:08:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1703711336; cv=none;
        d=google.com; s=arc-20160816;
        b=a0NNzwD1ECA/JwyA7DSS2VMSRBFjFdCZHDftlhzt31vmRcCCHjQiHxsbZyAE5H7yOC
         NWNwEnUcKfI3ojX8FzQe3jWoydfGYMNtcUemkCq0j1LCJUyfR15FGOL576AsuGw8YJ3d
         2QrSxdhPbHuILNVX06xOm0x0L5fbHymYSD/vjq18uFb6bizn8ZSGkdPfCNG5XcTeHK2e
         jopiO34D9p4in0UDnHJQ4RwY27hspwtXIlnwszX70RCSBtJa3vlk+cGPMkLLuE1XEYCu
         qmlbQY8fv0klm3u7yaQWQqjP5xfVdQ3eyM/n0K5FW5XHz+DCCq1aM2+i4YHqmCzfDbIB
         pnAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=zHKq0bqP7Qzj+Vaa7zm/ioZ4qsgAU2Yx5PlrwIWiekI=;
        fh=+xj4Yfkfa7hWRbLS+DTrcNY2o0evBrBbm0gAigyTnIw=;
        b=h2raFH61/Ifu6qYcu0HsDMkRSwIUQ9b+yDLQPppypletlT6Lc9HHT3Bziw9p3OjduW
         RmvQDYwq1nFppiFH5YXstFGwSGIhAtqbhCgBtm0GQdojCcnQS7LmJ0xttvTcyNu468bU
         GlTrTlSqOsoxFLmlNOY/F3we0M/6sPRQIS9D8BquzgTV173m1JmeEXC/jTpsviUEN+b2
         hquNjMfDF75psnc+6TFoBQLgw5eJF3GZCrdqAM26VB5NobZS7TalRR0Qofxv5ShYz8Rn
         2xnNn5yJFXyvyp9Q9xpbyTF3B3d7H/dau5nfEjqFvUQs+ADsKd/nOzzu6HyBHu95kiAT
         OKmg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=pIyEJJiT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 13-20020ac8590d000000b00423dcceb29esi14711989qty.400.2023.12.27.13.08.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 27 Dec 2023 13:08:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=pIyEJJiT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rIb8z-0000WD-O5; Wed, 27 Dec 2023 16:08:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rIb8y-0000T1-7n
 for qemu-arm@nongnu.org; Wed, 27 Dec 2023 16:08:48 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rIb8w-00074T-Lm
 for qemu-arm@nongnu.org; Wed, 27 Dec 2023 16:08:47 -0500
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-1d3ef33e68dso36595145ad.1
 for <qemu-arm@nongnu.org>; Wed, 27 Dec 2023 13:08:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1703711325; x=1704316125; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zHKq0bqP7Qzj+Vaa7zm/ioZ4qsgAU2Yx5PlrwIWiekI=;
 b=pIyEJJiTkn+ccKWFuD6RStriRc7S1uqvYrOFVZ1qk95jLcUnhQPRuxShN9xQ6amESE
 pBD1/0xSe2gLqVRQTL4oB1ArrWwTme61coC5ucSLh+d3wDxTalHRnWlzYEPjC3pLelJP
 3lTWIhvJGM5WoY1rLNtW/BApXe462j2GQcWE0gVdKTVSHQP364f5hjcb3fxR/QXhHVFO
 iR2vyZDI2Vpzh6eq3jv3XvnuXOIsKkzNMXZglZr80Y7RFyn8aUCF5EWmiTLKZd+dGkG+
 Yx00GgaPOWBHG354YtJa9/tpVNTmDmbannheWFvlUHAEFQFTmve17zo7JucjhcllB/6w
 OFRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703711325; x=1704316125;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zHKq0bqP7Qzj+Vaa7zm/ioZ4qsgAU2Yx5PlrwIWiekI=;
 b=A+lNj6pGpU2Ev76iBelRcIFxSJF0Tc8aBODQQ5KXXNKWA03+phOwDv5DOLk1XIMj2f
 HehoVKQ1XA9Rzv7Cr5zNvLAle1QQrghIez0xhIt6y0Tb15AxRAzcnsliv9/5XXTLHcwq
 eda1E9m0fjCe7iflyy6jwkNbJCynUo5usNICi9bpXI8eK+b8N/HpW5Vef794Exa2jT3H
 dj0RLznidF+RFL5+Qv4vsCvLvAKvZJ2HK6VRDzyLXONmt9VbDMtd86Y4pmCu96thX/Bu
 saDQO8Cz7JCHImnv8YzVxpeWMASA4Tcxp4dYgy9B+65JqnLM1puPMsBC1ENvQBXsDZys
 N0VA==
X-Gm-Message-State: AOJu0YxSUUxyX/eKxRFai96c6pvy41FoCUF032I6taWaXJtRlTA1kFs3
 RjvU6W08ylImgjOMNGL4ROYUGQKuE0ah6A==
X-Received: by 2002:a17:902:6846:b0:1d4:81bc:a2c2 with SMTP id
 f6-20020a170902684600b001d481bca2c2mr1682881pln.2.1703711325385; 
 Wed, 27 Dec 2023 13:08:45 -0800 (PST)
Received: from ?IPV6:2001:8003:c020:6900:12c1:9684:874a:fb3a?
 ([2001:8003:c020:6900:12c1:9684:874a:fb3a])
 by smtp.gmail.com with ESMTPSA id
 m10-20020a170902db0a00b001d0b4693539sm12436231plx.189.2023.12.27.13.08.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Dec 2023 13:08:44 -0800 (PST)
Message-ID: <3de06a76-a409-4810-8113-715bfa1a645e@linaro.org>
Date: Thu, 28 Dec 2023 08:08:42 +1100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/35] target/arm: Set CTR_EL0.{IDC, DIC} for the 'max' CPU
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20231218113305.2511480-1-peter.maydell@linaro.org>
 <20231218113305.2511480-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20231218113305.2511480-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: Yrly56EbAbn3

On 12/18/23 22:32, Peter Maydell wrote:
> The CTR_EL0 register has some bits which allow the implementation to
> tell the guest that it does not need to do cache maintenance for
> data-to-instruction coherence and instruction-to-data coherence.
> QEMU doesn't emulate caches and so our cache maintenance insns are
> all NOPs.
> 
> We already have some models of specific CPUs where we set these bits
> (e.g.  the Neoverse V1), but the 'max' CPU still uses the settings it
> inherits from Cortex-A57.  Set the bits for 'max' as well, so the
> guest doesn't need to do unnecessary work.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
