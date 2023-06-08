Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp377179ejb;
        Thu, 8 Jun 2023 07:28:36 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5KQLfSJSfSsXnyj2YXNz1ubMZsHadwQOvzKpY4THFe2zAo+dSHMUZzHijBJ1kwzbQKpPWi
X-Received: by 2002:a05:6808:284:b0:39c:6a30:cc81 with SMTP id z4-20020a056808028400b0039c6a30cc81mr3838219oic.8.1686234516348;
        Thu, 08 Jun 2023 07:28:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686234516; cv=none;
        d=google.com; s=arc-20160816;
        b=pCDdGLnM2nsAiKpGVjLdnrl8xEjnKrDVZ/pABaWoVhFMAMuQYeKH+DsBS/Yn9OF798
         52Fi4KG42Hcno/XxjNfTk7cmP918tAPBXa/uuRacRMXwsdvbxa3Fy7F7z1n0zqN7rnu6
         GwzUzvKT+3OKPNxKyaU0ELtW8cn6spViTg+pHyryfd1EPwYHg9+2KWmf47U1Z7Wzsk25
         jMTMfMXpSWnnmEbezLhwNasAIPeFWOdcWh1g+5FgFi+onHwoIQxA2/sFjt03uyEAHrB6
         Ltppy7aVGXhRdT6XlKPZjjcSFApyYdRA+HfUR78yJttSuk/vYQ8E+dniJuwd63OivM5K
         OMNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=pVmdQf3hZkY6Ied59nd4b0nJHCnXpoRkH2wB3KpIV4A=;
        b=x9KfG6KUFETZukd00xITmBaqi98SR8yShcyvTH+LNG7EwvbUIKb73TOHfpt133VhxR
         cSejoiGdVkQkk8EHO1A+ZODs1s3+HErqGVn9RuAS8QI+nI+sespAfX2SBjzY72TInGRT
         PYaTH/ORh1E4kuco9xTZ2jhLOHM5Zj7yx1Rf0XZKtq1VWYQT0XiDmZSBag6HGH4xo3Xn
         aqfgO3L9B9WoIxbl4B8EnoKmGPPdXDug846St/GkHtnmm5DKIrGITAreLlziPhhVEJ0l
         RVuETDyL+VQn/nC1DBESFP+idjdRDKg84cF/4fWNhylM49wISSDG/bh2KiI+bmIOxcPn
         dabQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OFBoxf2d;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fq6-20020a056214258600b0062821e11dc9si779867qvb.445.2023.06.08.07.28.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Jun 2023 07:28:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OFBoxf2d;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q7Gcn-0002ss-Ko; Thu, 08 Jun 2023 10:28:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q7Gcl-0002r0-Ln
 for qemu-arm@nongnu.org; Thu, 08 Jun 2023 10:28:27 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q7Gck-0004aq-0m
 for qemu-arm@nongnu.org; Thu, 08 Jun 2023 10:28:27 -0400
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-51478f6106cso1178250a12.1
 for <qemu-arm@nongnu.org>; Thu, 08 Jun 2023 07:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686234504; x=1688826504;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=pVmdQf3hZkY6Ied59nd4b0nJHCnXpoRkH2wB3KpIV4A=;
 b=OFBoxf2dr5EBfu+LsY1VyQ+FRQYfupEWYK5OrUKtgJ+3QYG6FCIKZ7dijHXfHm8rME
 Ms/wLaI/Y253WWpsVvXAYXrQYa+sHvYou0oJuDJKm3nDcGz8c7/GKVBg+et34iDjNGCw
 Lym5IE+It4PLqYXdHIP/4P0TsZgoqm09YCfjlbxHqt1+Tlu+ZDQ4c5uLcrCJSOZZeTKu
 lvIVUyVBCCAw79tltu/eg371BCE2yDOoNG+7cTUzxowGTSKkSTp27Vcgp64SI4ho8K73
 l0FVInZbDw6Z6Y8WXcLOvPSp6AZ/ZMZcEgeIl5E3biRFXG43uFBi0UcE0YP4tvtKAYCp
 gcSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686234504; x=1688826504;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pVmdQf3hZkY6Ied59nd4b0nJHCnXpoRkH2wB3KpIV4A=;
 b=XZZeVebOl1ivTUFy7vchZqPPDZbzhGx01dtHuwTGZfnXKXwYbEK4eZoruUIMBIfOFQ
 P50RKT9Gw18LeroXPE1fQZ424YF05dO286O2meRHp0y5M5pXoBvQ92YH44Rmu/Z/7Xub
 bZKNqG0UAhEE3pTSlWXTh/jmY9YieLfP58oUABbW3uSauq3S2yTqX53lSnMnnm8eE8bf
 wwYKa8H5k/t3KvOTh8crRNrUt1MSg7Dyt8aX631FKG5OqdmA8ChmvO9infUPeXvIF/Bf
 hYKCKjEXyC56MtdfuT7MRDl21c27ElRGwcrVuuoSSrIRIpxjJHuf1ovoJK1ia16o2/Qr
 ybxQ==
X-Gm-Message-State: AC+VfDwytn5aCAcY7RdAQj4pngZQFF9SzbeiLSpi+8XF4hbjBlGOqJh4
 +lJKbeeec3PrQ5VqxTQyR+idnGr6HCU8512ZbhwW7A==
X-Received: by 2002:a50:ed0f:0:b0:50b:d18c:620a with SMTP id
 j15-20020a50ed0f000000b0050bd18c620amr7288796eds.25.1686234504350; Thu, 08
 Jun 2023 07:28:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230517081204.30333-1-m.elsayed4420@gmail.com>
 <20230517081204.30333-7-m.elsayed4420@gmail.com>
In-Reply-To: <20230517081204.30333-7-m.elsayed4420@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 8 Jun 2023 15:28:13 +0100
Message-ID: <CAFEAcA9LzbbLwNy810=wVtfF34XvSph4OAaiGtKrECq1E9HzdQ@mail.gmail.com>
Subject: Re: [PATCH 6/8] tiva c general purpose timers implementation
To: Mohamed ElSayed <m.elsayed4420@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: VQBLBbeQvWFN

On Wed, 17 May 2023 at 09:14, Mohamed ElSayed <m.elsayed4420@gmail.com> wrote:
>
> Signed-off-by: Mohamed ElSayed <m.elsayed4420@gmail.com>
> ---
>  hw/timer/tm4c123_gptm.c         | 495 ++++++++++++++++++++++++++++++++
>  hw/timer/trace-events           |   5 +
>  include/hw/timer/tm4c123_gptm.h | 131 +++++++++
>  3 files changed, 631 insertions(+)
>  create mode 100644 hw/timer/tm4c123_gptm.c
>  create mode 100644 include/hw/timer/tm4c123_gptm.h
>

These look like they're either TYPE_STELLARIS_GPTM
(hw/timer/stellaris-gptm.c) or a minor variation on them.

thanks
-- PMM
