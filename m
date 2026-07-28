Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3040CC54F4C
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Jul 2026 13:12:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wohb2-00082x-22; Tue, 28 Jul 2026 09:11:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wohaz-0007tc-KE
 for qemu-arm@nongnu.org; Tue, 28 Jul 2026 09:11:45 -0400
Received: from mail-yx1-xb129.google.com ([2607:f8b0:4864:20::b129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wohay-00024p-7d
 for qemu-arm@nongnu.org; Tue, 28 Jul 2026 09:11:45 -0400
Received: by mail-yx1-xb129.google.com with SMTP id
 956f58d0204a3-66893db7bccso5118072d50.1
 for <qemu-arm@nongnu.org>; Tue, 28 Jul 2026 06:11:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785244303; cv=none;
 d=google.com; s=arc-20260327;
 b=iCYcinV+oh1U99m6coRdqGZcOFXVO0wrh2JG6EMdG0QmYRQBY9/fzwups/NhNwldUY
 DMT4giSrcJR6u0oBpTZvHRFU+e+jo8i0UnTVWLQL5ZaxTPkCE5ZPUmh82ap9tPQAkGUV
 0lZYlv0UxAXDrFMxu5/On3Q1mnapkSFan6JDoShUm81YtQZagT5edNIQ9pMYpOGfnuyE
 LQSVT4LbAOpZrg8MeuZpJO3bgc5dXfe8rrgm7L5ZBuwjcWEDzoNNbXASpudxznAT3S6j
 Ap1wANmwf/ednED33Hs7SlRErwiIg++1J++FX8M6cajjJoRyLNr07FQAfm6jwyu/3FUE
 AQCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=a6jqDiSXmZ0oLtZlh//8RGxMxFKhK2e6v8igUwMmNvQ=;
 fh=6TC2gAiMd5ouUx3L0C/4pT/qXu1yBD6Q/lbpAncZjUY=;
 b=nCv6H1WDZnZ2gq7SRO/98xmUa0FJNophg+kaauc7GQN4rubYmKTMLEFw+cZMIeb2Fg
 BkzZscCYzspP/UhEdTkkSLwDJte/5v3LBcQjCaOSx2E6rFS2KOzfXqUAbEKgijKZvDxK
 SXXMt33dg3YIwg2d2co8DdCWfMq64VXXuzy1aebKQGLhCTQoKD8ufpTYXzs4mUJB195L
 eBj+E2Y7Cd9x9XW8ZjZMlTC3YvhpcGLEiysRicguBgOv1E75IpgyF8EGqm+4VqJpJbPo
 HBXSYpY+b+TlthnTbLVJtps4M+KmN/8KkSio0zWZY47GC+726SQH3UjecFmoMisZvuVg
 Bl7Q==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1785244303; x=1785849103; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=a6jqDiSXmZ0oLtZlh//8RGxMxFKhK2e6v8igUwMmNvQ=;
 b=EawQFhX2xeaHwFEmLKaPNxcvPdtoQKP3+NVkRMIOWRMoMnr7/sTDuqJHZ352y/rvDn
 24T2SMgN/Q4PBwfYnaYDV6wSm8UzR4yt3fc3EbLIHUS/y9N+0AQzds//tsQPkROdQ3bR
 zolW0+ujtcr0Dz5ZPj8nlpLka2O81esg5aHNZPdUPiHpcusCZmcWbp6nzpGffAcnLykQ
 gtzcEy8VwKS/dkGEqIIVgDecckWDE29Aab1ERqeayq7ScO4aYCjdbavIulgx7zt01S8O
 um1h6qw/7KDhxtwQtgp8r83rvzuZSsg8KDW0vrWUy3YBiRnKZ1lSR8Ne9j5E4AvRP0Qc
 B2Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785244303; x=1785849103;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=a6jqDiSXmZ0oLtZlh//8RGxMxFKhK2e6v8igUwMmNvQ=;
 b=ZtcyAgtZXbC0TbO2z6Md1MHTVtocxhUTgdZdWwtC27itxInbu9+IudDofW/gsNme2v
 DkCWKZPKatxh2PJsUrkkvRdBtw+HRPwXZmP4e16/93Puw5iLvvHC4WX9V86L5DLa22YK
 xl92kaPAQqlU3+Zatx5bf/OYgzMN7TZDrGLvMiQ4Jn7whWsrdv0KeikUpn3IX/5OeOkM
 qaPsZv2UH6GUMsxpViStx6K8dpugT+YWbyipmuua8q4tQSPigwvjWMDjWBLjX2bLUdgC
 7iIIflW5lLpppAkzMBUDsX9eEIG7LrxBpC9/lkgIFHwtQ+RRjkpHJnaKVrD38Y0u3tO1
 f2CQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RrKgn24UE+g21VUg0b9DJN6DmeAhMIdmKWLZk83b+LBJklzgEGhnXhiNjJNCjpvyD5j7olgmjEJgQ==@nongnu.org
X-Gm-Message-State: AOJu0Yw0arkyTzt8mEhzpq1f3Qr8nBHpmHDvCJA4lrg0CKjOqjUlHn7L
 EUZY+cu4DeWI9Osu5x9+yYLH3c1ThHLxH5m/DZoWAlJ7phGw/6tfW2b3/ZdmbEOgThZIngDOORU
 oQ0sEwpbpiZpyaZofwkXP42xKAnF/SaB73r7EU5sEug==
X-Gm-Gg: AR+sD12a3UDcV842eP/zwNx+UwOEKvf4k+VorUIMiwruyxoaw4YrP1EKGsOttOaDtHB
 Ha3KNmMvryYxCC+u115r9uDyWz3VoqQ3UAGt80Kj1VYsdTY0KlkYXp/0gePxOPVN5N/f8e+A6ab
 6gCGEVB7tSx+i1AEpKwyqcIV7HkdjJbqYPF6StiMIsOVDql5d+M0M8AHdVfFd/DXjAY6Y9dXMi9
 ED2B3rOikleU90Ek97SQyxIxtovYm07Hf4gWeQqBSUtpiWPovJqomsWUTM3UYtdRQf+jm1vobYn
 pWevPAMGfyY9jNxLcd4YNvWNv/ZtUK1jXIvYquIK/EBE4YWLvXw6OHT3
X-Received: by 2002:a05:690e:bcb:b0:664:dbd0:23b7 with SMTP id
 956f58d0204a3-6690545d1acmr846325d50.9.1785244302959; Tue, 28 Jul 2026
 06:11:42 -0700 (PDT)
MIME-Version: 1.0
References: <20260713230244.70174-1-richard.henderson@linaro.org>
 <20260713230244.70174-6-richard.henderson@linaro.org>
In-Reply-To: <20260713230244.70174-6-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 Jul 2026 14:11:31 +0100
X-Gm-Features: AUfX_mxxFkOIC6MZsjDIOA0CziM0GzD6jxojUbakNuYSWRe_PX7rIYTK2N5KPs4
Message-ID: <CAFEAcA-j_RnMrL0KfDiu3Qh2aB3nMxSQHQcFc79GetzLJXRntA@mail.gmail.com>
Subject: Re: [PATCH 05/10] target/arm: Implement FTMOPA (widening, 2-way, FP16
 to FP32)
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb129.google.com
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
>  target/arm/tcg/helper-sme-defs.h | 1 +
>  target/arm/tcg/sme_helper.c      | 6 ++++++
>  target/arm/tcg/translate-sme.c   | 2 ++
>  target/arm/tcg/sme.decode        | 1 +
>  4 files changed, 10 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

