Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp1811825lfp;
        Thu, 6 Feb 2020 11:06:07 -0800 (PST)
X-Google-Smtp-Source: APXvYqx8ui1T1xVskQyCNbafAHiFVv1SjW2GXgb7ac5srGs+gSJIOHLWiWoSMSo4bXvems+y86c3
X-Received: by 2002:a05:6214:209:: with SMTP id i9mr3694694qvt.54.1581015967544;
        Thu, 06 Feb 2020 11:06:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581015967; cv=none;
        d=google.com; s=arc-20160816;
        b=vk0hGR4djmcs4TExOWYmnE1Nf/ommKc6LvuNZHjqwrDnnolcob7Skyy8IBNqVsz1qb
         0JrEfNVhPXC3d3Utrsq5l2NU1Lkfw2M3YICIHDBe0b1T37go+5GECqBG3K3lB8SeUnIN
         c/KOCuXBD7qtVLoa7gSYYl/d/cRnigbORNMA0iSaEyQ49c1KmbMXaT1ueEUtRdU0XdhM
         6KdNwcetOzrcwt5Pj4vXH5K7TaThlTF1bxYizo6gMRm8P+IWDWpieTMgZBnRBhMwE4Ef
         28LkCNOsGT7RSQuiR5dbhyvISWFI3nmbDh9fqviWeRhb73ypWpSV38HAu5IKuWy5azA8
         bLKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1ZOAXB7m0ZjHb7rkvalb02qlX0xT8/cGWBX4Pm95oWs=;
        b=D1GoWnxfbdNbZz/DVfzZkgfNRoLHABiewy+VUt1LLylT5yCu5QMSX2HfdgtTtN8DHk
         /eJznzhkw7cAIiw6qbySa8rWGiIKCQWU3ouZFnyq4nB4ZUmsi4RV8b5zJVzIK+yiI3jP
         SdXRi7vCX3JEvc1/uzn5rQ4NSyLwPQNkKjQFVW4ediNBgBNEnueWViVH9lFe4r+4XL16
         UpRxegszWYPV7Se9+orj4RwAO4hhueiRuGmOQjS+nBRB1pgl9WTGvU1+ZugM6So7B6Ox
         aoi+8F+eoEdPiNyaehiYQW3xJEvIKpOCzrKPjcYKGBGMalmzXlctIU9OD6DVbBnOSvOi
         LkwA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=D6J+kM19;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n13si209456qti.2.2020.02.06.11.06.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Feb 2020 11:06:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=D6J+kM19;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:44804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1izmTX-0000Xe-0c
	for alex.bennee@linaro.org; Thu, 06 Feb 2020 14:06:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47067)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <josemartins90@gmail.com>) id 1izmTQ-0000XY-Hq
 for qemu-arm@nongnu.org; Thu, 06 Feb 2020 14:06:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <josemartins90@gmail.com>) id 1izmTP-0004hH-Eq
 for qemu-arm@nongnu.org; Thu, 06 Feb 2020 14:06:00 -0500
Received: from mail-il1-x131.google.com ([2607:f8b0:4864:20::131]:42618)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <josemartins90@gmail.com>)
 id 1izmTP-0004Yo-9W
 for qemu-arm@nongnu.org; Thu, 06 Feb 2020 14:05:59 -0500
