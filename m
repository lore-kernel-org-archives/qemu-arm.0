Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCAD7C54F4D
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Jul 2026 16:23:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1woka9-0003vy-Vq; Tue, 28 Jul 2026 12:23:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1woka8-0003vJ-NF
 for qemu-arm@nongnu.org; Tue, 28 Jul 2026 12:23:04 -0400
Received: from mail-yx1-xb131.google.com ([2607:f8b0:4864:20::b131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1woka7-0002js-Cn
 for qemu-arm@nongnu.org; Tue, 28 Jul 2026 12:23:04 -0400
Received: by mail-yx1-xb131.google.com with SMTP id
 956f58d0204a3-66892c81725so4688139d50.2
 for <qemu-arm@nongnu.org>; Tue, 28 Jul 2026 09:23:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785255782; cv=none;
 d=google.com; s=arc-20260327;
 b=jvxIRPmTjpACOLZBQShl1oOZip92k5JS2CsTHkh2y/oxtjPlGhMIU8BK1LfFc/nDoU
 HUs1XcyH/vQ+QT1GqFSvPMEHBs9+j5EiIaqDyWA/p2jDxjpZ/6xubg5xxMmLhWYdOxWu
 CdfSCEIsNLSGTxD+hYPtkMRaXjZcf+CD6oQ+Oi2bYzc2wQpkN1q6ZUYr0Ns++IQaf0lr
 49FXFo6opnvWnrWRhDtzV2v1qgH7OGtTJ7Pq1cu3ZCXyrt7K1zWaI2SXKjW8bC904xAF
 4q6pyjLeAxbV+LyJPxr6H+loxRFp41LIWcl3hDY5vom8NegCdvmZsgBW/hceaXJ+uTPh
 tgIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=qweYkEqepW4QL8jqG+P1ypqAp57nlLvwSADpwPhS5qo=;
 fh=2kFS6fE0FPpX0XNiuRphBh/TS7S3UP0LnLF1Uhl2CvU=;
 b=XQ1zVHdj0DiTuyRKOXvRkQ0TRqds9P08jqZw48r7+nn994eXhyxwGTgOyfWzkEZzLg
 OZr/20SSiFf1JicWRNJxZ/4ZH8PU51f8PktfRdnrDhaiTVljiAFeIA3ft2KIpFvPPU1i
 6QAP+fRp+rly2f1RP+sP7CsoK8a4I0sbETBGLisF6mjXdM2QC0A/abkg6R63fMLU4jgj
 CBOkT/MdcIqZbx02W6ENkuJ+1oQZWWaAEVRqVOsyun6hIvzeNq/us9Ycq38lNFUrY5lq
 5r77Q60zMq5IInU5rMzHUE+Pd+jMvKDPHo4+aav95fOqJH1FSPIX41A+qeWaSfYep+Lw
 494A==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1785255782; x=1785860582; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=qweYkEqepW4QL8jqG+P1ypqAp57nlLvwSADpwPhS5qo=;
 b=QZc+jdH6/Y1XA+mTPNX3w9c/O4yotTnuoJlV+CStYIoFe9JGtPVxB6SAa3qx99qcAi
 O917NTB7wgqK9kcF1ADwtflw+bmGnjEWJVS9IPeNlDGHpvicP7jKI6vNtQtSAr0CrERy
 AG0dfeS+BZRLca1OVa6fo6kxFeu2WKbZMiuDZLF3NiRUi1QFSkggbrRBCUht/JgB9JIj
 voOxRLFm8NLLtphsjoSDl415TnhuBThfvCB51Acb50iXPtqHVNqRNVk7qfAVXYhA1yFz
 WpXWKlKFmBFCigOxw0YFjsyIUNgehcYMx5sTe7h4zp1PUuCKKFu/ScLlsmij3/iBopMv
 zeoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785255782; x=1785860582;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=qweYkEqepW4QL8jqG+P1ypqAp57nlLvwSADpwPhS5qo=;
 b=kl3wZaOdWXP6hGg7eNqkCLfZ/a0aAbEes6qQE/b65y3V90nFpjzB2g6V+5KxTmKKg2
 498+l0BkJH6R3KQyRTrgRxHhpC3vmXKLbnJJ4t/jiHd0slWHH/vld5mwKx3+4jkHKoAS
 urO6yf2K84RVDuva676ZQikYRKO6V+F3ZOQUfikaK/oSZD2Sx/S9CwbK6i3u1xwZ/S5K
 Tmk4dkC1gBFj5fFDRA9sZkxp6S+KtHjQclN3tlNPPxp5pJxGpLvu4dvi44c32YwDjsgX
 LLt2J3Y7bOEm4B+6reZhyxpr7YDF3CEQDi5i7iQdaX1x5tctAG+5CHQQNg3QHmDe0JRy
 rOVQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RqEh3SLIqGRhJkSkaNvPvQ//9BDqGbtlBRxDBC2ffKUSImvF/yHVde0TKhYSWDpc/zHnx3YfFCYKA==@nongnu.org
X-Gm-Message-State: AOJu0YwYmiWFuURQPRYfRl0DZ9BIRvBsJEVuZod9+0oEr2B9HjIzWUVP
 vRjarhT5AOGnhHaPqrq+FiISMl++g/ku2j/JgcVfGipJ7fu6itLfi8bfBcz+rV8AAD/DGbhY10s
 AyRhyvX3bXL2vuq54+dfaxY240ElMCC8oOfpG8HYP+g==
X-Gm-Gg: AR+sD125SsZfaoK8M9uh4ttAXhVheJ4ws4AYxO1CEV28wVwnm8cUtfppb07T8UPyrra
 weA9JYTgBIaBM5bEl8lfI5Z1mLP0tfqVzy8NGWWoCarwj+s1GHBoL8oPd9UwkaJBqv6rCPS7px3
 mT62Sg5FIDfGdipTfLdtDXXFtl4OS7qTew+qhqP2M7dzsdu2v2k6k7TfADkmlUe7FspgA0Zu1bx
 WyYDgwAGNK3f+HuxWmVoR39N8EEtHnz1MpdPLbryYk5Nampbiahuk+//u4qE9+trvawjSDyFfXr
 HDoIuCAyXlPECjAAgOdRh/D+wmvCReqSN1LWyc9ptcQf1g==
X-Received: by 2002:a05:690e:2017:b0:667:8b90:2ee9 with SMTP id
 956f58d0204a3-6690583a155mr881924d50.100.1785255782031; Tue, 28 Jul 2026
 09:23:02 -0700 (PDT)
MIME-Version: 1.0
References: <20260721184656.530230-1-richard.henderson@linaro.org>
 <20260721184656.530230-21-richard.henderson@linaro.org>
In-Reply-To: <20260721184656.530230-21-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 Jul 2026 17:22:50 +0100
X-Gm-Features: AUfX_mx8r9MWwT68D7avA5fKxzJj87ibJPrs8X3WIf34MvUWKzg-PRn5K6rmOAg
Message-ID: <CAFEAcA92eY8PGp+9_eLZMfV+n_-T2TJ_mLe7Wzedixz67jB5bA@mail.gmail.com>
Subject: Re: [PATCH 20/20] target/arm: Enable FEAT_SVE_AES2 for -cpu max
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b131;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb131.google.com
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

On Tue, 21 Jul 2026 at 19:51, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/aarch64/elfload.c  | 1 +
>  target/arm/tcg/cpu64.c        | 2 +-
>  docs/system/arm/emulation.rst | 1 +
>  3 files changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

