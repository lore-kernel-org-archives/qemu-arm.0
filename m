Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp4004039wrv;
        Mon, 5 Aug 2019 06:42:58 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwDeEcLokEmDyX2GP9QmsVZmdIXkk14qf6Zgexb4x0OzyjjUg7LsvodOlEGRld6WJRgVMsR
X-Received: by 2002:a17:906:19d3:: with SMTP id h19mr17033247ejd.300.1565012578051;
        Mon, 05 Aug 2019 06:42:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565012578; cv=none;
        d=google.com; s=arc-20160816;
        b=Cee066Vn26OBiGL/ew+0PqS8B8Hw8pLdfl+pf/TVjhDQhh+heb9+Pvu4Gjrzjf1clt
         o3Ocr77IgxCK5R4uovjktacq92E9sgAYuwP4Q8xrshhwyQ7r1byI4OZFrcxUU7h2mB67
         w89gKdhATQ9zYDkw4/79jQmmPY6x/3G75tl4M80DGfmpVZ7HRMwbWiDTuBLRio7I3Uf1
         +lniR5JbTVun7uD9nCVaF9AZspHirw5QEtP2x1z3iPB26ybWPL+UAvppCnZcp21DmFSD
         jKgSMjvm2ZD28OwoPNRZN2EvWLksMMYCUSswhKyRIUcin31DsjudZqoL9/RaJt1EOxrd
         YoOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=B05wnJyj1chi2fFWX1oj/Ms4Et6tx00K/F2SQ69Q/a0=;
        b=V0qRt/s7cvulnAsvobyqv7vCGwpEH48MS8j9Yi820TQEllkKX77QBpXVmxupawEEiJ
         lY3xX6KTg1ENLd66cGbUa25nQPV6IibcQvxITThhQSuyMw4fYGPjno/dLDXIahxcVYMk
         Tsy1NU2jZZZuJsNJYotk8dG7kg9jO/hU+nSsGyrZwboUv5hV9UIJ9Da4Q0b9E5JT4JDR
         eTwZlnuxv9rUXAHLkr8vyS7ze7LktdZYCW18AuteWlSgv2mplPoj5+cqKsBc+yuzxoDa
         dCR4y8JfBsOxIc9HEouMp0ZvYJkg4vxKSbJTrwk9zY/L6kpHJpiCus+l9iyw5ATNvdc0
         XlQA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=g7Twu7Wq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s41si19705785eda.207.2019.08.05.06.42.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 05 Aug 2019 06:42:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=g7Twu7Wq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hudGL-0007jt-41
	for alex.bennee@linaro.org; Mon, 05 Aug 2019 09:42:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57816)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hudGF-0007io-9A
 for qemu-arm@nongnu.org; Mon, 05 Aug 2019 09:42:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hudGE-0000Wp-5j
 for qemu-arm@nongnu.org; Mon, 05 Aug 2019 09:42:51 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:35467)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hudGD-0000VU-T1
 for qemu-arm@nongnu.org; Mon, 05 Aug 2019 09:42:50 -0400
Received: by mail-oi1-x243.google.com with SMTP id a127so61991901oii.2
 for <qemu-arm@nongnu.org>; Mon, 05 Aug 2019 06:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=B05wnJyj1chi2fFWX1oj/Ms4Et6tx00K/F2SQ69Q/a0=;
 b=g7Twu7Wq3JWKEudi1gjMwSQmz1i6CDmI0hqIsOWXQpyWYIE4xGtJ5CtkPWsRtaNHQy
 WnkPe4XKO/C6U6lfFM4YCbtNTJ2e3XbRf4br2USMFfPdYjE3Q23ZLivbkAhpzu/fxdUp
 vIc5CayJ3+cEnDUJeako1c+kz5FcEfhtf6t6sAfhR9PDyu3qwGtskUauHMZzJUccMjoD
 JC+ULivLU7+TG7tocw0SxJExmHMmswFur88mhMJWZO6AU0eJaFddRD0YoiNDSuBXu5st
 nIzwu0so3vNfoyEI4AfCEjqjWcZehXjIXKu2FnGAw4A4cAWjRPUQejCyZ94gk4HwmAO+
 Fcjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=B05wnJyj1chi2fFWX1oj/Ms4Et6tx00K/F2SQ69Q/a0=;
 b=tg+WHqZY70wY/ypC0o6L8ZEawIf3asgnp7LKvsxQtVYCm7fNWZuNHW7HyD0oTFZpzL
 wU8bQiknnAsKSOTz1yTmXE1ezXVSr/5TC+SwTLrDxA6EqVZE5t9gyEi1dOyPCIGApoN4
 Pk5vtlLp4O2iU4qg1IG8KWpwJkmJvF9aYIvikUAWp/KdQEsLUhLZXUXKOXvNMNuOX2+3
 J/R2vC9BgeIuv7ZXFx1xcM4/NhQTl7Fxs13qnrsnc0dV5IzQNYQ9ixNMnyLAj1g1ehig
 O/XJgzdofa5GVzSDavQM5dPlqSvedP7WJymQZ3kYdtqm3ksVgR2MgcBzRCzHb3yVEFhh
 mxqA==
