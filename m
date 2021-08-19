Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp325296lfg;
        Thu, 19 Aug 2021 06:26:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw8R+zWv3VpmMmX9Jt99mq2n0flLeAnmxbw3YHkv4jInfA19GNsBUr2aw6Mio6DRBQ/kcld
X-Received: by 2002:a05:600c:3793:: with SMTP id o19mr13782642wmr.53.1629379564347;
        Thu, 19 Aug 2021 06:26:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629379564; cv=none;
        d=google.com; s=arc-20160816;
        b=J0gLtJQku/qI8rSqXFZ8gBhn6eUw0P/v1+ZrOsvpb43XBTj6oWSJP1OzEfWVg0BaXr
         DTjeDHqW3BIBkfokyKLAW8oYPoJDoGEyFYO0AuKFNuXfwOOKpJdIHQ0+XHFuR33F0Y7n
         UWkiFm43VvvIP3H0T+YBtJcUPlBCQ6KEs4TLyR+iuq1mBPjnnz9CQAgjejXHkNY31aSJ
         QcwGibTrqKdznOv8k4BC8F3bf9fxoVgQrPU2Pnyph0A2NLcwtnE4Omxha0OZTtLAFEwi
         wQkhuy6ltHmRdZEk5huyfwAbgk5fSEdlNXyLcNhvd72FdN58qxi8jzfEJYbexaMk5pmi
         HDkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :references:message-id:in-reply-to:subject:to:date:from
         :dkim-signature;
        bh=ZCeCNT6c52N3U/15IMWRqEXyIbZHw6KHnbku1vyRCZI=;
        b=XEUQnoEuHgOkdvHelwFN6hUrnpU+S1KpCC95zr+lw/qlRDvQoVe3pM8SmE47/u+DxR
         6pUyVxYLMWbhB9wN+h+f5W/clebwXv0aX1ckS5ihO93eLgbYWEb6tzvXFRlQciJVtPWa
         XvA04ZO2YsjPZhCXZpeRLB90vnggIOveGtNItrdGQcFngySquYDNkB7uB+q3aLe9TFtE
         7fxznWrYwkm3W3VW00WIrn0tQ3SHOqFa+/ebhdmoH8CnmJkWmLmF2ujYwkcEvI0f3PoG
         obmpoLb0hmWbYDdIZkoSEgRd/D09DwpYXJJk8D8ZVW4dzAiCsEKundLFMGHXRWX6/R3c
         VOKg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@anisinha-ca.20150623.gappssmtp.com header.s=20150623 header.b=lXg3yqJr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k1si3171699wrm.413.2021.08.19.06.26.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Aug 2021 06:26:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@anisinha-ca.20150623.gappssmtp.com header.s=20150623 header.b=lXg3yqJr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:33026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mGi3X-00013t-Fx
	for alex.bennee@linaro.org; Thu, 19 Aug 2021 09:26:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mGi3N-00012v-4s
 for qemu-arm@nongnu.org; Thu, 19 Aug 2021 09:25:53 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:38577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mGi3K-0000It-Rj
 for qemu-arm@nongnu.org; Thu, 19 Aug 2021 09:25:52 -0400
Received: by mail-pl1-x62e.google.com with SMTP id a5so3911755plh.5
 for <qemu-arm@nongnu.org>; Thu, 19 Aug 2021 06:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20150623.gappssmtp.com; s=20150623;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=ZCeCNT6c52N3U/15IMWRqEXyIbZHw6KHnbku1vyRCZI=;
 b=lXg3yqJrnGPYGw0nbQwvQVXE6gnKry7VZU8QVwgLNfvWPS4A56AMHMAR8jiVH9HDxA
 Y46dOlSTIh249fOmL6k93k4V9Ysnfuf2qC+T7Nf+rrg+Q1q7RNHQK6mWzMr3C6Squ4oq
 h5b+weX7dBATI4maNG70qUyiLpidTpoi4r1TyWDPT3AbK6XUSMv5CidFnn5tqhax5zGy
 Kb4QPYMOl6J5rWefibPlxQpo4n9LKn7d+lIYDM25aiIwk7zq5KW9UR3ZwYMPS9pqjsfc
 jpbtXR6PwQYX0T+JjZ5U64W84cd/TLc/PSxW88FuV89l0RLhi+89XXZcoUQLNrUyDM1t
 SGsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=ZCeCNT6c52N3U/15IMWRqEXyIbZHw6KHnbku1vyRCZI=;
 b=NpIAmgjVdgtbnjmmWHMaNLVBHyY74rmFqYZXqO66RnsLg/wbhQi3Fme/3JI6AAko5K
 XoDtrijOnkxZCNMwgvt554DMqYsbTx7wEWRlZGtm3p4+RV2yS0tsPduIb4ljpvs3LihR
 BOPCoAMMd04bZ2WAIVfGN4xDSHf6V9eNHr4r6RVhQ2EgcO2SYQJCtpk+9gNl/f7jOzem
 W7rxbTIy2i7iECQTomt0svcdNlL+h0e+ATd6BuNVdLLdIsdAR1dlzp6cGjJaYjQ3U60+
 E6+onkM8PnvKFQPeG8mO0h2TiCE+/yMkEE+/OflErwABHDGrEHM1ypqc9mLhRjsUNx5L
 xWYg==
