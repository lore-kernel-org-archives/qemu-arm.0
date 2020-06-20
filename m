Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1066874lfm;
        Fri, 19 Jun 2020 17:16:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyR79VoWs0LbUOQI/eAtfRlheYVpPnQ9AnO+kQau000ABiKcBIPOt+JLv3CvFiArYn55RTM
X-Received: by 2002:a25:ccd5:: with SMTP id l204mr9673186ybf.51.1592612185227;
        Fri, 19 Jun 2020 17:16:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592612185; cv=none;
        d=google.com; s=arc-20160816;
        b=SE0sNi8lWZAonM29UgHmpDUIQlXJeMww2TTYYYnqM0Z2d1x9nnFxmn5uishLe89wNO
         EOhlVfOCgV52ZJDljPWPy9ra1jYXTtTmtagr6f88vbISxTwyABxAG3BIBbMuxeL75zse
         eOrY4gaOlwpO9zdJ9gK/w6d9WTdw4BeRA2GeHMcVX11QgNSU7vHP9MRMTKCfjn1zhYoX
         j1jxhMcQmf31Vsro5o6qNUi9e5Ji56zS7ErhcvMIrpKd9JUA+EQMhZPP7AFvZNU4UREx
         PhuE16wnTvTVapPzqWIFoNv9tKKPtxTeP1iBHaJf4zZ/Vc6hYLAqmM5NuRKTxJsn3srR
         rPOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=icN0QAPcX4TIqm/OWWpGa13ALt6C2bZFJ8ggwwRjPUw=;
        b=iAS8vsemK2A2f3zYXg3/9QljPAfB/y+jfJ/bPw9RPxkbFo8yJzRXocktt5RsPKtND8
         CsP5VLNC7opAdD0TmMlCHUbV4GuAPgJ3znmiwrgkw9APC5i8F4CeI86kIIEzUNw47fGd
         42ix+eGf1LI9nq4OD84DAzcKwkBIGwaq85/skRlPVSzgKPOvLW/egtVhpJL2ZiQ+BY1l
         NID6Hki5HU/pVHAjn0vWI6bvz71WUxfhB2rXSsxteaandwQ+EgcMxOdy8AyulP7aDw+2
         ZaFsGdQRb2S5Hjs/L4PcFWoLqPaeg9SM/t8STw6r31S1ffO2PoCrR4T57eHW7CCYILZV
         0xTw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PDbBzzkU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x17si6506140ybm.189.2020.06.19.17.16.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Jun 2020 17:16:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PDbBzzkU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jmRBI-0002qL-KS
	for alex.bennee@linaro.org; Fri, 19 Jun 2020 20:16:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jmRBA-0002pH-Kl
 for qemu-arm@nongnu.org; Fri, 19 Jun 2020 20:16:16 -0400
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041]:50219)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jmRB8-000788-W8
 for qemu-arm@nongnu.org; Fri, 19 Jun 2020 20:16:16 -0400
Received: by mail-pj1-x1041.google.com with SMTP id jz3so4794915pjb.0
 for <qemu-arm@nongnu.org>; Fri, 19 Jun 2020 17:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=icN0QAPcX4TIqm/OWWpGa13ALt6C2bZFJ8ggwwRjPUw=;
 b=PDbBzzkU28Rk9waQkw5Rb5YJzrmWCetBBAZt/i27GrlgFh2dAInyaPXVjSQULC8//E
 DGEwR32F0ZEM32BZG8nKnB7NdqYQ494jNtRuSIaAs0dtNGTqY0i1i7o+5igpOQG7lS05
 HDZz3hf09mnPp71qbr5oWk9g4ALcPhkGM48hu3SVUScWngte3OP+NnqDtt6lTee3JzPT
 B8wLapnWiErSqrwersCjGRUEXVbT1I96Mgj2MPjGuCUqmTRzaM1sAv7WoV5g3RAJaDLn
 JuYNWoBFtKeF2QOE7riTx0aR8DiQpCm5joE8AOAB+8N1Ce70EyF3p0ZOM+zfuoCQE4G2
 5EGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=icN0QAPcX4TIqm/OWWpGa13ALt6C2bZFJ8ggwwRjPUw=;
 b=oIzIInsZw9Noz6eO78jKxIHFR9y9ELj5fJgZtZiQ2v+IG/bKBIJ2k55P2Ik6PIAJ9d
 JwKTdBwKKj0RjgnNLX6CQW1JnMEpjZQaAr7CL/9xIoN/L+BDN0X1/VGT9zjUdy5tlW/O
 M9kZzx22iZWi3B2I98FyzmN+7vl1n0AxPTesAInBZO5yyPIuZr8q5NjgiPfQHjoqdU3g
 x21uZGO/qrQl/W2QUzXUjxEYpKQoQ8644qYnBz/W22Jk+r+c+tZRtjDxztayCWwSMs24
 3CN7EXRN35LWnUrFnWbM46LRo6BhPmq0WOXKZYESTiVQTGe9ZbHsiQLxLq5Ir8urQ0Sh
 wBBQ==
X-Gm-Message-State: AOAM533UhYKwjWfeHG9TpL9N1XMCOpZQW1nWi6LzivxaNYJktvmcAmsW
 ZezH7cbdoMH4IZKsbBIKRf3ewg==
X-Received: by 2002:a17:902:ee12:: with SMTP id
 z18mr10037526plb.308.1592612173468; 
 Fri, 19 Jun 2020 17:16:13 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id s13sm7119043pfc.136.2020.06.19.17.16.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Jun 2020 17:16:12 -0700 (PDT)
Subject: Re: [PATCH 19/21] target/arm: Convert Neon VSWP to decodetree
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200616170844.13318-1-peter.maydell@linaro.org>
 <20200616170844.13318-20-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <48899968-19dd-22a4-544e-5934517c3148@linaro.org>
Date: Fri, 19 Jun 2020 17:16:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200616170844.13318-20-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1041;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1041.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
X-TUID: bsU/nRna+4Yj

On 6/16/20 10:08 AM, Peter Maydell wrote:
> Convert the Neon VSWP insn to decodetree. Since the new implementation
> doesn't have to share a pass-loop with the other 2-reg-misc operations
> we can implement the swap with 64-bit accesses rather than 32-bits
> (which brings us into line with the pseudocode and is more efficient).
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/neon-dp.decode       |  2 ++
>  target/arm/translate-neon.inc.c | 41 +++++++++++++++++++++++++++++++++
>  target/arm/translate.c          |  5 +---
>  3 files changed, 44 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

