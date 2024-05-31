Received: by 2002:a17:906:7fcb:b0:a66:557b:2f6e with SMTP id r11csp661369ejs;
        Fri, 31 May 2024 10:40:43 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVy2p/Ue66xXhqJ5n/81TNAaB3ZYfTTW6sucLqsyg1vE0huxJheAL02yKNM3/CzKRNLCsSSjalcTR8d3l9b8a7OTUI/KRVE
X-Google-Smtp-Source: AGHT+IEPAPNezap91he7T5IsYs6LGY7gpOmotP2rcSzyRTQiSZSuc4wxsVqKiL1B88qJHTjePSjb
X-Received: by 2002:a05:620a:254d:b0:792:c2fe:3ab3 with SMTP id af79cd13be357-794f5c7325emr286543785a.22.1717177243045;
        Fri, 31 May 2024 10:40:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1717177243; cv=none;
        d=google.com; s=arc-20160816;
        b=xbhs+8CD4ZowvFCibIukAyEod4ZxD7EYmPjn4a/udsfjzXuKHYyWrB90sd5grHEdhs
         HKrx3+Sr07uD+Tw6pqqYLIRPLGtFp5HdIbYnQpBXv1JJcBFSYa4s8/JM/BjGagmmSFhE
         TmbUBBowh2ngy+WlLFz3Ev0pZEXFVpK10YD2kuBP/xvBrAiVMo454Bf/UAvICOLot35u
         ixW0axk2vC0bakKzQjMJALlbhPmObwwmXfjy2BXEtUojLf+owL0mnJomU/l/CAF2lMRE
         v5laYVeJFsJw2hig9QV0Xvxi/0vSKB1++QxPscbZ1WuEyjswTS+jDfuy/XvXsEu+1ir0
         kjdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=3gKWccaTWNBdJjFqoDLNh+dn28z3jkomPFk/ID1JrTs=;
        fh=YuVvNRtDyeNeYFphO8mRRCE3Tzxvd/f0TttuR0e/mPI=;
        b=n4z1rrIAyfeKpTalMJ2Z77YOvao8VkTt4xDMWg+8z37eJcu4Gbt0pgEZcEP6rmCDQY
         mgZN7L5wA0vkj1nE2frz39gKGMuE+B/EwlHizN1s/560FzvEKwk603Ejx6XUXzBQ7oDE
         TlymW3GzklZ+dM8QRBR/3LC3Qm79AT0yrCx5nDyw3cl+iQWn4gUx9JyZ0+r/LQ1b6VLV
         JLdkkcOIHYf6RRy62vsdPlzNe7U1S9wRL4sMkQkKHdWqoLt9Q3p73xtNmCrBZCcVtf0S
         MUaD/FoGC1xxTYKZt75Wq+slM/d1AxCosjmoH3OXs4Cf4VndT4JcKcGY1f30Lu16rEFD
         kuXA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=u3o6iE5d;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-794f2f05a31si244174485a.1.2024.05.31.10.40.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 31 May 2024 10:40:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=u3o6iE5d;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sD6Eh-000894-Oy; Fri, 31 May 2024 13:40:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sD6Eg-00087I-L8
 for qemu-arm@nongnu.org; Fri, 31 May 2024 13:40:14 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sD6Ee-0006jt-On
 for qemu-arm@nongnu.org; Fri, 31 May 2024 13:40:14 -0400
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-579fa270e53so2799748a12.3
 for <qemu-arm@nongnu.org>; Fri, 31 May 2024 10:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717177211; x=1717782011; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3gKWccaTWNBdJjFqoDLNh+dn28z3jkomPFk/ID1JrTs=;
 b=u3o6iE5d5NuNFZts+7+7mmG7+RxxmTST9dKRaKDO9tyIdDJGDUIt5wHHI7wUviZC/P
 WARAt0aOmrt0N8apzo21fX6q9M64boPKINYlB+StO+5fX3GrcPjgtQ1iVXipGtLfZErT
 BoKQD+xuH4Mf1E2QoO22f7VZk7bc7W+FWIf7qwEvY9hlKcv84ahGprtJ7OKaZ97si6Te
 5SpQzzKWMcG4jz/NJu/wmTOAXvgKYTU4kpnm77D2Aoi7+pdgJDtA2+QavhAMGNfFmv+B
 ZYPHKTbQugZXqxL+0OcAIVh1xhtp/qt2Rbjlato8x1MGE5+n/wILWgYuIrDC/Hbu7Eqy
 82Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717177211; x=1717782011;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3gKWccaTWNBdJjFqoDLNh+dn28z3jkomPFk/ID1JrTs=;
 b=orgF0lagjXNTUoXiF1oXdhHgYf3T9+5/XhCmDCZq0qMSNzBlGAHbqMOdR7bYpwY+Iz
 FiA9rVn9oRWrqH7ujFf0VIZjAlEx/Z9n27+DDybbYVTy9FLOqrYFWzB6udEJn1vW2OP9
 YXMnJrXIjbF69FRydUKjFPnJx++AgfLzDgSzWvZSlsCruTDnwXSYNsia0uXHc3eOAsIt
 OIOIhdgApCwSvCFYeGEV5yJSfeskR+8I6GmhskOwx2VEk+nxG5hBolCNCLQ5k5w3iih3
 I7CQmDPU3pH7hhg2JsS2wGwt0sAo6DOaA4qEgAySey5ybwQYLY6nQI41lsElvtkv0q0d
 tCPg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUd3r+UTpqcqpNcUHQUSnaGvGQGpoNYe+73s/YS1z6OiIDoOKwZWt3K4CV8whMN4qoamOeuVSXJgJX6O/jtfwRbPnro
