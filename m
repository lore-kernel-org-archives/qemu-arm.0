Received: by 2002:a17:505:2e08:b0:1bd8:8c49:4f6d with SMTP id ya8csp201759njc;
        Fri, 21 Jun 2024 08:21:20 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUrtqZz5MsqejcjMQj9pV4hjMitNd29dKvWOaboDYB4DIgF2P+6H60YE63pfwt253WZuYbsH5mKNgpxtKuF6gGmtbnvqArl
X-Google-Smtp-Source: AGHT+IGt1cyLtn98L0sHWv8uBGIQ0zC9r4X9kNpR2Fk80bzaiiw0tqx9cyTgXDPWOW5Kf7Y39fB0
X-Received: by 2002:a05:6358:8096:b0:19f:823a:b6cb with SMTP id e5c5f4694b2df-1a1fd657189mr829622655d.31.1718983280314;
        Fri, 21 Jun 2024 08:21:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718983280; cv=none;
        d=google.com; s=arc-20160816;
        b=j9qC7xz78PPd2FwaSR01bhESx8/Z7WWV52ibJek8QsQG+HlyFcAKZr3o2XcfQTc0Lz
         hUOnZfnAmYf/Xy0png/0TlT5145T9/m+XfPTud9Xel5bCX9XpTzvq7SHarmeCExesoW7
         Tqx/2ruYOsUNAGO/tTIPOhqnFVxeMmENZDdtnbWtlMEV9S8hyKauOZVrpbuX+zvFuMER
         11J5xBFQk+w9S9haXAHyOYVFrR72kqr90FUMejKdNFPkRcnh3+W5HNLYXt3LuRgLODEW
         1boQcEF6c5LP6F3Pi68RjFoi1DpWCSt/D9GHgaQJNyLv/Dl3XdhGKQuXi6iepiRf+H+8
         YhIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=pHbVYmuZWd1OxdpX60I95J8UDkauo542zRAeutaxzk8=;
        fh=eCG0QGwq0pDPZBmSLh909/PJLDRyNZnsVWKNTMR2DFk=;
        b=y24XnxHgJXQoexp1NTKEHPZHcjlUbQRfvT5ysGHm0WOd7n9mgvuloiXQ5frhpnB5Ip
         Iht91t/snUs0dZJjYmjapmrD8Z9PsFIcu8kL2FyddYKOHpaQ/Mg5zc7FIhObY0DAF9uF
         4xZ7laQXAfIt2JIp04sFVeTuELcCfoeHy0ge0z8rToN/BETGqcW8LynNffDUVJhm8SG0
         d3367lDYrSumI+WSvuqn3RXyTDLuV8/ldYf7cDGI8JPVG0qeXbB4NVP0KbF5PCGNcmTI
         3L0KaEz85enm2NojF+SCQzd9bEmORp4sr8mHm7suwUrGG4nzdVSIPi86DpFjAgDUXAWO
         UG+Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZBXxgSvD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-444c2c38994si19827781cf.445.2024.06.21.08.21.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Jun 2024 08:21:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZBXxgSvD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sKg4M-0005nF-1s; Fri, 21 Jun 2024 11:20:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sKg4C-0005l3-IM
 for qemu-arm@nongnu.org; Fri, 21 Jun 2024 11:20:44 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sKg49-0008MY-JF
 for qemu-arm@nongnu.org; Fri, 21 Jun 2024 11:20:44 -0400
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-57cfe600cbeso2560943a12.2
 for <qemu-arm@nongnu.org>; Fri, 21 Jun 2024 08:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718983240; x=1719588040; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pHbVYmuZWd1OxdpX60I95J8UDkauo542zRAeutaxzk8=;
 b=ZBXxgSvDIVE5TuLJ3PQNUylTKmASLWeRSTobXpTCvDIsDY0itMfwPnKA8b1ypdKLhi
 dYZr2NvMFGdIkooBKqstKoX4wOtaNDQowzfHZW0wT/sMSuQqhiCLELto6dxaT4hI3/Ou
 9HJusF91sVM+/AbV/VbS6uaAeXNE1SrwiFTPuiaf/NTl7N3QJaa811AkbTh7vz4BrQy5
 M6z7S2ZewcFz9QSW67DJPA1Oe+Ag8HjTWVLKhakoSMqA4KKgtpnAVVgiDkLR/uLOKm/K
 ruvR56vcUZ0DC/L2QSZQEiPcjs19uwQnLlGeVWkDxjiUMhYEN+FxMaBA1sHEFjwEB6uL
 TXWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718983240; x=1719588040;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pHbVYmuZWd1OxdpX60I95J8UDkauo542zRAeutaxzk8=;
 b=aNovxyDTgPhn4S7OleIQvycYcI+6eaO3/zyjVytGNFERiVdsKZJREROsg/KgiiD5WQ
 91b59fN7LDUMy0zNpO8QrEoha1vuW/Hmvk8uY9TOSbQ1KSl7P0SisVPfnootT860UEKJ
 tOshe6Kd1PFSnMWO3NufGwpHjdnb7WNnmwnOcIug7sT+oTVI+IyMUGPY3MGDIo3k5sNN
 6SBs/UUlqRVfecM+8lJzD1keFUTexlTcwI32IfVyshu2XLBgyCN1byumvFuIUXZb+yPH
 mcP/CY61vO5bGvoa192OfvG/4BAhFkhRv9PDd91M2VuosdSoBrXoo2bo1mg1L2TJBo/J
 FIXw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUa1UAYibdRQKDwi0GIXcWSPVxJ/2nKNlMZG1iWab7HtoW5FoupcWz+z7YaSJD7bVA6eGy0vvb7x4Fc3q7uuYzfHcjv
