Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp4203028njb;
        Wed, 11 Dec 2024 08:52:10 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXxpKU3pgQdYJYgDvvd5xJ0ZP98SKiWgU8qu4CDMncsfVuYGfmllplt+RkDW24VW0pUjDW7y4jXac9wFg==@linaro.org
X-Google-Smtp-Source: AGHT+IHD2DXvECP0sNpJ+Z90owHZOJryoDyLgVGgSQvcopQC/EE4/st6Il6Jb4I0tsSHEnYqThAc
X-Received: by 2002:a05:620a:370e:b0:7b6:d826:40ab with SMTP id af79cd13be357-7b6eb4e4bc5mr510453885a.51.1733935930407;
        Wed, 11 Dec 2024 08:52:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733935930; cv=none;
        d=google.com; s=arc-20240605;
        b=G83kvnONExS7cxwaQibIgldwnIQCgQ6HqSoYjIlizn+/kjc40ZX4FvT9bZzJMqLRLh
         2b8WSgT8ORtB/go8f9UgPmadUtJn8IoHKAiXTZwP70F3e3exsBctPWWh+411i46KaQf6
         RaYA/4Az7WDrZkIXRK9T/r50CWguAosgCMc4EOODfLdWcvzyOAjzbTFREQF2q+IcqhN7
         AVuKQ2wVmmzMvNQO0DxPw6aR3IjFy0h4Qkd8m3HwdBS1d1cNNWuEJHcaZropXzXPiiGi
         dULSelzboQTOJbJe1xBWM24DEYixEN76OwWuuEmPaRTBIHYxruxF9wkvcJ8yBJIfR4mi
         DWEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=R8MA2gWBkJ2+i1Kdessuxl3UtxoPL0/XKrXRfRNatXk=;
        fh=/ftcwOPYeEIhzseC7WF42kR+xVR/IJiWpLC1+A7SOWQ=;
        b=RoWXAcRSq5IucdnDohGuR1zE8U36I4BnJboI/zRZt/5GZFrtP+U040ijAqdM9tfNLq
         LvTVX4BzzCB1R8EF7vKYVV9lxaZXTB5BWxRE5NLNoRUSh/XjoCo209cX/+ghEiX4DZaG
         XYIKQozEHJUZ2tNqRRpzdwEpILggWGmbMswKFBdcvvrQZgYua/E0c1vftf7+eXX69P6O
         8NJJ+AQHSE8XjS0L2RCdTtwBDLomR9Rsudj++zVz1JkpDdzwyIwQfusb2vPQFyVQzMnD
         h4wcsGCLhj2IDT2mnBC1yGEtaxtscDuwfvMhekSqNkuj0C+u8hHnV/R6aMIM7MfPJyMq
         Pkwg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=k6pgxX9x;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b6b5abd4c4si1618539285a.512.2024.12.11.08.52.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Dec 2024 08:52:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=k6pgxX9x;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tLPCg-0000Cv-TI; Wed, 11 Dec 2024 11:04:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tLPCb-0000Bz-VH
 for qemu-devel@nongnu.org; Wed, 11 Dec 2024 11:04:42 -0500
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tLPCZ-00050a-S2
 for qemu-devel@nongnu.org; Wed, 11 Dec 2024 11:04:41 -0500
Received: by mail-yb1-xb33.google.com with SMTP id
 3f1490d57ef6-e3a1cfeb711so3482402276.0
 for <qemu-devel@nongnu.org>; Wed, 11 Dec 2024 08:04:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733933078; x=1734537878; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=R8MA2gWBkJ2+i1Kdessuxl3UtxoPL0/XKrXRfRNatXk=;
 b=k6pgxX9xh49vc3p4Gx7yFj9EVWqAniaqS7idQ7u85yQZ4iRVWA7NXJZNW4NUW/AGLn
 xlvFyJ3/eVJAoJq+0zJSOsENW0h9Pao/K3WjYFw9FCqj0ETgr8lfpwwZbJpoCdhnCH3b
 fh4/YGzsvHMSDfhbqk9Dj0QyzgTFc7atdcivyUUf7NKGztJZQG30yUDt+gt9AyG2M0ku
 7oIfvGOPZlFPIG7DA3NuNd5BbdaO3IFnaSIi2s5p00yF8nNmE4cPKZEzh0mV13gFd6T0
 sVmSgptmsQ/ALXX+HuGQD5WiIFF2OJrijM0f+eAk9RF0dep+oAU9EvXAKp/wwZ0X4NEL
 dbeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733933078; x=1734537878;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=R8MA2gWBkJ2+i1Kdessuxl3UtxoPL0/XKrXRfRNatXk=;
 b=LQMvh52ivqnecFDdDD06JCuq/anh+KT/U80SdZrLjQj8hKb3Ps7fQZJuWdnXoXsnPZ
 ZptdN71NgSYujKEEKI1m13MtR407SSz9DwPzmAxeezPBT8bJQCy9mYZyk9jl6ZSkaw6H
 XB3PmGozBp5m+VugzUevUlTQxyEdQS+VHEmwvkkuwCwtoC5RnZkR9NzlLVexmLV36Wn3
 aI3A1yx2hkYZCTyap2t9AohmXSmkcgbTvEwIgAxpfYoEMLOvjPCdf3tUC5E5fgRsQob9
 nkPCIqqoMg6aHIpV6bJvtq8Uicjpp8lkwa1ryInup9Lpe8HIu4CtbEDxv39XVW00EA+S
 7GuQ==
X-Gm-Message-State: AOJu0Yyx5d+2+FYtMkrzV8oLmg+Gtd0OhpDY8/mPn25qgGXtOI7MVKAR
 +wQqFKmGxhBckiHmKJUGce6tUIoJhm1G4o/KcozBykTsDt+2Ycs3SUFU3YgvL+XhO4eq/KUCXKa
 8JVBeZmW4ZVZqG8FW81FTcRg/wWStRzpPtVm2AGrGDkxgAqj+
X-Gm-Gg: ASbGncv5NRL6EUTRiQihv4tY2tzC52QEtztrVcS8RWiMrUrpQgYIdrTm7lqzr9GwVnL
 Yh9DPCUDlZicqL6xkm2gZbJ1mVVC2H4ZWnSdo
X-Received: by 2002:a05:6902:c04:b0:e28:ee2b:34fa with SMTP id
 3f1490d57ef6-e3c8e22dcebmr3828110276.0.1733933078392; Wed, 11 Dec 2024
 08:04:38 -0800 (PST)
MIME-Version: 1.0
References: <20241210161733.1830573-1-richard.henderson@linaro.org>
 <20241210161733.1830573-59-richard.henderson@linaro.org>
In-Reply-To: <20241210161733.1830573-59-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 11 Dec 2024 16:04:27 +0000
Message-ID: <CAFEAcA8wd5UNU1OMi6Vfs+h_6y28ORguzoiOsMkX=OKntByb8A@mail.gmail.com>
Subject: Re: [PATCH v2 58/69] target/arm: Convert FCVT* (vector, fixed-point)
 scalar to decodetree
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b33;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb33.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: VLUAKWLrP/+3

On Tue, 10 Dec 2024 at 16:27, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/translate-a64.c |  4 +---
>  target/arm/tcg/a64.decode      | 19 +++++++++++++++++++
>  2 files changed, 20 insertions(+), 3 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
