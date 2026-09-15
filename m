Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECA6FC88E75
	for <qemu-arm@archiver.kernel.org>; Tue, 15 Sep 2026 13:22:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x6T6d-0004yl-O4; Tue, 15 Sep 2026 09:21:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x6T6Y-0004tQ-NJ
 for qemu-arm@nongnu.org; Tue, 15 Sep 2026 09:21:47 -0400
Received: from mail-yx2-x11.google.com ([2607:f8b0:4864:41::11])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x6T6W-0001J8-Nq
 for qemu-arm@nongnu.org; Tue, 15 Sep 2026 09:21:46 -0400
Received: by mail-yx2-x11.google.com with SMTP id
 956f58d0204a3-66e56a1fe3fso3051706d50.3
 for <qemu-arm@nongnu.org>; Tue, 15 Sep 2026 06:21:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789478503; cv=none;
 d=google.com; s=arc-20260327;
 b=hqAzdhYbzKPdrgn2EstDvMvuq27ELv0mwVENZZg8RXJG8y2T3CC6+qNrAaeI9cteJU
 tS4CRZ3sfzDMD+VP3Nv4CeHMJRlTmM0WT1Gf19SBwtEYxg5HjL2Hkuy18yhWEL4E0Cql
 1vKPhwtTv2NfRi/aWP4pdICass3lMn1GyyibEKuUCdRBIAXYjnp0hFRiV0juZaZviWZA
 S4CnbAbhHc+eiLciwyc0/pWdGffXKLc2wzsDSj6G3QvW6hXjQez8tfshy25W+mXfQLD0
 12GelUF+7tSpnCco20AVHJCYK5VCnbNp4bKeTq4bptLE2lORxcYrkADioIXTQeyGQFYq
 +MVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=CZrGQFhDKi3Uv76rbzUZUgqf9dFVin9iGrrCgEcQlf4=;
 fh=ysc9n4CDL/tNG5wiY3Pp5CsiJJPO1zzNHV1KoIEdrJE=;
 b=I3PqA74BjadsTz0fsETMxXP9InizU2FPpr1kcxQ2xJkJb0TGA9w4Hx/lgQfxBQc572
 IwfuexDjjhnJjFuexFugCU3HsmwoR923T1P1JI9O5kehj9POrrHUD0KU1QqHYAOnUV/0
 UeuwqwhqDY4HjgjildveLz3xrYX4MW+7v0M2j2itOhaYgAW2VU5VZ/Dp0ajla3oPqObw
 tdqe9J3i9+n83zmXCv9k1WscOHwHlfmAEevYDD4LZVTp7d5XvBSh1ka0REExIrBSzTGA
 1hYHyqOVS3iDL1sIK9Chn0BsoXlT999zYid7ePmO11nu0/Aq1Vd93BngqVzjYomGKT12
 NLMQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1789478503; x=1790083303; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=CZrGQFhDKi3Uv76rbzUZUgqf9dFVin9iGrrCgEcQlf4=;
 b=uIH4wLAHHnQv6GlP7kReAEgmjdPH4n/iYY7x9wXnhB3dtlAKYNMiv1dEkx5LMcKHrq
 Vg1DMc6DyN+gPfytbMaYjWwELskBwx6eURW5Fp1MLM+QhdeuQXXU3Wu/ogO/dOhWyjHS
 SPueyu/ZZScjNOnaUCjwObZwszNQ+2aoz1FJE1Jc5tTxY4rYKvQUaYTgtIx8ot9scrPa
 GQ9kih53xQ6JWMScqal75mRAmOJ9sPJQGo2tEdK7GHHBhe+nvDgvnv1278XsV4lSqVX+
 JtgsFf/zh9LpdUEdHNuEG25Kz3OAv0jQgI8G0E+M/BvOXoxQDM8di7YfbENyXGuKIePi
 zNaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789478503; x=1790083303;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=CZrGQFhDKi3Uv76rbzUZUgqf9dFVin9iGrrCgEcQlf4=;
 b=hjU+4dcRg0XjY9+Upe9Q/ozgKYTAcefMvwe0kQ7mln1NifcjuTHTXvgAFJJTnOEW8/
 UiLUryVBelaNPGhnySrQakfdf9yynKlrVG1/ttA+lYOcWUTMcoGgbd4A+w0Mqckq3hfn
 9xy+gHO4JtEY9+r1jwAsZVJD8GwJ8DmlJ27OYjkCCTg5BqUwfqqIe1ZNvH3TciIO12rR
 kxThuaqtGHD0DEjHnqJ5bxbqsBCvmlHiTrOjNdXbVg25meoOUgzqesaqn7w/m3LWDWhp
 Vs7pOndR0++vUBTIJ2nHGlq+8IauA14SP1hhAdRKJle8dMrtViIHRRZGX5XSUDoqWAGe
 JDxg==