X-Gm-Message-State: AOJu0Yxrq0Y9eGTsvBw+6N/dpo3I/Q/XU7GtNAcVRzpPVc0iFmzXgi2+
 Xd2T5caV8FiR4VQLNvmf249bPtq5Nec1GmYFo51d6PEAKCNpkMuKwjfld7qm8UG6nLeJoS5PQxR
 IeFYWbKqI2vo7eRHeTkIB3EZBnRwo8TfLvmoNhg==
X-Received: by 2002:a50:cdc4:0:b0:57c:6c1c:f942 with SMTP id
 4fb4d7f45d1cf-57d07ee7911mr5961618a12.38.1718983239918; Fri, 21 Jun 2024
 08:20:39 -0700 (PDT)
MIME-Version: 1.0
References: <20240618135550.3108739-1-zheyuma97@gmail.com>
 <6030d030-cfce-4253-ad4d-f7e2a37e2957@linaro.org>
In-Reply-To: <6030d030-cfce-4253-ad4d-f7e2a37e2957@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 21 Jun 2024 16:20:27 +0100
Message-ID: <CAFEAcA8NK5oEFwfnbHPd2NQvTQYauife-KLS--09L6e_mzi-zg@mail.gmail.com>
Subject: Re: [PATCH] hw/misc/stm32l4x5_rcc: Add validation for MCOPRE and
 MCOSEL values
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: Zheyu Ma <zheyuma97@gmail.com>,
 Arnaud Minier <arnaud.minier@telecom-paris.fr>, 
 =?UTF-8?B?SW7DqHMgVmFyaG9s?= <ines.varhol@telecom-paris.fr>, 
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: j3ALiGBzXdT/

On Fri, 21 Jun 2024 at 16:03, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> On 18/6/24 15:55, Zheyu Ma wrote:
> > This commit adds validation checks for the MCOPRE and MCOSEL values in
> > the rcc_update_cfgr_register function. If the MCOPRE value exceeds
> > 0b100 or the MCOSEL value exceeds 0b111, an error is logged and the
> > corresponding clock mux is disabled. This helps in identifying and
> > handling invalid configurations in the RCC registers.
> >
> > Reproducer:
> > cat << EOF | qemu-system-aarch64 -display \
> > none -machine accel=3Dqtest, -m 512M -machine b-l475e-iot01a -qtest \
> > stdio
> > writeq 0x40021008 0xffffffff
> > EOF
> >
> > Signed-off-by: Zheyu Ma <zheyuma97@gmail.com>
> > ---
> >   hw/misc/stm32l4x5_rcc.c | 28 ++++++++++++++++++++--------
> >   1 file changed, 20 insertions(+), 8 deletions(-)
> >
> > diff --git a/hw/misc/stm32l4x5_rcc.c b/hw/misc/stm32l4x5_rcc.c
> > index 417bd5e85f..59d428fa66 100644
> > --- a/hw/misc/stm32l4x5_rcc.c
> > +++ b/hw/misc/stm32l4x5_rcc.c
> > @@ -543,19 +543,31 @@ static void rcc_update_cfgr_register(Stm32l4x5Rcc=
State *s)
> >       uint32_t val;
> >       /* MCOPRE */
> >       val =3D FIELD_EX32(s->cfgr, CFGR, MCOPRE);
> > -    assert(val <=3D 0b100);
> > -    clock_mux_set_factor(&s->clock_muxes[RCC_CLOCK_MUX_MCO],
> > -                         1, 1 << val);
> > +    if (val > 0b100) {
> > +        qemu_log_mask(LOG_GUEST_ERROR,
> > +                      "%s: Invalid MCOPRE value: 0x%"PRIx32"\n",
> > +                      __func__, val);
>
> How the hardware handles that? I suppose it just ignores the
> value, so I'd simply:
>
>            return;
>
> instead of disabling the clock...
>
> In=C3=A8s, Arnaud, what do you think?

The datasheet just says the values are reserved. The hardware
might do anything, including behaving completely weirdly (e.g
trying to divide the clock by something more than 16 and running
into timing problems as a result). I suggested "disable" in review
on the first version of this patch (you'll definitely notice the
guest bug then ;-)).

> > +        clock_mux_set_enable(&s->clock_muxes[RCC_CLOCK_MUX_MCO], false=
);
> > +    } else {
> > +        clock_mux_set_factor(&s->clock_muxes[RCC_CLOCK_MUX_MCO],
> > +                             1, 1 << val);
> > +    }
> >
> >       /* MCOSEL */
> >       val =3D FIELD_EX32(s->cfgr, CFGR, MCOSEL);
>
> MCOSEL is 3-bit wide, so ...
>
> > -    assert(val <=3D 0b111);
>
> ... this condition is always true (and can be removed) ...

Yes, I noticed that. But if you look at the datasheet[*] the actual
field in the register is 4 bits wide, because on some l4x5 SoCs
bit 4 is used for something. So it seemed to me reasonable to have
the guard against this, because at some point somebody might update
the FIELD definition to match the datasheet field width.

[*] https://www.st.com/resource/en/reference_manual/rm0351-stm32l47xxx-stm3=
2l48xxx-stm32l49xxx-and-stm32l4axxx-advanced-armbased-32bit-mcus-stmicroele=
ctronics.pdf

thanks
-- PMM
