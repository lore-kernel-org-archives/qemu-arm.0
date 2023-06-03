Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp2017901ejb;
        Sat, 3 Jun 2023 16:56:19 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6bnd3GmlAH9dCckz1lSR0/7OgM62B5xioxwSHgOV0qhCdyJwJ91jO9Mn/hNFBCdTTUedBF
X-Received: by 2002:a05:620a:2054:b0:75b:23a1:486 with SMTP id d20-20020a05620a205400b0075b23a10486mr16335538qka.76.1685836579429;
        Sat, 03 Jun 2023 16:56:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685836579; cv=none;
        d=google.com; s=arc-20160816;
        b=GqDciDUC0XO20xQxacoPegRfJCHF6yS4yJsyEC+08eCdl1rtR9qLktiHDkYIwlYMtB
         RiR0tUwjD04j2dufgf7Z5e5ne/31mHZpwz6Jn82G/09fF5K3LWHogwF+zG8k30M78QUT
         YVOKGQWuj1x1nsD6Wh0fpHPTJ+b/uQXMkjW3wH0xN/zg+anI9qvaSfU4QG7sojJiPM0a
         YHlHxrPkRh0XP/hvmhwmowNv33An7XIj/qJ9ULliH3HLDd/miFRH+BE6VblTDs1uKYyW
         J7Vg3t/efogcgjJ/7kxUIpXsejzVguqVo48mqX+swgZ/vJUFNwdn2RQPc72OJ+AAC9vj
         ODOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=VO3nn+Efhy/PPxtEp6iGNKsRUpm13QkKsc++JMgiLE4=;
        b=mBNFMJbENHNbHxbuocT9ifhkmfnnNO7UzbYi8aZl6cx3uNo3rhrjcvbtpW4fu41tjM
         FHixeFdYb2qa0oPPlOO+uavniSvqBD9AyaVE3pi6AtEbWMwBSDYp97WT9Ox0KY2eSfR7
         xlXQB0pPoH3fnr9BGLdPxhLjf3gBQVXEs7dGFI9SL9N1NJ2V1ggHtYlU7knKunHmUtQO
         jxTickBrJcaImna42lR5LyPtdd9mBjHIstd3aAFe4H0UmT5efFLKdl6F+16jrQIydVUO
         WrETFSN2thlCoO2D0h1zIoa8ciYEokRZP2V8yogyJCPME4Kkr5qfN+kzM+tNFclLODKG
         6vMA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kpYCdV54;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g1-20020a05620a13c100b0075d55f5115csi78953qkl.254.2023.06.03.16.56.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 03 Jun 2023 16:56:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kpYCdV54;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q5b6D-0002he-V3; Sat, 03 Jun 2023 19:55:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q5b6D-0002hO-2Z
 for qemu-arm@nongnu.org; Sat, 03 Jun 2023 19:55:57 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q5b6B-0006zh-Jc
 for qemu-arm@nongnu.org; Sat, 03 Jun 2023 19:55:56 -0400
Received: by mail-pg1-x533.google.com with SMTP id
 41be03b00d2f7-517ab9a4a13so3057327a12.1
 for <qemu-arm@nongnu.org>; Sat, 03 Jun 2023 16:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685836554; x=1688428554;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VO3nn+Efhy/PPxtEp6iGNKsRUpm13QkKsc++JMgiLE4=;
 b=kpYCdV54z6ZAiLHKx/g01q3ZVgB7l0pR1gnCcBUPg0O/lSn5irLP0KJ+xDM2DDzftN
 kTTtxi4VSBc8D34GR7Lm4qpCt2dlFYOVHMvTyYYJtZ29Zl4oqVPRtURpBqBSH7cA5xdk
 f11MiV2797sQJ6LRz9dxKaQhoYdqgsch9ddX+RQ0CiDnYANX8P3VCEj/X2akBvKuajF2
 g4tw21mGahbvVwAeqUyu5yCFWGBZtIea9dU1C5Jy8el2qoAF7cVxGBzbKl4dKaSVXBIO
 ZmqNcWCNNF4oMDmcp1agjAQtFDkQdBXSe3oasZcoMejioDPYgtV95W39zcDM3q36RX6z
 oQGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685836554; x=1688428554;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VO3nn+Efhy/PPxtEp6iGNKsRUpm13QkKsc++JMgiLE4=;
 b=SrrexiJojRAHj+5csri80D5SfGnpJpXr2OJzfFnt3GEI94wA89M52o8tlURYgvmBNB
 D4U7nOM2ANUQO0RjLaaZ1/wEK8pT2CQpl/BhOEIZk2BdT4cX0EiIemZt/2nr/FuX8Pzy
 P1QlQP9F08FZWWmBjnkt93bN0Q0I3tSc8xBAJIfasCZFjakaeDpiWxnlHx2O2EF3mnEz
 cHloef6nf9oXZBJ5mkH1jaD43fhwYzMOh8Yxt5ycNWeXFuFTdjweDfzuXCQf5ThD8liO
 XYVOskYxLJa4kM7/83onrITcnIuyoXZ60W/IINwqU6BKIgDgbc2jQ/zCx//ZFErzUYYF
 fjww==
X-Gm-Message-State: AC+VfDzttsttT+n3W3qyDyCuwLEzJV09dQLlqs4mN5owCKbNB+LCvloH
 wevNX8/1YcTWReC4ZWyjcRMh1Q==
X-Received: by 2002:a17:903:22c9:b0:1ac:4a41:d38d with SMTP id
 y9-20020a17090322c900b001ac4a41d38dmr4206358plg.51.1685836553703; 
 Sat, 03 Jun 2023 16:55:53 -0700 (PDT)
Received: from ?IPV6:2602:ae:1598:4c01:9a37:84b6:b3f0:f301?
 ([2602:ae:1598:4c01:9a37:84b6:b3f0:f301])
 by smtp.gmail.com with ESMTPSA id
 be4-20020a170902aa0400b001a65fa33e62sm3708851plb.154.2023.06.03.16.55.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 03 Jun 2023 16:55:53 -0700 (PDT)
Message-ID: <ec22784c-6a0d-f879-a3ad-be34b5d780d0@linaro.org>
Date: Sat, 3 Jun 2023 16:55:51 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 17/20] target/arm: Convert LDAPR/STLR (imm) to decodetree
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230602155223.2040685-1-peter.maydell@linaro.org>
 <20230602155223.2040685-18-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230602155223.2040685-18-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.095,
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
X-TUID: In4+Z8Hu6Zew

On 6/2/23 08:52, Peter Maydell wrote:
> Convert the instructions in the LDAPR/STLR (unscaled immediate)
> group to decodetree.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/tcg/a64.decode      |  10 +++
>   target/arm/tcg/translate-a64.c | 129 +++++++++++----------------------
>   2 files changed, 54 insertions(+), 85 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
