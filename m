Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp2451855njk;
        Mon, 27 Jan 2025 05:56:58 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW+/TNbLJijUeeRZJL39VDmal16MpZU5PBaziMvH/W3wFKQm5nQ0VC/Y/ocqHxFfqYyNGiXQYAdjkBdrg==@linaro.org
X-Google-Smtp-Source: AGHT+IE1FipdchWDxH+jQyfvDU7idHTzFnKvark0JEOlKhKtNGtkPW5oCfr05OwZwvV7Lfdhc49J
X-Received: by 2002:a05:620a:4410:b0:7b6:dc4f:887c with SMTP id af79cd13be357-7be632543acmr6585154085a.57.1737986217790;
        Mon, 27 Jan 2025 05:56:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737986217; cv=none;
        d=google.com; s=arc-20240605;
        b=K1K+EoyLqdrBFImKs9JqFerhuga0xVTP+05xWZuLtpCg1xpbQrXNZZkESUwLAl2xh7
         e3EElBm4Hfp7wt4WaX6wucu799kE+qgD4CWcYnPiVz0xlIfNoNJ+/WIWI+JaiO/9RHlF
         dKmMq7i440Kn2vonhdTnAl6I/8Vu7+/Z9FvXJ+zan10qACHwYLpdJQKE/XoEI0IST10E
         pLigS5s+RJLQGDE7ytl6nr+Vf47zMrpHLj7n37brd6aFUMDSvp2kB36JTvvJsXO0bYwx
         im2xuLfRmLvalD/OnE5JTDU3vR1e/H0m8vI2r49NpwNR7XKl+bg9QtjOu7eHvsDYP2NJ
         0EIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=YRH6o7Q7ce+oPjw2GOlNv7BlCxO+HqsAqT4RlPl2sgE=;
        fh=CWrNjvrF6MJVDh42uo4gaIxAmOi5a7T9GnxZdBQpmR8=;
        b=a8XEnKAdi456dP8b62xC0XWwmLwcQqXwJ7Ur18w0DCW4izM9mn5oHxBP3cn0VvLkCq
         Tw4VQupNVEWM30nR/n+ZA7F/vAiToyiMFFh2RUFYCm58wOM2BIvOqllwQL9Qiyzy3Bjk
         Ezrg460xlV/g1BoxAbWckuTainknB6XtBub7M9fyn6U9lFrxQVADdGKxdWW5YCSzxT1b
         h08dVIHPIRnwiHByvsXedJE4aebR3fUBxBVwAuL2VV4LkR0xGSA+IGHVEoJEWA/Rb7oL
         3TnF0tD4/U9cd/USyY7sDeMrK7+g+uEZDV8ZejchVxdwFEoSNMEi9SHz2Y592ahp99EN
         kyiA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=efLFSkpT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7be9aee1681si940178785a.235.2025.01.27.05.56.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jan 2025 05:56:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=efLFSkpT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tcPbN-0001E5-JD; Mon, 27 Jan 2025 08:56:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tcPbM-0001Di-Bg
 for qemu-arm@nongnu.org; Mon, 27 Jan 2025 08:56:32 -0500
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tcPbK-0007ex-NV
 for qemu-arm@nongnu.org; Mon, 27 Jan 2025 08:56:32 -0500
