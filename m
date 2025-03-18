Received: by 2002:a17:504:5906:b0:1be9:327d:8ee3 with SMTP id nn6csp2899603njb;
        Tue, 18 Mar 2025 05:48:51 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVJ91zq9EBK405sgFMfkHTx59zgsoBHgQECH3dbjIg/5hcFTe8bDym0GicNpJ+JYVh4PUlAuiRcuj8Nkg==@linaro.org
X-Google-Smtp-Source: AGHT+IHUB8IcX6BlXkeGgBbSZatkrJPe3ThcOxRF5Ul4wU5dJ6wSMzTmOomrXqD9VXfdVeE007kb
X-Received: by 2002:a05:620a:404b:b0:7c5:4a8e:b6b with SMTP id af79cd13be357-7c57c8f8f66mr2375456885a.46.1742302131679;
        Tue, 18 Mar 2025 05:48:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742302131; cv=none;
        d=google.com; s=arc-20240605;
        b=P5HlA/OO5A9Xzjvl/L+bbvEK751CjUTMG56ke5UlwAOpBu7nFJ36ELUEZQ2rxp0SLE
         ycAGulTb9ll3xgmK9HtKrOV/hSZfNSha2JUwnplioS0s2uFq5yC/fZqI6cAjvMtsijgl
         VJW7G/+7Ti2ETbD3dVDs5UrVtDliv8Qx4mbLLmGWgm8JuFU1hv1nk97bA82ZWWh9Z2HV
         f5aTolpEvluYPMP4jMBShlczEx7aUtjyxOCjFmQc1WP1Vx1Lu2rv2efdLIGzInNGZjxC
         dF6Sd83VNvc9oAmM7j6LXVlWJ+hDfKrPksxnyvj2Hb4ag4iHCIUmISQ0zf9NBBuqnreZ
         FY2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=8slg3rOHyYBzQ/7Yb912beQ4u4EfQcKUFPIw0EirfLs=;
        fh=vfAv1DW3IgwDaI11yzyl5M9EPu1lsCJcUHM+1FN9noo=;
        b=g2xzFkyx0HZgl3uQBVhQABrm+n5yh60giWJiUBGpDV+ZfJwF2tHIVKZuu05XyLlgb+
         7gwDR1nOurBfFHS4dS/cYBjZwLA3w4a9Vw7GcZ/ddZXyZuFx7bySvax4T4Gr4YSWKg2y
         afGOrM/V/cUDg6jSvgWOc2Iamwtv1pB1aXWNZWNRE2O/Tbsqghln2nqqLlabbku0w18K
         /RdyyGarOneil1fy9pVWJk6x6D6Sr4PI0QUbUw9muuhEnaSO0x75Anshvml5C1krxB5b
         swMKe/QWFD5HQaNqQdDTO9+ouJq1k+C1+ejo59NXTBPh9ZFYdnfCv3z1JdWtsIMOa24a
         FWsg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zlrMrKsm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c573d1897csi1182660385a.477.2025.03.18.05.48.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Mar 2025 05:48:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zlrMrKsm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tuWMg-0005WL-SF; Tue, 18 Mar 2025 08:48:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tuWMX-0005HP-NP
 for qemu-arm@nongnu.org; Tue, 18 Mar 2025 08:48:06 -0400
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tuWMV-0003jI-JD
 for qemu-arm@nongnu.org; Tue, 18 Mar 2025 08:48:05 -0400
Received: by mail-yb1-xb33.google.com with SMTP id
 3f1490d57ef6-e53ef7462b6so5403329276.3
 for <qemu-arm@nongnu.org>; Tue, 18 Mar 2025 05:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1742302081; x=1742906881; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8slg3rOHyYBzQ/7Yb912beQ4u4EfQcKUFPIw0EirfLs=;
 b=zlrMrKsmoQnySdkHLVyFswf/VFTBFoT6Jx7saQjFNUP2l2Yves/BOXhepQbJ1+g1ur
 21XXRaPSyD90MUWs4aDTiSMF9XvN14E69sSV7GrsycXb1eAyaJuHwecqvZdTRaX/d0J/
 b/42LfN7Jp7Qqa9RYHgxwSXY1CfQbSciG+neqp3Yp9F1yju3dgbRVHzgbKPa8ilE2wS9
 NpMlgPw/GoacxeIp6vn08NOR4A+aipoCqTWekrCstDRy+DdOY7Y7DXMx1zdBcOCLanZq
 i2TqAUEXdu5mp+delLLMps+iksQVt3QUlEV/MkyEsAKkvhavPZg+sJjgtud59qvgaMzr
 zjzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742302081; x=1742906881;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8slg3rOHyYBzQ/7Yb912beQ4u4EfQcKUFPIw0EirfLs=;
 b=mVuqqMCytiLdQaCcxHsvOic09t3brAyt5VkR71Ug4mSK9DT5fBBJUl3Yhv5S40S0DV
 Noprr1CIMD/J3Mm/GQH+0Rz5/tscYBZGiJYTOft5NsuBQmws7a/2h7xu4ouHOjI241oU
 IKUt8kHHuK5pd1cQ5/2zt+w5kdLySnmCEtE1d7xEMrLnIGWqg5SiuojfxUk6whhegPeI
 ufSjRxX/GQZh17iswYJKQh8ItwmSrmGw4V5GSMMCqIkOPa7bxiu+S3Lot1nBc6HhAMoP
 4EKIlPpVgsCKoqNAg6BqBkUq5kpqMqRPURj6rw/1xrdIf3+1csrwN0jZ09KFKFi4kP47
 9U7g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXtCBj5q4yZem4rFxCw795FZrvH+dmlTxefq2jGRaYLCl6vQTuz34Nr5RcFpssDkkFGBlQSr1HEsA==@nongnu.org
