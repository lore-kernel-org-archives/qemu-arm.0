Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 232BDCD8C92
	for <qemu-arm@archiver.kernel.org>; Mon,  8 Jun 2026 13:51:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wWaOC-0005Ik-On; Mon, 08 Jun 2026 09:51:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wWaOB-0005IJ-Hm
 for qemu-arm@nongnu.org; Mon, 08 Jun 2026 09:51:39 -0400
Received: from mail-yx1-xb133.google.com ([2607:f8b0:4864:20::b133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wWaO9-0004Dh-Q1
 for qemu-arm@nongnu.org; Mon, 08 Jun 2026 09:51:39 -0400
Received: by mail-yx1-xb133.google.com with SMTP id
 956f58d0204a3-6603d8697d2so4348432d50.0
 for <qemu-arm@nongnu.org>; Mon, 08 Jun 2026 06:51:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780926696; cv=none;
 d=google.com; s=arc-20240605;
 b=TAgZfSMkmuNHZVVHVW+cVD6teGku/2JN14U74IAlZJkxg2pINYopGNrBTuAVGTzOkY
 zvhyER1/N5PpRYYm/UN3aUMhsLl64op5Q1kOMyel4yOCWybjuG9Kjpx+8lpcC7lBcFvJ
 Hkcws1o0FawXTLXUolKw98O8AZ7F1+hkYvxKbPztXO5ljYiDvBH5kBdPo1aHXNyILTcw
 jXMTZEVZeP3HUhmG2eSvXzB66KLjkVQRh8PBYTIfz+ypBZ9C+6B2h3SuE3iUmteCRSF3
 PxFWnlwMEPJny0aK3fYvgZWW+xvxemOaDU2D6G7xa7MRXaR1oxN493OJ8aXVXyU4D/FD
 Veeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=bKUj751TeY4nkEZpPo0FTWcTQnR2+/cwe6ZT7/QhNuQ=;
 fh=Y8tUEWc7xFSJo3FgM/6atYX+LClIxyHAidxHCAnYfkk=;
 b=MGX/dDVNwRcjiUu1AW1Lg/0ZHRSnrJ1eytlVUG/aEL7CPWq0AjYIF4OSBf503emYs+
 scWuinMu9BcGD8LG+nUO3m4i5PERGTVb+RkIoJbWywyYMcvqZGTrmXemTrREXjmb7cms
 g1jQ9bufA7cnBQK7p7whagOWhkTXSLbma/BW9q+QWRbMRdurcm2F0Cs72pv81zkb3xLM
 c5r5uES+BLEeruwndBx4mT3bn/TEbmXxpxro3sE79zd1JwrxsNZAlTGEDdF1Eof/kGY5
 afU/yTVyhyEMCUMg+8TdqlLhobiF9glLkVzruY83iCb7AY9BupM7l9RelwJZmJn6BXRP
 x5ug==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780926696; x=1781531496; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bKUj751TeY4nkEZpPo0FTWcTQnR2+/cwe6ZT7/QhNuQ=;
 b=gQ0IeJXXbtyS9VpiqvrTumtn8VbVTEmW8wq+OCdBeww1rO/i2OaX3mzN5hKE8GzxkZ
 bX6gyqOYTq16WJwulXR1/dDMkr2KtLB4YTMn52y/GZP+MTlgX/T5A0d/re9dqzraRmHd
 YrnkRIfg36XwqcoNvQV0LHSPg7O6IE4efRMns6gQv0FoXjFu49We+Jede+0e9IO/HDHI
 jiuC05u1JZZlsAtJixVAwvHiazWANRId3hwq9L7nMmf/25AiyuoEx99aLOjNsUxK77sj
 YpKqPJoqnbKT6q92QrKRCpJksWKEO7mePaFhETBWHKpSCmFozAu1udNQpxdOWlDDLfPp
 sUpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780926696; x=1781531496;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=bKUj751TeY4nkEZpPo0FTWcTQnR2+/cwe6ZT7/QhNuQ=;
 b=aq0a6Tx9npuUj9bafCQMdPs7HT+fODF/PQRH1swPZ04CPu6RMJO124fmo2cqPXZ/he
 /77XzXmplQy6svHYzhcz4hbTwQ93xsAIb0uIarc+83YjQjWRQTDV3D8SPy7klZRgIb2n
 B0+PoQBLMbrA1EmE6G4N8bIu432sBfernJ2tu8kTSPJIxaoXfLqxGzX5hdn4HI2Ab9Xe
 WgwCviM1ecYQRR7eIq38b7JoxkxomMsdrG9E/akoIyaYwKvr9TuNpATxbyTl8oE9yScl
 nEWiPUrN+d3clNbuvVC7oHo+YDoI7ACUHKG7VUiEUNlzGfE5kNWYR8KYyfuTur56I1JM
 I8TA==
X-Forwarded-Encrypted: i=1;
 AFNElJ+FkWb2E/u4SmL9rtpWtyTcpTOURNuYZq1w3ri0KyvHhYs4tYF2KNdZlgiICiXLML2UZHdWsMVfKg==@nongnu.org
X-Gm-Message-State: AOJu0Yxvg5aLQr4QcpLfslrNKTCt7JSBVlmOeCrXGl8AIediiDUGY4wQ
 Sj4/cOrB8ucjceXEGthVqQwF1p3s9iNGY8HbVXH2C55uKvc5L/wVpRKQ5gNp7Z495eY4K2OFu0P
 4HL4Y9jUAdXeouH8jCcm1HhupNwJAyJ7UiEFrqqgSKQ==
X-Gm-Gg: Acq92OF1XrH2VVZqKKKl3q+AeuTmQGHJbYOHBZFd/Zet7YEUzsmm2XQiU/ElFeb3Im2
 R8wjxDkmvLX4jeg1E+tkSSoo6hBmuLUXMvMvr7cYigwbtrjtJbCEk2Pr/skSiDpUbYL5JKC3rPI
 lbEeU6ukxaJbkT3vP3kBELDcltqBKHJZMGu9+vHCWPyi8os4j7jIf8TfUAlYUEUJZ3SpCnmY5Gj
 BS6oaeZRexF6TEAB3qWT10S29OOfFSf7hAUYsaJt1cW4Oo7g9iHQgb6K9gIxM8q8rQFL/TrpcFx
 mi/L9ZZMWsYKdAKx+WPTBm8MjX8ZqsMiN4mn96i0g+lyVzsDRekcGX4ToSjp6tGGE7JMNX5XluL
 rhw==
X-Received: by 2002:a53:ac87:0:b0:661:1307:3d49 with SMTP id
 956f58d0204a3-66113074155mr12044887d50.7.1780926696345; Mon, 08 Jun 2026
 06:51:36 -0700 (PDT)
MIME-Version: 1.0
References: <20260529082948.363931-1-alex.bennee@linaro.org>
In-Reply-To: <20260529082948.363931-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Jun 2026 14:51:24 +0100
X-Gm-Features: AVVi8CfELuu63-8QEYfJ12bzRvsrYJpzmkWaV0Rztq1EKICzbROxPC3RaYFy1rw
Message-ID: <CAFEAcA94+mh_pigFDi+tEPRJ416fSWfxsQ1Lj8Byemug9kBp6w@mail.gmail.com>
Subject: Re: [PATCH v7 0/8] target/arm: fully model WFxT instructions for
 A-profile
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
 Alexander Graf <agraf@csgraf.de>, Mohamed Mediouni <mohamed@unpredictable.fr>, 
 Pedro Barbuda <pbarbuda@microsoft.com>, qemu-arm@nongnu.org,
 kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb133.google.com
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

On Fri, 29 May 2026 at 09:29, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> This series fully models the behaviour of WFxT instructions. We
> already had support for WFE for M-profile but we left off A-profile as
> it has more potential sources of wake-ups. The main one is the event
> stream which includes events from significant bits of the timer
> ticking over.
>
> The refactoring from the previous iterations of the patch have now
> been merged.
>
> I've dropped trying to fully model the global monitor in favour of
> taking advantage of the architectural flexibility to have an IMPDEF
> event wake up for any reason. We treat the setting of exclusive_addr
> as such a reason because it indicates the current vCPU is in a ldstx
> exclusive region and we don't want the guest to deadlock. This does mean
> the system won't sleep on WFE enabled locks but people shouldn't be
> relying on QEMU to model real world sleep patterns anyway given the
> efficiency of emulation compared to real HW.
>
> I've written a test case using kvm-unit-tests:
>
>   Message-ID: <20260527111822.1563679-1-alex.bennee@linaro.org>
>   Date: Wed, 27 May 2026 12:18:21 +0100
>   Subject: [kvm-unit-tests PATCH v2] arm: add wfx test case
>   From: =3D?UTF-8?q?Alex=3D20Benn=3DC3=3DA9e?=3D <alex.bennee@linaro.org>
>
> All patches are now reviewed.



Applied to target-arm.next, thanks.

-- PMM

