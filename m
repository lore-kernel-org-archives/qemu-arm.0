Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2BE7C55167
	for <qemu-arm@archiver.kernel.org>; Fri, 31 Jul 2026 17:27:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wpr18-0004Iy-Nt; Fri, 31 Jul 2026 13:27:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wpr14-0004I4-Fn
 for qemu-arm@nongnu.org; Fri, 31 Jul 2026 13:27:28 -0400
Received: from mail-yx1-xb135.google.com ([2607:f8b0:4864:20::b135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wpr12-0004Id-8H
 for qemu-arm@nongnu.org; Fri, 31 Jul 2026 13:27:25 -0400
Received: by mail-yx1-xb135.google.com with SMTP id
 956f58d0204a3-6681e7911b0so1558530d50.0
 for <qemu-arm@nongnu.org>; Fri, 31 Jul 2026 10:27:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785518843; cv=none;
 d=google.com; s=arc-20260327;
 b=j/Nb3iS4PkgWSylUXaRetDzDEctrtfDzHN4GSEmJwWrnBxkHU+lQPj4T3Pzws2hYMb
 FnoPhX7AQ2PQ4Z59GxqfAB31H5V6+RT9niHMPRkX/WuH5qESu8vWBlWKFFmllDFCtgKw
 2/xz7//7dWq2oNENo8fLrmFdEniW0o3JxoXPy90ZvF2D2daW4w9otDQdc+kqWtY1rV1i
 MkqbIDQzATqZkCT1rN+9dneVFD6pv/IdrtMvIvSDImQggR3gtaTXdoGxkvqZSuRzsV7m
 9wfqyVzZrgLu8ATvTiElPwUhts5HzbyI5jIc1LfKN+gEewANnx3lMq1IUdnVW4DDQ0aN
 4VEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=Wek5xfOA0Otj0eDidEirlD6SqrJC0fmWS4T2++it0nA=;
 fh=9VWzbzAXX91POnLhAue+oL2K7R9o3gPpLDPX2UX/R/Q=;
 b=m/mx41FQXWlVMSAqVsIIThnClnEqk6o++e2M0rkhIVei686J+FQs8F3fUqNaRxdYCU
 l4kecBT0QsPHYIZ+Uh++I9vEMFFtsqLDk7dhAeAEopV0OXDGWdTcAQw66AmKJtoMJYMV
 s+E2c/CbvJXb9w3meH8JKOBp/3BUQUPMP8+ued0w4LYSVBkedoAkQY5EOa8U3oFh69uB
 T3fwpDEjQwKaWFiDYcF+3+Rxu+SPJLIHn3EwTicKJ1636jiXEIxL47leWZXBGhU59GMM
 DEQza89Gcxd8SbcFNM3ZyVsUq+E+R5jJumewDvdhxfpDi+VfmY2ngQgKa2KW7sNsF64l
 dL/g==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1785518843; x=1786123643; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=Wek5xfOA0Otj0eDidEirlD6SqrJC0fmWS4T2++it0nA=;
 b=v5vVtsrLsQ+HjgkfmE91EepE1wjP1cYEQquTun8eA4nSWgdTbWWkmUgehHk8CRDifm
 CUBfR7TA3wqAuwYxrVCw6ti9wKZ4AnF3UYRivq5xFIU8+hS9VWq/LdPyHSJMYJtRlOfp
 226ycFl6FEpo1m/GQzfb9Fz/RG2EJ+TW4NuEFRngWbMp1jaip6qBFg4bl3uK+A9T5Y8N
 7qO4XUFmuA6db90D2XixkKzdnqfMbbMcN+0U0FzevJmJ/gunH5CUbtDFr+WK6DtMid1u
 ebxKSz4BzcbRGgHRbhuzladQ9fOk3yllt89QarVHiR+/i7lM0Mu2HS81IOfJgQVD4zz0
 OOTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785518843; x=1786123643;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=Wek5xfOA0Otj0eDidEirlD6SqrJC0fmWS4T2++it0nA=;
 b=l6PWWtkV7IM/7aKoedyaIE/DZZC6CRUxuRq1Eg2D9nGtzjIpiDnnhtKr0cDK19XNH4
 yDhQzHGAzdWfneT/qyMZ+NLbAEiIEJ2unbJADvce9h3q6b5lzXz6n6QiqV5qO/j1qSAK
 5rq1adq3sCQ36wUmrsj8ywu0m4xxILfSZm/y94Xe3XfTUjG1ZKBlsi3emINeDUNrnW95
 kcyIQZOhqXarnW6zpdVeNMFPMU38ABklW/nDVtASwaDX/1oPkFix4MLQBuI8DGvc/O5L
 7WAbwT9FOGZAuqg9GjspY2qySNq/DNKSPRtlfytg75HYGx0qCgpOx5L12rX+zyv8+bf1
 zLPA==
X-Forwarded-Encrypted: i=1;
 AHgh+RojfMS7jWMMphjEkYI/cViynkkuLIzV0qa5wZKWL9wQM4esekhXLixmVLSgJFlNH932MgJs9coGsA==@nongnu.org
X-Gm-Message-State: AOJu0YxrNPVhuVbT7fCDyccu/3SpCru9jg39dlux002YP1YXQp17hK+o
 pH3FLw/6YXWuyd5oEntHctTwaBpIroo/kNgRlM+eQSK3ho3nseIgWaV/JnleUoc0ENfDPpZSsLc
 NV1pYbDtO5X7fc564/OfYKRRxxdL1w6d+G9Lbnn13Tw==
X-Gm-Gg: AR+sD13/qBr9j3uYdFL4OQGuPocl7w1aBy4zw3sjijz0x1y0g6t54ne4EgWQ5/aCl4n
 hGjUqkBRkdA0mgY/uRe9130C37FiFARGR9EFg79w4HhtcVYpPl3OAsjPQgvkoTmMVl/iRYGgILa
 mWWA81VrDj6BsDi+mDJ6177MU1lxHBmomtANoelqS9hS9NOTCGFFSfgqTVFAZcjgczxnja7d13j
 JZ0KK+4X3wSV6NVtAsFA8gRQQQtEMt3gim7gp5rKvzVWcqZlrK2m2aBZMVSEHieFQmmQVywHycN
 QgLz1+FSETC5q/MkNQii7rhsAEk48PiJSSw5MW6p1lqcIPG5HHfOdXVXNc8Ym+Pb68Jr7qIdW98
 TW3kiAg8ntAjymAEr8R5YM3W11QIi
X-Received: by 2002:a53:df4f:0:b0:668:8b5b:75ab with SMTP id
 956f58d0204a3-6694f22e9cfmr681966d50.49.1785518843068; Fri, 31 Jul 2026
 10:27:23 -0700 (PDT)
MIME-Version: 1.0
References: <20260724030616.76180-1-richard.henderson@linaro.org>
 <20260724030616.76180-7-richard.henderson@linaro.org>
In-Reply-To: <20260724030616.76180-7-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 31 Jul 2026 18:27:11 +0100
X-Gm-Features: AUfX_mwrPdSdXes3DzYe1EXaENmNj76OHt0b3ye6024O7jE4EBTQdtbzGvFZdik
Message-ID: <CAFEAcA-Ts+oYSU+OwKWGDQGbKSPRLB=o_f2H6f=mRONEb_KLHQ@mail.gmail.com>
Subject: Re: [PATCH 6/6] target/arm: Enable FEAT_FGWTE3 for -cpu max
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb135.google.com
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

On Fri, 24 Jul 2026 at 04:07, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/cpu64.c        | 1 +
>  docs/system/arm/emulation.rst | 1 +
>  2 files changed, 2 insertions(+)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

