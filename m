Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC251606A31C
	for <qemu-arm@archiver.kernel.org>; Fri, 13 Nov 2026 10:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=BvpH311b
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xRo51-0001aN-A8; Fri, 13 Nov 2026 05:00:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xRo4y-0001Rs-Tw
 for qemu-arm@nongnu.org; Fri, 13 Nov 2026 05:00:21 -0500
Received: from mail-yx1-xb136.google.com ([2607:f8b0:4864:20::b136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xRo4u-0007TU-PG
 for qemu-arm@nongnu.org; Fri, 13 Nov 2026 05:00:19 -0500
Received: by mail-yx1-xb136.google.com with SMTP id
 956f58d0204a3-67921b515a7so690009d50.2
 for <qemu-arm@nongnu.org>; Fri, 13 Nov 2026 02:00:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794564014; cv=none;
 d=google.com; s=arc-20260327;
 b=Gi0rCI0rbJm6Kj6lKwwHdCfLemMIcy+CRiPYTNIccRSB3ru6PMC6KIf+VZ8LitVLhS
 98kf09x0jBw7WR0/4pR+o/KyK0vqw1mKjMdMzVW/94Bxbbvdo1k5HiVbZJfe3fqrCsBx
 6em4RQz3FoSwKPYGcH83jVcr8k80fBiGLA3tSdi0iguxC8DKff5N/BopHzHZVRTyr7tL
 vZbxk1yioP0jr0Ak0kEeDi/4ZNtpm/rWFik7rVYns0DX5VT6QtwwkkbZo2Z0hJnkCVKM
 tnnfpRki5CD4+lmPlrZLslMOCNCnWtr/IXYpxBV1JJKuo6vrqtjY95mG6mSOzork59yH
 KSMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=aq6uGbA16KipBYFu+IqvT/+AQJhgjQvkg4GEQtBIZBE=;
 fh=OwX1RvjQxG9Q9ZKXIzJP8Bw87/X983Tfra4euyx9Pqg=;
 b=X+gqYQPWfo8lsiZquKD3VCKLISLRcamee1e/tQpkoxZbqLR3TipM95MxjF4wbfPXdK
 1v1mdJ7MGFTD5YRgAv5iGqi97sG6kJVLJXd0c947H0VEq3Z3IuhcX9/vaBY3zeyedBia
 7U0wu2D6rilsGVtT/0W6FhHc1OONJN4wtWySHTT6x7Y4vZWWNrTYWwxKCSUU+JZkNEAV
 hRN5k6YB5UMI/NZerCDBwGE0/NIDinyffVshNAvFxlrVA4To1ygd1e9gNpsF67ZMl0/O
 x84CCkIw+vUgAPS5bjf9t3ouFL9I1/LdDjcBzFAeRWXYtTJbGPOPRgVoX2Cv27gLjt5y
 rbXg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1794564014; x=1795168814; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=aq6uGbA16KipBYFu+IqvT/+AQJhgjQvkg4GEQtBIZBE=;
 b=BvpH311brTYlQl7hLZaTozEEMkVjkRZ0ETUa6+20AtiFUME+Xho5IYR9YGWwdCPHvs
 dtIAwWPbuHBL4yrjMTgUG8JZr5qD7zYLQpuPCKjZmLnUYQQh/ueBn6Y64SrwKEGPLuFo
 FvCFz1mrSidMExnQjndctJwRZwSdwdJK2mfBfb+67aSnVRMXL2Zrtu8hrUzS9udmz/Ur
 DxWSRKd8SJtJL0QW1en5u7h23X9mm0ilTq6TqOJ6+t1ouUonLGSDV9KgXtNtfs0YVFWp
 Xqvepxn336nVPSStBcOSv1xwj2yaqbuaEJvu4uYiwiq0JBGm/unnIzSFNCtu9+/mXJuw
 d8hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794564014; x=1795168814;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=aq6uGbA16KipBYFu+IqvT/+AQJhgjQvkg4GEQtBIZBE=;
 b=YLWz56Lu1byEZF1CeS/Xjn5uJTKE2iCUX/sqF2M+HJuVDnRhFAggsargNBoFG+B35y
 HNfW8+aaTS94EH8FOc/1rT8qX5iJakG2OKlrRjaM0L3VD5KahnbtQtB8B1PSvCwhsxbQ
 9YTVE1tRnKlDv9NdiH5JZ7E+AoQXmrg0FJ4int0MxiC+JhzEBwqsP7DNrkHEY5DFhl8c
 A3UMkf9iPVh2WtEgXKbdPtzwujgsxQAhItozJiMnpSgo8xOIvb8gJ/ny4C4XIt1OB8yn
 xFmY+5NM6VsnfgFUOSNBKewAh+Hw5F3cl6yWt2Sro5xw+G3bsANYnXanOhnJaRncCgle
 LUxA==
X-Forwarded-Encrypted: i=1;
 AL+hErGukL9b75nP/6bLI3xGHn/jMxofvxurtmhzTzGiVnt2KZyd3W4CIg3tUfJrF4ouz3Q2B754BPemng==@nongnu.org
X-Gm-Message-State: APuU4Z/Eo3nmpSVQfTaacNBdPWPPH76fa2G9iri+bsHi+NDkKBUzuqKo
 NQbyAoY7yM+3JN9d65VsEhdOOwJMV2wzirION3DDVhq/8UNUhreyoY9mJgBkqUxbxYx3+Ioow+S
 TEDBAYMM6Rkt5UB6THlAntFjRchcNtFZjuSp1hciaTg==
X-Gm-Gg: AYBFou1nKTQQRyoOM5VMipwTd5qrc/eZb+DrRr/duz231ESkkk5dPts8L5ol08LuS5m
 F/YvfL+FXIeERPVCDQMjJnUqYcgDI70TteqJL5TZdjwkKQZUweWeaJyck1K+tVBw5N3os7coyz+
 MZCdgeKNLsKzUHftCUuz7SBC65n++OBfufc5MAuM4BZuaa8MfnIpjYAQWtaKnE+iWFaTqDqdeJ0
 KyxgPeFoXW2vgmd6787OIbQdAVXTjNWsTFPQJVnQUsfURXKVxoEkJXqcW6cs53PoT5J4ITQwd9x
 lwpRHimNR3cqouV2kuMIG+IChlCCSXDqIGf6zJIt3TYsE11uQLIL38r+bnwcLMdcy4rN2Vgd3un
 nBk2pvJMGF/ErYfO1pP6mkowni3bf2QtDUG6GMefhEpziIqz1wjVgAkbUJcj7KE7nEZWcY8i9XO
 pjSsdgURjjeXGo0MEmDk20hiFTpyT47Du0LjuzHtMXZg==
X-Received: by 2002:a05:690e:1448:b0:67c:fa3:f181 with SMTP id
 956f58d0204a3-67d895cdeffmr1376079d50.30.1794564014097; Fri, 13 Nov 2026
 02:00:14 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261109143410.3279305-1-bin.meng@processmission.com>
In-Reply-To: <20261109143410.3279305-1-bin.meng@processmission.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 13 Nov 2026 10:00:02 +0000
X-Gm-Features: AclHuK_6hgmI7phLDamoumoK0Wu1uPXJZ8QsgoYpC2YT9BcFJ_pC9BJTvc37nA4
Message-ID: <CAFEAcA-yqrPWXngq-pR5F2Eg9qSN=7f+AJThw9SzFtCF-pj7+w@mail.gmail.com>
Subject: Re: [PATCH v3] hw/net: cadence: Honor subword lanes in the GEM
 registers
To: Bin Meng <bin.meng@processmission.com>
Cc: QEMU <qemu-devel@nongnu.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
 Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 Jason Wang <jasowangio@gmail.com>, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb136.google.com
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

On Mon, 9 Nov 2026 at 14:34, Bin Meng <bin.meng@processmission.com> wrote:
>
> The GEM MMIO callbacks ignored the low address bits and access size.
> Byte reads therefore always returned lane zero, causing guest driver
> that reads the station address byte by byte to turn four unique MAC
> addresses into the same value. Partial writes had the corresponding
> lane-selection problem.
>
> Extract the requested little-endian read lane and merge partial writes
> with the current register value. Preserve the existing read-clear and
> write-clear behavior and dynamic queue pointer readback.
>
> With this change, reset the TX queue pointers only when a write covers
> TX-enable and leaves it clear, and only start a PHY operation when a
> write covers the OP/ST fields in the PHY maintenance register.
>
> Fixes: e9f186e514a7 ("cadence_gem: initial version of device model")
> Signed-off-by: Bin Meng <bin.meng@processmission.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@oss.qualcomm.com>

This device is used by both arm and riscv machines. Alistair,
do you plan to take it via the riscv queue?

thanks
-- PMM

