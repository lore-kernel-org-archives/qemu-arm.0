Received: by 2002:a5d:4890:0:0:0:0:0 with SMTP id g16csp2576483wrq;
        Thu, 24 Oct 2019 09:22:37 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxtwIjgp6qJhDLo8Dhfz+adZv+QgtV3ipv/bGTSXvfp4AjGfTvPrUa+KecnkriACHePPwrk
X-Received: by 2002:ac8:7358:: with SMTP id q24mr2518064qtp.283.1571934156944;
        Thu, 24 Oct 2019 09:22:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571934156; cv=none;
        d=google.com; s=arc-20160816;
        b=KMdb+s+6GMRHQFX4L+6kQVxWDtCLUVaJfvizqBY41KGHvb8TqaN4NQyNsnE6QY+y1L
         GlV7WAHih2iQZEzdDJkTX1eZbfOIYhoW2GxxYCl998nfvv/f6BFo7EqhpL1bzap+wKxW
         2Y5muijzUxkH6MoxeEqcQGoe+IWNLll4eeMArCJAYd3k45vELeodb5ovX29rEhmLDWpK
         V4aljy5n8Mdwa0Mz/Btz1FaLDuQ0qkWFpbRFpVTrdm8h+kLGzfTzcUiskIJ6jeBKe1ZR
         CTTN5FLqH8nvtk8ZMc3MjiOHlm9E6iwOUsmxq5RhdZ9+jVVdpf8gyQ4PU6MP6Ba0Xk0j
         wCzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=vuNzvSaBraIFLt8uoV90RNwLo/LGzjlc4pA2Q+3haAE=;
        b=Ta5vVQTh+wV7yMlGJon9rOl9ileWtA7tDFiOM6M/u1E/z0dkAEonTZaOZkOA1jYUQ4
         ly2IpRUZZF479/JKfVomv6DoUIDxM0cESqqIuDMYYlMSU2IRbTiNBsGBsWQLfyMuQl0t
         FFH9HAUFOQCQPTpiMmAFwK5xXH3Ma4/KVHFn/ShHBV/tZq7T/ld/SNKKpWuYJm9MGFKn
         w6fjroUiPFCMTuncqbRdSu8uUKiXk8sYuE1Y8nD3lvnCVcqbajBQYhXcBqTstpsBCRHO
         79kxjwSMSb1SlGmKNd14mEPya2bMOJZd0UKof0i8axmIxF0JUNRuw4JWPf5PrHhkeUuU
         jMog==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ic9n0shd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p202si23304570qke.31.2019.10.24.09.22.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 24 Oct 2019 09:22:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ic9n0shd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iNfsi-0004jC-0C
	for alex.bennee@linaro.org; Thu, 24 Oct 2019 12:22:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48291)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iNf5M-0008NC-Jw
 for qemu-arm@nongnu.org; Thu, 24 Oct 2019 11:31:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iNf5J-0005by-Aw
 for qemu-arm@nongnu.org; Thu, 24 Oct 2019 11:31:35 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:43323)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iNf5J-0005bo-5m
 for qemu-arm@nongnu.org; Thu, 24 Oct 2019 11:31:33 -0400
Received: by mail-ot1-x343.google.com with SMTP id z20so2380451otk.10
 for <qemu-arm@nongnu.org>; Thu, 24 Oct 2019 08:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=vuNzvSaBraIFLt8uoV90RNwLo/LGzjlc4pA2Q+3haAE=;
 b=ic9n0shd81jfYrQfgsj9GVgWmZ0/iHYok/QHtmw1pXz7CMvy++bXLBS6Wk8pWS4N0m
 5TjbmRudqde8Yc9W6orVmnArE0JVnhJQbwt7RXr47kBNbPQZirh/G+GgEs+CaxZBNQsv
 dzzZxOFFvL9BI8TB0go2M6rDhI3V8gUuIF7hC7Uj0Jt9q+oifV3Xdzgq/AIoKw56A6Wq
 rVzRydxTlV77IK1hu6+oVE8Tb6SHHnTd4x4O66AgXTVXpPrdcpBiF6DVHsZNDjkcL/Md
 dv3POWYx3Tb9ddTtO0y39xDm7C6leMKKar34oVgsbKfJxvoPpXk9HiNLT2ZILdazv9kU
 9wQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=vuNzvSaBraIFLt8uoV90RNwLo/LGzjlc4pA2Q+3haAE=;
 b=f07oKJrMSxilWSf9Hz3du8iKXwakF+qPwzRiQVKgjLsKq/SljDkCMx5+TtigqHvLZi
 ++8rMWwjqQyxftjj65DPjVInMF5J7V7fNt4p2yrSdTBWhfgphQopKhQbscrB2RXWobjU
 daiZcXJNAl1j4T21EaiQBGqi3Nt7NkbsyX4coMFIe98mRGJ9bwjFTOnA0e+dGGfUAs8E
 EyGwc8ZBpqS2sNlam85rPv6o3vsUmjnsPwu5ZEgmV/eNiWfOhbKO7NS1NCr501Pv7J82
 2yc0O7Z/M0cZsCQzlkckMlnR6drzX19hvxBtHLqFHa7B5IdebxmrKI2I7iF/w7CI+60i
 aRGw==
