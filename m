Received: by 2002:ac2:5ccb:0:0:0:0:0 with SMTP id f11csp596107lfq;
        Sat, 9 Apr 2022 11:22:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx1FkgdldRYIGrLOEM3jzSKpH6FEHdL+bJKhO0NjEHMi65ctXD2BG3Kh6HSz/BkA8QRAkjp
X-Received: by 2002:ac8:72c5:0:b0:2ed:13ac:f8cc with SMTP id o5-20020ac872c5000000b002ed13acf8ccmr1415778qtp.668.1649528560166;
        Sat, 09 Apr 2022 11:22:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649528560; cv=none;
        d=google.com; s=arc-20160816;
        b=VPb9WZBM8ec/wU64fQbiqK8Y0T5544ekY69DyK+23qbQMwwLuU2HfOqxPrjWmfzDKJ
         oi+lDAZzTBpPJ/BpcTw6ZXOZ85qoZkqUL92Qa6iM+Gbr+i5Z4FJKl2gX2RQ7zj9E4Wie
         Ho+PqtTsCc+LvD1bVrBfZGa6mER7ked2PTSx9OzzljHydYuM48H/OqyDq3QbiW4/JyHA
         HE8YK9C92ENqrlAQXQfu89mxyD3tuJkKlbh2k8fsWbvY84q2NXoqWrzKwTULtOFfzuth
         D9SUGXZ1EhoIcSj1axoF75HQnmNwislRpH19kI723eV05sWnwyX61jWES+Q3+sbEfBEY
         wk9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=pKPilFg+il2wxELXEjscDA4gNJVNuvfC96NRxrtNdUE=;
        b=CLNzbYxUAggu1Z3dvEtWgLiPHcanQw0oGkhE5puupfnXkrUpF4BCJf/R4a632WXvHU
         N0VuETDI9yLSW0dpIYSNJn05QpQOnGt4Pg4DAiNF5DxqHP7XC9Nobubn+SDXuzfaS5iH
         q7wVF4lnK1zqM4tNXld6zMgY8J+YtUgZflBVPJPCCJk9PMRzu1KuIrWP8zQP1khxVc9+
         RsMZ6FnHCkBtgkD1sRgGGXOnt62qsGaOp2bDIbwmQ3RO6QloTKgJ+1kiTzz3PAb3/5tk
         r3QnYbo8u5wASjM0XkAEI0qDPtONYrex9iuSqYvwvsvmqNrqKjvoo1bWbLvtd7hMAafA
         oi9Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LrODJZgl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l21-20020a05620a28d500b00699ab91de84si2617599qkp.420.2022.04.09.11.22.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 09 Apr 2022 11:22:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LrODJZgl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ndFjL-0003Nf-LN
	for alex.bennee@linaro.org; Sat, 09 Apr 2022 14:22:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndFj8-0003NJ-NO
 for qemu-arm@nongnu.org; Sat, 09 Apr 2022 14:22:26 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:38421)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndFj6-0000tb-Ry
 for qemu-arm@nongnu.org; Sat, 09 Apr 2022 14:22:26 -0400
Received: by mail-pf1-x429.google.com with SMTP id b15so11165639pfm.5
 for <qemu-arm@nongnu.org>; Sat, 09 Apr 2022 11:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=pKPilFg+il2wxELXEjscDA4gNJVNuvfC96NRxrtNdUE=;
 b=LrODJZglKVKQejkz/4qdaJa9uWHvgF7v9X86eAQnVc+cw/J2XJMFBUyYwEDJJygTzc
 fMCrJBfVkI5poS2q4R7mKQoOBrsk8HS6bbNJoJdgeKPtAKPkhOsD4ddsXQK7q1jKtBhS
 H3cnkdl7j9aK/G8KAxs6DGijdn529x4twmS9bD/OgJrHRA1VZe++2K1DQ6vWC272iMlI
 6AN4eaDoW5iGuXUJ2lS7RdcCsZ2XqqaIIU16k8easZ0KXnV/U0hGUlcMxaPkmFFyah+5
 PsoH04DdtQSiUlGC15iKU3GY2PFD4uZ+zm+xseirA1jFdV4JiAJeIq3O7etxLp7MfWbr
 BH0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=pKPilFg+il2wxELXEjscDA4gNJVNuvfC96NRxrtNdUE=;
 b=K875VszZ8x7aSgw3UxSNOHG6xw9lgi9TI0wFCer8n0aAYkJlN5Sxf+c0G63sN71jO3
 rgaWGIPkCXOMQAOG1B0p7wv3kzQhTY84CJXLh48aD8OygDW8cCxBal28FEnkIRzNJJZ6
 AyEiab5zk94nIc6qo4FiGJiO/FeZb1lTACCX7TQFgCvQejprMlSQzCkCNXYIVss5zGMN
 GO9mK2HBjt8qrs9ijD7rx9IqLh8MXgJpaiG5OGD1w6+awcG6cjLDoEkfq/mGcUqw72iw
 VVn2yqfSJX5W/FKWhiodEyIBfmE9dgTetLxoPN7tUT0qUknVvOpox94YlcUgxfAOpJ7q
 gazA==
X-Gm-Message-State: AOAM533Z4A9rf1zNdGHFkCsi3JImpM0pJCZUNitvU3a8JcM+M0WILQnP
 SKiur9dMtRRJgke9MSIC+z3coA==
X-Received: by 2002:a63:d855:0:b0:39c:e714:c79f with SMTP id
 k21-20020a63d855000000b0039ce714c79fmr9347602pgj.570.1649528542242; 
 Sat, 09 Apr 2022 11:22:22 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 w127-20020a627b85000000b00505a9142ce5sm1203372pfc.22.2022.04.09.11.22.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Apr 2022 11:22:21 -0700 (PDT)
Message-ID: <9d09dd24-6caf-201f-3952-c1259d74b4f9@linaro.org>
Date: Sat, 9 Apr 2022 11:22:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 18/41] hw/intc/arm_gicv3_its: Implement INV command
 properly
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220408141550.1271295-1-peter.maydell@linaro.org>
 <20220408141550.1271295-19-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220408141550.1271295-19-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Marc Zyngier <maz@kernel.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1jd40JRll9vf

On 4/8/22 07:15, Peter Maydell wrote:
> We were previously implementing INV (like INVALL) to just blow away
> cached highest-priority-pending-LPI information on all connected
> redistributors.  For GICv4.0, this isn't going to be sufficient,
> because the LPI we are invalidating cached information for might be
> either physical or virtual, and the required action is different for
> those two cases.  So we need to do the full process of looking up the
> ITE from the devid and eventid.  This also means we can do the error
> checks that the spec lists for this command.
> 
> Split out INV handling into a process_inv() function like our other
> command-processing functions.  For the moment, stick to handling only
> physical LPIs; we will add the vLPI parts later.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
> We could also improve INVALL to only prod the one redistributor
> specified by the ICID in the command packet, but since INVALL
> is only for physical LPIs I am leaving it as it is.
> ---
>   hw/intc/gicv3_internal.h   | 12 +++++++++
>   hw/intc/arm_gicv3_its.c    | 50 +++++++++++++++++++++++++++++++++++++-
>   hw/intc/arm_gicv3_redist.c | 11 +++++++++
>   hw/intc/trace-events       |  3 ++-
>   4 files changed, 74 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
