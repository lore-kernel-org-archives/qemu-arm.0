Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75B41C54F4C
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Jul 2026 15:22:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wojdl-0000F0-3q; Tue, 28 Jul 2026 11:22:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wojdh-0000Cs-JP
 for qemu-arm@nongnu.org; Tue, 28 Jul 2026 11:22:43 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wojdf-0000H8-EQ
 for qemu-arm@nongnu.org; Tue, 28 Jul 2026 11:22:41 -0400
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-c197e7e4e94so679574866b.2
 for <qemu-arm@nongnu.org>; Tue, 28 Jul 2026 08:22:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785252157; cv=none;
 d=google.com; s=arc-20260327;
 b=SJ3JZk2t6QaBOOd9fr2e8nndSpepUAvJhuOa+kCdcNBhi8dH+2xp2T/+Rr+sbMoRow
 Qejev0cUBq7kxkeRCaX2e+AOyJictIpDA7Eppu2vFiccPreSHPYoZIDXd3VHyqUFA7LW
 GLM5CJkxpIeAxCA3kybWU7RFPWaGlSfqHtC5megxTT3kaY6VCH6SK0k0MgxKSs/q38il
 QUquyvxbgybwG/Vng9L63VntXTIyaSfbK+QQjJOnvlOMC7aXub3XgtcjvHvQ1hCN5oBO
 e6I3RYGIPuLxm1z4ZhyG5jDI8ArIHIE79z2PG4d17Zqrn6pB+yIRsMSUHbbQkMwnvSN8
 DQjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=bxyqLvNaeiMWMxJHwfTRFEhsh36TUbaxSLyUderGJMo=;
 fh=pgANtuNDjg83mkdDpyvTSqN4oiu8fc0IdFTFU+pw0GQ=;
 b=f+hhJpnwqZSWjygBRISC34h5fIfSyL2PBoMzSIWapmPnnBKh0/8TsYPQW2mb0tYc8K
 6NNFoPc4+peNU/sKKuL/EIVlT9sWPzzanY7qBPfl9ek1fgm7TRsN6zAjxIU2//HznZMQ
 gRCgI09qlBM5i+VjOLkCnXp5ErRTTAwowmmSP6TKd+LM1COWMiH7/qqYHP3YeqUGa9vc
 a8V8tFqvlHHxj+KozlHIqgIWY2y3m/J/ucXoRBtVH1oZoBOZIEYY/gibeC5j2tjbeXpq
 LYVi/orOPnwH79mSjYpijsfz/ms1qIcEJW5UMKm5Dw2UQzthHFJHj3yr/lG9QERVwtC3
 N5mA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1785252157; x=1785856957; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=bxyqLvNaeiMWMxJHwfTRFEhsh36TUbaxSLyUderGJMo=;
 b=TcHmomokDxqyQLuTo6BciuYVmd2yxsdOQHvviiKodCxi1D8Vra10VOsn+ahPP9//Fy
 t3+lVPheiB7bxc4Q+scJobFZOJuH+SPs226wELkPqTyquR/h+fMWdAMTd9YPYnqtJSze
 NkQltCkNj2Gd15O6N7ivKx6UHj1fBccnMr3pry94Z645HuwF0pFkxZ8xiX6xgDoiKvsw
 PHQ/B96qKldZGLmc1TjX8MMMludwsbKmZIymuz2YujQe+QlioNuWrOcGOvCYrp1s1gME
 0/d96OHRHimgH0vPi5yjK+W4pi+7B5QdnVF0XmOcMH9pgz/O1/tfOh7vo6iptP7+kd3i
 tmEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785252157; x=1785856957;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=bxyqLvNaeiMWMxJHwfTRFEhsh36TUbaxSLyUderGJMo=;
 b=pCDVevH7RQoMzey/tcVQxnl5Dx0O6pQQL6A3X4Y4DaME+grll/3A+56ZujIgMiR169
 2/wCXYEHYvbJLyHSmIPCZpidmUUYr7eJI6C9LHWIxUfLfVYbOgBi8j/hnQqdGtGiW7s2
 ZY/ZreA+uuzh7eESptCm1D28WIbJYDGT4zdXBHDGDA6mlXHKwD8cCfx+y39pKGi/8VrR
 fpYQP8ZA1J0pp0WniI8nltSF/39Gu9RTmhXjQVU0f5qeK94yOXYa3Hmbwer/XFVSw0HQ
 WVVHe68qbiC+OlOrxiFO+JaJXNS1HyAPmPRz1DUadMXmT1HrgQ3RIIljs+BQ7T5dMiF9
 tyZw==
X-Forwarded-Encrypted: i=1;
 AHgh+RqrTZlWWg4h4gjiFjNMpDrXAVRu9Flai4mKUMqo7gUmXMHkunzZlHkoaIjYxjY26M5yeGWLKVMhHQ==@nongnu.org
X-Gm-Message-State: AOJu0YzXhSIcQ4ogLPM5Z868I7DxySnt7Bg/XwGsnWdvsa3HPd3Smv4f
 tKa3Wfo3kB9WGnjv8xFFC6ZEHJcEu4aZzNoMC4rpyw/5gkUfd5FdOUEg3MyFBcBrl3now1kgJps
 jqSdAzrdLjv8DaM4y+/00HIzGAoWPUrqT/8k3d7NF2A==
X-Gm-Gg: AR+sD11D7RttKtb/fQpT4hPbmrS/99EmM6ySV4dPQsx8omKRe0W6bU8bto4sLeWNfHQ
 H9vz/I1SB/p64IxgcEdyxYYUyN6DdNEf54cd4bSVFYxDUNuruvtVP8a4280tQNZ3lmBvRfopeCE
 UESjF6fmGsNgDrQj/ui7AuAgBiz5yESkvOaz2mKPXwoAvyTRGYQcOH/QiHDiWUlyFFF4vM0ivTC
 pLy1ZGnc3rjUDZtYMEoHYrMBuufFbSwJWP0AArsE6GOCza+5EhN5U3bySKEy4Kzm5JA+7tMeWKe
 zpAFPCKVQqN0j/1LZVESgEOyosGDIH3Y8LiRVQHAK+BDFA==
X-Received: by 2002:a17:907:fd18:b0:c05:3c55:ee86 with SMTP id
 a640c23a62f3a-c1f7225a27dmr169298866b.46.1785252157150; Tue, 28 Jul 2026
 08:22:37 -0700 (PDT)
MIME-Version: 1.0
References: <20260721184656.530230-1-richard.henderson@linaro.org>
 <20260721184656.530230-2-richard.henderson@linaro.org>
In-Reply-To: <20260721184656.530230-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 Jul 2026 16:22:22 +0100
X-Gm-Features: AUfX_mxhWliZ5mVtnr6G6oPZ7VfIJQgOC--WB17QteV_qNHvUT6iNtqCYExnMnY
Message-ID: <CAFEAcA-ztDb15wC6sc1FnNAEoM06CcrEHZduoCuqtVp11jpp6g@mail.gmail.com>
Subject: Re: [PATCH 01/20] target/arm: Remove DO_ZPZZ_FP from translate-sme.c
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x629.google.com
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

On Tue, 21 Jul 2026 at 19:49, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Expand the macro at each use site.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/translate-sve.c | 67 +++++++++++++++++++++++++++-------
>  1 file changed, 54 insertions(+), 13 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

