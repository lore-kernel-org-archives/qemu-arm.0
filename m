Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp1453400ejm;
        Fri, 21 Apr 2023 15:46:37 -0700 (PDT)
X-Google-Smtp-Source: AKy350aAucuDwL9wwKsFzFVRIUBZYX0LZKCKedHHp6aqtRLsH8ZE4P1HbY6DCk+YP1/8WUmpdd+A
X-Received: by 2002:ac8:584d:0:b0:3ef:380a:d7bc with SMTP id h13-20020ac8584d000000b003ef380ad7bcmr12158096qth.54.1682117197404;
        Fri, 21 Apr 2023 15:46:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682117197; cv=none;
        d=google.com; s=arc-20160816;
        b=QURpp846z3hujaJX5CAI341nI0/QTLjG3NIZDDOqc24Ln2pHAA8rcaOzcKBFDUw3Od
         Gg6WJT3VK1Goy2diQdXz9PmS6PnsFbFoLbiAfFMDLFCcUoFipSSeHgh0mWbeDxpKUJXB
         WC4OzVeLzbcRyO4dVodyOs8thdZMuYvvv/JAxeL9Cgwo1Yu3MiUgWA0iOV4b4cj8YkFU
         WxWeJOJtmD06jrkFLSBO2k9SV4ymPuRtQy1FZ95CAm2ZF3MaQoqtL6ud2FIC1STbGO7V
         n5J7/OQeDecolzNd75RegMv3azH6TYRk9zfJ/i/5tnVnmhv7VPOOsIA/Z9t7fRYr6Z+5
         oYQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=BVqOgUeysccRt7WiFOa63CtZRnlzROy6sriO8RcTWGU=;
        b=Pv0OkH3l422sgpnBUnChj0JREFBqV1dlGhp5b/dIL9DHKEBwmVj1StosV+PJnDOcPl
         dGJJfxhVRJHVJVfYDz4ijQeN1oUmEhQ9A9yA18Engx1oReRW64RPcGx74viZV6GLQbJr
         y3C7YZ31jTdDyJvuFa2HsLc5KCfhaKBDcapzlKpm2so+pHlaPJPGi4jbyBOJOmk5DFRq
         2AH19lEC4U6Fnt2KFm7vnAiZBODaJZ5wiTYjlEYyt1PtcnY0oqwgMZmHWNacjQan4OZP
         Kwk+TM6auQj1NYFnL0GDBhXlzKRTtDDrpAP/CYBhb2pJaWqOBxecHPqfxtuh751QaiNC
         k4TA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mj3XXZEt;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j20-20020ac85f94000000b003e6439ee0d0si3996767qta.188.2023.04.21.15.46.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Apr 2023 15:46:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mj3XXZEt;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppzWG-00065h-0f; Fri, 21 Apr 2023 18:46:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppzWA-00064v-S0
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 18:46:17 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppzW7-0002Be-Eg
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 18:46:13 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-3f1957e80a2so24095435e9.1
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 15:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682117169; x=1684709169;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BVqOgUeysccRt7WiFOa63CtZRnlzROy6sriO8RcTWGU=;
 b=mj3XXZEtNaPn2hPLSBB6YRe1hGV0KO+jI8WYnOQd4LBQw6GJ4ViauSI2NweRxIg8mE
 WwuKFuENwbyXhWNINDWHNCRopnbnb6s4Re6oRpdQolPs6y+FjpYk1g2Au/vlbqGzVrzC
 e63JtQa9b/NDpMtZMGKPWy8szIBSXsdrsiynzbBhVPy1NLMgkeyrOHIGSbuaMNOt3GeV
 BQ50NDhI2ia9C7EFcftY+fQ9wcuwBwJVuHhXeClB6fU24HpkFBW2NibttuDzS+EffOp6
 5m1w+u1elGA8OsbjWeBw8eUv+pCdOGsj0QQjfIe46eYDEiVfilb/IgO/FJhsN4HTXYUW
 qghQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682117169; x=1684709169;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BVqOgUeysccRt7WiFOa63CtZRnlzROy6sriO8RcTWGU=;
 b=kQJc8h3BCK854SusvF+cXs5hnOiZVo4hgXI2sNA1FDio2LakO3q7zIffu+2P6Fnu4/
 Kdj6X5wik7Yc9hZxY6xhZc9sM2yeKpVT4aPBDPcjem9yEYCCuNv+C7Gv1SlVmCYSdLcJ
 zkYJPK1WM4dXAHl9whV15GgJqZOLTbIALxH7VHBqpQjVFoqbav6Gs8OfeU2VCU4Pbtbf
 Ykp6E7HTHHCOhIteMx3X5GONpk64lPPA/caVz/jxRfijoA2Hsr+ip4G7tmpwQlQzh/m2
 axLA9RlpeddTENY/kEigDC9QMo5tnTc2oH3VWKb0IsoPKfPrCZ5pCAGCQUgmNxgzif7S
 k95Q==
X-Gm-Message-State: AAQBX9fuv3EkmqO9vfZEI7EVLsgBK3SAKWs2ZymOtMQ3+GxQ7WTk6SaH
 Px22x0/EqHWOKkEiTi6tPZBlJg==
X-Received: by 2002:a05:600c:1ca8:b0:3f1:7382:b59a with SMTP id
 k40-20020a05600c1ca800b003f17382b59amr3218596wms.15.1682117168896; 
 Fri, 21 Apr 2023 15:46:08 -0700 (PDT)
Received: from [192.168.69.115] (uni14-h01-176-184-39-152.dsl.sta.abo.bbox.fr.
 [176.184.39.152]) by smtp.gmail.com with ESMTPSA id
 h1-20020a5d6e01000000b002fa834e1c69sm5299344wrz.52.2023.04.21.15.46.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Apr 2023 15:46:08 -0700 (PDT)
Message-ID: <a85e4913-7fd7-075f-c4d9-088248ff07e0@linaro.org>
Date: Sat, 22 Apr 2023 00:46:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v2 13/54] tcg: Split out tcg_out_extu_i32_i64
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
References: <20230411010512.5375-1-richard.henderson@linaro.org>
 <20230411010512.5375-14-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230411010512.5375-14-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.297,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51,
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 0YPrOepJrC0H

On 11/4/23 03:04, Richard Henderson wrote:
> We will need a backend interface for type extension with zero.
> Use it in tcg_reg_alloc_op in the meantime.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/tcg.c                        |  4 ++++
>   tcg/aarch64/tcg-target.c.inc     | 10 ++++++----
>   tcg/arm/tcg-target.c.inc         |  5 +++++
>   tcg/i386/tcg-target.c.inc        |  7 ++++++-
>   tcg/loongarch64/tcg-target.c.inc | 10 ++++++----
>   tcg/mips/tcg-target.c.inc        |  9 ++++++---
>   tcg/ppc/tcg-target.c.inc         | 10 ++++++----
>   tcg/riscv/tcg-target.c.inc       | 10 ++++++----
>   tcg/s390x/tcg-target.c.inc       | 10 ++++++----
>   tcg/sparc64/tcg-target.c.inc     |  9 ++++++---
>   tcg/tci/tcg-target.c.inc         |  7 ++++++-
>   11 files changed, 63 insertions(+), 28 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

