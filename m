Received: by 2002:a17:504:1b46:b0:1be9:327d:8ee3 with SMTP id t6csp1194519njh;
        Fri, 30 May 2025 07:49:25 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCWJnvngcMmlznu8XfbDWjOFCsCk8oZo/ID3/v6RqbmvIGzIlQFqmuv+lOLKAXC7W2aEstTxIFhK92yP6g==@linaro.org
X-Google-Smtp-Source: AGHT+IGTOEQjGwyiImVOnyn6NYZvHy1w9q5Rn7NxT2rOX1xfE/eSgqCUQ3T1B39p/lbQoKAz6Wxf
X-Received: by 2002:a05:6a20:939f:b0:1f5:7280:1cf2 with SMTP id adf61e73a8af0-21adff6bb42mr3686319637.12.1748616564901;
        Fri, 30 May 2025 07:49:24 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1748616564; cv=pass;
        d=google.com; s=arc-20240605;
        b=bGOwl4ho1d3WqMh2ulLGUT3F5hY3+KDCobVgVppbjER5dW8SKZ1iptPCR5I3cI/xWH
         7fD6iT/kbIWQdBYJu+ywXV0YtC46BuaTxeHrYLMGT4JxFiEhprhcbCPACYpn7PFvehPd
         MAGiCrcfWAo05nKT/XZRmXD61lUGeXR0E3f+G/LNx/D5d2TDSjlqdBOAkuFy0acyAHA2
         Cs758A/woncdEMT8JMbtDcSwj7rWbcqBxmaNeWfgqpWqwm24TzOQJJdPjZyRATWR9S0c
         ttgnMycYMX/2ABr9zRkXncLy014SlF/Q94sxfLZNSJyb97e8G08GVIKyqQsBQPUtGQ0I
         7RiQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=nqepNYXQjbf85ZLuzzTPOpz+hwwqGB6HGZsk6zu1D10=;
        fh=yVV4Zk1FLPUUj4CgIJSc/lyY51+rEjlPQYl/QdmgXKs=;
        b=YdnrcQZzNoK+PF613WkopRftuLzfDNwmc5D00fhtcIatg6yesU0rigB/x3Yd+8TqRX
         +A5fM/9SKsfDpGRdhhUGOK0ZucKn8HNNpPJAAOsD4RjIGuluxxNSOEcQKaOERJ7hEUvg
         UgUxnU4fW8mTEaEEtbOnCHJUUijM5Q02oV/lRX67LihdjpzaJRsfGnt+WkqYs9DYcijL
         739gvcJIinvb4b2tdKHj+HIE9h8iXw8YGz+i+IHvbvPnssHTiL3yCM/PI8gwNJnhKk1N
         2ATFxHi11IuhejKQ57MpszAGFCNZDDJt8G2P+WBcs+VRTBdA9nJ91rwsO5GwF5Te8jkr
         Ka9Q==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=E9gXIZ6G;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of linux-kernel+bounces-668387-alex.bennee=linaro.org@vger.kernel.org designates 147.75.48.161 as permitted sender) smtp.mailfrom="linux-kernel+bounces-668387-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <linux-kernel+bounces-668387-alex.bennee=linaro.org@vger.kernel.org>
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org. [147.75.48.161])
        by mx.google.com with ESMTPS id 41be03b00d2f7-b2ecebd4b08si2981243a12.283.2025.05.30.07.49.24
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 07:49:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-668387-alex.bennee=linaro.org@vger.kernel.org designates 147.75.48.161 as permitted sender) client-ip=147.75.48.161;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=E9gXIZ6G;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of linux-kernel+bounces-668387-alex.bennee=linaro.org@vger.kernel.org designates 147.75.48.161 as permitted sender) smtp.mailfrom="linux-kernel+bounces-668387-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1BBC77A6FA8
	for <alex.bennee@linaro.org>; Fri, 30 May 2025 14:48:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D18ED22D9E4;
	Fri, 30 May 2025 14:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="E9gXIZ6G"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8661823373D
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 14:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748616550; cv=none; b=blWTvxy7EhOAM5vVs62ksfIb6NUGt0A7u1mPc3mIvOqefUNKNZijWPZOG1kfWaKxtAc6cFLNEbETZR0wsLjcHdJ71voGc4T0gfvmTdjHgfmB5A9e/ABQPHNaybsD7T0dklaMacNk7c8sip/HNdxAfv/zn2kIoQ7U/4Sip5m11Q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748616550; c=relaxed/simple;
	bh=xCNfuyvxx6iLo5ulZx8nFYzeb8g6UcIsQlbE2N0TeMs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VwS/DI1UPCMM7i6tSCX2ZT3otJNK41oR0vp8AbhqUegG2DkI9dutuGCY7vZUawSh7fQPXHG5JmomH/ASu1HPlYiMDwAm4i6Ve/LNKE0qeSg8uifxC8XBdxhRfpQs+tlvEVLJX/EIQOglmqZL9R3LGhT/HvJ6jbvczRf4eeXKq98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=E9gXIZ6G; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748616547;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nqepNYXQjbf85ZLuzzTPOpz+hwwqGB6HGZsk6zu1D10=;
	b=E9gXIZ6GA5GQ6zC+sYvJKHbDROxGm+JtbsKLxncOCwi8ZqXlXDm+SSkBP1DTgFk+ERfGQ+
	k6rtVlfxKMkEqoV9EOZ5ebdAiBX+r3sZsGrgalaIQoPrGMOSrvq3uIXt/wmVGPkkCOm96k
	HuG7Hnoi7+gBOSo3Vsyf54DwhyH+s0k=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-578-CqSKCk_8P42nE_eFDwES0Q-1; Fri, 30 May 2025 10:49:06 -0400
