Received: by 2002:a17:505:11ab:b0:1be9:327d:8ee3 with SMTP id so11csp1050316njb;
        Sat, 1 Feb 2025 05:51:54 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWFejd/eXlh7NaxJwtF/ZRDCaJ+U6Q4CwcH8ACVN1pNxZ0MNPbG+nbA6AHnVLVWIH6G5ETrdEKD42s9JQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGMDYFwsQgL9lQ0THO3pG5+JLX9nIwdsPYj+Jr70C0+wDR4QRnTrfyYWaHsqhQxZsRKra5o
X-Received: by 2002:a05:620a:2729:b0:7b6:dc4f:887c with SMTP id af79cd13be357-7bffcda947emr2414640885a.57.1738417914161;
        Sat, 01 Feb 2025 05:51:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738417914; cv=none;
        d=google.com; s=arc-20240605;
        b=V9X5+1sjurmR+fid+AdY3jyfaF1I5UPN64f4O7PHh5fvOiKy0+8Cb9kdfXGWfHh3AG
         1X5XE7R/J7AxNHDcjvXZCxiavMZV88qSSpBBVIJLcyf+H7wpeB5nF0iI6J2D7ByOFjCe
         krXzuP7d8DQlJLDB8VSWINPd3F2jRNXlQhg2M6LAn6KfOinKDFcK1pQ3+qvPDFCMJazG
         K4uCmAB7CtWLM4rO1Xf1fLlD/ncxKkmy9AALmZvzqbBWoMDBe9wSnwonPh0fJ5dG88Oh
         Dr25servSAH9rBal2p+V4aIQul+qI74B9Z0j/tHOFQZBbEYtRBBzKd367QewLvrjhLZ7
         tyjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=4i+PvaK5XV2ufIOu1FAplCz/JMuNjmtNoAHIltZ7WPw=;
        fh=X8dLUBabPPmtooOMhALYn4YCORnsoT90Gn//O31H6VA=;
        b=k2hbr7r4Qi1Bo4cE659M+VGNtrnXxT6gI2gQblPG9vvaZmQrJItIFgpzYrpRiexsd6
         0N3wEHUk5ih7UE8OaGZh+ZsA+GluoGmyF8dfsu6brzUL1t8jjyiVzQs8Hn5SLV56RKPW
         IYk7U5ICaM7T6W2F8//S1rFy/P/bHm5Yn2EDzT5sUVPK9KGeKXsVuEWOGmnJcT3ZuTuO
         SLegGbd3wlrH1vWxny2oOR1a0mGUoeSCosDSGmsrs7+p65ON8Cd/ujjB5s1v8eCTqmRq
         Xcr8PSoG1RBgDsyEcXjUxF7UEhjyH0b04Rl1YTQcPvzpjAdXQT27F2dOYwi6UonJ8gS4
         5kSw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GrcTA0nW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c00a923254si618304685a.527.2025.02.01.05.51.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 01 Feb 2025 05:51:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GrcTA0nW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1teDuM-0001NQ-8d; Sat, 01 Feb 2025 08:51:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1teDuK-0001MD-5V
 for qemu-arm@nongnu.org; Sat, 01 Feb 2025 08:51:36 -0500
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1teDuI-0004KX-OL
 for qemu-arm@nongnu.org; Sat, 01 Feb 2025 08:51:35 -0500
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-6f44113c101so21441777b3.1
 for <qemu-arm@nongnu.org>; Sat, 01 Feb 2025 05:51:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738417893; x=1739022693; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4i+PvaK5XV2ufIOu1FAplCz/JMuNjmtNoAHIltZ7WPw=;
 b=GrcTA0nWxcgfCVyY9VLDKd6mvXK5wf1UlYRAmc9HODW4KbxuZL0YYjcKbpgivhqd3/
 RuhxLZt0Y5wF0bTxkMVN3ua8LN04DXCEjprte5nHcSeMXsyKRMDIi3xzYVEFaFJ3qUFi
 5wQTSQ8LcYrwxGrUVRSsFMaKKpQzhlM6JrL+so5reiTYuoSAdkFbdBygN7fT6rQbm2NQ
 hcQ54FtWcutE4OXi4PFcIKOJrre8MA+/LoYf23CVHLig2ScJSduGNzFf+sjLeuFRm9z9
 i3xR0am1zRDUPqpqQX+xA998ONF9KlMjYQFIGPkdt/lecMuZPpHJjEiLVyO+3FkkyGGc
 gevQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738417893; x=1739022693;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4i+PvaK5XV2ufIOu1FAplCz/JMuNjmtNoAHIltZ7WPw=;
 b=dQQAzXtK8gBeURee+Y9SZ2oKtIdS85c6Cj0MVGltW1K2z1GN3CCMSYcQOEhR+n8AgZ
 gmOmjjXKn1BFAmdvNFQm5kjEyTvV958gsjq2251NQGm1OL/qPaRYaz/ZGwY68fxL96E8
 zXb7L1zbj1sBbcKj1s38rbJpGKPKtcT844Mqmhy9M8K4rjHwHJTnb9AQ7FBqXQdX4VWu
 BCY0Vyp2cDa4v/lt6qAsB2V/7VOL+xRU5ZnYYLCDzKgKM/TkUL3M2opBOD9zcqtmq3Ce
 UdEE0hLGtArgiEJWdnn+PWelb1+7ldH23vS3iHm/uG2WfaxSAr4WNGuartxehMB1WfTu
 sXnA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXkz5EPEO8AzZJ2vVMiVbPkv+3sv5uNKe5JMbIs+MYY5T7ZFLbkooQZGjAcaAGIGmv6ro6mIsF3lQ==@nongnu.org
