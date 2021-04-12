Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp3975701lfr;
        Mon, 12 Apr 2021 07:49:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyHPdFCJIxCtncDUEREFxnjm7P885ICWkymlL5nHCfUVDhPHpOXwhYdkqaerMGDc12cWMDs
X-Received: by 2002:a6b:7c42:: with SMTP id b2mr23258730ioq.125.1618238983162;
        Mon, 12 Apr 2021 07:49:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618238983; cv=none;
        d=google.com; s=arc-20160816;
        b=Lm362hXBwLuu2pWcCYa62UBFNUGqknNiX+k5q3qef39LOqyCkqxcSoTA9sxT/UrA4z
         XDcRXGMTPVEuw/B8m9iQZ1m/Xomt2vpabYW7NVSlXOonQqZ9+Ficx5QPPK6lDgKr8rK+
         PbnSCg3z/D3TB7jw7aCyDEcL6B7rbZOrh/4W9I4BLXI2kZ6Ma2z3duMsnoafg38v7sqv
         mVY5GAHQFf7MDjjg2yfwJ365Ad2bPPVRyPkah7PcWt0f9FI2E6Z7kW7O1DKpFK6LF1fa
         eLTNs/UQerIkjOserYh1nSZO6w5avuRxcjA1nMksuHJr5RH7jdnAxec83uwRX6w75Yvn
         bNtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=YBQjV6Tlf7l4baWwDrLI9ZK5m9k22UcI+TNM7YMe8MA=;
        b=VFUvQmCD1lhNgJdWgpeNVLQYieB8AMrxi/msifySbs5dWseW90Kc9rSLyZs2LMpSgV
         SS3+FUzjxeD2dFkRrP15vyvwp4jcL3GVk3QOLZ1rMiDk91eDK7q8EHHcjUO+4UM4gXka
         Tj8O0I780jatWLcemVu9ouhirPpT5spslvpqobYkMXEOoFCbIB1egg4UN+3e670Rc3nP
         jm7Ntmu2kHoTrEnMl2Kf+SrCm3/UNVYC/AmhlH9ccxfgoSCo4he/eHHNMICm0p++zhTl
         8DwryrnAnFqQgsH9U0+30AP2ES4b+B2GxxhW11LRb+utBmu6w3Ypk7qXcCwsWXPT5Pu1
         GZEw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="e01fa8/2";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l11si13951994ils.61.2021.04.12.07.49.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 Apr 2021 07:49:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="e01fa8/2";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lVxsk-0006w2-FB
	for alex.bennee@linaro.org; Mon, 12 Apr 2021 10:49:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lVxsX-0006tk-7F
 for qemu-arm@nongnu.org; Mon, 12 Apr 2021 10:49:29 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:45679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lVxsT-0007YK-Kb
 for qemu-arm@nongnu.org; Mon, 12 Apr 2021 10:49:28 -0400
Received: by mail-ed1-x533.google.com with SMTP id bx20so14264052edb.12
 for <qemu-arm@nongnu.org>; Mon, 12 Apr 2021 07:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=YBQjV6Tlf7l4baWwDrLI9ZK5m9k22UcI+TNM7YMe8MA=;
 b=e01fa8/2dkLTAoue5I+4ZFyPNvNStxyuYcxmWMSeFUbC4uNoO8MIFDzNmcLa1gz30o
 ocDVAzq0E/BLeFeQZCDIcUrSXRFtKaXBE4UO0bsCCI9ut+k3mcl4pJrNMz53BtG3aijU
 Ezhnf4v4KXHYZ5l1Ikw0nyQo/+l1LgbAu2PlzKKpNlEMzrX8NXUDCDhT0r9p1kcNyKEW
 hACQfd5y/uJwtTzecksWS5gMEJx8m3uBiImDdhQjr/D4b5VBTSkoaoNld3JET/p79XMC
 naZdxWQlUpi8iJxjoYH9YvjGWxGl0O7pz/I/bcd0XwDW5Kh/z1v1pSdkn0aR1RX7yKDo
 90FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=YBQjV6Tlf7l4baWwDrLI9ZK5m9k22UcI+TNM7YMe8MA=;
 b=jD7SoShM1ljX1/H+Q4iroLhdYoYd0UtLDrJCsMSw+qo9kG61EqgZBfxlQFgWRRYub0
 +iY4NVj4gksALGpjPI3LCt6xv6trnefUqFpnkXf2hiUxeVk9xcupDcU7mP+1VYLF4fIf
 s4tGjcSZW7NwuO/8u3weFLlSvSx7EmbRX074KnunbWA7rxfp3ktpMVm98ad4vagnxu9L
 YSkHY2JkvWVgnG2ba6zv92Ya54IkP6KcXWKEhzRzmI9lKnPiFe6J7/ybt+UEMtNFSwT3
 NutdC4rZpqxyLyesGq0ivaWpFQ6t+lIUhoRdr92rx+X0Er0O3mNjgm1XCyC2ZptQiJPr
 8feQ==
