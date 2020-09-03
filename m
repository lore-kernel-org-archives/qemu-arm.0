Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp580552lfc;
        Thu, 3 Sep 2020 07:24:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx3q7lu3H7xgMbkeC1fB4twziyC+GANNjn1Mdw7s81FWkXW2wW68glLgBU5diMDvmB07opz
X-Received: by 2002:a25:8b89:: with SMTP id j9mr3129588ybl.31.1599143066655;
        Thu, 03 Sep 2020 07:24:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599143066; cv=none;
        d=google.com; s=arc-20160816;
        b=FU59vTnm2oKTuVY9PHd01OtZWKIOQbWuI//q9nYmc42thQUtrvP/oZK8OFS3UQpdZC
         2gQ5UkpeWODeIeOQI2eylUoLxqiYQIovnZfWYZYUcKSxBHpBJWlvXo8KnX34V+VLThod
         Uu7/ZgZ0F0wJEIXvK9DSPZ/Plf+KMRqxp60bdpJGYZBynvTuuQql9e5QBOZt2hL6IlzA
         qBofqzjeH7bCae4jNQ0vvlIk1Uq4ya/fuXTqJfLu+VT9rCVv5XLt55XSzQICpB9Iry3d
         bS1tkBki9XjGoAYRWycSnFsOA0T+MdnDy8mgAQinaOT19YEgnY+A+6OmJZXtVIi7Kp+F
         1fbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=1Pxtu2TSawMuPOEKskQiWWu2+rEYKtX4Wt8sb23KmNs=;
        b=U7uz2XtLvzVJ8P8eK1Ms6Hat8Ep01Eag6U9qUzU1kwUeuMeS3b0x3VezIyJDTP9vMe
         WO3I2YQu0+joOPo7iLcNi1N9cA55elE1kiWRIpdjQXdSGAy/Lylu4PyRdpp5tcRELIe5
         /4EjFvEAmP6HdK8xECZ0x5nbAKPd5+JKCOu2EueK+lWXOVxBGiruNInhjcvX+9k9SmNS
         2Pbyfv3Fi88NbArWAs/XPe/SSAjkfXtTy/o5I0x0/CNB2XgHs3KNWOXMDRQfFWyJU485
         3nkC2ItelU0vlA54ToFbZY60rBtWct4XSTadX9cfxZeWdCmYZkJab8/RD9s53cTQ1oFP
         b4HA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=B0VhFD5r;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l186si3769111ybc.441.2020.09.03.07.24.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Sep 2020 07:24:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=B0VhFD5r;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:37076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kDqA5-00049Z-Vm
	for alex.bennee@linaro.org; Thu, 03 Sep 2020 10:24:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1kDq9x-000493-Km; Thu, 03 Sep 2020 10:24:17 -0400
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242]:42217)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1kDq9v-0007Dr-MG; Thu, 03 Sep 2020 10:24:17 -0400
Received: by mail-lj1-x242.google.com with SMTP id k25so3909848ljg.9;
 Thu, 03 Sep 2020 07:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=1Pxtu2TSawMuPOEKskQiWWu2+rEYKtX4Wt8sb23KmNs=;
 b=B0VhFD5rvL278QYwv1PAM54Nljg7nwMnD+vW5QETtSJIbvUre//dJHnyZjx7OGUCLH
 BiltzmNJFnImRHm+jzTje06vr5lthl+LnCjdykhFbQo+YHQeJejsHjZZScizFD7HDwlg
 sOagTlG+rK/suT33MFljV61Dhe+CoiAf/y65fScnKw4wY45lOzIbQK9Auru9T2vK2JEx
 coZe5tavqwfaBMguKkcAI084wRMcpFr8BSQ5Xc9i4BRpIZSijXoAX8uaMZn4g1hIB+wp
 d5dtot6DFGOZ5tXqw4rWh/O/R67PNvimU6VANTFGyOkQzFC18uxc5pPi8YSOeVeRvA9m
 g2ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1Pxtu2TSawMuPOEKskQiWWu2+rEYKtX4Wt8sb23KmNs=;
 b=HML+VaioaXDULFrO6+H/TeMiycFqOQdKs/aFCSFhd/i1fNdIHHsCphYpJAqg4/4wn/
 By/IKdhtjOTtr2MjxGulLb1e9fVIYpdZ2AByuRsjZjn5U3RfYqc34CSnNA7ZzDoNYUIb
 r0J+FbsxVbJS090+Ft1XiQAnm91Zjp4LBXiIOdnmuQWKY9E0z7YelvoMIaqt0UwNPzHB
 +POJqcAbDs9g2UV+oJ9QXIv5suVauHASjtDbji6HEA7TME2pnoJ6UJVnEjYeHPvDCPwl
 7iQdN2FGVRYo/39BHVNPObbukXsmb03NiQiE2+zbCuq0eMr+Q3RJiznkQ1iNoN7YKFmo
 KgIg==
