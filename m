Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp3131696lfm;
        Mon, 13 Jul 2020 03:05:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwERwCsDWbWrn47s9IkLh1tSlP0t24iRaWFQPCelAvCp14owX/Cc73nv56JyDEJ3DEvCiZ4
X-Received: by 2002:a5b:3d2:: with SMTP id t18mr32338921ybp.453.1594634753904;
        Mon, 13 Jul 2020 03:05:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594634753; cv=none;
        d=google.com; s=arc-20160816;
        b=RJRyN3TGnGCQ9VAhFYwjZsuovtE5LmYizjKsnZznAgWLnMF88r++nJwMEWNfU3S4Kc
         iNJj2ARDWMvSON3UVK2rcDYr5ZojJuRs09UrtWHZB8+EoaQ97chqVXIg+EEMtDhzTvZn
         A1KQG38kISyStDRPwzVAkD8Wwqf7iefTjR5v+rp11ju26erqv4BPcGmIIJ/SioDnTmGE
         h7bEr3Pv3v1/W9yDkJP3gz789CoP+h2mSxBJQyQ6ehXyd9BJs7Fx7Xbf9M+lKs+KtPsX
         kBAmRm9MLpHf+phRWf7s2IYIzPClR+Tb4kq3nH7+PoZ29fojFdWxQ0WzLieglLSNdUxT
         wg9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=eqW9Kj52y69ZnpMGvLNWRCX82+2t7WxidfGVLvjziz8=;
        b=OFZihGGXINKQo2VzAR1oksfQ9qy1UP/MqqNeV0UnOewYYnpbJuzR51xTWp8+yQEmaG
         uZkGq6mYOmj+Vi5sN3R5jxWqAxmk0z8pdVqw35/Lkb3pr+sNvLBnkP47FJc7oVyrQ5qC
         WV/fuK+1+h3d84UZBgGCQqlw48GPtjFBNhiezDcQrxe6Oz5dZJT5/8bbkwy2BZHaC3/b
         +m85jVRCI/shuMrsr1fjjzkD/sUy0vcg1Voaa4SHxJFB4PxUD1c/oQdjmmPGB0j7gvEQ
         EgYNuR1z+/bB8MHVydXYUIGNLDSxMnAie7h3cxK4YYbpxmrGLc2y0RcTxMqJKSs5/q/B
         E/9w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=q1HBULXJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g81si13955476ybb.330.2020.07.13.03.05.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Jul 2020 03:05:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=q1HBULXJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1juvLN-0002cA-AE
	for alex.bennee@linaro.org; Mon, 13 Jul 2020 06:05:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1juvLB-0002bk-Eo
 for qemu-arm@nongnu.org; Mon, 13 Jul 2020 06:05:41 -0400
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:39321)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1juvL9-0004Dp-Iz
 for qemu-arm@nongnu.org; Mon, 13 Jul 2020 06:05:41 -0400
Received: by mail-oi1-x244.google.com with SMTP id w17so10500270oie.6
 for <qemu-arm@nongnu.org>; Mon, 13 Jul 2020 03:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=eqW9Kj52y69ZnpMGvLNWRCX82+2t7WxidfGVLvjziz8=;
 b=q1HBULXJB8n69p5SBIZPP0W3Q1xRm1Wo5CdxKLf/e7G5faZTrpmsReixp5tOTZrek6
 wp+z4BPv6OlN3aZS/vX9GR5ccWHQj2VQBZ+rsF5zENxUfuDj6sI99o3xllW9+K9vctzG
 /6vy4gGS2eHKGQ7zolBEEYZ4JO2BuXLD0a7dIL/ajSWr14pbBws/iy/NCJPJaWwpzG9I
 cTb5Kl6zk77wiikl5z54XvEBcqiOXTWdyu+gkKpmu/McTC3653HUa0lQU3E5zRkAA/Rp
 VYQCT/7LAAF235UYiJ7ropcSF70yn0UktC8PCgLs1ssPQ8x9tpwBmtjeTTX74bhSaGk0
 FYBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=eqW9Kj52y69ZnpMGvLNWRCX82+2t7WxidfGVLvjziz8=;
 b=eAVG6TMoZ0EeUphfVVE8B/Cfop5xD1HfDqOocjwSpScDE3GGnvW4Oo7AR3RC2U/PRj
 xZYHhaFovEglkeHedkdx0toTtzM4BAFKagR2lYOtrmSMff6LcCtOoJPcMsDOz3wI5Oyl
 442+bROh7yJ6kY5oPUoCy2yFNMejYe2xBRA/YVgYbiQuQiUlRR1u5juxL3dN2mp3CUFy
 R9ks09OXE6sjH9F/8P7ppZq722oRfZVvxU66XKaM/StMPz5a6hzRxwFUFc/8zZugKrbz
 i8MWsKQkRIjY0ZwM2tpHlqCnhypihS87E/9poveGsCDAM+gEb+/kOD16uCUkdR0Ag9Cv
 TNYg==
X-Gm-Message-State: AOAM530jPitjMiQ4BLaUZVDwu4wjOnVauqjfIMPCdN51GgX63GF6vOpe
 hOmCzEihWAAqO5y79uznO6K4bDgoR7IWCOOfEb3nfw==
X-Received: by 2002:aca:1706:: with SMTP id j6mr12708772oii.146.1594634738340; 
 Mon, 13 Jul 2020 03:05:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200628214230.2592-1-peter.maydell@linaro.org>
 <20200628214230.2592-3-peter.maydell@linaro.org>
 <4c049b0c-f305-729a-748d-0a7742b496ed@amsat.org>
In-Reply-To: <4c049b0c-f305-729a-748d-0a7742b496ed@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Jul 2020 11:05:27 +0100
Message-ID: <CAFEAcA_JCSs6BCCw-MYOO8RcyXQ_iNZ63KjuwqEPM7yuvWsdTA@mail.gmail.com>
Subject: Re: [PATCH 2/2] hw/arm/palm.c: Encapsulate misc GPIO handling in a
 device
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::244;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x244.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, Andrzej Zaborowski <balrogg@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: X/bE5UkyXpUm

On Mon, 13 Jul 2020 at 09:57, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
> Why not make it a generic container in the MachineState and create
> the container in hw/core/machine.c::machine_initfn()?

I don't think we create containers like that for any other
machine, do we?

thanks
-- PMM
