Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp1386899ejc;
        Fri, 3 Mar 2023 10:25:47 -0800 (PST)
X-Google-Smtp-Source: AK7set9ikSKOvKtKergUToq7NU4poJqgKuLfGel7/xphy6nSNI1AAcdSkiA8l+/A9MJNYPJFzbLC
X-Received: by 2002:ad4:4eae:0:b0:56e:a96b:a3a1 with SMTP id ed14-20020ad44eae000000b0056ea96ba3a1mr4407857qvb.7.1677867947378;
        Fri, 03 Mar 2023 10:25:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677867947; cv=none;
        d=google.com; s=arc-20160816;
        b=p/2LTpmtUNXBxAwwkjOHvwDE2d+OgjUtECGK5n+T5wtIFJuSRI7L1qBxZW7z6ybuzO
         11MbbNYy8ytqfh4VYMZ66k8GTkTpDalM5TXSQOzMc8HNlBH0BP2euX/uCzS6gDfkHRio
         u3E1teym/gXkzbM9Cnmaf69Bn4r3to6HtdpSx6jhE4PbjcFavse4r/++JrFeI6KW/Ts1
         euo7K4RzOeQpz9TDbLFryt60kMHHqcUxdZxTHwYJMMd9WZORz19X4rPKUJO7TX5EZwCE
         niGu14xf/mBQLpAwPSqwIcYm7dlreVPdgFL0lwXSNf1uZCqQCAzUgDr/HIi6D5Aw5/m3
         o7bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=fnGoF8YLB/nvxFfUrxZ6aikhdToPm0b/4C20nXAG+4A=;
        b=X6W20Wkf0COuGoU76OoIjfBzUvKsccfaIWxMxjD1BCqFwlwoCM3Pu2oRMnOtYc6RSi
         y3MD5qfwS+lg4NPptaGrDXBQgo9bzLAey5urG4TxSsH4lvHPfHhcGrUYuWheK8Uy4F0e
         1Am7zYPEqGS1ocC3Dr8coc7UmCeozhODcpaUq3z2MK2GPWAersSu3M8sABFbNufToUIf
         P3FllTXTI0Gk2bwfRjOfqAVu5y1eTCATm3YbIfMA+gjtRT0S6biAqbZW9EBiJJ7zsrHC
         XgVWDc3B5yv5iuoTWTSPnq0HFYX7NOPeXR402y4psI4HIQaqhRWVOyxT1Z2uLGOp0Kz9
         zwdg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=v2nVC9tO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 11-20020a05620a048b00b0073cccac62f4si1965654qkr.687.2023.03.03.10.25.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Mar 2023 10:25:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=v2nVC9tO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pYA6C-0006kH-77; Fri, 03 Mar 2023 13:25:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYA6A-0006e8-Ed
 for qemu-arm@nongnu.org; Fri, 03 Mar 2023 13:25:42 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYA67-0002Sv-KG
 for qemu-arm@nongnu.org; Fri, 03 Mar 2023 13:25:42 -0500
Received: by mail-pl1-x62a.google.com with SMTP id a9so3605668plh.11
 for <qemu-arm@nongnu.org>; Fri, 03 Mar 2023 10:25:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677867938;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=fnGoF8YLB/nvxFfUrxZ6aikhdToPm0b/4C20nXAG+4A=;
 b=v2nVC9tOUVDOGQHxwr8QZy0mwtJMv830e02aylIJZNPEWnGzhhgcpKmejS4jZXHlwv
 6eMuh+Uj1CFsuxPMCwdgmrQ1mHpsz8E6RyTpZr2ZJAWuY+qmC1SOTjmjceAtozc8uD1/
 KLDBrd336xv7bsa6hOZYz9xlJqi3lmFp1sPsGgRx8x0g7HQzRWKLOjn3eyQ+Q44qgD77
 OtbkfMtxJ5I+JkEOUW8nbJAh+2B0Q6WfulhzodbvgDsqA7lX3WdG2KRswKYWitqipMO9
 dFcQQ+6Jbz/SGMmntoLLFWh6ZT00V7bHKw9nknuILzjEiJYGRcOmT416++EWqgO3GuMb
 /iOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677867938;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fnGoF8YLB/nvxFfUrxZ6aikhdToPm0b/4C20nXAG+4A=;
 b=gntk2Rt92QUtc5dqT6gSXtniMZVeQqh2JgDdMGFTzrRWPQjJ4HUu2W0Kqpthlr1o7I
 v1uvdSyU6Qc+jjpWWw4Z8y21TGndwxbtzx1coxhbhqIgLoindJ9GoPa2ir8yv2g/eEya
 7BPMgCISWKYOfVFstJDJzNAa+RZkn5F6GFiRe3ys7agPAeKXceor/iMQs6zeWZ4jxXnu
 g3mHQjTgbYT7rX0RDcsCR29iGKa2hI6mQy4pWRWt5MFmAgrzhPrp+jnB5deTjvrWvBmG
 +cEf1R8r4h0Y/SZ+nBtE7YDzx5aMT9P//jeRe9b+wmWL+X1Dd2dd4Z7ODMwH4JcAlwVF
 lxZg==
X-Gm-Message-State: AO0yUKXCsvalaX92r9KXRPAWiIEI3bgAnYKwyhtCgnMKluPBU9jA3dr/
 ZsrHKIZKsvbX9dB+rNuXnuj3bzIZzOEffoNB6EoOLQ==
X-Received: by 2002:a17:90b:f12:b0:237:5834:2808 with SMTP id
 br18-20020a17090b0f1200b0023758342808mr987776pjb.0.1677867937990; Fri, 03 Mar
 2023 10:25:37 -0800 (PST)
MIME-Version: 1.0
References: <20230227052505.352889-1-richard.henderson@linaro.org>
 <20230227052505.352889-15-richard.henderson@linaro.org>
In-Reply-To: <20230227052505.352889-15-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2023 18:25:26 +0000
Message-ID: <CAFEAcA_-d1yr_afCNHNSaHTmWAzjS85OX8gXwHC1Z4ybGvLE0A@mail.gmail.com>
Subject: Re: [PATCH v2 14/76] target/arm: Drop tcg_temp_free from
 translator-sme.c
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, 
 kbastian@mail.uni-paderborn.de, ysato@users.sourceforge.jp, 
 gaosong@loongson.cn, jiaxun.yang@flygoat.com, tsimpson@quicinc.com, 
 ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: TGDj8Nu9h8Iw

On Mon, 27 Feb 2023 at 05:28, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Translators are no longer required to free tcg temporaries.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