X-Gm-Message-State: AOAM531BBj0cl2wWBStVY6ZX+ANQ+anBGYgP0QNky2Jdx2KmeLChGebi
 3S/+7CqBNeeCvny92RmpWgA=
X-Received: by 2002:a2e:3a19:: with SMTP id h25mr1379166lja.398.1599143052266; 
 Thu, 03 Sep 2020 07:24:12 -0700 (PDT)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id 25sm630112lji.130.2020.09.03.07.24.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Sep 2020 07:24:11 -0700 (PDT)
Date: Thu, 3 Sep 2020 16:24:10 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [RFC PATCH 00/12] hw: Forbid DMA write accesses to MMIO regions
Message-ID: <20200903142410.GX2954729@toto>
References: <20200903110831.353476-1-philmd@redhat.com>
 <658fdd16-33da-af3a-6d8d-f7ea1253f061@redhat.com>
 <CAFEAcA8aOzq8UQwKiyuvJokBT9ui6JWxzf=T8=r13Vuu6+_kkQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA8aOzq8UQwKiyuvJokBT9ui6JWxzf=T8=r13Vuu6+_kkQ@mail.gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::242;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lj1-x242.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Robert Foley <robert.foley@linaro.org>,
 "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
 Qemu-block <qemu-block@nongnu.org>, Li Qiang <liq3ea@163.com>,
 Laszlo Ersek <lersek@redhat.com>, "Emilio G . Cota" <cota@braap.org>,
 Peter Chubb <peter.chubb@nicta.com.au>, Joel Stanley <joel@jms.id.au>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <rth@twiddle.net>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>, Eric Auger <eric.auger@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, Jan Kiszka <jan.kiszka@web.de>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Tony Nguyen <tony.nguyen@bt.com>,
 Prasad J Pandit <pjp@fedoraproject.org>, Alexander Bulekov <alxndr@bu.edu>,
 Andrew Jeffery <andrew@aj.id.au>, Klaus Jensen <k.jensen@samsung.com>,
 Emanuele Giuseppe Esposito <e.emanuelegiuseppe@gmail.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-ppc <qemu-ppc@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FOHAzKSvPnL8

On Thu, Sep 03, 2020 at 02:58:19PM +0100, Peter Maydell wrote:
> On Thu, 3 Sep 2020 at 14:37, Laszlo Ersek <lersek@redhat.com> wrote:
> > Peter mentions an approach at the end of
> > <https://bugs.launchpad.net/qemu/+bug/1886362/comments/5> that I believe
> > to understand, but -- according to him -- it seems too much work.
> 
> It also would only be effective for MMIO, not for qemu_irq lines...
> 
> > I don't think such chains work unto arbitrary depths on physical
> > hardware either.
> 
> Real hardware by and large doesn't get designed with this kind
> of DMA-to-self as a consideration either, but unfortunately it's
> not really very useful as a model to base QEMU's behaviour on:
> 
>  (1) real hardware is usually massively parallel, so the logic
>   that handles incoming MMIO is decoupled anyway from logic
>   that does outgoing DMA. (Arguably the "do all DMA in a
>   bottom-half" idea is kind of following the hardware design.)
>   Similarly simple "raise this outbound signal" logic just
>   works as an instantaneous action that causes the device on
>   the other end to change its state/do something parallel,
>   whereas for QEMU we need to actually call some code in the
>   device on the other end and so we serialize this stuff,
>   sandwiching a bit of "device B code" in the middle of a
>   run of "device A code". So a lot more of this stuff "just
>   happens to work" on h/w than we get with QEMU.
>  (2) if software running on real h/w does do something silly with
>   programming a device to DMA to itself then the worst case is
>   generally that they manage to wedge that device (or the whole
>   machine, if you're really unlucky), in which case the response
>   is "don't do that then". There isn't the same "guest code
>   can escape the VM" security boundary that QEMU needs to guard
>   against [*].
> 
> [*] I do wonder about hardware-device-passthrough setups; I
> don't think I would care to pass through an arbitrary device
> to an untrusted guest...

Hmm, I guess it would make sense to have a configurable option in KVM
to isolate passthrough devices so they only can DMA to guest RAM...

Cheers,
Edgar
