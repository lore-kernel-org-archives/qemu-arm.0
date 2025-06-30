Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp2551085dye;
        Mon, 30 Jun 2025 08:32:12 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWOcDTmrbzIpf7hyTbI88JQdCwjAq90GYhk5VXzn9F4KK925iABu8qYOTTj3WhTjAkom5baYFQR2+6/sA==@linaro.org
X-Received: by 2002:a05:690c:8311:10b0:70d:f3f9:1898 with SMTP id 00721157ae682-715171c6d51mr144755967b3.35.1751297532354;
        Mon, 30 Jun 2025 08:32:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751297532; cv=none;
        d=google.com; s=arc-20240605;
        b=FCSBLfd4jRLXg3LnGCfHzPVI9K0Bc/4G1FWqQHaQreGMST0niNumxC/jck4c8+5Zhv
         Jz9rDKGtgkI4Bzyd83BEcGTZ999TS4tVnVWk2kcmI43G0n2uLNvaWZSNJzA2njkkp8B+
         X/hxgI6+wxgM3NMl9nM+RJF3dJY3d38+4zRpm0OXRqAWJyYpscjGJK/zUjjVW6RUFBaA
         6bVrpFvNyls43yrPu/NMvBpSFrj6Kli7Bbc9MFs1YC2Yuz9a+ByABmDcgbAS0dE99akc
         p5Zk1QglCur7FBqE8+F5G+PrnNc1Rv4PIEUjfservnRPG+3a9Tz5XkCpTHPnDDpnHXHf
         5zwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BBv5z/VpiWqm6TUtxvPZN70k+f7CGqEYeEiw2nVISzY=;
        fh=osRaa4MnQw434V76NWGAjy5KqDRwyNMwgnbBS4Hkybw=;
        b=EufLZo93DgUFSNahxIA2J2JUmKqDdGBNCc3N6WUR5iW8pE9U79XTM9ku6Ph62ixUtQ
         gqBCAmgQTQjbovYi0KAMyeZlVRJptWZq2KJq+D8uOPxW51lk4ekorIaydSXknprI/rKf
         ufMN4Desze4jvvjIdjDEOaAy7Y05GmE/j1XVSZZ9+5c34n7Eh0QcqtZmwKXMhvWdjHw+
         AsVzY6q+q79E97Qi63Ag0VNGlpwtg7H3WxizhF3VvCH8G5zqigpr22QT3TN0oRhJRGEM
         O3AQ2crhbXmGB7u2WXJmPnxKjVr8vouSe5/dsD9TFloG5Duo73flc8HqoAZsq0GCrBl1
         Io6A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=scKFXmBX;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 00721157ae682-71515c0dc52sor50171757b3.6.2025.06.30.08.32.11
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 30 Jun 2025 08:32:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=scKFXmBX;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751297531; x=1751902331; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BBv5z/VpiWqm6TUtxvPZN70k+f7CGqEYeEiw2nVISzY=;
        b=scKFXmBXT3gt4LN1p5fkajxgXkRcD5skD4QWNAvDBA0Fs+Mm3yAtt9+NyTG2nyCzJF
         YFlKf2fyzJNqTw6WZLVxt99pYUuYl73AojYrsImFZ8ylTpbcRhBMaiwF4M9ue2ugsWTT
         ZqJg0iF6eAgNzvIdtkUwv01G0Ve3GcEGwJDJb34/E+dK6nk0eXVzJRXz4HlfasyY9HGG
         TDikUnWMldfYVRMcWVHzfMG6LOOi71VbkKME6+fL6eIufBX45Idhpa840Z8bAuYXsV6X
         Z3lJiEXUSFFAs9v7Jq42aTguV+TwXEYUMgyaB9V+jwAo26sZED11lS5ietRhfNx7Vl9F
         aa0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751297531; x=1751902331;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BBv5z/VpiWqm6TUtxvPZN70k+f7CGqEYeEiw2nVISzY=;
        b=vMaaQZMDcq5vvzVF52R72sGuDY6lnL7o53k4f93k8B42inHU4ukaC6000j8l9xsJ7I
         eRKC3rcf8nGf8zF/o0B32BJcqDtN+c9ccsgIdEssRhMt5oH5QvC5e5Irf5mNGzMUMfXn
         fpYQJs8u0My53LR5/dTj6MYkUMREsM2wgynxgmXGy9mrq8z8GkJnav/Wlg7XEpcHhXty
         McVDsQUxjGyFGYi/iXHOoqtlJlzf3gPQPrvSJCIeLQbp5Pp7FLpVP5lWbMpJUA2d/MZX
         txNc3+m/scSEYLNle/OQXW8tZT6ELR3CpHHh5WmTsEVoTGSymWCBLA2PAsgJh8s3T1Uw
         InaQ==