Received: by mail-yb1-xb29.google.com with SMTP id
 3f1490d57ef6-e545c1e8a15so6817350276.1
 for <qemu-arm@nongnu.org>; Mon, 27 Jan 2025 05:56:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737986189; x=1738590989; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YRH6o7Q7ce+oPjw2GOlNv7BlCxO+HqsAqT4RlPl2sgE=;
 b=efLFSkpTspAyD+YaU9sg+oRP0mGQK3O+zwvTbQ5FNLCWeZUhBJC9Q7/2zC/fx8ZSlm
 YEyEOh7cWPBxfYtIUrvMuCo35gvSFpqKDd5HME41Ht3vfTYRAZil7hzpaDd2ro/UAdWu
 dCMxoR0AhNKs01+T0qnQeGpGd02jbQu8aytjhiwyGxoSnUdKG/ulEqb7/xe3ptBhc85k
 Kn/nU1c27aFY10PQ/oN2hzJmRbJvdKeD7HQn0Vnfb9fKhHI4P1H6eTE5CUyPAaiueVsZ
 pD+0Qf3CnHJr8W1+Cmp01bvhbxS6rN8Xu59UdGPLAnQ+OD6ZK8Z2oD1tKNlx2pBsqj/a
 t1WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737986189; x=1738590989;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YRH6o7Q7ce+oPjw2GOlNv7BlCxO+HqsAqT4RlPl2sgE=;
 b=wmiDaO5Gj8sA9dTWoHOILjXJZ1WWGu9MOwaGp7JuKl1OYpNEIQuGsj+IgG/I0hipQD
 NCLqxN9/osoCc4KOrozNZiiVTvKvzKeoSa2iPDWv7Of3GV17wVhjf5/YjAs6Ypjg84lN
 ZoXD+D/D8LabEjMzzjEGdlxocsQ1f3tTWICd3wzzioa56Dl8qFmDQS5JYi8260DcyJoA
 UxYUhuECsyBvOa4BhMRW57FCzWjiBTzE4PHu/hXspUtVMlz55Sfab5b2tP8jpjx339X5
 KKE9EKiA3eVuqOXItAmu7wa6tq4N3Tcon4pZwweGeR5ClvwrNzBT8hwalmOO0pzTvAIV
 gBdA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXSQPHbT6FNsy1h+HylzGGiPUo6CrQ10iapyONLd3IKZbZk3XehOwNURFV14+O3HsfRGlSrU/taxQ==@nongnu.org
X-Gm-Message-State: AOJu0Yw+1Fja7soHpaD3A5Sudo3tgZCZKtjPXYSx32sCqYjG64PAYgYc
 Eb6qbNnX7/y5cN8jsAw4Ww94bAnGh0YVME0u24bIYnOiuYGUr5MaZz8XWUE8XmrSCuuHWSmJLsS
 grHE4uj+XCmTp7yNbcbafXpsX+SrYzfVpbt77iQ==
X-Gm-Gg: ASbGncuju7A53jJU1Siw/UgmU5MBBIhE3rrXiPJ/wJ/eN8BchP//05Bb9cuQa0WLfrz
 7Wtsh343i9iHzSczHfOapwynuCyezVQa1IfC/4JT7F9Wr9ZXuNQh/y1Fho+SyAo8=
X-Received: by 2002:a05:6902:161b:b0:e54:6daf:c6ec with SMTP id
 3f1490d57ef6-e57b13dfdc6mr29077113276.42.1737986189213; Mon, 27 Jan 2025
 05:56:29 -0800 (PST)
MIME-Version: 1.0
References: <20250110160204.74997-1-philmd@linaro.org>
 <20250110160204.74997-2-philmd@linaro.org>
In-Reply-To: <20250110160204.74997-2-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 27 Jan 2025 13:56:17 +0000
X-Gm-Features: AWEUYZmSwUbM13OlC65E2eu_iLi82AtDDSBK7Wat799w5mSkusIz-L59MzbmY0A
Message-ID: <CAFEAcA_JkY9yh+tgthdX-6SKTLJREvgc1FE48jU_JXLfLDvSoA@mail.gmail.com>
Subject: Re: [PATCH 1/9] hw/arm/stellaris: Link each board schematic
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b29;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb29.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: +O3nidoZLyCv

On Fri, 10 Jan 2025 at 16:02, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> Board schematic is useful to corroborate GPIOs/IRQs wiring.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  hw/arm/stellaris.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
> index 1bba96df14e..9b414ff9069 100644
> --- a/hw/arm/stellaris.c
> +++ b/hw/arm/stellaris.c
> @@ -1379,6 +1379,10 @@ static void lm3s6965evb_init(MachineState *machine=
)
>      stellaris_init(machine, &stellaris_boards[1]);
>  }
>
> +/*
> + * Stellaris LM3S811 Evaluation Board Schematics:
> + * http://www.ti.com/lit/ug/symlink/spmu030.pdf
> + */
>  static void lm3s811evb_class_init(ObjectClass *oc, void *data)
>  {
>      MachineClass *mc =3D MACHINE_CLASS(oc);
> @@ -1395,6 +1399,10 @@ static const TypeInfo lm3s811evb_type =3D {
>      .class_init =3D lm3s811evb_class_init,
>  };
>
> +/*
> + * Stellaris: LM3S6965 Evaluation Board Schematics:
> + * http://www.ti.com/lit/ug/symlink/spmu029.pdf
> + */

I think we should prefer https:// (I checked, and both work);
otherwise

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
