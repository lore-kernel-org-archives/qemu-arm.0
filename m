Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1242935lfm;
        Thu, 25 Jun 2020 05:29:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwjVwNbIVf8tauItMOeQNHFvWsBCHxqOZ/4lsyJbaEpDjrASE0WDVFSxgJI+GOh0tcbbitA
X-Received: by 2002:a25:ce06:: with SMTP id x6mr51422064ybe.319.1593088197425;
        Thu, 25 Jun 2020 05:29:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593088197; cv=none;
        d=google.com; s=arc-20160816;
        b=F4C+V8lkqLpa0hsFnYPV4yXQiJrGkLUgjE4vTHirfejhMy9OwTLKAXNC5snmcCPFVH
         NgzOTJwe9F/qc2/lwc1e1wccU1tb2y+5wDLf6MWa8F9EKfDdMTsRNtBOWyvivip16Bez
         deryjyAc0i9WWHPy1AtoGVrkRgzzdQMqXmxiUkpIDudZmGMvVWksbEw9iwV5ZkCHWhUC
         KLf79bLAYJROYUYDnl1KF5E21rCyU3YWK9Wfe5zorQezMnEKDIH583MXDY1BWdKmCEOC
         dz9ESVqFVE2U7E+Bt3xO0Ybt9mnBGiuRNNxLWVpL5QEMA6Ax3jir3unz2v+1k9Kl2Mg/
         49UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9JQ3cOtNgqcebFXDwXc7bOMstWQhxg9W2+HncHAN3F8=;
        b=eRLPtXvBGligjjyt1GO/WXOBaGhsXaIlGn9evFGa+Yh1/TtSxjVYGHh57owZ/21XEA
         8q6OKe/R+vtFGn7aCAuFcPOg+6ZUapQvWRiPxCJDwKsEeKBj5mnoDRA4Yb534juQySGK
         chyApqaMO+WVnEbGEm+z1qadX9kLiaRgZTXt4y545K3swFCNemjz+zchjsuKru1l00wn
         bGoVtyiigJMxvKdqskNNVoYQVVYsxLD2lJT3R9lLY8mP/NXXDnaogn+K7fG+bDBrIqTA
         8FPQGgB4rkuSJIGfdaeLCoYp7zlgQnBRZACapYWFnkxiPX7W1lpSmvaQFtUssSvj/umk
         rvBA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ohaochvC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h130si22753126ybc.75.2020.06.25.05.29.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jun 2020 05:29:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ohaochvC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1joR0u-0001LU-Rk
	for alex.bennee@linaro.org; Thu, 25 Jun 2020 08:29:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1joR0m-0001L0-UT
 for qemu-arm@nongnu.org; Thu, 25 Jun 2020 08:29:48 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:43821)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1joR0l-00084p-8x
 for qemu-arm@nongnu.org; Thu, 25 Jun 2020 08:29:48 -0400
Received: by mail-ot1-x341.google.com with SMTP id u23so5035499otq.10
 for <qemu-arm@nongnu.org>; Thu, 25 Jun 2020 05:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9JQ3cOtNgqcebFXDwXc7bOMstWQhxg9W2+HncHAN3F8=;
 b=ohaochvCRD1gzidk5DdsE6jiETSp4gFwyR7pgzyb8eu9jESZWo5TZbh4/4Q3KGTcc5
 cyBcKpXTLPmBf0vzl6DmuKL+yhhSm24nhzQYjHFS5axw0oDA0sEGWqcZ6ewr8edmxMah
 gmLrYuuzPSGOydc3mhDoVxu+eVQhKsD96MW8jXk0zZfGZ9mBFDEIyBkCytbNFqyjPaHh
 a3aD86bA1pcILw8MPrjQb1LH/f5pv6FW2jTleEYLP5vihyBcNvtMDCWihAEoU0yL6UaK
 Qo1RwH5vLxY238dCxpY1oHlyBhx8F+/gyXHyfTV1Yz7putUY7a6saQiGByqpUGqLy8wp
 mjVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9JQ3cOtNgqcebFXDwXc7bOMstWQhxg9W2+HncHAN3F8=;
 b=lgT3Gg4exLpJJv15++UqdwJfRvzTSn2t8jZIFQlzZDGeg+6uaKy45LJmbj4s1d3ska
 m2Hm8N2KnVXSjRDNXNfrjPr2hXV0rkFlD3Y/UtZyqL4Gt7aBztymEg/98PDJMUJzrPSL
 LfhuhPkgGcTiaHdeswtojs19GEloJhgCsBrXpd/q+UiiHBe+aFY2nfWGF2oPWKpmmhBa
 R/K+aJOV2NLeBAv3ymjudGOYXyVOHXWRUdSsF+qIcNfpVUtviNlv/nTEPJr9OTm8sPR+
 RZVYYgdsfdgBTFrbuui9Mvc9hadJGTdAIZzNvLfnozjAAWKGMXwngKDXhHHolBiwEIoa
 wbIg==
X-Gm-Message-State: AOAM530Zie1SR0gelJNfld60492BX8xjbUY7CiGJIiNGlfzAGNnIeyJA
 RD/j1qsgK9sEui/7Gx+G8KdLWnYW4FZX+5qgEiojfQ==
X-Received: by 2002:a9d:5786:: with SMTP id q6mr12662006oth.135.1593088186001; 
 Thu, 25 Jun 2020 05:29:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200623193658.623279-1-richard.henderson@linaro.org>
 <20200623193658.623279-33-richard.henderson@linaro.org>
In-Reply-To: <20200623193658.623279-33-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 25 Jun 2020 13:29:35 +0100
Message-ID: <CAFEAcA9+-MoV23aFk_7fcWR29HUREbRt3qaDD59iPvSP2AMrew@mail.gmail.com>
Subject: Re: [PATCH v8 32/45] target/arm: Add arm_tlb_bti_gp
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::341;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x341.google.com
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
Cc: david.spickett@linaro.org, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Stephen Long <steplong@quicinc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Y5FNmQyJRW/C

On Tue, 23 Jun 2020 at 20:37, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Introduce an lvalue macro to wrap target_tlb_bit0.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> +/* Helper for the macros below, validating the argument type. */
> +static inline MemTxAttrs *typecheck_memtxattrs(MemTxAttrs *x)
> +{
> +    return x;
> +}
> +
> +/*
> + * Lvalue macros for ARM TLB bits that we must cache in the TCG TLB.
> + * Using these should be a bit more self-documenting than using the
> + * generic target bits directly.
> + */
> +#define arm_tlb_bti_gp(x) (typecheck_memtxattrs(x)->target_tlb_bit0)

It seems unlikely that we wouldn't get a compile failure if
we passed something other than a MemTxAttrs* to this macro,
given the specificity of the field name, but I guess it
gives us a less confusing compiler error ?

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