X-Gm-Message-State: AOAM531C1XcprSQED/waVIipyXyqyFapqn2gyepg4ltSz9pUY4A9KX0c
 Mm22g93y/0/BXYGYUQ8ctiNX5dXXz5h7r2jETmmiQg==
X-Received: by 2002:aa7:cb0a:: with SMTP id s10mr29424403edt.36.1618238964234; 
 Mon, 12 Apr 2021 07:49:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210412134317.12501-1-peter.maydell@linaro.org>
 <5ae470a2-d10a-13a3-4dc6-62490a940e13@amsat.org>
In-Reply-To: <5ae470a2-d10a-13a3-4dc6-62490a940e13@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 12 Apr 2021 15:48:39 +0100
Message-ID: <CAFEAcA8wTdQpYhsDzcXZQG=yqxoQumoZj4TgPjEZjM6GgHmTvQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] mps3-an524: support memory remapping
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
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
Cc: Kumar Gala <kumar.gala@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Kevin Townsend <kevin.townsend@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3/IxsTbeck7F

On Mon, 12 Apr 2021 at 15:37, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> Hi Peter,
>
> On 4/12/21 3:43 PM, Peter Maydell wrote:
> > The AN524 FPGA image supports two memory maps, which differ
> > in where the QSPI and BRAM are. In the default map, the BRAM
> > is at 0x0000_0000, and the QSPI at 0x2800_0000. In the second
> > map, they are the other way around.
> >
> > In hardware, the initial mapping can be selected by the user
> > by writing either "REMAP: BRAM" (the default) or "REMAP: QSPI"
> > in the board configuration file. The guest can also dynamically
> > change the mapping via the SCC CFG_REG0 register.
> >
> > This patchset adds support for the feature to QEMU's model;
> > the user-sets-the-initial-mapping part is a new machine property
> > which can be set with "-M remap=3DQSPI".
> >
> > This is needed for some guest images -- for instance the
> > Arm TF-M binaries -- which assume they have the QSPI layout.
>
> I tend to see machine property set on the command line similar
> to hardware wire jumpers, externally set (by an operator having
> access to the hardware, not guest code).
>
> Here the remap behavior you described is triggered by the guest.
> Usually this is done by a bootloader code before running the
> guest code.
> Couldn't we have the same result using a booloader (like -bios
> cmd line option) rather than modifying internal peripheral state?

In the real hardware, the handling of the board configuration
file is done by the "Motherboard Configuration Controller", which
is an entirely separate microcontroller on the dev board but outside
the FPGA, and which is responsible for things like loading image
files off the SD card and writing them to memory, setting a bunch
of initial configuration including the remap setting but also
things like setting the oscillators to the values that this
particular FPGA image needs. It's also what makes the board
appear to a connected computer as a USB mass storage device so
you can update the SD card files via USB cable rather than doing
lots of plugging and unplugging, and it is what loads the FPGA
image off SD card and into the FPGA in the first place.

QEMU is never going to implement the MCC as a real emulated
guest CPU; instead our models hard-code some of the things it
does. I think that a machine property (a thing set externally
to the guest CPU and valid before any guest CPU code executes)
is a reasonable way to implement the remap setting, which from
the point of view of the CPU inside the FPGA is a thing set
externally and valid before any guest CPU code executes.

thanks
-- PMM
