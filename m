Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A96F3CCD193
	for <qemu-arm@archiver.kernel.org>; Mon, 20 Oct 2025 13:16:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vApk1-0008Gs-3o; Mon, 20 Oct 2025 09:16:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vApjv-0008EB-Ub
 for qemu-arm@nongnu.org; Mon, 20 Oct 2025 09:15:59 -0400
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vApjs-0007Zc-L9
 for qemu-arm@nongnu.org; Mon, 20 Oct 2025 09:15:55 -0400
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-78378cb66d6so25113627b3.2
 for <qemu-arm@nongnu.org>; Mon, 20 Oct 2025 06:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760966150; x=1761570950; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=GM7GED3n/P7S3vUkd63Gj+weMu9tTWPMhi++YGczBgY=;
 b=BsosYHDel+SNYWr4jDbPz82uv1OJxvtxoeKoblWXtuzAKsVqmMuar9vcLwjVhFX+Nv
 dQC2x8OWWunshkho6P5HLMb4uMGQqFUd1A7KlT1gjdj9RCtGdyjRx3P1JZ0aUWVj+ByW
 DJ1UUEGjwYgZNRlUbqqJXIwVokdyzSV3y+BlPVvXf66nHxOqH2kHGr1lW1uoUBODiqpZ
 dbHv5NqOpsL7Wh+h9Aj3LxYWglrUUHul/YMTgz++BEqVu+PFjkaLYYk0s7krX2hvUZ+J
 zwSKgtsatc9Yocbm82ifi/q373J0MoJGLaZuI75EnqSAz8xRXB2oUE7TpDu3tQz2iWVa
 RdsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760966150; x=1761570950;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GM7GED3n/P7S3vUkd63Gj+weMu9tTWPMhi++YGczBgY=;
 b=c5pZobZV3WEv3jbhuIc8PQxJuVzRfKaAy6u+emXeUgbuuCIo+9QkHRuOT7jPf6HZMa
 IEKeMF5oZmJ/K9VkWyGm91NoCsl/inZM3Eh20c+pCU4bv1MmLbqLEbmrRd4om0/S4y1t
 ohkqLFFCiqFncfXxf+fYh3w86dHUFhRclAg2b36+seJYFlV23rkdVdQ69zB5GH4cVmVl
 adSMgXd9XYU2NYB/iVrnCRQlAsvHnrcOjk1pKd2OZxq8XFJuPfGEe/5/VEl38V5EEAyC
 DMGS1pMjSvas8d5kUZFPDmDKi9yCoZQh9gUMY9vHRfjl6fGqWxSiupxiAc7geJsGiATl
 inSg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU34Yktz66u9IuQ9vKvLDsA3UmoqGFQI+gX4TFAb+tTvkQP01qQrSBFDaJli58UsqaerG/S0yeoIA==@nongnu.org
X-Gm-Message-State: AOJu0YzIVgxY4eZdSEPVz0KMNbkh4JD/JIq+FkS3lIH1i76RqnxNHJlN
 MxPpuB/W7/GWF5b0ndbuqoT1wJ9wZrEz3bX2gWA8/EPYdQoRsRNQmauj3KS9Uf7tQosFCbYLE7b
 CfTuynzQBVhroMTo/AvAJzSo1MmD6tXnU8sCPnGIS2g==
X-Gm-Gg: ASbGncuEKDiITgTFpsdInZZ2KJ1dAneD87eie/3XB57V/cyZsdpzdc+wC3uI3QM3ftY
 j1QlAsCuLIsgeNGB7J2hydS3RN8PJO5fBIftNeooMHvU+4HQ8fv8B/qzOlWxvJuMjJhYPqDpVJB
 OjoTjz8alGHLylVF+pcyOH4lYso6YBg7cAw0PumqmTz+9AS5hgXCaYbrIxw0+iIvm3BnnpMQxl1
 sOY5kZRE5CCPbAQfS8H5BKIIGdH8Y2fgN0WbyT/WUyL79MIEdRtsopfSzCTSnVrCdUnRz0m
X-Google-Smtp-Source: AGHT+IGqQiKlQUH1YcHNtcy+q6dnltoHufsu67kvKo2QHyspm9KboWQynj7cDz7W9dMoWXjUJxoLV5owlJ45Quc6nus=
X-Received: by 2002:a53:a0cc:0:b0:63c:f5a7:3fe with SMTP id
 956f58d0204a3-63e1620cf7cmr7612294d50.66.1760966149540; Mon, 20 Oct 2025
 06:15:49 -0700 (PDT)
MIME-Version: 1.0
References: <20251014200718.422022-1-richard.henderson@linaro.org>
 <20251014200718.422022-20-richard.henderson@linaro.org>
In-Reply-To: <20251014200718.422022-20-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 20 Oct 2025 14:15:38 +0100
X-Gm-Features: AS18NWCPQSvhpfOjpzPziTxHzNawVRvsWmYXH-iSJVthG90ng2awJZH0acOUisU
Message-ID: <CAFEAcA-_Hcg=4+_3uNez3ebFPjNF6etTZHyqy1jDgU1GWPUwGw@mail.gmail.com>
Subject: Re: [PATCH v2 19/37] target/arm: Implement MRRS, MSRR, SYSP
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1133.google.com
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

On Tue, 14 Oct 2025 at 21:19, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

> diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
> index 01b1b3e38b..c76757ed01 100644
> --- a/target/arm/tcg/a64.decode
> +++ b/target/arm/tcg/a64.decode
> @@ -302,9 +302,15 @@ MSR_i_SVCR      1101 0101 0000 0 011 0100 0 mask:2 imm:1 011 11111
>  # same instruction as far as QEMU is concerned.
>  # NB: op0 is bits [20:19], but op0=0b00 is other insns, so we have
>  # to hand-decode it.
> -SYS             1101 0101 00 l:1 01 op1:3 crn:4 crm:4 op2:3 rt:5 op0=1
> -SYS             1101 0101 00 l:1 10 op1:3 crn:4 crm:4 op2:3 rt:5 op0=2
> -SYS             1101 0101 00 l:1 11 op1:3 crn:4 crm:4 op2:3 rt:5 op0=3
> +&sys            l op0 op1 op2 crn crm rt
> +SYS             1101 0101 00 l:1 01 op1:3 crn:4 crm:4 op2:3 rt:5 &sys op0=1
> +SYS             1101 0101 00 l:1 10 op1:3 crn:4 crm:4 op2:3 rt:5 &sys op0=2
> +SYS             1101 0101 00 l:1 11 op1:3 crn:4 crm:4 op2:3 rt:5 &sys op0=3
> +
> +# MRRS, MSRR
> +SYS128          1101 0101 01 l:1 10 op1:3 crn:4 crm:4 op2:3 rt:5 &sys op0=2
> +SYS128          1101 0101 01 l:1 11 op1:3 crn:4 crm:4 op2:3 rt:5 &sys op0=3
> +SYSP            1101 0101 01 0   01 op1:3 crn:4 crm:4 op2:3 rt:5 &sys op0=1 l=0

I think we should decode the L bit here, and allow handle_sys() to
deliver the UNDEF, same as we do for 64-bit SYS. I know that
currently there are no 128-bit "system instruction with result"
insns, but there also weren't any 64-bit "system instruction
with result" insns until FEAT_GCS added GCSPOPM and GCSSS2...

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

