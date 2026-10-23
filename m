Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B4D8606A31B
	for <qemu-arm@archiver.kernel.org>; Fri, 23 Oct 2026 12:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=jDFVwaHy
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xKEIi-0006EE-AB; Fri, 23 Oct 2026 08:23:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xKEIe-00069g-Br
 for qemu-arm@nongnu.org; Fri, 23 Oct 2026 08:23:08 -0400
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xKEIc-0003lu-4L
 for qemu-arm@nongnu.org; Fri, 23 Oct 2026 08:23:07 -0400
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-8565d77c277so7348717b3.0
 for <qemu-arm@nongnu.org>; Fri, 23 Oct 2026 05:23:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792758183; cv=none;
 d=google.com; s=arc-20260327;
 b=lCY2q31BeuZe2xi1kX1iZ78g7VrhVrpgrXv++XUldaIDNd8UUOMt1628E4r8uZ/ccW
 6peFiBcNYwBYMVI8IO04P1oDnZ4+GE1AmHJmAocQ6sKEkIhu+CEvzRZ0SM1+mXofKUAJ
 B9iZul6HcnwHPDyO5q9bviWi7eQpf10qnZ/UNZnATCzLos42eYk1YhTaAOf2wALyQGz+
 L0YJNhiea9iha4pj+gCAYaTQ/SgHdJ1ElQh6vnnzkMBx7DUpUBnbYUd7pzaugPiCL1Gw
 3gY71taHmkt+0TD/9yUv6GQjt10XdUwjO76joleddSMrgxnhlBrPVJ++eO5c8DaLIC0Q
 nLhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=TAd5U1oVwz9nDy8tp5YfJsBkNhujjzjK+7KNOGZSHH0=;
 fh=Mf8Y9rL+OWPyltzV+z4z6rkzxB2xsaOq57QoohYOQfs=;
 b=GysxS3EBiE/mffvC44K9EOddG750cX8WJpSOo5h2LF315xDYQcpihgZ+mnGU+mWNCf
 zIlmIxAn9uw9+yufsmstBO+N3jDF2Ht4A9Uwaie/IdMFcu0tZ591VdcBpTuAAS6wxdQx
 XwtLbezLM8XncZpYyDUA0axwozwL9eoziIwDi6aBvSYfM/Lzh3mkvRN7+uDUVllyo4xh
 qlRSR3KionPybDOkUTfdRNig4yC0fXD0yQJzbeQRAUST83lOgE7G/aluBznkUIHsSor4
 goOUZmDzFyyIK/oVZ6QBmVZuNApXK5FPGJKRn7o+fNzAFJqaiL92sDcWOoXcnd9YhqxO
 m4Ew==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1792758183; x=1793362983; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=TAd5U1oVwz9nDy8tp5YfJsBkNhujjzjK+7KNOGZSHH0=;
 b=jDFVwaHyerdfQ78+YX2F7uIoTvwwPXiXI6/dxE4PNvUVRF4ms1rI/RVhD6+MNglAKM
 K1b30S3VN9FvTbc1+AQkYfJqrerFRhQnvEcXb9ZN8VeRmtN+49g/8LulvBTv1mv/r1Ei
 Dr8+p+wTaJoPb3+1KnuuV6RKxEog/Y25MD7uWYWaTLoTitWr/nWMKFW3QzUfXzyNze2p
 MTfBfKJkN1RqJ5S6D9ESnljkCiWZsyiDbzfldOelqZKXCJ9tEC+8YhLWofpjB3YD/4Lp
 hW0AiyFMY8r51S6FMYljhYFv1K8lnRyfO24SAn4CpN/ihUGQaMhD4MNMrFb0nZ9YvHho
 V9Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792758183; x=1793362983;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=TAd5U1oVwz9nDy8tp5YfJsBkNhujjzjK+7KNOGZSHH0=;
 b=XiXm7jdqt5U/CoptPhzjCzBtG4SRZTUQ/5zFlqJ0fbmI5qnsZIhh3v9SLfGc3nTc9Z
 0fsofBO20E9grfaTpOm1ZXu2mVTb3ogPXBdXln5mh9l4BVhuv9LmRjPIkYw/zs+Q0jzq
 y25XqBi4CAf9zeIAXQbWGclfC03cnMrf0WWjbnq9HXmWmuacnWDAgA8oBjg7LM/f5k79
 08XBuOMehWIRzq6ksoFVZVu1a1ss810yeVFoBxEJlY6nK4+V9xyov5nZsz2d59q7eDrx
 pdSUytmTvbOhBVwgkca8cx0axr26+snd2VLw11pcoAYDkOghs4NaOa++LNx+b51tIrvF
 hVOQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBz8MgUuFEHH9iUaQ3kLp1gao1tD3L+4GXcwqyEZP/rvRrCI61hCddvkU3ulvoyvb96wGssUbpCFpQ==@nongnu.org
