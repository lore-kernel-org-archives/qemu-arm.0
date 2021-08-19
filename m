Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp335455lfg;
        Thu, 19 Aug 2021 06:37:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzdzrjEfm6HE03SxqI8BubytEpA0Wojjl6G0AlrvRNpCoZ5rdgsSHzfhGw9VQh/8i4sTyiU
X-Received: by 2002:a5d:4447:: with SMTP id x7mr4217482wrr.198.1629380241983;
        Thu, 19 Aug 2021 06:37:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629380241; cv=none;
        d=google.com; s=arc-20160816;
        b=QB902l198xFSPrqC7DcjB4ugG4sXFLv/J7hD0CrivV81SHUKIaAfWQldvRGTRW1FYy
         z8NIy2juA1P15U6POHCMIJ+9YboYgWE9woAoSQTgw3S2Di3utUHjBFJFuagbu9XVj8bt
         Jh6DxyWdaSRkq/gQEh5RG73PVe0ewecb91gZLScx75fN4VIaWWN1I/fTtXSY7Te0yLUB
         PFZ5WHef+Veae36w/8Q2TzW9H0V9dzZOAJ7aVD70oP0w4ygfc655emSow1ndRv7+6sl8
         sYOE1w8qjffHxnmCar/jGpPEdyAprXBba6ai+MA9wTqxuj5bTLZChKa6Lo4ujCiP7gei
         Nz5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :references:message-id:in-reply-to:subject:to:date:from
         :dkim-signature;
        bh=zFkPTLhOTVMiBxExd2gI4Tu83dQ81rLzOJz37KGA9Jc=;
        b=PbVLeWb/aZh9GonjT4E3J/GHKtakyJgdysaep4ne1kGxtIfoprdycDhWaGfddnfgF9
         UMwpmZBBR1C8ylTQDPTvSdX6QgFa8php60ilfvrQ2BTssRm5XooB5D4/Q/yQcnbvaRXN
         6ZNkDi+qnEZgrEXfcKoGy8RGoKMgwmypwSDTDtk8WJWVwaW9Cn8Znvdut3HkAW5EnaBZ
         18GFKDKPMRQSZc1JAt/b2defxI3tH61SNBg1IFRP/E0iWoern4euPSI7A/ibe0wGW0+8
         Kly7rz7IUECuosCPZMYXF4xrJpPiNQVqHnxS46VJY+b4NpIBA2/C8u4BQqEF28JQYKx5
         8M2A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@anisinha-ca.20150623.gappssmtp.com header.s=20150623 header.b="dLcM/Ij4";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c15si3790534wri.382.2021.08.19.06.37.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Aug 2021 06:37:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@anisinha-ca.20150623.gappssmtp.com header.s=20150623 header.b="dLcM/Ij4";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:43184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mGiET-0000Rk-4x
	for alex.bennee@linaro.org; Thu, 19 Aug 2021 09:37:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mGiED-0000RB-Ap
 for qemu-arm@nongnu.org; Thu, 19 Aug 2021 09:37:05 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:52085)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mGiEB-0001bN-6a
 for qemu-arm@nongnu.org; Thu, 19 Aug 2021 09:37:04 -0400
Received: by mail-pj1-x1031.google.com with SMTP id oa17so4987023pjb.1
 for <qemu-arm@nongnu.org>; Thu, 19 Aug 2021 06:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20150623.gappssmtp.com; s=20150623;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=zFkPTLhOTVMiBxExd2gI4Tu83dQ81rLzOJz37KGA9Jc=;
 b=dLcM/Ij4GtAlphtiZ4MjdkXcAj/FYvfqbNM9hghLFD/7g7OT3lMXwIqKz0Jeg7IvtQ
 QhcSxcd24S7vMZSbwnbC9+1hCuKmRu1fVjj3idCeg+ZRo12f0A6ugfDpe87xS+3yE5i0
 tSKfyD3CGI9RtuQQtTLZYYAg7uzCIIaYxxDNj3p8pzEDjNzyCnlIwkKzJnZNOoLu9sfB
 o7Kvv+nMFWHu7sUWbM1Y7Y0+wGDWUV3WSpct/TegPq/J2r9a3q5ouCxMTL4iYRpoiv1B
 3rpCe8PaQGRRc+KSGSnThCGHcLNzl2jz8DlZtEZqnG80qFGlWp/onjH7sXdBQnO2O95X
 BR7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=zFkPTLhOTVMiBxExd2gI4Tu83dQ81rLzOJz37KGA9Jc=;
 b=JmYeoY15awEeF3Rna0NTZf3CYvFtvRNBfXZbRorXq4AY9cXsGFOrLILIXMIdW7xGsB
 He5RRVnQmIafjQEq9TIATV8LLCWauCR0G4D7Reh1W8RVuA5OVLmk7WQe6G7VRofvo6xa
 9Obis2ergIxXwbJPQIynrjRJOU3yD1igbW74J+fnK/Yzgz8eQ+f9dEKyRhZDE40t9hIr
 GcU9Y+f2Qbl/natWjFkeV9yZEipbEsVvYQPVtSDs7G4ikubZKEOH76A3NNCNmt5o2LGp
 K0IXNOMmWCF0RGeIs4kmnKU5KjTBKKw/Ogimj+ZhrezVUAtASSWlVXXz2OcfR1nb3dCj
 sBZQ==