X-Forwarded-Encrypted: i=1; AJvYcCXlljdPt9Z5m4mJvGoihhikJlyedzc0JYRI1IDm9ZM17nRn0EXjB48FBYO0WIjQDR2c1yEpRwLeFjp2SA==@linaro.org
X-Gm-Message-State: AOJu0YyMj9YQv6tkpApCWqyl+nFXzAnw5l7k5CMHxsbl03IUUOtM9m9f
	TxY1hPuwd7qxuTGvIrELG97y14QdlT3zJltQko/tnYJACVOSR8mxR0yFIuZgDcT/kw35/T9kW3u
	MaVv10jo9xLHUnbKgmI2LkXP/17HA2rdewqE2KdLzy0+9
X-Gm-Gg: ASbGnctjMdKKH+G8QfmyfxkwFD4ZrT4y3oXR+UyrVGCJ5gtwuGuKlU+YrgOxogKe/n8
	DM8EdR4XWQh2Hnjnqo0EHAKu8AiitctecKTs6yMV8OhPkap4BALFd2Z3fq7u9aa6JzW21DwgEIA
	BEMe4/dsK/BE5JSxtm4OPSg5J9k7JGT/Xm00SyTsYt7ue0
X-Google-Smtp-Source: AGHT+IHy8nnqmhTcZqN296zS/GH2AzcmKJFgjhBGMvlHCoJRvN7kCBoPACAJDbr1konLbK5VYHH+YUoYt2nSk6mM5yk=
X-Received: by 2002:a05:690c:4b8c:b0:710:edf9:d93b with SMTP id
 00721157ae682-71517158331mr260393347b3.11.1751297531250; Mon, 30 Jun 2025
 08:32:11 -0700 (PDT)
MIME-Version: 1.0
References: <20250623121845.7214-1-philmd@linaro.org> <20250623121845.7214-11-philmd@linaro.org>
In-Reply-To: <20250623121845.7214-11-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 30 Jun 2025 16:31:59 +0100
X-Gm-Features: Ac12FXxL7r8Fqtmkx3bL2CVmkkdzP7qpLkzAMPTSCdtXWbBVYPe4zZUG2yIbwZA
Message-ID: <CAFEAcA-fe_8qZFWjTAB3EGFpR6vO=fHj-yB7cV=CYgjsVgLOcg@mail.gmail.com>
Subject: Re: [PATCH v3 10/26] accel/hvf: Model PhysTimer register
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Leif Lindholm <leif.lindholm@oss.qualcomm.com>, 
	qemu-arm@nongnu.org, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	Roman Bolshakov <rbolshakov@ddn.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Alexander Graf <agraf@csgraf.de>, Bernhard Beschow <shentey@gmail.com>, John Snow <jsnow@redhat.com>, 
	Thomas Huth <thuth@redhat.com>, =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
	kvm@vger.kernel.org, Eric Auger <eric.auger@redhat.com>, 
	Cameron Esfahani <dirty@apple.com>, Cleber Rosa <crosa@redhat.com>, 
	Radoslaw Biernacki <rad@semihalf.com>, Phil Dennis-Jordan <phil@philjordan.eu>, 
	Richard Henderson <richard.henderson@linaro.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: IcjmemRig0JY

On Mon, 23 Jun 2025 at 13:19, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> Emulate PhysTimer dispatching to TCG, like we do with GIC registers.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/hvf/hvf.c | 19 ++++++++-----------
>  1 file changed, 8 insertions(+), 11 deletions(-)


> @@ -1639,16 +1640,12 @@ static int hvf_sysreg_write(CPUState *cpu, uint32=
_t reg, uint64_t val)
>      case SYSREG_OSLAR_EL1:
>          env->cp15.oslsr_el1 =3D val & 1;
>          return 0;
> -    case SYSREG_CNTP_CTL_EL0:
> -        /*
> -         * Guests should not rely on the physical counter, but macOS emi=
ts
> -         * disable writes to it. Let it do so, but ignore the requests.
> -         */
> -        qemu_log_mask(LOG_UNIMP, "Unsupported write to CNTP_CTL_EL0\n");
> -        return 0;
>      case SYSREG_OSDLR_EL1:
>          /* Dummy register */
>          return 0;
> +    case SYSREG_CNTP_CTL_EL0:
> +    case SYSREG_CNTP_CVAL_EL0:
> +    case SYSREG_CNTP_TVAL_EL0:
>      case SYSREG_ICC_AP0R0_EL1:
>      case SYSREG_ICC_AP0R1_EL1:
>      case SYSREG_ICC_AP0R2_EL1:

This adds three registers which aren't GICv3 registers to
a code path which has a comment

        /* Call the TCG sysreg handler. This is only safe for GICv3 regs. *=
/

In general the TCG sysreg implementations aren't expecting
to be called for non-TCG accelerators. I would like to see
some analysis of why this is OK for the timer, please.
(Compare commit a2260983c65 which notes the limitations under
which this works for the GIC registers and had to make some
minor changes to the GIC code both noting that it might be
called for non-TCG accelerators and adjusting things so
that would work.)

thanks
-- PMM
