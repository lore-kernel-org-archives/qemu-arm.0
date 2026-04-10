Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C886EF44845
	for <qemu-arm@archiver.kernel.org>; Fri, 10 Apr 2026 11:59:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wBAVs-0003oy-TB; Fri, 10 Apr 2026 07:59:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wBAVr-0003oa-Oi
 for qemu-arm@nongnu.org; Fri, 10 Apr 2026 07:59:03 -0400
Received: from mail-yx1-xb12e.google.com ([2607:f8b0:4864:20::b12e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wBAVq-00049F-DW
 for qemu-arm@nongnu.org; Fri, 10 Apr 2026 07:59:03 -0400
Received: by mail-yx1-xb12e.google.com with SMTP id
 956f58d0204a3-65005a8840dso1953137d50.0
 for <qemu-arm@nongnu.org>; Fri, 10 Apr 2026 04:59:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775822341; cv=none;
 d=google.com; s=arc-20240605;
 b=HfGtHJH5502zy1wAD9jfVk0GSKJt3hK96RpJfEpFsJhdJtpY+mAxP5EiMWMCv3rtgR
 hWA6c252udLHG9ttwwsk5t2m7k+2aFDmVy3J1eKzNoVZYDXWRLP+Pqv/xRExlLvgNbUe
 QOhEYhnHDLTbDNebpNcbK8VT1XilUanh6p10i1gvi0Ylg/edMgmfasFvYbFeZ6I4LkM9
 KK29iKhk/zZC42pWUB3yR87r92Y+4hJzJjoFiPa5uiPTQpzPsPIDVuMArRrVfanNCH7U
 3zj4RWZqFGYvqued7nzzJw0zQ4uze9R/Z5ZfA7dicy1/5MM8QAh/nOstvcpuiTI5DlF8
 ZKfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=Uq66mCbcqASreJ6ptwxhmLSaNhojTvxyaCd+23Rfjw8=;
 fh=6BIEedL+cu+ik6ig294tU5OKUSSxa+f1RD1181jjF6c=;
 b=EhzH/HNbcq0A0z3qP91k0yOr83EsEvtqVOGOYzdV1HD3W37J8loGGX08onJQYHE8Tr
 8roT+BWjzfhsIBFy+IfiQfWxoQCJcoelXGh4wx71DDOGqR7DVJyYRAAdNdKLRIe/JmiP
 RIz+yHwpbFNrvZT/cKijH6CsZT2EyDIxrSH2rYR3vIOjiZQS+LKj3TB2mBptjc/m87I+
 Ep9zyVpIybILqxVIpNpFOlvgrYAlwgLMspRfjzOlWM1TTuDS8SKeF5a4GA6HxsW1981S
 bFQsR/DrYHMRISpLY/6GaRbRn19YQyhImjQBZwQLtmmCN38ULdYjyZUvRRiyc5RrQQj4
 XGXg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775822341; x=1776427141; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Uq66mCbcqASreJ6ptwxhmLSaNhojTvxyaCd+23Rfjw8=;
 b=EplyAS7/BPoeEETQEL0j6+XEk0d+FGJhlGAep7Q/nEpee/yidp0kSiTHACw2D3uIc3
 63ASi6VyWOBizwyu0/j38eTR3VhCowRxLyGEQLpd/KjiL0xW0SqTv56WXZxG7G++XNUW
 VLDPHniJS45Ci+0a+YKojOLWYTDAvbO4PpsVnWvLcRi03z28dVofxRSLdMMK4eixyQtl
 UQbgmqkUnpzBT9dz0g/WIxPPEEfXKQwoxjNIXxU+k8kpV9OAq6EtFi5B1v75Xe4qNkbr
 MLznJmIGJnWYkhEnW21OBO5CMugQAUdI9gIGTFD2QChfWSR7ZDruZrxzTsd4hOuo6Nhe
 Sfrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775822341; x=1776427141;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Uq66mCbcqASreJ6ptwxhmLSaNhojTvxyaCd+23Rfjw8=;
 b=eo6WFfLqVNJtfSJQ9k9jJXjEKEqICp3SGGQss8bgCDLzjj/Pl5au6jE4MfBTtGlZNT
 VeURywdM2hvrAb2uOPflEm+yod+jcQWiohe+Nk7m9LAJZnq9QXJyGf0XT7p7M41sH4Ua
 ZlmVuKoHC5WikqEbeND7X/+892MF65XXZG7lOLuaIdmEuio5cGT8dB3c7GVSYVPY9IMG
 CkGyzLpXqauFzo/dh/6tyzIbmmZtJhqCRBvs/lxJzdqkCmwz5C+BcMzTML4dS2+YP3t7
 lx+EFGIwDKI2j9nSEApjpsCd5xu6/DURmD+88uxTtpHJZVLMh0M4DqVAksXmkSfvJiu2
 OC2w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXatK2r71eGBLAyimmOHDCNQy4spKD5xLDJXQPDA8LG1pydlYHT1DKcanzePI8dgncw5Y9RsHYCUA==@nongnu.org
X-Gm-Message-State: AOJu0YwdpUjMzKgwCl0J5sF3j5yyp7SBVuepbpk8YNqiyJHEH/hBLA6/
 GVlMxVkocSHnkwjsCw7ZII3ceDwMC5+xBdK6xyZmNLBs4A1a7aWeDX/2l5uBtze1tKOZNawUYkw
 UhUMCL/FZlksnz777WdUszlqqnXW/DL29ox5DbYRQeg==
X-Gm-Gg: AeBDiespMf9m0NHURzBhTWsIBmC+77q8rhThhjGxc8TGprOWW63lGQlxBbiK0LiPAxN
 S7gtTwqcHFSDkYVerk/f37Ls7TNKPagcOzJfLnTDUuApk3zOCU63C6s4wXjrQBReyffEQteBC7j
 6TpOBLd7N8ejQD7mXJOZmBJU5OdYGv0ZzYAHVU6GSJGgvzkUxq5oMr4v8MnfmttQ0MC2tqWvP8P
 KK5AzyvsS3KZtlUsYm0en8dGxWm3/Czf7k9vwTRjAWf8F/uuIz+zkXe9iJzFm9PS29EG28tiXeg
 9d+b9NISNLuMCXZj5ComiJReA3YokbSrbyiVwFgjteApLBuO1Jh4H04OaeVYHEG7ecQ=
X-Received: by 2002:a05:690e:4393:b0:64e:e47b:2476 with SMTP id
 956f58d0204a3-65198bcf642mr1703703d50.43.1775822341334; Fri, 10 Apr 2026
 04:59:01 -0700 (PDT)
MIME-Version: 1.0
References: <20260306150302.203112-1-eric.auger@redhat.com>
 <20260306150302.203112-6-eric.auger@redhat.com>
In-Reply-To: <20260306150302.203112-6-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Apr 2026 12:58:49 +0100
X-Gm-Features: AQROBzCe68DrKNa960VUelWx6OeNeQ_U0UpAv8Ph1hRmXTGHd4HpysiP_1n9EzA
Message-ID: <CAFEAcA80Lb0ZskKwLxSL1tKSLT=D=CpSek7ghQnypkHmQcyZ3A@mail.gmail.com>
Subject: Re: [PATCH v9 5/6] target/arm/helper: Define cpreg migration
 tolerance for DGBDTR_EL0
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 cohuck@redhat.com, sebott@redhat.com, peterx@redhat.com, philmd@linaro.org, 
 alex.bennee@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12e.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Fri, 6 Mar 2026 at 15:03, Eric Auger <eric.auger@redhat.com> wrote:
>
> We want to remove AArch32 DBGDTRTX which was erroneously exposed.
> This was attempted by 655659a74a36b ("target/arm: Correct encoding
> of Debug Communications Channel registers") but it was discovered
> that the removal of this debug register broke forward migration on
> TCG. Now we have the cpreg migration tolerance infrastructure, we
> can declare one for the DBGDTRTX. This allow to revert the reinstate
> patch.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Reviewed-by: Sebastian Ott <sebott@redhat.com>
> ---
>  target/arm/helper.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 7389f2988c4..3cba62705dc 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -6426,9 +6426,14 @@ void register_cp_regs_for_features(ARMCPU *cpu)
>              .fgt = FGT_CLIDR_EL1,
>              .resetvalue = GET_IDREG(isar, CLIDR)
>          };
> +        uint64_t dbgtr_el0_kvmidx =
> +            cpreg_to_kvm_id(ENCODE_CP_REG(14, 0, 1, 0, 5, 3, 0));
> +
>          define_one_arm_cp_reg(cpu, &clidr);
>          define_arm_cp_regs(cpu, v7_cp_reginfo);
>          define_debug_regs(cpu);
> +        arm_register_cpreg_mig_tolerance(cpu, dbgtr_el0_kvmidx,
> +                                         0, 0, ToleranceNotOnBothEnds);


This needs a comment to explain why we're doing it.

thanks
-- PMM

