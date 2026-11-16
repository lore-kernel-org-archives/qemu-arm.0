Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 874CE606A31C
	for <qemu-arm@archiver.kernel.org>; Mon, 16 Nov 2026 09:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=D0aT8Z3x
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xStBd-0007di-Sk; Mon, 16 Nov 2026 04:39:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xStBU-0007UO-RT
 for qemu-arm@nongnu.org; Mon, 16 Nov 2026 04:39:33 -0500
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xStBS-0007ic-FQ
 for qemu-arm@nongnu.org; Mon, 16 Nov 2026 04:39:32 -0500
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-8b4cd576f2aso7228937b3.0
 for <qemu-arm@nongnu.org>; Mon, 16 Nov 2026 01:39:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794821969; cv=none;
 d=google.com; s=arc-20260327;
 b=gERimx5M5w0hnrxwr6h22dk8kMmYOWaBxqyqd8ukT/kxK6Rg1gn44s1jBWIQAzMLe0
 lEMukNe4zcf7peJUofOQznMrLLzeMJwgL3mezEMYq2rrZz9PJLOHAAxvap1FfX38B35G
 5refIDtsWvPtitrpn9bJemiaFj/P4evU4423WFSkJt6QD1vwDJ1kOHt/bGB4cyGQbKgh
 xYG36k5JjHNDP9elzhC7vZA9arXm5lJnYMMy313NLAQT518EcP0sG96p+oDTUK8EFdb3
 OxVCdVoJ2xqdIrZqt2ts0k7I7b0QdhfYnAtLNNGzoIvgxYpWcoeB+ivaduXqbs9V+kXy
 1LCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=y0CCCDmrkaACLJwcZ4fedUr0rieWoTSauijnC1Ky1us=;
 fh=VL8L5U16vsxZs7Od4bPFGG7G2MYJOyhBcABk6DHK9Kk=;
 b=ONdfk+MlDfDo7XtQMirDs2+N5Asti973uueY0QH2/J3UmKmTSZQxL9YYeJAcpGzYWW
 bMz6bjMOCaXPtmwMGY5C7hEw35VBwbLYtFUt/7m6k4HW1yaqlHC/I2v1Xx7z7ZMBAUM4
 D9E34POVGLaq2uUSs9Q+CWlC4lS8cZqsqIVzEkfQyGdX1inLCO7giFZI9m1XEt3NhG1j
 fYiEJwq0Pd2Jkxc8tZ0lDgjfaZSIswsUv2uUh8mV/29vAdkm5GvTGk5xAoHpwj4Qywtr
 q+l2rj0arV3cmyMw3heYH1h/DhxJJQm4wZoun8qWg5Hqs/LL6kJNvjWMdorBhJoKdSS3
 FAKw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1794821969; x=1795426769; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=y0CCCDmrkaACLJwcZ4fedUr0rieWoTSauijnC1Ky1us=;
 b=D0aT8Z3xnKCykBAu3GQHIv5e6o2AkbtwUYs5Sw0mtUc7DCLf0cExvG0fj5+X826VDL
 Z5rPBp/kpXGCwOhWwxXWgRH4xOQqBe/xGPXgd0KCRB7SCDLYNu7018NkxsKLBqBWpbj5
 rn1WKaPLeiKmqgQskxXI46jzZjC19kJz5VboPB8JDY+y6tBu+EkFyNuc9OefAV0iGq7r
 TbmkFpeLfi/v8/YdFksYum5Q+WR0gbvX83ZW01SPcs2V9jpMcyOQDTg/Fz21oguLCSpn
 RRvMmaw1xva4yufQxtv3HiXrQZ8pFUuzV041SWfI4l3n0qlDcImLME19X6HNhXxfzrlX
 TpkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794821969; x=1795426769;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=y0CCCDmrkaACLJwcZ4fedUr0rieWoTSauijnC1Ky1us=;
 b=NKeMbar254FiIuPCnqNCHQVvWsdBYtkIyH2iFf8e8QVL3eg3CMdyt5gfc606kLTj7o
 cbjlRFhbImsS3lhANlBgfWTZONHshx2puQ8bdUG1LBp6W6BOUf5TTyVXQGTkPbpo/ucK
 1s+UuHbAN+pNs8AKiOc1eh6E0UqZ1Sqhv9qoA5zgNguKKdI9v6q7pXoVhNMApgtIoJ0o
 gmSTCUhSzHvL0w5qXMQ5CsWpHFQlzhrs5XMFkkUnqhcXSN4o/djByWNHVW1WoLodsL5x
 d/+apO9uDXKt/bgXHCoaHpKtlejKRTCbaXgWR1OK2POTCrvNEwiUR2miVgYZ+LbZVq4H
 mQpg==
