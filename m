Received: by 2002:a17:505:11ab:b0:1be9:327d:8ee3 with SMTP id so11csp318761njb;
        Fri, 31 Jan 2025 02:23:22 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUCn9aQbiFhhJONVrb033YEx7Ecz2OE/y2SNljBbuuHbHzGK7fzpBHt2Pwcdib1bdwNPi7pR4empUUxEQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGR2xRxXGO1poirsOmJrbDM1TudLxmHtpJu0mKrVOoQy5rmJa9CqJ4kpHcxnV/3GBvvnv7r
X-Received: by 2002:a05:622a:148:b0:466:9ab3:c2d0 with SMTP id d75a77b69052e-46fd0b2685amr162747001cf.44.1738319001836;
        Fri, 31 Jan 2025 02:23:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738319001; cv=none;
        d=google.com; s=arc-20240605;
        b=DzVnrwguE8VmT5mtLRgYbCzACPA2YSEA6KMz/gCgJuDr59PvNUgFt6XQhNEsj0O2zE
         SBUZ55bJtP3/CVwntqDbeEkotXgIRJ08aq3pr7pQTlbiisO8ydJwU3Lhih+VwiYHSofC
         ABK0EPTTfqvudRY+L1vFypvOotiPcU55gsHJlCVPSQ8EdBDYRV6XH36rQ3gdYtSZQ4tQ
         WAunUCaAThEKSJRYpYLQgyHwaKgQDUSobsGTRqX65PY2gO+IOfLbLUYeVucaJ34qLtGl
         2oAYB4wcUH71UDZYAn2Q8yrOWjDtvMeEZhmpaL6fw6jkQLwevbViyL+6XMR705JY1xOx
         q+fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=nhze54LAvnD5BaSR+1RBKDZaJICorB1PDyxoe5P2oBo=;
        fh=yGjnr2+fyI4ngnYnxw89aXbc6x45RDUgpCbv4gv7pBo=;
        b=khR+weEK810I/5KQSiKl+0tlqEdHCiM4uYEqhCGutMBH1kafAlW9wTGVKq0yOgXamx
         xq7ffCpsud/PFqmiU+vf4dzfbDfeELjpvL3h4pDvWjbCpGpA2a3jE+Yu4g5iK9DtrQVU
         3nRvPgug+jhj+CqfJREUDRFyqwI24inmCZ9duezphbr8tnT9k/7uYR3lbKKBffKIhyNA
         Xs3phK8a3DHdyW68mAUoXUB1/TcQ7IkkAmXE2EG4WdRvcLntYyPYLT9mFjJnGqeof06E
         TwRy0gELD0vaKcEl0of3ZqCyvRLBwaeAjZybpfbvlEuFz1Vi6HUiAhvl8B+/lVON0Tzw
         b9TQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UKDVFOty;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46fdf1f431esi35560261cf.631.2025.01.31.02.23.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 31 Jan 2025 02:23:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UKDVFOty;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tdoAT-0005ud-6E; Fri, 31 Jan 2025 05:22:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tdoAQ-0005tn-Vd
 for qemu-arm@nongnu.org; Fri, 31 Jan 2025 05:22:31 -0500
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tdoAO-0004bU-8v
 for qemu-arm@nongnu.org; Fri, 31 Jan 2025 05:22:30 -0500
Received: by mail-yb1-xb2b.google.com with SMTP id
 3f1490d57ef6-e3c9ec344efso2060349276.2
 for <qemu-arm@nongnu.org>; Fri, 31 Jan 2025 02:22:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738318947; x=1738923747; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nhze54LAvnD5BaSR+1RBKDZaJICorB1PDyxoe5P2oBo=;
 b=UKDVFOtyLi13FlYFjoQOn3i8eIC4XXcIMuZ4eUyLo//VQyp6KrX0M09Mkx2YWreo7V
 LiIqbA06BXbv7GBNFUmtKojh+rq2LC9SQN59ZKpjIP+oz3HkqcsHswoYvH4F8dl9T1CZ
 TfBCm13ee1KP3UHDSYTVgwSBuPJxbTZa2pOmEa56n3uRVHF5SRzMxkKmXoNSLzqbF5wD
 sPM8EUU4eE5Vv5vMeVWAPjpk28uXuuKQp0XAmZO7OW6FJvgS5sOKBrAFjC0eEp7ft6oI
 AMJ2TppArHTuIYT8KUKBO6hgFqMIhk7g/5GDTuz6rr8N28geo0AfZJWxwefZvuoS4blO
 N/iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738318947; x=1738923747;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nhze54LAvnD5BaSR+1RBKDZaJICorB1PDyxoe5P2oBo=;
 b=xLvs24gBo2PX0LtMul9Cip7NCi0FU9DmmeuxSeQvezTZjBCkkiHpUzBcUEFA7EuZGJ
 cfzfp424Nb1vmE+BRQQAofSFPKxBxYwHpyYmMjTvTAizUPyjr4dsXpnVaEMqRajengFa
 XtlwzT5WjWS+y3+CMct5iWG0Cnn2EvRTqol33YHUiOk26rTFPp6VeV1G44Zc6FBU3HsT
 PE5nwaDtT5iP81KThsGDXBFoqfrun/oWYPJ0qxYvAuvbokEZWir/2HSzknp41uWTBRjt
 1XxdzCOKejfPY4k5rx+WHTSr/BykfQBMTbMpXc2nCVKYdPm40UCEqos4uuPz7qW9Ep9T
 ZXKQ==
