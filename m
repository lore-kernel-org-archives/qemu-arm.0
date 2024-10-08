Received: by 2002:a17:504:1f11:b0:1be9:327d:8ee3 with SMTP id z17csp227830njl;
        Tue, 8 Oct 2024 07:22:20 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW+W/FwhzDoux/iChhCLQTsvcqZHwIk+YGNB2W4FjMUZ/FKQ1mr4dFzOVtSCfgybuYI3OT3ry8P8dSTXg==@linaro.org
X-Received: by 2002:a05:651c:1a0c:b0:2fa:fdd1:be23 with SMTP id 38308e7fff4ca-2fafdd1bf8cmr52498051fa.28.1728397340231;
        Tue, 08 Oct 2024 07:22:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728397340; cv=none;
        d=google.com; s=arc-20240605;
        b=H44aSN7JyHWa+2+OGd5muWNWfHQc0aVwAT8Galt9B3COjVEhzX+dosjrvfaFxDgVRc
         OjN39Pm+iVRF0tJNv81xOljmP2Yg7kDZsjVyiuYbZ3iLl12Dd52oyOAoJ39ZI8sMRbnR
         tmixvhs3M155kXCCGK8KE48wpzZ+1p5lwb4QI5JmUNNwvwkASVB1z5D812RZ6YjjzGMg
         Jf7Cx/bNGxi5Vq6YU0Z4EiGn5xI4BjbmXczLmuigCzHxLGLkHwTklg3iOClHvwVEZoos
         RVYYsQjab5eouTy1CzcUBDtOdFQvihaqtJga4GT3uRlkiJd9re24dh0vCL59f7uNsDx/
         zRBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=+BvfchHhPQ7gPGGaaZHCBCIR40F9CMJ0dK6KyV3qWO4=;
        fh=9EyMILTUcFCrJYkq7v58+HX76CFFJcMaBYdBxav7h9s=;
        b=TrlY9ff9mNSDjvd7zShGl0nzbj55i7e4GTJbzWx/zxy2X8EFLmJiHQ1kHXt/42ZLmE
         CStXdRmUnapOF2jar1Oh+1HjQNbe7vODRtN7J+QpuB2vUw4mRX7TB7s5lx+4TgyFP4R6
         uZP29jJTtxWeA8jcZn4wc7K2Xqp9iLzBda1Fzue2S1lwR4uH0rbGDGNbkU04+vU58OjH
         BR33gvT/WRDmuU3rCgNDO7tJ/gQ9mSQWrDwuWZ45GVyXlqKem0ft/I13GkNUog05FjmC
         XDp8y6hzDoMfh/TPLGCdxNnGyxYixytaK75rHA5Ic/p4m5dOY95bL41McfTK0COdgtLZ
         OvEA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FW0MGOoy;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 38308e7fff4ca-2faf9aafefasor12920141fa.1.2024.10.08.07.22.20
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 08 Oct 2024 07:22:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FW0MGOoy;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728397340; x=1729002140; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+BvfchHhPQ7gPGGaaZHCBCIR40F9CMJ0dK6KyV3qWO4=;
        b=FW0MGOoyPdsxOv5QmKEQ12SIfZnD9OuYEc/N2EmLGplsgqxNi0WVRLbQQbDdRqHPU+
         qjC4AgT5RjXfrz7N0//Ikf9BHpc9pwdzUO9EY3k4V+3zaG4EN69tNV+kLamJjZytDun5
         jvNHOgDHyoJKx3+aGIFgFPydSc8TII9mn9O+FI7OWKQzrwLGtRc8UpzTS3KaujXm82bQ
         a8y1XTkVfDi094QjrBtTuQ4SB38aBhFcoMiV4YoO1KeL0dOLrFiadeEVCMlgKBUmiSxM
         lVRQ677y1vsSRSp6jqHCv2180ftFH9rXV6DrdowjJqTNPUXX0KXyoFthzyPYGp1zb1GJ
         5Rcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728397340; x=1729002140;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+BvfchHhPQ7gPGGaaZHCBCIR40F9CMJ0dK6KyV3qWO4=;
        b=ZRRPn2PnXpxP9v9BrdhacwAv9tluFfEbjrRWSip6b+pYbzuY6KzADUllR09A+TPHD8
         BrwGfGI9D0nW28sFZlU8KuZdX6vFZbUenBz3p5r1vSH/yOxYuQcq3eLmqHVIGq+djtUz
         tCR5O6xp2gophFMWqIFIPTg/LenGOyFGa2L/oqjONjH58WwSL6K2c8Jm2ZwMzNJYVVsI
         VBsygAUCzdHkFMRp7k8dJ8A6tvlP3npO2Es94BlSDeM75cB3ax3pZbxmqW4Z2d2yYLn4
         LS89kO3vtkRQ5I3inJ5NpBWAiv9PUXLmICu0bEPI5aoeO3a+F8Y7MNyPtvXwehlQQQv2
         uw5Q==
X-Forwarded-Encrypted: i=1; AJvYcCX6WWRVHaC0qUi9Yg6sd6QzMASInasEAc8tS7kLF1BLdsbih6YBkDlupAy7yObODN9P2OZ90IyVAo/jdA==@linaro.org
X-Gm-Message-State: AOJu0YyHyA8knFD7MjKJLiVVW8rZBIZtC+i+Ae0y+0xS5oCcsBAXgxnk
	c6lcX6gTrhceaXG3s9S4INgi8eDvbN2IZYrAwn8HwvHizRD26x+uwsCVq2RdmpKd2vD4OYp91o7
	CYF2tmHyYHGKIWL6rCsYm5qIvNYoohgylgoUqleg0
X-Google-Smtp-Source: AGHT+IFmXQafHCHVn3GzWhEybdP/4UqbZi2jbsBme2sr67s7c+XRVtVA7FWeMDnget/zTThstcHM7ovYa1KlfEOyvNs=
X-Received: by 2002:a2e:bc0c:0:b0:2fa:d4ef:f234 with SMTP id
 38308e7fff4ca-2faf3c0c07amr109766201fa.1.1728397339598; Tue, 08 Oct 2024
 07:22:19 -0700 (PDT)
MIME-Version: 1.0
References: <20241005200600.493604-1-richard.henderson@linaro.org> <20241005200600.493604-20-richard.henderson@linaro.org>
In-Reply-To: <20241005200600.493604-20-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Oct 2024 15:22:08 +0100
Message-ID: <CAFEAcA9ATUA5Y-Pz1tqaPoNrSbpqL_+Ag6YB=gN3xQzKhpH1TQ@mail.gmail.com>
Subject: Re: [PATCH v2 19/21] target/arm: Move device detection earlier in get_phys_addr_lpae
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, deller@kernel.org, alex.bennee@linaro.org, 
	linux-parisc@vger.kernel.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-TUID: ZlPLUq8h641D

On Sat, 5 Oct 2024 at 21:06, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Determine cache attributes, and thence Device vs Normal memory,
> earlier in the function.  We have an existing regime_is_stage2
> if block into which this can be slotted.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/ptw.c | 49 ++++++++++++++++++++++++------------------------
>  1 file changed, 25 insertions(+), 24 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
