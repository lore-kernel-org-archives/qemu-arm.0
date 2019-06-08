Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp1319264wrg;
        Sat, 8 Jun 2019 07:16:12 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzhIOd5T9L5hGQ9e8M+3t4/jS596lZe1q8OftV5j2i++UYFYypx18ZQnlmlrdUsj3CTwUyV
X-Received: by 2002:a37:6601:: with SMTP id a1mr47715272qkc.282.1560003372425;
        Sat, 08 Jun 2019 07:16:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560003372; cv=none;
        d=google.com; s=arc-20160816;
        b=OV5UKsklb/Qc2p/bG7Tqnmp1El8ZNB64ezTRpRDbUdbZWCqG5lSSq/lbmQHjPb4rVW
         JuysuC0W+Q2IjWtuvXCoXOOXANA0le7ZUzj+JPX5l8F2u+dOxQaHfuuIElXSQ0LVx+Zv
         t7kCo7GALUzU4s5pRsF4etItJl42GXiyCBghVonKO+vVyqiIS5ujJZv6njsvtGpAYgwT
         ZKX40Rvpp3mwS5w3CJzt7U+H+qyXpAAHtIuOcQfeV4F1KLPi2MhTfWvxoiqLNN+RlUMI
         o99fMQJE336fta/hhXwd7HyxggCoipVOYe/bsvz1gR27mYL6swzhbNZOXfXK1jbYCrfB
         y/kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=KwnGJ9GqB1RWry5OQZTGJUU9tTViCTx8zwYcMYqxefg=;
        b=0V9Xl9HPjk9jDwTHvlpQ2xDECT8l+B47AxdNI91+6wEGGg0s8MOzoJrwSoAOPD8Xei
         9O0/BWbLJ6xVdK7T71fNMFqkjAdYtNLvhqyJMItFQKWVUDFNiNWDCBnexJOYwXmq5yEq
         hMkwxsZTTu8lDDlJJ/WKQESGhwJ/bZXUR8Mr0XkEd9TjXKQzm0MjHPL1D8xuegOPTD6Q
         0VHDCK8yzfv3gvocqGTKjMoccYbOMQ14G3E5RnsxY9TOC2aiJg/3EuWr+c6DOZvxyDOY
         Jxmstw5vp3ZuX5xo/VonV3eqyncvp/Ko0OmBudGLITYpWWXPL3HIiORQdIFjwGWYVNqH
         KICA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=lM0WzvT9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j67si3183765qtb.114.2019.06.08.07.16.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 08 Jun 2019 07:16:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=lM0WzvT9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58690 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hZc8h-0000Kz-Re
	for alex.bennee@linaro.org; Sat, 08 Jun 2019 10:16:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37620)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hZc7o-00009O-OZ
 for qemu-arm@nongnu.org; Sat, 08 Jun 2019 10:15:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hZc7h-0001ly-R3
 for qemu-arm@nongnu.org; Sat, 08 Jun 2019 10:15:12 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:38068)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hZc7e-0001hs-5Z
 for qemu-arm@nongnu.org; Sat, 08 Jun 2019 10:15:07 -0400
Received: by mail-ot1-x343.google.com with SMTP id d17so4493716oth.5
 for <qemu-arm@nongnu.org>; Sat, 08 Jun 2019 07:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=KwnGJ9GqB1RWry5OQZTGJUU9tTViCTx8zwYcMYqxefg=;
 b=lM0WzvT96nvZmIIkiw0FmRAqCNA8V1XdjUBr40BkmKF/GEEMKTBeQRZbEx9F5bUlP8
 GvId/XVvaKsUGolpAIhkXEvB14XVbYWGEyA3S+9AOxNAgrSYirOrixH1ac1Jaav5Ga6C
 oXJfzL9diWNL0vBKuEfSdbMC2DdvieJCXJezOh/Jk2lTGlS8n+Z94f6YxHRtMWCrlDDQ
 cP6rFtBfVtSPhd6dQK6TEPTIjxB0jVDHNwzD19e2p8xS6vEuoIcWoUQKMqQnmIXW6+g2
 JdU3SBEN9CODxuIdC4uD2YF41dUrJE2GjRRYOGiDLMXbbvHHjN6TdsHrwRq7CQR1eFDL
 gqfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KwnGJ9GqB1RWry5OQZTGJUU9tTViCTx8zwYcMYqxefg=;
 b=TklUBWweNY72FjE1o0lnn0DzhqGURviJbgH9+fBMuDQgsq88Hj0PueU/h+LMjTg4J0
 zWwaEZyXY3nR+T+2rprS4gR99luhZ1js4xV0tie1xJsp0NFK2+gpkXS94p+kQR3RAXSD
 rsty1CrdJ//RVXRLJbpTdFrjwN0qp1RZX6+GADi4OD9V0HAYin3H7o2dEk7dHKcnotmI
 rLDcz9JHNW3s/mo1EP6kQduEccvZYfka3PIc2KdVNivuxCh+34rE4kGlpjaV6RD6Nneq
 5qTioB7rJB4QJti4HQmHQ/lg4ak72DiBMvtWCU9mm3l3xmmxYGX5SmYSymt7FrIOB8cs
 973g==
