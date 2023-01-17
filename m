Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2285940ejc;
        Tue, 17 Jan 2023 03:35:55 -0800 (PST)
X-Google-Smtp-Source: AMrXdXs+xTXP9OvUWlu/YSF++B0uqtPKfI00rdaQmt3qYXrZNQdWSZRglbvTGmHEOj6XaZTwzzWv
X-Received: by 2002:ac8:4a03:0:b0:3b6:3c95:7352 with SMTP id x3-20020ac84a03000000b003b63c957352mr2780010qtq.13.1673955354902;
        Tue, 17 Jan 2023 03:35:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673955354; cv=none;
        d=google.com; s=arc-20160816;
        b=Gqd9lyRjdZqzabeCgbqB2JAtIRyTEAPs1W8DtOYwgHDqp1xb7bokcEHXPbrhCNZ4V2
         /5V0U/M9SV8hSaBibWGUdZA4gB680nOss0dmysqkuBFkf3BZrcqMQUMj8JmVoRLkK3A6
         AEdTGbk0uJkuLM1qSK3NJmCKriQaNh81E8wt00k/pqVucU0RdN5Kv/GnQGsmZp2ZhhI6
         G0/9l5qyQd22Zs/awm+tfTnnlGXRZhJZ8dFM/30p4EEmXvITlZ1rjQ33DW25oMf2XciC
         gIeDjlA4Cbp5xBEI1LXPcifaSWeFwn8CPnlp29nByUy4atcT0Sno+cVgC58hRXAhg6EA
         BxnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=TyYmPNOg8nIpNU/hX39hfcm7D13D/i+/kHYNQoqc/wI=;
        b=nudJSSLzj9bwkGaGGSyaGXGXboYEUdc1KLuhDy5v9DOjtQuJW1ZNwIIUM8OIuZ1l/q
         B1dnaWFzQnrnK4eyF+tkXsYSeCOs04mkjGqGtG4OasS9uPKbfkeEey6mK7aV/vP2J6Kk
         DAkJWcGQTbEAC19/xbhvZXOMfm3yfLJv+J9zCC0Wjz2PCDdMsovPRFaUr7c989Ma48/C
         RyRPKvPjvV0HIlhq8Rfm6LkSGr++5gPHOzVhoI/7XWO6VXx+m7vrJXXJGhtWF78TuewV
         E6uTELSNdWQGUOImvJm+WgPVmvPsn2u8KJJKqUmrpQccEjTvj8dFA432xso7Dr1Gxb/q
         1/Ag==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LgEWZmJn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bq17-20020a05622a1c1100b003a58279c54bsi2506528qtb.53.2023.01.17.03.35.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Jan 2023 03:35:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LgEWZmJn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pHkFh-0003no-UB; Tue, 17 Jan 2023 06:35:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pHkFa-0003ld-ET
 for qemu-arm@nongnu.org; Tue, 17 Jan 2023 06:35:39 -0500
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pHkFX-0000XF-GN
 for qemu-arm@nongnu.org; Tue, 17 Jan 2023 06:35:32 -0500
Received: by mail-pg1-x533.google.com with SMTP id s67so21719581pgs.3
 for <qemu-arm@nongnu.org>; Tue, 17 Jan 2023 03:35:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=TyYmPNOg8nIpNU/hX39hfcm7D13D/i+/kHYNQoqc/wI=;
 b=LgEWZmJnFFrCoZPDq2BMLnWu7wsaKIy7RJN3/Gt5OwALDIuPRB5gnCsGBrVgQo0qdh
 mun1Rs1KoCNQi+h7VRt9VXNu0T5uzvwRvDe4FX7YJCA/qcY0B8IxPMpN5jFyWCqgTr/f
 XE+0EnaVvMIbhI8MOUQz3UnBct5nNLOzddc2uyFrh4oYUqIPB2InkD1GxF6oEp4cGweJ
 WS0VO9U7KEPS9iTz9VErQo07zPkQyD3skpVQISq9m4DUyUY4U9o3zEAgMYoDUALF/PUr
 PoMtP69ZuhPPWJ8usIZ43fdFy9nz9/Tsw+3cCZKnun9snDHrZmwcB5VinrNwU+0l2pKJ
 Jdqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TyYmPNOg8nIpNU/hX39hfcm7D13D/i+/kHYNQoqc/wI=;
 b=LQ8ySn43LpWt+pkVi8CBw/2m45H8UjGdi0c9ZVF33SC6DMEuxbBy3MvjU7TG4UzPgs
 Fa0qwM5Ry7Z0B853u4ioPWWTs94XwUdcsP4Sp7GsYOHpVOE7V2hcF6EEe6Kar1Al0uvw
 iBTHMHi8qjUazGmRoGjSO1XQ7OnoLn7Ktdy4onD1VgVq1vi7Jia4FJ9oKpgbTKrTeuSK
 yTwd1oTS2YyKtQaFvI4YB7hRaF40unPpOzUgdYmg5EUmwAVUrxIiGcP9/QHt8wl2cGOZ
 fJjBgZ4hSM/3C4iyzmy2fWYEAi3+ec5omUGqhf5JoERcUxDzwrgXTW5ygsxfQI/o5aTR
 8Bwg==
X-Gm-Message-State: AFqh2kpD3ts8aVWJ2k+q902260rQEH9FyQfkLIZiIujO1bZzPqu8xfGf
 9QKEwiVnsU5/ey0SfoxPoHNEis5HacgPjNJnN/2FmA==
X-Received: by 2002:a63:510f:0:b0:477:86c1:640f with SMTP id
 f15-20020a63510f000000b0047786c1640fmr207885pgb.231.1673955329209; Tue, 17
 Jan 2023 03:35:29 -0800 (PST)
MIME-Version: 1.0
References: <167330628518.10497.13100425787268927786-0@git.sr.ht>
In-Reply-To: <167330628518.10497.13100425787268927786-0@git.sr.ht>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Jan 2023 11:35:17 +0000
Message-ID: <CAFEAcA_50YsaEZ4KX5T6r01y8sFJZZ5fYccF9kBJgL+_epbTGQ@mail.gmail.com>
Subject: Re: [PATCH qemu 1/3] target/arm: Unify checking for M Main Extension
 in MRS/MSR
To: "~dreiss-meta" <dreiss@meta.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x533.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: uwrENs6BMP81

On Mon, 9 Jan 2023 at 23:18, ~dreiss-meta <dreiss-meta@git.sr.ht> wrote:
>
> From: David Reiss <dreiss@meta.com>
>
> BASEPRI, FAULTMASK, and their _NS equivalents only exist on devices with
> the Main Extension.  However, the MRS instruction did not check this,
> and the MSR instruction handled it inconsistently (warning BASEPRI, but
> silently ignoring writes to BASEPRI_NS).  Unify this behavior and always
> warn when reading or writing any of these registers if the extension is
> not present.
>
> Signed-off-by: David Reiss <dreiss@meta.com>
> ---

Hi; it looks like you didn't send a cover letter for this patchset.
If you're making contributions in future, if you could send a cover
letter for a multi-patch submission, that's helpful because our
automated tooling tends to get confused by patchsets which don't
have one. (A single standalone patch doesn't need a cover letter.)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
