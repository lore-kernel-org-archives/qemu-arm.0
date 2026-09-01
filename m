Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 114C3C624D5
	for <qemu-arm@archiver.kernel.org>; Tue,  1 Sep 2026 15:44:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x1Qej-00032j-Eo; Tue, 01 Sep 2026 11:44:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x1Qeh-00031s-Gw
 for qemu-arm@nongnu.org; Tue, 01 Sep 2026 11:44:11 -0400
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x1Qef-0005BZ-PN
 for qemu-arm@nongnu.org; Tue, 01 Sep 2026 11:44:11 -0400
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-861a2ae9c51so1053057b3.0
 for <qemu-arm@nongnu.org>; Tue, 01 Sep 2026 08:44:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788277443; cv=none;
 d=google.com; s=arc-20260327;
 b=AuLdKYx8I+960BZO1N2Vmhk17LnpdSfeK8Fb2dNRhbYF8bxsRS72g8JV2LgkL0QXUB
 7dhKp9J7azziLQ0GL9nNY+TyN8WOhWd9Drf3qr31b6/G/PBQ2ggRtn3nHhQtiXjyWZ+T
 9EYX0k3AUA5xYlakL0z+prQygTUbwNgrKL1ZZoWMQxZEy+s45icdKu8h88nf8m6EW+Ef
 V0XqBwLMFARNzniEqVKoCKCMC6eVv127hTEzmqQvk29z9IsGVK84gOZBQfv6HC6onZzP
 dc6be7+U+JWaIg2TLAJ8kyIL7dZD5FCIh4uQ9w3CouBcbGe4VtQThjfoZl9JZ1XwrGLZ
 FAsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=1kvjv5Gfdk/GMHKRwBrkjHRbEfyU/KRdl6K73Z8xPg4=;
 fh=VmIFrBZdxirMslb2/RcYIug5jU+Z0xj5rf9V9lxi9YQ=;
 b=TYRa3wop92NoiwtFWKcIK/QqjhiD5PZaW3vOH8I4+k65H+bB+caWtz76r0yYn0EM3r
 kl897rGHUVXRnxubjiUArHh92J6ovM3JLACZ6JPwmWzykYl24VcUgS7tY3co1ELb4q9n
 bdnaKTsBuZTjuQzDyl4LXnhMY/Mx6D0qblZ/xJUxaNuIjz9KRJCFOsFAi5G/ienVLHXZ
 SoENnUQT9u3JWFbW0mJCJYO2f6J65tjimnOO8/vK34r3LRkOih8jv+uVTFANZlQ/mhgB
 KdEsxNLMVp+iDAVqDuRYZiF66RUO7G8KGXMSwTOFO1NeyHRZM7mRhonOBcNBSOSkGZbA
 Vhcg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1788277443; x=1788882243; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=1kvjv5Gfdk/GMHKRwBrkjHRbEfyU/KRdl6K73Z8xPg4=;
 b=yUXEMo5tbn1ZAU/i7dVVbDJXLf8c9yN3NQT/6lsMoa2VV691vwqvBcT75HLl9VolWZ
 Lw/hgLCpJXi0UOqVlyrqHqgQA5X9goEm2bNHhHW4CNA9PGfglMBr2ol1tLFXwxwCGMUp
 5lQ2EijfjnCbePyx3f/aK1lMnYb4WDdZJgAq3OqpYfb8jXKirDM3uyWwYnl2oC13sRyN
 AHNUbKPMg2rcXtrHBwPVGpEmGNfpqSjffW9I/jrb62ssHwhFXgu8wjPAyED6LQSUypBg
 cIOVa5I3rE9o9uMUMxuvC7z3Iy4xmvPxY4HRMLNkOB3zq3kxLJ4rfee+ZGF04FSwy/b7
 iucw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788277443; x=1788882243;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=1kvjv5Gfdk/GMHKRwBrkjHRbEfyU/KRdl6K73Z8xPg4=;
 b=EhAKtxjgKK1PBUGQYNJYRRQXUo25kjxXyxnYTJZ+m+i0r7UcNpDI7QbUNoMmge/IrN
 +DJE//Wqhd6IJa9WGHA+maKq11tzJoAmGezLmjgmIKjJcNuAOdcKWErfN9c3kXpN41Gm
 b6va39ZLS8wXKMkyHCA6SEdjFwlDUnjJsalwOMUNpgp1Vw8t7PfJMuWOnML9bMxI1Nej
 Cy9P0P1dj+l361LaYFns7G3QDM4oGBr5itbzFzTiqF29w3tZofcAC9kC4mqw1T6rnYnD
 zXrX4sb5D82TF/vcC2OCFKF0MIa4B3sMKr2i8Wg6VGR2I7WlihAf8TCHYp+gE5ueFRh6
 LPOQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBwyowuV6jCcr2ISofq+UWcsiKk1/NGOe3QVhPbHTcEadd9j0HjbbIVZyvXfMZRrFbyZOF3O0pmFhA==@nongnu.org
