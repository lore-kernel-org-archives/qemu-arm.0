Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp4129119wrs;
        Tue, 20 Aug 2019 08:39:13 -0700 (PDT)
X-Received: by 2002:a54:4414:: with SMTP id k20mr483854oiw.120.1566315553157;
        Tue, 20 Aug 2019 08:39:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566315553; cv=none;
        d=google.com; s=arc-20160816;
        b=Oq31bAyxiWTVEvW+CtVfs1+HmODiU3cyYI3ZXTEtYEJ6m8+vtqxKs3eWFb70nbdkG4
         f1YL6rp7KdpQnZPDNFr/bn7OOQW0Dcq9SD+DS9Wt/b5EfMscqj+5RLo7yxhRgEHJ8fql
         Y+9CUP5vQcqKmm6vels2OZU1YD9FPxWCR/zHwGQUqMiWwkaYjOC9d8u12boYoJqQGNM+
         YJ2oqsKkoKZs/ytoiye27JEGcr5TbqdKX1klBZcc9D/yUztbxa5gA79mipX/XwS15PTV
         /ned4uOrgXHSIhx5/MICsqwaTq3soYcCB4rD0qK0ssEneduQ0kMy+STcDo5d4vSPTher
         dMnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=5juL1btnjwSUicwKiFx5MZdwnirgkghPx0J2Xk0gzMg=;
        b=INjqINY1IJLBsasT7uLu3qmUeMrUnweGhBdQ7GfzZLEc4zua0jzH/wY5Qv0tnjo3EK
         ypjX0PpKfqBP/zOxwK7jAt64zl6rWAoPefFWFGlNTe3DJeOoAcNeV5gwF9m3SMrnDdC3
         VcaYccGUsn2ulRQ/iszsfijBvoCZbfENeMLeMPiVZLWOSEIJA8U6x+tfjqXO57qoiFnI
         z9gxBXMFqaEuXh09Ifag1Xp+qw1Z40dDHsPJbtWwRcfTEQP2jpNlwFN15mQRaGbg3ScF
         If02JLwMNRH4PalCgqOj3Kx5AYTaOP1uSOHeOA++id6K6PFeJvgvCv1ewPnO9ALMkXXA
         v29w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SXdQOeOD;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id g83sor1930448oia.146.2019.08.20.08.39.12
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 20 Aug 2019 08:39:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SXdQOeOD;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5juL1btnjwSUicwKiFx5MZdwnirgkghPx0J2Xk0gzMg=;
        b=SXdQOeODELfohnZDHhN0Gwjq9lhnaXvEH+5UERGG36eK+jrkhdYqukZTnLBTnDoNHW
         6F0IBmraCz3KzGebEKDy8aNsLWeA/xr5s3GchbgFAIAU8FT75pLOrY64xTZmxVg5WDSa
         ZkHAvmGGKiRk/7qlcZR1WMUaBxld6ssAOkLAU1iP7x7Jdidj6pcA62fIboSZSta86IDB
         5UvnCa7uxJnUY7Z8/As8kBtA6C1fzQyVFRldeIzUBYAD7y+L4Og9ZOnh4hwRo6+P7/70
         dTYGCvhK9QO1a6L9JhactH7TQFXPmoOkfkrpoA7TZl2j18pDGiwQtfIS4jVavrgOTJU1
         KwAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5juL1btnjwSUicwKiFx5MZdwnirgkghPx0J2Xk0gzMg=;
        b=AuqKTYTQ0mI7CIZci9m2KmT2N8+VbvyI3av/MwfrpWWCSscPnOostENMoepCLFzDWk
         Q3uBYrTVHyXSJbNkkNlvj9FUBzavIyniHlL/9Uf5S1tUs9awFgdZ/uLNzWABwRva+zLe
         Xy4Pq+KMLu4PadNBu5eroCAe6Vy/8/DJhZNhWbbMecVSXkFZPVwElu1XnUqwjQfvQ1XS
         YOnBS8IIfU9f5PgTyg38/4svNXda1E9a9yjVvGMjeO3TaUfgEsrahuhRGiRG9sgsAOey
         7AzW6wMLKvUbAhHU7EiFWx3q3FFY/Jjha2AAHjUboHlwnNv2U+EjrVVU9IloRlrjS+Yu
         eCxg==
X-Gm-Message-State: APjAAAVDcDynYrY0nOPrLzV2ysa7NWZPnpjA4MpNFxDneZq2ACGAeJ72
	8F7SftAnQoViHQfVyLRKoMELhXZXt4VIy0cF2E/++wJF
X-Google-Smtp-Source: APXvYqyGCjjnP9WH0un4PJnQAKBx/FV0T01DvcYa1RfAH13jb055VhHd96TWjk1wB3MDtOFBKsFtqU+s0YPH6yqPHT4=
X-Received: by 2002:a54:4718:: with SMTP id k24mr484991oik.146.1566315552728;
 Tue, 20 Aug 2019 08:39:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190803210803.5701-1-richard.henderson@linaro.org> <20190803210803.5701-5-richard.henderson@linaro.org>
In-Reply-To: <20190803210803.5701-5-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Aug 2019 16:39:01 +0100
Message-ID: <CAFEAcA-_gMkE-0kA=xyUyNKxeqX0n6B-9i_7132xfFXQNRqb6w@mail.gmail.com>
Subject: Re: [PATCH v7 4/6] include/elf: Add defines related to GNU property
 notes for AArch64
To: Richard Henderson <richard.henderson@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Dave P Martin <Dave.Martin@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: nOxKF0FF7Abg

On Sat, 3 Aug 2019 at 22:08, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> These are all of the defines required to parse
> GNU_PROPERTY_AARCH64_FEATURE_1_AND, copied from binutils.
> Other missing defines related to other GNU program headers
> and notes are elided for now.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

What's the authoritative source for these definitions? I
tried looking in glibc, binutils and the kernel without
any luck.

thanks
-- PMM
