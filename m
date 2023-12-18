Received: by 2002:a17:906:d96:b0:a23:4dac:818 with SMTP id m22csp890306eji;
        Mon, 18 Dec 2023 07:58:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHjNIZ56m47CLIvHWA9IaaI6918H+fYeFfdkBX3vE6lGBHDQYUo5z6cEVhJIIea9FhFhReu
X-Received: by 2002:a05:620a:1a83:b0:77f:8c7c:bb94 with SMTP id bl3-20020a05620a1a8300b0077f8c7cbb94mr14476824qkb.97.1702915105773;
        Mon, 18 Dec 2023 07:58:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702915105; cv=none;
        d=google.com; s=arc-20160816;
        b=deRjE0lKvYWLGJx5FehX3xrMBhUTNFBfsTyTpTovjy3FI+PkEygxk/gkdRZlQZ+Oua
         kcpmhcH+Gvtt+siHYuPnjtVyXMnVPokhf3SXZEGX4wHqYIV4Ka5UQAoXq16kGc9gA7ut
         HAdWRuBV0qS8XdAD35h98/EaM+TKGwaLOSNJ9hwd67qpJJF2y+uA2SPX4TesIkhgSnp/
         nNzTJ2i0Mf8YtepAeWW0G9m0CGUOL+rqb5E9XYhUKqu5a/Uds04PewqsU7VrxAIjFn6u
         BqF2I8/h4G7evNYbemQT7uNJZkXQ6pRvcZnJFgW/qrBAOwi4i4n67MlTKSbIi0kCzUP1
         IFlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=zTY9Uu+2wGW1JAEMsPYHsWmdKMgmzbBSupPhVd0aZHg=;
        fh=gdBed72JnSifzQdV0PLkUCrNnp2PjbNCgzXbyzmTG1w=;
        b=H5ipnzCANtumOv+AFDLpYCEoWYasUqQWrbbNXRtXHms2acejv6ugOANFRHzo0U/ZV2
         GS9MrgDPFp6jo4DmH2YjuAOLOoC4SFH5YNJioRn1l/xKejPpYYBZ7T28/q/SSGqy7yVM
         Jrot4EX/o5k7zWTGeVMvaHOecu4zi3ipS0B58MwKV2GadOu5wnp8jX/8V310U8oyswo+
         wj+Yqt1XVUd4sUdmtHcaA64bk1VRCNRGwJTkTUV+LkaPwNGkbv9klswKK2Kfrp/Xv1e/
         Zk15SYLxx++5ErH8xT184MUKm5ORg98EVhwal94N3UwS5+O3VZtM5mqceaiBSz+lXn9A
         2RDA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aIqdVD1x;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h5-20020a05620a400500b0077fb9c69303si6964428qko.591.2023.12.18.07.58.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Dec 2023 07:58:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aIqdVD1x;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rFG0b-0004Zl-6Q; Mon, 18 Dec 2023 10:58:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rFG0a-0004Z7-Bt
 for qemu-arm@nongnu.org; Mon, 18 Dec 2023 10:58:20 -0500
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rFG0Y-0001c7-TI
 for qemu-arm@nongnu.org; Mon, 18 Dec 2023 10:58:20 -0500
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5537114380bso712505a12.3
 for <qemu-arm@nongnu.org>; Mon, 18 Dec 2023 07:58:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702915093; x=1703519893; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=zTY9Uu+2wGW1JAEMsPYHsWmdKMgmzbBSupPhVd0aZHg=;
 b=aIqdVD1xM9KbLlPHFfD/fMv8w+vLL03gZXzsYsLn0yTAn6Pf8+YFoAvWnhEmSY2Yjg
 Omo9jLsKf49W8z2ZnVmESufYftSa+dvTQGU5XqO89pwtmaPNJ1H6wUWi9RT6Me6livTZ
 tyyhtftT1dXjxA4cfBHtJCi2VlRTZZHnwVLBRh2rOKnobUaHtxsL6OJcQ2zCn4+2k4ni
 GqP/Lzv8YcPE3I5Wh25gVfY0JsaxXxHQjd9qSUDRkMmRHn+64iUfToKQJogb6Lvup9Vm
 +h0dN3YSdffrX2D5NlObijacUmq9mv4Q20X9CmUdtZYYju+X3EVPWQUrzLaY7zeUb0Kl
 IeEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702915093; x=1703519893;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zTY9Uu+2wGW1JAEMsPYHsWmdKMgmzbBSupPhVd0aZHg=;
 b=HaplFxu8tPsEMPZWvTf/hsNDbh2l3RRYjbSod/SxmrEZnPgc+CRDelsvTtrrqybIKR
 mWck7mQeTig8iikWB+jzciFLYYzW0goTXI6i/UXLf7DjMv2tIbllCvpqgbYv/KAMx4Po
 KF5PrxnP7gxEauiMGMR6wgeFdaiZ+ufFOvqwNpFKzmXzE/1PGLwWos3tci0HjlhUQx5W
 NkG86oibuhKNgGSre7wRFpGAvkrftRvhlXY4/tspI1tfsxaJW0U+3u03jRBh5/nhUMct
 eVBXBXqlN7HEEbOn7Lc/qZkG0tWo6E/oGQgsBdBtScYaL0C7LLrVxxHlpVWdsQs8KmJI
 tINQ==
X-Gm-Message-State: AOJu0Yz8b2Jb1d5ySFEIwtG4BmPoYKyjiqIdlaHqv3l3fyt3ndX3spJz
 88kfNVt52NXJqZWcad6rAJLkNALxjqnxsaToP7fWklyHJ6Uth5JL
X-Received: by 2002:aa7:de97:0:b0:54c:76bf:eaff with SMTP id
 j23-20020aa7de97000000b0054c76bfeaffmr9596703edv.58.1702915093183; Mon, 18
 Dec 2023 07:58:13 -0800 (PST)
MIME-Version: 1.0
References: <20231204002619.1367044-1-sergey.kambalin@auriga.com>
 <20231204002619.1367044-2-sergey.kambalin@auriga.com>
 <CAFEAcA-7O8ZDv0NY25nsXzLuBZVTiKm32ZoyKQ3PEpHURWQpwA@mail.gmail.com>
In-Reply-To: <CAFEAcA-7O8ZDv0NY25nsXzLuBZVTiKm32ZoyKQ3PEpHURWQpwA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 18 Dec 2023 15:58:02 +0000
Message-ID: <CAFEAcA-+qne5XpUBbA6UEwL5j0gmXbi-HsuGruWix66HqVw4rQ@mail.gmail.com>
Subject: Re: [PATCH v3 01/45] Split out common part of BCM283X classes
To: Sergey Kambalin <serg.oker@gmail.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Sergey Kambalin <sergey.kambalin@auriga.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: K0UWXlSQ2HlD

On Mon, 18 Dec 2023 at 15:57, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Mon, 4 Dec 2023 at 00:28, Sergey Kambalin <serg.oker@gmail.com> wrote:
> >
> > Pre setup for BCM2838 introduction
> >
> > Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>
> > ---
>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Whoops, I meant to send this as a reply to the v4 patch.

-- PMM