X-Gm-Message-State: AFuF++kAk8RcwR2eWkoZnqghBJGAo9Fl07Q3eqPJFkUw6mbuIY0urUEm
 Z+/8ewcqA/csGsHxn6DgrhGEehKdUxBTn5plHHuQvxV6Cz8RU7nvYeBRzdcQ8mwy2nA/XE2hpSR
 g9AIPhDmiS0RnQ8bFUnJrU/bB6Fazgu4QTvd/G84Giw==
X-Gm-Gg: AYBFou0zZpsm+DwNcF2Y51JYYKJkRd+MnLArxLIVsjow2kpvGYTcgRZB9YChyzJm4cP
 Gvrmh+Ja5CEzU1DDT+Ujp39prCNCFk30cvJvHlFvNIrZenQU71W155Hn//AbsKgPwg+1kq51Hqv
 vMnsXMOQ7m9FDD5WI8/TmU6YYXHqSBr3HjLcgF4Flo2LdGukTH1ZgU0jBaU2b/j6wQFOTRBK3p4
 UyeCSJ7GsKuWPw/BQogn4f8VzQOzAyIMvtIu6riGMqRtYfeV7T3AkSmTUlx70AXrQPmdF3ytf6u
 5+BK7r9Bt93AXFfUgKoK8uDuLVVvlmXgTwvP90f0XeLRCYcSrJmbzry5C7X9pEnLgZNIZho1eKW
 6uD15wThHw8PL1Lo0FK5oFPHHiYCJ
X-Received: by 2002:a05:690c:a642:b0:820:15ad:522c with SMTP id
 00721157ae682-85d67251799mr116246197b3.11.1788277443006; Tue, 01 Sep 2026
 08:44:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260815203730.1468365-1-richard.henderson@linaro.org>
In-Reply-To: <20260815203730.1468365-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 1 Sep 2026 16:43:51 +0100
X-Gm-Features: AcwNN1X_-5DwmKotV19zndnktRTnWLg1Di2wnrhkJJV_liuHxx3Ln1RlQZS1iok
Message-ID: <CAFEAcA9CXPA=3AHqqCu8Kv9iHUGra37wBUfVcikMdBrAkX54qQ@mail.gmail.com>
Subject: Re: [RFC PATCH 00/18] accel/tcg: Change tlb_fill/probe_access to
 (addr, first, last) tuple
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1132.google.com
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

On Sat, 15 Aug 2026 at 21:37, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The driver for this RFC is
> https://lore.kernel.org/qemu-devel/ce3a48b5-9847-4cc4-a02f-86db497c91ae@linaro.org/
>
> Based-on: 20260815194549.1377505-1-richard.henderson@linaro.org
> ("[PATCH 00/23] target/riscv: Reorg vector load/store")
>
> But also merged to master, so for avoidance of doubt:
> https://gitlab.com/rth7680/qemu/-/commits/tcg-probe
>
> Convert probe_access_full, probe_access_flags, and the backend tlb_fill
> hooks, but not (yet) probe_access itself.  I'm less certain about that,
> since its uses are (1) less complicated and (2) there's also a path,
> which I can't prove isn't used but neither can I find, which avoids
> both watchpoints and notdirty pages.
>
> I've tweaked the riscv pmp check to use the new parameters.
> The similar Armv8-M code is a bit more complicated to push through,
> and I need to study it a bit more.

I think this is a good API change, and getting rid of the confusing
"probe with size 0" is definitely worthwhile. I think we need to
be careful as we do this refactor about places where we calculate
a "last" address via "addr + size - 1" and that might wrap around;
I've left comments where I think that might happen.

thanks
-- PMM

