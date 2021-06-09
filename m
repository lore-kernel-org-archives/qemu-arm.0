Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp5707293lfa;
        Wed, 9 Jun 2021 13:08:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyAPaz1NFdIpUVZPsJpX2l4eyK4YRo3rltZDgNocjojrXUQNOvNuoWtLElv3seJ96DT/vje
X-Received: by 2002:a1f:9485:: with SMTP id w127mr1710489vkd.15.1623269318700;
        Wed, 09 Jun 2021 13:08:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623269318; cv=none;
        d=google.com; s=arc-20160816;
        b=TMhdRa4d/ZDEvPhyt/LiD6GHaW5vTT+IVyDJUe7oUf6dNsbi1d0tEXV5h+BDVON9nZ
         RxhzsJkzHvShLRcRd8Xaodz/jV8u6zdJH+YY43ombIjykum2KvyL+Rnr/zf7ul5SMFRJ
         8oUPV24K+Q/PbUBET5KAsLaL9IiLoSERTvJfXXu1bvy9m24w398XBwDexaUmQAmhA+I/
         6i0EEyWMQ8HvMj9Bp1ykGU0+DGXz/3KhcFMlInlnUcOjJlJCPzEqAOfUrxl7iEY3Y9Fv
         Pb/2igd8SVdGIM2t6wor7bamQLFcq3DCpU/8SSHEz0MowsyKNnC8+eAkYxKs78dS7rpc
         J1jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=PXLMXcHBmzb/zXY7jtiDe+4U02G2KJ9qGMP1y1d95v4=;
        b=f25lXjRyX7LfMIsnrT0zyMtwiM5pBorMx7RubKKRwyTIv+eeEDL1bzqvc5SIvhgaRP
         /RerODJtow8SLaVOcgq1G/P8sc/hEHY9yKgB8ie6WnM/+9dUqrL2Gmyk7fwTupysBA1T
         yliM++mYI8txr8gx1+9eo5lluFayZ4B5AodAuiF3svyRMJFzizYuz567+5fBFA+ojM5X
         8GklHqkOJzjQ46erUQrg12o1K7UM2Me6YI3cmqbeEBZ2JUNHuAO7q8GOSz1e4tzDh/Oj
         LR7A+KWqH8l02QCfOh6a02O0PTYCV8fVQGP8WCsFt1XOVF+yE3XaP3CIJSC3TFTgf2oh
         bH4Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="QNA7T/yO";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g25si904539vsj.95.2021.06.09.13.08.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Jun 2021 13:08:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="QNA7T/yO";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lr4VC-0007LC-0C
	for alex.bennee@linaro.org; Wed, 09 Jun 2021 16:08:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lr4V2-0007IW-N0
 for qemu-arm@nongnu.org; Wed, 09 Jun 2021 16:08:28 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:38473)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lr4V0-0004Nw-ME
 for qemu-arm@nongnu.org; Wed, 09 Jun 2021 16:08:28 -0400
Received: by mail-pg1-x534.google.com with SMTP id t17so4007855pga.5
 for <qemu-arm@nongnu.org>; Wed, 09 Jun 2021 13:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=PXLMXcHBmzb/zXY7jtiDe+4U02G2KJ9qGMP1y1d95v4=;
 b=QNA7T/yO/gUCJRoKvpGVeMxDtwJZr6r0+C3kZ6v09pTS8vwIER1J+aIar6Sv36Xr5+
 XYZKvUyGiCS5PrfC4Sveav0o0Yys7gspPPnpBBFjqppkQuqDFc1WYJa/x3x5c1sF4sbg
 JPXeZwylQuFONW0Tlzd3zQOfkruBtJFzA/D7YUiwQnBX1vu4+/0PPeOWRVMZfK6DMABk
 FCOcugkdLUUWJQ1olvKs2a04pKnX1/UR194aoQuyVFE2bvJ7VfkHmy7dsnX7o59GHkcG
 sZLS5geBuxaANTAgkrfEbec2ynIrFZXyNLI4pdbXJ2u6Q8lr7JpJmZ8kkQfIAaL4TpRC
 HjPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PXLMXcHBmzb/zXY7jtiDe+4U02G2KJ9qGMP1y1d95v4=;
 b=cQmoXUK4GuKHs3LjJAnOtCDbBGhYw7sp4YOng+CUoEYu4lY9xVz9nCeUBCkrQNFu/k
 bOqIaR4UtYq59V0ImvNFYQNU1UubkN+gfzL4Q1Z+jXuc/NUl3MMOGFw0ojLzfjkoPYR3
 lu40OIVE19oHu5yiOETvEQ94LKh/PncvNrkshMVxRDCSEifNPW6Eb7CHYPdg1BgGLnNH
 aBc8Q0Iatqkq1o1s2iyV9sKsewsQQIu6WPLyVmNYHcifF4/h+Bk4TXIEncA2pFZqkz01
 teU2MHjFxAy2XVuytlsu9d+B56FasSiiHtTHUwQyyAiyVzLjidvzUhJDruaOfZ2CAzN6
 TVhw==
X-Gm-Message-State: AOAM532JNvWi5GqGAu3Hf6DUoBi/iL7ONdIyF5znUR8cU59EzXQseT+h
 LreZbWs1aolIMFk8YjKEygwYWg==
X-Received: by 2002:a62:1c48:0:b029:2ea:1c13:e229 with SMTP id
 c69-20020a621c480000b02902ea1c13e229mr1362078pfc.17.1623269305273; 
 Wed, 09 Jun 2021 13:08:25 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 f28sm516913pgb.12.2021.06.09.13.08.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Jun 2021 13:08:25 -0700 (PDT)
Subject: Re: [PATCH 48/55] target/arm: Implement MVE VQDMLSDH and VQRDMLSDH
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210607165821.9892-1-peter.maydell@linaro.org>
 <20210607165821.9892-49-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <70319bd4-9699-d9c5-ffa4-5c3e28d23849@linaro.org>
Date: Wed, 9 Jun 2021 13:08:23 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210607165821.9892-49-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: CwH8FdWW3VBE

On 6/7/21 9:58 AM, Peter Maydell wrote:
> Implement the MVE VQDMLSDH and VQRDMLSDH insns, which are
> like VQDMLADH and VQRDMLADH except that products are subtracted
> rather than added.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper-mve.h    | 16 ++++++++++++++
>   target/arm/mve.decode      |  5 +++++
>   target/arm/mve_helper.c    | 44 ++++++++++++++++++++++++++++++++++++++
>   target/arm/translate-mve.c |  4 ++++
>   4 files changed, 69 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
