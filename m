Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1250553lfm;
        Thu, 25 Jun 2020 05:39:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxpng6pDIeebjfif9EIuCSu8ZCIShFuwdhfyxqgqiXszs8gL2xtn/gi0W0RfVvAmewq3h3s
X-Received: by 2002:a25:400e:: with SMTP id n14mr47330243yba.424.1593088759937;
        Thu, 25 Jun 2020 05:39:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593088759; cv=none;
        d=google.com; s=arc-20160816;
        b=GHYZBABrQy+nXgcD5pTSEzpHl+JdTWBNkHdq7IgxYUY6PTjZUtov9a9oLVvVngf80P
         ouDRzKS3zu2z1zKTXZ7uaLSyO/1ibafa9lkzm4Pz8fuH8++0dWvO8H/3vguT5SgLMCol
         lWqKkVGovEhcSs9YB1hKBa+4rCVui1CbvcwOfqy+bUUvE69n01gEROhwO8nFIpmGp+RR
         St1fUNPDCNmwJCnxiaZcquWXK+SV9KL70CdqD2i8qse5m2bLUd9c+gknmLZsbjMEgG1G
         8zHM5Q8/4cjmEBOEaVQXuqw9ZPS+bYAcr/yqa6GIM8sBN4qu5jPFKlEICKxebP+tJ/fE
         AN7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ctlRjVAFYwCY6pTqUKZJ3/d99UBemWYSFar5HyCixx4=;
        b=0ONCxm3zMseSwcVma10SmWgRqTxIL4giVB2l7AMYBnj5tiqUvivY0sU3vCri4197nf
         Rg+bNX5I1s4RQ5m7JdhzlujcOKOE1fY9SXUGMKIi0D0YP8noEYFb3QaOhGtEuBot/oyU
         2oS0YMddZCAKRL4m6BG7eqwe1jyESvFIATC3y7EuB7DkKgMB7bCvkV0iJVQl2tQ0sCkc
         FLdwabVyncp5P/WzfaYfuqoB09TaZGzSndFvhA//cmBvV9txw/rKrO01fUxgmNd57+rQ
         LsoEAhOYSm/CO1LPw4IUFMAN6nhrQqCkcYER3NwzeACEoBVAmb628h+kYw4QFv/48zKh
         fyvw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="EhJ/3n6H";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f5si19497559yba.363.2020.06.25.05.39.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jun 2020 05:39:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="EhJ/3n6H";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1joR9z-0007hZ-9v
	for alex.bennee@linaro.org; Thu, 25 Jun 2020 08:39:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1joR9f-0007fm-EF
 for qemu-arm@nongnu.org; Thu, 25 Jun 2020 08:39:00 -0400
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:44945)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1joR9d-0004YR-Tt
 for qemu-arm@nongnu.org; Thu, 25 Jun 2020 08:38:59 -0400
Received: by mail-oi1-x241.google.com with SMTP id k6so930776oij.11
 for <qemu-arm@nongnu.org>; Thu, 25 Jun 2020 05:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ctlRjVAFYwCY6pTqUKZJ3/d99UBemWYSFar5HyCixx4=;
 b=EhJ/3n6HyeAIeV/GQ1IqXcu90fbpKaWW+v4v03tPlNTWJPUiaFUzUuq1r1Yjw93EbV
 1UxJAW1pDOVlyQdllWQgu/OVKATDp9DhgUL0Q1SvjC4vOgeqg+wPRFV733bwmrN7OW6C
 V1YbWlE7/b13eHsWKMLVKZ3iZPZni40iErmtZj3WSoutcbWG0MN0EcvjIyq5cLTYtCGW
 Qth7JPhnVzo0Bz7hy2DrWCRjtzFf2RPcCbQcyFhrI3B4JqKHNNyoxFhCbqy3rGGtt0tT
 n+jUlYh4ubJOPtSqsxDXVTG4WzQk7uKkUWrLjpp6joK+XTd3qabv6UVzIjfz3X41HqKW
 g5gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ctlRjVAFYwCY6pTqUKZJ3/d99UBemWYSFar5HyCixx4=;
 b=Zhn2E2s3EuR+OR6W3XoB8Vr1BJJtAmHd27SzdcWsBLGhzdqdFtnJe2nx4Vw6JYx56Q
 645buw6fIzkOJtReRSPRg81YtEUHTf4YvataFTDiLSpDwRtj1K+QN+TFYBntpPGzV3bX
 2N6nFnLc4VPY4a5M+1n5AoriZkgVXPr5bpsFiT6+kZYyXuQ/VqL/vtErxjn+oLNP+tbP
 tbbh26V2UHBexlRMXqeFO5sUy3l3f5Kr51cXFxJEf203aP35wTnyW/eIJLl0a1GG92Qu
 zuHQBm/dNiRNDgSdzz+Bx2e8rR3A/u2qDZWwFv/zgSjXA4mMIfJIn9JJ3TPGZ41m3bDf
 zJ7Q==
X-Gm-Message-State: AOAM530Eu3BW/OlCuUMHJGrM+5ldpClAplTqQU808ITsS2YlmLEsEvce
 AqZx9iYoyJDFKj6yssnkMLsBE7NPi6P+Ol3otVxLqQ==
X-Received: by 2002:a54:4694:: with SMTP id k20mr1902820oic.146.1593088736912; 
 Thu, 25 Jun 2020 05:38:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200623193658.623279-1-richard.henderson@linaro.org>
 <20200623193658.623279-36-richard.henderson@linaro.org>
In-Reply-To: <20200623193658.623279-36-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 25 Jun 2020 13:38:46 +0100
Message-ID: <CAFEAcA-mYKrRBRRMFPBrHX6=AJ0vdXNdP0AUQnueZ31OcoP1Ew@mail.gmail.com>
Subject: Re: [PATCH v8 35/45] target/arm: Add mte helpers for sve scalar + int
 ff/nf loads
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::241;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x241.google.com
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
X-TUID: g5ALC+V6EUYd

On Tue, 23 Jun 2020 at 20:37, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Because the elements are sequential, we can eliminate many tests all
> at once when the tag hits TCMA, or if the page(s) are not Tagged.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper-sve.h    |  98 ++++++++++++++++
>  target/arm/sve_helper.c    |  99 ++++++++++++++--
>  target/arm/translate-sve.c | 232 +++++++++++++++++++++++++------------
>  3 files changed, 343 insertions(+), 86 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