X-Gm-Message-State: AOAM530UX8dsK1qpIel9qUR0HHS1u5tWj4kEIkxgD1vxZiDLrJwQkEUu
 Cj2k/goOxLtwmJa1fzCouZh/+A==
X-Received: by 2002:a17:90a:b702:: with SMTP id
 l2mr6705019pjr.71.1629379549103; 
 Thu, 19 Aug 2021 06:25:49 -0700 (PDT)
Received: from anisinha-lenovo ([203.163.234.32])
 by smtp.googlemail.com with ESMTPSA id v20sm4327632pgi.39.2021.08.19.06.25.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 06:25:48 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Thu, 19 Aug 2021 18:55:32 +0530 (IST)
X-X-Sender: anisinha@anisinha-lenovo
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] hw/arm/Kconfig: no need to enable ACPI_MEMORY_HOTPLUG
 explicitly
In-Reply-To: <CAFEAcA8Fu+mkzFi9JdTtbqMcnnV74Swk04xx2a1G4L_oATY2eQ@mail.gmail.com>
Message-ID: <alpine.DEB.2.22.394.2108191849260.417749@anisinha-lenovo>
References: <20210812033405.362985-1-ani@anisinha.ca>
 <alpine.DEB.2.22.394.2108171014500.202364@anisinha-lenovo>
 <CAFEAcA8Fu+mkzFi9JdTtbqMcnnV74Swk04xx2a1G4L_oATY2eQ@mail.gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: none client-ip=2607:f8b0:4864:20::62e;
 envelope-from=ani@anisinha.ca; helo=mail-pl1-x62e.google.com
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Ani Sinha <ani@anisinha.ca>, Igor Mammedov <imammedo@redhat.com>,
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Wzi1CB3FH0FG



On Thu, 19 Aug 2021, Peter Maydell wrote:

> On Tue, 17 Aug 2021 at 05:45, Ani Sinha <ani@anisinha.ca> wrote:
> >
> > ping ...
>
> You didn't cc any of the ACPI maintainers; I have done so.
>

oops! my bad. I used checkpatch and did not verify if Igor/Michael was
cc'd.

> Is it intended that ACPI_HW_REDUCED must always imply
> ACPI_MEMORY_HOTPLUG, or is it just a coincidence that the
> virt board happens to want both, and so we select both ?
>

From a purely code inspection point of view, I noticed that
generic_event_device.c depends on CONFIG_ACPI_HW_REDUCED. The GED does use
memory hotplug apis - for example acpi_ged_device_plug_cb() uses
acpi_memory_plug_cb() etc.

Hence, as it stands today, CONFIG_ACPI_HW_REDUCED will need to select ACPI
memory hotplug. Unless we remove the GED device's dependence on
ACPI_HW_REDUCED that is. I cannot comment whether that would be wise or if
we should reorg the code in some other way.


> > On Thu, 12 Aug 2021, Ani Sinha wrote:
> >
> > > ACPI_MEMORY_HOTPLUG is implicitly turned on when ACPI_HW_REDUCED is selected.
> > > ACPI_HW_REDUCED is already enabled. No need to turn on ACPI_MEMORY_HOTPLUG
> > > explicitly. This is a minor cleanup.
> > >
> > > Signed-off-by: Ani Sinha <ani@anisinha.ca>
> > > ---
> > >  hw/arm/Kconfig | 1 -
> > >  1 file changed, 1 deletion(-)
> > >
> > > diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> > > index 4ba0aca067..38cf9f44e2 100644
> > > --- a/hw/arm/Kconfig
> > > +++ b/hw/arm/Kconfig
> > > @@ -25,7 +25,6 @@ config ARM_VIRT
> > >      select ACPI_PCI
> > >      select MEM_DEVICE
> > >      select DIMM
> > > -    select ACPI_MEMORY_HOTPLUG
> > >      select ACPI_HW_REDUCED
> > >      select ACPI_NVDIMM
> > >      select ACPI_APEI
> > > --
> > > 2.25.1
> > >
> > >
>
>
> -- PMM
>
