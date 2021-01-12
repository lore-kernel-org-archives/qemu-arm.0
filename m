Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp3667156lfq;
        Tue, 12 Jan 2021 08:01:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJysjiTSRIeo+cjuxKQbSB0E/fmnTPZE7jv28+XfkhHoLj+6fIrrCtLlUppot9niclBIGYty
X-Received: by 2002:a25:234d:: with SMTP id j74mr96687ybj.93.1610467312663;
        Tue, 12 Jan 2021 08:01:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610467312; cv=none;
        d=google.com; s=arc-20160816;
        b=t9INsU0j4P6yg2fhDLL4rDRI98rtUeSvx16AYLNpaZwFcZvY3syZpSPqnLUxOaLZcL
         CjffUYcF2x2m7pO6TllOP9FMqDpF/cgbDVPq7lVfjsAb/BAQPH0VN89/bBXQXBEVp5HA
         9/8481/dLJ9Ne1bboZOr+okoSNe/aW38QsiNBe/NRRzJBAu/lgDt6R51h+FpZ2O2Z6v5
         fTVvI1SUTvSMixPHzileJImpEPSFlHxd3rtid36Wi+F/68Yu9nZC0WOVUVhbXODzvfoz
         PE5oTOlYRgOfmmVaQIPokbN32gwt7rgUwrbQMCISWcLlHG/QtelzpsOsqgakX6BozkUL
         q23g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DfjIkZdzdlD/vkJuzL+98clXFddLOtIlz/ZDcf2SDn0=;
        b=qd3eMdWLFfRM1U0p4rmD/XKoZuTHIMYm7ikEGp0q0HX+EneXSrjHe8qUEa6XEDSGiS
         W0bGvLC+eQm642t/AIegrAL0OGj6lki4IvcQYBXbY6WIAokXxUejF/NzCbgm/3befqIh
         3tEcPT5L80PQFlAna8uBp+aJJuUycwwMvf5McdWKUWeE71IG++tK5gR7Sb1L0X6PAV2D
         rnKiO5I476troX7jxE3HMPCP4zvUZLN7W3rt8U5oAvVZfK0zG8Buwe8maFwZuY4g0Tbq
         rAoTnh2ZRV3dT5P6ehFk7KfZXnGga1m8L+NJOlF3oNUsly8IMEkIWStnptGC44thGxuZ
         tLzg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=c0B2cDrz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n132si3018833yba.482.2021.01.12.08.01.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Jan 2021 08:01:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=c0B2cDrz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kzM7E-0005q1-1f
	for alex.bennee@linaro.org; Tue, 12 Jan 2021 11:01:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kzM63-0005oq-AJ
 for qemu-arm@nongnu.org; Tue, 12 Jan 2021 11:00:39 -0500
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:46330)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kzM60-0002AY-Et
 for qemu-arm@nongnu.org; Tue, 12 Jan 2021 11:00:39 -0500
Received: by mail-ej1-x62d.google.com with SMTP id t16so4178374ejf.13
 for <qemu-arm@nongnu.org>; Tue, 12 Jan 2021 08:00:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DfjIkZdzdlD/vkJuzL+98clXFddLOtIlz/ZDcf2SDn0=;
 b=c0B2cDrzJtDJuv6NSsL5WIVXRXs8cZaqDUXpllyKQzWDvEhBQXju6s/8aQmRyezzDi
 WuVXBjJnqnvwJE9qeqm3FQ2Ux/ZejlqOePQg5cl8JZkBZse4CxRYcz/65TImkTE1RC9E
 6VfGb6+VMeqoDdb8Le6PnXbb8/tZtijyVjAMzPm5qaDMu/G0QT+UhB58ycY2kpMH4wBp
 UMpXAhaWQlhyEju0z6pwdABbU1WG4QwCoxdkTW5Ujw7UQwQSuvznbHby6BQqBfOANDx4
 g+Jsqagsi1AW5X3GeD5A6dKdd/mvBD90+AwQGl/DbPiE+OmauFLDoTEY9M7+yM4pDYx1
 /36A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DfjIkZdzdlD/vkJuzL+98clXFddLOtIlz/ZDcf2SDn0=;
 b=ZwQe5Ps3AE197Nf34g2Z1kJyMaZWrMzmMhR/QSqN39ErEcvw1dUs6DpYU0QyWwjkrB
 bsHWtfzn/ccltSdNlO1W9FiNTc2vFdyl+cdD0/eVrJcs8n7QiG+WO8YPLTin8Ll/PABN
 bO5KNIPSNmq0vfTBfqUzIg4t62zVg9uKDqsiwsfw2p7g2tq32zBGaztRFytwHUZgF5GR
 OW9c9nQ1HuXcRGGYwig3qK4QRKChgvVlF0c0ikhNV7pRyh0o+zzwBz3gPxwAUdiYL+Sr
 ue25AaKnuKOy9c1+G7Ncvt9zopGvUSlv7Yt8zzVvK/Dkd7iTY2JCdUUsYDyuLAWO4j1o
 coYw==
