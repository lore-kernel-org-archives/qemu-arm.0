Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp74193lfo;
        Tue, 2 Feb 2021 04:29:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxbOy087JvnX4yCIGq0XRLONHeQYgk+Ga2O1v/kI6vwhK03KJJO91kJFQcF1lYSSFeYdBxv
X-Received: by 2002:a25:6985:: with SMTP id e127mr23523618ybc.50.1612268993583;
        Tue, 02 Feb 2021 04:29:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612268993; cv=none;
        d=google.com; s=arc-20160816;
        b=nsppgC09fE5UWFHHXm0p1BavBXfxWTr1KoMSY7SEkjzqxo4OwuuTQMSqJdkb/vaJOa
         YtGVB5QiGApfzjwDPf/xpIWrmH1VWa15MMJtKzGeWyBx6dJJLcWNx82Qhlku2imWaC3G
         +qG5BSofFf8JobaaUqdoWjH/WOoUGgJTVGY+7GcrzAmSt2VDjhD3idD89WIMYvlVUkSK
         QzyI0hg85B2UTbNgYEaZQXqnmF+AglqXhAASxxkvrGBSmBwayVxChkGE/mp0OcjSq70D
         pBvDqwL1U8SEq2ZJlR+Z/nl/+JVTcAHr6nmhkUW1BWqX6/FxtRtO+J4C24C/+Umf1MYd
         eWSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=hYvDtVlpAIxKd2kqmX8DMzyrmJwQTbWMEa+7BWN3hVE=;
        b=xn2/j0AJbWiWLpIqMTR+ztdKQhrA42xOp1DHbAi0mZOSQf4h5MV3L9tf0R4HXICHxY
         7zIHNACn/LL9tKE3YSqZd4IqkQj+gp6Zx0KSgZ8AGL4FyZwdz4p0Djj6kAqckHZtirV7
         OCDSpwJydRDPtT3Q3R9AeVJV/+7jF6meSmcvPDwlka9b7wioGYPQrAYJPnRfpIbBO71v
         UInBr6jJAgq9zKFlqme8QixNdzShDXbc1JVIGmA7J3qTwxyS5SW8FntaMihD3nRHtTes
         l73VidxYEJhWY5D/GMTxH6dEt6gXVwoQaD3f0HqULA2yvtZ3iLyDwWS+1BB/2oU1Vb5x
         Y9ww==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Mz66wzwm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d80si8184154ybh.359.2021.02.02.04.29.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Feb 2021 04:29:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Mz66wzwm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l6uoa-0004bJ-Vf
	for alex.bennee@linaro.org; Tue, 02 Feb 2021 07:29:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6une-00036m-UT
 for qemu-arm@nongnu.org; Tue, 02 Feb 2021 07:28:54 -0500
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:42519)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6unc-0000bo-3m
 for qemu-arm@nongnu.org; Tue, 02 Feb 2021 07:28:54 -0500
Received: by mail-ed1-x535.google.com with SMTP id z22so22666916edb.9
 for <qemu-arm@nongnu.org>; Tue, 02 Feb 2021 04:28:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=hYvDtVlpAIxKd2kqmX8DMzyrmJwQTbWMEa+7BWN3hVE=;
 b=Mz66wzwmLCaET4hP161id2q9WIDNgCT5c8r1KmZ1GSfNrIkd7Z11gwfYXxfMMIteO6
 uPlubjmJJ5BrIwSwpxVO6zi5Or8TpmByGNIjmT5ox05N3eLWN9bT6XbA+Rj3d7utJvog
 OGDq9JABeeGs7TZqOS+4DaWhDilbavi/cG7imXLwTUguT8UEBouvbR8RBpVxgUXssA3P
 15Bh+Vdn7lmUQsGGOrhB8x06DmVeT7YKnk7sPDawS2AzQf8QhfiwB5DtwoAekjvAPOjP
 Q57N6XfmSauIppJmcT4z+DSmBKyCbX5rLPsqw2h3xkZcToJBL3tsEtkUXpuaclWX6gyJ
 4vOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=hYvDtVlpAIxKd2kqmX8DMzyrmJwQTbWMEa+7BWN3hVE=;
 b=gwnlf5rtSNijhBe3XIQpMngXpxCm3F7XhaYVrr6veKvSsPSvLAmg4bmmTwPb3Ndc2p
 dBttKVrYksyKoUOtL6uH6dMkimmrHbzWKyl3qxAWW/aKa3RLJ0hVE2KjOFI5FAVhu9xW
 rKeDw41lnSxbyspfpKfIVX6J6JtxwYmr4Sy5UX+PrtbCeqvxkK5TmFUuKsu2pWSjEh4a
 e8INM04LoSjO7T/B6Ux9euuCgNV4yX/qXXQX6UXWYn0nFtdBaeJ5M5MOk73f2mdvs6Iy
 TK5GVMYHE20p8Ifj15veDSI7o1j+sVNbK0PdKfUJ5COxl+ojQUflzD0KoIzqsZNiT6FK
 7Obw==
X-Gm-Message-State: AOAM532adLr8yAfK5MzzjaMbzIJropdzFhnOWvORqNAK2HuOigVRpEpY
 SAEiFI6m1w+/MX4gC114cdhf6wjyrrPi6F/nsq8lBQ==
X-Received: by 2002:a05:6402:31ac:: with SMTP id
 dj12mr23029427edb.44.1612268930443; 
 Tue, 02 Feb 2021 04:28:50 -0800 (PST)
MIME-Version: 1.0
References: <20210131151410.318649-1-f4bug@amsat.org>
 <20210131151410.318649-3-f4bug@amsat.org>
 <20210201081826.yx34xjzbgsiwzcpd@sekoia-pc.home.lmichel.fr>
In-Reply-To: <20210201081826.yx34xjzbgsiwzcpd@sekoia-pc.home.lmichel.fr>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Feb 2021 12:28:39 +0000
Message-ID: <CAFEAcA8eDgsGY_Vq5SRuv9HxHY8Qz2j86A0PmKuHfj=H2wm7kQ@mail.gmail.com>
Subject: Re: [RFC PATCH 2/2] hw/arm/raspi: Restrict BCM2835 / BCM2836 SoC to
 TCG
To: Luc Michel <luc@lmichel.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Michael Tokarev <mjt@tls.msk.ru>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7P0j2s358AaS

On Mon, 1 Feb 2021 at 08:18, Luc Michel <luc@lmichel.fr> wrote:
> On 16:14 Sun 31 Jan     , Philippe Mathieu-Daud=C3=A9 wrote:
> > KVM requires the target cpu to be at least ARMv8 architecture
> > (support on ARMv7 has been dropped in commit 82bf7ae84ce:
> > "target/arm: Remove KVM support for 32-bit Arm hosts").
> Wow, is there absolutely no way to do that then? What about using an
> ARMv8 and starting in AArch32 mode? Is that possible with KVM? I guess
> it might not be strictly identical as spawning the "real" CPU...

"Support hardware-accelerated emulation of older v7 CPUs" is
not a design goal of the virtualization extensions; you can't
do it. KVM does support having a guest CPU which is AArch32 for EL1,
but that will never be a v7 CPU, because it will be the same as
the host CPU, which will always be v8.

In general I would prefer that we don't try to do stuff to
make KVM kinda-sorta-work on random 32-bit boards by stuffing
in a not-the-right-type CPU, because this increases our
security boundary massively. At the moment we can reasonably
say "only the 'virt' board and one of the Xilinx boards are
security-critical".

thanks
-- PMM
