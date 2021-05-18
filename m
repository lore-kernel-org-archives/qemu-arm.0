Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp384122lfm;
        Tue, 18 May 2021 05:53:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJynHIC/YMQsqwOSy+0hg01pWTUkewDj742wowGWGrvnDbjxrqQzeKUOWCQm86cCfsBpi1G7
X-Received: by 2002:a05:6638:a2c:: with SMTP id 12mr5266849jao.99.1621342427300;
        Tue, 18 May 2021 05:53:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621342427; cv=none;
        d=google.com; s=arc-20160816;
        b=d/0GeFhUo/b9GCGYRcRL/AYscrxXkcivORJJ4sY8g1DohuqbXDlC/b/gRUrbyqfsc4
         qoRo8iggzen6INrFe/oq+uW5339rLN6cp0OEiYmt5n9CB2Y0U3c4SxfJbyDWF4q9KneC
         nyOQl+0Jk5XXs7FovUxWGGWw5Gaud15T7Ke32YCqroZdiR161RP0kag4OFpTw6luj8Io
         FepJ0eCHmkB0w/bT9M0jz8QLUVzoz4ICUUJ+xFthN2TgO3O2o9Z7yorqr9yR05cdwJt5
         Od/QfnlLpVtBEN/ml842DsT95BupSWzgw0lJ9zU9njpz4CS2bebFyO9+q1yEM/d3OwNX
         4h+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MstKIDzUGYb1CKYtX3TdsGP5sNf5d3btFYZeYsGSpYg=;
        b=QOn9WcemvegDCgB+DJLAMv/uiUlc6yTv1xg7at8az60cI3PjXLYy0BYvWfEGCy4F6f
         /QfNTN3mSCU1Hh2F1ZxeRJyuah4B+XEkySoTTjIjPBw1Tuf2CNwzfSfpyxPTe4waO+Hi
         XmLcsF6Sx50d60iVxbQIxVgVMe95Wq7JapBvM2KAhUjSnWb/kd7n3m7qc548UgpD1huP
         yRizyQbfQyxYXgO0fT2u1PImsxtM4G4ZHjAkD6vcHNHVvhgRHPrF9VBnn2Pnav/GoqD4
         j0RNVd2Fb+83iVmfVSXTqFHQjucdpKMSdnixI6n3S6Mbqqg/lgsEaFFE3l0u7LZJUvBA
         50YA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=WVl19Fzy;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p18si12344384jam.69.2021.05.18.05.53.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 May 2021 05:53:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=WVl19Fzy;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lizEI-0006dq-2U
	for alex.bennee@linaro.org; Tue, 18 May 2021 08:53:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1liz43-0004MJ-Uv
 for qemu-devel@nongnu.org; Tue, 18 May 2021 08:43:11 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:46889)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1liz42-0005Rl-78
 for qemu-devel@nongnu.org; Tue, 18 May 2021 08:43:11 -0400
Received: by mail-ej1-x62b.google.com with SMTP id u21so14250318ejo.13
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 05:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MstKIDzUGYb1CKYtX3TdsGP5sNf5d3btFYZeYsGSpYg=;
 b=WVl19FzyTcPzJAdr1ebyLdmAchcbH2Aczdyu7L0E9VI7ObSO5eK5O0EoiiTEoxkfw+
 GYX3wOAk4s9BoTtcJrfdjtX093+RcnipmrnbS/uphia582j3IDZnSX5nAYDzFHqJ6ogb
 69oahZVO7OWmiMqdOGuIIX59rdynqM0dHmXBEIzJ2m0kyDvE/lgw8aWi5NMBCGxctoXL
 16IDmm+3i/L8winGci0ly874fTSBN2DaOd7s+glEMYSGMELPBSiWpPOO+7lL+sNAEyol
 nAH6vroy62I6Ln2EMcNUGEGsXDM+2QVU0DrEk/pPOHkMaaSW6y61NbQHMFstUHC+xIi6
 QdQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MstKIDzUGYb1CKYtX3TdsGP5sNf5d3btFYZeYsGSpYg=;
 b=elSgB4S8k323zkUpulRET2PBjGOFnKhNPgCfym3INVVc1wQqMi+8pB4xA4Xc7RjKbK
 RJ7sQaNFKFrXae1SDbwA+XPY+dCCsganoZjms7vmgRiRjtw1SpORPAtMXZ5xtz5v/lUI
 63s31TGJbJALxVwvaqJ6dj0zv6dCPkotRsE+2BfEyV0rwVyXdR1FMGLpwD1rnEL2YFEk
 /ZdHoRQRXy+F5RQ5hnn7p5vt+ppVPbCw2hMuQCs9KNDpOJU1oBQ4zacz3mW+IoKnVls/
 RZfqAO2K7ptlG98WLOt3toFr/0xY0vFleMjb1yx378u8ECjh7Jzy1Kyp9C74+rRMDEUe
 mfFQ==
X-Gm-Message-State: AOAM530kYMmeZPVdTO7N40O8jSb+aHQMH5oOng/GzkxDlOeW4fYB3bv7
 AaS+cEZOotorNleV6KAXoYunZKOl7Hi/OyqVCu3hCA==
X-Received: by 2002:a17:906:d8cb:: with SMTP id
 re11mr5856511ejb.482.1621341785408; 
 Tue, 18 May 2021 05:43:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210416235928.1631788-1-richard.henderson@linaro.org>
 <20210416235928.1631788-10-richard.henderson@linaro.org>
In-Reply-To: <20210416235928.1631788-10-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 18 May 2021 13:42:49 +0100
Message-ID: <CAFEAcA_Qb3hxMQD1YpEbmm-4RV=vqPrBaM6b-nD8FzOKEnW07w@mail.gmail.com>
Subject: Re: [PATCH v1 09/11] target/arm: Implement bfloat widening fma
 (vector)
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xwZly2Rtxo+v

On Sat, 17 Apr 2021 at 01:08, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This is BFMLAL{B,T} for both AArch64 AdvSIMD and SVE,
> and VFMA{B,T}.BF16 for AArch32 NEON.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
