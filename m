Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp1403604lff;
        Fri, 18 Jun 2021 03:09:38 -0700 (PDT)
X-Received: by 2002:a17:906:2ec6:: with SMTP id s6mr10003598eji.65.1624010978793;
        Fri, 18 Jun 2021 03:09:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1624010978; cv=none;
        d=google.com; s=arc-20160816;
        b=0mqq2uoKMPwabVosXUSusEV/euFhidSKX6LB7rePzFVi7qJgc+XahOernrZ46Kaav1
         iz6UhhskGI9Q2hPg90898awkf4xSajiaEc39AudtU5j81yCQdQennhkfg1qgivjBmh78
         KSBrY8mPId/fMBMtdGHuLvbiZXE+DLQkDWLGV6ZEDHs22q02IF5JFgH9CHNkF3rE9wxr
         2hzR2hrY3FZM63fNcti2/JHFyJSXZkVMUbMVSnLk3KC/HBnhT9q+V/2fa5ldUzQdQFly
         tzBdqhrWxx/i03xyPYk82JLfOYPItUoPnIaubDIg/7i+bmndXDMvq4VygQvI0nTJ41Pg
         EQOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=QemU3WuO9xHB+LNy4EwIuYVFgPa+wpVEi3B2glLpiRY=;
        b=lPDpEPlB8kEUA+ev/EEkUhYdOaFenZ7YcyG/N+J8ONFc7YMTV8ZeOWIBribZKGCGdG
         Aeo5v/TOFqpoMHNxo3nwiGpRZ7il+PVUEdcWQh9wxNUm2HN5tKOx7Ip8o2t2+cnVGYmo
         YWT1H+Vc/IT+WeDy/imC5BMnvIbX+Q5XG7aPmXs463qd2piJt+OquYo1ZCtmkzMNh0T9
         mV0Al8Wt3SmcWtJSDhGdpT4DtVj2VFuhNwHpMA5sQ+xoHp6zHdyZueagWGoIcycknmJ/
         Nl0t5RT0GhPCc4fRYNf3c5HXHTh0eIkNv5YkG1rknkgNX4TlAxAyU2eEh5LTieEvOpT1
         BQ/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YVj3q2hz;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id gn32sor874816ejc.35.2021.06.18.03.09.38
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 18 Jun 2021 03:09:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YVj3q2hz;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QemU3WuO9xHB+LNy4EwIuYVFgPa+wpVEi3B2glLpiRY=;
        b=YVj3q2hzTT79p1wlY+jTipnLmsghk+2RflVWZWGuvylfFl8bXbbdAX2vxxpcV+QalN
         yZB1rk4ByJIQt0yIV6c5KwcX0flVDXnxwkaf8V6+yaXC8opq9iUfOEjrX9QXM/mYPPZt
         vPe/eDIw9WzP+/co4YwEt8ZZv+JOuk3qSNKhdEMPhKR6NT8BalLwasas/aHQSEgILGJ+
         /o5TFfjVhnCIHfOJmzlNb9+4h5bTbPIYRRZ2SXckIw8RDSShsxNLySQbXPIpUOnXJvnX
         5hevp/8Hltkz41ISHSI5V5ZVTOJmwX03DhwYB1rSXl2miO8WbTN1sS1X26k4lVQVTbqs
         z/ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QemU3WuO9xHB+LNy4EwIuYVFgPa+wpVEi3B2glLpiRY=;
        b=j0mwZaloDR5RUW6ePGUSAi0HS0ap7oTPJwtDnz71hUs3kyYWW6RSH+8oP2lArIT8KO
         rNkPsrEw93HTKGuzS/rkZ2idFjCOvufSAQSQI2purtf5GgnSUB/gzcytIX+JnpNmbL4N
         j7YqqDFR6sqYYFyZUs+JzlmUlFz7DzHGQiohh122/hDnTJGU1XAKxDjWajhmuXNsQVD2
         BVsVxG7b2ngn5Q+05qejmOAqXig1lXqiP8LQsDoXtNIuCYscpTiZlsV/G4m/dApK8UEy
         X7pkFRyegJeXhuEtALCH2vzg55Xi0fTRfyyOLupHBptCjrnug5DaGFx/+DPozxwuhV4z
         m6wA==
X-Gm-Message-State: AOAM53092mbvOwSgLlSmSH0QzIc7CPzyjxiBwwiDrr7NO6h+mo7w6o51
	ACvxXJW5hEnrOspXWFT53sL6KVNBTjidN6XN7O7OzohlXTpWbRAt
X-Google-Smtp-Source: ABdhPJy0sA1EpilmXmfpc5FCTuBl8B2/TuRG9u8nme2sPMGX53frfFlJBM3GC1aSBdkl42YM4cEL/9/f5/BVw4SWTAQ=
X-Received: by 2002:aa7:c857:: with SMTP id g23mr3856445edt.100.1624010978226;
 Fri, 18 Jun 2021 03:09:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210615165800.23265-1-alex.bennee@linaro.org>
 <20210615165800.23265-2-alex.bennee@linaro.org> <CAFEAcA8t8q8pJNOOYK-zkDtME7hOWfXVUj3+HLVMRkFzY6Ei1g@mail.gmail.com>
In-Reply-To: <CAFEAcA8t8q8pJNOOYK-zkDtME7hOWfXVUj3+HLVMRkFzY6Ei1g@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 18 Jun 2021 11:09:03 +0100
Message-ID: <CAFEAcA-OtgCRHPayXBsVZ64mqP7-aJj8+TV4rrLTE6Jh8JcgXA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] semihosting/arm-compat: replace heuristic for
 softmmu SYS_HEAPINFO
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Andrew Strauss <astrauss11@gmail.com>, 
	qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: jZ3DJ5lkwPkb

On Thu, 17 Jun 2021 at 20:22, Peter Maydell <peter.maydell@linaro.org> wrote:
> This will pick the first MR it finds that happens to be RAM (which
> could be some tiny thing). You don't want that, you want specifically
> whatever the board decided was the system RAM, which is the MemoryRegion
> MachineState::ram.

As a concrete example, on the mps3-an547 machine this code finds
the 512KB ITCM at 0x0 rather than the much more useful 2GB DRAM
at 0x6000_0000...

-- PMM