X-Gm-Message-State: AOJu0YyOBxkMCKzcPRnFrKG5lX0VL1cVP1oSMw+ccb0s6vU9AKdBNOaC
 ke1mTHjCWHddPfCb5lliOk/DcXhNNAR9NQRaYN1jfqNoTHGL9wyh/+Fejrw00KCXhqj077Ku1I1
 QelO/6/McSXSlfJombdxmizUobFn5zwMGrYqYwQ==
X-Gm-Gg: ASbGnctg/0p5XDZjRpGk8ZsKtfUThvStOFavVxbaLdskxmMaST5YMKWPtS1sUswypqF
 Wtz4C8Qs1mt4rJ+Feh8b70fbWLSzG1hXLeRdfP0tm6m+AHqaIpQgBVUIfYGE30CfXD1mDpMdcqw
 ==
X-Received: by 2002:a05:6902:2783:b0:e5a:e88e:b2d5 with SMTP id
 3f1490d57ef6-e5ae88eb501mr2274374276.9.1738417893051; Sat, 01 Feb 2025
 05:51:33 -0800 (PST)
MIME-Version: 1.0
References: <20250201091528.1177-1-philmd@linaro.org>
 <90d87f0e-56a3-8966-614c-364f3e726d61@eik.bme.hu>
In-Reply-To: <90d87f0e-56a3-8966-614c-364f3e726d61@eik.bme.hu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 1 Feb 2025 13:51:21 +0000
X-Gm-Features: AWEUYZnQ-7-wNeES8-b6WVpvSE5aD01NRDmR10nIvwaYjT8vzrteghAQ85mB9mU
Message-ID: <CAFEAcA_mBXO20NhYRHJCgkB0h8uYQQhBMdwVW376R4u-qh51nA@mail.gmail.com>
Subject: Re: [PATCH 0/7] hw/arm/raspi4b: Add models with 4GB and 8GB of DRAM
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-devel@nongnu.org, Jared Mauch <jared+home@puck.nether.net>,
 qemu-arm@nongnu.org, devel@lists.libvirt.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1135.google.com
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
X-TUID: Z5Bd2bwt61sy

On Sat, 1 Feb 2025 at 12:57, BALATON Zoltan <balaton@eik.bme.hu> wrote:
>
> On Sat, 1 Feb 2025, Philippe Mathieu-Daud=C3=A9 wrote:
> > - Deprecate the 'raspi4b' machine name, renaming it as
> >  'raspi4b-1g' on 32-bit hosts, 'raspi4b-2g' otherwise.
> > - Add the 'raspi4b-4g' and 'raspi4b-8g' machines, with
> >  respectively 4GB and 8GB of DRAM.
>
> IMHO (meaning you can ignore it, just my opinion) if the only difference
> is the memory size -machine raspi4b -memory 4g would be better user
> experience than having a lot of different machines.

Yes, I think I agree. We have a way for users to specify
how much memory they want, and I think it makes more sense
to use that than to have lots of different machine types.

thanks
-- PMM
