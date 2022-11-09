Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp277292ejx;
        Wed, 9 Nov 2022 06:03:37 -0800 (PST)
X-Google-Smtp-Source: AMsMyM7u0Zi/vCjYMWiaOWOCnbDyiyJQh/Ch4GH/12U0Gfw4L5PL3g7BIpLz7NsU2zTVgwkGvxf+
X-Received: by 2002:adf:db4d:0:b0:236:699b:be5e with SMTP id f13-20020adfdb4d000000b00236699bbe5emr37269770wrj.147.1668002616904;
        Wed, 09 Nov 2022 06:03:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1668002616; cv=none;
        d=google.com; s=arc-20160816;
        b=sIHCLeNb75sDLHpjnNFflmfsqYv2wlfNPFeRXSrbE+ZH9QbISW+l1GCfbDyywYRiPp
         5CJPCHh5Esp1QRnqdIblIgb499IT/3+dV1iNbU2iwS2jwvZzEAK4Di83NBEFbLVW3zQx
         +xaZZuHuZA7srJbUt1T/QGiB46nY8AyvUvhPbWDxMEJdaUpW25w1copSvdkIqNZh9cot
         dw+oH4J/S923knwp5o80al5JiBE0iFrCAH4uZqm3Q8n06gfkPyjPvjOhyexjNLP9qB2Q
         QMSPHlj0HVCHsozQtZZ5AyPZGgM+NDF68Mp6L8K+oCDyiSIjvWpniCMqkowC3NoqERXG
         gy4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=UNXjrRtkEp7TNBn8iKA7DfH8iwn8nN6TAUHuRgSlY6o=;
        b=iXMpbpxsjuE6E5NfBZKLeL5gTLIJM75ifYCU5f8iEWLpinEmm4L6kJedqWB8cZz4VU
         8DLHz7OMEHD6kP9j5eYcGz20gYFxlchkwaJChwM150v61gXkNAMtFd1Trf0k1qyWOWLa
         YqpM6GdxZ7NZzx/2sRsj8/fCeo8+ly/TYMFAD9WIGNx9gKfBtqHh8ubhwmPyJY3so4jw
         svhl89MwuceNJJb5XtphZ8vkkenYO8atUwUPp9W7C7ghkQM/C8ZCx2i9UDjaXhw6trQl
         Q8o2u2COaSKa70mUqNovgc8re1kjgyMW40JJ3wDqDC3xPm2oRR/LAKBM2qqm3/tRAa6L
         9Fhg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BDp8i2sc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v17-20020a5d4a51000000b0022e68621426si9644865wrs.175.2022.11.09.06.03.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Nov 2022 06:03:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BDp8i2sc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1oslfW-00046L-RQ; Wed, 09 Nov 2022 09:03:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oslfU-00045p-QZ
 for qemu-arm@nongnu.org; Wed, 09 Nov 2022 09:03:04 -0500
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oslfT-0008RM-52
 for qemu-arm@nongnu.org; Wed, 09 Nov 2022 09:03:04 -0500
Received: by mail-pf1-x42e.google.com with SMTP id m6so16808966pfb.0
 for <qemu-arm@nongnu.org>; Wed, 09 Nov 2022 06:03:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=UNXjrRtkEp7TNBn8iKA7DfH8iwn8nN6TAUHuRgSlY6o=;
 b=BDp8i2sc62kNhTTCosDFW3PRGQDMLD3zbUPgW+p+QxILeJ7UIvuJkT0utc4QbksmJM
 kRFuaN7mI5ub5vse2NVugjUwGGovGkv8bynRf5VLD+r7POQM735m2aFu3QnnYB+CEm2t
 7LfK9wf5b7FDB4Bwi08b2HgXDyGdgiyLayYlBSEGXdGBoR5GJ6xs9OoATqQEeX8O03dZ
 IVFAVPXgQl8LtaUEieK4oGXUcxyg4YftsIXCbRk4r7fmu1OeeZq7sq+uRuYeiTAQE3z0
 20n0tO3sOqliljyi4n3WfV04QtlATXJBrRLavYCDfMvhGvwF1ceV2tH9WKSc9CcImObR
 BGaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UNXjrRtkEp7TNBn8iKA7DfH8iwn8nN6TAUHuRgSlY6o=;
 b=s51BgO4oRjknu7P/IOj3pNfQZT/2G1/ukbVqIacoInvo0d9D8fJfuvadKOWeaB977x
 nxti6gNSSF3GfgzMVpkcyo6t2IcssgLbq7rtrDFDGBwSvXkm3peLhB1Rr/7Fg/nhPsQN
 ZNEEOgqGPuIrO5wqMOAFX+O2IPWP22HLmAhxys85q9KmuslpAOLR3hJbr3JcYEc7TA61
 c0sTNcw4RaJ/WiNlLjjnCfF+wtNl13plclJK2mCxLXFlMGGyiwuDSJnAxcTKr3ScjBdf
 nAdcJxWecOykPFH5O4A4kaC7+3SiK3gRdjRjWP32bvEupJ1q2q2Sg1PIjctb//R1Xrbx
 gLJw==
