Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp1428563lfq;
        Fri, 25 Sep 2020 09:49:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw8Gz/yRo+iBkHg6F+O3kGmkFZBK6x7i503grrDSagjuXoNMtMKR2DVWU3VLHm1LDPQ3BRZ
X-Received: by 2002:a25:1842:: with SMTP id 63mr142871yby.388.1601052580423;
        Fri, 25 Sep 2020 09:49:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601052580; cv=none;
        d=google.com; s=arc-20160816;
        b=ClsAVPTd6S5rnwDKX2ZiVpwmAGqWbM9IRdYQANyTImBAn74zskkUYuRxauvUZbsaGA
         9f84RDot3J5J2x4e/1W8ce3D7gWdS86LHYq/kx4Qf0X31ofxwNxEjlMYy4PUlmdRdxsz
         yZnCRYcOdBTLBPX1MdYqi9VxFI6tu+ibdt6g93pK3CGUSus+V7Yd7Zy5A+IdwTwQyrlf
         8DPvx6DpGVfp7TfVbhs3XrexhVLvi7OW+t9i+iQu48BQW18X4pvVwltsOEC0f2lPmTVH
         vrQAhbYUZCVdUgSmyw61Tkadr1AysCthnBgLI6RRiSZ+96UAw1oUVXf+l4PxRBNguFLJ
         EF5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ag83vk6ye0YhBEu12BqOdco3gPPZmZOOrR5pn3ynU6Q=;
        b=BNuMj01meDWgw1IDxKYbHPP3r6fhLItQaLqwiQrZeBBmSigd/mnfVmvz073gS54eCG
         +4ycUbSG5R9GHwDM2vC5sn0PNYzsfYwvjOBnUoDAl0U9KHM3IFm8zABVEHhWq18w7XF0
         Mhz7Bz/dL6eusa3ghHqsxnNPbXmPraXVYc9HFlAF4QmBniyH6UnbqUw9kNmaO76ILUgA
         b1+SRvlKmOYXDr7Ls0HUhKxDxE+T1E6wqSX0/7VFv8+j0Ka3FsGGNmGzLZFWDjZx23gp
         l2wXH6Lrt0B55Uar60NvOTHm4W/QIP4LGPBsCIDW7aJ/YhHZjHlm0jQP0hOquaJ6c7GE
         pzvA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=WlMUYxAN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o84si3333537yba.197.2020.09.25.09.49.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 25 Sep 2020 09:49:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=WlMUYxAN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kLquh-0002dn-QW
	for alex.bennee@linaro.org; Fri, 25 Sep 2020 12:49:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kLqsz-0001AU-2d
 for qemu-arm@nongnu.org; Fri, 25 Sep 2020 12:47:53 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:33727)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kLqsx-000208-Bt
 for qemu-arm@nongnu.org; Fri, 25 Sep 2020 12:47:52 -0400
Received: by mail-ed1-x535.google.com with SMTP id g4so3185438edk.0
 for <qemu-arm@nongnu.org>; Fri, 25 Sep 2020 09:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ag83vk6ye0YhBEu12BqOdco3gPPZmZOOrR5pn3ynU6Q=;
 b=WlMUYxANBuvAfi8dHB9IPxm6xLSMBMWNklpy9LKzEc4zpK7eSBav1vcnOq3UDgvw7W
 QGaYeqvvaasMDe3NBUB/xmvuUWuJo9/JWBtf80en2gQKCgzt+RIsB+6odDpqcH/gN4X9
 c/u+HzTKU4b3WOBEtkxmzGh4ohFSkXWSJrbLgZV9QLYX28rD9/Kgizi6ZcbqnxSzOznx
 +WYS/tM3JFQXEPHGcjvOD8/DiY6ignGCSj1qGCF0jftA2K0PKe4vzcqFkplFGAgOXrrc
 drjN1OVj33o6Q+hOfP4FPUV2U9XVNDl0QDvY6zOqIN2q2KHbDldMhlxzlzviiv0YVCc3
 hngg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ag83vk6ye0YhBEu12BqOdco3gPPZmZOOrR5pn3ynU6Q=;
 b=RCTdzdzOmkzcbkMaNBTVQwP/qh+bkNxYlDAEbCL/va7yF8w40aFMVjlJa7gCQ5EtUB
 byV/7VgLX81W89FD3GdsV4WBdaBnpi+Clkd5rqiAtvasbbkznRvQjlig+J096qILF/Lu
 0ikBzP55AVbGicfdT0vKNZkRFM2DPmZTb/NelGN9+i3Wh8GRXBw1Vr+50fRUsk69Kjcy
 helEas2xfC7BJt/gguxz/iq2Vj5OOM7UQRLHAdUp5Y4WRsGBc2Ia/CUOMhoU5YLGo2kp
 pkwb0TROty8LsLQ05tYVfSzEFL4EM8kHBaF/lWn7ZtaDNpVkH/C9oOIBWeM9OcxWRhtk
 Flgg==