X-Forwarded-Encrypted: i=1;
 AKwUvBwHuJLMIhdBRgVcX3UXvv02m8fKI3sAmfHvOQPMtq41g6MwPw4kbx2BMab9vCmO7EBG+DeY+0Ikyg==@nongnu.org
X-Gm-Message-State: AFuF++nme8mk48WDNaMjfws0Z8OBqBHBSWoOKtjabKBhlIz2GQYknvCI
 +xSFmdsUYnaeTgz/oudGU5AI1N6ot6N8VFes2U5g+0GyHx6jYYCmXg4ix+kHE5DEAqGyYBhnNwa
 xduAZxaibvsT18KetcsaqMCDk9YPsV5lhPVq3qg8imw==
X-Gm-Gg: AYBFou2xdtvTDMPK0GDwUkdGVhporEzb9dQHZgNRY/3/GV9rdcvkoGD4/jW1AyGGn/K
 Et9wIIfeXXG6ar8T/4VyZW3AvC9vdA29/CzB6cykfSaEgRw9MtnUwbm8wP+0hoTh9JZq6Q9NhN5
 cE48dAiduhRaDLRU+/+58nfHu/z30WuapUqNo5o55wQ3le0eJl2B0kVCRTKWCjvhVDGzAVBHMle
 1qadrNEiy0cOur+2pkS2FMJny1FufWNT0RK10C5DKrHJw4pomDIQad9jbwvMSFeNc4mLc3EXMDj
 2FpU8rzI5zICDNnTe+qBaSLmAys/gWvJd7lsXtSOWShwhT9qSqjq/YWot4o9KOanSF6fTuWTmSB
 KZUf0iZrDTAbQzj5puQFhJsI5T1jir2N5UlJtnbO7msZPAfJOdw==
X-Received: by 2002:a05:690e:480c:b0:671:436f:adce with SMTP id
 956f58d0204a3-6714dff571amr1506403d50.45.1789478503014; Tue, 15 Sep 2026
 06:21:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260914192323.29250-1-gilles.grimaud@univ-lille.fr>
 <20260914192323.29250-4-gilles.grimaud@univ-lille.fr>
In-Reply-To: <20260914192323.29250-4-gilles.grimaud@univ-lille.fr>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Sep 2026 14:21:28 +0100
X-Gm-Features: AcwNN1ViJ--V6in8r4K53SVhRZMltYtRv9qzUYqpz5MYNzF_Gt2VQ4jIRc85jMM
Message-ID: <CAFEAcA9A+Vxq5rEA8DDHpEyFqiN1mdZPzLixDOXKzJhBtJcUEQ@mail.gmail.com>
Subject: Re: [RFC PATCH v1 3/6] target/arm: MPU - limit regs RBAR/RASR A1-A3
 to Main Extension
To: Gilles Grimaud <gilles.grimaud@univ-lille.fr>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, alex.bennee@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:41::11;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx2-x11.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

On Mon, 14 Sept 2026 at 20:26, Gilles Grimaud
<gilles.grimaud@univ-lille.fr> wrote:
>
> The alias registers MPU_RBAR_A1-A3 and MPU_RASR_A1-A3 (v7M) or
> MPU_RLAR_A1-A3 (v8M) exist only when the Main Extension is implemented
> (ARM_FEATURE_M_MAIN). The current NVIC decoder groups the principal
> register and its aliases in the same case fall-through, so once the
> PMSAv7 path is enabled for v6-M (or the PMSAv8 path for v8-M Baseline)
> the aliases become incorrectly accessible.
>
> The fix reorders the case statements for the four locations (read and
> write of RBAR and RASR/RLAR) in hw/intc/armv7m_nvic.c. Alias cases are
> placed before the principal register case with a fall-through and are
> guarded by a test of ARM_FEATURE_M_MAIN. If the Main Extension is absent
> the code jumps to bad_offset, causing a read to log "NVIC: Bad read
> offset" and return zero, and a write to log "NVIC: Bad write offset" and
> be ignored. The principal MPU_RBAR and MPU_RASR/RLAR registers remain
> functional for CPUs that implement the corresponding MPU.
>
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Gilles Grimaud <gilles.grimaud@univ-lille.fr>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

