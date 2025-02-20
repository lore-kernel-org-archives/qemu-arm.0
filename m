Received: by 2002:a17:504:f96:b0:1be9:327d:8ee3 with SMTP id oa22csp1921537njb;
        Thu, 20 Feb 2025 02:52:48 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWlT6mgZ1YwhLIdQEhQdc3bi7njdS9CWF4oKGuJv8/tmpLgv+4A3NFFqVb3m+T5uGOXndmN3e+IODXF6w==@linaro.org
X-Received: by 2002:a05:690c:6a0e:b0:6fb:9c08:4980 with SMTP id 00721157ae682-6fb9c08a58bmr73411467b3.27.1740048768140;
        Thu, 20 Feb 2025 02:52:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740048768; cv=none;
        d=google.com; s=arc-20240605;
        b=Uy209ze6hlt8plBunRl0ztNZaj0P4HSGGPLG6rswtujLEKvqUx5eMphlfCISG0/Y1M
         MpbKzPpWjf43G2Cw85Xk2ssKUPIFSOr6FKyWlLhsbrfQYKUA7l6Txi1Cl2/c1pxkr5+v
         lCnx4omqkZF+OCV7/8rMS4qF8yFipLKuG6zKbQ4S5jS5fr7dLnZ0XOzKa0nrSPA69ls8
         uDOKzJjPrA9I7t3YcJGU+J1AgsHcVHmTM9NHQVo9tmQh34SQZA5QtKerJ1V53dXHQx0q
         7K/hb7Tgx8+V0slu3rDWi2iWRv14G4cxXbMGIvE7oiK/8O0335dMeRquZYVmWbfCAGbz
         BZKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QwQqs2MUo29YuU8xbj8I9NFNJ0ZGtO71G9EnwFnBys0=;
        fh=Zw76QHuuqiZ5DWM2Ir+FLk2aqLfkhARa7y6VgDIfxL0=;
        b=IrenNZQQ23cYXEEoc6HTLVnLKB+c+ytpkohES8E8D7e4hsfTlejhdN6UNxtxdYgj7K
         8pBW3jVSgc7GgfqtnhEcMKK5vJxA/9A15qhyCyl/ee0UqNutvvjliCER1x5xkhoggjDc
         FxMrZKxM4Ies4Bz0wMwsYDRBMlwLkUiNKKVYh0IaP/be8Gw1B9X+69bx3QXLDGFzkW1k
         A2qiQUMOdivU6ETi3kcC35YLH43evPd0MwIfqzxY+KKPEVkXEwoPctmVuqhpxIAawqXG
         RrufPzgwnkXpsVEr6vvcedkgFwFXNXFcV2RiZB7mh0i8lI/zvazhU4q+xpD9uglmpukH
         DHsQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fy54V2ez;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 00721157ae682-6fb92bb5b71sor44276637b3.6.2025.02.20.02.52.48
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 20 Feb 2025 02:52:48 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fy54V2ez;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740048768; x=1740653568; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QwQqs2MUo29YuU8xbj8I9NFNJ0ZGtO71G9EnwFnBys0=;
        b=fy54V2ezrylRq4mME/d2UIwz/bJNpW1nbQu3oItkpBmXqZfU9ObaQS3KMBkR1Z0U5u
         JGTL93yMgLJ8VdobsidxvwHAsI10wInhvIU1UAMTy97HMIU6i/Ppz6z9LE12kUhO8zV2
         QSaSRk31wyAfK+EFhp+7ZSvhRg3l73WbeFKF3yUOErpsdd6lqjC1PhpHqaC6D/P53dw3
         I69pmqMQsLmVxBt8tkD+vPW/ugKYBiaX3VGX8Z+eQo0ASy0/ZczBW6660F8m9RF5OCRx
         QnWAg6V8hY0alQyYEzs+8VzAn3oLTyxnAY57lLlXVrcjQ84/sP/Zufe3RwtT/sDrM7i4
         JuNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740048768; x=1740653568;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QwQqs2MUo29YuU8xbj8I9NFNJ0ZGtO71G9EnwFnBys0=;
        b=d97H6JG+Ex6jfMHS/Dej4AYANAw/nTDYE7olZMtsI8s3pD7Mc2plXM+MfEpUM+md4r
         +MWytmfFdAbHzyd4BXP+cJp76SUdb8+ABY3zJGBwU69z+5gFIZADU7uCr6RuPav4gAs7
         g+GQ+n59+rImfVMo2c+cYOCsg9xwTX5NeurQvQNorOhI5n8FZ7yu4UwvjvqiUEDPt59q
         sSosVTOwjhOhaMyGfWPRxh2K5VNIz0JuQBEnQsb6x4vq6x/Hg83XQRzveSyL/4VAjm6z
         /JPYcgsYVxbHjPmzveBmtTJ6bYlDEfFr/lmK322zccmZsPyNVLsuyU251kI6ndjH99Xv
         JH+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVnGO36XVsitDVB8SZK0t1ZjjTFAMfDy6Qi3uvw9Wm7AyW83iNgY+03wor0Qpf5Uo8DcZ9PVEZ7W8XuOQ==@linaro.org
