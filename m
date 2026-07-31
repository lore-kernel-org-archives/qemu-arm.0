Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC3A0C54F54
	for <qemu-arm@archiver.kernel.org>; Fri, 31 Jul 2026 17:27:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wpr0f-0004DD-GE; Fri, 31 Jul 2026 13:27:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wpr0d-0004Cq-Nb
 for qemu-arm@nongnu.org; Fri, 31 Jul 2026 13:27:00 -0400
Received: from mail-yx1-xb132.google.com ([2607:f8b0:4864:20::b132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wpr0c-0004Ew-A9
 for qemu-arm@nongnu.org; Fri, 31 Jul 2026 13:26:59 -0400
Received: by mail-yx1-xb132.google.com with SMTP id
 956f58d0204a3-66899c7b57bso1686402d50.1
 for <qemu-arm@nongnu.org>; Fri, 31 Jul 2026 10:26:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785518817; cv=none;
 d=google.com; s=arc-20260327;
 b=jE7X5ejF1fdmmcR3jedm/RnizNWQEmPnyV0NkEhNTo6vxV9fWUnsvufA2ciyJwOOE0
 /wP62mSsLF6ILLIjlGcTghTQrt1bU4bH+muLcTQ/j0XhukxyuBN2LZJ2nsDmH80jAhb+
 MW/9BgqZd00wF/R8Wx+Xu4Ascg2/17d9ctV3gytvXVSnRzQBWUDMd4XePwLIkHq0CREb
 cNjD63wVM38jvSAzCwmX3aFnn0KgFj0VKVjsbLGC6OKg5eaBU33+zknYGpGLKXp7zGNN
 jFTzcYEo/5AVJ0hVcO4IMlLAIW8hba6Y1uhOc7olQYRcQEgRoQx97c+mm1YM6JdRuEh+
 jZNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=KuuowhP2UdDdnOWtUgrEsplMwd0+prZe4J3mAit1Okw=;
 fh=Jl4qVDxRAv+3SKrqs+ViVUdLFbMElExWvO0842mYGyM=;
 b=gDC7oJ/XLhfGm2OnGPPcFU0PhyVCODRI1mr8XIUMdFlITsMWiF4F+uwle2lQoFaHev
 T6sO5cfZtbd+/WxsBfhSOTFJWnqHwLOdnfaYs9KpINkj5mzNaPStUWaLaKN6OAm0CScg
 lElziwmuaTC2fC0s2HJcG/wgFCCZSGG1GZAHKGgHSGAHZFL4tnvUKP+ndQ/hkVnFivn4
 mwsbeHwrbYNTX7a7wsCET3SHOVoFsaaz5KhxKK57Z7bgAuIR3JF3Eki82rVF+gvS0qPl
 sWKQqcev3JBTEcPtRiM7SjkB4lb0WmVEfpOhfTEF1TC3H5+L6FGDfEh05R3MwAgN4+Nn
 Islw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1785518817; x=1786123617; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=KuuowhP2UdDdnOWtUgrEsplMwd0+prZe4J3mAit1Okw=;
 b=ae7Q54+szhFQKFUkyoJ3WeVvFuNujcPxTLheVKJvYm0Tluyt8c33WZ7M5VUUKNmp3o
 S0EBHYqSN/3J+fzkdQnHDlyCEYVGNcgrblB+HpgjdfX6o+v83ypAGKn6zp53ldNfSIUc
 kqkg8n6+T92SeqyfwrAyBzZ4fG7U1sKxMj+FE+DiWIqZ52clqPnjNmiZhi+2E+z/xWJx
 a5w0dlQRpP5lYfTw3qf4SD5ufwzA+SHmk4LPqrbbzl6arqQHRyw17GPGVc4eydhy5FAx
 zDt24NrYyzzJp52sNkFuuDQOIptV2wIzaBmrjv0/Q1ql0BYWprUWuTlEbzU+WLC40tBc
 4v+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785518817; x=1786123617;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=KuuowhP2UdDdnOWtUgrEsplMwd0+prZe4J3mAit1Okw=;
 b=Z2zQjn3GMhk2cvkqpbHATzCE8ZYbvH8Mpb8NrQMoGgkXGg16IGnKKNiBXQH94dgOLX
 AEegTTEV/xlYNLP2IXtQWFKU4WCXNTSL/UWL60YQAutZIvbJx+4Wb5ui0fLl8yKS5Z7F
 z+mVJL2BdReVCU51VXKc2iZu75Sh5L/saNjZQvuexGlKheRkImSNVwrjCHWhWmqsb6Re
 0+EyJeWDt0ysqUVuVOTyffF6QgLA3tqt21zjseGLpSf3RICyonrdpG7ILVGwluOWpudt
 7JcNRC9v4QyXU4jeEyMLLZDt/NWaQGXzOtJy6ntSxKp2/WJ++ozOBK5Cb7y7ugGX1mBR
 0XuQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RpgfkDuj6yaXP0eMgiKWeYqpxUUUS+AfNl32RA7kuMcC0nzyHM5PQMBhkq9xrPyJ7aKRhuoHIhYyQ==@nongnu.org
X-Gm-Message-State: AOJu0Yxa4QryEjADR9aVT0L6leAAdQymAZE63AOaH/qUhifxKcAAIaCy
 aui+BSSL2RDuH68v/I92QPKHJxuwaWm7WJblfwvBd6QnudcAC63H1jSYYWsUKJCAsbpxzuWQ5Lk
 u50vFXMfKu+D/2p8ZNdxmEEriYPQqNez7YtgtVjkUiA==
X-Gm-Gg: AR+sD11y8EblUB/qsUd5AhcQKPQAdJTRvTJTQm65OT7ia8wN94IYV56OmD9EDA45DxJ
 7RptzGJNL3c9DtBYuezCFNEJaYp4hms/VOFxAXgm6teZ7sUM/647BNN9nZROFBNmyBgxMmF9t75
 UA1YxUuuU9gKr7BU0NuUJvVXxT+MNovOP1LJCO3NBDyqvhi13dAZ0OL+D+mw72oOQOJwhteGseg
 4iV20Wv5pWu5e1Ec6upOTeGIz+Gxttf0UAjNW0RSPuIt35orrfiwsqdOZeEfCz4c0JqHMT+zbxm
 m/xz+L1LRtBgFOpgzjoGon7pKZ25DcT8MGqgq2nM5vLMsrYag4Tq/LzFp2k7dtN3Ty7kQ5fiVvt
 gDb3eUUupBJjs+HYx0YSdesoZTk/H
X-Received: by 2002:a05:690e:484d:b0:667:6919:897a with SMTP id
 956f58d0204a3-6694f17d7e3mr795128d50.25.1785518817107; Fri, 31 Jul 2026
 10:26:57 -0700 (PDT)
MIME-Version: 1.0
References: <20260724030616.76180-1-richard.henderson@linaro.org>
 <20260724030616.76180-6-richard.henderson@linaro.org>
In-Reply-To: <20260724030616.76180-6-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 31 Jul 2026 18:26:45 +0100
X-Gm-Features: AUfX_mwqS7jehq9hJGk8fgiV1fY2kBzARIX6t7PaSuTp2SoMhZBir5V_tDKOUKE
Message-ID: <CAFEAcA9BLUaK9p-MbBP+6qm2vAtd70hdkfXcAovPyw8m5bg6Kw@mail.gmail.com>
Subject: Re: [PATCH 5/6] target/arm: Set fgt in cpregs for FGWTE3
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb132.google.com
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

On Fri, 24 Jul 2026 at 04:06, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpregs-gcs.c |  5 +++--
>  target/arm/helper.c     | 47 ++++++++++++++++++++++-------------------
>  2 files changed, 28 insertions(+), 24 deletions(-)

You missed setting fgt for MECID_RL_A_EL3.

Otherwise

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

