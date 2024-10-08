Received: by 2002:a17:504:1f11:b0:1be9:327d:8ee3 with SMTP id z17csp220648njl;
        Tue, 8 Oct 2024 07:13:09 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUnJc6yoX6+xqS2w7XaPoL+XaVvKS9chynyJOacM2L07FhzZ0Xcnkr5CmmsmFIYg2pwpHIpoY5WwSbjhw==@linaro.org
X-Received: by 2002:a2e:a99d:0:b0:2fa:cf82:a1b2 with SMTP id 38308e7fff4ca-2faf3d70794mr93798651fa.31.1728396788803;
        Tue, 08 Oct 2024 07:13:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728396788; cv=none;
        d=google.com; s=arc-20240605;
        b=INEC2ayihUlIDCGBEQg2Iz9Js8zXBujZUjJkJGYxGqTwkOEpQSDhmY+RMw5lSTU58l
         a1HV3wSxUWFtWOMNhWLFRECjQXOE86ditYlKctNwSyUIuoe79+opEPmd/kMhIYWD6jwt
         29osD0a9Bf52rw3kzMfzRnTHGlZTHrfIDKPcpA44RMh+2b2vBlsi7D91VvffhKLeFwdq
         O/y9T4SIBfnv1b3PZBWqmpRWbYlT7wrvI3L+x7Fka2Sva/Jyx3VIP2Zmwnrv+NVD1QNc
         RWi5vEcF/HggXqimxKwcBF8VERElkI8GG/bft72mWZvP8j77J3BX+U+b0WOL3bKvKTY5
         wTjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=IilAgLFf9D3WPiImik68r3HP0LrP4VXSn1RvllVJUL0=;
        fh=moOcNGgYBX7jpAabbNQf55f53MTySMh9d7Gw5CWBa3Q=;
        b=k71IrwatlDfiBgdxLhTCoM3Ukj/Bcg1kA1iOvFNRlvDTWhhtxfpT11IEsOLq/F8J5Y
         JTUJ4Wybffu765vuoaS7AWkL61AmMzVC200n76FZwBrjim1S1SA3n14M57GD9wCQf4+O
         i88rt2bNzho0JbEAI8hlRx/oDx/nYeBKRRKxe2IdjHhc0TCV7Eb4f7BEpjnNWbeHp8XR
         iDXtNvqfB4r4qhERmcbsAUDyLLwLdp1OcfttOIcVkFQgNs9Nr6/q9qIeljgYODXENat1
         0Ko7c0CEYh65GoJ9RgAD4knrqLWAvPA++tJAnduT3LCJZvRlO8bojB/9Xiv8uB39+/I0
         YhKg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=d5+L6nTG;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 38308e7fff4ca-2faf9b0655dsor10635751fa.4.2024.10.08.07.13.08
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 08 Oct 2024 07:13:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=d5+L6nTG;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728396788; x=1729001588; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IilAgLFf9D3WPiImik68r3HP0LrP4VXSn1RvllVJUL0=;
        b=d5+L6nTGX1zdANrcwf0hBNaFkj4Wjs0kdctPVJeoYJCc15UBC9YpXiWtdsZk6l8KhU
         fs35ovpTO0q1g8Jk+PefaofKQ7hh5xhIi84BrpgnqiyXWPOiG0m+b/Ew0oGtU4p4GBGI
         aXwbk3WmYXLKwiE+VTY62dEW1cs1kuAP4DVC/3tkOwaCOX/De+EIVmM7JyTlAz8smWPh
         i466WOSwDP2ZohVLWWGrRIXcz+EaHR9Zlo26LdY7ikzT/Yn+vAcTKWhnL4YJaEgAWppW
         S+juF6Pf1zNANTzCCBVrQL6a6bS25u7UM11bP7S9DgKA/hPDoAr/nUnmwwZ9zZdyfNq4
         LpoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728396788; x=1729001588;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IilAgLFf9D3WPiImik68r3HP0LrP4VXSn1RvllVJUL0=;
        b=M1L6m5jlfVNgKePLthUFqv3muWuFunvd995OCzCKx9JdB1xteXB+QAdgOpI0UUA+eQ
         XEayxuCz5V9ij+yIdYUaTsTPJQA9qkUKpzOYvi2aGCDL7/fWcam+Cm7/jVBR/CIdfO73
         MLwNONxBg35yYDbO+T33HDoRB02ILOxzYC8gvV6/BclkYceiepTCcwgIof4Dtq8nZYLX
         p7imOAJeA84YXaD4Z7SyiyzKHWLO+zOMpjJEhbX8t/oREPfNyNUiOugfAsiHVU8L/6wq
         uSXTgUuOg5owRFfWqrtuEVKUfYQiyXCKZyRte7P7KIT/Yt5ODxcb8+illyBuxDx/VHST
         0iUA==
X-Forwarded-Encrypted: i=1; AJvYcCX7YPsVDKCjbcDibLY3AYqGe3nwU5ZyPi+Sd+DddqVNUDZfMGveNDBLyPzaJVs1Aeh2Q7lCq666sIxSrQ==@linaro.org
X-Gm-Message-State: AOJu0YyWkT1HrstSAoVFmlJsg8pCtLjdsydMp1dwOt3q38lmILvr4yVi
	dtFFKffo5hy/DQh4Tc+QW+bYiGEySjaw9izryjahMVja65NB+A182/NPyoyVsjhofYCHO1TkaVL
	ImGqng+g897j/zBEMk9z25u2PY8JTN3xP9RbRpija
X-Google-Smtp-Source: AGHT+IHX8WDeU6G0DWTwtDykB80Fzl5sFUDON9fa7jmgPNRDLEDPb4CCr71S9cNPuXQATiVBxQVvICmfLTtgmJ0ORaM=
X-Received: by 2002:a05:651c:a0b:b0:2fa:c6b3:bf1c with SMTP id
 38308e7fff4ca-2faf3c01f43mr79822331fa.8.1728396788120; Tue, 08 Oct 2024
 07:13:08 -0700 (PDT)
MIME-Version: 1.0
References: <20241005200600.493604-1-richard.henderson@linaro.org> <20241005200600.493604-8-richard.henderson@linaro.org>
In-Reply-To: <20241005200600.493604-8-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Oct 2024 15:12:56 +0100
Message-ID: <CAFEAcA_HQvZf0GT64vy3_KgXrGK2hq+Tu21y8w-WLbHsWGiBGw@mail.gmail.com>
Subject: Re: [PATCH v2 07/21] accel/tcg: Use the tlb_fill_align hook
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, deller@kernel.org, alex.bennee@linaro.org, 
	linux-parisc@vger.kernel.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-TUID: Xf4CfFPGcAN2

On Sat, 5 Oct 2024 at 21:06, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> When we have a tlb miss, defer the alignment check to
> the new tlb_fill_align hook.  Move the existing alignment
> check so that we only perform it with a tlb hit.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
