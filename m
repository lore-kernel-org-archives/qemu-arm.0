Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F257BCD98DA
	for <qemu-arm@archiver.kernel.org>; Tue, 16 Jun 2026 12:30:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wZSw1-0001XH-IQ; Tue, 16 Jun 2026 08:30:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wZSw0-0001Wl-UU
 for qemu-arm@nongnu.org; Tue, 16 Jun 2026 08:30:28 -0400
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wZSvy-0005sY-7K
 for qemu-arm@nongnu.org; Tue, 16 Jun 2026 08:30:28 -0400
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-7dc6fbf3e86so57125037b3.3
 for <qemu-arm@nongnu.org>; Tue, 16 Jun 2026 05:30:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781613025; cv=none;
 d=google.com; s=arc-20240605;
 b=MA6B+f5E0p23IaY9UOm2WWXEpudp8NAMS5PjGZLvo3JxYVWGaeik9Qs6u0Q/RDPoII
 77sG0yRfaCkgSORFxJGQvAuapnoc6aPCYop7yRXOnTT8Fq821Mr+h4TeMRojuWADD3H8
 iY8foyX64UlmyjBOaVNy4UXzJnvmDHEFwG477vKTYigb00c5tKuVromnshhZqTAdcKnU
 sOhxK6aPygVtjOI3/58tvoVB9Jwxq17lD5VYnrdUP93qxf0l1gLGYd+Pb9voblzi2G2i
 OJVfpL7Q29YJEYv5KK6R9r8GAbF4lUUFciWBJnhc6wL2n5nplRAhhDCOwjcWxpND5eHn
 QF5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=MxlX35AWJg0w5QhGd7wJhEhtGu0JCcd0LIXnEtGZGKQ=;
 fh=yK3AcZkeW9lVO7kr1r+4NeticB7qWlWf6ELr8fXgcu4=;
 b=JcnRjr8YZqJGneJw9+r7qSz5n0aAfllr0RIexYlTsL8EywaKzCs0EuuFmTtc+gUsvh
 CAJ3mmTVNFmqKj9vIFcgtIC4eB+upamtVZmh7/BeAOWcpRWt7RH5VzheUmEtM9auWHNu
 YS4oaiPGIDEpD7WcR+V4h9oSP9QHyFsOa4WElaJNCHPNupCgJyLOpXxBdQY6Neb814HK
 L0hFbDQk8OOjE/52p1sLdBa739nxkNtFw9R0cl0c5pUDhoH35VU4siqjFk1moiwZ3L+0
 E8EdsmI9tjeLEtTSmlKCnDt5w4UZ+uPyc+N2FLeXnKf3OLYoqMPWAeDZxGxln3lhHe8Q
 oDSA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781613025; x=1782217825; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=MxlX35AWJg0w5QhGd7wJhEhtGu0JCcd0LIXnEtGZGKQ=;
 b=h7eW3ojDqUfTqBLD64N65wBBODuhmbcABxH8W1mn3SEqqzyPNY/0jMdVGIynJYonK0
 tN7Ri78iM34UBQCF3AkPGhovgASo1GhLWUz2RHfljGt7AWdD89usRXaojgMIeNikpymD
 9fTAdmLAenctQ8DDSnF6i2U2fHFl1EyNbrv05brGUQaofCg7XO+k9UmOmKsqwm12D89q
 G1YVrA6KNPr15OR6B29bHKtkLCSYuzNZgerVZhdZc31U1FiKxhvzJLi44klst+dJvDyJ
 yRYJRy+V9VfJmcyuNlqJtT0viL8FirMQvgYng4tsU0sSup/em0mNE4YIFqFGIvL0MFQh
 nWzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781613025; x=1782217825;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MxlX35AWJg0w5QhGd7wJhEhtGu0JCcd0LIXnEtGZGKQ=;
 b=sWLPrL4woqHQYM7j3coMw4jJRh/shwkjhA6FRLDN9gr9eHs7s6fkY1OobzTZRwSuNU
 NUokpQ3dn5uqtUiOUNSFhMjjLmcu5AbiYFpcvWB0fvJW5zl6gegMp2NsINN04PzFTakn
 bz1Z6STgAsvkfeOTsNiLqkBpNOYB8dcqeW+HD/4M+7T6p/64ahpV/asvGGZ1AJziL3IW
 xBNOOs1ukZDQZ2D0HEWIHeU2EFSjMBNmRzbG1/3sV2rd9L++lmRbJubkV1VFnq6niUlX
 J/KHFf1l1yDv1yJFpY7eolERHIs9EVKBZjG5TgmgaIY5eqdgQlZc+AzKHFDe/ooI/adw
 ZHuQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ/sCY91nQmFCUdQ/U+HAb8/mLYTDCK8r90/2vbNkTLT9+W09klfiOr1hlO3dx2hVtsjRUmiXkLxVQ==@nongnu.org
X-Gm-Message-State: AOJu0YxelJZP30Uw+kFALvGos+wXaD1mSay3mUplW/GeY4qpmW5+p2UZ
 lRVZXgzGONufVnt/Z4PApMnhhMAdJ9jFCW3VPDTv0wLQWEm02k2Ofoozl686p+o2IS5k/5aZeJq
 0ChbaSKnIPYRw1ki/IcaXY4OdSKEbtSfUJzI7+25GiiBJ7UtDV3VI
X-Gm-Gg: Acq92OHnUfpt1S2jnyz0LdO0mKMAMelWyVRPsNQ5gYVW+NVdoYYBRoX0PSGY0z56F+R
 cWGrU3WPWx6jQNT/ueqZXiwIl/00uq1gCRvEwGDmyI8Yw1rZ7GnEi4aEXuWssdg2n0V9aAHGU/5
 dH/RLRIk8OhWKjKCGqdaTcfBCV4LlOMEc/pfsmZQFHDUuS7qbpI9bonqf6KakvgB9MfDR9uuSrw
 d5Y4Yme0c+CXjeDb/toG5nrft8MXkJCbpoald+TTIIGwnaW1pmqAv7JUOlzg66lpHPnPwdZIYm3
 EiZHkq2HnNuzUzDCdZfW1iZMpOjQjkhwmc+t96Yo1ac5R1m0oNh8d7IrMdFwdPxtUlc=
X-Received: by 2002:a05:690e:e87:b0:662:bd61:f80a with SMTP id
 956f58d0204a3-662bd61fbc3mr1225933d50.48.1781613024517; Tue, 16 Jun 2026
 05:30:24 -0700 (PDT)
MIME-Version: 1.0
References: <20260604234852.573178-1-richard.henderson@linaro.org>
 <20260604234852.573178-9-richard.henderson@linaro.org>
In-Reply-To: <20260604234852.573178-9-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Jun 2026 13:30:12 +0100
X-Gm-Features: AVVi8Ce6wRyugd_4QjRUp7fafwq37-1ofjMZ3BAnVtjvfC5nvB0ldtkABg71ac4
Message-ID: <CAFEAcA_3kV1VUqT3TgK7dTP9HEjCwpxV3ZTz0WLYgu5O0JtnjA@mail.gmail.com>
Subject: Re: [PATCH 08/25] target/arm: Implement SVE reverse doublewords
 (zeroing)
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112f.google.com
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

On Fri, 5 Jun 2026 at 00:50, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/sve_helper.c    | 4 ++++
>  target/arm/tcg/translate-sve.c | 2 ++
>  target/arm/tcg/sve.decode      | 1 +
>  3 files changed, 7 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

