Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp784128lfm;
        Wed, 8 Apr 2020 23:25:54 -0700 (PDT)
X-Google-Smtp-Source: APiQypKfhVkzZ1Oi/LCmjxSb6+Hv83Kyqpo5Xm2I2//Akv0vepfsTY54wzvivmvj1RornG4GzjnM
X-Received: by 2002:a37:4284:: with SMTP id p126mr10914546qka.316.1586413554315;
        Wed, 08 Apr 2020 23:25:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586413554; cv=none;
        d=google.com; s=arc-20160816;
        b=dmbYMyYAAz13q/46TLp/syRkFTb3rw9ga8yHeiWUIO9Om383S37kzH/KFdw06dMbGB
         w2k1KiWnuZQ1qf+iEUVKlT1fCkh7dPFqHCt0/pPICNgwQhqyL6pNUOdHYWcxjwk8Eaig
         124t2tPydgfrnqoGXDq/pU+eJLYTHPccoFP4M8on+ldHbEYorsE6yvIzmSlqiMY7M4L8
         INbtkBHtV5QPr2TBnK9D1y5k6I4wknx+9btshQUQ8i3WUBy9Bu/nF/eiBC9SM1Ha3VBk
         FlG99KvbUahdMLM762VZa2MRZHb4Yqt5hwkaODWigKh4Dx9Z4MgulvhvcJnGhOFlBjdl
         Msmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=6TTfWkXF+KfPgXlK4TEvnMK/fjprNtCaQu2kaLN1q/U=;
        b=v7WjfWfuAf1RwMSGlF+P+BFiPrHTewHjkMAeQG4aZQmL4C0aMiOQtFtDiwMfJD0qnu
         /flL0wNDZMpPWOUDneF/MODT6E9qyNvfBbDlx+RmA2119aT7GrKdHRsH2vv23aTYw5AO
         F+FDETr4RYBu3a5nicB6zFB4r0/708ym2hGxL+RF8fBEKhoeCU4tKZbQS/SF75U5xxe0
         N+s5t+W0ODf6YlHTj+P3CRjCJ0xor9b70Dx/49IJghVnJFjOluzFR8aUN6jlIBJNYIq0
         JYZsvJ6M+MLfgPp2ZHwJbeQ0Nf23yo4C4LIVli/+/+3c/aHPryn8NUZX5aC4EmTQ3qLG
         bQMg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b="Nt/Rqm6T";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j7si5094968qvx.78.2020.04.08.23.25.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 Apr 2020 23:25:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b="Nt/Rqm6T";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:43942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jMQdN-0000pr-Mv
	for alex.bennee@linaro.org; Thu, 09 Apr 2020 02:25:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37111)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <joel.stan@gmail.com>) id 1jMQd2-0000ph-LY
 for qemu-arm@nongnu.org; Thu, 09 Apr 2020 02:25:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <joel.stan@gmail.com>) id 1jMQd1-0004WG-Fb
 for qemu-arm@nongnu.org; Thu, 09 Apr 2020 02:25:32 -0400
Received: from mail-qt1-x842.google.com ([2607:f8b0:4864:20::842]:42239)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <joel.stan@gmail.com>)
 id 1jMQd1-0004Vl-4a; Thu, 09 Apr 2020 02:25:31 -0400
Received: by mail-qt1-x842.google.com with SMTP id b10so1948692qtt.9;
 Wed, 08 Apr 2020 23:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=6TTfWkXF+KfPgXlK4TEvnMK/fjprNtCaQu2kaLN1q/U=;
 b=Nt/Rqm6TbjBddU2OSUDGTqu6qKnLeK60GVkvRw+TCdaa2W4ui0BWn2vDWeUZBaLwaz
 A6lY7V8G83vZ+gxzpmv1Km6IqEuml0+DqdD3yEtTB+tdSinNivpBcNhKV+carEJ+5eLZ
 wVJm9JBs0fxnRNpofG2pQ+WPwCMT2chrAJMoA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=6TTfWkXF+KfPgXlK4TEvnMK/fjprNtCaQu2kaLN1q/U=;
 b=i6Qu/vR4jKO4cl82Q+oz4a0ldd+m7P6PJRybp7/Z5g5xbeM7Xf/N9p1axDtLsqXiSY
 HQeJPii85Y+lC/ZHtmbcam2Omdt8AuK38RTQNBCgCPQYzDBFsEFW9bvUhEsWyw4wLC1u
 XqxYnlyHgXN92Koubhf8Y98BfX9d/+MM6uiMSQYfJ/QUdlkeRz81PLNwseLqDYan0QIk
 9Cano4YwFWaDSIl6QaGUHWZXtkkd107cChdZc9TSSyQQCO0qzNUMu7aqIM245gHVLLXi
 nOMTLP4LuToeMvPTHomTxj+B5XrG3lKMYB3Tty5XJRN8F6yQa5ScvnJRc9xF2hHknAcH
 NASw==
