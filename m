Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1817748lfm;
        Mon, 15 Jun 2020 09:03:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzVGIfQbt2bw8sy8UGRvtaVVOxZqEsHE39p0B01Qz2AtqnOofjtDRP0nlU93IVcAHQWf5DN
X-Received: by 2002:a25:32d1:: with SMTP id y200mr43407687yby.507.1592237002787;
        Mon, 15 Jun 2020 09:03:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592237002; cv=none;
        d=google.com; s=arc-20160816;
        b=BATC+PtKGaxs9prr44dgqvAcBYe7PD9SwUIFT1gxYfth4yuF6Ikj0AYVz9i5MmyIkP
         eLh1ieNkheUy/EKypbndbWZLdjBwWHqr3B7FLCWuxAEGWKQah+HsYGPQHyBvWxLe+Ds4
         Xh7tVizXpUpl6WNU5zR5kZzyhHPSPvRlDn+nv9TL0eYf86Qrf64ZLiI2gQWN98YqaNHg
         M8py4KBngCqjkw+fYzA6Ui0NGRweysfAkuWaMQv6HODSsRXYMoMy1UUEIKYFmOmppYf+
         9HT2P4wZXrOodKq2rDHqCOY0j4RELcYem5D68A2kAW8D7xtYU/yRjb8L+r3hrijQJ2gS
         U+8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=EmnkRH2YoTe3iuP86b7Jm00I5ntFoZNUS9DkL1GSuKA=;
        b=DZCTcPJwWtr8fEov+b6a9ut9rhwXURNCspt7KPc57tqyNK+LiMkv5SCXDwmaHP+iTU
         Dv+JaCkQpL30SityF7NCVxfc5zXBGBC+yA2jPHrnSBdzuz7Tp5kz/T8DcXvcX0YPIhZy
         df37QCOST3y4pMWC8HfFEngy0BncUny2mCFVZ4pChifuQ3rNd+EcA7eFviuXlWBXjTqf
         Y82Tme0zSe6ITJeqwVJ29PxKlAfg8+AK14FjNTFqHUx3X930XuPulPThKtshFNk0eCxN
         xInjWsvPPgpFBiPDV1cOQsfSwZJ70L84WWxGKqGOrCYaG1jT82sHguCHuV91No/bL1WR
         daBw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=AxTwdYFZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 136si14785690ybf.378.2020.06.15.09.03.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 Jun 2020 09:03:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=AxTwdYFZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jkrZy-0001z5-37
	for alex.bennee@linaro.org; Mon, 15 Jun 2020 12:03:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jkrZe-0001uk-Mt
 for qemu-arm@nongnu.org; Mon, 15 Jun 2020 12:03:02 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:43201)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jkrZb-0001X1-Pv
 for qemu-arm@nongnu.org; Mon, 15 Jun 2020 12:03:02 -0400
Received: by mail-ot1-x344.google.com with SMTP id u23so13515309otq.10
 for <qemu-arm@nongnu.org>; Mon, 15 Jun 2020 09:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=EmnkRH2YoTe3iuP86b7Jm00I5ntFoZNUS9DkL1GSuKA=;
 b=AxTwdYFZE+TWnc7BVinvaFzGuG+pHwUyKam/7MlzT41XH4iuZEVBgynhDHwl7y7uPE
 G7hsRlkG1zaC37htASaOrB96uGAAXhwGW1mNUvce9TWFytES8aFRALg+yyCJgBitSGPl
 Gfb0HYuaF+tUvMgZR07vUtVkKR+QPRHhV/z3wRwpDW7mjG2SNlIW3NGmoLYOZV4VwNQK
 zqXaRHwVXwYDJJwygjkQhaLiwKve57aP/Icese9QkofecizZ9XdaWrX3Zw0fobWvOW2K
 J3FIDmOmvCxpk3sSxaFt20rGH5YfB3a4oSG6CXBl0LHczV0igDYmaWvaZTIxflV6MMDa
 nMyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=EmnkRH2YoTe3iuP86b7Jm00I5ntFoZNUS9DkL1GSuKA=;
 b=PX2A9s/ZcHJ7JZ9+6i4pODUVhHgimENa/ygjIGaywgCwfQcAbWUXfetc2eXHS+Lk4W
 0xCjlGBxZlKVHRhHUzBdpTC6Pc6a5TB3ctQ2MNM6VUnvPQdzEEdGX/tDaRbnUV+DbJpb
 IuEbdF9fV3gf5n1H/3hhTN3sB1/70+v/e25iKjgKFNnXG40cq/vJmYuK0YOKxtKti5Kt
 wOMp0EWC4tOy8jZvNv22Bgwjm8dFlvDQCJwrGPRVJ79gTBXQ9f0/++yv5KFr332keqt0
 +CJi6IpE5ST4uhUp2BIL1HwDA8N4A7lU/+N4AQztNICRnkIkQu+/iLU2TZNn1viWIWY5
 TXYg==
X-Gm-Message-State: AOAM533XT2zXdfIcQ/tM6EzrHuT9yxunDlugZvMplG+lvrf9SmM00ZTz
 F3/fq5s0fyDpwHlfceigXIq+MaRoK6li3xPN2k1MLg==
X-Received: by 2002:a05:6830:18da:: with SMTP id
 v26mr22645151ote.135.1592236976952; 
 Mon, 15 Jun 2020 09:02:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200612175440.9901-1-f4bug@amsat.org>
 <20200612175440.9901-5-f4bug@amsat.org>
In-Reply-To: <20200612175440.9901-5-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 15 Jun 2020 17:02:45 +0100
Message-ID: <CAFEAcA-B26YareWgkTanQdGnz+WuyJW6jbHCvdwcGty56zgXpQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 4/5] hw/arm/microbit: Add a fake LED to use as
 proof-of-concept with Zephyr
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::344;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x344.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>, Eric Blake <eblake@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Esteban Bosse <estebanbosse@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Andrzej Zaborowski <balrogg@gmail.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DXyACwWI0Iry

On Fri, 12 Jun 2020 at 18:54, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> We were using an AVR based Arduino to use this device, but since
> the port is not merged, the microbit is the easiest board to use
> with Zephyr.
> Note the microbit doesn't have a such LED, this is simply a proof
> of concept.

I know this is an RFC patchset, but just for the record, I
don't think we should add things to the board that the
real hardware doesn't have. (The microbit does have a 5x5
LED "display" but I dunno if this would be the best way
to implement that...)

thanks
-- PMM
