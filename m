Received: by 2002:a17:906:32d0:b0:a63:3083:985b with SMTP id k16csp45443ejk;
        Tue, 28 May 2024 08:59:04 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUMBrtlaCbumiT85Eb4dEerRuMvs/6bAgz3LC8db7Mw8MBwR4855SIZ8SJFefAJ0I5jlzHkBPxFhOkLE/Pk70v/qWwoPeHa
X-Google-Smtp-Source: AGHT+IGgWaVNgkqPq9KR43WbBfg1g4MKd6o8/vUXUSHtf5PeaI2gvS9wKBUcpvFnh38xFhjvZ46i
X-Received: by 2002:ac8:5892:0:b0:43a:dc29:a219 with SMTP id d75a77b69052e-43fb0e221c9mr133198211cf.2.1716911944687;
        Tue, 28 May 2024 08:59:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716911944; cv=none;
        d=google.com; s=arc-20160816;
        b=y9p2hcrtUyueXu8xi805T2onvWzf8+RBpGVXcU+f23OFWjQ9P3o9UkeW+a9hlWsIXi
         SBAJq4fxMYaFOQtN4g+HLcJO5cUABWsueksRhcqIJtdNbZ90mkC5QQgd+eH1+2yfSIM1
         susDawkW7PBWj8AbxUepUqzYePusQeDCiOWTLvIrHYvXL6vfxPCCcrJR0cKpfs2uIeEQ
         VsMb2ozg4uxOyIAM3jr3Pua560dQOSeffiO0ZPL2p2OL1bvea5cP3O8duW1zXhQqQJ7b
         g5IqyYl5bla0Id2YFDcbkikzFnK0/dBwIbQH0aRNOblAmqf2JSLjfwbWbzsuMYak8f1f
         33jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=XZHdHibYnpZlZr9G3I7C1t2Kad9PTikqW6rAXY6Migo=;
        fh=3hCNPXdGE1Ir80EzHdTEMGsCJMCrg/OzxB9Iyhj7WNs=;
        b=Y598A5W3Xg+EC2s3VbzXxVHO0yH8tMPV+yRlSxnGIyEPyzej2+/KGA3wUhJzWSlQtb
         avRJBwqETHPoiXpL1p8LkX81NO7RHE9UOFrCW+33BsJUTl+tFMTGdYfCPoYFzeqZqGSG
         A3vh6pAvajoX3fKqFRgSxGvWYf+EpYwVpGGCsSWN27TW+d2wE2vL4qPmKCPLZMTNXqfW
         Q45oYqktxP3Xf7Lc8e7E3gYcsTqmH3SbWyTjLlKIdF+eenmKPeaOeuMiiXJGIjL/wcjY
         uNLumVzt6odqEyZgKVDxwUoTCir1KqFd+RJF+xcO+eJMs3ZBeEuOCtipI873wLivOb0/
         hRPQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LrPgwyVE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-43fb17b9757si115509011cf.19.2024.05.28.08.59.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 May 2024 08:59:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LrPgwyVE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sBzE0-0002Ht-Cy; Tue, 28 May 2024 11:58:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sBzDx-0002By-Ba
 for qemu-arm@nongnu.org; Tue, 28 May 2024 11:58:53 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sBzDv-0007Gq-T6
 for qemu-arm@nongnu.org; Tue, 28 May 2024 11:58:53 -0400
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5785161b98cso533796a12.1
 for <qemu-arm@nongnu.org>; Tue, 28 May 2024 08:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716911930; x=1717516730; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=XZHdHibYnpZlZr9G3I7C1t2Kad9PTikqW6rAXY6Migo=;
 b=LrPgwyVEC+zzWlmpVLcWc4OaVHJXPMOkjgiYGhojGpu15yAn9AY6ghL1FN+pWp52Kr
 iB3vYfbkH9rPT8VchcWLFE+j5wFAe7ECdHYMwheAQiIVutl1q9QEeq5QVf+BoU3AfDXd
 8fuj2U96gLRh09+yBCzpyWjNtLhjdwktjEkB53qHYr3B+WrJmB6H2q4ksH/KhfLFHCdB
 t4pBZSU5M3E9npT5lgFUl62o6+ceUlphqCoFbbBnd5tfxBhn660uXd9IHo2OQ/UWVeKt
 9CUq79PQLzc13Yr4s7LoKNuz6BGSyrnMfG2haW640ojaAPUCpZxB4d7r+qqv38GYc3Qu
 Coiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716911930; x=1717516730;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XZHdHibYnpZlZr9G3I7C1t2Kad9PTikqW6rAXY6Migo=;
 b=YOKESE/HYmlDy8MoS+aA6ZUxhT0mvw/isERqSzm4vClTXwLSoybD3aG2DpsTssesml
 65D22vUtmucUNjEMIrCMaMqfbv++VC2iakcqIh/4TCyGJ2KSFlflX7NFLHSsMCYDMU0O
 h6ZqFIkNAiU2JonOlSifsDilw0Awqx595/5HQIoTm58tEUiz8Xb4DYQaOik4WrYkiS7Z
 shWJw53UlWrgiTqBDOh02tPalGAjj0gCmFClpIo9CvnLTT2co/bVqRO5YOaj5KTusU+e
 NG0X4rjpzQ3UbLQ1SXhNrkpOvM4bd7SpRnBbefmpW96OHcYNr5AFsk6TyvRja/xJp2C7
 PYzg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV1a7u7jumQLRFwaVdWJhlPRRvO6y7Sxkb69HOUHiTptRrf2VOW+GpGkGJ1bsAhInDk7zOO2IQkN628exoGOrvKgINC
X-Gm-Message-State: AOJu0YwKJhfMTxfIdwaVZ2QIkK9Nmb5Vs2MeCz6OOAyefMxeb8+p8rrP
 44St1fN2K3g6OzUgqDuokKSRUAjt1oJ+2i0CxqRXDjAI60T+xLThCGpeGeUgRpz/t+tVEpncqZR
 PwksWANSx9cPE2R0H/NyO+dSKQmvKFiWhzhUq2A==
X-Received: by 2002:a50:c946:0:b0:56e:10d3:85e3 with SMTP id
 4fb4d7f45d1cf-5785194fa92mr10974426a12.13.1716911930314; Tue, 28 May 2024
 08:58:50 -0700 (PDT)
MIME-Version: 1.0
References: <20240524232121.284515-1-richard.henderson@linaro.org>
 <20240524232121.284515-53-richard.henderson@linaro.org>
In-Reply-To: <20240524232121.284515-53-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 May 2024 16:58:39 +0100
Message-ID: <CAFEAcA8UKcxazjsjVXmcQw+4ihjc32SouLWMSXB=Fyez3MomJA@mail.gmail.com>
Subject: Re: [PATCH v2 52/67] target/arm: Use TCG_COND_TSTNE in
 gen_cmtst_{i32, i64}
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: 9v6UM+87heot

On Sat, 25 May 2024 at 00:30, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/gengvec.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
