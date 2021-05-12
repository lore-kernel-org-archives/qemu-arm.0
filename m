Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp5103134lfg;
        Wed, 12 May 2021 08:14:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwZEHYsncdoXVYpfHNKJ4iECN6OrtokklKyBmHwOh6Pm199RZnMMXKt6/IeKU5PvWcZASw8
X-Received: by 2002:a02:b698:: with SMTP id i24mr32997604jam.121.1620832463364;
        Wed, 12 May 2021 08:14:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620832463; cv=none;
        d=google.com; s=arc-20160816;
        b=kviOWBj5TNkP+qt7rmgqmkBePwZ/KE6ln8DC5HguewxFJwT2CxCyHdjBWZBXK2jvGj
         v3dAVc7e5OUZTJU6ztsKHW01FOcI8/MnWBCO7d9LDo2pMC7D+MpxU3nW4xMBvGR6kdPg
         hE3vKQJ0dV6ZNZfV13z3D+THNOITz/oVRkpysjJpitAkF4oLMbmkOrYDOFdG9h3zI6kP
         8pzYiZnRVY/YOjB8sZJSAu7lK3nEmVcHybD6wSV/SB9WNg1o+5mDWF1xd9A9Be9nIubL
         uy08+Haos1M8ZisqDZcj2WGU/X7qCilVmvJL0eO559UP+j5orS9dbcJ1pFrNACNuQqo+
         hVwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WrwVdvn48w9E3gd3L5oybplNbYWFyHzVuRtoDmaOcgQ=;
        b=W4FlLgq46g+gI257PldMWeVSCCGUfnCRGUL+BEbLFGFOlLOibk6Odbgq+kE+mQD6OO
         p7bbo/zAbXXsT+DajG/ffNbG2JUAD05damcmil0VRPSVwEATtV07TtQU7ZRTGIlHP6Hg
         GjVMthOZi5RFc2kIdB1ClS4vXrxXXVLoPy8bPKdBQxv9GbfdIk4SQvcqhLq4llv+cJ4p
         ehpTXepjWcwZ8g53f8T7X4TQl97I2bK1x9cnicA21PO5k/Ar9Sf3NuSeAzEEHTh0n5Fe
         gB0skaWkcNUtYS/0iYWDKQ8rA3WPcdKLI4o4xVBcmjCLjtI3nsYywDur2KpzQqOYjJZY
         EF1Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=s9H1yOPU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b26si198509jap.85.2021.05.12.08.14.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 May 2021 08:14:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=s9H1yOPU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lgqZ4-0007dp-Mz
	for alex.bennee@linaro.org; Wed, 12 May 2021 11:14:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgqYN-0006it-2J
 for qemu-arm@nongnu.org; Wed, 12 May 2021 11:13:39 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:33741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgqYL-00065P-AX
 for qemu-arm@nongnu.org; Wed, 12 May 2021 11:13:38 -0400
Received: by mail-ej1-x635.google.com with SMTP id t4so35598771ejo.0
 for <qemu-arm@nongnu.org>; Wed, 12 May 2021 08:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WrwVdvn48w9E3gd3L5oybplNbYWFyHzVuRtoDmaOcgQ=;
 b=s9H1yOPU1Y2vIWdG1zUM+aoKbvBbhEjYueJaV02cszVRRuXsFB5sPEQHf1pwURRAaQ
 J6sQCXSdsQos0zb1ziCCyuqXVj9Ex6B90wQ3hzonH3GIuFnGrbQCOC7yiFBiarjnrni1
 iEj30axugv4iMDUPkYOCPoqg5y9h5Ix/0FyTymv86QOEqiAqiDxhPXAfmcvCMCUAO85d
 JAFj5YDVxjaq3VtaMUq5ghuWMZTE5Dno2EB+U8XFdzFjVbP3Vg9CO9kEvoI8Wa7QuEpb
 TU64VOXM3f5n0GNxMMReN3iwp2kAfecMh6uB/ME7MPZsMgmxxCBiRjh2HYCoGXnGQbnN
 iyJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WrwVdvn48w9E3gd3L5oybplNbYWFyHzVuRtoDmaOcgQ=;
 b=EtWwm2CW/DMoSNCTkHEZVn4KU5tTwGrvvaUYKSVZZJQXn0cFTZofGvZD1rp2lgN25u
 2dupNF+3NHFf8AMm58+ubsk6gm0cmd8gKtTzl+6Q2Tzt5GTFO7E/1GPICqfSqgHVT3q6
 5pX73VuCauwYUTjyBQb5Lr8dN1HLjCZw22ksw+ws8qCT73dNPom+3DZhpM28VdGEVilN
 nntZ1ntBsy+F3OFkspLfBIVkCa10ZC6zfPOjR1G6rszS/gBXgajmnxaymLC4vBkV/vB+
 WMSGUpFnV7f+ZMZa+3/P2M3sR3A65dVyr671VLAqvhz9E6cDPFrzNaHAfp08pf4fNBFq
 OUzg==
X-Gm-Message-State: AOAM530Cp8NZhNnj9fY+mg7+FvbeSbu4Hu4rMdsTN27s+Wc54OTpWskc
 bBPYMPlslnqwcWuj3d2r888b6CNZ9obO3MoasMbKgg==
X-Received: by 2002:a17:906:b1cc:: with SMTP id
 bv12mr37798526ejb.407.1620832415544; 
 Wed, 12 May 2021 08:13:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-36-richard.henderson@linaro.org>
In-Reply-To: <20210430202610.1136687-36-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 12 May 2021 16:12:22 +0100
Message-ID: <CAFEAcA-kXzyFjACPN+5RFBWZ_cyj+8=4iP59NDjhDm7Dny2==g@mail.gmail.com>
Subject: Re: [PATCH v6 35/82] target/arm: Implement SVE2 saturating
 multiply-add high
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x635.google.com
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
X-TUID: oOl/mTiFcRbS

On Fri, 30 Apr 2021 at 21:53, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> SVE2 has two additional sizes of the operation and unlike NEON,
> there is no saturation flag.  Create new entry points for SVE2
> that do not set QC.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper.h        |  17 ++++
>  target/arm/sve.decode      |   5 ++
>  target/arm/translate-sve.c |  18 +++++
>  target/arm/vec_helper.c    | 161 +++++++++++++++++++++++++++++++++++--
>  4 files changed, 195 insertions(+), 6 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
