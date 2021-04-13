Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp5030778lfr;
        Tue, 13 Apr 2021 09:33:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzbQuqM8H8ExQAjIpefw2fCm1jMaRXyejGXRFAn7C4EgoedIR5Vy44mCZbqPvkfwr4+BBGj
X-Received: by 2002:a92:c944:: with SMTP id i4mr27604406ilq.305.1618331611529;
        Tue, 13 Apr 2021 09:33:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618331611; cv=none;
        d=google.com; s=arc-20160816;
        b=Hx2LAfaHQ9zsca+S9dXZNcoDGdi7J1JEM5xa2dTTC9iVrFG9BuC7MMknJdWL0f+dqM
         XKPNYjBgA0PMIk3m/i4zUvb4bcCOBXzsgASwL90kc/O6xVtDhqqA+SgpjVpDWEauDdTA
         nbqml4el2TunqyucYE+QWCN+/TVz1e4AmYG3vDrUHmoiBAB9slcerhwjXdlFLAwWdQ33
         Ftmhlo6etFKk0oD2c/oUZJdPWL+/i1soZcDuWdMMekx6Wg8vASktGWcbM/65ndnWc22P
         94X6S+uFIR4a05VEuFU/Cz4kN263VhzoodKRF4RdfUhAe0KUuEc1Su+gU7uoDz9y/tc3
         O3ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=I0l0jYvm/Zwc1PRODJG5t1CPdLK7bgLlhLtJy7UP1hs=;
        b=TQqalsfClepx1UZiSIIU5H29Ir85TVVYWZCBfRdBQAKfKk9gK18D3Su9kN8ACR08l7
         u5nQUBFpZQKTYJQnOeU8vNtKXfMiLIsVct7lRgAEBQ5HkmWlF5Zpr9KZ92SHsUruxUTN
         USOdCSzLSeElwefViReaAHLwjmAr7LhBxu+zV5CkfQlnxq11+G7FT+fcvu7zfCowsFl3
         nJbAJRPhFMIB3M9kOwqIjbgdhmZKaqk+KlenXnOp7Zl2SveFmO8cqzaVyyyMJoE/RMij
         VMvurl0eq01THr04QJjP1mtUissQA489kl+OxSHbVv6qEBFehaqkGZ9FODH/h5S7igzd
         i/WQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=AiwIyOLo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t15si6983411ioj.58.2021.04.13.09.33.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Apr 2021 09:33:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=AiwIyOLo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:48368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lWLyk-0000Dg-QU
	for alex.bennee@linaro.org; Tue, 13 Apr 2021 12:33:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lWLwB-0006pq-41; Tue, 13 Apr 2021 12:30:51 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:41696)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lWLw9-0000o0-MP; Tue, 13 Apr 2021 12:30:50 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 s10-20020a05600c318ab029012d7c83637bso539652wmp.0; 
 Tue, 13 Apr 2021 09:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=I0l0jYvm/Zwc1PRODJG5t1CPdLK7bgLlhLtJy7UP1hs=;
 b=AiwIyOLoNIF6WoimD4sbZPPO+OC9GvKwjcpaFjLd0hyIMApTFLZxSUz3WVNDkVzjUg
 EcmyO2VHNy38LVTpb9zWZPo2F5kS4ZzHAdot1b52tNTYubqKmiT+FTGmuKYH+Sx5U8lB
 gKOK90rGEx8KBp6LNvKT1m06uoEbvR4k0uN8dDD4WyaV6euriQYyqFa+ojBwECReD1A1
 ACxHD1PgZ+q7BlS9iukMkAfkWvb2tDH7ZJ6DQdG3pCsA8+6V1DNTa4t39Ri3o9gikmtq
 ESlJ36jiqBBmC0LNeJcWOIKU3MYJH+wdheyLF8vX8CSCQDbdcGsvqP3qtbux5Ow8Fyed
 qwcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=I0l0jYvm/Zwc1PRODJG5t1CPdLK7bgLlhLtJy7UP1hs=;
 b=qnU2dfoHtokgMN0y7ZnEjAM6LgdInP4csrR8smmT7SprhiBCkfMNbzTOZl+3hyBYB6
 TLEw9ylQGpZWbXYo8nxzwGyrd1LLHFwfMKbjr0ued6z/9d+ZAISZXd5+iXgulB035f4H
 w4r1Rr6SyenBSJiHzPeHbDl2XgUENQlbMqyAIVQJFTQN8rHB/E1DZZo/BaNvm0UHqpDR
 a0FmPsjcM42IkTJPUAAS9goR1AGBYrhCONUrkHHcmU38BQZW4fz2JLr80azHNX+0KupV
 oS70jE3IoGZYCkM17xkw0XwSLIcOYcH+I6eNuQEF7oIEzZmiixwdCgBoK3QoaXaplOce
 EHWw==
X-Gm-Message-State: AOAM532R/0tyojRk/iyQQV7SQ75l8uib1/XRft/GAvuCOchAQXTPHfkP
 GdURaaoTytNWA/hDee+lyGBDm2+tWHw=
X-Received: by 2002:a7b:ce09:: with SMTP id m9mr838243wmc.150.1618331447864;
 Tue, 13 Apr 2021 09:30:47 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id h2sm3034947wmc.24.2021.04.13.09.30.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Apr 2021 09:30:47 -0700 (PDT)
Subject: Re: [PATCH 2/3] hw/misc/mps2-scc: Support using CFG0 bit 0 for
 remapping
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210412134317.12501-1-peter.maydell@linaro.org>
 <20210412134317.12501-3-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <6979704a-842b-0691-f02d-c921ed00b730@amsat.org>
Date: Tue, 13 Apr 2021 18:30:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210412134317.12501-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Kumar Gala <kumar.gala@linaro.org>,
 Kevin Townsend <kevin.townsend@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 67k++M+W3AJ2

On 4/12/21 3:43 PM, Peter Maydell wrote:
> On some boards, SCC config register CFG0 bit 0 controls whether
> parts of the board memory map are remapped. Support this with:
>  * a device property scc-cfg0 so the board can specify the
>    initial value of the CFG0 register
>  * an outbound GPIO line which tracks bit 0 and which the board
>    can wire up to provide the remapping
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/hw/misc/mps2-scc.h |  9 +++++++++
>  hw/misc/mps2-scc.c         | 13 ++++++++++---
>  2 files changed, 19 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
