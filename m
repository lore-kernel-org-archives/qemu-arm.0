Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp70896lfj;
        Sun, 1 May 2022 03:49:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwsCWzRPrn2RAfgY0/dYtu8abk0IN6BJfcm7/up9dImBX6Ao7s3Yp4RR5h1YYu/k8MlDD9s
X-Received: by 2002:a05:6214:260b:b0:456:50fc:550d with SMTP id gu11-20020a056214260b00b0045650fc550dmr5902461qvb.13.1651402175914;
        Sun, 01 May 2022 03:49:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651402175; cv=none;
        d=google.com; s=arc-20160816;
        b=HX/LmzBgUtNfat+0q2mUF3w3Ykj1DByw2LxZZKLB7idDyE2CVUabjVuzSIbfjgOv+q
         ogiYzAAn/NvCgjX1jCewGSotcOtOzgvA9FgJikKHpQSqCRlU9p1hfoYcdpuDkxFcxZXQ
         izTByS/lbpgh5hDOZx6CjmlN+uc0FTQIyov7pDt/jFqJdglDIyXD0Ijpvxe8W3qw1Vlf
         Og5P4/clnppkxhET+jBlKzsKjICly41/ofDFIF/VGZAbkmEa8fMWpdnUqWgovuTIuvvU
         Yh+TrpgeCvBDZ4LMyUto+w6iuAmED9Y6328Tga5tfknKxuOmN/6EiHkraPH2NHqE/BKR
         Ki1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OLAIFtX2tJnIhI6+THl8JJ9/NHHQWaAX323v8aQzTng=;
        b=an8erS36B9KEy6+MZGnSPtAtIgjW5nn4tiexwgtxFo3ApoHQpp2Xiu80tYv/23YO90
         Ceri2FIFO4Wz51CLXiANzCfEDbybR7VUzlB03H3vCYBjL8pa2x3fJLF5jGQHJFmlY0rk
         bPlrIkOkAvpOujCP6v1K4kJLXDJdBd6SC29WtiBgZKkgEFKFQ5pFbpslS5GEy7MVuPXL
         pXCFhVUf0g1jFKf3p9FkaHhKBiuOGzjhpEQyylmxMDmebuibk5OVqqrduszgtQSZC/gs
         ddU3YZAhqcfUfK+pyrgNrdHxxyVNbsWDhHrxj9AQnn9vvo99a7PDtn5GflAZaSa3569Y
         okyw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XfsLYHaW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w4-20020a05621412e400b004467b6500f1si4478002qvv.254.2022.05.01.03.49.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 01 May 2022 03:49:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XfsLYHaW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nl78x-0004ay-Dj
	for alex.bennee@linaro.org; Sun, 01 May 2022 06:49:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nl77O-0004X7-9F
 for qemu-arm@nongnu.org; Sun, 01 May 2022 06:48:00 -0400
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f]:32988)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nl77L-0006Hy-La
 for qemu-arm@nongnu.org; Sun, 01 May 2022 06:47:56 -0400
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-2f863469afbso99486347b3.0
 for <qemu-arm@nongnu.org>; Sun, 01 May 2022 03:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OLAIFtX2tJnIhI6+THl8JJ9/NHHQWaAX323v8aQzTng=;
 b=XfsLYHaWsxCDjuMv5xog3fSADGn9X4qQCnRM5ZpCYnKlu583CFMf0w7mr2OYTH05dC
 32plZYFU/w37Bf5oPdfPerAtCgb2qDc94wOFt19x1hlT67JlLe4sazfOskqcqb96Oame
 6rvLfnfT1K7xkBxnMzQfdfDBW3h9+OAhP3BaGg9mtrVKiR/xP6jzVNUznRsUsDWg+6bv
 ZKuEB5Joe4MeVaxERIFFYVKCNGb1oEofLBBHXp/QEM4ckQUjluxoTvzoi8VH6mR/h3SH
 vzVMGltj0jhHj5Qw1bpSx49PBcEQh0jZGzP0f8asG/kXm2LQ+25iqJF8wkDqtZju+JmB
 Wp4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OLAIFtX2tJnIhI6+THl8JJ9/NHHQWaAX323v8aQzTng=;
 b=S/MRojTrEIzlH1X2WB+65U7bupG4HXbeXaxsQ+LCcGrfmC2QqkIT8UcrkBerBmw/9Z
 HgFgabdkkhGyQiHs4SDZH3g9aaWvPkZfy2JlBsoj2PXAmyrfdKa4sZvhuZIXY36BrEeh
 d3pGSwa9/d/7qTkxWTSyuT1lbzL9kxX/6nhrLHNWSV3vzJUaKfHcJ7AGAwSFWuRECNGx
 vkPqRZhRk7seAlcZrQrALcIN2lQa9a5/DIGHAqXwMsdASh8RfhVlmiaQ+kOv8URVIChX
 1t76vUU/StdyM/KocQKHR13FCuqaAqvy0oMD50eBCqpZ24C5kEjF1/+JMYj/xziGCL8I
 kGSQ==
X-Gm-Message-State: AOAM530wzimSy1zn/xOIj/EgWy0udlJKYTHBlMIDHw7oz8eKeQQMXDwb
 XQAXdN7Km+c+Fkpxghng60IxLjvMWP4g6/gHwdLKkjYopuI=
X-Received: by 2002:a81:106:0:b0:2d0:e682:8a7a with SMTP id
 6-20020a810106000000b002d0e6828a7amr7235635ywb.257.1651402072851; Sun, 01 May
 2022 03:47:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220501055028.646596-1-richard.henderson@linaro.org>
 <20220501055028.646596-7-richard.henderson@linaro.org>
In-Reply-To: <20220501055028.646596-7-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 1 May 2022 11:47:41 +0100
Message-ID: <CAFEAcA-09LuiKfLySiCwzhwJfLSo+aUGnb3gnA7Jdj_q_R5-Bg@mail.gmail.com>
Subject: Re: [PATCH v4 06/45] target/arm: Avoid bare abort() or assert(0)
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112f.google.com
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xMC0hLNmZ9Kb

On Sun, 1 May 2022 at 06:52, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Standardize on g_assert_not_reached() for "should not happen".
> Retain abort() when preceeded by fprintf or error_report.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
