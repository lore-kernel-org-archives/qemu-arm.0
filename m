Received: by 2002:ac2:5485:0:0:0:0:0 with SMTP id t5csp1968765lfk;
        Tue, 6 Jul 2021 02:22:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz4tBIHoyCChjikSAo6zJZilBpiL+vJvIlFzxoGXYKjhrkdmB9Wx+quQx+GAerbDg1QqpL8
X-Received: by 2002:a1f:a00d:: with SMTP id j13mr7683624vke.18.1625563350436;
        Tue, 06 Jul 2021 02:22:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1625563350; cv=none;
        d=google.com; s=arc-20160816;
        b=U97aLws+YQAUTjhJTPJGG+cmOGaMeKCmllq34XdgfLj/ITPy7AkH/ShOoNis0bJ6qb
         2lUV8OJIReIT0w6MtfOk/tQxyej4MenYlvIjFmgIx+MDbijsHVtDLwpoDWN24697lzXf
         tG+ceQfh9lt8CdpQO8GDN8vr6CfpT7IqIoWLJhqLx8+hMGZgdOofKsDRNDc/6yCdE4k7
         NZmncbJVzm/18H6ssn6XwbYQj8zlGtxHaSya3UVZ71AfnEFsHkfU3nn4ZSBufbyNnqcW
         dIX5/lu2K2yd5lGeG3YRo9qBwo8xsqJiIkuUkQsOENbJtGs0z2zj6yqAjy9kqhXD3MZ2
         70ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=j8utvUwGmnSj4i0ZNghCpjrtWVvYQiBM5G3dLKA3ykk=;
        b=dF7MzWe9rMVoSSG66QKj85pfz5JMI8q4dtXaMOP1rFcZmQ6exK+k/ncs+B35NuVal5
         /S1bxY/sTZW1vE3d/JGQH8PQVJCZhdzMc8Zm4P3sibz1/+H7+w5w2KTEbVWWPiz6km8J
         /TtzYcfvBMFjTB2ODxwDvJGPcPjH1iKeImk0dGuxg3k+BgevqJ9PEh8TQkhd7QUx7sMx
         sF8ZecqJIcaEmKekw+XJlma2pQ+AJ1izBg+Iu1bT761Sfji6Ho+IgOMZ2DgHMAS4dOPV
         EMb5QCQt7wYm3UJKbfGMwBH6PsX73HqzEcrVbCHW7OWVil7m8laG0aBeykSd16XkWF2b
         51DQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=TwgZ9V3C;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c6si10191075uar.74.2021.07.06.02.22.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Jul 2021 02:22:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=TwgZ9V3C;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m0hHh-00066I-OX
	for alex.bennee@linaro.org; Tue, 06 Jul 2021 05:22:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m0hFd-0004Ny-61
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 05:20:21 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:35464)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m0hFa-0007BW-8g
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 05:20:20 -0400
Received: by mail-ej1-x62b.google.com with SMTP id gn32so33140219ejc.2
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 02:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=j8utvUwGmnSj4i0ZNghCpjrtWVvYQiBM5G3dLKA3ykk=;
 b=TwgZ9V3CxKaK66UCIpKjanNEn389PncQ0xG9Anzox/WetZT3ALZA1NKyjAWKHmTtPc
 o19Y2W7Bhyz4xF6dS/7gjdrQUQtBo7hBj0nEQwjOYGkdQhZnhi9vYE/PCjOkuG817BBu
 Zqw4HGwjJmLMbnDkVJctBfbANFDnqoafKaC+U0Q5cm3gCMqGDSlJnJOnb0f0qvEfAEa4
 YY695X79XpeBrdTRC3TPdUZoZAGoWJQYoBCcMBrBt9pyeuCDUK6G+SZeGHGlP00DEBsR
 qo3aXQzJ92Ewll95aSwFklIem40YUZfkQLwbPwb2rJ1vgYvkjEMm5M2IriC5MMLBbDpN
 BE+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=j8utvUwGmnSj4i0ZNghCpjrtWVvYQiBM5G3dLKA3ykk=;
 b=rI5ikoYhoI5SriLihXVCIxnTrbr84grawUqyIK2MTwBnjYeVKSJzscwVE2ftxZ1d2s
 NjOsLVFgJtR9xDoChpm6FB4N/xecb68caZsCJ4PL6A9D0A2f7h/9YYuJ/P6ZmY3CRaWB
 IT1xoVUbaAmOM9horpQy0BkyANMRYSsGG/cBNpyI0swyCkaz7Xzkr3AQHFjfMdzS3H1A
 1zoxd58xuU5MXgcyFDTe8gVpzH73k76LeGIS3QAE1O7xh78v06ulQefeWNLM45tZ1S92
 a/cxfjqRZhvtKHGKg5iZ48K7KMZ9USUp7X8AidOg65Fic7Atu2MBKUoes5FG0dYYmopr
 CQ9A==
