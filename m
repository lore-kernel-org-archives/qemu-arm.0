Received: by 2002:a17:504:1f11:b0:1be9:327d:8ee3 with SMTP id z17csp230006njl;
        Tue, 8 Oct 2024 07:25:35 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUudmGK2aZVDpnq+ibB5JOpDq/U2yNM9dow+bm5AAEfRAhAQlluNYnPimWkTH7zOcQJiolL9Ahr29GpOg==@linaro.org
X-Received: by 2002:a05:6402:42c2:b0:5c8:93fe:3f7e with SMTP id 4fb4d7f45d1cf-5c905d12b9bmr4075886a12.11.1728397535691;
        Tue, 08 Oct 2024 07:25:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728397535; cv=none;
        d=google.com; s=arc-20240605;
        b=fvTTRuyxE4CUgPxz9721SB7mve9td2nIj3yrOEBQHargcA2byX8LO16vUibmLjo6ii
         /sN+3xayF6UkI9hWaExyjZUHQgzBlOYBWBEpxamPx/Iqmx+NDADuFTEALL2+ITQjpy3V
         8DyJ3tOKuUsXV+chkC5ABEF7kAwMGoiwUIksHYvvqmZ+b9Szlg3EMeTwD3Q8UKhGJB2v
         rtB/J2mN9CDl2EI2lLUOTWB040mwtGCQPEBP5e4HlMez+h7/3NBDjqkAoY78DQR8LJqh
         D7j49JgB0dqae4FhmLPOVvy8+lHElYk75RjkqMR/AaDay/moO4hBW34hSH1Nlz1XLeKd
         cyiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=KFyOI4kR/oCoxSqEZ5bt7UtRlDCHr0O31AoUd84Ktk4=;
        fh=9FcagUJg4P6vO8LgPq0a0Ptic5SYQzbTiQNwVnwbWyU=;
        b=cxArx4bwuiyDQ/Ri+j3cvGqRWKdJccs1wMe8yUWY2W7KCmKjwQZg8HQg2rJvEEjfVV
         abWW4AWmcmrHou0HfEVBbczMo4S3J3W5MaiSwSceZiQzYiK9Sjfnsj4HwT770ez9rJUv
         lQq7byKPRI0BUU7o5b4k6gLRVLt39NsBayR6P+dIX/Fut5o/Wz9Xk/yt62p3PBlDFCn6
         PHoCNFigng8XTRGHrLkJDXstqcPwIiTaInm1q58pq97E8CjDz6MrU31oO8d/bP7TyAl+
         zb6V8r1GcFsYC88SPKhZOI3+eKt8lsajRGcOP/PjP1Y+XvjTIeldnrxWfoEbLIqPkC4p
         mVTg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Skw5KTzk;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 4fb4d7f45d1cf-5c905accd32sor1057349a12.2.2024.10.08.07.25.35
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 08 Oct 2024 07:25:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Skw5KTzk;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728397535; x=1729002335; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KFyOI4kR/oCoxSqEZ5bt7UtRlDCHr0O31AoUd84Ktk4=;
        b=Skw5KTzk9tv512vBTGy+Itbjid9eLeTVOWXeSFBLL6+soDvyJG/tnXUnwTgRYqFs3O
         zvMyBWYv33h7czEw6/fUNtYlY/XLIjBNEGdMu70ZVbTIIzchHCAY6o0KGTuKctScbfSS
         r0LgaP3f13fFqb4U4nvylvWJJ1j0E0KD5rfFtNoUcs5XSyy0elO/0er/OXpGTKKJaPiM
         0+7Asb6sfUsN8V3pyEN41ieZJWghVDCeS89c6Da0YWvb4O68EdGyzbRsA3mCa35U4j3v
         4/StQAwXzCrVCpkjYMLWa23XZPoec2k+0W4SKsMEQipeD1wcShy1IGoUvmgNd7ST6yu8
         qi9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728397535; x=1729002335;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KFyOI4kR/oCoxSqEZ5bt7UtRlDCHr0O31AoUd84Ktk4=;
        b=H49PFMdXYjXMjTCeyyKQdZMTISScGTM0fUJNVJMyjJvsvFu8HAt/YY1SLpFfRJ/ONT
         mkd7cM08ziGTdaMtwYTULFDl4p20i+uI3LuAr8MyjSt0hXtlTuvTrzqWZqQKbYSBjF5X
         XPCToea1jgc/RpunEvUreT8o1c7OIaPJ+pYJmWy1r2PtPA1WOiZDI8yz48llveRfGTwJ
         IJ52zxHWq3s/aL1hDpoOD9EyKB6fXFrdZYkFHxVFlyLTUlxI+F2dXA1vOGLv/ogM3xMV
         gSc9P+3d30kQnTfHKGHs1FQA9/viVroc/SE+kTmrU3XlCihXSTP16dlE1qjPMhRBTLhY
         tWXw==
X-Forwarded-Encrypted: i=1; AJvYcCW53cUym2ZCJcpv4BX6DJ1rwHeTP3z0CEWGQSchbC8HIrdg7AtnE8y0lQydKvZKZXtSRioVCzfUPisnXg==@linaro.org
X-Gm-Message-State: AOJu0YxrgnMWxFvMi/mtkMjLuiylu3tG/ITJOOqDaTyX6nXnhbcajw6l
	bdpwk+GDSX0LYPQrr4hujrHELPGhzjART1VWiqD2DqbptCyyhpvNJgl8lwpObfIRhL+N4h+RZnY
	pdr+ten7SE0JAcCcebHePm423MPouLFyuvmd6rroB
X-Google-Smtp-Source: AGHT+IH6vDRkL8posdyuwttmhFmsw/CjaMeEXHedCAmJUQDyqmuFFuzqUW413BB7Q7kpg2ghdilkoR5TzKy13fwkI/0=
X-Received: by 2002:a05:6402:5187:b0:5c5:cb7f:e56a with SMTP id
 4fb4d7f45d1cf-5c905cfc19emr3762017a12.1.1728397535021; Tue, 08 Oct 2024
 07:25:35 -0700 (PDT)
MIME-Version: 1.0
References: <20241005200600.493604-1-richard.henderson@linaro.org> <20241005200600.493604-17-richard.henderson@linaro.org>
In-Reply-To: <20241005200600.493604-17-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Oct 2024 15:25:24 +0100
Message-ID: <CAFEAcA8aKThqSWLwCAEb3ec3QPtBowMfvgRn8TxN1C-kGcrdgA@mail.gmail.com>
Subject: Re: [PATCH v2 16/21] target/arm: Pass MemOp to get_phys_addr_nogpc
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, deller@kernel.org, alex.bennee@linaro.org, 
	linux-parisc@vger.kernel.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-TUID: VEnphU0FcdUd

On Sat, 5 Oct 2024 at 21:06, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Zero is the safe do-nothing value for callers to use.
> Pass the value through from get_phys_addr_gpc and
> get_phys_addr_with_space_nogpc.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