X-Gm-Message-State: AOAM531AHDfI8ivqsYg48quWodrOkV/uSzX51m5MiWmYT3uQjOh649F1
 jlTffObJ+ULQR6g8vgifbuYymGY9UDt4B9N4mYh/Ow==
X-Received: by 2002:a05:6402:202a:: with SMTP id
 ay10mr2351379edb.36.1601052469596; 
 Fri, 25 Sep 2020 09:47:49 -0700 (PDT)
MIME-Version: 1.0
References: <CAC41xo2yEoDvy15yExroY+ZX+qQns_rxQiqP9D2Xo3dqquP7KA@mail.gmail.com>
 <CAFEAcA-gMfOntN=up20vjF00Mbf0MOeWyTWufmcZ9E=AKKYWEw@mail.gmail.com>
 <CAC41xo0mWv4LoHbzvxkq+vhw=kn8iyi2vhgZhv4vxODmJcnngQ@mail.gmail.com>
 <1bfa78a6-b478-118f-c284-466dcddde468@amsat.org>
 <CAFEAcA8OhKmg5R=h4E4qO_RwPGbP50p711j_zjoSY-fhjeMAjA@mail.gmail.com>
 <CAC41xo1cOxgM5bR9G6O72QRgAcPMEA_tCje0=HZ73vGhD22hQg@mail.gmail.com>
In-Reply-To: <CAC41xo1cOxgM5bR9G6O72QRgAcPMEA_tCje0=HZ73vGhD22hQg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 25 Sep 2020 17:47:38 +0100
Message-ID: <CAFEAcA__RSrAhxWe8P5JkJwh3p8-w1MiNOjgCf_D323mxns5UA@mail.gmail.com>
Subject: Re: gicv3 maintenance interrupt not triggering
To: Jose Martins <josemartins90@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HtgYpavLZpxg

On Wed, 23 Sep 2020 at 16:55, Jose Martins <josemartins90@gmail.com> wrote:
> I've tried to debug the issue this morning but I've hit a wall.
>
> As I said in the previous email, the issue seems to be due to the fact
> that cs->maintenance_irq is not initialized correctly and therefore
> the call to qemu_set_irq for the maintenance interrupt in
> gicv3_cpuif_virt_update has no effect. When this variable is
> initialized in gicv3_init_cpuif using
> cpu->gicv3_maintenance_interrupt, the latter was also not initialized
> yet. From what I could understand this initialization is only achieved
> in the call to qdev_connect_gpio_out_named which is only made later in
> virt's create_gic function (using gdb I was able to figure out the
> call to gicv3_init_cpuif is somewhere in the call graph of
> sysbus_realize_and_unref for gicbusdev made earlier in create_gic).

Yeah, the IRQ lines are (supposed to be) wired up by the board code.
It shouldn't matter which way round the connections are done...

> I've tried a naive fix by changing the order of these initializations
> in create_gic but this crashes qemu immediately. Given my limited
> knowledge of qemu internals, I'm not able to figure out how to fix
> this.
>
> I'm not sure if this analysis is correct but would appreciate further
> guidance on how to resolve this.

Do you have a test case binary/command line I can use to repro?

(Linux does work with the GICv3 emulation as far as I'm aware;
maybe it handles maintenance interrupts in a different way
to your guest code.)

thanks
-- PMM
