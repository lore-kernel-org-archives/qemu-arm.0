Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp1193715lft;
        Fri, 1 Jul 2022 05:16:18 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1shPFZpz1Ck4xWO3iuSEIpjHNCqf3QVsot9QlE9loAFzDKX/qVG4iKzauXeugcxmTTIsL91
X-Received: by 2002:a1f:6286:0:b0:36b:efa7:4628 with SMTP id w128-20020a1f6286000000b0036befa74628mr10428634vkb.3.1656677778171;
        Fri, 01 Jul 2022 05:16:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656677778; cv=none;
        d=google.com; s=arc-20160816;
        b=WjkgATe4t49RC5jEOHI4UMwG1VVH+SBLCkec5/CoWXSORZAUVPHNWLo0gUmcmIyisq
         3j4G8hcqkAJ5n+geM/VV/GKCb3jaOuBXSc1nMyUrX/pPcl0nt/7Ie/qEcNa9yKxwMMFo
         hOq7uA1gcitdWi69gEfDL5Y7VaMYe7w2+4xlb/0jZaR7/l5r38i24cZDqgpvHr5ZHh3q
         whF61BVz8uAX60x4NsojoOlW4iFZMQg/5T1b87Q5lg8rzg1AAoXlu2mSwMknkNgOyux3
         wtgdhnOwD1vc/TJOo6am/yiCI0WGVgLaqYnXBsora4AjLFP1PYf3of5MjTdAdKiebijQ
         gUIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=8zW6HuQW+Q9owFdRfUwy7eQosYL7295C7BS/kkwANIc=;
        b=U3wsgUv343NrRi6STopsg7voHyDwzdDoEXAl+P/qKoPWvd7Gjscl+vRh/FkiKM6tlb
         BEV3LxXonxsEckYBUT7m/QdEu8raaWvHtyYTHPOIEyeuyX37rm1y6bsp7UHSF6aP3fjZ
         wJgvjuEVNVTuxw5LWqRSvpYGuP8kdWcfH54xtHlxBJJG0WUxke1C3QWL6BCuSBJV1ED2
         WNWr62AZnUiInpg5ouDbqB9x9AplnwzzCRsW33+MI08M044p35dvOKCsIqTtSzsjnGev
         +fe4UqYuLmnd0WCxrTFg8hvh1hl1q050i6bSyBHJDGI5f2Pt9XplJL1BbOz9We3leIoO
         Bj6w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=itaJIVE7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x12-20020a05610223cc00b0034bb8362b08si6737787vsr.273.2022.07.01.05.16.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Jul 2022 05:16:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=itaJIVE7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o7FZI-0003KZ-Rh
	for alex.bennee@linaro.org; Fri, 01 Jul 2022 08:16:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o7FYW-0003C9-17
 for qemu-arm@nongnu.org; Fri, 01 Jul 2022 08:15:31 -0400
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131]:45657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o7FYT-0002U3-Kl
 for qemu-arm@nongnu.org; Fri, 01 Jul 2022 08:15:26 -0400
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-31bf3656517so21368777b3.12
 for <qemu-arm@nongnu.org>; Fri, 01 Jul 2022 05:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8zW6HuQW+Q9owFdRfUwy7eQosYL7295C7BS/kkwANIc=;
 b=itaJIVE74dPR0kd8ZbhysqWDifxvGaOaD8fr+pVgdr7pENoXdY67f+wouz+KH6YKy3
 x3pz33Fhc9OQXt+jtPprAKzkL+82jmUHzhEZJJoHq8lS2VFslKYRWabD6jP7iyakOSae
 /BEpbk8hNd4GI/pkNyS3PyUVUa7CewWRasdgVi1j+/OjyKq9aD4LjZpxjc4+Ja1XuMxn
 hYc90Bb8xUMRYRbITsCeAeie2uCqMEc3BwKiy61msThSLWOERZt16J/0Kv0AQwdSgPNn
 IrsHld5veuyVD+c0jFNvYyOWzs7hdxD3sC4xUe2s8aP4xry3LDmUoq3+8+F6FVcEaAAt
 vSlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8zW6HuQW+Q9owFdRfUwy7eQosYL7295C7BS/kkwANIc=;
 b=sL2vdfjowS9S8kut5PvooAw7ya1rzlnJ1zR18A0z7h5yJExAVYQvJ7dTUQynqok4HP
 DdmJcVlO/e5+1nVThWAhf/13Ce0oGzZeVritOfEPLOEnhoOwXu0FTB4apBz/qY6BmVCK
 xzQ1P31yHOYZWpsDqKcbCQmWYNyhQxg1M+yp7zusXJ9E3drDVHUQMM80U4blizG0+xOJ
 K/CHIefj0kI01FbPXDbAfyuBbH0tPnOFlJxmbSj8gC/a41zBe2yU+CPRpx7EyO6zVL+z
 T+8AGqVHFtr4eKfuJ9sL+Ea83ZXh9ixye1bYlqlq4nfKDN071TQlUOEwaL0rJn8KsWmU
 qrog==
X-Gm-Message-State: AJIora9trxHS6FpMlXC0QKjAHZv2EWx35ln76KQ0AsImy8SKu0Z9Ig+8
 bgmjtZ10huF82Su4yzw5zfLJi+iffcDJ4Sx9DxBt9A==
X-Received: by 2002:a81:1cc:0:b0:317:a0fa:7a61 with SMTP id
 195-20020a8101cc000000b00317a0fa7a61mr16136271ywb.10.1656677723087; Fri, 01
 Jul 2022 05:15:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220628042117.368549-1-richard.henderson@linaro.org>
 <20220628042117.368549-7-richard.henderson@linaro.org>
In-Reply-To: <20220628042117.368549-7-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 1 Jul 2022 13:14:45 +0100
Message-ID: <CAFEAcA-bZExqks1kSJA66KtoeQuaVxa0XfmBiDGeVqLQRTqvag@mail.gmail.com>
Subject: Re: [PATCH v4 06/45] target/arm: Mark BDEP, BEXT, BGRP, COMPACT,
 FEXPA, FTSSEL as non-streaming
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1131;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1131.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xQrU07yA8RXJ

On Tue, 28 Jun 2022 at 05:28, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Mark these as a non-streaming instructions, which should trap
> if full a64 support is not enabled in streaming mode.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/sme-fa64.decode |  3 ---
>  target/arm/translate-sve.c | 22 ++++++++++++----------
>  2 files changed, 12 insertions(+), 13 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