X-Gm-Message-State: AOJu0YwxQSzVmeYSXKy2lhf1Op/IAbPMELGjsMasB4q9qAcwFYjPmyMw
	CWvXRJmXhGKU+PIgQW1hlkR+MXzXhRAcALo57IxfbCHawiYOQAfWtw5P6w6wRYIddywK2+jVYTt
	SQwy+99zeCGM6bJEmEyM/5NA2C+OkS/rmpOHfevFY
X-Gm-Gg: ASbGnctPSf1pS/x/tEroHl89s/9FNCkOkfFC+0p0q+LdqVgDRLow4VjTsop/tqWmtge
	UJgJVe89dn1/Ck9NY+JrZJwx0q+Cc2sEtNcrwdNb9Pw0sceuLqh6H7osjV5ffgpFZ+H2uRcQjAA
	==
X-Google-Smtp-Source: AGHT+IHql1vi73rS7Qz0C2FLVELu5Y5bZ+t6mBGqmmhedCFjRoENIdcAsnvEZjtN8uH6V83DC0DOAT3byy6bKum73iY=
X-Received: by 2002:a05:6902:1141:b0:e5b:3a59:525e with SMTP id
 3f1490d57ef6-e5dc904a281mr14688925276.18.1740048767621; Thu, 20 Feb 2025
 02:52:47 -0800 (PST)
MIME-Version: 1.0
References: <20250208163911.54522-1-philmd@linaro.org> <CAFEAcA8PYv3-JX66THwj-mDM0es6V5gVVWJsHTqkd9wTEVor4A@mail.gmail.com>
 <CAFEAcA-ioFgThGJ70cyhe7rA0kbnDULsr-BuAqE+3b3TE0BGwg@mail.gmail.com> <CAFEAcA-fZakXqgDV72fE5sFJv7ah=bvoXYpGqXZZzGutxt7r+A@mail.gmail.com>
In-Reply-To: <CAFEAcA-fZakXqgDV72fE5sFJv7ah=bvoXYpGqXZZzGutxt7r+A@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 20 Feb 2025 10:52:36 +0000
X-Gm-Features: AWEUYZksPweIXkSyJpL0bLRKlOjouUak4xMtIhxez_8kkKi727JLx3uQ8DIQyGA
Message-ID: <CAFEAcA-UP5VcDokb11KfpmQztRnWFS9pLcMZ5_2pe=BBKEv7Fg@mail.gmail.com>
Subject: Re: [PATCH v6 0/7] hw/char/pl011: Implement TX (async) FIFO to avoid
 blocking the main loop
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org, 
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	=?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: j3l6olOnmWOn

On Thu, 20 Feb 2025 at 10:43, Peter Maydell <peter.maydell@linaro.org> wrot=
e:
>
> On Tue, 18 Feb 2025 at 13:54, Peter Maydell <peter.maydell@linaro.org> wr=
ote:
> >
> > On Mon, 17 Feb 2025 at 14:55, Peter Maydell <peter.maydell@linaro.org> =
wrote:
> > >
> > > On Sat, 8 Feb 2025 at 16:39, Philippe Mathieu-Daud=C3=A9 <philmd@lina=
ro.org> wrote:
> > > >
> > > > Hi,
> > > >
> > > > This series add support for (async) FIFO on the transmit path
> > > > of the PL011 UART.
> > > >
> > >
> > > Applied to target-arm.next, thanks (with a couple of minor
> > > tweaks to two of the patches).
> >
> > Unfortunately I seem to get failures in 'make check-functional'
> > with the last patch of this series applied.
>
> I had a look at this this morning because I wondered if it
> was a mistake in the style fixups I'd applied to the patches
> on my end, and I found the bug fairly quickly. The problem is
> that pl011_xmit() doesn't update the TXFE and TXFF FIFO empty/full
> status flag bits when it removes characters from the FIFO.
> So the guest kernel spins forever because TXFF is never unset.
>
> The following patch fixes this for me (and also makes us not
> set INT_TX for the case where we couldn't send any bytes to
> the chardev, which I noticed reading the code rather than
> because it had any visible bad effects):

Hmm, but that's clearly not the only problem -- it fixed the
"no output at all issue", but now I see a test failure because
of garbled console output:

