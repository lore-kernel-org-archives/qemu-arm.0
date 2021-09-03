Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1319321lfb;
        Fri, 3 Sep 2021 06:59:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxnO/b9l1FYNtWfrFDPI4JJ0xESJ3Fb15OcDyZaCoDpGyWIrHZZ/XyQOsdvClrf5WL1dezQ
X-Received: by 2002:ab0:3747:: with SMTP id i7mr2734232uat.117.1630677578946;
        Fri, 03 Sep 2021 06:59:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630677578; cv=none;
        d=google.com; s=arc-20160816;
        b=v0YnKCCNQfbKkS715VYdzCQ4bD4g4ChUACCEIx6dkmRRSObZMJAceNGoTM53YrsqNw
         2NvypiMWND04EqE2KfR9cyemEH/YgPRNiU+RczFSZGjsGWTbksVuNKGnHgll92V/Qew9
         eUH7jsr8AMYQoOYFUCqwVesVqj9gE4P1g6BVjDIV8xLeIkzub9fDCqizFmQjJmZiWoy3
         lESkYruh9tlcQp2dMUK6VHlWcFmS72XgJkE+5a23DA8CTbSKlh2PdDSLWLG5Mu2+1+lN
         4VU9Tz1FZ1TsRl6/vAWga81UCyZAmK9NsG5GKZX8rZdZGWsGepEE9e9F3j+CQpiKqjRY
         19bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=GNZqg5+KBUOR/ftAx7FYdXjZO5JdGmZAiAxhUxXQimc=;
        b=ExERakL/I6Q2zv/AAmLNqWMzClvDhujy0z5PrHDy/0MMcLrukTKTOh67IfqtDh9q+U
         nsbEfXi3BR1ov1YPHcZrtTxHs0h8zsABg9bjFUa/Ke6kXDh23ll1/5vLG9AM/u5EAujk
         hsf+c3bFSOiGRxeJDqZgVqOtRihINaXuIhhne+ChAYCMJSWvOMajCN7pEeRk3IInvWCt
         tdD129BoAD0n2aGI6K121XYL4ECzGf9aa9svq5lHu+2PdWDgexUPZhH2o6WNCTYrxJM2
         FcqLie+zOtcXSBqEbEtGDvntwj4cW2lMys0Pn8IGY9nyZgsW37NM/TL98rcTeqkxb1G8
         8lxA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qPAWV4IQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t17si2705501vso.132.2021.09.03.06.59.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Sep 2021 06:59:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qPAWV4IQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mM9jG-0002oH-7d
	for alex.bennee@linaro.org; Fri, 03 Sep 2021 09:59:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mM9j4-0002ic-Vh
 for qemu-arm@nongnu.org; Fri, 03 Sep 2021 09:59:27 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:43616)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mM9j2-0006RL-E9
 for qemu-arm@nongnu.org; Fri, 03 Sep 2021 09:59:26 -0400
Received: by mail-wr1-x431.google.com with SMTP id b6so8371857wrh.10
 for <qemu-arm@nongnu.org>; Fri, 03 Sep 2021 06:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=GNZqg5+KBUOR/ftAx7FYdXjZO5JdGmZAiAxhUxXQimc=;
 b=qPAWV4IQbYw2xT7DeKu0uUA3I3bfzRA7EDnUUOpq4Dt0Rv6TczqZlwOQCjj5BRnSTB
 NIJn5VkHzyBJrsaR8Rc98gW6IyGaPGfvuk8GzOgXq3iZaedw/LvS2IcYI4HVxAFcKgIy
 Y35Dp3yxi8yM4pMGZOt7CEvvmmlxPXHwI/fR/1gJ9TMgwHCDagUvYdduYrOd/NP/FGE5
 ik44h8jxLYl4GSBON5ZnAF3ovr1CVDSBHFjCX0CCTt6iACX2AYWaXUq1TETXR0mOrdbi
 MDUuRUFxoSSlSWDf1NPKvgrWkmidDsJdsv5byfWyrTxJVjWstz699fnxDFpe8VUuyYAs
 0qAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GNZqg5+KBUOR/ftAx7FYdXjZO5JdGmZAiAxhUxXQimc=;
 b=VM6mKAXnHDaeGte1f9CfRJEaIp4NBGOyOI5UgvZJ/UJDXvl9JtA/0h7U/kBzYJlSdM
 YWGnHYP7Q3IbzFhlSfMd8Edmej+/uav4Dosw4btTDOZ3eCCArl7P+Y05UN6pMIGDcTqV
 I904bpzwNOQCKvcuC/ugSeh4WM2SO2llPduypolKIt3y+sSUS1VOGVIb+S/X2ScHNEVp
 Z380baPe9SWEGYy5XMtDu03ny4xpg7ufuQ6QeNeNjaoALSSECvJYI/x5szET9VBOhfOu
 E7hLIc/vc9IV5q3FLSy8VSS/I+qUvgpQp3sb3wopf/g/VBQ9+YpnmEkeQDqOseahkuFJ
 ZneA==
X-Gm-Message-State: AOAM531K4XpcEgdSmXoOprnoGIZhCP/RPHODy6IwJIgM0zfvXGuXJBRH
 gjSc/SG0xjX2HcX3ldSbG8hQ/EWwgHaEI8KcM3Q=
X-Received: by 2002:adf:80c8:: with SMTP id 66mr4316299wrl.65.1630677563083;
 Fri, 03 Sep 2021 06:59:23 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net.
 [2.142.216.190])
 by smtp.gmail.com with ESMTPSA id c14sm4854725wrr.58.2021.09.03.06.59.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 06:59:22 -0700 (PDT)
Subject: Re: [PATCH 3/4] target/arm: Optimize MVE arithmetic ops
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210902150910.15748-1-peter.maydell@linaro.org>
 <20210902150910.15748-4-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4fd5648b-5a44-d484-d7ce-497720b0a1a3@linaro.org>
Date: Fri, 3 Sep 2021 15:59:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210902150910.15748-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.888,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
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
X-TUID: MpAr/7snHDix

On 9/2/21 5:09 PM, Peter Maydell wrote:
> Optimize MVE arithmetic ops when we have a TCG
> vector operation we can use.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/translate-mve.c | 20 +++++++++++---------
>   1 file changed, 11 insertions(+), 9 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
