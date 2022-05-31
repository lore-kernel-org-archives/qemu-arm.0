Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp3430873lfh;
        Tue, 31 May 2022 05:52:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyghJWwaAVZkMEuGPnvFiKF0reUzENDefAVMmMCU+0IpJX71K9sJizml/BG9hJtr05NaAOG
X-Received: by 2002:a05:620a:468c:b0:6a3:75b1:c2b2 with SMTP id bq12-20020a05620a468c00b006a375b1c2b2mr30659600qkb.670.1654001541378;
        Tue, 31 May 2022 05:52:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654001541; cv=none;
        d=google.com; s=arc-20160816;
        b=TKmkIMgSyClwYprs39XR8BCZCK1tK7UjR/qcHL7uXbpOk6SBlDpH0VaPKDUFm/Kg7t
         4sBzCTyqDERCE3mWRv9ajv+NxHZ/puqeNfb21sh91eb5V0Q6+cvDSoJcdwmVo2jaqz17
         SfZonDkBgo/UybWwkBqVrVLHVkW6noJY9z4hJleMwnPRtyklYQXixh6xsJTGRMWzjlgg
         hTZ7fRope41BtzHgiEXHE+6FKHXPZ8CN2bBzW0R5UehUz2ZL7hFI5v+VQZOIWF0hR5NL
         46EEa9oCIAGVeBROVRf/9Pf23LoDG/XbMjEsCP1w2KsvCK8egWD9ag82KPA68xXnaIJG
         1mYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=sICHP9RISZlGjFt+FlTq5tv7jelcqSn20ycKBiXSykI=;
        b=Ehxz5JgySzXDMomDBStLwbZhdjOE2sP4JuiFqlZwA3tQTNXQr+Ht5KSLm1dPFPeSBg
         ZoVcFDo20d+BGlH1eUUZQfQWrCiCadZibShlMTz9ucwCOFQahXiSqTPD7y3LgXZr/j9H
         az+Lfrfit6TquMogQRXZFiJkMuyucEjWqE+42scsKE2ocJBrBGVqtVhKmm8DEsIQLUdZ
         mfiaur4oNayNiLB3URqeNnIXrPpz1yjXz7z06QKxyVxXPYytCkzbEFdotvIWvkH0UCY1
         t9YwaYhQhN2HybJSkxgJnohExkr/LXVbSdlv8G/D8upsmhOxix5bM2ysovdYjrdEQYfB
         hKfw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HuCuLMbE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j7-20020a05622a038700b002f944144f7bsi9338537qtx.283.2022.05.31.05.52.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 31 May 2022 05:52:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HuCuLMbE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nw1MC-0005Yv-Ta
	for alex.bennee@linaro.org; Tue, 31 May 2022 08:52:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nw0yD-0008Ir-Ms
 for qemu-arm@nongnu.org; Tue, 31 May 2022 08:27:34 -0400
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d]:34395)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nw0y5-000676-9H
 for qemu-arm@nongnu.org; Tue, 31 May 2022 08:27:33 -0400
Received: by mail-yb1-xb2d.google.com with SMTP id p13so12035787ybm.1
 for <qemu-arm@nongnu.org>; Tue, 31 May 2022 05:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sICHP9RISZlGjFt+FlTq5tv7jelcqSn20ycKBiXSykI=;
 b=HuCuLMbEJemzGHzLQCTKb/J3/KtHSAmhRSn4e3Mp8eK9Q2bVsy4/8Cr/iqlXkAQq/J
 FlRxIfe00/KUyUnhnr+cE28fL9psyMwyYK/yJ0U/m0nwvLZWjPkIiEhkq5v9wnIcRPuh
 AS6zbrVbAkQPT917lE80UYmNwMnnGepffx9BU8uC7kx2XlRgsOuravP1N5FSwyw9668f
 OFzBUDaZit4inQ02GNlOjvyZfeFNlbCFHWmx70qL4WdAT/1C7hgwX08D+iGSbM+Zu08s
 XQK6ZzCl34Ca8NgNDX3qlGYWJdfMTheTw44p6EeZU7vBiNtjcxSpoHdYDH7ePXUsEsXd
 1zUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sICHP9RISZlGjFt+FlTq5tv7jelcqSn20ycKBiXSykI=;
 b=Wddo4sAcH/jIOESHGa6ZCMLoRXjJtINzytc8csMJ9FmVkcZhdMYVxy5rVVfVDZXv50
 QAxEuYezLp+BEv3XgQbY0we4k+sFz1LP0eozhMRxsNNKPvtKg+cRJqqTn3YZJ7QmefqN
 Kr5e9VJFOomL4JX45e+aAXUTG52A+4n8Ibwc1PvbR0+MH1Dj03+yEBS+3ibATFww0rrO
 i4sf2R1/kTFzzCx5/K9inymFVJLOnqt0OiZfV/L4acuwTM96bPaJKHIxy/Ak5H0Gf5Lb
 fkOlZTYIK8ADvvqQaq/UA7F1k9ePir7hoqk1op44mqYa0re1C1nLQRkkruxoM1vsQsUW
 q8vg==
X-Gm-Message-State: AOAM532Y6gW3ylF0vrOvueCxLjytWPjVe4eEVpaL/p8j5sehMtUhVgio
 9EiswCtumaRLPPCBbIDo5nPh4xFakVr2RKrck1ESpg==
X-Received: by 2002:a25:47d4:0:b0:65d:510e:c8de with SMTP id
 u203-20020a2547d4000000b0065d510ec8demr1807753yba.39.1654000044384; Tue, 31
 May 2022 05:27:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220527180623.185261-1-richard.henderson@linaro.org>
 <20220527180623.185261-12-richard.henderson@linaro.org>
In-Reply-To: <20220527180623.185261-12-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 31 May 2022 13:27:13 +0100
Message-ID: <CAFEAcA-EAopCDKCgR5Ry_WA4z_E5XWh1xR0nxnYZPUt-b0rSng@mail.gmail.com>
Subject: Re: [PATCH v3 11/15] target/arm: Export sve contiguous ldst support
 functions
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7odjg7zY+kwT

On Fri, 27 May 2022 at 19:12, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Export all of the support functions for performing bulk
> fault analysis on a set of elements at contiguous addresses
> controlled by a predicate.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