2025-02-20 10:34:51,562: Booting Linux on physical CPU 0x0
2025-02-20 10:34:51,563: Linux version 4.18.16-300.fc29.armv7hl
(mockbuild@buildvm-armv7-06.arm.fedoraproject.org) (gcc version 8.2.1
20180801 (Red Hat 8.2.1-2) (GCC)) #1 SMP Sun Oct 21 00:56:28 UTC 2018
2025-02-20 10:34:51,563: CPU: ARMv7 Processor [414fc0f0] revision 0
(ARMv7), cr=3D10c5387d
2025-02-20 10:34:51,564: CPU: div instructions available: patching division=
 code
2025-02-20 10:34:51,564: CPU: PIPT / VIPT nonaliasing data cache, PIPT
instruction cache
2025-02-20 10:34:51,565: OF: fdt: Machine model: linux,dummy-virt
2025-02-20 10:34:51,565: Memory policy: Data cache writealloc
2025-02-20 10:34:51,565: efi: Getting EFI parameters from FDT:
2025-02-20 10:34:51,566: efi: UEFI not found.
2025-02-20 10:34:51,566: cma: aetrsv6i
2025-02-20 10:34:51,566: psci: oi ocdteofmT
2025-02-20 10:34:51,566: ps:Sv1ecdniwe^Mps:Usdvni spsc:rt  gtnot psci:
SMC Calling Conventiov0
2025-02-20 10:34:51,567: pec:Eee1pec pvls9 1 2865^MBul1olt bi4^MKerloa
n:itte nltAA
2025-02-20 10:34:51,568: Det c stlere 3 rr4 5i 9(dr336bt)Memr 06112aib
6Keece11K ra0 ,21 sv,Kmrsv,Kim)Virtual kernel memory layout:
2025-02-20 10:34:51,568: vt :xf0  fa  f00 0f00 30 (0M^M lm  c00
0800xe0 0000  2M^M mue:x00 0f00  4B
2025-02-20 10:34:51,568: et x(tvl) (rl 97B
2025-02-20 10:34:51,569: n 0(trvl-xta) 0  0pv) 3 B
2025-02-20 10:34:51,570: bs prl-xta) 5 )random: get_random_u32 ca
___+:ag6 d=3D3MOes,P=3D,os^Mfta:aotg78ni  1asHierhlC pmti.        RCrtcnC
oN_S2orpi=3D.   TasCebd
2025-02-20 10:34:51,571: RC jtgeeyor_o_a1 __d^MNRIS1 rr GIC physical
location is 0x800000^MGIC2 n[mx00-02f,P81]arcte 1tm(
nna65H(r.cemk0fffffacl:0d20,aish_o:6i  M,routo1n per49419sn^MCocrm
dexCalibrating delay ose eceiife..oIl2^Mpxdl6i3
2025-02-20 10:34:51,572: SertFmo ia^MYemgmdl
2025-02-20 10:34:51,572: SEn: ili.Moutcea b te 2(d:,4t^MMoupnch
stlers14oe  9oeyo
2025-02-20 10:34:51,572: CP0Screv:iwein tuia norieI tst lrl
2025-02-20 10:34:51,573: /cpus/cpu@0 missing clock-frequen or^MCPU
rd1c  k  i 00^MSetgptiintm rx30 000Hircc Cmento^MEF rc ln  aae^Msm ii
cdrCs.smp ohu1o, USMPTao1reo cvae(15. gP.CPUA U)tt  Code.devtmpfs:
initialize^Mmo4aheu pr3vit e0cloejfe s fffm_cs0fffm_d_:924250sfut stbs
2025-02-20 10:34:51,574: piclo:niidit uye
2025-02-20 10:34:51,574: DM tre  vi^MNETeDM:rlae2  o tmi oerent aloaios
2025-02-20 10:34:51,574: audit: initializing netlink subsys (disabled)
2025-02-20 10:34:51,574: audit: type=3D2000 audit(0.480:1):
sat=3Dntalzdadt_nbe=3D e=3D^Mcpuidl:usn oenrmnu
2025-02-20 10:34:51,574: No ATG?
2025-02-20 10:34:51,575: hw-brapit fud5(1rsrvd rapon n  achon
eitrs^Mhw-brapit:mxmmwthontsz s8bts^MSerial MAP01 Ap1:ttAA tMIO09000ud
=3D 0) saP01 e1
2025-02-20 10:34:51,575: console [ttyAMA0] enabled
2025-02-20 10:34:51,668: cryptd: max_cpu_qlen set to 1000
2025-02-20 10:34:51,690: vgaarb: loaded
2025-02-20 10:34:51,697: SCSI subsystem initialized
2025-02-20 10:34:51,702: usbcore: registered new interface driver usbfs
2025-02-20 10:34:51,703: usbcore: registered new interface driver hub

(the log has no garbling after that so it's presumably OK with
the interrupt-driven real UART driver but the polling one you get
for earlycon has trouble.)

I also noticed that pl011_write_txdata() doesn't clear TXFE
when it puts a byte into the fifo -- I'm testing to see if
fixing that helps.

-- PMM
