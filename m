Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1155012lfm;
        Wed, 17 Jun 2020 18:36:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJysJcWEjpyt3e7UdxEZrtJNIddbQJbkmVl2lbfe50Ubj2hp8b3/XMbkutzeJkwOFwdHrveY
X-Received: by 2002:a25:be02:: with SMTP id h2mr2805182ybk.315.1592444170690;
        Wed, 17 Jun 2020 18:36:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592444170; cv=none;
        d=google.com; s=arc-20160816;
        b=uJ11XkbjV2/LvVlvcAdO+Y4uEhrm8yHCbjM9h+/UmZkXORAvtH32JqEAceSjiNiJcU
         PJWzGJRTF0D3x6Viioy80yPvISkD7YYu94Y+HAyVnuaNsJGCMH3NLnhVumo3CVjTApEK
         rg7ublJiIi+qKudZmRDKMBGgAqSQYpj8XYr3mruuIHNEruVP3cXAtqu9zCYKUHUgDH6s
         IhUoei3mtiAj6d5UTxzWexnExfOdwTzep6XI43+4LVDxKy1VsgF/h9IDBbxXn3y6ovWq
         kGX7IZic8UsKlkzLSM/E7f3IlK5n+VmuRyaR/aowQq8GIWTuerCFeoKBksCY3RV4d7EM
         rjfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=MzY4OVA4rpGN1Q5egJ+3o1xLeeZmfNYcTBKwzKW4Uxo=;
        b=hqtk41H/spHoOAlaE2jsuv7ewCIw6L0AHfYMaRyAwxiAgJ/hUfI1qMQgEbX95iIuTv
         XZMCWM3UFlFtBJlaDoxc58TKxZ75cZyVu6ifbH2SU/f5jLGjGIe6Oj9y4r2XfipcghQ1
         Bdii9ce8Qx+3Zvo/P+Q0QKTdWnQ4G4nCnqFPgK3RylmFIlLxUjgtCWjGtx1Fjduc08Mz
         jjw8fPyqtvr0JtXP1Sl5R1KOQx/xhngXPmkcM5EoVvV9VZSTcgGabF866Lej12e5sGbT
         k8RiWpY9ajND9Oxr0MtuPdN3HgbxCJ9tCgIv8gvO5EYhcGctbusAAhvboLCA1drYj33U
         NzKQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=ivssjTlJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w2si1176606ybj.47.2020.06.17.18.36.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Jun 2020 18:36:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=ivssjTlJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:47632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jljTN-0004o0-WC
	for alex.bennee@linaro.org; Wed, 17 Jun 2020 21:36:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1jljSp-0004nl-Rf; Wed, 17 Jun 2020 21:35:37 -0400
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642]:42396)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1jljSn-0004cD-95; Wed, 17 Jun 2020 21:35:35 -0400
Received: by mail-ej1-x642.google.com with SMTP id k11so4630010ejr.9;
 Wed, 17 Jun 2020 18:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=MzY4OVA4rpGN1Q5egJ+3o1xLeeZmfNYcTBKwzKW4Uxo=;
 b=ivssjTlJ1lzLvG+1vCTd68ElceexoWLSz0XBMXd0BrbgQ7sejtfeg4yvBx5qxSJP5H
 rjnup88xHqX2xJDU+ifdjIKhSJoS8OFjOmeVRq0oCnP0zA4rPLgY3VGpnVqh2easrSAo
 HfYgP36Jgy7MC+7HRCrhQ2ZRHeSA0KOQ4TsEs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=MzY4OVA4rpGN1Q5egJ+3o1xLeeZmfNYcTBKwzKW4Uxo=;
 b=AKXzer96DACPSae2ory9w0W4GTA+lnI2F5GEGcNsQBnfY25w9WN9ln2/f2vYf7soCs
 3PsYsTqSoeSyv2qO6mIty+UcOA+hwSYchZu+k6c0wgNu86fSkG8jSwazg9fzkVWWRG4a
 G1j/f8FjEcGGuabiPZSpZvKy5U9E86vgUvr3Zy3DnC/G/Hp0/pl78P58toxkyWVvGys4
 h2bPiChQkd+OXXYGjR0bYaQREZUpC594n1EuIIKHGcRJrsEFBLibhBnvfFI0AACsW5JN
 7qoiw2AQJVczrupaPr2/Wm1qcToElVKbLKhOqiGYlHPNmD/V/OP6hTaUxvH7V2pSEbAQ
 7wbQ==
X-Gm-Message-State: AOAM532kIds7+PTfjZr3cwYuEG+1gIsn/cEIHmhoJS33G1uYOxRW0rGx
 8ep0HEXdHY+XdzmLmEUrhljeb1gbe3g6EKMHNWo=
X-Received: by 2002:a17:906:f53:: with SMTP id
 h19mr1721877ejj.491.1592444130786; 
 Wed, 17 Jun 2020 18:35:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200611223016.259837-1-hskinnemoen@google.com>
 <20200611223016.259837-12-hskinnemoen@google.com>
 <69a4b9c8-0ae0-96e2-8b46-cc89c9acbc9a@kaod.org>
In-Reply-To: <69a4b9c8-0ae0-96e2-8b46-cc89c9acbc9a@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 18 Jun 2020 01:35:18 +0000
Message-ID: <CACPK8XfzgLURHct7=cOW8ABuZ72sCFb6tgVAWX=n58oP6qdUCA@mail.gmail.com>
Subject: Re: [PATCH v2 11/12] hw/arm: Wire up BMC boot flash for npcm750-evb
 and quanta-gsj
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::642;
 envelope-from=joel.stan@gmail.com; helo=mail-ej1-x642.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 10
X-Spam_score: 1.0
X-Spam_bar: +
X-Spam_report: (1.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, PDS_OTHER_BAD_TLD=1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 QEMU Developers <qemu-devel@nongnu.org>, CS20 KFTing <kfting@nuvoton.com>,
 qemu-arm <qemu-arm@nongnu.org>, Avi Fishman <Avi.Fishman@nuvoton.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dsxCT/QVh4Eh

On Wed, 17 Jun 2020 at 16:42, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> On 6/12/20 12:30 AM, Havard Skinnemoen wrote:
> > This allows these NPCM7xx-based boards to boot from a flash image, e.g.
> > one built with OpenBMC. For example like this:
> >
> > IMAGE=3D${OPENBMC}/build/tmp/deploy/images/gsj/image-bmc
>
> could you put the image on some site when ready ?

They are built as part of OpenBMC CI:

https://openpower.xyz/job/openbmc-build/distro=3Dubuntu,label=3Dbuilder,tar=
get=3Dgsj/lastSuccessfulBuild/artifact/deploy/images/gsj/

Cheers,

Joel

>
> > qemu-system-arm -machine quanta-gsj -nographic \
> >       -bios ~/qemu/bootrom/npcm7xx_bootrom.bin \
> >       -drive file=3D${IMAGE},if=3Dmtd,bus=3D0,unit=3D0,format=3Draw,sna=
pshot=3Don
> >
> > Change-Id: I158a4d9952c0e90f2b1b7280443a7305b6ae57cf
> > Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
> > Signed-off-by: Havard Skinnemoen <hskinnemoen@google.com>
>
> Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