X-Gm-Message-State: AOAM533KZUDyW90tL2RayiIrNbQUfnKzc4wyNrjyluTA48zuRKmU4mc3
 YIeHXVAiI8bo2J+xPZkhtssFGw==
X-Received: by 2002:a17:902:e804:b0:12d:b49f:bf1e with SMTP id
 u4-20020a170902e80400b0012db49fbf1emr11977601plg.75.1629380221272; 
 Thu, 19 Aug 2021 06:37:01 -0700 (PDT)
Received: from anisinha-lenovo ([203.163.234.32])
 by smtp.googlemail.com with ESMTPSA id l185sm3530550pfd.62.2021.08.19.06.36.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 06:37:00 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Thu, 19 Aug 2021 19:06:44 +0530 (IST)
X-X-Sender: anisinha@anisinha-lenovo
To: Ani Sinha <ani@anisinha.ca>
Subject: Re: [PATCH] hw/arm/Kconfig: no need to enable ACPI_MEMORY_HOTPLUG
 explicitly
In-Reply-To: <alpine.DEB.2.22.394.2108191849260.417749@anisinha-lenovo>
Message-ID: <alpine.DEB.2.22.394.2108191905100.418214@anisinha-lenovo>
References: <20210812033405.362985-1-ani@anisinha.ca>
 <alpine.DEB.2.22.394.2108171014500.202364@anisinha-lenovo>
 <CAFEAcA8Fu+mkzFi9JdTtbqMcnnV74Swk04xx2a1G4L_oATY2eQ@mail.gmail.com>
 <alpine.DEB.2.22.394.2108191849260.417749@anisinha-lenovo>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: none client-ip=2607:f8b0:4864:20::1031;
 envelope-from=ani@anisinha.ca; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Igor Mammedov <imammedo@redhat.com>,
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: B29ToAawvaCv



On Thu, 19 Aug 2021, Ani Sinha wrote:

>
>
> On Thu, 19 Aug 2021, Peter Maydell wrote:
>
> > On Tue, 17 Aug 2021 at 05:45, Ani Sinha <ani@anisinha.ca> wrote:
> > >
> > > ping ...
> >
> > You didn't cc any of the ACPI maintainers; I have done so.
> >
>
> oops! my bad. I used checkpatch and did not verify if Igor/Michael was
> cc'd.
>
> > Is it intended that ACPI_HW_REDUCED must always imply
> > ACPI_MEMORY_HOTPLUG, or is it just a coincidence that the
> > virt board happens to want both, and so we select both ?
> >
>
> From a purely code inspection point of view, I noticed that
> generic_event_device.c depends on CONFIG_ACPI_HW_REDUCED. The GED does use
> memory hotplug apis - for example acpi_ged_device_plug_cb() uses
> acpi_memory_plug_cb() etc.
>
> Hence, as it stands today, CONFIG_ACPI_HW_REDUCED will need to select ACPI
> memory hotplug. Unless we remove the GED device's dependence on
> ACPI_HW_REDUCED that is. I cannot comment whether that would be wise or if
> we should reorg the code in some other way.

The other question we should ask is whether arm platform requires
ACPI_MEMORY_HOTPLUG independent of ACPI_HW_REDUCED/GED device? If that is
the case, then maybe we should keep that config option as is.
Maybe @qemu-arm can answer that?

>
> > > On Thu, 12 Aug 2021, Ani Sinha wrote:
> > >
> > > > ACPI_MEMORY_HOTPLUG is implicitly turned on when ACPI_HW_REDUCED is selected.
> > > > ACPI_HW_REDUCED is already enabled. No need to turn on ACPI_MEMORY_HOTPLUG
> > > > explicitly. This is a minor cleanup.
> > > >
> > > > Signed-off-by: Ani Sinha <ani@anisinha.ca>
> > > > ---
> > > >  hw/arm/Kconfig | 1 -
> > > >  1 file changed, 1 deletion(-)
> > > >
> > > > diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> > > > index 4ba0aca067..38cf9f44e2 100644
> > > > --- a/hw/arm/Kconfig
> > > > +++ b/hw/arm/Kconfig
> > > > @@ -25,7 +25,6 @@ config ARM_VIRT
> > > >      select ACPI_PCI
> > > >      select MEM_DEVICE
> > > >      select DIMM
> > > > -    select ACPI_MEMORY_HOTPLUG
> > > >      select ACPI_HW_REDUCED
> > > >      select ACPI_NVDIMM
> > > >      select ACPI_APEI
> > > > --
> > > > 2.25.1
> > > >
> > > >
> >
> >
> > -- PMM
> >
>