Received: by mail-il1-x131.google.com with SMTP id x2so6119795ila.9
 for <qemu-arm@nongnu.org>; Thu, 06 Feb 2020 11:05:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1ZOAXB7m0ZjHb7rkvalb02qlX0xT8/cGWBX4Pm95oWs=;
 b=D6J+kM19Xp8fgJ6HNQzgnf1J5GyIsSMFgbfTKpDbK7F9QkESQfoMGRhQXGzz2P7uQY
 YJyXUOm5ZHl5EPp485E0cLWZUIQqvwGwKAwz7sIMOc2FikaDhhy5XVJK7ZISSyEWnK7+
 zTKG4VDqy8EtAyYlAXIUDYcCCTN7qgYqetdJPg1TSmlbzUIjrJ6v04Zq3hxhufvxKoqn
 //+O5Dbu+HcXqSbhSpRaBAhE+iDeb/sb1gVRcbKKCBpK0X6BqSFf3F5s3xHWfaV3Dnyw
 RifhcypwH7aHOfrLaRJkbWo1Z/jC/ncXztba0o82TrzHwYCUmaTCpOEP7jbVmbzt6oV7
 cftw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1ZOAXB7m0ZjHb7rkvalb02qlX0xT8/cGWBX4Pm95oWs=;
 b=J3ageSbtkPEc1/4+v+K0HXuY6JEEW9EWRSBSs5SAd890gTL+5NI2eSlIdCUdhWRqeW
 jibQT2DxvlafmmU64bqYmDu4aVWyZ7e+ZuYJQmDV2nr4TDBLbuFDJfbcvndIO0soQdoX
 ZwkYljHZ2KKBWnVPZKFxZK9++c+W5/nS1s+7kV0B9k4xp5z6moiGKDzhjmm0uQtpK+fC
 EE5LF+XwV/Jpe+N2zJITsr/Xazg0BpaC5r3DAQ8mBUdzciqOeQRl0JdnysC0Qwd6g6WR
 5Mu9ZcJnlmZfmD/covak52wORSgzETEqf1hyOFfSZBJNdZtZLMj2EjE0FIYD4wuT7Bs/
 DiLw==
X-Gm-Message-State: APjAAAUlVgLTjajD9SEriHL1zHOlHRNjG/iVX5f7EPMzUGMPviy/9P3j
 8O+itxEmQYMAynCED/KVIV0ycoh9m1IO4HlqO5E=
X-Received: by 2002:a92:5e8b:: with SMTP id f11mr5421647ilg.178.1581015957959; 
 Thu, 06 Feb 2020 11:05:57 -0800 (PST)
MIME-Version: 1.0
References: <CAC41xo2pUsuzOBAG2fFwYiF8cK=cN+0pZYY+-2GTxamhxSw1gA@mail.gmail.com>
 <CAFEAcA_JnpOAH-aas82YsQ2UsHC7WLxVSMd+Tr1R7aqkwCdW7w@mail.gmail.com>
In-Reply-To: <CAFEAcA_JnpOAH-aas82YsQ2UsHC7WLxVSMd+Tr1R7aqkwCdW7w@mail.gmail.com>
From: Jose Martins <josemartins90@gmail.com>
Date: Thu, 6 Feb 2020 19:05:46 +0000
Message-ID: <CAC41xo1HWW+mTYtsDyb9BkEe6nVffde1b0DVte4pCYHAn3oLUA@mail.gmail.com>
Subject: Re: gicv2 virtual interface alias base address
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::131
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
Cc: qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AP0b2Ou0iJBg

Thank you for the clarification Peter. From what I gather from your
explanation, the functionality might be present in the GIC IP but the
SoC designer might choose not to actually expose it in the platform
memory map. But do you see any specific reason why an SoC designer
might do this? Also, in the case of the virt board, and since support
for this is present in other qemu platforms, is there a specific
reason not to include it?

thanks once again


On Thu, 6 Feb 2020 at 17:51, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Wed, 5 Feb 2020 at 18:32, Jose Martins <josemartins90@gmail.com> wrote:
> >
> > Gicv2 specification describes a mandatory global alias region through
> > which any virtual interface can be accessed by any cpu. Looking at
> > arm_gic_realize function this region seems to be implemented ( /*Extra
> > core-specific regions for virtual interfaces. This is required by the
> > GICv2 specification */). However, I cant figure out what would be its
> > based address on the memory map. I'm using the virt platform. Can
> > anyone help me with this?
>
> These are required by the GIC specification, but there's nothing
> that requires any particular SoC or board to actually expose them
> to the programmer. The 'virt' board does not map these. What
> you get is the GICH_* virtual interface control registers at
> 0x08030000, and the GICV_* virtual CPU interface at 0x08040000.
> In both cases the registers apply to the current CPU (ie the CPU
> you access them from); there is no direct access to another CPU's
> GIC interfaces.
>
> (Our GIC model provides the for-each-core memory regions because
> a few of the boards we model (eg one of the xilinx boards) provide
> that facility in hardware.)
>
> thanks
> -- PMM
