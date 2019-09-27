Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp3548916wrp;
        Fri, 27 Sep 2019 07:11:18 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwdOimoUZyCwSnTxqL7zYatv7erGnZ+mmW+WBNN1i9X/CJcSFZ/VBMVcyIQ/yWeQIC57MNf
X-Received: by 2002:a37:e10f:: with SMTP id c15mr4661244qkm.256.1569593478158;
        Fri, 27 Sep 2019 07:11:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569593478; cv=none;
        d=google.com; s=arc-20160816;
        b=rEMezOSHskyiRYve38r6XyYBCPRGq2mLhkMV7zi3eMEFA8BSdZOR2aZ3tq49O5ZDte
         ILcYY5M8tijUaGTR1jmRMjkNC5OLGT2lewGN0sRbyCtpWajETPdLq0M7v7riFExdub2z
         Mt4pNzrsjk5DRk7I7A1k4+fJ+LzbGNvL/Ao2Cn1rG3ce5H8DTWOqd8NhIDbvvjr/g8CN
         0dUszHm0z5QcvS+B1PHO6cJYkx7Lx0/2dpiGqcbmlCbnSJeHtpxaU8cViYYimhoyYQto
         j3fsJ5EfCel1ALT8X4yQ6bAn25o/XvtyjayeauhGuJr7RghBZvCzPsx+Rr9lcRlZyI0U
         872g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=k1Q6bo6oGtzEZfTgCVarh8gJ3X7+oQ9djEhBLWXME+I=;
        b=AmnMv/WbIEsh+Nak1F+2sYN4GNTnwW6PrOnwjxAIwlElcIiUcJaiH83w1ONb92GNlc
         EZz+bkaRJ/yYRFBDx7cqG0Pp8OzDxjAh2Oz0mzxZ69JWpSRI2VXkw6J1UKVMQqR6skhd
         buSLN/idl4IiWLPpcVKQzFtPyb0HSPscar6nrLKTzrqHUObUeqMMcaihL8pT4XYmXXkJ
         qEXt3uCp5neCUPvGsJ8rMcq2fFt4CSQ3KLxBcRTdvAx6N3UPIv68A9NncVO/4GSXlPuf
         d0H0wZyMXtKxhuQBP7Fgqu3cD38AWLhDOlmQdoA+OQrGIBf6h7mhhbkWY541fy0I7Iwf
         fXTg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VncKr+TL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o2si2300809qke.79.2019.09.27.07.11.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 Sep 2019 07:11:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VncKr+TL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iDqxp-0000mk-0e
	for alex.bennee@linaro.org; Fri, 27 Sep 2019 10:11:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36457)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iDqMH-0004Xn-Sy
 for qemu-arm@nongnu.org; Fri, 27 Sep 2019 09:32:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iDqMA-0001oO-FA
 for qemu-arm@nongnu.org; Fri, 27 Sep 2019 09:32:24 -0400
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:33760)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iDqM7-0001o6-B2
 for qemu-arm@nongnu.org; Fri, 27 Sep 2019 09:32:20 -0400
Received: by mail-oi1-x241.google.com with SMTP id e18so5220499oii.0
 for <qemu-arm@nongnu.org>; Fri, 27 Sep 2019 06:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=k1Q6bo6oGtzEZfTgCVarh8gJ3X7+oQ9djEhBLWXME+I=;
 b=VncKr+TLApkeE/Acoun7pM3F4Z/2uy+Iwh+NEKVbBuQgnSbpfPTN3oxWz6CAel/aVS
 9zeBxPkiW7/Id0f3b/iXTL7Ln2AbaIb6XetkfFzZr5LuHOmFSpU/Jf6ZuycE+D6vkBtm
 nNVV2vaST1mONoOyT8Rrhbn2TenyHPVbc4u4mkI9Bu/nKrolmthYCVlMVVmPBltfnIwl
 YyxcIEBwaprdKHBaGBQskhGhP57lgwJNmd2CSm3nHPub174A+gOW4wRf+Z/xvEZ5ceNj
 IyBjsHhu9Q1xZxoHnUalckKou18/ha7qYu6PzIPrtCYkTXhJD9jc6tz1aH5dfgvrIaqv
 3BgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=k1Q6bo6oGtzEZfTgCVarh8gJ3X7+oQ9djEhBLWXME+I=;
 b=KLfLkpiGBuRDaJ8PLX6kn/1BIcoRa2OXspkk8m+5iU0xF2iGueNU1n9apViZU0Ke5S
 jL2iWxkKVnSYP56NXkvFb99VfyXrszOfdN9ryfpgb6IIlay6bPBOiyinYz8TllU5K+xw
 lJE6y7GtmexsyrPW7B/P/1RXbamKQiXyW40czQNVt1IMpUb0EAqKsea5RmE6pMFR3znJ
 Bnpd6GJH93E6oyiqSsJTF9gB9Tm1PQSyfmO2yqkQthqaPiOV0qCGFExGKDZ01mFFxKkm
 zIO3L4sxYfvegk2rF51huEAxslv3YhQDmND6i7Bg1E8m1X1xS8GlFjKeK3+vfTaM4+8V
 K0+Q==
