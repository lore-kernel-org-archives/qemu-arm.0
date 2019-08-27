Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp5170282wrs;
        Tue, 27 Aug 2019 05:28:47 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxnOZeIaFsPt0O6GkvsEKyeTFuSdjdVNkawaLKdByWHWDNv+d9pule00cYb1rPFt6pbl45L
X-Received: by 2002:a50:c385:: with SMTP id h5mr23555499edf.18.1566908927627;
        Tue, 27 Aug 2019 05:28:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566908927; cv=none;
        d=google.com; s=arc-20160816;
        b=LDKNBHSjP70kV1AqDBDNfGk23xMQW4FQDSv3mT7ass+ybZ32shmbZ2LdeeNQA3yg+U
         TqpnUr5/QDhUkzPgFgWnqoZsQyNGa7uJ88ThfvfuVrXk7zYutOgoOvI29nNuRVGRzUXR
         4c3u2DIZecPEocFwj/fRwPblhuZqFhdVgCe8MV/UQSJUaRq97DqHhBeJ2dU5b3Hj6MwK
         I6HiGuwzcjD1nfuAIAq4DnattR5uaVcVT0CZLsmgd/eU59VRUI2ExtGRz+D1YrsrzSQQ
         Tw29owlPgqH/ocUjfYYjiAPy2PBB+JRDU3kTI4srthL4XdxKd6+5QzDZzNjwvrw+t2jW
         wp3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0oBjSKtf+OCsEs24h5eNAZGHMiiMtz+v3nB9gPfkpWo=;
        b=S0fzwZmiPdtRE/kylLGsxHacDDki6WvxgtXkwAKKrZcT1ceVYDwbXeZJr6JzdwyA4x
         PNJp3kmPTvIc5G9IGAS5a4/EOqSI0OryOZ/zmxKizKo/6sfvz0LNZKDlYgNjks5tYvl9
         tP+NVPN0JzcQIfnLs4Q2fpro2cbyQX+Kn4kuz4FTVuYNEJlt3w1t33C7Fs61q4L/O81k
         bk97gOLLR2/nBMuAzN/XnK/RFs5g2nplosb5Vl9v78VtrSYNUuuQ8p2uoYTyXEngVsZ5
         RoHWoYjALIrInLFJiEjmdBl4qp4zSFjCkKCBj+XDc8CGQXY2DAPZTCbn1FrZbsSV/Qre
         aQwg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="OhK4u/Q3";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x29si8712587edb.209.2019.08.27.05.28.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Aug 2019 05:28:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="OhK4u/Q3";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i2aac-0000S5-MQ
	for alex.bennee@linaro.org; Tue, 27 Aug 2019 08:28:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49960)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i2aZW-0007mS-DK
 for qemu-arm@nongnu.org; Tue, 27 Aug 2019 08:27:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i2aZV-0006l7-7T
 for qemu-arm@nongnu.org; Tue, 27 Aug 2019 08:27:38 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:39609)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i2aZV-0006kb-23
 for qemu-arm@nongnu.org; Tue, 27 Aug 2019 08:27:37 -0400
Received: by mail-ot1-x344.google.com with SMTP id b1so18459483otp.6
 for <qemu-arm@nongnu.org>; Tue, 27 Aug 2019 05:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0oBjSKtf+OCsEs24h5eNAZGHMiiMtz+v3nB9gPfkpWo=;
 b=OhK4u/Q35g3dsaRTwTPbaChBkRLB7S8FXIP4N1wyRMp58vxdv4i+AOxh4x4T1LYr9c
 cw7I/gqe7rbHJVKQm5KmF17x/vsuk2WOWX0uCPUtnsNDK+esNUhx+p6knOaFp18iG1Tw
 iXMcHDmwE+pBTUBa9Vs3sGFquDgPZ33eW3zMAMtosmLbH2HnDbEb8w4KVR0IApNRmr4m
 ZGFoVXWlruBc5jzYNwDyq8EBRuH3eGcZvaOb0W91GjJVKSrGLOD5QkCxA+Hps01UxWLd
 dlci1iPlQRsxHj6LKOKrxNB/h6yhDR5cG8UZHK+9kiMy/syHmLMvrMBbOfcTNY/8d9qJ
 UNYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0oBjSKtf+OCsEs24h5eNAZGHMiiMtz+v3nB9gPfkpWo=;
 b=TPHuY6if9oCZQB5JllSPmWeda3OuVDQk3A7BIJoVg9K2L0LTWxZHP2uUXXNJz8sxqC
 KD/tyKE/jTSf42lYdQvRGFmHY+/MPfdbp5TsivtTirvLKrrX8Ue7kkoqpZVHalnIDyaC
 sLUzfWOyfLyWh573T74itqNXApFmyYh4McxoN/3TpxlpmniYUhAiVd8bsuBY5u4zyM+E
 HxTyrCHFv4JPqhAj8JPY3egE8y3IBsPhSjUAP2YqAID9zDV2n8SoAHiUxCOyXFcZlqvg
 F1n21dbLc2pplzpGdwjtevRN2eCF+wiE3TmTKmG1kbu9mZ2Te+phxq0ybVKmlEmHt/Fb
 i4sw==
X-Gm-Message-State: APjAAAWwuB1o6W3VFmTFUQaPkDf7MoucE++mEqhQq0WmE3juCoXrqdh+
 +9yDGqq33THwKNpajpJqY0MGPDYTAQheFQyCqFSydw==
X-Received: by 2002:a9d:6a94:: with SMTP id l20mr18698667otq.221.1566908856093; 
 Tue, 27 Aug 2019 05:27:36 -0700 (PDT)
MIME-Version: 1.0
References: <20190819213755.26175-1-richard.henderson@linaro.org>
 <20190819213755.26175-21-richard.henderson@linaro.org>
 <CAFEAcA85Ojy2u_G6frO_KL-kmTVCfpcOxsW5CCuKr=eKPcm+KQ@mail.gmail.com>
In-Reply-To: <CAFEAcA85Ojy2u_G6frO_KL-kmTVCfpcOxsW5CCuKr=eKPcm+KQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Aug 2019 13:27:25 +0100
Message-ID: <CAFEAcA_W54m7vOhPWNF6yHJC-9YjHLcnd=3eKMzwA1YJ2YYryw@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::344
Subject: Re: [Qemu-arm] [PATCH v2 20/68] target/arm: Convert load/store
 (register, immediate, literal)
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
X-TUID: SnZ1LGGUfKMO

On Fri, 23 Aug 2019 at 15:54, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Mon, 19 Aug 2019 at 22:38, Richard Henderson
> <richard.henderson@linaro.org> wrote:
> >
> > Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> > ---
> >  target/arm/translate.c | 797 ++++++++++++++++++-----------------------
> >  target/arm/a32.decode  | 120 +++++++
> >  target/arm/t32.decode  | 141 ++++++++
> >  3 files changed, 615 insertions(+), 443 deletions(-)
>
> This one is brutal to review. I got through review of all the
> decode file patterns but got bogged down when I started looking
> at the .c file changes... I might come back to it alter.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