X-Gm-Message-State: APjAAAVnhrDWx0f+kUoNareuwXuJbOq0LtVm7U8+tFwiezeFPK99N/qT
 vDBmrtYxcWKRn1c9Nd69wLRCPA==
X-Received: by 2002:a9d:2c47:: with SMTP id f65mr23890806otb.185.1560003304161; 
 Sat, 08 Jun 2019 07:15:04 -0700 (PDT)
Received: from [192.168.3.43] (200-56-192-86-cable.cybercable.net.mx.
 [200.56.192.86])
 by smtp.gmail.com with ESMTPSA id u62sm1355285otb.63.2019.06.08.07.15.02
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 08 Jun 2019 07:15:03 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20190606174609.20487-1-peter.maydell@linaro.org>
 <20190606174609.20487-19-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <b6cf60b7-55c0-dc9c-1731-3e46dd8824ca@linaro.org>
Date: Sat, 8 Jun 2019 09:14:59 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190606174609.20487-19-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: Re: [Qemu-arm] [PATCH 18/42] target/arm: Convert VFP VMLA to
 decodetree
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
X-TUID: 4xK/M0JUCl/r

On 6/6/19 12:45 PM, Peter Maydell wrote:
> Convert the VFP VMLA instruction to decodetree.
> 
> This is the first of the VFP 3-operand data processing instructions,
> so we include in this patch the code which loops over the elements
> for an old-style VFP vector operation. The existing code to do this
> looping uses the deprecated cpu_F0s/F0d/F1s/F1d TCG globals; since
> we are going to be converting instructions one at a time anyway
> we can take the opportunity to make the new loop use TCG temporaries,
> which means we can do that conversion one operation at a time
> rather than needing to do it all in one go.
> 
> We include an UNDEF check which was missing in the old code:
> short-vector operations (with stride or length non-zero) were
> deprecated in v7A and must UNDEF in v8A, so if the MVFR0 FPShVec
> field does not indicate that support for short vectors is present
> we UNDEF the operations that would use them. (This is a change
> of behaviour for Cortex-A7, Cortex-A15 and the v8 CPUs, which
> previously were all incorrectly allowing short-vector operations.)
> 
> Note that the conversion fixes a bug in the old code for the
> case of VFP short-vector "mixed scalar/vector operations". These
> happen where the destination register is in a vector bank but
> but the second operand is in a scalar bank. For example
>   vmla.f64 d10, d1, d16   with length 2 stride 2
> is equivalent to the pair of scalar operations
>   vmla.f64 d10, d1, d16
>   vmla.f64 d8, d3, d16
> where the destination and first input register cycle through
> their vector but the second input is scalar (d16). In the
> old decoder the gen_vfp_F1_mul() operation uses cpu_F1{s,d}
> as a temporary output for the multiply, which trashes the
> second input operand. For the fully-scalar case (where we
> never do a second iteration) and the fully-vector case
> (where the loop loads the new second input operand) this
> doesn't matter, but for the mixed scalar/vector case we
> will end up using the wrong value for later loop iterations.
> In the new code we use TCG temporaries and so avoid the bug.
> This bug is present for all the multiply-accumulate insns
> that operate on short vectors: VMLA, VMLS, VNMLA, VNMLS.
> 
> Note 2: the expression used to calculate the next register
> number in the vector bank is not in fact correct; we leave
> this behaviour unchanged from the old decoder and will
> fix this bug later in the series.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/cpu.h               |   5 +
>  target/arm/translate-vfp.inc.c | 205 +++++++++++++++++++++++++++++++++
>  target/arm/translate.c         |  14 ++-
>  target/arm/vfp.decode          |   6 +
>  4 files changed, 224 insertions(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

