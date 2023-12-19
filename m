Received: by 2002:a17:906:d96:b0:a23:4dac:818 with SMTP id m22csp1592743eji;
        Tue, 19 Dec 2023 08:08:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHJwcKr0PFI4PSEa40Q+p0wR412K7AFq6VhO1ITnUnlEL1cQGS3l3TmcKeK5ooblwfvQTuv
X-Received: by 2002:a05:6808:384f:b0:3ba:20b:eaab with SMTP id ej15-20020a056808384f00b003ba020beaabmr22757122oib.51.1703002129174;
        Tue, 19 Dec 2023 08:08:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1703002129; cv=none;
        d=google.com; s=arc-20160816;
        b=ws+dbXeaWKZh/zLNMqhseIboGRWxbMztNuPiMaG+ZEZYCVuuG9iyT1j0RXsaryqk0G
         eV/UMmHyiKQfAYm6azZDmKV10AWmLCu036BpXMIVz3W6KQNz+Ky7aAolAcuxm0v9ahcn
         69/Oz5p0P5vTK/Pi0LLThEsnuQVcBmZozsnCXzQTy/SFfRcPfYTs0UbJJ8bS4hfRd0QV
         IBhQOpgtlrx7nb+A9Wm/33esT1eoJboBKMl4Xu2r59CoIYIA9LREzh7RTqTx1Kd7g7R5
         0IYDI6opeJ9B2kvpo2yTwaybrAWbWqpjApdoTnEK+9wnXPJtNhdIBDphhTfAS/VBac0O
         gj/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=4N2fo9k+Y0Kfq2cFNWNz3ppIkZmhmegkgvOQe8zaU88=;
        fh=H19HlRgGKAhn6lqWKp5xylUXdiNkDPy0h4o3FOzP1nc=;
        b=J/qhZAyC+gFV7Urxyx4zizMPLcINQmrsKbCa6hZkeEgRCBpAeP/tFTkteYzzKAz0GD
         TjpcRotoh29B2hP0YPZCUTI7Q98jnbrZM8JraIjKi40S0r51eHtXXVCZOAz2FCdUCMii
         JlNeKSor7ZFSt+jua8G3AeeSdZFDdYiUxzU6WxuTyzBCqM7WBG9uTMZiRDRmwokHJeWL
         QCL0FJzZIHDtCJBgOPXjZFXt9ibCXiX48ASEYt6Lv0P2PPJ8nRla4VugWGaV/TD55qCw
         RngDcu4wCCujLrcJVufr8JltUcXjYU7W/kCby4GQvg5yhsfgF6vzySbw1t4Zm/oEn4Zm
         GSXA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aTWCQhMq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g21-20020a056102245500b004669387565dsi719322vss.382.2023.12.19.08.08.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Dec 2023 08:08:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aTWCQhMq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rFce0-0003if-SF; Tue, 19 Dec 2023 11:08:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rFcdz-0003iH-DA
 for qemu-arm@nongnu.org; Tue, 19 Dec 2023 11:08:31 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rFcdw-0002oY-JE
 for qemu-arm@nongnu.org; Tue, 19 Dec 2023 11:08:31 -0500
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-54cd2281ccbso5667132a12.2
 for <qemu-arm@nongnu.org>; Tue, 19 Dec 2023 08:08:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1703002106; x=1703606906; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=4N2fo9k+Y0Kfq2cFNWNz3ppIkZmhmegkgvOQe8zaU88=;
 b=aTWCQhMqK7qRDeb4tU8mSi3HMBlPAJ8RJU+THSNeMGtpYpebVfJi1Kx7b5OLxRkmXd
 org6Bm3WgmScR+C6jaoPpbAyTWi9xtVgKjDRcFN1s3S6zlIJK7wtqy6+6gOZZNTIiOh4
 srqRPR97Sxg9TjpRlG8+UpE1H05tnRKavOHHhl3Wkqrl3dqJ6NKvOiWj30N4AMHZCwk0
 Svdo/nTSxqt4JZ8EQPPiDoQQQWfJtiUkwR87E266WNkErOFfsTx8gstYyZfgJyNifknu
 1OgTyoXnuP0nziPGmIuMkJfs/GK0rmryVTz+1aYjbRshO/EhcvjGShOBgyMx0RfgakTW
 s1sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703002106; x=1703606906;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4N2fo9k+Y0Kfq2cFNWNz3ppIkZmhmegkgvOQe8zaU88=;
 b=bGiZd+DIji7djTxffXZxaiEz1ORctA8Cv8oMdoxpkzTEgTwKzF5dAisPP2S8bIgvqQ
 spHW6HLmZxZibp8hC49B2Qc1fEFBoxbzjrp1qtaoq301LOR7DGK+nOy/ph3BC1nHYchE
 yOnW9aw3JoJUxZj0xplRSgraVvd6wT8eQH0FPqjb2VTGAGVNlJCMWLrkRndiUjFTwgLq
 gzJZvNcJs/Ken2MYI5v/JHKFZetBUiBDZgKfltBJMk2kgCcVi9LAfxWkZZQ8WWMCJwpW
 GXREeYUvSAVHweSu2S6UVz1jDjfCWk9yONc0fHCudv/CwV12tqFZYQXUMPExv5WxPQEJ
 Y2Uw==
X-Gm-Message-State: AOJu0YyaJ9Gj5lPf2xNCly0jVE1HsyxLK2pMc0U7Np+0nPbtxlArPvDv
 J58daBKO/toUXd72hjcHzAwFqG/vp6yZ9Yw7qGFsVQ==
X-Received: by 2002:a50:ccd1:0:b0:551:656:d48b with SMTP id
 b17-20020a50ccd1000000b005510656d48bmr1406490edj.71.1703002105965; Tue, 19
 Dec 2023 08:08:25 -0800 (PST)
MIME-Version: 1.0
References: <20231219105510.4907-1-n.ostrenkov@gmail.com>
In-Reply-To: <20231219105510.4907-1-n.ostrenkov@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 Dec 2023 16:08:15 +0000
Message-ID: <CAFEAcA-Gp-8ooEhHazJg5Q-xyQ5xB2ox2+fU_tNBYV0HTkwg6A@mail.gmail.com>
Subject: Re: [PATCH] hw/arm: add cache controller for Freescale i.MX6
To: Nikita Ostrenkov <n.ostrenkov@gmail.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
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
X-TUID: 4Sb49Dd64b1t

On Tue, 19 Dec 2023 at 10:55, Nikita Ostrenkov <n.ostrenkov@gmail.com> wrote:
>
> Signed-off-by: Nikita Ostrenkov <n.ostrenkov@gmail.com>
> ---
>  hw/arm/Kconfig    | 1 +
>  hw/arm/fsl-imx6.c | 3 +++
>  2 files changed, 4 insertions(+)

Thanks for this patch; it looks fairly obviously right,
but I wanted to let you know I won't be able to do proper patch
review and take it into the arm queue until I get back from holidays
in January.

-- PMM
