Received: by 2002:a17:504:1f11:b0:1be9:327d:8ee3 with SMTP id z17csp229606njl;
        Tue, 8 Oct 2024 07:25:00 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUrmWp60NKXbYX0Znn535PZX0kp1+iXRJXFQCpx7razqZ77CWEjq3pcBmQ5pU4uUrvf0gPs1LKjhPm/Lw==@linaro.org
X-Received: by 2002:a5d:5d86:0:b0:37d:2e67:222a with SMTP id ffacd0b85a97d-37d2e6722c4mr1213568f8f.18.1728397500096;
        Tue, 08 Oct 2024 07:25:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728397500; cv=none;
        d=google.com; s=arc-20240605;
        b=HUr698knEDrmFtogmTYCACxeNP9H0IWcMQuFLi1Q+TA3ZBiVLNx0azPdtfM2Fkc0/o
         fahy1uuVAMnboe8atUOtbpP86qiOuERiZzpgEdeBwmV/KXIQKoq8eXPgNL5wLNoy7SZU
         MrOeEJIgzoWPi2H1iV9FnZPdF7dTY8zdYWYQVcXyq7SNNYXzBoKEU+VesSbdkm/02s6C
         cIZwOLg3XT8orayuRYyz8PMB3N/l4INpq6BUUZuPM8aXZouYLw98lN4Jvk48cl+E0IcZ
         r43eW9AG675iYgWvm7jX2dIXtgE+eP+a5xMh/Hohn3+f2+MfUZ3P8FHzdEXMoaoOJodG
         cENw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=5YRc+xLkBL7rEj4z4bMMDdrYWfvach9L5dpn/9o3g/Q=;
        fh=/EVz7ZhQphQnq1wPTBAHqcbr0cbM8Qb6fGnkiFS71XM=;
        b=I/HLGkxSzC2vyHIr6Ez35Kcrc4HOAXsYPrSzh17qWRFF+v2dXdxI0SbpJoIbfOXSiT
         pfBwb8bXR3EeQm+HPrXB8pQ4V/uZQGrt8NPhGgVZj2m7dypDkpvv6dKq1tRH8KNbUSD4
         8C6Qqld2Hjsfm74ZjWBcRrsYzG3pcGxkQwGQ32aeBbCkvCBkMxS2fsfUCiUxqM9ce2Yv
         uQRpmNps7Upxsrrjg2RId/nC3GwKBTmszqqOQwYvbF+YEKZDHTV9UD1wxFMvt1PPjJla
         f2zoS7XT8E7EFnfU19ndiN/lLfWWElGg46d26t0or0f+0uU0MkTPpBrU+cpZaRB/CqGJ
         /OHw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MIBJvG1Y;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 4fb4d7f45d1cf-5c8e05e8f4bsor2091769a12.7.2024.10.08.07.24.59
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 08 Oct 2024 07:25:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MIBJvG1Y;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728397499; x=1729002299; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5YRc+xLkBL7rEj4z4bMMDdrYWfvach9L5dpn/9o3g/Q=;
        b=MIBJvG1Yhuu8f7yzWCjiVdO+OVz6+rUeCGo71ViJGapl6bCyeQ9Mhzafg5IIaLv2rh
         0Ua6GPhmihNIAyc8e/rjSbjc/Jwz4FuRR85kTDjsqSFJZbVgNchncZoLGoDYEOcwhegU
         O1sCxBAiZaI6fVgElQJau0wwcif+NIF5xhP5hstiV5Ii2QbFhqCpv+jycMdmkf3N4NxI
         TykUq7GGJ4uqAeZoY36jGZZRaSaL8EVL5VNCDIu0NuYDzhsUymINtyiQO24I5hZTm41u
         HkM0etFqJNifjbqCArxF/1rBF4T7rCnouzRa2qGJXBu9I1KLBzt05c/LBWPF/6K5Gbx9
         OLOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728397499; x=1729002299;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5YRc+xLkBL7rEj4z4bMMDdrYWfvach9L5dpn/9o3g/Q=;
        b=i/IuNOAebauCoqvpetobRgLm96TR82I7gPbGCD2XbRPWM6BqbfSSF3fr0rlZ3FtTDb
         APBhnVBqjy0hIT4Jto8rBYfW5YcEXM6knK8eE8z2fJ7xuO6AySejWFCoQvVjhUJ4upTo
         Xq7cIuHFDE/3mivZApGrz8SrQM9H43DYHFUCSbkFQt1ORGnAmqOgUEXLZlT79H8T3HZD
         bv8ZsYXxp7fJVlbVPtnRpWUieT0iIzvtwpRLHKoa5qKohcKyAFhUH8FAQ08sWQHBLt2C
         SQrnlkjMQ/uA0+7LOnfAAmv1XuFJtBs6q/D0JSss4+jlSRU9tM6/TSxx+/yHaeW7A+P9
         gNBw==
X-Forwarded-Encrypted: i=1; AJvYcCUvdKigHln0OqhygObOLS6VvjjyZsrFi19x3EzoFYrhyDpGjEzPhLKG4AfEaVusApPn6trqVVjJiAtv5w==@linaro.org
X-Gm-Message-State: AOJu0Ywp7da+17UQprdpM7AO4VnVCanL7ZbKNVPYK/Psd4QoO4DC9SQp
	7j6TfZeeQ0OtJLY295fK6kULGw56t3gSsK7MPi4l698l1UT02G6cy13WFk7nEXEWTmPbqTpvcl/
	Bo7jYRNcbA5UKpCViGVv8OKGE/2rgMwwzL9aFXkfe
X-Google-Smtp-Source: AGHT+IErA76QiWFcH7UPLGvZv64Oin3x3QAEdAW4jnjp4KbXcniSCMz1atP2hbElJp8KX19MhLFWdH+zy50EfDXYxhU=
X-Received: by 2002:a05:6402:401a:b0:5c8:861c:28c with SMTP id
 4fb4d7f45d1cf-5c8d2e736e2mr14027403a12.23.1728397499480; Tue, 08 Oct 2024
 07:24:59 -0700 (PDT)
MIME-Version: 1.0
References: <20241005200600.493604-1-richard.henderson@linaro.org> <20241005200600.493604-18-richard.henderson@linaro.org>
In-Reply-To: <20241005200600.493604-18-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Oct 2024 15:24:47 +0100
Message-ID: <CAFEAcA-P-LWKKGr5iTJ+zLkRbY_jG674-tz8TLxagjmPYJjNqA@mail.gmail.com>
Subject: Re: [PATCH v2 17/21] target/arm: Pass MemOp through get_phys_addr_twostage
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, deller@kernel.org, alex.bennee@linaro.org, 
	linux-parisc@vger.kernel.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-TUID: Y1Jctpjyh5/R

On Sat, 5 Oct 2024 at 21:06, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Pass memop through get_phys_addr_twostage with its
> recursion with get_phys_addr_nogpc.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