X-Gm-Message-State: AOJu0YyjwptU01nE2XuagfiqEeYT0GS3T5qH/hbqVI0jatUI5XlbHoph
 Q5XiWONuHfB7U0IzFZKDyqEKU7eu5TtgwiuHripFOemYcbzwClrY5a42xflbB/KvZ3WqeLrNt8H
 7P0GPEthIISlmKvQzJ4+jga1bWXQS1NOqwbBYCg==
X-Gm-Gg: ASbGncu4FYeVw9ktPgxjFyQuEP7Rt/OayVw0ub3Wy5dUzQlt6JCRaCyREG4KH+ALel+
 jyqUkg0ebiyQiUT5sKpxu7x37DRV5rqkmXKSeQQUtiICNGABNd0lbEsbaHiLFmLvITAcVWAF1y1
 dtgF6iV2uKGi8S2w9LBYiP06rRMBc=
X-Received: by 2002:a05:6902:2d41:b0:e64:60c:54ce with SMTP id
 3f1490d57ef6-e64060c55fcmr11870366276.2.1742302081114; Tue, 18 Mar 2025
 05:48:01 -0700 (PDT)
MIME-Version: 1.0
References: <20250317-raw-v1-0-09e2dfff0e90@daynix.com>
 <CAFEAcA9Cy_870gxNmPFykzTjXOfi0raotmA1NRpZEQKfFfB=0g@mail.gmail.com>
In-Reply-To: <CAFEAcA9Cy_870gxNmPFykzTjXOfi0raotmA1NRpZEQKfFfB=0g@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 18 Mar 2025 12:47:49 +0000
X-Gm-Features: AQ5f1JotXtyRSF-yg8G2NNirSk_YOR4QVWN85v7N2eTx2d23zF47r3yjGjF1iRw
Message-ID: <CAFEAcA_DzikGAsKC=zMc7OVcinTj3PnO+3WACGOQxwpTHKzSCg@mail.gmail.com>
Subject: Re: [PATCH 0/4] target/arm: Flag PMCNTENCLR with ARM_CP_NO_RAW
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, devel@daynix.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b33;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb33.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: H051RC10vRhE

On Mon, 17 Mar 2025 at 11:53, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Mon, 17 Mar 2025 at 11:16, Akihiko Odaki <akihiko.odaki@daynix.com> wrote:
> >
> > Supersedes: <20250314-clr-v2-1-7c7220c177c9@daynix.com>
> > ("[PATCH v2] target/arm: Define raw write for PMU CLR registers")
> >
> > A normal write to PMCNTENCLR clears written bits so it is not
> > appropriate for writing a raw value. This kind of situation is usually
> > handled by setting a raw write function, but flag the register with
> > ARM_CP_NO_RAW instead to workaround a problem with KVM.
>
> I'm not sure there's a "problem with KVM" here -- it implements the
> write to PMCNTENCLR to have the semantics the architecture specifies.

I checked with the KVM developers on this one, and you are correct
that this is a KVM issue, so I was wrong here; sorry about that.
There is a fix queued:

https://web.git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm.git/commit/?h=next&id=f2aeb7bbd5745fbcf7f0769e29a184e24924b9a9

which will restore the "just writes the value" semantics. This
is apparently the intended semantics for KVM_SET_ONE_REG for
all cases: the write is supposed to do "sets register to the
specified value", not "behaves as if the guest vCPU had done
the register write insn, with attendant side effects".

thanks
-- PMM