X-Gm-Message-State: AOJu0YxopKnu3CEr27NUquYpVuyQZbeAcZw8p5mcJbph5cClPWM/9pJN
 bT7CCs64PDfyM/2MU4M+i3ZxuLUEaCb7axgoEZSWUXFi6GP/RWt3pA7p4gJITjcG9vrNRceeGft
 3/VgAjvXIu2dvUw+BmaMrZcoZx4s5wgTmcUjyjg==
X-Received: by 2002:a50:9359:0:b0:578:e202:137 with SMTP id
 4fb4d7f45d1cf-57a364b52aamr2153980a12.20.1717177210684; Fri, 31 May 2024
 10:40:10 -0700 (PDT)
MIME-Version: 1.0
References: <20240303140643.81957-1-arnaud.minier@telecom-paris.fr>
 <20240303140643.81957-6-arnaud.minier@telecom-paris.fr>
In-Reply-To: <20240303140643.81957-6-arnaud.minier@telecom-paris.fr>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 31 May 2024 18:39:58 +0100
Message-ID: <CAFEAcA92fO-Yi1eioFNb4rZhBOcS9NR5NWT0Cg6JFxUUsQC-mQ@mail.gmail.com>
Subject: Re: [PATCH v6 5/8] hw/misc/stm32l4x5_rcc: Handle Register Updates
To: Arnaud Minier <arnaud.minier@telecom-paris.fr>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?B?SW7DqHMgVmFyaG9s?= <ines.varhol@telecom-paris.fr>, 
 Samuel Tardieu <samuel.tardieu@telecom-paris.fr>, qemu-arm@nongnu.org, 
 Laurent Vivier <lvivier@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
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
X-TUID: zQcCAnc+dVLc

On Sun, 3 Mar 2024 at 14:08, Arnaud Minier
<arnaud.minier@telecom-paris.fr> wrote:
>
> Update the RCC state and propagate frequency changes when writing to the
> RCC registers. Currently, ICSCR, CIER, the reset registers and the stop
> mode registers are not implemented.
>
> Some fields  have not been implemented due to uncertainty about
> how to handle them (Like the clock security system or bypassing
> mecanisms).
>
> Signed-off-by: Arnaud Minier <arnaud.minier@telecom-paris.fr>
> Signed-off-by: In=C3=A8s Varhol <ines.varhol@telecom-paris.fr>

Hi; somebody has reported a bug in this change, which they found
using a fuzzer:

https://gitlab.com/qemu-project/qemu/-/issues/2356

> +static void rcc_update_cfgr_register(Stm32l4x5RccState *s)
> +{
> +    uint32_t val;
> +    /* MCOPRE */
> +    val =3D FIELD_EX32(s->cfgr, CFGR, MCOPRE);
> +    assert(val <=3D 0b100);

You can't assert() things about guest register values,
because then if the guest writes that value QEMU will fall over.
For "this is something the spec says is invalid", the right
thing to do in a device model is to qemu_log_mask(LOG_GUEST_ERROR, ...)
the situation, and proceed as best you can (eg treat the value
as if it was some valid one, or disable the clock entirely).

> +    clock_mux_set_factor(&s->clock_muxes[RCC_CLOCK_MUX_MCO],
> +                         1, 1 << val);
> +
> +    /* MCOSEL */
> +    val =3D FIELD_EX32(s->cfgr, CFGR, MCOSEL);
> +    assert(val <=3D 0b111);

Similarly here. (The obvious behaviour for "invalid clock
source selected" would be "treat as clock disabled".)

> +    if (val =3D=3D 0) {
> +        clock_mux_set_enable(&s->clock_muxes[RCC_CLOCK_MUX_MCO], false);
> +    } else {
> +        clock_mux_set_enable(&s->clock_muxes[RCC_CLOCK_MUX_MCO], true);
> +        clock_mux_set_source(&s->clock_muxes[RCC_CLOCK_MUX_MCO],
> +                             val - 1);
> +    }

thanks
-- PMM
