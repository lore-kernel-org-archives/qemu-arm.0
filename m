Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E625C606A31A
	for <qemu-arm@archiver.kernel.org>; Fri, 23 Oct 2026 12:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=KxC/x3AB
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xKEGE-000511-1b; Fri, 23 Oct 2026 08:20:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xKEG6-0004tN-QS
 for qemu-arm@nongnu.org; Fri, 23 Oct 2026 08:20:31 -0400
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xKEG5-0003Cz-2w
 for qemu-arm@nongnu.org; Fri, 23 Oct 2026 08:20:30 -0400
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-8a83d2706fdso7432047b3.0
 for <qemu-arm@nongnu.org>; Fri, 23 Oct 2026 05:20:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792758027; cv=none;
 d=google.com; s=arc-20260327;
 b=BDnSONRrW1CxwsDk3m9I6vQLY7LfCcy6kGVWK8udy70ESADwoi/bnhqq41OE7oxrZx
 kKcu5wGLsWvg7WkWsRbZDtYjaKrRB7Wd7ftFTDWoCTid1kZKN87Ik1OoaRXkXjlsUiV+
 lrTT/dXr44sAiK0xnSSDI8c77WbYo9wlXpKX+Be4fqAY2JeaJnJJ9wDF8F52lkbRl88N
 lZvVex3z2hf2cJe4m+hUwJHvue1+wVL3lFsuV8wsrYIgAoo0MhP32i6qdFvN3vDCqxO2
 IaK0qUhLv4aEJEx82IhwU/L0d9XDP6M10jyfugokSy6aBhhryk7iIF7tHebJn3HkMgfh
 jdaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=VisH/MgOPy1gOs4xUqtHlpe4s/DAlIc1J9+gozYPrFw=;
 fh=ovdidVGNAmhD3Nj4iYU1N7jCgdRc7+mqaVrd3jHuCcg=;
 b=NiXrH7gA/uAq8bFHrSkiF3/UnsJya98baTEux+TnSyX9J8cdmHEZL4JL60v5hbz706
 UbR45IbnNMq9dnZefTI2OJvkG6krOaInvY97bXieix/YiHGiuuZ+adjaEmcgWmpXLfUi
 ldurY0DDcGwK20GX4CaSeBI7yCmJMU7KnLnT4nOx4C1JWvdpvHjM0s3rrGaz8GGzsIM2
 QWJeo8QESKONMKjPJr2OfFkfMwhDY0G13qry5GZ1tstcJ4+k24HWc8/ZPAv0EOrKPjhG
 pj2ZAc4qYRFOiAzR5Jy72Xt5v8By7DA5RaZXhZucTolIdbtwNUgN9/JxShjIFxDy2DQH
 SqVg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1792758027; x=1793362827; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=VisH/MgOPy1gOs4xUqtHlpe4s/DAlIc1J9+gozYPrFw=;
 b=KxC/x3ABU9DHLcpfsMvW5WFTsPB9a1JzeLCgubpqhF+pSTE2+WGdvrzeXEKTGlmcpb
 Z7MzFosaQNVm408ldgAiTHV9wshnvRwWBh999NbHew8EjOhQKnj4UxG6y2AzjSESJwEA
 5XePYJ0sNiylqgCrtau57q1jIzrTp124uyVrfmNPtinrUZRypjuiL+ENyjlzFkNIInOZ
 3uu8qsKN3ruKSYKhsfZNxyfWZateK+UkmG+6F3jtcxOKOSbxtjeVSuL3v4bt3Ug+xzYz
 oghAzXwsVYTwuooomC7lFpEMLbZ+LxKtnp2F1TnYnER6QMNOWJLwvyR2q3UrhlbMfvwx
 5SoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792758027; x=1793362827;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=VisH/MgOPy1gOs4xUqtHlpe4s/DAlIc1J9+gozYPrFw=;
 b=20rawLqDaTRbIiEhi/i8WFyNAcciSuzThkbINVYmiyXtc7pKyXYdamrNxIkInhu29e
 +RN/nSKrCWnTNNR+liAX52odNPhB7MNZqiGePDkEmElOgpyy63yEMuXRk+YcXvRxysjZ
 F8tllU7p9E2BFe6AZZNHmgN3PpCnv8pVv23E2tlFOe/EOo+8C8LQzCAxGim7sNjbodvL
 gj7xeNjWdFv8xJHWE5ezF8vFTo6KAzJjXYRsNSoIUjg11fsJ2dT8iOabNEZTsRorEZT6
 P638ir6KamTww1bu98hCt/ADJ5SD3Zgot9y/RXAso1DFdSNqbYcOxlt6TCYJB4ImFqtN
 xYtA==