X-Gm-Message-State: AOJu0Yz0Dxfh0uK9IFBgoq6M93ea9JSYeFgQicbQdC+yzFMfdtrb0S9n
 SX+v0VrgoZyqhAxvJ8a0OvDXAKOSmXq1HTYLNSG47LoAcr5Nvl/nH1ZpC3LZe5gEOq5wCjZH+ce
 NLu0PWp8C4TPZ/ZReksF1G+46MGVfUtvO8h5q/A==
X-Gm-Gg: ASbGncsnKEdNcce7hqgdIISr9w60WgUlys+MmLaXdaqrJUJLNa+02ssGC+wv4sEXvKh
 H7pRAuT5mi1dX2VyPKyTWuFtzSx7cUsrdg8UOXz/a+fOo1ppefke2wFe79UL1b1hsv3pjOd0ydA
 ==
X-Received: by 2002:a05:6902:200c:b0:e58:32b4:4878 with SMTP id
 3f1490d57ef6-e58a4bd8c38mr8552598276.35.1738318946798; Fri, 31 Jan 2025
 02:22:26 -0800 (PST)
MIME-Version: 1.0
References: <20250128104519.3981448-1-peter.maydell@linaro.org>
 <20250128104519.3981448-5-peter.maydell@linaro.org>
 <25be2867-6736-442f-989f-2ce1f2745c05@linaro.org>
In-Reply-To: <25be2867-6736-442f-989f-2ce1f2745c05@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 31 Jan 2025 10:22:15 +0000
X-Gm-Features: AWEUYZntnTya7I_VZbaqhA7GRfEuUUnfHD7_BxtY9q8Q_4riolQqRMTmmcqUNkI
Message-ID: <CAFEAcA8uj8=Z01e2uGQ0eJ7AUfvSPLwORVk5NEqVSDk-Gz7U8g@mail.gmail.com>
Subject: Re: [PATCH 04/11] hw/sd/omap_mmc: Convert to SDBus API
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-block@nongnu.org, 
 Bin Meng <bmeng.cn@gmail.com>, Bernhard Beschow <shentey@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2b.google.com
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
X-TUID: hnI3xxi7d6DI

On Thu, 30 Jan 2025 at 22:26, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> On 28/1/25 11:45, Peter Maydell wrote:
> > Convert the OMAP MMC controller to the new SDBus API:
> >   * the controller creates an SDBus bus
> >   * instead of sd_foo functions on the SDState object, call
> >     sdbus_foo functions on the SDBus
> >   * the board code creates a proper TYPE_SD_CARD object and attaches
> >     it to the controller's SDBus, instead of the controller creating
> >     a card directly via sd_init() that never gets attached to any bus
> >   * because the SD card object is on a bus, it gets reset automatically
> >     by the "traverse the qbus tree resetting things" code, and we don't
> >     need to manually reset the card from the controller reset function
> >
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> >   include/hw/arm/omap.h |  1 -
> >   hw/arm/omap1.c        | 10 +++++++++-
> >   hw/sd/omap_mmc.c      | 30 ++++++++++--------------------
> >   3 files changed, 19 insertions(+), 22 deletions(-)
>
>
> > @@ -643,6 +630,9 @@ static void omap_mmc_initfn(Object *obj)
> >
> >   static void omap_mmc_realize(DeviceState *dev, Error **errp)
> >   {
> > +    OMAPMMCState *s =3D OMAP_MMC(dev);
> > +
> > +    qbus_init(&s->sdbus, sizeof(s->sdbus), TYPE_SD_BUS, dev, "sd-bus")=
;
>
> Why you don't create the bus in omap_mmc_initfn()?

Good question. I think I was using hw/sd/ssi-sd.c as a guide
(since it's the only other device that directly creates a
TYPE_SD_BUS rather than needing to subclass the bus), and
that put it in realize. But it's probably better in init.

> Anyhow,
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

thanks
-- PMM
