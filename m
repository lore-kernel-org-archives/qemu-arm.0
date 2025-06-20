Received: by 2002:a17:505:8ed0:b0:1be9:327d:8ee3 with SMTP id kh16csp772063njc;
        Fri, 20 Jun 2025 02:58:33 -0700 (PDT)
X-Received: by 2002:a05:690c:4b07:b0:70f:8883:ce60 with SMTP id 00721157ae682-712c6545837mr32997597b3.26.1750413513199;
        Fri, 20 Jun 2025 02:58:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750413513; cv=none;
        d=google.com; s=arc-20240605;
        b=N4WsUUHR7lIj+LQRoJAnqlHpraMCZAkppz4FzRQWVIn2GtwGScjRk/m31gWSF/q38K
         Ivjq7NVd2aeM0bsMxiONjcEJYen8IpkctrRTKxD+LBkIrgjZ2RLznI0XJ7kc0ipnUjb8
         0gA1/jhvx+/M2L8P6EPzQCvwYrhAE3EhrUsGEaGRnegjx3Dby170bCN3lf+1+UeMRZh6
         ULwHARDUuHxeOVS3O0QOPs0q/gF9vq789dymDhMpNDE0KodAIxyN9OkAeS0ny8/vwKPo
         322CHVH9kEPV3FHHYAECN8MOqt2jKDxyYRFOrHhr0P96Uq3E5AqBldRDlR0Opjv7KLsK
         UI6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9YLMpxmJTIvKKwBh79n8bqkktkv0LVOtvZ+t75HK4Dw=;
        fh=wahW1+RimJuX2MiKJkK+njf/+j9C1d2Eihxe3z70jfE=;
        b=JTH9cx4XhQ1k5QrYw1QvDz7ALEww9uP0GiU2l0ze5Wv1KTgyMphMnUNSqs+OmEOL4c
         ugsOlyXQ1DxB0ATflVEsdSkCIj/87tBfIdbCyQo2dnXj8LxjKC6s2qqp2Y2BCqHIXiAZ
         HZC8hQQPvpXnTs3Sl+mDVlWiBSnfVRwIY6oUo9mQFJdDmxlHJCro6p86f2kSk3jIccWb
         bEz7ohyyN4Eig00jZPtd9hf7sIq7Tyu6/Z/9/HRh3Gvvgtbt3+WhUqtfbS8GVe0vE5Va
         x/maLw17gbNByzQf2yYMc8xlPRv8FOt2mHDA3dWi/od9opMXo3a6puG05B2lZmcg66ap
         kcDA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SZslMw9J;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 00721157ae682-712c78865e3sor7412827b3.2.2025.06.20.02.58.33
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 20 Jun 2025 02:58:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SZslMw9J;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750413513; x=1751018313; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9YLMpxmJTIvKKwBh79n8bqkktkv0LVOtvZ+t75HK4Dw=;
        b=SZslMw9JfiBj+XvSmLXd6osHu78px9glcK8B+Zg/W7EJ8n60WNPBvqXOh8MfCI8P+M
         KZUArSmgKbigfFm2oll3o61DViNhDbBzxg+I63+JEu63P7ZF5ei1blz/b7IsTRLka08j
         q3kYQ9oABUiYymKHKrA+GWLhDp0Ggmf7YLPAZYCw7WwZINkAqKYRwXvfEsv9kUHxzq1J
         ZcCyzRsf1XAM/xSmJ6j3kEpjYTFKtunjzv7MdG2oii3Oseq+zIWp0gd/8LHixLGVfHw6
         o2FwIqZga2TvNWuA51RVm96rAgfwbda22E92wnT3RTPBSzHo7L0RXKAy5pKXEVoyVDUJ
         berw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750413513; x=1751018313;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9YLMpxmJTIvKKwBh79n8bqkktkv0LVOtvZ+t75HK4Dw=;
        b=VvswW3offLQR/go9hKEOT5h2Y/vot3S3wFcKgniBCh+VWCpRAW6HTZtGpZ0+hkWQuk
         06kHnHgqABoxsbK+XxeR9+8oEH0mRsvtfmrcS5aN2ulpSqZp6IMnT4vw+hPR9jJlANeZ
         RbDF1aMIXsNSWcIQI/8tUd2GFcM+YOnHbngcbJWfvI7P4Z8IJWAMcRynqM5eLT7bw0xc
         F/irl2ypEIK4n2z2ag+SAQovUIUkS1qldz4rTw4Am2r6eWsJTgTPaPtrCXYFf6X+TY7q
         RWwA6pgfUt2R2qSFDWEaTM9zE7Seadafu11TUw4BmBBXkp4aqQMAd2hQWVv9lBxth0o/
         FFmg==
