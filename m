Received: by 2002:a05:6512:e9d:0:0:0:0 with SMTP id bi29csp1620271lfb;
        Thu, 31 Mar 2022 01:36:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxBGwjBlQ9OzcqBnvbhOlSXPl+UDjIExdPef1P7fzl0wqVJuanMkZWlJvIP2YXYrJDShyXF
X-Received: by 2002:a05:620a:15af:b0:67e:9b09:697e with SMTP id f15-20020a05620a15af00b0067e9b09697emr2529016qkk.139.1648715771081;
        Thu, 31 Mar 2022 01:36:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1648715771; cv=none;
        d=google.com; s=arc-20160816;
        b=S0TrePt/D5Ae++QorRAK56PpEsVtqigF0CH1+whmEVMEA7ul9v3pM5eDcPYLqfUO/h
         AuVKv7ObZGaNJmux2RlEyjIp9gcO5e2+evCKRgnFqvQZo6AAfo2YDfz5rqydXMZy1eBV
         hHEeeslPyCnpSmIAWwMQrxn8KqQPbIoKmWKeG1DCyLdYFRdjyRkY1d228cJcU3pqhZor
         RMYozFUrWXPx2o/F0yj/wAyHyFWZDg/Ey/nH9nJ/U2GVSG3MVD6snrfxM5zSQyv0P2W1
         eShqB3wqTE46AFNCbNxMZJWatNSt9UNCJYwYuNrED0QMtXvxPLN9vP8M64VEv4m1G7k0
         qCIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Sb5IDYbVtXFqhdEXxjvsc/0Dr+RVcGGxEXq9wIg37Y8=;
        b=S6m8fDGdF2b9Py0D0uHk+68POPTDREvph0TCTKjSq8XwqBLzJdPXdq1JjmW7zqvjIe
         1DvhNpySD6SjM3YJJpTB9a/JI/60THutNepTzDfCDodyD1dUO/F5YorkxfiX1VfJL19b
         o2D2kV176x40gzZnML0cGpDLaJX2hr+4YYuKFx58x7Un+b/ylusxLtrLtEiUDDNeAEeH
         1V4hQsgJlmA7DVi+t9XBYvglwX6eiCyaQgRl7FcsEjFGMuhWaiiUpPeDzAnThF5fyyJv
         +O62nfKYN0vlD86z+AS/+4bOkRdv6bd7mNFjtVX9WNQ6tdZUOvwh84b1Y88Lk7cieROm
         /jBw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cGRSZ6Nj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w13-20020ad4556d000000b00440e46a7cf3si11973493qvy.401.2022.03.31.01.36.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 31 Mar 2022 01:36:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cGRSZ6Nj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nZqHq-0002Di-KH
	for alex.bennee@linaro.org; Thu, 31 Mar 2022 04:36:10 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nZq8E-00025T-2D
 for qemu-arm@nongnu.org; Thu, 31 Mar 2022 04:26:15 -0400
Received: from [2607:f8b0:4864:20::b2e] (port=43005
 helo=mail-yb1-xb2e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nZq8C-0004aM-E7
 for qemu-arm@nongnu.org; Thu, 31 Mar 2022 04:26:13 -0400
Received: by mail-yb1-xb2e.google.com with SMTP id u103so41025407ybi.9
 for <qemu-arm@nongnu.org>; Thu, 31 Mar 2022 01:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Sb5IDYbVtXFqhdEXxjvsc/0Dr+RVcGGxEXq9wIg37Y8=;
 b=cGRSZ6NjYkNFHNJHThRdnQb6p5TeUpHV1ne+lPQT8A66ER+waP2V/hjJphqu0/h1kY
 re4DeTTAg9d4jAVaDSDevjKVC7pZpCh1hEh9NfyCafGKjn+qhvIoaUUHsDSiwXujCdRG
 u1pV3/kvn9M5+e3LuwKmEWoC//giGoPuW/1RLZL7QCja8OBV8LiHtuvCMZIso455ye/C
 zcALAufCqVdu2vDDzmSwV8ysUlfOJtJ2MmC5TEztuLydoeFkrwnoACvLdGQG4jXKpyM7
 yCV4iVzPk+DxSZ2UyyJCAorEZV7JgpmonCwluBMlWNJxl3zWfJax+phmN5vKkqutYZT/
 zroA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Sb5IDYbVtXFqhdEXxjvsc/0Dr+RVcGGxEXq9wIg37Y8=;
 b=b16BiIURmjLmgHiwvnEatGGpoppRixTnvxq0Is6VPjrG8d/NXJ3JNWvec2lsnPMkHc
 sCezhNJuq6VY2W4E0phaJee7zhK15ptspbVkOi4bbfLcTpqOu4PhZPRbp2GhU+KDeN9z
 yquQawB0JrP9Na8+STsuah8KVvBe2Kcm5WUAp098AUYCoDgpAoIZjgAuaM/Y9ObPgUI2
 uPJLpOJIZv+QWERKhv6O3Mx3eCKEWbBZrGLqs1Kz6xAGMSa+cQsTpqUw0kiv8VSWkKhP
 TAOQTX0YqLx1dqWzHsFLs+AZG2GX3rB8oag/y2fB/zRTmDcz2K95VEI4lyUIsoqPzCAr
 1TqA==
X-Gm-Message-State: AOAM532oV3mTgRvLAoez/7lyI8BLYf1yuje2ChTzNr16byU+oQiURrsL
 SwJQz9U7X325bo9hDIH8pCjc3KiRTyz149eBa8evJQ==
X-Received: by 2002:a25:cdc8:0:b0:633:8aa6:6a3 with SMTP id
 d191-20020a25cdc8000000b006338aa606a3mr3289894ybf.288.1648715171339; Thu, 31
 Mar 2022 01:26:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220328173107.311267-1-idan.horowitz@gmail.com>
 <a2e29af5-705a-19b0-b7ad-0126f8d441b0@linaro.org>
In-Reply-To: <a2e29af5-705a-19b0-b7ad-0126f8d441b0@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 31 Mar 2022 09:26:00 +0100
Message-ID: <CAFEAcA9kTNFeAOUz3BFp+ti=AtZRAk2jQTOjDzLnLANPtM4MdA@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Fix MTE access checks for disabled SEL2
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-arm@nongnu.org, Idan Horowitz <idan.horowitz@gmail.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qhPs31O+lgmc

On Mon, 28 Mar 2022 at 19:04, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 3/28/22 11:31, Idan Horowitz wrote:
> > While not mentioned anywhere in the actual specification text, the
> > HCR_EL2.ATA bit is treated as '1' when EL2 is disabled at the current
> > security state. This can be observed in the psuedo-code implementation
> > of AArch64.AllocationTagAccessIsEnabled().
> >
> > Signed-off-by: Idan Horowitz <idan.horowitz@gmail.com>
> > ---
> >   target/arm/helper.c    | 2 +-
> >   target/arm/internals.h | 2 +-
> >   2 files changed, 2 insertions(+), 2 deletions(-)
>
> I was immediately thinking, didn't I just fix this?
> But I was patching pauth.  Anyway, good catch.
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>



Applied to target-arm.next, thanks.

-- PMM