X-Gm-Message-State: APjAAAV67RjUh8pjdZHVISN6qHgGXSzQhY9S+T6frJ8YfGTRziSdlatz
 MhFC7HRj/0cwveaGpaKCe5N8NpZaVVyjFGnqbfRficPd/PY=
X-Received: by 2002:aca:f54d:: with SMTP id t74mr6688250oih.170.1569580670906; 
 Fri, 27 Sep 2019 03:37:50 -0700 (PDT)
MIME-Version: 1.0
References: <20190918130633.4872-1-shameerali.kolothum.thodi@huawei.com>
 <20190925112804-mutt-send-email-mst@kernel.org>
 <20190925173753.7382593d@Igors-MacBook-Pro>
 <20190925122006-mutt-send-email-mst@kernel.org>
In-Reply-To: <20190925122006-mutt-send-email-mst@kernel.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 27 Sep 2019 11:37:39 +0100
Message-ID: <CAFEAcA8yrj-NnBqjwchVYXRyfpznsbmwdKBqkubSSj++h09zwA@mail.gmail.com>
Subject: Re: [PATCH-for-4.2 v11 00/11] ARM virt: ACPI memory hotplug support
To: "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::241
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
Cc: Samuel Ortiz <sameo@linux.intel.com>, Eric Auger <eric.auger@redhat.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 Linuxarm <linuxarm@huawei.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm <qemu-arm@nongnu.org>, Xu Wei <xuwei5@hisilicon.com>,
 Igor Mammedov <imammedo@redhat.com>, sebastien.boeuf@intel.com,
 Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: T+s8pOh/l0c6

On Wed, 25 Sep 2019 at 17:20, Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Wed, Sep 25, 2019 at 05:37:53PM +0200, Igor Mammedov wrote:
> > On Wed, 25 Sep 2019 11:28:42 -0400
> > "Michael S. Tsirkin" <mst@redhat.com> wrote:
> >
> > > On Wed, Sep 18, 2019 at 02:06:22PM +0100, Shameer Kolothum wrote:
> > > > This series is an attempt to provide device memory hotplug support
> > > > on ARM virt platform. This is based on Eric's recent works here[1]
> > > > and carries some of the pc-dimm related patches dropped from his
> > > > series.
> > > >
> > > > The kernel support for arm64 memory hot add was added recently by
> > > > Robin and hence the guest kernel should be => 5.0-rc1.
> > > >
> > > > NVDIM support is not included currently as we still have an unresolved
> > > > issue while hot adding NVDIMM[2]. However NVDIMM cold plug patches
> > > > can be included, but not done for now, for keeping it simple.
> > > >
> > > > This makes use of GED device to sent hotplug ACPI events to the
> > > > Guest. GED code is based on Nemu. Thanks to the efforts of Samuel and
> > > > Sebastien to add the hardware-reduced support to Nemu using GED
> > > > device[3]. (Please shout if I got the author/signed-off wrong for
> > > > those patches or missed any names).
> > > >
> > > > This is sanity tested on a HiSilicon ARM64 platform and appreciate
> > > > any further testing.
> > > >
> > > > Note:
> > > > Attempted adding dimm_pxm test case to bios-tables-test for arm/virt.
> > > > But noticed the issue decribed here[5]. This is under investigation
> > > > now.
> > > >
> > > > Thanks,
> > > > Shameer
> > >
> > >
> > > Which tree is this going through? Mine or ARM?
> >
> > I'd assume your tree???
> > (You are the wizard who knows how to handle bios-tables-test-allowed-diff.h on merge)
>
> Sure. Peter if you agree, could you send your ack for that please?

Yeah, that's as good a way to do it as any.
Acked-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
