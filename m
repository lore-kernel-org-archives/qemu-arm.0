Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp5916987wrx;
        Thu, 21 Feb 2019 07:58:27 -0800 (PST)
X-Received: by 2002:aca:dd42:: with SMTP id u63mr9383957oig.38.1550764707252;
        Thu, 21 Feb 2019 07:58:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550764707; cv=none;
        d=google.com; s=arc-20160816;
        b=dcF3kMMCQaxsHHv4L6pELpbmyy+M+mUHTdh1pDebeJBS0TzaUHbp4Wd4uax0923vDL
         reV2FR7PcO5PYh7jaFANe1dQunQZ8eHp/OB5I2y+ZpN6kF6+YQJeyPA3RyXlWk3kYmqS
         gwFhShAQEmPidFG5Ed1MqZ5xSQ8gdOAhNY83UMimOBQK94FylboXCDHfeX/Px4yF49c/
         U7IJ2zM30/X9kxXQ1ASKva4B2vd4iReNtmNsksT+s4+n+rIFm/0mHJ1waCe+uZWLh7Vu
         ZOdnXkNbNDHZoscLuahpylJFdrXTA0D1mni9UoWLUEA+8xuHmsFkWiMXooAQy+be0xoH
         EdEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lHFuwP6+I+M/tVvWSoB9v0YOnLCN/cTQTbRV/3fi2cw=;
        b=c7cDCPWDnwQxQg+kE4lFUyd/VSu0lHCr3KAct4p60iMExfkNe75vv+/CvLy10cJeCo
         euLi8TYjwxDMuKVzJov7AOMeaqnhb4nZWoBkooFf2B5x4UlZYL7nzDief8fZsdwkZfAe
         bcycTIHpY/bZip0MhxQTZDNMvI/bqk084MjCNS4Leql7B1f7QFzt7h6hoaquO3GPv/DG
         sStph0h0PZU1Z8bLOPtNZxOcz9rflXu7y/jlJUtQ0v1U9ChlvNIeyVvwwZewoZyjmHQ+
         avvp5HJW9bUPK2hpu9libw2YqOY3OnPQTKTPR8VqL/yEVan/gy8vsJwYE5BgrKK8a4UG
         7czQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mbIOiFPs;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id w7sor7459210otb.10.2019.02.21.07.58.27
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 21 Feb 2019 07:58:27 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mbIOiFPs;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=lHFuwP6+I+M/tVvWSoB9v0YOnLCN/cTQTbRV/3fi2cw=;
        b=mbIOiFPszV0lVAez/4t78w/5wCL9fXt4klHfs8M3kH5O3KxvVCPZPSssrNZV7T+5XA
         Ay7CPZeyIiWmIhu+s0PjO/rWZaiNjCqV5TRYTyXSSu1nXRs9Xo+ZtjhUS+IFt3rlAOr6
         Fp7GERIyEb1ELvB0iDT77jtp8i6kn/GaRmMv3As/hzzkGDxsLbWXuTA08ZhDq/pThY70
         pc2gRPsrPv4z1RfqCXMMyqHpCcpzafwSKC+c1eHIeQEfXlANAvVNhObSM1xjDgn7E/AO
         bC/TaYPHTXRk/9qd5aG+fG3GjKwuaiCh+oydkHcsBBzBMCsSN0g0bf3NRr1pUypr99Ks
         CXuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=lHFuwP6+I+M/tVvWSoB9v0YOnLCN/cTQTbRV/3fi2cw=;
        b=dpKPYvksquc/y9+xufiPU5J22QV7DocYleZHqmWZYnvfQCGGGrXq2KW/k62uWZ64vz
         WYGiztJ1dIGOifkr1xBYH0zBQEBdGOmNZAuH7ghSpzZqdwrOxh30mbvMq+pmbPqBM7tm
         GOyvppWaVDsoUS1BKyDzKhasbF/PyW/dyQcXMfluUPGQn6kwxGGieWVjnRidlNyBfs4r
         Bcpd1mq7i+MBAkLMqtJmj7H5nPSkgYhuGI87GfY75ZMwQH0xmm2bu2C7+SPzLSr2E4pT
         I14AtLM7/MzmiqmxiiOYpkRA9d58f/PPeHRz5VQWq42TAOMoSfGzvN+gBaJkaumUGDci
         GidA==
X-Gm-Message-State: AHQUAub3m89YSB4dfzA4rBdRy0sa5k5X9b/baehTqSNW5lZWPBtHInIj
	jzFcPQzJEeR1ybLvr32qhvuDPxDMN7GRZbUpbTdaIfMFUGE=
X-Google-Smtp-Source: AHgI3IZ1s99O3Yf3NBCuTOQB00MdYCqgIzLHus2dx7nX3iwtMet4Kjp+c4sht2qgsxmVY1GWoMv9WHCCnKQHTZfL7Lw=
X-Received: by 2002:a05:6830:8c:: with SMTP id a12mr19974981oto.317.1550764706625;
 Thu, 21 Feb 2019 07:58:26 -0800 (PST)
MIME-Version: 1.0
References: <20190215180500.6906-1-peter.maydell@linaro.org> <87h8cx432h.fsf@zen.linaroharston>
In-Reply-To: <87h8cx432h.fsf@zen.linaroharston>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 Feb 2019 15:58:15 +0000
Message-ID: <CAFEAcA_BOCiCyXOwv_GGY83Qz6e8BuDUdGhe5+tZaHJ8V-L=YA@mail.gmail.com>
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] hw/arm/armsse: Make 0x5... alias
 region work for per-CPU devices
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	"patches@linaro.org" <patches@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: qyYHqTeE5jPb

On Thu, 21 Feb 2019 at 14:44, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > The region 0x40010000 .. 0x4001ffff and its secure-only alias
> > at 0x50010000... are for per-CPU devices. We implement this by
> > giving each CPU its own container memory region, where the
> > per-CPU devices live. Unfortunately, the alias region which
> > makes devices mapped at 0x4... addresses also appear at 0x5...
> > is only implemented in the overall "all CPUs" container. The
> > effect of this bug is that the CPU_IDENTITY register block appears
> > only at 0x4001f000, but not at the 0x5001f000 alias where it should
> > also appear. Guests (like very recent Arm Trusted Firmware-M)
> > which try to access it at 0x5001f000 will crash.
> >
> > Fix this by moving the handling for this alias from the "all CPUs"
> > container to the per-CPU container. (We leave the aliases for
> > 0x1... and 0x3... in the overall container, because there are
> > no per-CPU devices there.)
> >
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>
> Looks good from code inspection. However I'm having trouble getting the
> right runes for building the firmware. What TARGET_PLATFORM matches the
> IoTKit SSE2 that uses this?

To hit this you will need to use -DTARGET_PLATFORM=3DAN521 for
arm-tfm, and the QEMU mps2-an521 machine.

(Building arm-tfm firmware is indeed a bit of a pain, it has
a pile of annoying dependencies and a tendency to want
bleeding-edge versions of tools like dtc and cmake.)

thanks
-- PMM
