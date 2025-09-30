Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13DAACAC5B8
	for <qemu-arm@archiver.kernel.org>; Tue, 30 Sep 2025 08:14:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v3VVF-0004QE-L0; Tue, 30 Sep 2025 04:14:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yulei.sh@bytedance.com>)
 id 1v3VV9-0004PD-3D
 for qemu-arm@nongnu.org; Tue, 30 Sep 2025 04:14:23 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yulei.sh@bytedance.com>)
 id 1v3VV1-0006Sw-0L
 for qemu-arm@nongnu.org; Tue, 30 Sep 2025 04:14:22 -0400
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-b3d196b7eeeso416629466b.0
 for <qemu-arm@nongnu.org>; Tue, 30 Sep 2025 01:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1759220041; x=1759824841; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8OVpJ830iM6QqjjzYl0WBFh2yWz47yyJL0owxoLoIsY=;
 b=BFxTASY6IREduqcTsQROd7o/PHz1FYwd2eBfBVtm1sR35mqN5v3j9IxfAv6mI0Y0H5
 oKliu229Lb/GkSFygRoFelspJQ3RnLf/GsFgY5SPsThcS0OVZ+OJiJg1QIevpLtBEzA6
 acEBSLTGl0SaQWVZYEQXHnq7FJ3/LkKk2ac19C9afW0+0fjqagq8wA0y1gXg3tfsxOda
 aQOSvtJGq3+haXk99CtiviliWJAQXJ+u0QaXk/TXejlLp/5lHgd/eEB0sVNfkDyAtoMD
 sDPWPCa4NoJK4tfBylj9XJSA3iL+LmKUvH6S5UdzK8LgZy3nKpfgE/afslczLQKtDaDy
 nBsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759220041; x=1759824841;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8OVpJ830iM6QqjjzYl0WBFh2yWz47yyJL0owxoLoIsY=;
 b=Qq4bf+/Ak4B41kMtNwH9a7PnUTJhU+qarzj7a9AIyeLKFkOkN0u19nk7j9H1Pz4vKR
 qcXYaYFIMsNmfwK3W18DZN3GKq2aKFpQQ0tDsK4hUQpzI1yzoyY74fN8IEAaNuGDKQ3A
 ggkp/HcrM9fBmhtmXROMse/9vAqGD2ivZ0YIezjWrH56O8f6EJuoP4oDkygINvLDcRVE
 u1zLop6bhFEyk1pgIn57MIRHSteigIqzMgmyvoeoY+EX3CmARl0XnzxGOiszj4mhaQGn
 6WTGGmV3A9rjWueLl1kf8TPxIy7Ug+jARVSrtRynSPdld2pUv/kY4yYKXNnB/giTo84K
 lidQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVX/CUPB9lLQe17CcSfxZKUH7wTS9tNmP8mPQz3LUkCw+RueuAhfxjUDSECCHzgX1o6MAaIbGjGRA==@nongnu.org
X-Gm-Message-State: AOJu0YxFAjZMur4tqUhol7LZ4MvMCEMHhBcBbGIAr00GPqChSmZ0LhNq
 Q2/8sIiI+DizqNHcfwStgkunS1e3nYLV2IDDrUSYZN7TfQYb61qRNOShZAit7DDlmygNAaJLQ+p
 q4PDPFxIImvbSthL1EyRvA5lKlZGfLuLuNyBwgaZNOg==
X-Gm-Gg: ASbGncs1Sv3c1j+8t/EFEV/7bRCMmPrLPy44Gunx00fI3K+olVGaAcyaoqRp2kb+O2v
 D+7Tm/Vg1lLx6If+BpuZkcZMpSw7cD3UO+uhZ5+UJzu+T84Prk/TRNXCMsQTxQaJNyC2lgLkPBk
 7EA1Oe58eQk8W9uS3x5qAY9eC4AD6uIt15LATpjJ0UfO0V4C/lpjl/BHpyKBMuJw8qD8OJjv6ZN
 ckjtOX7Bvzmowz1CIRjAUX/fnX8KDdTaJIgHJ60z+tz/2B+mPns7DWjpj8=
X-Google-Smtp-Source: AGHT+IHK1eVcqX3fLHHYRxoDjS8p+xVxIY4uV4oTiUjZ314HWX1tuNL3SvEyPFEzfs4NjHBfGC+UUtVVFh1qPQwxUJA=
X-Received: by 2002:a17:907:94c5:b0:b3f:ccac:af3c with SMTP id
 a640c23a62f3a-b3fccbbf75fmr642169266b.40.1759220040822; Tue, 30 Sep 2025
 01:14:00 -0700 (PDT)
MIME-Version: 1.0
References: <20201025131435.144-1-wangzhiqiang.bj@bytedance.com>
 <20201025131435.144-2-wangzhiqiang.bj@bytedance.com>
 <a3e42923-d81a-40c2-8b17-28d6264d5518@kaod.org>
In-Reply-To: <a3e42923-d81a-40c2-8b17-28d6264d5518@kaod.org>
From: Lei Yu <yulei.sh@bytedance.com>
Date: Tue, 30 Sep 2025 16:13:49 +0800
X-Gm-Features: AS18NWAKeUitGwNLCNzoKnxT7qZISA9IjG28OYsQomG5mXZuRq-_RtWmBOL4-TA
Message-ID: <CAGm54UE3D_gd8=iDMkF+nPUqZN5-Mhp-46HONi3Ok6oEkdyDwA@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] aspeed: Add support for the g220a-bmc board
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: Joel Stanley <joel@jms.id.au>, f4bug@amsat.org,
 Andrew Jeffery <andrew@aj.id.au>, 
 Peter Maydell <peter.maydell@linaro.org>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, 
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=yulei.sh@bytedance.com; helo=mail-ej1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Tue, Sep 30, 2025 at 1:57=E2=80=AFPM C=C3=A9dric Le Goater <clg@kaod.org=
> wrote:
>
> On 10/25/20 14:14, John Wang wrote:
> > G220A is a 2 socket x86 motherboard supported by OpenBMC.
> > Strapping configuration was obtained from hardware.
> >
> > Signed-off-by: John Wang <wangzhiqiang.bj@bytedance.com>
> > Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
> > Reviewed-by: Joel Stanley <joel@jms.id.au>
>
> Hello John
>
> Would it be possible to contribute a functional test for this
> machine ?
>
> Since this machine contributes little to the Aspeed models,
> its value lies in the firmware it can run to exercise the
> models. Without functional tests, I plan to schedule the
> removal in the QEMU 10.2 cycle.
>

This model is used in the QEMU CI for g220a in our internal CI.
May I ask what exactly are expected to do "to contribute a functional test"=
?

>
> Thanks,
>
> C.

