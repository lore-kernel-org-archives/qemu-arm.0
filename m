Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD30C606A320
	for <qemu-arm@archiver.kernel.org>; Fri, 23 Oct 2026 09:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=oqRMqC/q
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xKBCC-0008Rr-Vn; Fri, 23 Oct 2026 05:04:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xKBCB-0008RV-L9
 for qemu-arm@nongnu.org; Fri, 23 Oct 2026 05:04:15 -0400
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xKBCA-0004h4-8Y
 for qemu-arm@nongnu.org; Fri, 23 Oct 2026 05:04:15 -0400
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-8b0cf2c0785so6110317b3.3
 for <qemu-arm@nongnu.org>; Fri, 23 Oct 2026 02:04:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792746253; cv=none;
 d=google.com; s=arc-20260327;
 b=NdIiWThsokfzg4GfZvhCa+c0cpoQS8F7w3FqldV7Gt5DDBNi6QwNfia2iHRnmdrRtg
 rNpa5H07dg0famF6/ORwKzRA2NE4MoQTD0MGlFB8LES+fOCBOKU3g5XHt3ger96NO0Bm
 axwx3rWKU3r5rW8njzd3ZATnAgJGkzYRiH/LEBavgZa5ceaoUrmTlhLG0YMo4GyKCLnW
 wjXj/jJhjf220knJgBX+2UIa9KN1K5E/AEya87TuPiTdAp5wWzF3MIGmg8c0nBSkDNOY
 caPGLrN4H3wY9LQJQi8jID02cHKR6JTq6LcXK/kBDETs647MjDD8jwAoUxCDg6vHoqRU
 f54g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=Os6ZGdyP1xZgWKkKP2tEW6WxnVaIoC5joHapGphjUA4=;
 fh=kvYbPtJcibWaBfQGdU6jyR1GiQPeQeXIsH4GZlsycz8=;
 b=szTLl/t6l/AgcaJ57nrFweZmIxE/XEDxiVIjq83PDWJKOsjEuUi55mA+Xe8PKB0BjM
 sHlrBAb1ihro98gpLM5URmgx0Y2n6gWK8rbhSioxMlzF4XNGGbNXL5NVvFBd2xnpKd+Q
 HJf1rZY532yttdole53389R4jWTgs0oR+WY1n17anapgAQDRDtocMglCVtmg82U29HZO
 Z+QP3y6T79YlH+MAYmNpzirMhQzy8AmJgfCJV1dlUPB09nJJUgFVWUwd5pKezfl0XKo8
 V6kaWX36DPfixEVMqqNNtZs4SBKh4CqCXyMcLDKISjwIUrkgtpl5YtBkPTLQO8oOpEJI
 xgMA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1792746253; x=1793351053; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=Os6ZGdyP1xZgWKkKP2tEW6WxnVaIoC5joHapGphjUA4=;
 b=oqRMqC/qnmBAuhKoTDICwqyR4n3/L/gNFmnLC5LXdJdDpOlxEaqi5egnxn6ZdtNsql
 Kt5ULXVksOOV/++QJhmMPFNWHthbPRKn1S07X8ZH3hudwr3ICgrGzLchrgDqpvmKgfQj
 DPa8tPghgZNd+Z73649TiSbSxE7tG3+j0obHtq+jxNhxkAJ8rSVLKErCA8v0NWUhdig3
 DDhUqi6J1uFUxZ+QOlBl7ifta1Y/oI6Np3KS2bd8StD7ukvvKIhymcLoQ40z13n65DD8
 W3LWPj4GzNtSEmNNdVUrSyUnDS2mreGlT9zmvs9LrpcllgD5btQGJYPEGp12CZ1ej3b0
 oURA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792746253; x=1793351053;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=Os6ZGdyP1xZgWKkKP2tEW6WxnVaIoC5joHapGphjUA4=;
 b=0CHIj7gKnnpWK3P63hqSp2mBUOfC+8hKaRh2EWMQ7MVRVW3Ye7EkpTxQJ2AodvMXHF
 M6G+JirjwFMXiBYbNx81zZ8zjGSfw71rXCCQl5rFQvDAeX7rXYThqo257anc8vqGMz5W
 sgUY6MBUHA5LuqgRB/3ISE4+R9SPTHhLSiqRe+vqWIT6xS3Yj44QTxKrI5BkNDR+wQyq
 sJnS07CzAjxetkQm+0SjVIwttvJ3VhyjmBrDH8p1gfxZRM44HW3BW6mhGEaj085rSSfD
 PZlv+XrltBr09aQ6/xypyYYBP8nnnBKwmS2Wng3f1zf7HzuZmcSKq3CqLVI+efXiHZvY
 syqA==
X-Forwarded-Encrypted: i=1;
 AKwUvBwwNlSig7rS9grhzdUwRxdPWO/IZbqHWLcFLhK4Wx/ah/+eAZxXF9V/pTQF7zcWGSXbNsg5+8zUaw==@nongnu.org
X-Gm-Message-State: AFq9FYJU8zYxiCebypjZay1cqMzPThzeMM1/fqiDcG4UqczPnrrBQpPp
 QlIubbNllPZZBNQ2l025qcnD97msgk52E/gHbdiwWjBXQlGWY5a6eKl/anRQHXsjAYR3M0bGqoh
 5OfPpVafmTGg1zF3DxXpSpvXn1OCBuj2ePQkSZ6qNew==
X-Gm-Gg: AYBFou26d7yNX7QmClSOecQZpvEzPHFEce93mMAQWj9xn86LNEnQYmevM0bhE0PpwyF
 OK6PAHZusVmZDPG7yqj5BlDoS23Efuyzjctiho/OLz91lK55RBCbFupTwXoazbS6DcovoLMxZXk
 rEy1kTNFD1lmIwvyg2E0TzBdI6asvHZcECdml9sttSRkuBHd+xMbIce2dJ0DhBNPhZs339XiHwv
 KdU1gMwsE174dLa7R9isaQPx04sCj+Py3eMVyHa46CnqNswwsg7Awg2MyLp/g8X7ULPJSYrLgMF
 +HO9IVz/dyUybccTcksk/x6KDurHT2WZyEGt3szig7KON9KK6VyijBwJ3GtdBQKun1q/JKPDaB3
 bCYiRuGuDE98QXIW2/pG/GWa5vZCaJH21hQs3rKuSU+ADxM7JlBHXCabFG5eLTLG4PhSw1C66vq
 4T0+D6uEN4YeiMKD1qKBZi
X-Received: by 2002:a05:690c:d94:b0:8b0:df71:44d1 with SMTP id
 00721157ae682-8b157bc3377mr13355387b3.6.1792746252593; Fri, 23 Oct 2026
 02:04:12 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261020211529.99689-1-conti.manuele@gmail.com>
In-Reply-To: <20261020211529.99689-1-conti.manuele@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Oct 2026 10:04:01 +0100
X-Gm-Features: AclHuK8qDtXOuSISYR0ttUn5MaoQGNLKPegAsm20y0fZbW4OotFmm-JnTxvy1TI
Message-ID: <CAFEAcA-kevPYzVCMRXej27Z9ZK0FPneZFVjpwN30hS=WLAr20A@mail.gmail.com>
Subject: Re: [PATCH] hw/adc/stm32f2xx_adc: fix left-aligned conversion results
To: Manuele Conti <conti.manuele@gmail.com>
Cc: qemu-devel@nongnu.org, alistair@alistair23.me, qemu-arm@nongnu.org
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
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 20 Oct 2026 at 22:15, Manuele Conti <conti.manuele@gmail.com> wrote:
>
> Left-aligned regular conversion results must occupy bits [15:4],
> [15:6], or [15:8] for 12-, 10-, or 8-bit resolution respectively.
> At 6-bit resolution the result is aligned within a byte, in bits [7:2].
>
> The current single-bit shift and 0xFFF0 mask both misalign the result
> and discard significant sample bits. Select the shift according to RES
> and keep the existing right-aligned sample generation unchanged.
>
> Signed-off-by: Manuele Conti <conti.manuele@gmail.com>
> ---
>  hw/adc/stm32f2xx_adc.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)

Applied to target-arm.next, thanks. I expanded the comment
a little and added brackets round the "4 + 2 * resolution"
for clarity.

-- PMM