X-Gm-Message-State: APjAAAUmqveCcF1TMPjk4rdRVqmtXNUn2oatLPtWHQIfAyza8JbCdIZu
 Ivmyek6l/DMk5VXA6Nzfg+pMGbniYm9Pedh/vbCMHQ==
X-Received: by 2002:aca:4bcc:: with SMTP id
 y195mr10299171oia.146.1565012568944; 
 Mon, 05 Aug 2019 06:42:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190726104519.23812-1-shameerali.kolothum.thodi@huawei.com>
 <20190726104519.23812-4-shameerali.kolothum.thodi@huawei.com>
 <20190730172524.6cf566ed@Igors-MacBook-Pro>
 <5FC3163CFD30C246ABAA99954A238FA83F33D896@lhreml524-mbs.china.huawei.com>
 <20190805153045.60db7bf5@redhat.com>
In-Reply-To: <20190805153045.60db7bf5@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 5 Aug 2019 14:42:38 +0100
Message-ID: <CAFEAcA-+z4t75VwfWG1ezJm=4zfdWH6nz1Oe75Zs953+vKMvdQ@mail.gmail.com>
To: Igor Mammedov <imammedo@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::243
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH-for-4.2 v8 3/9] hw/acpi: Add
 ACPI Generic Event Device Support
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
Cc: "sameo@linux.intel.com" <sameo@linux.intel.com>,
 "ard.biesheuvel@linaro.org" <ard.biesheuvel@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 Linuxarm <linuxarm@huawei.com>,
 "shannon.zhaosl@gmail.com" <shannon.zhaosl@gmail.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "xuwei \(O\)" <xuwei5@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "sebastien.boeuf@intel.com" <sebastien.boeuf@intel.com>,
 "lersek@redhat.com" <lersek@redhat.com>,
 "eric.auger@redhat.com" <eric.auger@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UgQFU6JnZoWn

On Mon, 5 Aug 2019 at 14:30, Igor Mammedov <imammedo@redhat.com> wrote:
>
> On Thu, 1 Aug 2019 08:36:33 +0000
> Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com> wrote:
>
> > Hi Igor,
> >
> > > -----Original Message-----
> > > > +static void acpi_ged_device_realize(DeviceState *dev, Error **errp)
> > > > +{
> > > > +    AcpiGedState *s = ACPI_GED(dev);
> > > > +
> > > > +    assert(s->ged_base);
> > > > +    acpi_ged_init(get_system_memory(), dev, &s->ged_state);
> > >
> > > calling get_system_memory() from device code used to be a reason for
> > > rejecting patch,
> > > I'm not sure what suggest though.
> > >
> > > Maybe Paolo could suggest something.
> >
> > How about using object_property_set_link()? Something like below.
> I'm afraid it doesn't help much. Issue here is that we are letting
> device to manage whole address space (which should be managed by machine)
> So I'd just keep get_system_memory() as is for now if there aren't any
> objections.

What are we trying to do with this device, and what does it need
the system memory region for?

In this case, we seem to do:

+static void acpi_ged_init(MemoryRegion *as, DeviceState *dev, GEDState *ged_st)
+{
+    AcpiGedState *s = ACPI_GED(dev);
+
+    memory_region_init_io(&ged_st->io, OBJECT(dev), &ged_ops, ged_st,
+                          TYPE_ACPI_GED, ACPI_GED_EVT_SEL_LEN);
+    memory_region_add_subregion(as, s->ged_base, &ged_st->io);
+    qdev_init_gpio_out_named(DEVICE(s), &s->irq, "ged-irq", 1);
+}


This is definitely a bad idea -- devices should not add their
own memory regions to the system memory MR. They should
expose their MRs (by being a sysbus-device) and let the board
code do the wiring up of the MRs into the right memory space
at the right address.

thanks
-- PMM
