Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp1347816ejc;
        Fri, 3 Mar 2023 09:37:26 -0800 (PST)
X-Google-Smtp-Source: AK7set+Zy99md4XSYY7oD6flbsB38hjvmYtWMJS/ULhB1GZdZlCYuxK60Ys0LzlVQKjTU0mghnRJ
X-Received: by 2002:a05:6000:1a42:b0:2c3:be89:7c2a with SMTP id t2-20020a0560001a4200b002c3be897c2amr4455857wry.13.1677865046869;
        Fri, 03 Mar 2023 09:37:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677865046; cv=none;
        d=google.com; s=arc-20160816;
        b=ExAVSgmnRwa4NV+w7SLJFHXnGR6+VsRFavECENZZgq1O/mgiFZWqwMDbV8/+dyd8To
         kHBX/wFp/pBoRuew09gmVP/r5WPafgHCKEOcHs3L5ipSmvAFxytZQ0mhsdhGVXmx/k5Y
         gdeOdtBlVtci7LotqvSdJuHfsBQVsKsmjv29dBhFn9Hl3VHIcpdawhdjxUUiQuTL8Jm2
         4o2XASDIuxUaTDNy2/WUOythjr3l6azg04kvom3wM4GQEK05k2dxK6sOpJC5v+CBxA3D
         tiSV6nqFYF1tjpDfdPh3wVWupZbpwpQnLVN6ksX8i0P5XZFvciqHh6pyAPQCQ+BhUjaJ
         7JkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=hu2ySv+s0ME25NP8rUSj2eMw2O7Zk+8hzmVMllciejQ=;
        b=nLYt4yGCnC9FTJ/mKdXWp7jMqHzl/Rp60BMjl+sQoYGJXsh8ska0OGBggbQN8tjuv9
         80ZfPZenbIJ/KR3TXMRqgkJlcbQZ55h3CHoX9yAKckp++glx3W+kNAj3si82k1TQrGOE
         BOttFExysG4d/r8r77CGuAZjej/Cy/k9sGKLLe9FbyBwXT/AhwOjrjmR+LOeex0ZQ+Zb
         zFRo0pTbz2dfdGrhHXKAHYOH5h9VvCEuIdfcGGTzW3HVnrNmP+vGEO8wUk+ScXSk6gwX
         xZHtD2IfdeeEH22oBqC2Py3SSFMRi00FXPhqm/H9U/4PvdVv8yTmLGDKBby8NzrIIoTM
         332g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gosqHzQS;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j9-20020a05600c190900b003eb4c70e3b1si4853714wmq.172.2023.03.03.09.37.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Mar 2023 09:37:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gosqHzQS;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY9LN-0004zA-Eq; Fri, 03 Mar 2023 12:37:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pY9LL-0004vZ-GR
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 12:37:19 -0500
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pY9LI-0001z7-I4
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 12:37:19 -0500
Received: by mail-pg1-x52f.google.com with SMTP id h31so1938439pgl.6
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 09:37:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677865035;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=hu2ySv+s0ME25NP8rUSj2eMw2O7Zk+8hzmVMllciejQ=;
 b=gosqHzQSTN7QojeLtpuwxAP7ml1TRAY/426ZE88DOaSZyAm+qdtVYULQzqurFFKP4u
 0uNDtkI5qulJLCYGMGA8KKuseyR25Hh3vk+geN5itKo6/FTBDZGtR372c71vOf/hcfqn
 X6euEGMDM+Ou6crSl9J5J8JJVJhyk+yUo98bFUQxgaxydiQtHsNhQGEv6AW05bVvW4ny
 C8Vnb1KJLy14tbCmFwEDFyTTDeZK6CsMfYz5wljeEd3H4qgvSuchVDhqCssBNe6mp3E3
 DQev4jDjfh+GOiDWOoHyEexGke4kLtG9iqhqplJtkhli3Wg4kXtovu9s3ZqAqw/LNDcI
 JlNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677865035;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hu2ySv+s0ME25NP8rUSj2eMw2O7Zk+8hzmVMllciejQ=;
 b=qzCmkl40tHTEfgvgWbnZg1U+cZV3PTQlvw6S2YjCL1DVpQL23iHUlEsqYeqJK7pm+L
 YhYgmK3iZeRTCnQzk4UFqzZq8Bl55Y7LVd+iyjIeJFB4uwX9syBzc31kCRWSVpdSoKA0
 7w2pE9vTStZ9P8lHcWS9IoJuDdXfaQQ+HdMu9fhT46+x5WDQClhcsoOwFWNKgvkSh4qV
 c62WlZC+xl2YwuAwBVO7JMkSHN8cA4KoCaEcw3LZYCwKKYaXzFNsswPLRVwU+qkJjv07
 7FDemGkRryE4vcJZKB1DubIGtWitQschMN3Gr0b32k4/Iz8UzdTv+RdcHAYLHUPE1kJ6
 hauw==
X-Gm-Message-State: AO0yUKVk5YmQup3qAyBe8oXsXqXkw+JZVRj/wMh9beRhYB3MWDaKOoGh
 SRnaF3ijJJYX10GK7WvdQjvor4FslIbSMSI4LZMc7Q==
X-Received: by 2002:a63:291e:0:b0:503:77ce:a1ab with SMTP id
 bt30-20020a63291e000000b0050377cea1abmr753261pgb.9.1677865034940; Fri, 03 Mar
 2023 09:37:14 -0800 (PST)
MIME-Version: 1.0
References: <20230227052505.352889-1-richard.henderson@linaro.org>
 <20230227052505.352889-13-richard.henderson@linaro.org>
In-Reply-To: <20230227052505.352889-13-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2023 17:37:03 +0000
Message-ID: <CAFEAcA-65PHOBWYwErsoMx0vfP8yYEdZAEVN_C9nH+xt0tuF3Q@mail.gmail.com>
Subject: Re: [PATCH v2 12/76] target/arm: Drop tcg_temp_free from
 translator-mve.c
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, 
 kbastian@mail.uni-paderborn.de, ysato@users.sourceforge.jp, 
 gaosong@loongson.cn, jiaxun.yang@flygoat.com, tsimpson@quicinc.com, 
 ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: wJkkLNcFbjBw

On Mon, 27 Feb 2023 at 05:35, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Translators are no longer required to free tcg temporaries.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-mve.c | 52 --------------------------------------
>  1 file changed, 52 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
