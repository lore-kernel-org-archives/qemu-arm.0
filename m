Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp1577032lfq;
        Fri, 2 Oct 2020 07:06:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzzspdi9tOtDL4/HElhsjw6NzQxLAZgAuxTL1iJticLzSn0aV8w4fyqcbRF6+ucWmuyCDoW
X-Received: by 2002:ab0:71cb:: with SMTP id n11mr1068257uao.4.1601647590480;
        Fri, 02 Oct 2020 07:06:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601647590; cv=none;
        d=google.com; s=arc-20160816;
        b=d/MmOtUWGxGcyfoArdyTdwb7id3jKsuHZQlYGVP43UQ5k7PxiTN2bdrrtnI0vQpTtk
         93X+UfmUPK2o+2/LWC8Ml2vos3vAhre9AYWeoScP0l/u3ABuaGyzQ4XF8Cw3FN66suqL
         Wf7k0ACyiWkd/6f8mXl+mSQ+vAGN0Qspyxbk6VLY5f4wu44BrzeLJ5GeJJbiO58p7kTM
         3fVu489JDU+GU1qYHVWlg3VA4BtXjs0n3ApWqOedcjOdZpoaSnMT7Q4nJrm9Vk59jCPG
         AcTo/G3rg+l6cJ1KDaQq/1wCBNvSafKXLl7TgL8cNe6z9K9IVeh0x/VzKPCBO+SVtAB2
         0wKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZiZGpOz0igLCK49f4SgGqroASsXYSEsr3M9TqW+MP0o=;
        b=Frt41km2dADUbPSkCUWWPlKPcSJduTBzYbUa4yR/uffBsMdFr5kKyGB8FC2+hwBB3y
         pck4TajaqOSb7f2+1hsyA1HOPz6CR6uxk/qM2bVA2fWBEb8pokWjHSyKzun0Isz5DVGK
         fqKu0exWSKEQi4Yv2bDMo4GULiwLC3GBeetCt7Fu+wQO+xSuO3I0EjqioCJXhsCSoECU
         wY2m2SWZYugl37ZSN8Y4olax24NXrrzypXEYUlZC3sp3jmQgDhVyIJG5tmCLvP6+SDGy
         YtyjLlQQxdAoseIYAXNc/xyPHd2jUnvf2wfzWTvH9S4ZZ9oDuGNHwYLtDVopSQwdOO4Z
         VzAA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=WbbHMyGJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f12si227996ual.34.2020.10.02.07.06.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 02 Oct 2020 07:06:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=WbbHMyGJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kOLhd-0007wI-Q4
	for alex.bennee@linaro.org; Fri, 02 Oct 2020 10:06:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maxim.uvarov@linaro.org>)
 id 1kOLhW-0007w9-GD
 for qemu-arm@nongnu.org; Fri, 02 Oct 2020 10:06:22 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:40355)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <maxim.uvarov@linaro.org>)
 id 1kOLhU-0000Eu-9M
 for qemu-arm@nongnu.org; Fri, 02 Oct 2020 10:06:22 -0400
