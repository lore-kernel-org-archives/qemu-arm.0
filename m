Received: by 2002:a17:906:b088:0:0:0:0 with SMTP id x8csp1986326ejy;
        Tue, 20 Sep 2022 12:11:37 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7uHZRXvZgGoE8ndJerMiD/R528uq5F+KHBeZdAIT7ROsSf7zu6Ptzt4lnyGi0r7DQ9Az6j
X-Received: by 2002:ac8:7d51:0:b0:35c:e38e:3bb with SMTP id h17-20020ac87d51000000b0035ce38e03bbmr11360755qtb.279.1663701097286;
        Tue, 20 Sep 2022 12:11:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1663701097; cv=none;
        d=google.com; s=arc-20160816;
        b=U5nzaaJ2nNlk8CvHccYy+x47uT1fc9CCpE7UxmtRknTtAHHi8J+2iQ2+c5KhaM7zZ9
         Y38Z8I1t1E7Sbfi5Yvp2hE5DHvKIH0jZ82aBWhwduUWH+85uVSChO8dyTTuSDEZ/TYez
         Rz1WYEM0nLKescwuuUALI5qdpzVMG+NLPJjBFOOIFF2ZiyTLfBZ657XFGc8g8/CqhcBi
         TbBxZDIF092zGlnvyrbPIIAkbVJlucgE3njLzvsHNoLjFGXOcSFLkd+esM3HMKzP6G7M
         DTNQ7CmZ7ibfCAs74FtvA7ERZm4s/mVYqY/kfdFKDl53mPEjaVPX9S8wUTKuCIJGIzkk
         gMww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=MJBsb8QhoaE9TusmHiHCUH+D0wwbWqK/jI/pi/xZ7ks=;
        b=XecCwS4m/ongx92iK6IwCHjZkTEMi3ugoQMzgXkX0G78VfvTBTyMcZijXDW1AzMcpw
         ni2gs1/01UUcYe9du1liE+jvOLiI+iKhdHW8Z3aO2+XUxANSx5PMFwOMKjvMbtenVtYA
         1Hj507fH87i0Yi8TZ36pPIDGE6M0Q8MGKtQykEMPqIuz5SkYid90XESPZD+QmGh4dGtq
         e4ALPZP5nX7nrVsfdZAjWCw9l99nvtsIlB4KMiE3X6xEoC5j7NWbkG05d0Z6Z//qX4t2
         hZ00F5NI/bOrTT2FQLTKe6UFTIIejOvYOAwspli5uVWc4LDxDkXiz0/NbdsgvWV+AUku
         uhEw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=t3aOM5Wx;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x1-20020a05620a448100b006bb0a475ecbsi393977qkp.733.2022.09.20.12.11.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Sep 2022 12:11:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=t3aOM5Wx;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oaiee-0004cK-JM
	for alex.bennee@linaro.org; Tue, 20 Sep 2022 15:11:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oaf6h-0000I3-HY
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 11:24:20 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:33438)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oaf6e-0007Zn-30
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 11:24:19 -0400
Received: by mail-ed1-x535.google.com with SMTP id b35so4455781edf.0
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 08:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=MJBsb8QhoaE9TusmHiHCUH+D0wwbWqK/jI/pi/xZ7ks=;
 b=t3aOM5WxXo0AmQ/7aus1AM+SBtMrZmkg4CMnupN61RWdYmQOJhaE5skEBWbNWOePBW
 9ijeLnMQcaTjHHv/el8iXc4N70J3qB/1fratYlra0xO1KasK6I75wxBYelnwsuPylJKa
 pU09AwDxFuZBUlt89CH7t65KEUZCF0lO3y8ct20WQtLDHzqmVx+xTUky10LXyzZ5Dtd5
 f/CinTbvH419KcsaESS2Cgg6z/q6dceEpGKLjbzdJN5wYa2x1jFLtfoAnaZriOQw+c4c
 THbSHPhD5IzIQofp3gulhBzNyqe517NHdDbB9yi1/+Y/bfiNE1tWCk2nFOUFECMiXZs+
 ZvOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=MJBsb8QhoaE9TusmHiHCUH+D0wwbWqK/jI/pi/xZ7ks=;
 b=4e5mp4tAf8x209/8Sj9TkMXuRL96i6bfstVYglzftY5DRKVgMnAJXCiOBpVOPogngZ
 OrKlRdNpb/x/Q5QBll0uwbk/sB6ZG07NzFBuOJ47PrPN4I2VVJ+vULm+BSE4T//9MV1u
 vQiZJDjIlPJOWHSil60uXB0+8jaeja/moQnKEMZ7VVDhmvDrvl8T76ikCKJr2hlsijFG
 H/Ft37CzmhoPbXSD9ZO3PZI5+ar2zEY5GUEVinvMInYj3t2xuFpFqYUJvRo6eyH6w2Li
 x1StPL0kLZWjc2b2uJNwnMrQjOGaHWc2onOW0e2eQ4dq0fGaiNbs65vtR9YF3jVE3piu
 bx3g==
X-Gm-Message-State: ACrzQf1AbHQyDKLGjGzgUgbqU+Sx5ecoaAK3nD3YfdrUBrYCNHiA2xRn
 aV6mE4EkajPfMJ9m7f0/Xnxu+YOPE7d8d1xLA0tZPQ==
X-Received: by 2002:aa7:c610:0:b0:44e:9a0f:753a with SMTP id
 h16-20020aa7c610000000b0044e9a0f753amr20285289edq.140.1663687454374; Tue, 20
 Sep 2022 08:24:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220822152741.1617527-1-richard.henderson@linaro.org>
 <20220822152741.1617527-24-richard.henderson@linaro.org>
In-Reply-To: <20220822152741.1617527-24-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Sep 2022 16:24:02 +0100
Message-ID: <CAFEAcA-Os6BPfnHsDo3VpN73jAskQbPDy6KaSg=kBBU=Fy8UkQ@mail.gmail.com>
Subject: Re: [PATCH v2 23/66] target/arm: Add TBFLAG_M32.SECURE
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LffFhlqPeEni

On Mon, 22 Aug 2022 at 17:10, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Remove the use of regime_is_secure from arm_tr_init_disas_context.
> Instead, provide the value of v8m_secure directly from tb_flags.
> Rather than use regime_is_secure, use the env->v7m.secure directly,
> as per arm_mmu_idx_el.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