X-Gm-Message-State: AOAM5300WJEiC0E7n+ow+tRodi8Y5hiaOMHDiTN5byndD7WwIqmKTBZX
 5LtB2FsSTJlr4XdQ8rppBvFvFHcJAVENI/hi5gs46Q==
X-Received: by 2002:a17:906:1151:: with SMTP id
 i17mr3833214eja.250.1610467234324; 
 Tue, 12 Jan 2021 08:00:34 -0800 (PST)
MIME-Version: 1.0
References: <20210112143058.12159-1-maxim.uvarov@linaro.org>
 <20210112143058.12159-3-maxim.uvarov@linaro.org>
 <20210112153542.oqahdubzeoipyvun@kamzik.brq.redhat.com>
In-Reply-To: <20210112153542.oqahdubzeoipyvun@kamzik.brq.redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 12 Jan 2021 16:00:23 +0000
Message-ID: <CAFEAcA9O2kHpcvoofo0v3ahXNOQtw8cxaVC2hn+AjpH6A9RciA@mail.gmail.com>
Subject: Re: [PATCHv4 2/2] arm-virt: add secure pl061 for reset/power down
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62d.google.com
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
Cc: Maxim Uvarov <maxim.uvarov@linaro.org>, Jose.Marinho@arm.com,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 tf-a@lists.trustedfirmware.org, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: y9pULH01JmQa

On Tue, 12 Jan 2021 at 15:35, Andrew Jones <drjones@redhat.com> wrote:
>
> On Tue, Jan 12, 2021 at 05:30:58PM +0300, Maxim Uvarov wrote:
> > Add secure pl061 for reset/power down machine from
> > the secure world (Arm Trusted Firmware). Connect it
> > with gpio-pwr driver.

> > +    /* connect secure pl061 to gpio-pwr */
> > +    qdev_connect_gpio_out(pl061_dev, ATF_GPIO_POWEROFF,
> > +                          qdev_get_gpio_in_named(gpio_pwr_dev, "reset", 0));
> > +    qdev_connect_gpio_out(pl061_dev, ATF_GPIO_REBOOT,
> > +                          qdev_get_gpio_in_named(gpio_pwr_dev, "shutdown", 0));
>
> I don't know anything about secure world, but it seems odd that we don't
> need to add anything to the DTB.

We should be adding something to the DTB, yes. Look at
how create_uart() does this -- you set the 'status' and
'secure-status' properties to indicate that the device is
secure-world only.



> > +    if (vmc->no_secure_gpio) {
> > +        vms->secure_gpio = false;
> > +    }  else {
> > +        vms->secure_gpio = true;
> > +    }
>
> nit: vms->secure_gpio = !vmc->no_secure_gpio
>
> But do we even need vms->secure_gpio? Why not just do
>
>  if (vms->secure && !vmc->no_secure_gpio) {
>      create_gpio_secure(vms, secure_sysmem);
>  }
>
> in machvirt_init() ?

We're just following the same pattern as vmc->no_its/vms->its,
aren't we ?

thanks
-- PMM