X-Gm-Message-State: AFq9FYKqRK2Ce+DgqZMdA24n6y8O8+Uj/3jvvV5iT6Khwi2qP0Rg4xQ4
 uMfAc5QrV1wRRkwHx9AK7WtIFhFzK7QZaFhqq4ap9jAzIm0FHemK83PJbx87TZ5DjMXUhJqvYjC
 bib7SZF6sMVJq5ourRD5s7CZkuJ2lOMNxwouXaq6y/xs7RDdJKgg/z5k=
X-Gm-Gg: AYBFou1Mtd2097Xu+uIQHG/7t2SpcGFV3O+lkfCayeb06EEjxbN+CiCbb3bTxe7TgxW
 1FSJHlKcOEMJ2foHoiWLby3XdCEugYeVNZIbKYRhQfFGBO+MPymV6kzTIqjgxQEmGKzi1oWGwFw
 Y5Xw/iN3sf5GuYQRv6mlFuO0nviLjGY+dQ/q/XB7c+2DFHybITmcZc4btwco0/oXMBI9pEx1An5
 +Cy0PA7QUHtRRK8GL9U2jO9KfCBRTvbN7VSkolk6YSyWuLV8GDhVr4slEDT1Ju+mzFk+moHIbvX
 umTX0pJ8d3rmErzwxrSKIXRgHIuYrK6c8IJsOYhhLQG+w1Qo6+M9ae9q5JbXY573YgCZHFRrC1p
 SB7F9h/Xa2O8/lSPUv02iOqmod2PlkB8/OV12lKWDJ8wxwaZLuPlWpxHN3sBD/ZagLwgvsL2UE/
 t39RdLRrECRPavoIZbC2dB
X-Received: by 2002:a05:690c:38a:b0:864:6f4d:ef7f with SMTP id
 00721157ae682-8b157bc505cmr17583497b3.7.1792758183505; Fri, 23 Oct 2026
 05:23:03 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261022213647.21665-1-mohamed@unpredictable.fr>
 <20261022213647.21665-6-mohamed@unpredictable.fr>
In-Reply-To: <20261022213647.21665-6-mohamed@unpredictable.fr>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Oct 2026 13:22:52 +0100
X-Gm-Features: AclHuK9cQS86p9WUt7Inj40v9Pxefy5Er_lPBugds6z5fVDOLuLcu9KFILclsHc
Message-ID: <CAFEAcA9QcieQO3_iDgYrQHDLOhgGfygOF4QHbXY2tNoyh1oHkg@mail.gmail.com>
Subject: Re: [PATCH 5/6] hvf: arm: advertise ID_AA64PFR0_EL1.GIC
To: Mohamed Mediouni <mohamed@unpredictable.fr>
Cc: qemu-devel@nongnu.org, Alexander Graf <agraf@csgraf.de>,
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1129.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 22 Oct 2026 at 22:36, Mohamed Mediouni <mohamed@unpredictable.fr> wrote:
>
> For the kernel-irqchip=on case, advertise ID_AA64PFR0_EL1.GIC.
>
> Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>
> ---
>  target/arm/hvf/hvf.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
> index 1237077603..e813f14ed4 100644
> --- a/target/arm/hvf/hvf.c
> +++ b/target/arm/hvf/hvf.c
> @@ -1230,6 +1230,18 @@ static bool hvf_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
>          FIELD_DP64_IDREG(&host_isar, ID_AA64PFR1, SME, 0);
>      }
>
> +    /*
> +     * On HVF, kernel-irqchip implies GICv3.
> +     * The kernel-irqchip=off,gic-version=3 legacy case also supports
> +     * the host CPU interface but advertising it in ID_AA64PFR0_EL1
> +     * is not implemented yet.
> +     */
> +
> +    if (hvf_irqchip_in_kernel()) {
> +        /* Advertise the GIC system register interface */
> +        FIELD_DP64_IDREG(&host_isar, ID_AA64PFR0, GIC, 1);
> +    }
> +
>      ahcf->isar = host_isar;

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