X-MC-Unique: CqSKCk_8P42nE_eFDwES0Q-1
X-Mimecast-MFC-AGG-ID: CqSKCk_8P42nE_eFDwES0Q_1748616545
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-441c96c1977so14859235e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 07:49:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748616545; x=1749221345;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nqepNYXQjbf85ZLuzzTPOpz+hwwqGB6HGZsk6zu1D10=;
        b=o69ZFZrRyxXqhluuxIMBDmqN5BiZU0gVmzwGCXpds2zv13nnMRBPPfrcPAdaBwk0//
         t7+dIHzMjv/iyH+wz/Bi6+e66nRvkNkO3cvVpGGJ5vOCwv4VKJMDg6pU/RHz6nqGeRjk
         gPSTOxqq0wIS3/gjz65/UlLtw6kDeN3LuxZINwPXfNL16wGa6QkBAFbZyExpxMMEkRCn
         LyhEqoe+UbdbsIAn5RX53SNZsSEcwdUraMCTv/oSk1NQicoBCO5oDZFhKdljR036UAsv
         U/LywgthfZbs3t4616UPwkPc5Q4An2IbOZyX0b7iBO29gapJG1/LDK6RXCitepHQKw9w
         Najg==
X-Forwarded-Encrypted: i=1; AJvYcCXmanGs6kY5LLdq57xTDAk/7mbGYBQX2vh5V+zATPqEDccz+EeXtjqm7LvBPiQX2tjOueVHbytWYW3pnl8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfUEt6xJE9ZWblVvyK9eqS0CkvRjLqSx5/ggcfWK1EYJ7VDwn8
	MZTKkFXF2pA25ievFHU2G+mhUxUU6hPrz+a1ygqU/lBqtKjOf35GHLCh249+7lL9028yl8Bvwh2
	pfSfEaFHMR1+PECLFmFnu9VJ1yKQYfX1JMQ1l5QYSYLu7k1bcjfWkas7xraBUb+c8UQ==
X-Gm-Gg: ASbGnctyithZEYM2N8ppEcfdk5blsztCQdyEbt4qULO9QDBrJ3ubkSRvu86ovDLKQ11
	0noK1TwepDahE0xKGsafM24ra4uaeYx27phT/H4W2rq/QIt8FFFMQV0M1MpMxE451Y1fB0sF8m+
	94uidisgvLQ//Mpi8DwdAcVmj9sMMKqdpIvlEK1F05YgZEtTxxb5Xmllp8F6ttt7/cXkB2vL/WM
	Woa5hoGW1uJWFAp/9FP/XvgAS5OBi9y8WBXdi4KqxxKG6RP7v7roLO58pp144lXERTMlMJ8nPn1
	zdro3FEEtLa/SwpEDeNZ6OkSq9pSRzIA
X-Received: by 2002:a05:600c:45cc:b0:44d:a244:4983 with SMTP id 5b1f17b1804b1-450d87fd9bemr29521665e9.3.1748616544760;
        Fri, 30 May 2025 07:49:04 -0700 (PDT)