X-Gm-Message-State: AGi0PuYZTD1iQuMs65HETX+b40RjWI3y7NO8GxmmwEpBW5m4mqvVtvz1
 GeVY0rV6Wi7NTie9SPLmH1aOFXSmv+T4D/vDy+0=
X-Received: by 2002:ac8:342d:: with SMTP id u42mr10681255qtb.255.1586413530114; 
 Wed, 08 Apr 2020 23:25:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200407072517.671521-1-joel@jms.id.au>
 <CACPK8XfHnE_kEPw++CdLRG9r=xJmLZkuV4WXP7NKTo8mW+dJvA@mail.gmail.com>
 <16f057db-a4d7-889f-344c-930587fc8bf1@redhat.com>
 <141d2355-5f9d-c8f9-4021-01754f8bc2ae@kaod.org>
In-Reply-To: <141d2355-5f9d-c8f9-4021-01754f8bc2ae@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 9 Apr 2020 06:25:17 +0000
Message-ID: <CACPK8XePK4j85BrT7tSgh54bO441sUxNiKmHyP+YUepcpZ=Pow@mail.gmail.com>
Subject: Re: [PATCH] aspeed: Add boot stub for smp booting
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::842
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: une2NcqZWtKx

On Tue, 7 Apr 2020 at 08:26, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> On 4/7/20 10:19 AM, Philippe Mathieu-Daud=C3=A9 wrote:
> >
> >
> > On 4/7/20 9:38 AM, Joel Stanley wrote:
> >> On Tue, 7 Apr 2020 at 07:25, Joel Stanley <joel@jms.id.au> wrote:

> >>>   static void write_boot_rom(DriveInfo *dinfo, hwaddr addr, size_t ro=
m_size,
> >>> @@ -270,6 +322,19 @@ static void aspeed_machine_init(MachineState *ma=
chine)
> >>>           }
> >>>       }
> >>>
> >>> +    if (machine->kernel_filename) {
> >>
> >> I just realised this shouldn't be executed on non-ast2600 platforms.
> >> We could test for the number of CPUs like this:
> >>
> >> if (machine->kernel_filename && aspeed_board_binfo.nb_cpus > 1) {
> >
> >   if (!strcmp(amc->soc_name, "ast2600")) { ?
>
> or a 'bool' under AspeedMachineClass ?

I considered both, but I went with the number of configured CPUs as
this means we only set it up when configured for SMP, which is the
only time it's worth doing.

Thanks for taking a look.

> A part from that,
>
> Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
> Tested-by: C=C3=A9dric Le Goater <clg@kaod.org>
>
> C.
>
>
> >
> >>
> >>> +        /* With no u-boot we must set up a boot stub for the seconda=
ry CPU */
> >>> +        MemoryRegion *smpboot =3D g_new(MemoryRegion, 1);
> >>> +        memory_region_init_ram(smpboot, OBJECT(bmc), "aspeed.smpboot=
",
> >>> +                               0x80, &error_abort);
> >>> +        memory_region_add_subregion(get_system_memory(),
> >>> +                                    AST_SMP_MAILBOX_BASE, smpboot);
> >>> +
> >>> +        aspeed_board_binfo.write_secondary_boot =3D aspeed_write_smp=
boot;
> >>> +        aspeed_board_binfo.secondary_cpu_reset_hook =3D aspeed_reset=
_secondary;
> >>> +        aspeed_board_binfo.smp_loader_start =3D AST_SMP_MBOX_CODE;
> >>> +    }
> >>> +
> >>>       aspeed_board_binfo.ram_size =3D ram_size;
> >>>       aspeed_board_binfo.loader_start =3D sc->memmap[ASPEED_SDRAM];
> >>>       aspeed_board_binfo.nb_cpus =3D bmc->soc.num_cpus;
> >>> --
> >>> 2.25.1
> >>>
> >>
> >
>
