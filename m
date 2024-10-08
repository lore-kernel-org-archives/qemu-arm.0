Received: by 2002:a17:504:1f11:b0:1be9:327d:8ee3 with SMTP id z17csp228780njl;
        Tue, 8 Oct 2024 07:23:43 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU69TV3Ehg8RNZQco7iITwbTInX1UvnY0/v1wxfp3sXiHdn6E2c+lgwIG6CrC5pU9UObZ3NCrC2LWAa+w==@linaro.org
X-Received: by 2002:a05:6402:40d5:b0:5c9:60a:5025 with SMTP id 4fb4d7f45d1cf-5c91a7eae90mr333342a12.9.1728397422866;
        Tue, 08 Oct 2024 07:23:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728397422; cv=none;
        d=google.com; s=arc-20240605;
        b=QMMxd9B5sSqUyLl4vCwOz6ewnUr3eQp8D7cpbC1G6A7J68qIQEq4GPrrKyW2fioWqX
         jVasPyFE9SuvnpyCw+x+ilB1ehtgWGIaR05hKDxcCu8eJzuoWIhWoAf5pP9u22rZGgmF
         4Z8A2fUwnZk80Z50HRXOYJGmIqnxRunEwhajC3TISD0AklCO53VHi+mUDWqKByWAB3CF
         9p+wy+7biJ5B4NE7wVtSrIAwHdPdK7UImirALTtVAC5bz6l4iGlrDjeLUi6QuXSbDJMJ
         spOEO+pL4OagRpXPDsVHVYNCSwV2qq6sy0k06tKCKDSuoU5dPsLJCAFTOpRK4EY3C+Rz
         tSaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=kOWE2cAoIjDm9f/FqGa6G6t3ssB5Lz0udY0SFSrSxWI=;
        fh=kLd+8dGaih2qU3FibDqzLFGPOoL12jcQvpq6mRzrPXU=;
        b=G4LyZ81KwaRXVAo4RTya1F0y2l7LQteH1Bg1OZqKAxiGWJl/nBVQCatotOD64Cf8oj
         N/eXRlOC9YglCYi/RCBIZsd9WhGVOyBEl6qRgGEyDTczlHcLKbcgHFFiYVe4yKEcxDyT
         I/VkPLCB+LfLy65wZWw8lwTIuSGZYrN2uzqkbIPcVy6TBb7wkV8uH21kRk3s0tbNVX3W
         Xya0Vvzw8Iu8zkVldxcVv8Y3xhEcsyTrveHdlPW7Q0sVMTqXmE7RlUZ949GtxUJ7JVD7
         0pJ1bzbmic55Qe76TY7BLlMI3n+IuCxQgsQSdusIibjb4cLdzDix0rEcrCDPWMxzpkZ/
         UKDg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xrFzD4KA;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 4fb4d7f45d1cf-5c906c789cdsor942427a12.6.2024.10.08.07.23.42
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 08 Oct 2024 07:23:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xrFzD4KA;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728397422; x=1729002222; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kOWE2cAoIjDm9f/FqGa6G6t3ssB5Lz0udY0SFSrSxWI=;
        b=xrFzD4KASKX8q9bLoiS7E+fxmFLlhjYItiUKX5SZUjx1P113dZj3OiWRSL0R2CsYHW
         sipmml6iB2robvsXqdA2aIsOhG9Xt/noz9vmdLHFsLiV+A3cuYvuj7B4Gdubc8yqoP7/
         w9q91HgMl+AnLl/EpkQ778C9ZKDxCHvmC4zJ4AqW6y8IORG0dxqY1UwSR+zhvpN2XhGQ
         Tm6WJcMu3AOBzfHsmXYsCd0Y5mYSRwX7aeJX1JRHtbsP5MaSAs2rfCA6HL+oRWxF+pKr
         qxoWffG9GMpcJqxgUmHZHpSlx6PFYKIs11Co/ClNY0Em7YdLXrOvpdAb3qa/BDFE/KSZ
         xVXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728397422; x=1729002222;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kOWE2cAoIjDm9f/FqGa6G6t3ssB5Lz0udY0SFSrSxWI=;
        b=Fpfws33lDnCWOGq/vEs5mvZxzu0h29L0Kq8iGEksxo4yPHkAxeqbBHUffIutni9m09
         GN5niAKucdgf555RAGREJKM3lhijbYGpNuNEIhh8NfmX2svDTc0GxlBXtP+TXPTWKfXv
         y8dZuHnrsX1x7I1jDklA1IeBMAVESECRxf6UWVHAhx7N0pAd9DzYtR36noBLMAS8qEeC
         OeWVdH/KbFrSTwONEgY8CRz3tiskcWqCvGGKRFFZF3PaYzuWmWqCDlQ8f8cRSW7q9BVn
         37FlYCncjoU+5dbw+SXgU2eqUuetF7ccOU9u18iQ9MvcbMoGbi6SXZPSSqApFaNZQF9p
         GzMA==
X-Forwarded-Encrypted: i=1; AJvYcCUTZSFTXHxp30dJhjsEuhEy3l1FlDijYsVROehRXWP+n7zCRonWCZ7I2alJCg8aYO6ixmjEjW6Bvmhbmw==@linaro.org
X-Gm-Message-State: AOJu0YyPzLlQkagse6CsW6XWaaC/Pb8o2Fvo+qAyzkLxv9FNsCtxCcqw
	zSnIULmWg4IzFJcfnm+UC7pb3+HGCYOFw+/L8cpELU1hAv0iXD4DYqiu97oGIkT0uFqUPP3KXnj
	fMalXH98pwQxJjWQFvHuz4AfLclxt5rwUd+z78EB6
X-Google-Smtp-Source: AGHT+IE63NtOVMmF0vUbrtvnDhrwqy+4rBGeEL1dE3L0XoRqeekOTPKAuBVShJkbWSmwl9/McI6rGCEphCweGhdISKU=
X-Received: by 2002:a05:6402:2713:b0:5c2:5f31:8888 with SMTP id
 4fb4d7f45d1cf-5c905d4f723mr3483800a12.15.1728397422269; Tue, 08 Oct 2024
 07:23:42 -0700 (PDT)
MIME-Version: 1.0
References: <20241005200600.493604-1-richard.henderson@linaro.org> <20241005200600.493604-22-richard.henderson@linaro.org>
In-Reply-To: <20241005200600.493604-22-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Oct 2024 15:23:31 +0100
Message-ID: <CAFEAcA8dWB63M-x5KwuEH1xdoRdC367HOF2BOvUHrp0TSO38Ow@mail.gmail.com>
Subject: Re: [PATCH v2 21/21] target/arm: Fix alignment fault priority in get_phys_addr_lpae
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, deller@kernel.org, alex.bennee@linaro.org, 
	linux-parisc@vger.kernel.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-TUID: w9x+uHamsfXp

On Sat, 5 Oct 2024 at 21:06, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Now that we have the MemOp for the access, we can order
> the alignment fault caused by memory type before the
> permission fault for the page.
>
> For subsequent page hits, permission and stage 2 checks
> are known to pass, and so the TLB_CHECK_ALIGNED fault
> raised in generic code is not mis-ordered.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
