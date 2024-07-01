Received: by 2002:a17:504:7599:b0:1be7:c013:c773 with SMTP id j25csp1228305njm;
        Mon, 1 Jul 2024 01:48:51 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUXYxkVXd+LPyhklJFUKgmqYdCBBQFL7/6mZyoYl0N6wWD84rjavpW0lR3mcRfIddivJz4q0bv4+Z92JuqY59Doqxn5l1iE
X-Google-Smtp-Source: AGHT+IHq0J+zH3vYh6lkR5JK30/A4YCxuZdkYsAtv7Llsz/JSQle0OBKe3z97GH5p1zF45Od7gfj
X-Received: by 2002:ac8:7f51:0:b0:446:5368:cce4 with SMTP id d75a77b69052e-44662e6a372mr73673801cf.48.1719823730974;
        Mon, 01 Jul 2024 01:48:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719823730; cv=none;
        d=google.com; s=arc-20160816;
        b=FZIz72x9uAGn+UAGmNbWwfN+gt1htBuJJsgat/PENXo/3ulNuVZbISHzw7i4dw6als
         QYgM6BA3YOByWO9RHuzujZggt6HeNapvTc0uDwMVChFUGsOCanYu3utiSTMjHRyan5+x
         0440/rzwvEMc8IqhDmMw+429zjb1hv3cqSbiR4YHoDEDcjafHox31wrVxD1SFT5ibij/
         T2fwjYH5J3FTcpwTldOb5YxQL+0J4w1tlkLb8rMKPsdp4leoX1jl5aSadnNDClGZpBrP
         Lo1SyXto+LSbkcf7W1kSWvGEpG+XN3m+4VjWUvoOjxo8U5Tc/WvybHX8dJrjASv5Ijnw
         EbZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=H833kYXzoMIHWuDdONhAoenWOEXps9SFHFxpxaDLJJw=;
        fh=e1hMVu9AHPqMYEsS5s9YUf5u6H9XQ85v6am62OkU9T0=;
        b=L+xRUKLpUaeeDLyjFWhLCY7vaDPLLsq57J2mvcto3/qXiZ08g2Hvy2UrL4fFbbWKOU
         6PK00XL8kC/LPvqCZdb+wX/SQakQbYRNa9uYbFJHxsz0iAZ6Yzp/JAFfcf1gb//yuBbv
         9JzN0EUy40AQWvyydsO/FxwjcRjx1iixeWz4JhHsrsypW96NgRSoksSzbe5mYRQtPmO2
         SdTnkgaOD8R9q3x2iFg5ltxpQj2XD81Q+DM4A3p9dY2HhQG45YcTChhfGMnUzKNoetdJ
         UZvAeJuwIh3ZoG0Xou9fei1MNdpTNB1wY5CJvyCw9l5Fw45xPYum2j20L0+HSfxB+HFW
         XyNA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Zg8Zg3Gb;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <imammedo@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id d75a77b69052e-446514e3ed2si75928521cf.744.2024.07.01.01.48.50
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 01:48:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Zg8Zg3Gb;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719823730;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H833kYXzoMIHWuDdONhAoenWOEXps9SFHFxpxaDLJJw=;
	b=Zg8Zg3GbMXYRG8w8c624LB0pVTgrZVaX/8zp7qJ9jELHoeHhaqXt2yojGdP/hFfLdpoG9D
	bmQZxU+53EOFVac37FCIR8PPCFPtdveRARf2REP5u08wm8NMej3XPvxpAj7XBHD7dCImGL
	m84eObrZLPTILmp53Qz4s2WrsGBQmpM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-626-aVw_rL1HPD-_SVWTHdxB7Q-1; Mon, 01 Jul 2024 04:48:49 -0400
X-MC-Unique: aVw_rL1HPD-_SVWTHdxB7Q-1
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3673ce44f3eso1914386f8f.2
        for <alex.bennee@linaro.org>; Mon, 01 Jul 2024 01:48:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719823728; x=1720428528;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tGULnVzcpI8jzaIWqxlHtEMGdelK1jaDjxgMatjjCug=;
        b=sFP0a+Y71kI2uET8ukfnwzeakLFL4xubnuJikkRAo8k7FwoUFo7vIjt/FW1KQ/Dt8c
         eVmoUAGPwf2GFAT+TK902OZlz/eM+jDs070kC/23XesGSuiymykKUu6v4btGpJh6C6ju
         386EnpDMjBRXj/qjbZf1JkSoCJvveZ7bnKvSrs24kJDYHhfe2ihAA9+Up6tlL1sxkx9f
         aqvwtD0CYLKm//dCm0yYU+47kcxgTFPxkC8BvQJf2Sdt+4ANlIH4NNECuncsHwz8reKk
         DNYJY5r7O3BFfwfLqAmOr38CqJkGIoixOotVF9CaxJddfBnBBCnvY58oQR3blxpBe7kH
         bP+g==
