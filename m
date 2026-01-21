Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3B22C4451A
	for <qemu-arm@archiver.kernel.org>; Wed, 21 Jan 2026 11:36:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1viWVG-00063V-Om; Wed, 21 Jan 2026 06:36:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1viWV9-0005w5-DS
 for qemu-arm@nongnu.org; Wed, 21 Jan 2026 06:35:56 -0500
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1viWV7-0001fx-54
 for qemu-arm@nongnu.org; Wed, 21 Jan 2026 06:35:54 -0500
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-790948758c1so57814797b3.1
 for <qemu-arm@nongnu.org>; Wed, 21 Jan 2026 03:35:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768995351; cv=none;
 d=google.com; s=arc-20240605;
 b=eJS5oppP4mp+TKhqh7VlfGY/tQYycixOCZ6oilce2fCwN56ynk4uIJRVnkKc1zTBm3
 TxzFlie4YxqIYHGSL73SJY19DimHF1/MogfKA3BF599crF1swmtCW5LcfO78boRqVGKL
 SSNr4YEITysd7Ot3uaoSJ1xTPIGINUS+59N604C6DlWelo1Gojw+uaOL4ZVpUi1KzR8L
 C7QxwhMrBJP4voA84jOgZDpXhA3XPb6SlVTwxHrg8azjC+TBOM4MHOqVu0+a2bgxzPJu
 Y3q8NuiqhdaxTE8Hwm4f2Szdo8NQZqb/Qf7rWZTlW7aQbNsAQOAw3bpJtH+lH2s0/CL5
 ND3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=iD168BTXwwJtIjCEYu2AK8BH9ffrZFt+7JKuYr47TDY=;
 fh=k8D8esZ0wHpAVgAakQn5d39h/kz5Agcpx8hLgQbQEHU=;
 b=Yqpw/6joASbPMwYjy9YTVU4YJFHxO+6LX1BR4iiFRmYfYiLllmlspDwMdt+Xb6gINJ
 qXkame0d/0BtQ4cY+cJ+tIE/SE2koC1t2NcZWUf3FWCch2OFCm2laeswiaHFBd8tmcDx
 CkXWmZ8kFZ2yxk0CFmLpjxawwU3llPq+5FJ3CzjSCFYZndPAxomYNAB/ARgLSJJ0yodq
 EVajsees9Sp37TbFbvmwD4j4SLdlml7hi0pHGM1Mwt03yZfVkRb1Ny0L5wnts+p2cAQR
 0Bv1pyNT7j3KRT4zlckZo+DQGI6PxDuzkrkwp2hljGie+4Me9r7A1wo2jtTTMVOxMoB4
 ED/w==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768995351; x=1769600151; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iD168BTXwwJtIjCEYu2AK8BH9ffrZFt+7JKuYr47TDY=;
 b=sOwm4ozAVCCFLkcP59MptigBzDquXpqnOxj5FdeLLExwq77PZsGoeXfcQ9FonD9Z5B
 BeTH9UmXlUMAkwcPsCC4Q2zUceKqKm+KYDHaRVc7X+Xgyb6KJ0OpfNRI7m2PDoETlseS
 u2x5br0M82S3tr0FbuEwGJ2WUFIzyAJiGRNOM36S8rbqRd3pvX4NLBBVWeie/cf0pCRV
 IcvFY2EGZQGw3UPvGBOFVzNKdMz9DErVtrkDXFwEvy+uV9DggZHYW5VcfmOakIYnIbeV
 jxZo/7ETzO2kbfnGUHDX9qxnJ++Q9E9mjDcr4L9mi4+6VrvcW6YgsI25CYioQJCkkzNh
 ymfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768995351; x=1769600151;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=iD168BTXwwJtIjCEYu2AK8BH9ffrZFt+7JKuYr47TDY=;
 b=eYSSLOdm3wkh2jkw3cPmKbjd6qKHQ2oy8mlb6c1kiuoZ77FfHHNnWp+FBDHl7Xr348
 sOQIYADfhOz79/NIhSGjQNvcW06PoBnWlDKYwPX1KIbm6d4XtteJYX2m77g6Pk87eM+T
 QOYjD9CQvBLU8/8rD+c5fD14VK+hTx8MC0k1LIr0i0p7nseE0MeYD16YtEtojeGJ/J41
 odtANc28rG/St/6dnTKIbbJGcDFw3SuNc3kmoO1gUGGJW9+hyddRqr399HolodLSX/T/
 GHKaI5LOBxNt3KWJi1gUjjJhupzPVjv/Os2HcMSgmOEYedlXuUX2NCN71TCZ0pNZ5jN9
 96gw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWnNBlRgA1M90VlLKpamXsjXwr07y6PICXuKvQpgwo8+xL8jYZimWEyysXIaRIF8NdCWcsZjxGpTg==@nongnu.org
X-Gm-Message-State: AOJu0YwcHCX5YmgoaTTBBtEXSCNBAx0pkNpAW9uiZRWOa9htdvWXho8s
 7drA0cEOC4Dgu4Z/1eOgL90EXa5TiOJCXLk+dHvxwMTKeOnUkOvYgw9kEc6c7eLgiwjeMkl0bqH
 z7wx7ZLed4G2Pb7CWW0J9BYS1sogfIat1fCMZWscXQQ==
X-Gm-Gg: AZuq6aJD3EQ60qomu/r3fcADY4eXIn/+WZw9f69BylA5oUDLPMraakRmf/eMHDQEmPa
 fwhfrMLMw0rQ2Yy7flRp2PQ0A03H3TaMLIqyGoCzb5G+0kIsGAJ3Ci2+EZUPwbShRro2c+11Ql6
 ElIcMhFeoykPYOWBVd7iBU3vK6ss6tUWhA+PV1worRjkG9JKAVDr55CvjRvJxhvhtk4YXsgutlb
 VkI5kvd+bzWvBVwkiP3yvnSBY/lub2BKLINCV4u2a3axXwg3bgBv3gpGd6fApITTjyrvw==
X-Received: by 2002:a05:690c:990:b0:794:1eee:605b with SMTP id
 00721157ae682-7941eee6723mr6911097b3.3.1768995351514; Wed, 21 Jan 2026
 03:35:51 -0800 (PST)
MIME-Version: 1.0
References: <20260121105932.135676-1-alex.bennee@linaro.org>
 <20260121105932.135676-4-alex.bennee@linaro.org>
In-Reply-To: <20260121105932.135676-4-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 21 Jan 2026 11:35:40 +0000
X-Gm-Features: AZwV_QisCTAmi-nyeEt4S0gol4lklIYRhmE3gOeq9PE2wplo2GDOuu7f-QThCeo
Message-ID: <CAFEAcA8s3DqGubp-h9wSaYMdsURL9GpuGNP9CYq+CUFaTA8eWA@mail.gmail.com>
Subject: Re: [PATCH 3/4] hw/intc: declare GICv3 regions as little endian
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
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

On Wed, 21 Jan 2026 at 10:59, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> The GIC should always be a little-endian device as big-endian
> behaviour is a function of the current CPU configuration not the
> system as a whole. This should have no functional effect as the GIC
> cannot be instantiated on a BE system but will help the single binary
> efforts.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  hw/intc/arm_gicv3.c            | 4 ++--
>  hw/intc/arm_gicv3_its.c        | 4 ++--
>  hw/intc/arm_gicv3_its_common.c | 2 +-
>  3 files changed, 5 insertions(+), 5 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

