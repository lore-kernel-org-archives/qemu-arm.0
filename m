Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp557413lfc;
        Thu, 3 Sep 2020 06:58:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxOlGtl/1Jk0gtUcO3ijjhS+aS4fUkZY2cos5CSQNWXxTg1njctjjXG2RMYwABMMv05QIri
X-Received: by 2002:a25:5557:: with SMTP id j84mr2970732ybb.461.1599141524968;
        Thu, 03 Sep 2020 06:58:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599141524; cv=none;
        d=google.com; s=arc-20160816;
        b=VTr0hKpBcY415djn7az1tDws+M3kSlgKeFoHhh74qxy0vVvBivO1U2LeyMqHZeR7N6
         3BeMdtIi/RDXJ1IFZiYZAuwRKrTr7FX6wtSlenjJU4HDSY9b2aSgEP66QhUrDJqYT9HX
         H0ehPRkhFoJUWmF93Fz2/GIH/0vAPnQnw/IFR/nUD5RTqNzXDMQBOSLBYym2+Z/rTR6j
         sIm0bMiuEL9bcwvqxIzWusZWuM90ZDIMt81snzj5gQQ8KjYYxwftpNnwX/2VeENyB+wu
         0idJJ0LYqywjKEI5tCWKx5ndF/W9Sfn6zO0SrWOfISxELPMueUjTw5HliTe447obT2A2
         j4wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TVj+wlp4SSk8evA8tvPi1Miohb6m3ZMNiPPqbtxqqNs=;
        b=YhXmxGsr57d5lduPzmcD7CNtgmXGSw2TR3VdTMcz1az8Q1stcOwqo78V7hnabp/yQm
         n9xNu6Injs+2DJGLHyyANklzkQQ2HMtr2v82RLn7K34mXOJUr4QUq8w6xZ1b6z9YNDQU
         /ZHUJfG9GGwYMJCp8JMvATLiaS/cEJ1usgWuEDgre/AaIyBYLwOjiJfttOoqPUjjf4KG
         hV7+01W/b34X3dIOcG4DAbVjRCIyDcoqO/4jGbLt6SFECsMn3pM70KgTkv5n/5BERRqb
         pPGoBnbm71KWj2K9myQ7/5vHlLSxdKaA7b5rGpxr4fCSKmwvaOwSFVy8YPoM0sKBrKve
         aDew==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=FxpMQWqe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f187si3211990ybg.85.2020.09.03.06.58.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Sep 2020 06:58:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=FxpMQWqe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kDplE-0000u0-Aw
	for alex.bennee@linaro.org; Thu, 03 Sep 2020 09:58:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kDpl4-0000tT-0S
 for qemu-arm@nongnu.org; Thu, 03 Sep 2020 09:58:34 -0400
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644]:43120)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kDpl1-0003Hd-PW
 for qemu-arm@nongnu.org; Thu, 03 Sep 2020 09:58:33 -0400
Received: by mail-ej1-x644.google.com with SMTP id m22so3982149eje.10
 for <qemu-arm@nongnu.org>; Thu, 03 Sep 2020 06:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TVj+wlp4SSk8evA8tvPi1Miohb6m3ZMNiPPqbtxqqNs=;
 b=FxpMQWqeXLbuho45qTZrscwj5KNo28ve+0ZyoKsOBd3SoEngGNPIyBrQ7njg/BpwIF
 b53vEDNEMjCwJqzwth/GE8M8gf7Uo8wN/mzZI9nqNRHL/plhcm5vVkSUlmX+2XFa1gpq
 pbwMpssGzIIC6fMRyP/uzY9d+ted2dod2Q6oSY3jy7hfridaJUQHEwX5yNOPnlLSLMfL
 GouqkbXeTLNtYcxaMPXGtEyQxOEAfVJnKv5kQSUr4I16cfH3v4SvqvafVqAZTqBYVSpP
 BjUiwYF8QDZufXEti1k216qI6ot9lOojJLlY6CizFwF6ukGWtVMVp9GgOzDw1Z5SyR6A
 A9fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TVj+wlp4SSk8evA8tvPi1Miohb6m3ZMNiPPqbtxqqNs=;
 b=Be2XcITiKDIVsaP4CfoBs24Kq9vhSR+wLuoJY3z1/zmRPV+FgggSMKz3fYbJzEb5Cx
 kYXd8EfLb/FJTmgCougC8Fkvf86TGqoRbFavgRofxngBHOmhJ1T3sqctht1ssrjNLxqp
 DlIyIve+7jkbKZlFQKCg2YLEZA3LH0EzKJcqZA/YNBvIfSe7XMc0m0co6j8RUPkLFYhE
 zWJHvhD9vU0IBh4pTbLu8TQYYvmGB8kg7p3QNsnCCKJvO78bjRTeLdRjM7BI4rrnGDYu
 89/8J7pdxZ2wcdjWMkd7U9PbImRPHEbELjbE9YxVLVHs3rm4rBULIvsSPYzqtP0vP0Z+
 VtCw==
