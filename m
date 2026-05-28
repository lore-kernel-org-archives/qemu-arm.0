Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65389CD6E44
	for <qemu-arm@archiver.kernel.org>; Thu, 28 May 2026 12:35:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wSZxN-0001z4-JU; Thu, 28 May 2026 08:35:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wSZxF-0001xh-Au
 for qemu-arm@nongnu.org; Thu, 28 May 2026 08:35:17 -0400
Received: from mail-yx1-xb136.google.com ([2607:f8b0:4864:20::b136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wSZxD-000268-7b
 for qemu-arm@nongnu.org; Thu, 28 May 2026 08:35:16 -0400
Received: by mail-yx1-xb136.google.com with SMTP id
 956f58d0204a3-66043ecf6b3so330695d50.0
 for <qemu-arm@nongnu.org>; Thu, 28 May 2026 05:35:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779971713; cv=none;
 d=google.com; s=arc-20240605;
 b=lFumpgONBYJKbxLK85TEwv74kP/tve+5wUw3Nb6SeITgAM7y16r5rBjp56fv6o9OFe
 IFhSRZ3nCRksurvgtjmvnckKyVh9VdfgpqwK59DL23R38JhK2B8spZGZTRP/m8dmZMth
 mKsZACpAz46qOBawf0h54svEtvuXqZiuiU+4QO1KeZhb3FUtzZZZRMGpDnhUNfBXNR3V
 RAMvM6WOL2JlwxLWV4KJuLDeWEg+0UvX0oj/m2iAu8eu+xEFIAM4WYNcEBSycVgkJ/a8
 Oouz0UokiKyQy8/S5DBCkRl1uEOiVPWyJBOfQ5vMP7eD4Y2GQMOw+uu5viCTrCP7ssGz
 FsVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=ACMhcH+FB6zeYIrQqDuvdFXd8HVUUYZ0H3Mf5TAXE60=;
 fh=a5Ga9MTqf+VxmGPF+PvLzcTaVeReyerJ10BlR8q068U=;
 b=Eq2n3L3Om+7RH37wXHc1jl6Eiz8qR8IegsnZzfoFmg2pjo8v7sfLWjZ6MGvLvuThT3
 0MlFSSQed/RcxbNoUGrciHXMSiaSnEZLr0bM+ZBno3S0fY3RML3rmCcBOHPODPMtbsQB
 WGUw2p3BsyEefU9oh5NkgtD6Uw4vchOX4WjPWeQ+BxUJNIOIECKzRLN/UYWe+JyIY0CV
 fp8Ew1T42Qh20c+FyYCCQ961WS9c5uRWa5TgWdl7luyV6uowXThfnIo8ibLN2lBwrrJK
 Q2Il3Dsi0IbAlRrtGnR9LQcllpvNSqNK8Jc3y0LEyCeLf6qi5uYwG0DALnt3qmrKx+Xu
 fIXg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779971713; x=1780576513; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ACMhcH+FB6zeYIrQqDuvdFXd8HVUUYZ0H3Mf5TAXE60=;
 b=UM7MaRq3PA2XArnUUckKmEieOC1ULfvVSoRokYX7CJaPCxLF3UJEg8p0lCVe69vs54
 b2F3QNvkZu2dgSPKcxQCMYCLS5MDoHR8ssN6SkviUZppGR9vum1A+HPDsuoiJplU+wTg
 hAdHmiRZH2JWcNqqb/Ibr2WECyGd51UncVuv0pi9vjurpvTm4AmSi026Or76VVELMzEl
 KDW4W+Wgh5bScv7whdm0H7P7etxwcOduNZvk12LYbAX3+xtX9Rc3kkX1A4WiMGbu8N8J
 asOLeCyDQtAYwfoTsQvvEk1xqyk+wCrAuZpa6QC3Cbxmn0iELbnvOMNICb/67Flv2TOq
 L3WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779971713; x=1780576513;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ACMhcH+FB6zeYIrQqDuvdFXd8HVUUYZ0H3Mf5TAXE60=;
 b=h9x8iPsoGjBcPiAdJvqdx9py0YQ+2eWb/Bf1XUCllp7wU9aO0YvhCzCAO6WDtXeEws
 0IOUoDiKs00P8SzqQbIM+OXKIeahjiPTYTj1w74vInKPZT3GAFTR8K3NZbWL3bkiNTpN
 R+nd7WvPXJRejB1u4lIzPREHH+6XyHPh7lexz4ThgDQyzsAMYZEvcieuwdIpwAl7AqqA
 BotWwHdSs7R8w31HTAE2Rbzfa8vUOGOvUDlRPctct5Gm9T0KhWPqng0Nu8rm8oaVccFf
 57FDa06ob5qqEx5VtbaO6+2oij50HEimT5jrBioUnwTG5y4z4cBh0u6Vdt3anTxiNB8k
 lvdg==
X-Forwarded-Encrypted: i=1;
 AFNElJ/n4PsLMAmHwwZlXhwkkTTfKVnNoHP+Lm+ireMtJ/JZuzFW5U451Pzsd4+TP8F+x4FvgeIlhvldOA==@nongnu.org
X-Gm-Message-State: AOJu0YxlbABakWW5IkJovP8RIuzbbyGcVSZDFQTPnMkFXn+KCDYVoYRK
 vuGvaE6GbcifI9HR5JBJHGa6P4D+25+Vq7ZNTfCh8NCbXrvhHFfacaY+sBfeZ62kGSx1ZxBD3OU
 ws5KM7gO1HR4VdI9WUnVa7Q3dLyWfozDGfeyMdFow7A==
X-Gm-Gg: Acq92OFomF1QT2Jiis/ZHOmYdQ9xItnTWuADvDi8xBiuQWJMZG/pNVggzHcgDA1QVu1
 Q+/clUJMCfKhHMgeNxpQ8z1+oxdkyB0MvExYRaquu3eNkxrdm3JAl8KzIG38m/jeDwESXTj0zLB
 O12JA+ymWMnyTksOubVauYthAxkAKTxvzFgIsLizQq+hL21Fj6LfV0Mj/iawr53xJwvon6EXHM1
 aE3L/puK80EM7iCt70UhFRoSibMxPWUTXDhbBmepkrvmVkZakR8fiMIRbnZJlajtKOKh8ngvSyw
 0nRfoUDbunzWKeTg4N2F9nSTzRfaaBLzDKbqOX+EdCxLVYwGOJuJlHFU1gKyGaGj+ATY4ZdH+jk
 acg==
X-Received: by 2002:a05:690e:4090:b0:65c:7129:5c66 with SMTP id
 956f58d0204a3-65ec98e90c8mr23297120d50.41.1779971713413; Thu, 28 May 2026
 05:35:13 -0700 (PDT)
MIME-Version: 1.0
References: <20260518073401.11279-1-corvin.koehne@gmail.com>
 <20260518073401.11279-13-corvin.koehne@gmail.com>
In-Reply-To: <20260518073401.11279-13-corvin.koehne@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 May 2026 13:35:02 +0100
X-Gm-Features: AVHnY4L93mOwQjaimywT7PXLnnhUJz39G5c5TkIXt0BaXM_FRX047jnlXmPxpHk
Message-ID: <CAFEAcA8=DTddA2oiv2SjggC1O=A3PdXbO25Ut7AcNp=6nsuqXA@mail.gmail.com>
Subject: Re: [PATCH v7 12/16] hw/misc/zynq_slcr: Add CPU clock outputs and
 ratios
To: =?UTF-8?Q?Corvin_K=C3=B6hne?= <corvin.koehne@gmail.com>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?Q?Yannick_Vo=C3=9Fen?= <y.vossen@beckhoff.com>, 
 Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?Q?Corvin_K=C3=B6hne?= <c.koehne@beckhoff.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-arm@nongnu.org, 
 Kevin Wolf <kwolf@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 qemu-block@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb136.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Mon, 18 May 2026 at 08:34, Corvin K=C3=B6hne <corvin.koehne@gmail.com> w=
rote:
>
> From: YannickV <Y.Vossen@beckhoff.com>
>
> Add CPU clock outs und derive the related domains from the
> base CPU clock ration. This makes the CPU clock domains
> visible and keeps their ratios consistent with the hardware
> clock tree.
>
> We also need to set the reset values during realization to
> ensure CPU clocks are properly enabled at startup. Without
> this, CPU clocks would have a frequency of 0 Hz, which
> causes problems in the a9mpcore timer implementations.
>

> @@ -630,6 +667,9 @@ static void zynq_slcr_realize(DeviceState *dev, Error=
 **errp)
>      if (s->boot_mode > 0xF) {
>          error_setg(errp, "Invalid boot mode %d specified", s->boot_mode)=
;
>      }
> +
> +    zynq_slcr_reset_init(OBJECT(s), 0);
> +    zynq_slcr_compute_clocks_internal(s, clock_get(s->ps_clk));
>  }

This doesn't seem right -- devices should not reset themselves
in their realize methods. What exactly goes wrong without this?
This device's reset method's exit phase handler computes the
clock state and propagates it, so devices consuming the
clocks should get the approrpriate information ath that point.

thanks
-- PMM

