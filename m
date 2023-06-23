Received: by 2002:a17:906:6453:b0:98d:a79e:b696 with SMTP id l19csp72479ejn;
        Fri, 23 Jun 2023 03:40:36 -0700 (PDT)
X-Received: by 2002:aa7:d902:0:b0:51a:4a3e:c9e with SMTP id a2-20020aa7d902000000b0051a4a3e0c9emr12653452edr.11.1687516836027;
        Fri, 23 Jun 2023 03:40:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687516836; cv=none;
        d=google.com; s=arc-20160816;
        b=t790xPj8SVDzgwiTEdE3CsOr8y+71/bGyAI9SKBLJtf3QB+52BaoKngobgqwmDTLXL
         zDGJOh2DtFxNARNuW1QNAOCFNruy7Tkd/61xZEJaBLHe5KUPsYKXmslUaJ3cahTz2mF7
         2evBPO6RDNO+Zhb9mL3bAjYS5eG6eGxtbrTOsNTsS8wuziLCp1D6YWaOAn/uF7jaoPOC
         te6Fr8j4RYZhq0llx0Rm2uxVAEsrvqfcQ3m565Or6n5GpnGlcbgbsb71rcVBqSfblYW7
         3oW5Z6zG+E1SFKefnEt0Auu2mVDMp4BQOy/1jU4Gq9F7duo0Ws8Zhb0jr7DvZSYpkfH0
         /e2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YXFZsyp/XL+X7Zfhbibx83TVd1DCnGHs3FLQL/min0U=;
        b=m4VDKTILzV3N4u4XSalU4ZXaYqHociNc81uQCumje2JTNMgMVjUYqPwEdsmfOVffBX
         T9aiG99bpGZFBIw3kOM4G/fqspB+iUEQj+Ft+ZELFsctlCiZ/J08I1VSva8zkj8APl3L
         l3PVBa5XDdZsYSBslbWP1fyAiTco2uhJtO7oxavddbFihnaiy1ECR7fL506sCpHcmfeI
         31iii6ddJbdQ5Rk+zbZaSK1d7CweEC6uw0s+CqeoATX6jw0EZYbAG/mqTG1Iz7opzuuq
         yEjuoNgfwPmZOj0wHiAZbWQQU0gRvL8YILLqndhpPPDVTMuTnOBiG9/C1sVDPq12pv2q
         IX4A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZGaQRuN7;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id k2-20020a508ac2000000b00510dfcfea76sor2979457edk.4.2023.06.23.03.40.35
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 23 Jun 2023 03:40:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZGaQRuN7;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687516835; x=1690108835;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YXFZsyp/XL+X7Zfhbibx83TVd1DCnGHs3FLQL/min0U=;
        b=ZGaQRuN7yu9Ia9+5SDW6yRmrDMgAZNgebD3zq21cwS4kSCdcwOKdPihJbkVRbkCdbk
         6HWioHqfhx3uxtLIdqpqOM5vIW5oCeNsJvFRKeNwbmkOm12/B6nErIx3tiuBl5NKpWYk
         hV1b4az140L93jc7/2HfnBOE2DoxK+SoU3oZ0qYTDJCFugUBWjYz6m7hFgo8LmWvuQDp
         EyWCljMnD0+P3tARgzZb0udcw/wbkdTLtrjTsArYllFqkLo7quVP3awydrZZPOmUDmwm
         +DDBoE3r+kEr9e0PszauvbZ2wXowSfQHtQQkmLSObey+2rTN6RgbzJXfXLFbflp+HQoT
         J9cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687516835; x=1690108835;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YXFZsyp/XL+X7Zfhbibx83TVd1DCnGHs3FLQL/min0U=;
        b=E7pWWbKfyOb2QmNgan8M5vGhfZGnHzzGrYY4jUbG+e0KR41fPJJOS55a66ow3lWINv
         2s+Lv2q6vY7159fx1nZpm+lFqfBpsEzKTslgn2jz3tjMXJlquD7owNOv1uu4Bqd34u32
         lrt7DH+iB9gobjRYxYuRhbazElwauEI1R4eAPLyi2dBr3mcBWLef19LvlRLAOvcH3aWy
         3cMxHpTLGDXmFBiDcJm2qyUdZ4959vZ5MnmaLBJHacj9deJNQjM2MePxZyWDOshmnnHi
         TLo6XhI+oYG8bqTj5F/Nfe+jB94H9q+x8UI/Ubh/sk9ReCuPYrV88inv1Kp1WhBOkqRr
         8J5Q==
X-Gm-Message-State: AC+VfDyH/mA1egTH3SVgkfvHkRPla3lH3dv11aNZu/Pi+4YL7nrUw64b
	I34q4+q9ZzdrIkhKkbW+QRH/kHEcYSVhbGvzDM7tFVrNhUxYQZrRAZs=
X-Google-Smtp-Source: ACHHUZ7ZqMWPgNoO8OuNb/5VTaLf7NZozAS7sU2zRNgUMcxzAa5oViUN0yWh+4GnWNdvuJrDK+sd4jcO/5aTM1qZM9s=
X-Received: by 2002:aa7:d597:0:b0:51b:ecb7:23d2 with SMTP id
 r23-20020aa7d597000000b0051becb723d2mr2584226edq.18.1687516835730; Fri, 23
 Jun 2023 03:40:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230620134659.817559-1-richard.henderson@linaro.org>
In-Reply-To: <20230620134659.817559-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Jun 2023 11:40:24 +0100
Message-ID: <CAFEAcA-uEzWRu5q39DG2LrFcZk4iKJAUfZ=VvDxfHdjN01K=Gg@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Fix sve prediate store, 8 <= VQ <= 15
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
	Mark Rutland <mark.rutland@arm.com>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: 7nfJLjL9oLyx

On Tue, 20 Jun 2023 at 14:47, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Brown bag time: store instead of load results in uninitialized temp.
>
> Reported-by: Mark Rutland <mark.rutland@arm.com>
> Fixes: e6dd5e782be ("target/arm: Use tcg_gen_qemu_{ld, st}_i128 in gen_sv=
e_{ld, st}r")
> Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> --

Applied to target-arm.next (with the subject message typo
fixed and the Resolves: line added), thanks.

-- PMM