X-Forwarded-Encrypted: i=1; AJvYcCWgUWL4q1CSISvQSIr1Jvb9cPp5AuHY6f7ml2xoRcsQ3RUyML7zymO7A+bX6rZkLz5gd45TntT3RFUePgpprstHZ1EtRn1X
X-Gm-Message-State: AOJu0YzRYhRog+60vIC7hxuqpwrFwxkTLqWwYPDBLIYxYQ6YAVmhYHlB
	pZn7K9sgocVvQMGNyTecJ8EyN5Txm1bba4TT+6qiMkD6Y3gomLP3u7Z4ccJjv1OI1uzjy2UEUAe
	ezMJStohPjGEC9Pc7LBEwhs4eFK71zoNG4WDIFd0OmwlxcjX57Ipsew==
X-Received: by 2002:adf:ea4d:0:b0:362:ed39:c1e6 with SMTP id ffacd0b85a97d-36775730a4amr3370348f8f.62.1719823728423;
        Mon, 01 Jul 2024 01:48:48 -0700 (PDT)
X-Received: by 2002:adf:ea4d:0:b0:362:ed39:c1e6 with SMTP id ffacd0b85a97d-36775730a4amr3370333f8f.62.1719823728038;
        Mon, 01 Jul 2024 01:48:48 -0700 (PDT)
Return-Path: <imammedo@redhat.com>
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a0d90casm9318235f8f.32.2024.07.01.01.48.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 01:48:47 -0700 (PDT)
Date: Mon, 1 Jul 2024 10:48:44 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Salil Mehta <salil.mehta@huawei.com>
Cc: Gavin Shan <gshan@redhat.com>, Salil Mehta <salil.mehta@opnsrc.net>,
 "Michael S. Tsirkin" <mst@redhat.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "maz@kernel.org" <maz@kernel.org>, "jean-philippe@linaro.org"
 <jean-philippe@linaro.org>, Jonathan Cameron <jonathan.cameron@huawei.com>,
 "lpieralisi@kernel.org" <lpieralisi@kernel.org>, "peter.maydell@linaro.org"
 <peter.maydell@linaro.org>, "richard.henderson@linaro.org"
 <richard.henderson@linaro.org>, "andrew.jones@linux.dev"
 <andrew.jones@linux.dev>, "david@redhat.com" <david@redhat.com>,
 "philmd@linaro.org" <philmd@linaro.org>, "eric.auger@redhat.com"
 <eric.auger@redhat.com>, "oliver.upton@linux.dev" <oliver.upton@linux.dev>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>, "will@kernel.org"
 <will@kernel.org>, "rafael@kernel.org" <rafael@kernel.org>,
 "alex.bennee@linaro.org" <alex.bennee@linaro.org>, "linux@armlinux.org.uk"
 <linux@armlinux.org.uk>, "darren@os.amperecomputing.com"
 <darren@os.amperecomputing.com>, "ilkka@os.amperecomputing.com"
 <ilkka@os.amperecomputing.com>, "vishnu@os.amperecomputing.com"
 <vishnu@os.amperecomputing.com>, "karl.heubaum@oracle.com"
 <karl.heubaum@oracle.com>, "miguel.luis@oracle.com"
 <miguel.luis@oracle.com>, zhukeqian <zhukeqian1@huawei.com>, "wangxiongfeng
 (C)" <wangxiongfeng2@huawei.com>, "wangyanan (Y)" <wangyanan55@huawei.com>,
 "jiakernel2@gmail.com" <jiakernel2@gmail.com>, "maobibo@loongson.cn"
 <maobibo@loongson.cn>, "lixianglai@loongson.cn" <lixianglai@loongson.cn>,
 "npiggin@gmail.com" <npiggin@gmail.com>, "harshpb@linux.ibm.com"
 <harshpb@linux.ibm.com>, Linuxarm <linuxarm@huawei.com>
