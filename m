Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp4120295lfg;
        Tue, 11 May 2021 08:59:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwmRwirkprlXMllw+gTbsu321mr1OYBIzGOzCofyW0FgO4k8WtyxT/Tx6Zq9c2VUnKtD+1e
X-Received: by 2002:a4a:abc8:: with SMTP id o8mr24046697oon.77.1620748797689;
        Tue, 11 May 2021 08:59:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620748797; cv=none;
        d=google.com; s=arc-20160816;
        b=a1sPkJUemDlUpRhs6Q9tBm+RAY5qXvDKN97eCWP2Z6i5iLD81s5gucYMb2BkM6SYIf
         qdiq0ZQgiWl/HnP8Xr07WdrigbqN2+b8BzpqGuWA4SK2iQxhKz1g0D+gjshxnhruSioE
         fLmf+JkV3afVNbp3HdMkXwJIXTbpiBjck1AibReNySxB6iAebnypa7jSGkMplCIqplr9
         v+bS2O4gnZCHrkSmbgiGIsUU1xnto9aqF1Z97fgmz+o87akAKOUwNgMp+xNedtdQfsN7
         LEJbiXXpF1gcXMIOnE43MGJMiVKyGbg7TEdfvI9OyqGTy0xpnGJud9O03hRT5A/qDUEj
         ZHxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=m6Bl5/tCat11GY67rSTxhzoWDxtPd1qovms4W2Fq9Dg=;
        b=UXiDU0YStzgUVMhEjT+OLgtAclLnlfNK4F0eCZXLPTevONuEcZS7w7n+sh5s0LexIA
         JkLKLd07ZtI8yMxg9jBCpfq6VkoNy9XwP7lA4ufhpjz50zsziI4fJXQHl8uDtUOPg99G
         cduszA9fpAmT3DQB5KN9eBG9Ab5vIbIM2uanckkgeAjTIGgURCcc6IFEpOZ7tFRtFH96
         edZ0SU25Dd0h/45En94dWqzJSgqf4qDrfIDABPnhOH4x9hBtri+KE/lyHZgjyq6PHeJ8
         zbX/qrsLYtqj1unVWZoYlSzUkwH8Vv7UnJCP7zGGMPUD5oDVHkVgm9ZIhoI1M/Tes24p
         sdmQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fVAl6+nw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w23si17718306otk.130.2021.05.11.08.59.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 May 2021 08:59:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fVAl6+nw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lgUnc-0005bp-Up
	for alex.bennee@linaro.org; Tue, 11 May 2021 11:59:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgUmS-0003L1-JZ
 for qemu-arm@nongnu.org; Tue, 11 May 2021 11:58:44 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:43604)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgUmN-0003V7-Vq
 for qemu-arm@nongnu.org; Tue, 11 May 2021 11:58:44 -0400
Received: by mail-ed1-x531.google.com with SMTP id s6so23454481edu.10
 for <qemu-arm@nongnu.org>; Tue, 11 May 2021 08:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=m6Bl5/tCat11GY67rSTxhzoWDxtPd1qovms4W2Fq9Dg=;
 b=fVAl6+nwotzd/A1Y6etjaW/OSowRGP1JJ+fbNIG3KxRW8HxDrHzeZnt0nVJPFspbBb
 OHPLqbOVsHv/xSj+jwNJmzVuhZgnVqIRLwGBArdyI6WKmHJeN+r8KZ9Q20cMkgS/hQBT
 g4frAfxZie2pAo4Dn60uRcbr69rxqfuThdVWhh0uqgCI62TPJbOc39c4XIaZ8KucbfTY
 c4uk598ZkhYSke4+1MhRkOlOPUwLazSdhdnrdYyWUYsBZUEYFPdu/+5yPbiq9Uq2usMw
 +PNpVRs9O3QfhxjJNE3jPXOAfw4UWm7WX6wEFU6DzVNhg8KykNZceHYzkNIcfaejHE/s
 KfPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=m6Bl5/tCat11GY67rSTxhzoWDxtPd1qovms4W2Fq9Dg=;
 b=iDhaw2hVTAQuhsKXLvJD/ozzdX+YO9FcKPSJCYaEHbDE2bELTsQfoq+u4mTlNQecdd
 4PDJrYtWyJK2ygd3PleTLAYRv2WH+8KTlQSQnuRgarKdTILcpE86quHsCIOlrzOz7nbG
 t+9Y2DL+oP1pYzM0ZivfwqnWkmmpTq7WGAdI7FRTTS4ujWWtTP8LWTfv5Q+9ovSrjhN7
 kxndqLAUVntjGaBhbyXSbVftcZf1qXgUzVKoSybwSWD+gf6mB2mcwEA05BuCJAu40hL6
 4rIG0XPtXt2uj+tE3Y1l2iD2xH5qsXnNNCzutFSBduRv/lf1iQCfwbYZn0ukbB6qgjZ2
 Hr7w==
X-Gm-Message-State: AOAM530A47PgCt0/WjD2j4Ns1dafj8ZBQ5irUcdjykfaRilyQOD1cj1C
 iIGfNPEwohGs734HGL8K/fKFYxZX6CtKJUR3nw8BHbqv1Kw=
X-Received: by 2002:a05:6402:3548:: with SMTP id
 f8mr36814015edd.251.1620748718521; 
 Tue, 11 May 2021 08:58:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-22-richard.henderson@linaro.org>
In-Reply-To: <20210430202610.1136687-22-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 May 2021 16:57:26 +0100
Message-ID: <CAFEAcA9wT3hJh4PGO3BRHbSf+kST71DWT4_2g0Y_UTLHoe-EYQ@mail.gmail.com>
Subject: Re: [PATCH v6 21/82] target/arm: Implement SVE2 bitwise shift right
 and accumulate
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: c8L1Y10Bduem

On Fri, 30 Apr 2021 at 21:53, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/sve.decode      |  8 ++++++++
>  target/arm/translate-sve.c | 34 ++++++++++++++++++++++++++++++++++
>  2 files changed, 42 insertions(+)


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM
