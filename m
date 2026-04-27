Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18189FF8861
	for <qemu-arm@archiver.kernel.org>; Mon, 27 Apr 2026 09:54:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wHIf4-0005qY-GD; Mon, 27 Apr 2026 05:53:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wHIes-0005pf-0Q
 for qemu-arm@nongnu.org; Mon, 27 Apr 2026 05:53:44 -0400
Received: from mail-yx1-xb12e.google.com ([2607:f8b0:4864:20::b12e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wHIep-0006iZ-Iw
 for qemu-arm@nongnu.org; Mon, 27 Apr 2026 05:53:40 -0400
Received: by mail-yx1-xb12e.google.com with SMTP id
 956f58d0204a3-64eaf8aa893so7950906d50.3
 for <qemu-arm@nongnu.org>; Mon, 27 Apr 2026 02:53:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777283617; cv=none;
 d=google.com; s=arc-20240605;
 b=XpZuvqAUAvJFeONnbSS2tnunYJpom/+PdaAv+BjEhjhPR0Uoi/zsXsGWeVed6Wh7wJ
 KNAwrHYuWTfXCfqsbsU5+A1ZJQrFIJmzNTfBQYXRtZ3m5g1D30EF2zMOEuDlH663rEpS
 2G6waTxBFTXBYrsxKU2LCWsrEeHRIhJQ7mxQiUGFeSbfEuYbQ5O2q2H/eCIpo9nveyxF
 AzhGaFCKAy/fjrXhEG1qMC4O7YFu/+xKMdjoQhX/jVi+Ko/A2ZZSh7dzHiSv8TuqG4pT
 gDSL36R3gewr0cOobacqVtkT0GJFzqhXeP/ms9b78ixsJ7ZN/VbpuGYuddhbvJ39d95r
 e5SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=d/nDOXfyKijUgvu8fbHWG7JnOWshdqHeOY15VvLOjsM=;
 fh=w724tKZqc4RlQPSQhoM4qrOW+JunsvwCLa+ULA7MWww=;
 b=RxmdF1Tfse0NVqVGts8NLN2JKapfQrZEjskBCZgFUELgT+WOQDnkDmXw+qGdSncR1y
 ucvcw+0UKYQ8tB7N8AsabBxcWXgEMwPlPLl14ctoyfMsXZcl8R2+KyHt5oKN3ipX2kix
 4CI/MA3UFHNrfUfD5fYXkNtVdQckdFRHxpY4ZanR93WdPlCq+HYqCUk9igzMWRug1Br8
 +WpK+ykkaQ0rd877/UCJlcq16ZgK32VaZsaNEPE6Hf4K2YOoyaNmzqM1nHpk4o24CVmW
 da8ED5TwfSI+rSz1xzkxZqSklnSNsHk2TX6mAvNrE+3s1asX5szudHDAXw0gqfsA2+xP
 C23g==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777283617; x=1777888417; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=d/nDOXfyKijUgvu8fbHWG7JnOWshdqHeOY15VvLOjsM=;
 b=nd8klbQDHN8bBdBnempqUZt7681Rz03TqDaAkd4XOfyf+nafbWqABNhheRl7U3t02i
 MURwMOUEJ0tEoT7pRlpnwfUXa/ygKYNronyLrskTx2i78ofifNoyTMEoA3B5TIo3HLN1
 +9EYaF78r8wxetKh1so/Z+L0t4e0CbCZY0yrFlprk76d+R0nnAmMgsj+5O751Azkp6ep
 bOf9TdsCCDPcX5T3/3gzI/Wmd2V513849sFLjmK0CKv49NhC5wn/E8lTVZhKXA+UVWya
 WbsFnPPaUTIO7SovS+tTsTm4HQLWneFZ8H0cI5lNoqBFPJqVnJ0uOXnhyrddG8b5UzlF
 HTmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777283617; x=1777888417;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d/nDOXfyKijUgvu8fbHWG7JnOWshdqHeOY15VvLOjsM=;
 b=F9TFkL3uwrR3bmKpXk04s7xNiFXjH+jB3ecv2sWrE9ROifso4DDVbbxQUk2NKS9GDa
 uugDgwr483GVW4bkTLqzpdoq8qbLsmYfoJSXpC6ZJQIkSdreCThCregVyeAZyKrDulAR
 9xBxrXcrwVxjlNieWUd89AN1i4cQ5zQb9uAX79j95JIMzknhnWXxicjE15GdBoj43XG5
 4lk5zkMkEw55iiHM1sfx1RUgzdqhMNT5xFXrdA7O6wb7uDw7pOS4iib3UA4T/Oq6DRl4
 qSnVYGdxP31cUiaRPz+ogfrwxXKtLtnPiVTi66yWYONsjvxcxlsS08+s8I8Q1dTK1IBY
 tKLw==
X-Forwarded-Encrypted: i=1;
 AFNElJ8z+PeAo2DmEm+k2+JV3ITAnjtqOhkhWihXsi6kwiTaWa4VfCwPIb+rQUGACyr+FC96JuFnJUJuvw==@nongnu.org
X-Gm-Message-State: AOJu0Yw1wTDPBxwFXIGamDC2k1qjr5pIPTZR2whOFMNEdubJt3bi2K7B
 Cwa1c+rlSKoFa5m4QBAv8N0Xk2ZBQMbADQWkEcA0J4MYRE1byc7JQBIjjGYNjJjKFbaumL4FkrT
 onF5ocvlDjNylJPltKUJdiJPRShmGrC17sQ/Twct/LQ==
X-Gm-Gg: AeBDiessb37v+2Cex7vBmrcPMg/JvDOEfP/7XNkzeqtGQy4tT74YX+w8WVPpUshPgZo
 UH9n0DCzpFz+xlxxhxqMLQc5KEWXg/nsrFA5NBnGSkvUTtYM245DM+woHkUqUqTxqrg7ipyoRDO
 WZwIj5NQbWXdrSzC0a2zRTFjIdoZChFLewVGPG6bK7IzWpgkggqKnbBLWOrwsxR6wp1ZScwZASu
 +AlhLjrBtrVXdiKW9gzLTCBiDnvBwCvxDGdiHhvA0/nQNGKK6fVahp6mFbqKR/3P7MkNmDd68Nr
 7nZz3oStiYD2FaZmgOYhSsSjah4DfZFMw6bWD66KiRmysLZqn3NrEwVEIv6P0JQROz7O9m5G+FG
 byA==
X-Received: by 2002:a05:690e:1282:b0:651:c29e:f0b0 with SMTP id
 956f58d0204a3-653107f0ad9mr39115805d50.4.1777283617620; Mon, 27 Apr 2026
 02:53:37 -0700 (PDT)
MIME-Version: 1.0
References: <20260420162114.308519-1-osama.abdelkader@gmail.com>
In-Reply-To: <20260420162114.308519-1-osama.abdelkader@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 27 Apr 2026 10:53:26 +0100
X-Gm-Features: AQROBzAE4t_ZXEa8YFvZzm_2OWnRIwhP16mvAAH2-G0BLGlQMvupEBJjc8PBIBQ
Message-ID: <CAFEAcA_29onASJ7bOs6jFbM9Mmj_X-SrJ85hSWxCOa-4WbFA8g@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/raspi4b: NOP all DTB nodes when removing
 unimplemented devices
To: Osama Abdelkader <osama.abdelkader@gmail.com>
Cc: qemu-devel@nongnu.org, "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12e.google.com
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

On Mon, 20 Apr 2026 at 17:21, Osama Abdelkader
<osama.abdelkader@gmail.com> wrote:
>
> fdt_node_offset_by_compatible(fdt, -1, compat) only finds the first match.
> If the blob has more than one node with the same compatible string, extra
> nodes will remain active. using the same loop as imx8mp-evk.c
>
> Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
> ---

I wondered about whether it would be worth abstracting this
out into a helper function, but it looks like at the moment
only this raspi code and the imx8mp-evk do this. If we get
more places we want this we might do that, but not worth
it for two.

Applied to target-arm.next, thanks.

-- PMM