X-Gm-Message-State: ANoB5pkMDEnhr8ztdYX/wGhXptihthmcxpN4vXQyf8NfTYxjtkMJb16w
 8jNJF5zq3iDDr08SToLdDEHXpCAYwrz9C/+Vod0Mwg==
X-Received: by 2002:a63:81c6:0:b0:470:537b:9afc with SMTP id
 t189-20020a6381c6000000b00470537b9afcmr19376937pgd.231.1668002580943; Wed, 09
 Nov 2022 06:03:00 -0800 (PST)
MIME-Version: 1.0
References: <20221109133525.762667-1-quic_llindhol@quicinc.com>
In-Reply-To: <20221109133525.762667-1-quic_llindhol@quicinc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 9 Nov 2022 14:02:49 +0000
Message-ID: <CAFEAcA9Yvr01s=4FAiutLi=Owtt5RhUGAoV-3vREStTyB-UL8A@mail.gmail.com>
Subject: Re: [RFC PATCH 0/1] hw/arm: use -cpu max by default on sbsa-ref
To: Leif Lindholm <quic_llindhol@quicinc.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Leif Lindholm <LeifLindholmquic_llindhol@quicinc.com>, 
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Shashi Mallela <shashi.mallela@linaro.org>, 
 Radoslaw Biernacki <rad@semihalf.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x42e.google.com
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
X-TUID: q3flWejZFm02

On Wed, 9 Nov 2022 at 13:35, Leif Lindholm <quic_llindhol@quicinc.com> wrote:
>
> From: Leif Lindholm <Leif Lindholm quic_llindhol@quicinc.com>
>
> We have mainly (well, as will become clear, in fact "exclusively") been using
> sbsa-ref with the "max" CPU. But sbsa-ref was created with a default CPU of
> Cortex-A57, which we have not updated along the way.

So, I don't have a strong opinion on what sbsa-ref's CPU type
should be: if 'max' works better for the use case we should
change to it.

> However, the "max" cpu has seen a bug where Linux boot fails around UEFI
> ExitBootServices. Marcin Juszkiewicz has found the cause for that, but that
> requires a patch to TF-A. (Has that been submitted upstream?)
>
> Turns out that due to a change in upstream TF-A last year, all supported cpus
> other than "max" fail to even boot UEFI fully, due to the top-level (TF-A)
> Makefile defaulting to enabling the maximum ARM architectural version
> (currently 8.6), in combination with not verifying all features at runtime
> using the ID registers.

This seems to me straightforwardly to be a problem that should be
fixed in TF-A. "Default to the newest possible architecture version
and don't check ID registers" is a recipe for "can't boot on
anything". Many *hardware* CPUs aren't that new yet!

Part of the purpose of sbsa-ref is to find problems with the
software stack -- so we should expect that sometimes the answer
is "fix the software stack", not "change the model's behaviour".

> Since the *point* of sbsa-ref is to serve as a continuously evolving platform
> tracking (with some obvious lag) the evolution of the ARM architecture and the
> SystemReady specifications, I don't really want to restrict the enabled
> feature set in TF-A to the Cortex-A57 one.
>
> My preferred course of action would be to change the default cpu to max -
> maybe even dropping support for other cpus. I would then step the version
> field that was added to the DT. *But* this would break existing boots with
> old TF-A that can currently boot Linux.

An intermediate option would be to move forward to for instance
the neoverse-n1 CPU type.

If you want to use 'max' for sbsa-ref then you probably also want to
look at making sure that TF-A is doing the same thing Linux does
where it checks ID registers for feature presence before enabling
feature use, because 'max' is a moving target and relies on the
guest code doing the right thing with feature checks. In particular
it does not honour the nominal architectural requirements about
v8.x/v9.x levels, but may implement features from further in the
"future" than is strictly permitted given the absence of some
other older features.

thanks
-- PMM