X-Gm-Message-State: AOJu0Yw2pBywcgd+LS4gHVwrpkXTIjSvL7pnw+hBoyoiqJwz+NZ/OQGn
	c17T6xfXNQ1tC8poEtgJz0xIn58q+trk5gm5083/fjX7a0N3t08rzLAncZwaJKhtdOQX1pgzWFw
	DHwYuhimXl7Xipxvt08E391UWEQFTdM+42oeiyv3RlMFyYdQRLFYgnlo=
X-Gm-Gg: ASbGnctJ2ej1VRMmdV2uyucPA/mBJIwoRN+0F7b/+iBPPCX//VdtjJEExIYFSN+YDCZ
	sTnEg2ee7ZXRx0RF0JuXev0PwkD7pmV8sr4vNDwrHBwXgprW/qlk5KKMjZE+lUDDy2RAOOxIqwI
	Sh41GN2pPvU2DI026x2XaxM0CD8LZiKtCIpuE/qQF66H9+
X-Google-Smtp-Source: AGHT+IHypTntkrIn7m/7EnO9BcMBztrc5tZ1KQFuiKowtjsxe+0Vi2vxqm9ZXXv27ttWBkiiJA71HJGwlslqE4XQK4Y=
X-Received: by 2002:a05:690c:350f:b0:705:750e:37b7 with SMTP id
 00721157ae682-712c639d784mr27942687b3.5.1750413512819; Fri, 20 Jun 2025
 02:58:32 -0700 (PDT)
MIME-Version: 1.0
References: <20250616201042.2196127-1-alex.bennee@linaro.org>
In-Reply-To: <20250616201042.2196127-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 20 Jun 2025 10:58:21 +0100
X-Gm-Features: AX0GCFsYW_4j0_l5oo3XSEtKfWysXqR7l_BSGuCUpGioIEyS5XSj29ocU7SKi1c
Message-ID: <CAFEAcA_TODi-ZAkA900eV02TyKKD+gib4YxscUomoDt=q+RT7g@mail.gmail.com>
Subject: Re: [RFC PATCH] target/arm: clamp value to account for RES0 fields
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, "open list:ARM cores" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: 3m5Da8fpTfGK

On Mon, 16 Jun 2025 at 21:10, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> If the user writes a large value to the register but with the bottom
> bits unset we could end up with something illegal. By clamping ahead
> of the check we at least assure we won't assert(bpr > 0) later in the
> GIC interface code.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  hw/intc/arm_gicv3_cpuif.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
> index 4b4cf09157..165f7e9c2f 100644
> --- a/hw/intc/arm_gicv3_cpuif.c
> +++ b/hw/intc/arm_gicv3_cpuif.c
> @@ -1797,6 +1797,9 @@ static void icc_bpr_write(CPUARMState *env, const A=
RMCPRegInfo *ri,
>      trace_gicv3_icc_bpr_write(ri->crm =3D=3D 8 ? 0 : 1,
>                                gicv3_redist_affid(cs), value);
>
> +    /* clamp the value to 2:0, the rest os RES0 */
> +    value =3D deposit64(0, 0, 3, value);

Should be extract64(), as RTH notes (or just &=3D 7 if you like).

> +
>      if (grp =3D=3D GICV3_G1 && gicv3_use_ns_bank(env)) {
>          grp =3D GICV3_G1NS;
>      }
> @@ -1820,7 +1823,7 @@ static void icc_bpr_write(CPUARMState *env, const A=
RMCPRegInfo *ri,
>          value =3D minval;
>      }
>
> -    cs->icc_bpr[grp] =3D value & 7;
> +    cs->icc_bpr[grp] =3D value;
>      gicv3_cpuif_update(cs);

Yes, I agree we should do the "work only on the 3 bit field"
part before we do the "enforce the minimum value" logic.

The handling in icv_bpr_write() has a similar issue.

(Why was your guest writing garbage to this register?)

-- PMM