X-Gm-Message-State: APjAAAU5Vg99qI6Bfkbjq/RluIuOduO0P45CzEnWgffm+qmkqxsMI3QV
 gdmW1yk+iMdO+OvCnySlNkXLENOwYcSgjUcjx6kipg==
X-Received: by 2002:a9d:30c1:: with SMTP id r1mr12580473otg.91.1571931091907; 
 Thu, 24 Oct 2019 08:31:31 -0700 (PDT)
MIME-Version: 1.0
References: <20191019234715.25750-1-f4bug@amsat.org>
 <CAFEAcA_WTyJ2AWZfKQSipFmn46ztG1XTL9sE9P2QDD7ob-FKFg@mail.gmail.com>
In-Reply-To: <CAFEAcA_WTyJ2AWZfKQSipFmn46ztG1XTL9sE9P2QDD7ob-FKFg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 24 Oct 2019 16:31:20 +0100
Message-ID: <CAFEAcA-0qg+VbE6VQpdCAX5g6=GzZG18j_FoiamHR8YrKHrmFg@mail.gmail.com>
Subject: Re: [PATCH v3 00/16] hw/arm/raspi: Add thermal/timer, improve address
 space, run U-boot
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
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
Cc: Rob Herring <robh@kernel.org>, Matthias Brugger <mbrugger@suse.com>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Esteban Bosse <estebanbosse@gmail.com>, "Emilio G . Cota" <cota@braap.org>,
 Clement Deschamps <clement.deschamps@antfield.fr>,
 qemu-arm <qemu-arm@nongnu.org>, Cleber Rosa <crosa@redhat.com>,
 Laurent Bonnans <laurent.bonnans@here.com>,
 Cheng Xiang <ext-cheng.xiang@here.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Pekka Enberg <penberg@iki.fi>, Pete Batard <pete@akeo.ie>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9mZ0HdjjwgUy

On Thu, 24 Oct 2019 at 14:42, Peter Maydell <peter.maydell@linaro.org> wrot=
e:
>
> On Sun, 20 Oct 2019 at 00:47, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
> >
> > Since v2:
> > - fixed issue in videocore address space
> > - allow to start with some cores OFF (to boot firmwares)
> > - add proof-of-concept test for '-smp cores=3D1' and U-boot
> > - fixed my email setup
> >
> > Previous cover:
> >
> > Hi,
> >
> > Some patches from v1 are already merged. This v2 addresses the
> > review comment from v1, and add patches to clean the memory
> > space when using multiple cores.
> >
> > Laurent, if you test U-Boot with this patchset again, do you mind
> > replying with a "Tested-by:" tag?
> >
> > The next patchset is probably about the interrupt controller blocks,
> > then will come another one about the MBox/Properties.
> >
> > The last patch is unrelated to the series, but since I cleaned this
> > for the raspi and the highbank is the only board with the same issue,
> > I included the patch in this series.
>
> I'm going to apply 1-10 and 14 to target-arm.next.
> (I've reviewed 10, and the rest have been reviewed.)

...but that causes tests/boot-serial-test to throw
a clang sanitizer error and then hang:

e104462:bionic:clang$ QTEST_QEMU_BINARY=3Darm-softmmu/qemu-system-arm
./tests/boot-serial-test
/arm/boot-serial/raspi2:
/home/petmay01/linaro/qemu-from-laptop/qemu/memory.c:2517:27: runtime
error: null pointer passed as argument 2, which is declared to never
be null
/usr/include/stdlib.h:819:6: note: nonnull attribute specified here

The offending patch is "hw/arm/bcm2836: Use per CPU address spaces"
(patch 7). So I'm dropping 7/8/9.

thanks
-- PMM
