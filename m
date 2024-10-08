Received: by 2002:a17:504:1f11:b0:1be9:327d:8ee3 with SMTP id z17csp212904njl;
        Tue, 8 Oct 2024 07:04:39 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXVlngYpOGNXok7yDvkysiE1KLblUG4oU267k57EKpaX6OgJIai+TlKv1J3DrCn5mVJYMMTkM172Erm4g==@linaro.org
X-Received: by 2002:a05:651c:548:b0:2fa:cc64:616c with SMTP id 38308e7fff4ca-2faf3c15875mr63487611fa.15.1728396279466;
        Tue, 08 Oct 2024 07:04:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728396279; cv=none;
        d=google.com; s=arc-20240605;
        b=lk+PKByaZFgg14Se460qGN5FZT3ZRil9F0npmESvkC+qIP8NA0g1C+2KQ7VHYi0fY5
         fiFbVmO1dV8rUblpOWp4Svqiw6PvXji+lb9Vekjtd3WCH0fY+tgbE4MeaLQG/K/TJRvX
         yM2iqJbYj8f7qGds7QxtrdJEILg18gLr9Q8TaNaK5mR3P6vGzKANqLI3QvPQNv8P2/oS
         Qttp7HCi8htqVvSdj8VqdDzaV12e0D5/BYiKogKTsiviGAbNXTPrL6qSO20NZihhnXCs
         nr50GOHCEaZ2yQh9CNtBW819Db4aGoHDveb5RCce9k1YPn7Fy7rg27uTHH8JlQD23yNL
         ttRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=o1qSDScTeeLaAzPcPpZKLPt/co+VeoQz2jK30EZXs6M=;
        fh=rut3A0wQuo1e26rzlwF37xzx1dFZs6WOeE04Zo4fGAY=;
        b=Q+I2jToPraVD3iPbyZgw053XUjULniv6a4a8KBpbTPrtSSbuPTwJc6QRg/LpBbs00D
         IZxbJCA8fDpQZRXJvtUxvyV1g8fSXHDdrdunWUXW/w3SEYQCNih7c3LlaiiGt6jm0dZq
         ZKYTK3GpG43Zy4agT28CwseMM+hvdr7pbRxpBrzhbDCCwObO4QCIM2yU3M+Vdsqi5tGr
         asQl8B9NXqmke5dyNHGFZwAeWeBkZwE6iVHjMKRIHtYgCxPG4GZ2Djrb8O4kvdWlJoZV
         l0U4LGRMlIMfkF8YckMlbSz2JWiB7Lpq4p6u/P3LBBIGmx+ogjkP8PAzd1f/b2v23HT5
         u1fw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MCrRtRCH;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 38308e7fff4ca-2faf9ac143bsor10575681fa.4.2024.10.08.07.04.39
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 08 Oct 2024 07:04:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MCrRtRCH;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728396279; x=1729001079; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=o1qSDScTeeLaAzPcPpZKLPt/co+VeoQz2jK30EZXs6M=;
        b=MCrRtRCHgA1TfLZsXOf/3h6cnM9pgtpNYbu6NkGx/9GTDzcOnq/PhLmAiem1IHHvxj
         X7GNewICul/mBUuek0dvXeeTGyYh+BXXGy9HZJtOsgcDQo+ExjWbrvyWyeIDbLwsGUoE
         y22HM48+e/iuXY4YlhuXqPFZzYZ4eoHF9kge8jSfL9sMwg8cZeenpitOSGuojdX9Hbi2
         643LVX1gdbHuzSuytIyRqEZ0TtSY5ySQI1UrR/UwyRw+ZTjMlL9WGFy+vo192xfg/huQ
         7NH9yV0dmQ8Lzo8p0VXNJiZJsUUbQbZYpMyAFe2XUHovImZKWhRlfB2gYUjvUPNxb43e
         +TTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728396279; x=1729001079;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o1qSDScTeeLaAzPcPpZKLPt/co+VeoQz2jK30EZXs6M=;
        b=lb+CRX877sDACfmuOmYzBB8JHdzxIeKAoXZWJk0c/LfIWhL1N52XZfwMyfFncDBZN/
         JLtPf58wIVP/jKWThNl9GuNHGlG/eInqQPzjYzpLF5H76+akkBkPGGyhsElZb8pEGrYP
         BmJ+YZ5T256gdX0x69MILOvOpQ8Nq1uVrX/UG9WIVTCN5aIY0rSjx06QsJUsUJB8DnUJ
         SIp4uWH5TSmAtXEknSIo3V5flCH5eHfcYHidl5daeZBP1o8F63w1ZT1a+u8a2VewyR2N
         QGoKE9Xn9Of18tWtB3MCGiFAgPOF33luoQlQrfifFguCxXoFc/40TAffEB48VrHrtaWh
         igSg==
X-Forwarded-Encrypted: i=1; AJvYcCW6x9be8LRusjEvcxUQG0chml+ImfUFZ1JbHwD5UmOtK0rvpIgCaaWyzDX3h+tnTqY3hJJVS8fxm5ogoQ==@linaro.org
X-Gm-Message-State: AOJu0Yzx36Rtdt6bSQia7Ntff+SSGzty9S27UH9/Nbk4Sw4mxSZnMGTT
	lWxXbClNZPEaa9Sm2XsPgCoWE01zFt0DFAEetlFZ2dN2IrjKYpYgvHFEz+lKzrHKEOrm0iQuw/O
	DQObEPX5Bgt4W8cAARZBdd+BQq4uyRHI7GHqjPPGS
X-Google-Smtp-Source: AGHT+IEoUVUPWTcIHGH0LtYVq6h9WCiS/hR9j+IQy7BDdEdvR0uKHoGPapc5HDxL6pSCVaVZMo7DnZ+d7Y0OjB6uDXE=
X-Received: by 2002:a05:651c:b10:b0:2fa:d1f9:9fb8 with SMTP id
 38308e7fff4ca-2faf3c0c4cbmr80108671fa.8.1728396277172; Tue, 08 Oct 2024
 07:04:37 -0700 (PDT)
MIME-Version: 1.0
References: <20241005200600.493604-1-richard.henderson@linaro.org> <20241005200600.493604-2-richard.henderson@linaro.org>
In-Reply-To: <20241005200600.493604-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Oct 2024 15:04:25 +0100
Message-ID: <CAFEAcA-++cf9jxuihQxkdPhXRVHs+HnngPdyXh=ibh1xv3Bvyg@mail.gmail.com>
Subject: Re: [PATCH v2 01/21] accel/tcg: Assert noreturn from write-only page
 for atomics
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, deller@kernel.org, alex.bennee@linaro.org, 
	linux-parisc@vger.kernel.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-TUID: E/J/kWCTSEQc

On Sat, 5 Oct 2024 at 21:06, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> There should be no "just in case"; the page is already
> in the tlb, and known to be not readable.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  accel/tcg/cputlb.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
> index 117b516739..fd6459b695 100644
> --- a/accel/tcg/cputlb.c
> +++ b/accel/tcg/cputlb.c
> @@ -1852,10 +1852,9 @@ static void *atomic_mmu_lookup(CPUState *cpu, vaddr addr, MemOpIdx oi,
>          /*
>           * Since we don't support reads and writes to different
>           * addresses, and we do have the proper page loaded for
> -         * write, this shouldn't ever return.  But just in case,
> -         * handle via stop-the-world.
> +         * write, this shouldn't ever return.
>           */
> -        goto stop_the_world;
> +        g_assert_not_reached();
>      }
>      /* Collect tlb flags for read. */
>      tlb_addr |= tlbe->addr_read;

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