Subject: Re: [PATCH V12 0/8] Add architecture agnostic code to support vCPU
 Hotplug
Message-ID: <20240701104844.32e0207b@imammedo.users.ipa.redhat.com>
In-Reply-To: <eb5880984ddf41aabca9d036e7ad445f@huawei.com>
References: <20240529234241.205053-1-salil.mehta@huawei.com>
	<20240602180241-mutt-send-email-mst@kernel.org>
	<20240605160327.3c71f4ab@imammedo.users.ipa.redhat.com>
	<CAJ7pxeYehVhPWfbEqRMMSCVHk31JQhtQhRSM_4e1WqBhqv0UHQ@mail.gmail.com>
	<b36e0d64-9653-4d48-b72a-00a1aee86629@redhat.com>
	<eb5880984ddf41aabca9d036e7ad445f@huawei.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.42; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TUID: m92Ru6mlCwrm

On Wed, 26 Jun 2024 17:53:52 +0000
Salil Mehta <salil.mehta@huawei.com> wrote:

> Hi Gavin,
>=20
> >  From: Gavin Shan <gshan@redhat.com>
> >  Sent: Wednesday, June 26, 2024 5:13 AM
> >  To: Salil Mehta <salil.mehta@opnsrc.net>; Igor Mammedov
> >  <imammedo@redhat.com>
> > =20
> >  Hi Salil and Igor,
> > =20
> >  On 6/26/24 9:51 AM, Salil Mehta wrote: =20
> >  > On Wed, Jun 5, 2024 at 3:03=E2=80=AFPM Igor Mammedov =20
> >  <imammedo@redhat.com <mailto:imammedo@redhat.com>> wrote: =20
> >  >     On Sun, 2 Jun 2024 18:03:05 -0400
> >  >     "Michael S. Tsirkin" <mst@redhat.com <mailto:mst@redhat.com>> =
=20
> >  wrote: =20
> >  > =20
> >  >      > On Thu, May 30, 2024 at 12:42:33AM +0100, Salil Mehta wrote: =
=20
> >  >      > > Virtual CPU hotplug support is being added across various a=
rchitectures[1][3].
> >  >      > > This series adds various code bits common across all archit=
ectures:
> >  >      > >
> >  >      > > 1. vCPU creation and Parking code refactor [Patch 1]
> >  >      > > 2. Update ACPI GED framework to support vCPU Hotplug [Patch=
 2,3]
> >  >      > > 3. ACPI CPUs AML code change [Patch 4,5]
> >  >      > > 4. Helper functions to support unrealization of CPU objects=
 [Patch  6,7]
> >  >      > > 5. Docs [Patch 8]
> >  >      > >
> >  >      > >
> >  >      > > Repository:
> >  >      > >
> >  >      > > [*] https://github.com/salil-mehta/qemu.git   <https://gith=
ub.com/salil-mehta/qemu.git> virt-cpuhp-armv8/rfc- v3.arch.agnostic.v12
> >  >      > >
> >  >      > > NOTE: This series is meant to work in conjunction with Arch=
itecture specific patch-set.
> >  >      > > For ARM, this will work in combination of the architecture =
specific part based on
> >  >      > > RFC V2 [1]. This architecture specific patch-set RFC V3 sha=
ll be floated soon and is
> >  >      > > present at below location
> >  >      > >
> >  >      > > [*] https://github.com/salil-mehta/qemu/tree/virt-cpuhp-arm=
v8/rfc-v3-rc1 <https://github.com/salil-mehta/qemu/tree/virt-cpuhp-armv8/rf=
c-v3-rc1>
> >  >      > > =20
> >  >      >
> >  >      >
> >  >      > Igor plan to take a look? =20
> >  >
> >  >     Yep, I plan to review it
> >  >
> >  >
> >  > A gentle reminder on this.
> >  > =20
> > =20
> >  Since the latest revision for this series is v13, so I guess Igor need=
s to do the
> >  final screening on v13 instead?
> > =20
> >  v13: https://lists.nongnu.org/archive/html/qemu-arm/2024-06/msg00129.h=
tml =20
>=20
>=20
> Yes, thanks for pointing this. =F0=9F=98=8A

I have v13 tagged,
Sorry for delay, I'll try to review it this week

>=20
>=20
> > =20
> >  Thanks,
> >  Gavin
> >   =20
>=20
