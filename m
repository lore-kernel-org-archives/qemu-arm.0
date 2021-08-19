Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp323071lfg;
        Thu, 19 Aug 2021 06:23:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyey5DpBUQCESbazIIRrCTibv7HXemUlia7yRGtp2X/3D/4f8AclMYA2qetcCC3SQPlvM5c
X-Received: by 2002:adf:fa82:: with SMTP id h2mr3766088wrr.129.1629379404362;
        Thu, 19 Aug 2021 06:23:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629379404; cv=none;
        d=google.com; s=arc-20160816;
        b=qzZuUrJcB1CUcno2ZFVCErVtirhzfxsLIvbWcIVwzIqtRm1TdUYDBlThj6mxIpdnkc
         8FV4ad71QjHogZgEPtD4lONtd5jQRb5fZ0IjLN43u2gQ345LUOT6+ngb75f9zMj/Q1Mt
         e+qyDcgaxdeFDYpKTIDTBuOvO+E9GrdBR2EAb5ocQ2xH0o7tDt1pL9wMq6zE97DUSaW+
         XcglmLVgR8May2s18OqAoG7cAtx6O3/MsbDQKRv85Umm5KnFTO4b/I6IyP9FcRUnW7BM
         BFoEWbVH/tjrs5FkGzIQBuKLK73+/1reqCvd5v+lwh05PiRyvs8MlZukDdTVqt4HBn5Q
         666g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=M0R5cxpyeP49exxiL7ER7+OQkThVaQawoCW6jicQHQw=;
        b=0lUQ81uDjHWLtKX3087Fg4EW5bs3mQputRuV6MKn6A64hXuPqfXRSRdjwZhqhiWE4+
         U2qgvOEv3Vd21ADPt3NELwVaRWG8/1XXZW7hO34SyJS5aBNnjHCfFXm9oRdco3kLHkCp
         Qld2FW9T7jegiYXjm4ld0g0pt+Upu5IqShjb8W5Ge3Wpqn0uzdv4vAzMakGGXtoJTPNe
         arhvK8OTMY7uoWM4oTg9Y0zh3DEJF55hrqxVasn2SxC4DjKwHDYE5qnBO3yb73Xuwg7j
         Q7FyGghhKDigNQT0Hu0SoSW9pfiyR4I2KGrQ60D6ihZpMn7pesfDy6xHNhzZ+BFLIc0C
         3Qjg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cuHPUXXn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h1si3297176wrm.555.2021.08.19.06.23.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Aug 2021 06:23:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cuHPUXXn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mGi0x-0005eq-Fu
	for alex.bennee@linaro.org; Thu, 19 Aug 2021 09:23:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mGi0T-0005Zq-QE
 for qemu-arm@nongnu.org; Thu, 19 Aug 2021 09:22:55 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:47097)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mGi0S-0006Gc-Ep
 for qemu-arm@nongnu.org; Thu, 19 Aug 2021 09:22:53 -0400
Received: by mail-ed1-x531.google.com with SMTP id r19so8809629eds.13
 for <qemu-arm@nongnu.org>; Thu, 19 Aug 2021 06:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=M0R5cxpyeP49exxiL7ER7+OQkThVaQawoCW6jicQHQw=;
 b=cuHPUXXn8Vphfg/SdtVh4qUfzQLMZzsGE+bBOHrnx/deAwufaJNY1xIqFFNxgZO3Ur
 d41tLmX0zWTk8UHFw1/J1d9+CnK1kauqaBE4PlnPhEJ3I5kdeqkdFIxTNwu3tWTs0tlQ
 L9ZnqTSTvkVWR4T+7tYQUvbl7Z3XPA0efEOtsfgbnR8Z1ukEZT47tqdneS8u5BDV0U8d
 oxhSPU26aEfBMhN87US1bjNtMwLdCmDSH5DuknPFimh0/Y38HvcBUlDIT82oR1I6+HBU
 rVcyErSAV90NDywq+rlBmjxVYQRl4RgFHtH7RP2Tu5FQav6qEDP4o3sYQPujNyywkrg1
 6Pog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=M0R5cxpyeP49exxiL7ER7+OQkThVaQawoCW6jicQHQw=;
 b=p627DoKIpcy8SPcTWmqCFI152XoDpeylDELQMVUaOSAP7S2QtBZfMegaBevl4W588L
 VVzmW8hbuchLSHMZ0l/YxaVv1UIANRegKVdgyRPXyEbUcWS0CdBxUGsMb3bRWVtsvhhU
 ZcqIXw1SyKmUyfyF92uVSCNRXeNuvcS9WTGgL9W6g3V4sGJ7WrNB+cs3BDH4Z1DalLZ0
 4nurxX0gvRNVAgdTPxRuTAp6ZFd4CkUnxSOLFRvzniTjNRN1bHlv200UHyBvZyRmwYmD
 2GrjZHLDCCIBMhB7hJ2CqZrbGdb6ggYOIMd2CF6v4Vy6Ba7XjP8jG4i4E2ctd/YTxeUl
 18+Q==
X-Gm-Message-State: AOAM533/R92t7fi2BOXg3CTwXzIVOeygiwRvfBYdJtbL/F+ACQcSbq10
 SdP7hPHEi0dmT91It4raek+mbQVo9UT9DPCeLutiCA==
X-Received: by 2002:aa7:c4cd:: with SMTP id p13mr16140684edr.251.1629379371129; 
 Thu, 19 Aug 2021 06:22:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210812165341.40784-1-shashi.mallela@linaro.org>
 <20210812165341.40784-11-shashi.mallela@linaro.org>
In-Reply-To: <20210812165341.40784-11-shashi.mallela@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Aug 2021 14:22:05 +0100
Message-ID: <CAFEAcA_bEnT=Jb-zy23O1G4Q+iUOZDfs=zs4tVh3TtuSfV-raQ@mail.gmail.com>
Subject: Re: [PATCH v8 10/10] tests/data/acpi/virt: Update IORT files for ITS
To: Shashi Mallela <shashi.mallela@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Radoslaw Biernacki <rad@semihalf.com>, QEMU Developers <qemu-devel@nongnu.org>,
 narmstrong@baylibre.com, Eric Auger <eric.auger@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, Igor Mammedov <imammedo@redhat.com>,
 Leif Lindholm <leif@nuviainc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qkeuptizjm6x

On Thu, 12 Aug 2021 at 17:53, Shashi Mallela <shashi.mallela@linaro.org> wrote:
>
> Updated expected IORT files applicable with latest GICv3
> ITS changes.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
