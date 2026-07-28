Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99922C53219
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Jul 2026 13:26:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wohok-0005YK-I6; Tue, 28 Jul 2026 09:25:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wohoh-0005Wj-6l
 for qemu-arm@nongnu.org; Tue, 28 Jul 2026 09:25:56 -0400
Received: from mail-yx1-xb133.google.com ([2607:f8b0:4864:20::b133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wohof-0004vn-4g
 for qemu-arm@nongnu.org; Tue, 28 Jul 2026 09:25:54 -0400
Received: by mail-yx1-xb133.google.com with SMTP id
 956f58d0204a3-6611669cd16so5068105d50.0
 for <qemu-arm@nongnu.org>; Tue, 28 Jul 2026 06:25:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785245152; cv=none;
 d=google.com; s=arc-20260327;
 b=VesvfpLw9+nhq//+gfZFe+4g+R1kIB/KMgCM0SkBz1gR4HESVi0xVl/Yg+6ro99dXq
 WBJ1X9wNgZN9ve7O+oaoXmM1B9OZ1tK5OFbjMN3jRKAIfDUkSEuJAmMasaw1Y4gQocP0
 8g33i7PxaHtVZMnv0PUSk2hKnaNiYl/tXJ4Qm8QYKp2L0XRyR9Zp6cCg7+WIIhlqBfof
 2gBLw4rlETDvB62kzR9pFr1uz5brStIbiwOkJ+cYJ385N1r9RvBlM6Y+3JWyNDg6+wkH
 eX/ekImqU6l0fkW65YEm3qXoPaBy3Qi2lvsaLneR5ec5QTBzxf5vijNeKrBib8euRgGH
 a+oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=wQJQabbDqUzdwuQzBKj6QZFRwVeMmnQGEAoBsN5k8iw=;
 fh=t2JGGmOJ1V4yptT5/I0Eq1LE0iIxwrhCFmXdmoGUMcg=;
 b=c1IzGOY0w0vteijyx2DH3WLK7o8sqincBAeaA5JBvKvzqwYhhgj0MUMN8yZGf2RBmU
 P5y2hyqT0gerUaJvo4SsrGur5ldUHB8DZ1hFksaQPOhBZoMcqb95YXHd2DPDul5IZSJo
 /7lEa45AQYiQGTtEaKkrM6RKO51YoR4CyOZMKuRmnWV4TWsHCR1YsR88H8s26rNYW2YI
 PkXhk5/aTcMys/hKN6iBUTPB3sA0VhlNZEbr27TGPBOC/Gm5g1LCEEEynnO1ZQUaoaaZ
 2/KqinkjW4eo28zwLFIJjxmY6fZA808gpKDPEX51A0j9T8jm4Vf26+5iLegLFff1UGZn
 35NA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1785245152; x=1785849952; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=wQJQabbDqUzdwuQzBKj6QZFRwVeMmnQGEAoBsN5k8iw=;
 b=Y4nA1cMwJBVM1jweIl4Y8bTvk3ktfiddyajUooxo6BzfrEz2wK0/uqsv2qPSATuDaf
 uoY48ZqeTRL+sumUz8nDvgAD1IgKQqnWLvOljX/927cgbp26jHt7FIQkU4FiHI/4TQRh
 bcQA8MSPfLhNym25CcCK/qDnz9BV7lPpQEssmALB1c0TfTbSTD7qj4Yc3fk61bXOGbJr
 rxKduCF0RSlmAGBiaHF94BptWy9YRfPiSx4GRJVtczVKa+jXWveyhW8WudKHN+RoamjV
 oBWITkzlhTXaOlyZ9uf2rOOb5o1rsXW33rePrUcO2KKDBbJ7H/g6aFJPmylCUIkUFvBt
 naiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785245152; x=1785849952;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=wQJQabbDqUzdwuQzBKj6QZFRwVeMmnQGEAoBsN5k8iw=;
 b=BPqTK/stCL7/Oxdi9u6VvmpA40ttSMjz3A6RWtV0aLi/P+rmiBoMCNuMMTue/2578p
 SgnohAf0cdUOhXw2QogydcJVqZtHkqYrKRNokJHSpHazchzkLSEaaQDxq2VJCL4ZiD/t
 N//OYrHDQsJPwSfSsBnp/xEhYKtJfI0k+HFExIrcw+folQPgwtlInKbJRSoyMqCsnogy
 c8OZaE90Fv3s3V0NRyGFDU+PorHtmf9VUIFfHDDB9Zv5wt8mpsNYC5mz+IZw/zffz33m
 PhMN+bZm/Q7pUJS3GpSJ1uNkog6bd0xz9919v0u5jvJsvSvuIY5zXwpXDq0Tbpg+14rT
 dw7w==
X-Forwarded-Encrypted: i=1;
 AHgh+Rrh9JirgSiOCFsirFoEkuAwFPrOVpe5KkndQ10s+yjD//QSxs5nRPLFddwnPYw3zbp7v8lgyK73jw==@nongnu.org
X-Gm-Message-State: AOJu0YwEAPkfnvFhOsh5HjhwOZRVeSe9ezOwXS4QL9XWbeafj8iP2Nd/
 E2jO8YymPQS8DPxmZk3lQyPhabyh/CGymYuoCRL1Z6O7TocI8/zybv9vARDaiLr+LpvMJi+u+RR
 oBrRE0MNouosLpCW26FL2op40G4FPNM6RDHhV+5Db21a4+9MO8VrK
X-Gm-Gg: AR+sD11DHTfo7IdhQj+aq0d1Gdgm2utJvTrk4syzCTyXUKBO4dfi9zWSXO65CTi4rVv
 O9RaGIeG4p0Ydpl7ma+UiREJdSwkv6+VwUJ7iIEN8Jylh+ShMA3SpPr4ICCV3pgtecovN+ZpzNo
 CBGnYWoKas446qCdmqtCBh+pJEBlX19r4t9RqqU2TU8Xkl0CFhTE3G9VZVcmbbj3dJ7unUrVT+S
 083DIG/CjQvhmpHnhcQ+zov4FDtSmIE2wjuURf9ueKmc2UUp1bjuTjYHR+eDn5X+Y26Bni144Jz
 sDgyjIIuqU005EW2C0a4d+2y+NH0PDySpo81t5flFMWGzA==
X-Received: by 2002:a05:690e:108a:20b0:665:31c:90a0 with SMTP id
 956f58d0204a3-6690549079cmr684948d50.14.1785245151731; Tue, 28 Jul 2026
 06:25:51 -0700 (PDT)
MIME-Version: 1.0
References: <20260713230244.70174-1-richard.henderson@linaro.org>
 <20260713230244.70174-11-richard.henderson@linaro.org>
In-Reply-To: <20260713230244.70174-11-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 Jul 2026 14:25:37 +0100
X-Gm-Features: AUfX_mynhzXFLl4e53lGaLokcsgMtCqn0gW0wpZMIyjFJZ4e2I_A9hUCa8s8Cj8
Message-ID: <CAFEAcA8Ss9FmUS9BmixLmBn28u1VAY8dHruDDT+UqZ+CREKXcA@mail.gmail.com>
Subject: Re: [PATCH 10/10] target/arm: Enable FEAT_SME_TMOP for -cpu max
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb133.google.com
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

On Tue, 14 Jul 2026 at 00:03, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/aarch64/elfload.c  | 1 +
>  target/arm/tcg/cpu64.c        | 3 ++-
>  docs/system/arm/emulation.rst | 1 +
>  3 files changed, 4 insertions(+), 1 deletion(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

