Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 526C1E7BD9E
	for <qemu-arm@archiver.kernel.org>; Mon, 16 Feb 2026 11:26:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vrwfJ-0005zf-S5; Mon, 16 Feb 2026 06:21:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vrwc2-0006Kr-3d
 for qemu-arm@nongnu.org; Mon, 16 Feb 2026 06:18:01 -0500
Received: from mail-yx1-xb12a.google.com ([2607:f8b0:4864:20::b12a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vrwbw-00087v-23
 for qemu-arm@nongnu.org; Mon, 16 Feb 2026 06:17:54 -0500
Received: by mail-yx1-xb12a.google.com with SMTP id
 956f58d0204a3-64ad46a44easo2752105d50.0
 for <qemu-arm@nongnu.org>; Mon, 16 Feb 2026 03:17:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771240670; cv=none;
 d=google.com; s=arc-20240605;
 b=XgauVK7N8NXMntfX/2tpfcoAFHf7/zWjFCGgZR1GHKtKGr1PG67BJ5Np7ecN6dGCLf
 zf09cg3P/AZdVy46Jh+T2QoGA0vSwfKsA3tCEnJ0dh5q2RdwF3UCIzGxuyL1GTMHgQeM
 tL7fS8atd2h5qrLNtq/24dqG4CpsIjx3R2NGVBAZtKeVxfnFk424xtZVInyOziQzpxTZ
 sx0hscueB/PmNJ4BpSV/VthpmnIgmqCsNp27UYd3pBlfFQ2zmTzI2JySdXbtEYOTy1on
 U1rTXf8DnsXbMWVV+o9AECFHfXVkGxACm1q9v+bnUTdba4p/LmMMPba1u290OoXcPVxH
 1BGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=bGLvJI9rF6W969QEd/biDM/jDWTv2iAygutAU+gJjk8=;
 fh=p9Zvn8HxRR9qMYdkfS1Lgjmk+gnqtxDT7le7Kc7QnOI=;
 b=OK3QyQFhCCUdymTOVelnyUwDPkMdwOPajwo9sGjPXx5u5FNnami1/BUuMmQTW8K19F
 sWE5mcO617aswy1vXB4ThfrvM0wTNMwUTrlLLAX57aAo0Tp6X5Yhe+CcD6fEUr2c6vdn
 HQrvBTrlGF6YCT1DwrlEUl8onN2K0QHz34RsNgbdjGqNaMBrsJRw8Co2F6/oS0n9PYKA
 FW7IqdpskTxlY9fz5b02AUmXr70DEQzFNiA5AXwqHFrdfVdhO0queAGzzNfkdkhbHC9Q
 BdJP4HufH8rhnf48cG5xgH1dEDYRbjl4hyXAn6NQlJVyUgnWer8iXvknAGC4PKmZ4hBK
 ZObQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1771240670; x=1771845470; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bGLvJI9rF6W969QEd/biDM/jDWTv2iAygutAU+gJjk8=;
 b=czu8x2rrlw2on1YvtdebyAALw+frDjJVoWdh9iIJKZxMt5LC3Q3v+pLpzj9bb1Hw4l
 e1H88F823kvcFyt+FT/cxSprZ/G4u0WsoegGylVYeaB9ysjaZUHnvc66OF+EK9MhjSxl
 oGWr/bNkPFFtXpCnCPRTuTZ/CC7iKyc5TIaHLmq2UfRU0AD0MHRQNMnjfYnv6ONXjf3C
 B/l8FJ83pUnoHmvoHlTR764uwECXlu5r4MyxN7I1Myf89ddVhRi+PnCACiLBpcM2DJ+m
 jO3SP1vTo0x+MIQN9FsgSZL0l3XgcKZAgquhezfGAdF8BT5PBWeaRKPIdkH0BdDknesK
 WrTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771240670; x=1771845470;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=bGLvJI9rF6W969QEd/biDM/jDWTv2iAygutAU+gJjk8=;
 b=lJy/TBlOsnmwrpRDa9CfIPGbiUsupBcPRjpPnfxY9gsYu/MeSdcIGTtG9mzia0m+YB
 wEqBllYtA+//H0P/iJ8te5oU/7xPxZLptSAWb5FVb8Bty1dpbs9HKKcdYT/eHJFg6FGv
 IZ2u0XYOnDIV3g6RZc5+KpGQSM/4cO8GWcjcBymlp/EmjXf4DY16oUvVFlivBDn4+djh
 NOvVRjpH7ot7kch8FqDSoU5z8E7EbUn0LMfHomRRB8FjpwG7tEv4TvpG5B7SXJ044xkp
 v86xCXU7dLe5cgQJL34xq3CRZr6nBFsUdq7JQC85FOGHCAWs07jmP0gmc27krUb74Wp5
 5hWw==
X-Gm-Message-State: AOJu0YysVHm5vFsyBYQGinoG7nhHFED0iAltdBeutsJwpD1X81lBptgP
 kkFoCwz0Eg4lrpQtciRUqd+xFfyZR6jvfkGBQP834IHZvzVCffUbiaacc1U0CEP/k+/lnT6xauc
 QoPBcJikUghg8L2rWrQSIfceZU1yVEHlQo391MqIuU/h33T6y8ybe
X-Gm-Gg: AZuq6aJo9Six6vtZA+zT1z/YgN8YHcDV8eGfRVAC2WZOlJuYL4W7ylPm8+9fk3KhYD5
 q2kNH1b/4JfZsqoIIEQf6k7dsk70lU8gR3lYAtkI9OE2/+cPHIKfxssXAtjn37t5oCqYZ5TPr/q
 vL4/QI0Fj6E9Lb7FPQF0Zfb/A/gqq/PjnzaNgDKCDDjoB4UX3URucG56SbWufgioRuc6BPS5m6d
 QcGlOxmeNzR20y/btMav0z0dVRaWtNPotA8aZBi1l1Vh/Wwh/9QMOb0OEvGiHL2rjMCNBRCa3GA
 m8yS52medXrHS6RWjWmsZZa6TRTPCVOSlTIN7gvIMPMJ7WvGchQSOAydEL3mRQSh4dk=
X-Received: by 2002:a05:690e:1503:b0:649:d40c:7ee5 with SMTP id
 956f58d0204a3-64c14dcbd22mr7383649d50.79.1771240670004; Mon, 16 Feb 2026
 03:17:50 -0800 (PST)
MIME-Version: 1.0
References: <20260212213955.2225662-1-clg@redhat.com>
 <20260212213955.2225662-3-clg@redhat.com>
 <CAFEAcA_oJgTc2SyRr11QTeTkmCPgvKiwngAaDiDNw5nUcTFA2w@mail.gmail.com>
In-Reply-To: <CAFEAcA_oJgTc2SyRr11QTeTkmCPgvKiwngAaDiDNw5nUcTFA2w@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 Feb 2026 11:17:38 +0000
X-Gm-Features: AZwV_QjkAtd8o1L8R3U42l-5v26Hsucunwmnf6JzR1dCAhNkLGcCjZqRKGxtKYE
Message-ID: <CAFEAcA_9Np04vouA-m99xB8yU-JhduwxxLj_dTG0QM=AnDbHoQ@mail.gmail.com>
Subject: Re: [PULL 02/16] tests/functional: Add SDK tests with Linux 5.15
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>, 
 Thomas Huth <thuth@redhat.com>, "Daniel P. Berrange" <berrange@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Kane Chen <kane_chen@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12a.google.com
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

On Mon, 16 Feb 2026 at 11:13, Peter Maydell <peter.maydell@linaro.org> wrot=
e:
>
> On Thu, 12 Feb 2026 at 21:42, C=C3=A9dric Le Goater <clg@redhat.com> wrot=
e:
> >
> > Add functional tests for AST2500 and AST2600 machines using the
> > OpenBMC SDK v11.00 with Linux kernel 5.15. These tests complement the
> > existing SDK tests and verify that QEMU correctly boots older kernel
> > versions on these platforms.
>
>
> > +    ASSET_SDK_V1100_AST2600_515 =3D Asset(
> > +        'https://github.com/AspeedTech-BMC/openbmc/releases/download/v=
11.00/ast2600-default-515-obmc.tar.gz',
> > +        'ece1a934095378929780f03e7d092e562f4b33b2841b80ad7c3d12a85744c=
0f6')
>
> This asset file is over a gigabyte in size, it takes forever to
> download, and our functional test asset download framework has
> no mechanism for giving any kind of progress indication for
> downloads (or even for telling you the URL it is downloading
> until after the download is complete).
>
> Can we have a size limit for test assets please, at least until
> the framework can support large assets a bit better ?

Followup: we have six test assets that are over 500MB in size,
and they are all aspeed tests. Please can you have a look at
slimming these down?

thanks
-- PMM