X-Gm-Message-State: AOAM533IHYHOZ7FN4MA4hgVrKZhJGDfJbLsIGi4c0WpXBod2A57n5WxZ
 DmlfsvxoWGJSDS+vegH91lS0halOqVMjXUtQrNFuug==
X-Received: by 2002:a17:907:3e02:: with SMTP id
 hp2mr17384935ejc.4.1625563215570; 
 Tue, 06 Jul 2021 02:20:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210630153156.9421-1-shashi.mallela@linaro.org>
 <20210630153156.9421-5-shashi.mallela@linaro.org>
 <CAFEAcA-ZeKEMTp5X0VWXu+hip9ryzQLTLNwd_bsKQybyT_k7CQ@mail.gmail.com>
 <bbb32d79ed60fb90128b3662ec925f60ca258e8a.camel@linaro.org>
 <287eb50c0b99a3daec986ec29ede33cb2bdfd025.camel@linaro.org>
In-Reply-To: <287eb50c0b99a3daec986ec29ede33cb2bdfd025.camel@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 6 Jul 2021 10:19:37 +0100
Message-ID: <CAFEAcA-xC_v2z=QaD=_dkFWx2Hr+UFd0h_YTtSi6MNPhk6-Sbg@mail.gmail.com>
Subject: Re: [PATCH v5 04/10] hw/intc: GICv3 ITS Command processing
To: Shashi Mallela <shashi.mallela@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Radoslaw Biernacki <rad@semihalf.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Igor Mammedov <imammedo@redhat.com>,
 Leif Lindholm <leif@nuviainc.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tZKPjD/r9rBI

On Tue, 6 Jul 2021 at 04:25, <shashi.mallela@linaro.org> wrote:
>
> On Mon, 2021-07-05 at 20:47 -0400, shashi.mallela@linaro.org wrote:
> > On Mon, 2021-07-05 at 15:54 +0100, Peter Maydell wrote:
> > > I missed this the first time around, but I don't think this is
> > > right.
> > > Different CPUs could have different GICR_PROPBASER values, so
> > > checking
> > > against just one of them is wrong. The pseudocode only tests
> > > LPIOutOfRange()
> > > which is documented as testing "larger than GICD_TYPER.IDbits or
> > > not
> > > in
> > > the LPI range and not 1023". So I don't think we should be looking
> > > at the GICR_PROPBASER field here.
> > >
> > > More generally, "s->gicv3->cpu->something" is usually going to be
> > > wrong, because it is implicitly looking at CPU 0; often either
> > > there
> > > should be something else telling is which CPU to use (as in
> > > &s->gicv3->cpu[rdbase] where the CTE told us which redistributor),
> > > or we might need to operate on all CPUs/redistributors. The only
> > > exception is where we can guarantee that all the CPUs are the same
> > > (eg when looking at GICR_TYPER.PLPIS.)

> Please ignore my last comment.
>
> To address this scenario,i think the feasible option would be to call
> get_cte() to get the rdbase corresponding to icid value passed to mapti
> command.Since each icid is mapped to a rdbase(by virtue of calling MAPC
> command),if the collection table has a valid mapping for this icid we
> continue processing this MAPTI command using &s->gicv3->cpu[rdbase]
> applicable propbaser value to validate idbits, else return without
> further processing.

But the pseudocode for MAPTI does not say anywhere that we should
be checking the pIntID against any CPU's GICR_PROPBASER field.
It is checked only by the checks in LPIOutOfRange(), which tests:
 * is it larger than permitted by GICD_TYPER.IDbits
 * is it not in the LPI range and not 1023

Checking whether the intID is too big and would cause us to index
off the end of the redistributor's configuration table should be done
later, only when the ITS actually sends the interrupt to a particular
redistributor, I think.

(You can't rely on the guest having done the MAPC before the MAPTI;
and in any case the guest could choose to do a MAPC to a different
redistributor after it's done the MAPTI.)

thanks
-- PMM