X-Forwarded-Encrypted: i=1;
 AKwUvBwh9dOSklD222SgEZsTvIP2iHQM/cHLzl569K77adAm9xRN8RDIue45z5gH8PhlaCw4iYnqrqaVDw==@nongnu.org
X-Gm-Message-State: AFq9FYLmrB5S53O0sdibwoPA7n5hQrN3Qk8ooWGey67sceHL8wgJ46Rj
 XJI5w6mdwOLVRTtSgIJm07XBs/2SR1T4haw/YBw/B+tNqZ2zsLyN8qZ1FN9T8EcNASltv1Ju0WC
 LcTLG0xCUSx0xZxkYJU4jyyeJMi6BdWnEPdoH47zx6w==
X-Gm-Gg: AYBFou35P6sxHxCYmnniMmmtbIned90lkBXex9Yencl7ZGr+nWxWueeAmkrJCy1HBZ1
 TMdbi2bTRYYYk2qzQ34zZSp1icteoj/bgd6H5yBV1q3j2rF0Lw7mlRIKdYiM816uHgyFbgQdghE
 qJFsO30xgIRn2maWUuzcTHaDDPzamHkgJTWbvK5nqzMjfilnLsRGSu1lPhfwlItR9BGwECzQo1v
 5qPThaXhR9BFSpgh3+0j4kOv9r1mvH0w+tYdgvnzz8WNwd+xe3iYXokh+MCJXW14kDhdo0b35nK
 /lCEA8BNjiEdWuOMfzgX1p9QXJfIWuTLQLNP94viGv74wnyli1/szzFASyLGWmgZEook2w0HmVE
 zfFLwHwUE1V2PRHijhVw0jInr6+LtjS6V75dqFk6sFeBcosek37ThqRVv7TaoljpuCaR1NLoRvz
 iq1+n324jme9s1laVg2xP2
X-Received: by 2002:a05:690c:c50f:b0:8b0:ce9f:2993 with SMTP id
 00721157ae682-8b157c709c0mr15122257b3.5.1792758026703; Fri, 23 Oct 2026
 05:20:26 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261022213647.21665-1-mohamed@unpredictable.fr>
 <20261022213647.21665-4-mohamed@unpredictable.fr>
In-Reply-To: <20261022213647.21665-4-mohamed@unpredictable.fr>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Oct 2026 13:20:14 +0100
X-Gm-Features: AclHuK_gUlrIYavqGAGJF8KAe0KTrT_YjnkSiPP5zRjveaSLV6lPq3OKJ4pRRuQ
Message-ID: <CAFEAcA91zAWyYXMFErTdB-Xw+BnJeC7dLp8+Qpq84GnwNcZtzg@mail.gmail.com>
Subject: Re: [PATCH 3/6] hvf: arm: save/restore SME state only when SME on
To: Mohamed Mediouni <mohamed@unpredictable.fr>
Cc: qemu-devel@nongnu.org, Alexander Graf <agraf@csgraf.de>,
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1136.google.com
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
	SPF_PASS autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 22 Oct 2026 at 22:36, Mohamed Mediouni <mohamed@unpredictable.fr> wrote:
>
> When SME is disabled as part of the CPU configuration, do not restore SME state.
>
> Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>
> ---
>  target/arm/hvf/hvf.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
> index b00a7e1a84..df047b5dcc 100644
> --- a/target/arm/hvf/hvf.c
> +++ b/target/arm/hvf/hvf.c
> @@ -1394,7 +1394,7 @@ int hvf_arch_init_vcpu(CPUState *cpu)
>      int i;
>
>      if (__builtin_available(macOS 15.2, *)) {
> -        if (hvf_arm_sme2_supported()) {
> +        if (hvf_arm_sme2_supported() && cpu_isar_feature(aa64_sme, arm_cpu)) {
>              sregs_match_len += ARRAY_SIZE(hvf_sreg_list_sme2) + 1;
>          }
>
> @@ -1444,7 +1444,7 @@ int hvf_arch_init_vcpu(CPUState *cpu)
>          }
>      }
>      if (__builtin_available(macOS 15.2, *)) {
> -        if (hvf_arm_sme2_supported()) {
> +        if (hvf_arm_sme2_supported() && cpu_isar_feature(aa64_sme, arm_cpu)) {
>              for (i = 0; i < ARRAY_SIZE(hvf_sreg_list_sme2); i++) {
>                  hv_sys_reg_t hvf_id = hvf_sreg_list_sme2[i].sreg;
>                  uint64_t kvm_id = HVF_TO_KVMID(hvf_id);

Do we need to check both, or at the point where this code is
called will we already have updated the ID registers to
not report aa64_sme if the host hvf doesn't have sme2 support?

thanks
-- PMM