Received: by mail-pf1-x441.google.com with SMTP id w21so1298197pfc.7
 for <qemu-arm@nongnu.org>; Fri, 02 Oct 2020 07:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZiZGpOz0igLCK49f4SgGqroASsXYSEsr3M9TqW+MP0o=;
 b=WbbHMyGJ9vtz/1R/DQAl0Hpa5fwv67SlCcTGxpW8jk6cKx+3ym2VLzERfZMOeE8XUX
 xfhluRXs1NhlKIuOiVg1i1dDqgtrHO4Iy0FbFzbyI3mObq9LGl4Xpk293ROwNZfel+Zs
 l/ANJQju8GBreMVnvxe2HGqff/kwaJ4YxWHnB8eays1eqx9UlYMZtFJW59kVyte7P1uw
 AVN+cXiOiTolWl4oU7YIeud34WSHLCYlOPws0RmfrGwHUPnWC7kZDmrDL7Of9MckfbsY
 ZZya7qM8NIVXEJZKsy9/I8npyz9SVZnMTFe1qTlfI9A10PUjq4OK2fjxUNqA9CFRi4kw
 Ksqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZiZGpOz0igLCK49f4SgGqroASsXYSEsr3M9TqW+MP0o=;
 b=Pe/C5hE1c0l+rHSbl0wlOS5JLw4+uOgbtgYlaYc5AqGJ+3oiCzrIrkg/bEiuBu8nMe
 xCPK/4nVc2W58xa3jwDiD6GsVy7RKIrUn2Ullwu0J8TsySbCIFQzROaRHcZVYirNX+Et
 BP6+CQ4TrjtKx7mzJUHgGYkBJIzp1dmxl5wZFZ49PbB6hO45UNO9dUkn0k0nXSZTibWz
 VA9/I5BKXICnM4cRhsg8N5oz0C0SFkIo/aha4FpLhnjqHVJtu0EjpyFOQ2Y3AFb8C4ks
 Q4MFSm3kLRFdSrHVVQ8FZrJY2r0FSjgTjawgzqCwDeOGUmJ6kLzhJLEf6EAHazA05e5M
 3LOw==
X-Gm-Message-State: AOAM532N/G4JcfZ2jrL3kVDpRdR8v3nOG9wiEYryLSxVInDXwY7SvBIZ
 AYH3BkjQQNcFR072mm9el+UCHD5xMf18vTDkXscQ2w==
X-Received: by 2002:a62:6c2:0:b029:142:2501:397c with SMTP id
 185-20020a6206c20000b02901422501397cmr2876618pfg.65.1601647578563; Fri, 02
 Oct 2020 07:06:18 -0700 (PDT)
MIME-Version: 1.0
References: <20201001193659.21685-1-maxim.uvarov@linaro.org>
 <CAFEAcA_76y5DoNw3tirFFaC9FfE6NnxwAkdgV5eSv9NUeBxdhw@mail.gmail.com>
In-Reply-To: <CAFEAcA_76y5DoNw3tirFFaC9FfE6NnxwAkdgV5eSv9NUeBxdhw@mail.gmail.com>
From: Maxim Uvarov <maxim.uvarov@linaro.org>
Date: Fri, 2 Oct 2020 17:06:07 +0300
Message-ID: <CAD8XO3ZWW87Ze+gX9xWtrZ=XaETvE63WqzobQamoGM2_tb-4Zw@mail.gmail.com>
Subject: Re: [PATCH] hw: wdt: implement sbsa watchdog
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::441;
 envelope-from=maxim.uvarov@linaro.org; helo=mail-pf1-x441.google.com
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
Cc: Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 =?UTF-8?Q?Fran=C3=A7ois_Ozog?= <francois.ozog@linaro.org>,
 Shashi Mallela <shashi.mallela@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UOG6n5FWu+jI

On Thu, 1 Oct 2020 at 23:36, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Thu, 1 Oct 2020 at 20:37, Maxim Uvarov <maxim.uvarov@linaro.org> wrote:
> >
> > Initial virtual driver matching linux kernel sbsa_gwdt
> > driver. Driver implements basic functionality and makes
> > watchdog works on virtual machine and allows to reboot
> > secure OS. I.e. atf->optee->efi/uboot->kernel. More
> > information about that device can be found under:
> > ARM DEN0029B - Server Base System Architecture (SBSA)
> >
> > Signed-off-by: Maxim Uvarov <maxim.uvarov@linaro.org>
>
> Hi; what's the relationship between this SBSA watchdog
> device model and the one that Shashi posted recently?
> https://patchew.org/QEMU/20200929180410.33058-1-shashi.mallela@linaro.org/
>
> thanks
> -- PMM

Nice it's the same driver written a little bit differently. I did not
see his patch before. 2 things missing in Sashis driver which are
useful for me:
1. Add sbsa watchdog to machine virt also. That helped me to reboot a
virtual machine with secure payload.
2. I specially did not disable timer on driver close. I.e. "reboot"
linux path reboots with that watchdog.  And make timeout lower to not
wait for a long period.

Can this driver also be considered for virt machine?

Regards,
Maxim.
