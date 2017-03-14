Received: by 10.25.77.4 with SMTP id a4csp1724481lfb;
        Tue, 14 Mar 2017 10:35:17 -0700 (PDT)
X-Received: by 10.28.159.73 with SMTP id i70mr836594wme.78.1489512917591;
        Tue, 14 Mar 2017 10:35:17 -0700 (PDT)
Return-Path: <k.kozlowski.k@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com. [74.125.82.67])
        by mx.google.com with ESMTPS id n5si5920295wra.31.2017.03.14.10.35.17
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 14 Mar 2017 10:35:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of k.kozlowski.k@gmail.com designates 74.125.82.67 as permitted sender) client-ip=74.125.82.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of k.kozlowski.k@gmail.com designates 74.125.82.67 as permitted sender) smtp.mailfrom=k.kozlowski.k@gmail.com
Received: by mail-wm0-f67.google.com with SMTP id z63so933271wmg.2;
        Tue, 14 Mar 2017 10:35:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=gdKWASgLhYKvdCJwPBzncydZR4qz4gfh6glff7VSxH0=;
        b=lAOHBoZAoulXxtDez+/b+uFXxzwo+tjyg4z/72d/BNVwQGgfCFeNHyv58ykxPNGIXM
         2oPg/NUaJL7tuliUB3F60UxjxfORRnzgYc0PpKg42AHGSiyJGkzcDXwtix96I68wywaq
         CqP6KQFewTRhQiTngPFWrUpxP27bdPQf/QhGwhRaOD8PLplX9aLJn7voe4RtxyvpDq40
         PtQUU8oBCme6P6vCoXB4XDdy67Vf+kMGcvdNTKxkZJ0753tciYXNHKhmYtKhL30qEqa4
         WA1kGmnBSDX4xVK7PmKYxXdQKOJ3F+vDLqdWpXXlt9O2MbPViamJdZMAME0SVpLojBjE
         zPiw==
X-Gm-Message-State: AFeK/H1MnScF9J8B/ci0WwsL0NolVSpF62VITfD+nJPi0HqZUCXCOuZE+ZFMjVreJZptmg==
X-Received: by 10.28.8.147 with SMTP id 141mr16512893wmi.43.1489512917148;
        Tue, 14 Mar 2017 10:35:17 -0700 (PDT)
Return-Path: <k.kozlowski.k@gmail.com>
Received: from kozik-lap (bzq-79-180-56-222.red.bezeqint.net. [79.180.56.222])
        by smtp.googlemail.com with ESMTPSA id p185sm16255740wme.20.2017.03.14.10.35.15
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Mar 2017 10:35:16 -0700 (PDT)
Date: Tue, 14 Mar 2017 19:35:13 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, Igor Mitsyanko <i.mitsyanko@gmail.com>
Subject: Re: [Qemu-arm] [PATCH v2 0/5] hw: arm: exynos: Bring up secondary
 CPU + CPUIDLE issue
Message-ID: <20170314173513.wruppu4js7ikaxu2@kozik-lap>
References: <20170313180432.7067-1-krzk@kernel.org>
 <87mvcnpzll.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <87mvcnpzll.fsf@linaro.org>
User-Agent: Mutt/1.6.2-neo (2016-08-21)
X-TUID: gKNKemNTovfF

On Tue, Mar 14, 2017 at 04:55:34PM +0000, Alex Benn=C3=A9e wrote:
>=20
> Krzysztof Kozlowski <krzk@kernel.org> writes:
>=20
> > Hi,
> >
> <snip>
> >
> > Overview of the problem
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > On Exynos4210, by default Linux kernel uses cpuidle driver which tries
> > to enter low power mode, called AFTR (Arm Off, Top Running).  On real
> > hardware this brings some power savings.  This AFTR mode requires second
> > CPU to be off, so the driver (coupled cpuidle driver) when system is id=
le:
> > 1. Turns off second CPU,
> > 2. Enters AFTR on CPU0.
> >
> > However the QEMU system is then totally unresponsive (e.g. on serial co=
nsole)
> > and RCU stalls appear from time to time.  I spent some time on it and d=
id not
> > find the real cause behind the lag.  Maybe it is because the second CPU
> > does not really power down itself and system just burns the cycles unde=
r spin
> > locks?
>=20
> Was this tested post the MTTCG merge? Maybe there is an interaction
> between power saving/halting the vCPU?
>=20
> I mention this because I already made some minor tweaks for handing the
> WFI instruction in MTTCG. See commit c22edfebff. You can test this by
> forcing the original behaviour by adding:
>=20
>   -accel tcg,thread=3Dsingle
>=20
> to your command line.
>

I am testing it on v2.8.0-2005-g17783ac828ad. Without any -accel, the
system boots but responsiveness of serial console is bad. Bad but at
least it is responding still a little bit.

With the -accel you mentioned, system does not even reach user-space
(initramfs).

I tried rebasing on newer (e.g. v2.8.0-2182-g5e2fb7c598c6) but
compilation fails all the time on:
/home/dev/qemu/qemu/vl.c: In function =E2=80=98main=E2=80=99:
/home/dev/qemu/qemu/vl.c:3131:18: error: =E2=80=98QEMU_OPTION_blockdev=E2=
=80=99 undeclared (first use in this function)
             case QEMU_OPTION_blockdev:


Best regards,
Krzysztof