X-Gm-Message-State: AOAM531S67n3aGelgNJhsjD3aMovaQJe2aInCD9YAIAfEv02ZQpe+UI4
 I72j6nFVasNt9JTs6vmL8eJzypEleMG5TXqtXE1j5A==
X-Received: by 2002:a17:906:d8ca:: with SMTP id
 re10mr2229877ejb.382.1599141510098; 
 Thu, 03 Sep 2020 06:58:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200903110831.353476-1-philmd@redhat.com>
 <658fdd16-33da-af3a-6d8d-f7ea1253f061@redhat.com>
In-Reply-To: <658fdd16-33da-af3a-6d8d-f7ea1253f061@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Sep 2020 14:58:19 +0100
Message-ID: <CAFEAcA8aOzq8UQwKiyuvJokBT9ui6JWxzf=T8=r13Vuu6+_kkQ@mail.gmail.com>
Subject: Re: [RFC PATCH 00/12] hw: Forbid DMA write accesses to MMIO regions
To: Laszlo Ersek <lersek@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::644;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x644.google.com
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
 Qemu-block <qemu-block@nongnu.org>, Li Qiang <liq3ea@163.com>,
 "Emilio G . Cota" <cota@braap.org>, Peter Chubb <peter.chubb@nicta.com.au>,
 Joel Stanley <joel@jms.id.au>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <rth@twiddle.net>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Robert Foley <robert.foley@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>, Eric Auger <eric.auger@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, Jan Kiszka <jan.kiszka@web.de>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Tony Nguyen <tony.nguyen@bt.com>,
 Prasad J Pandit <pjp@fedoraproject.org>, Alexander Bulekov <alxndr@bu.edu>,
 Andrew Jeffery <andrew@aj.id.au>, Klaus Jensen <k.jensen@samsung.com>,
 Emanuele Giuseppe Esposito <e.emanuelegiuseppe@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-ppc <qemu-ppc@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7bZZecZbhIcH

On Thu, 3 Sep 2020 at 14:37, Laszlo Ersek <lersek@redhat.com> wrote:
> Peter mentions an approach at the end of
> <https://bugs.launchpad.net/qemu/+bug/1886362/comments/5> that I believe
> to understand, but -- according to him -- it seems too much work.

It also would only be effective for MMIO, not for qemu_irq lines...

> I don't think such chains work unto arbitrary depths on physical
> hardware either.

Real hardware by and large doesn't get designed with this kind
of DMA-to-self as a consideration either, but unfortunately it's
not really very useful as a model to base QEMU's behaviour on:

 (1) real hardware is usually massively parallel, so the logic
  that handles incoming MMIO is decoupled anyway from logic
  that does outgoing DMA. (Arguably the "do all DMA in a
  bottom-half" idea is kind of following the hardware design.)
  Similarly simple "raise this outbound signal" logic just
  works as an instantaneous action that causes the device on
  the other end to change its state/do something parallel,
  whereas for QEMU we need to actually call some code in the
  device on the other end and so we serialize this stuff,
  sandwiching a bit of "device B code" in the middle of a
  run of "device A code". So a lot more of this stuff "just
  happens to work" on h/w than we get with QEMU.
 (2) if software running on real h/w does do something silly with
  programming a device to DMA to itself then the worst case is
  generally that they manage to wedge that device (or the whole
  machine, if you're really unlucky), in which case the response
  is "don't do that then". There isn't the same "guest code
  can escape the VM" security boundary that QEMU needs to guard
  against [*].

[*] I do wonder about hardware-device-passthrough setups; I
don't think I would care to pass through an arbitrary device
to an untrusted guest...

thanks
-- PMM
