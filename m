Received: by 2002:a17:906:9f27:b0:7ad:ca5a:aee3 with SMTP id fy39csp989499ejc;
        Mon, 31 Oct 2022 06:47:02 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6ufNFjjK1sIn/YvTbl7UgvZWywQ9aNPGeq3kVw2lQBpO877Wxz+NY9lwoJDbVFC+X5RfUa
X-Received: by 2002:ac8:5a02:0:b0:39e:209e:7177 with SMTP id n2-20020ac85a02000000b0039e209e7177mr10698754qta.409.1667224022150;
        Mon, 31 Oct 2022 06:47:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1667224022; cv=none;
        d=google.com; s=arc-20160816;
        b=uiNOMK7TamvngYCdXnRgLF5otSMZHYxza8ceG0Z4HoQGZBTSTTSnoH7RLKpmHoOpv1
         fBgVjunSjRE1b6S1sfuPZudB8kPVBylrZcUsrZRcsq891WHaOa3RlKZ3iU/p8k1U8nVq
         l55t4VYzgSj/FJdNDrZsB9wQjfrLMn2wO2CgZ5yrim8DrBYxzVSA22Rbj4V0337Rlk5C
         PHCrlT6UEJDuN64RIsF3weuXxesFwWpzNFUkQo9NYEqZwNy370NwAcGijkKmcVgI2Fch
         0DhiSuUGjj7GCNYp3QEk/RnoEebJpGAeKjHhjAIm0JielqRLpN7H5ZObBGwqtH0vqqe/
         LxTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=m0frJ9pR2s7qSGbh2hXV3o6veMMw2yuc/M1weprAhOw=;
        b=c/RatwEvP0tFzfJ6UrYUZCU0/5xCgCRg92QVItvrbtNwEoGBCJzKLoOyFUQ5jsUx1v
         xiUC2Nj4T3LbVEtviBnxMLq7AkhX0e8sUaLixolwQP3bgInuNUGR66DIIzXuHcDSqTym
         WtukkimOLJDIhiSFCX3JTaAsg1/MRvrhlY5LdS7kzQaqUqBajE02DPKM4UUCeHqjAHwT
         bwbyQU6fXr8HStCCDkLnApnAq4KanX3fznEAM2DXQPyp23YIFD0D9q4F8vVTlW9C+Gsi
         q98+lzgLuGZ8w6spT6oGtTzjxYQorcnypsABiCUnFsQV6uklk0pHvkHDLk3mKaHnFwyv
         67tA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HtkEjv4+;
       spf=pass (google.com: domain of qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x1-20020ae9f801000000b006ecd4f0a4c1si3473237qkh.431.2022.10.31.06.47.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 31 Oct 2022 06:47:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HtkEjv4+;
       spf=pass (google.com: domain of qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1opV7p-0007Bs-W8; Mon, 31 Oct 2022 09:46:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1opV6X-0006gH-5G
 for qemu-arm@nongnu.org; Mon, 31 Oct 2022 09:45:44 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1opV6V-0006hn-B0
 for qemu-arm@nongnu.org; Mon, 31 Oct 2022 09:45:28 -0400
Received: by mail-pf1-x42f.google.com with SMTP id i3so10693097pfc.11
 for <qemu-arm@nongnu.org>; Mon, 31 Oct 2022 06:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=m0frJ9pR2s7qSGbh2hXV3o6veMMw2yuc/M1weprAhOw=;
 b=HtkEjv4+ZtDglb4lLge9DZL8UktGjMxD/rIW05oPPB0LaiStIuKcIVg3RWpUALi9Ab
 aPhaCNinxlIfKxS+ElB9AtQ5L3IaegaI19Szb4p4HtORGCHNYtjYcyMwTdKNn5X2uxCy
 XFWsBfosBe/jRAJ7e/AqQOhD158y7pvAXKCw7A5kdccN6dvOueGUVjFPxe1VBwZsjEZT
 HqHHiw1q+eo7FzFPLwoMrGAUIERn1+B3iEdLqKPvgisVTYN3k+di4KojwoV0PPJZiLR/
 PBcKdBJvfIt5euofUH9s9ypiIhHvO0JFdtFF6e6KzCNTmpiiDe5/0EzOcNrQguq7SLev
 2lmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=m0frJ9pR2s7qSGbh2hXV3o6veMMw2yuc/M1weprAhOw=;
 b=0cxRnOnix/Z2D65MTLp24GG9rXM5H+Y+UnyMPQu3Dm48g8WujR4ffcJ85ikN6gSZj8
 +k8waONtHByKRYxauN+4mcg2HxHuiGTVEUukdWIr7Iel1YAXqy7FO6bneAvs8jBmeNA2
 KV3hL0iHFlp7/xZycW1YjRlJ3maV3dbWwwmxb0cMvLrUVbLyKsNtTH4QGYg8c6ASck1l
 a8VXgGjCH/PodlUX1+l2poknge3GW3KFWryWzdqaB/tPK+aW+RcVkcsLwrEl3gFXuESj
 Yu9z1HnUYz5xDFBqb1NSwJXupHd/iX7cCjPFH+N89ogxoAAQUhJavv6FdzzOWdy2jNeZ
 o/Ww==
X-Gm-Message-State: ACrzQf0p1SH9htxQaP4UdaRkMpQ3YNNVkpdvbI4Ne+eGGtNdbtsbItry
 RYJ/zhLaEWjcZ97r+seT9pFV5SfkbD3N8roi3MzB8g==
X-Received: by 2002:a05:6a00:181b:b0:56b:fcbe:2e7f with SMTP id
 y27-20020a056a00181b00b0056bfcbe2e7fmr14546063pfa.3.1667223925777; Mon, 31
 Oct 2022 06:45:25 -0700 (PDT)
MIME-Version: 1.0
References: <20221031054144.3574-1-richard.henderson@linaro.org>
In-Reply-To: <20221031054144.3574-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 31 Oct 2022 13:45:14 +0000
Message-ID: <CAFEAcA_ms4-Zh7s01fcbMxrbj3Vr6LACODMP75PF+sf42HpRTA@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Copy the entire vector in DO_ZIP
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Idan Horowitz <idan.horowitz@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces@nongnu.org>
Errors-To: qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org
X-TUID: 1hHC7ebTXbhn

On Mon, 31 Oct 2022 at 05:42, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> With odd_ofs set, we weren't copying enough data.
>
> Fixes: 09eb6d7025d1 ("target/arm: Move sve zip high_ofs into simd_data")
> Reported-by: Idan Horowitz <idan.horowitz@gmail.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>



Applied to target-arm.next, thanks.

-- PMM