X-Received: by 2002:a05:600c:45cc:b0:44d:a244:4983 with SMTP id 5b1f17b1804b1-450d87fd9bemr29521355e9.3.1748616544335;
        Fri, 30 May 2025 07:49:04 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com ([85.93.96.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d7fb051bsm19991885e9.18.2025.05.30.07.49.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 07:49:03 -0700 (PDT)
Date: Fri, 30 May 2025 16:49:03 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Jonathan Cameron
 <Jonathan.Cameron@huawei.com>, Shiju Jose <shiju.jose@huawei.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, Philippe =?UTF-8?B?TWF0aGll?=
 =?UTF-8?B?dS1EYXVkw6k=?= <philmd@linaro.org>, Ani Sinha
 <anisinha@redhat.com>, Eduardo Habkost <eduardo@habkost.net>, Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>, Peter Maydell
 <peter.maydell@linaro.org>, Shannon Zhao <shannon.zhaosl@gmail.com>, Yanan
 Wang <wangyanan55@huawei.com>, Zhao Liu <zhao1.liu@intel.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 12/20] acpi/generic_event_device: add logic to detect
 if HEST addr is available
Message-ID: <20250530164903.0f9f8444@imammedo.users.ipa.redhat.com>
In-Reply-To: <20250530080120-mutt-send-email-mst@kernel.org>
References: <cover.1747722973.git.mchehab+huawei@kernel.org>
	<aa74b756f633dbee5442cf4baa2c1d81a669d2f9.1747722973.git.mchehab+huawei@kernel.org>
	<20250528174212.2823d3de@imammedo.users.ipa.redhat.com>
	<20250530080120-mutt-send-email-mst@kernel.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: X54YEsJ1ril9

On Fri, 30 May 2025 08:01:28 -0400
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Wed, May 28, 2025 at 05:42:12PM +0200, Igor Mammedov wrote:
> > On Tue, 20 May 2025 08:41:31 +0200
> > Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> >   
> > > Create a new property (x-has-hest-addr) and use it to detect if
> > > the GHES table offsets can be calculated from the HEST address
> > > (qemu 10.0 and upper) or via the legacy way via an offset obtained
> > > from the hardware_errors firmware file.  
> > 
> > 
> > it doesn't apply to current master anymore  
> 
> indeed. Mauro?

Michael,
it's trivial conflict in machine compat,
could you fix it up while applying?

we have another series in queue that depends on this one being in merged. 

> 
> >   
> > > 
> > > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > > Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> > > Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> > > ---
> > >  hw/acpi/generic_event_device.c |  2 ++
> > >  hw/arm/virt-acpi-build.c       | 18 ++++++++++++++++--
> > >  hw/core/machine.c              |  5 ++++-
> > >  3 files changed, 22 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
> > > index d292f61b4e41..3cf9dab0d01a 100644
> > > --- a/hw/acpi/generic_event_device.c
> > > +++ b/hw/acpi/generic_event_device.c
> > > @@ -318,6 +318,8 @@ static void acpi_ged_send_event(AcpiDeviceIf *adev, AcpiEventStatusBits ev)
> > >  
> > >  static const Property acpi_ged_properties[] = {
> > >      DEFINE_PROP_UINT32("ged-event", AcpiGedState, ged_event_bitmap, 0),
> > > +    DEFINE_PROP_BOOL("x-has-hest-addr", AcpiGedState,
> > > +                     ghes_state.use_hest_addr, false),
> > >  };
> > >  
> > >  static const VMStateDescription vmstate_memhp_state = {
> > > diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> > > index da3ebf403ef9..3126234e657d 100644
> > > --- a/hw/arm/virt-acpi-build.c
> > > +++ b/hw/arm/virt-acpi-build.c
> > > @@ -893,6 +893,10 @@ static const AcpiNotificationSourceId hest_ghes_notify[] = {
> > >      { ACPI_HEST_SRC_ID_SYNC, ACPI_GHES_NOTIFY_SEA },
> > >  };
> > >  
> > > +static const AcpiNotificationSourceId hest_ghes_notify_10_0[] = {
> > > +    { ACPI_HEST_SRC_ID_SYNC, ACPI_GHES_NOTIFY_SEA },
> > > +};
> > > +
> > >  static
> > >  void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
> > >  {
> > > @@ -947,15 +951,25 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
> > >  
> > >      if (vms->ras) {
> > >          AcpiGedState *acpi_ged_state;
> > > +        static const AcpiNotificationSourceId *notify;
> > > +        unsigned int notify_sz;
> > >          AcpiGhesState *ags;
> > >  
> > >          acpi_ged_state = ACPI_GED(vms->acpi_dev);
> > >          ags = &acpi_ged_state->ghes_state;
> > >          if (ags) {
> > >              acpi_add_table(table_offsets, tables_blob);
> > > +
> > > +            if (!ags->use_hest_addr) {
> > > +                notify = hest_ghes_notify_10_0;
> > > +                notify_sz = ARRAY_SIZE(hest_ghes_notify_10_0);
> > > +            } else {
> > > +                notify = hest_ghes_notify;
> > > +                notify_sz = ARRAY_SIZE(hest_ghes_notify);
> > > +            }
> > > +
> > >              acpi_build_hest(ags, tables_blob, tables->hardware_errors,
> > > -                            tables->linker, hest_ghes_notify,
> > > -                            ARRAY_SIZE(hest_ghes_notify),
> > > +                            tables->linker, notify, notify_sz,
> > >                              vms->oem_id, vms->oem_table_id);
> > >          }
> > >      }
> > > diff --git a/hw/core/machine.c b/hw/core/machine.c
> > > index b8ae155dfa11..dfd36cf063c7 100644
> > > --- a/hw/core/machine.c
> > > +++ b/hw/core/machine.c
> > > @@ -35,9 +35,12 @@
> > >  #include "hw/virtio/virtio-pci.h"
> > >  #include "hw/virtio/virtio-net.h"
> > >  #include "hw/virtio/virtio-iommu.h"
> > > +#include "hw/acpi/generic_event_device.h"
> > >  #include "audio/audio.h"
> > >  
> > > -GlobalProperty hw_compat_10_0[] = {};
> > > +GlobalProperty hw_compat_10_0[] = {
> > > +    { TYPE_ACPI_GED, "x-has-hest-addr", "false" },
> > > +};
> > >  const size_t hw_compat_10_0_len = G_N_ELEMENTS(hw_compat_10_0);
> > >  
> > >  GlobalProperty hw_compat_9_2[] = {  
> 