X-Forwarded-Encrypted: i=1;
 AL+hErGY4X+Ovbwqwq/biypPUpZa7DZYD5Usx2BBrUfY3b5pNMrStwvIkuiRfjm3s3D5rzbZ5bRh5Bw2WA==@nongnu.org
X-Gm-Message-State: APuU4Z+q+y4QCr1Je4W1bHeXCUaLxrrrhF4IA95VcrJh+PPt3kKrZUOm
 0hmZvFma/e48j4HBl3x1gQb9YeVxB6eMRp9dP+4phYmEnrR6UDVOBFWPTCbtLUGPJ1SVRc1lu7m
 20+btbZjXjMP1BvZLQAUIy9CLZVQZiNEuMrPwLtgAtg==
X-Gm-Gg: AZFdTZcwqZ+jYxCFxRE0Q2H3C7PjfoolQXHQt7bE57K03zEjgxPlAZaTxBzWC56xhqL
 SgeSrF8GVWJ23jSZBeIcs7XrjQlvvgE38hq/ZDg4kWQzicrM0HN97ccrGUlklljgUvd+Wy1TyPF
 9aCmXAICOQSdUGU7vIB5YwVgWOMcE9Rd6e+isvm+kOBJSwbUAfDwA15Pi+MvUeyubeCER/XPMsr
 l/Ssgw0mmcNswPcY9d3cqcE9SJsA69q3h0Xy/XLszzR7PnkVk8efTw5UD0rm0wD3AiyIqLj4Tr+
 EOC4IyeFjq2h78fXgcJDc2YNDiSowEfJk504/bZs1MG2Ng4fdy8BS5SDlDSOhfgQjmTXk70bvYb
 HfxVCJP9VRjclDT/11KYyYbGb0t53YCzUnIEDoZ0K6XkuBVhDils72F9fttJ6E/h2NUBtna5xLG
 s9bBDLFIysux5E23jXlg1z
X-Received: by 2002:a05:690e:118a:b0:67d:b753:f6ff with SMTP id
 956f58d0204a3-67db753fd90mr1175955d50.32.1794821968867; Mon, 16 Nov 2026
 01:39:28 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261109143410.3279305-1-bin.meng@processmission.com>
 <CAFEAcA-yqrPWXngq-pR5F2Eg9qSN=7f+AJThw9SzFtCF-pj7+w@mail.gmail.com>
 <7f1575516a34fa20a587727add826566ddda5c8d.camel@alistair23.me>
In-Reply-To: <7f1575516a34fa20a587727add826566ddda5c8d.camel@alistair23.me>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 Nov 2026 09:39:15 +0000
X-Gm-Features: AclHuK9zNsmV1LUaAxEn7YyqhUzQQKJPQXadGywGC7Nb5vLNRCz3-VsVB6pXy0I
Message-ID: <CAFEAcA_Uw_Kc8JBfaHtCT7JZGVuLZY8Urj0Espp8XUq-DLjRbQ@mail.gmail.com>
Subject: Re: [PATCH v3] hw/net: cadence: Honor subword lanes in the GEM
 registers
To: Alistair <alistair@alistair23.me>
Cc: Bin Meng <bin.meng@processmission.com>, QEMU <qemu-devel@nongnu.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Jason Wang <jasowangio@gmail.com>, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1130.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 16 Nov 2026 at 04:11, Alistair <alistair@alistair23.me> wrote:
>
> On Fri, 2026-11-13 at 10:00 +0000, Peter Maydell wrote:
> > On Mon, 9 Nov 2026 at 14:34, Bin Meng <bin.meng@processmission.com>
> > wrote:
> > >
> > > The GEM MMIO callbacks ignored the low address bits and access
> > > size.
> > > Byte reads therefore always returned lane zero, causing guest
> > > driver
> > > that reads the station address byte by byte to turn four unique MAC
> > > addresses into the same value. Partial writes had the corresponding
> > > lane-selection problem.
> > >
> > > Extract the requested little-endian read lane and merge partial
> > > writes
> > > with the current register value. Preserve the existing read-clear
> > > and
> > > write-clear behavior and dynamic queue pointer readback.
> > >
> > > With this change, reset the TX queue pointers only when a write
> > > covers
> > > TX-enable and leaves it clear, and only start a PHY operation when
> > > a
> > > write covers the OP/ST fields in the PHY maintenance register.
> > >
> > > Fixes: e9f186e514a7 ("cadence_gem: initial version of device
> > > model")
> > > Signed-off-by: Bin Meng <bin.meng@processmission.com>
> > > Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@oss.qualcomm.com>
> >
> > This device is used by both arm and riscv machines. Alistair,
> > do you plan to take it via the riscv queue?
>
> I just sent a PR for 11.2, so I'm happy for this to go via the ARM tree

OK, I've applied it to target-arm.next.

-- PMM

