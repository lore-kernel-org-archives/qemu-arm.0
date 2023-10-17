Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp4002934ejc;
        Tue, 17 Oct 2023 08:21:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHIEEknEWFhh5KP5B0RiRjj+czN+mWmMFIwO9gAnys7a1xtwyyO6Od9XIPK3W7eQgQdm8Iw
X-Received: by 2002:a05:622a:1713:b0:40f:4cfd:7158 with SMTP id h19-20020a05622a171300b0040f4cfd7158mr3283708qtk.27.1697556100573;
        Tue, 17 Oct 2023 08:21:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697556100; cv=none;
        d=google.com; s=arc-20160816;
        b=HryXhrbwtGjL3vqIZao9UuRKFrwSxvaQrIwDj1vBNm7V3llGy99/hVQ9m/Bg+sFrSI
         f5ZHmPUcYwfvPImyyE9R5GmdYBUiaQ/2nxAQHNIULxNFpWtODOq/+NqFuP6NF+ig3xGA
         bFFt7GupEXcAkUSjP5pmsgYOBYEnowDOvtko6I29FGXi2j1GG21pjc4ozT8EHtCOLyv4
         P/7E1U6fjjjBanucd1L8byaZCDCB7dw3v23cFEJVn0DFXHnewxyIld/i0b7o09dUOEjw
         Y62FeW5VO64mN7BobE408aUY3wRA7APy9H4K2JwkZypdRihsHId37iuu2jacfEbmw6xv
         57yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=XOsN61A9Uh+Yc1V+O1Q2QFWHt2VM8WfR7GpGRHmru24=;
        fh=lcEdZPBQohEiwT9CwNuFQ7+HN1jcOVix8Kht4EVbqhY=;
        b=tMYVp1p530H8vLm3OfoLUHNgdQemootr6fzrlhIgCGSnNCpfRag/fS4D4/98yK6olU
         5KCgMAB1RVQItWRqoOeFEe6GMPvWYDqBd8Gz4BLZb09v33l6jP2eMTqy5zoXyydutnrc
         w3w8Sy6tCqg7IGWMXU6TCOD/QvtfNX9fzs82Y7xlxTQPzi+WBXGtGSlyBxBpdZtm5yhh
         4Rmov+g+t3TAZ2HY6eFmgErH/Ki+y+nO8Sa+LkS54IKdjkPtjLOkfI0aPS9O+WmVgWcl
         pX7d8xaLzpnpyPCMiyO6b1PZ6W/2jNQzsf8uaHLZ6Du1z4KON62SSVQxP1rb/AV21X7d
         chag==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=G4k0L4IY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c22-20020ac87d96000000b00417a0a8c674si1228927qtd.225.2023.10.17.08.21.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Oct 2023 08:21:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=G4k0L4IY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qslst-0002je-De; Tue, 17 Oct 2023 11:21:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1qslss-0002jP-55
 for qemu-arm@nongnu.org; Tue, 17 Oct 2023 11:21:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1qslsq-0005hc-Kb
 for qemu-arm@nongnu.org; Tue, 17 Oct 2023 11:21:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697556084;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XOsN61A9Uh+Yc1V+O1Q2QFWHt2VM8WfR7GpGRHmru24=;
 b=G4k0L4IY9hfQSvxxXsmGHJaaaz+DMvXRivrqJG3fdJ1WWD35EIq3wnnkgYpcktdmRS8y7t
 adwsiYCC00hlCOOfUjcN1TbxA4g2zC/cY6TvrZ8Gjt5G/wIMksFz7gLKBGbL+SBft6/nYz
 ziJND29Iq3g83sr6wo2mjN5/krFBX/0=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-693-cAifY0-wPCC9DAvxIc5uog-1; Tue, 17 Oct 2023 11:21:20 -0400
X-MC-Unique: cAifY0-wPCC9DAvxIc5uog-1
Received: by mail-il1-f199.google.com with SMTP id
 e9e14a558f8ab-35798fe62b2so6565565ab.0
 for <qemu-arm@nongnu.org>; Tue, 17 Oct 2023 08:21:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697556079; x=1698160879;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dMAz18AKOENGkj8VyQD8a/V0CUA2HQraUfUmddK8y3Y=;
 b=Bt2+CqU+FKo1hW61XzHkS6uQBKKkbrrLA9J0SGGLe/EKrcA7WE0cV8su1dD8wT5RgX
 AqmOr4aynlO9NojB+saBmNXR/BxxqMDlhY5x3DfB+bp4p1EdNdj/Z19tRBXdx60+3Zk/
 978NzJBZ4hKKRbLnaDGbZyPrFnJosVPWM5d5ooPiK+NgAivZPyTMfas34Ihp1Chzd+V/
 RgRgkvFoxOn9Z3cBefyWqC3kNCzOh25Cj79ydUkzwdV4KKrHl2CPHm2mou0hOisVoDO4
 3XgqWoJQFXWCWFfv5/tG/3e1gQlvA9Re7rTOayEYny7wfGmWLqXKrlQrTMDlDn3+xKno
 LPOA==
X-Gm-Message-State: AOJu0YxCf3vBRPYxw7mJjGfUJ6U3yJORAYudUHPyH5kA6oRJvWI0kXbE
 6pwFU3Eg7chmKr1eik0p4wPDSRTWOg3ugxDbyN9rWkrTfESvRC+d4eto9lZTZ20NKkhLzzuugAo
 MbAiWpDmkBMIg
X-Received: by 2002:a05:6e02:1a0a:b0:351:4cdd:f533 with SMTP id
 s10-20020a056e021a0a00b003514cddf533mr2790216ild.4.1697556079446; 
 Tue, 17 Oct 2023 08:21:19 -0700 (PDT)
X-Received: by 2002:a05:6e02:1a0a:b0:351:4cdd:f533 with SMTP id
 s10-20020a056e021a0a00b003514cddf533mr2790201ild.4.1697556079212; 
 Tue, 17 Oct 2023 08:21:19 -0700 (PDT)
Received: from redhat.com ([38.15.60.12]) by smtp.gmail.com with ESMTPSA id
 w3-20020a029683000000b0043193487854sm568519jai.142.2023.10.17.08.21.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Oct 2023 08:21:18 -0700 (PDT)
Date: Tue, 17 Oct 2023 09:21:16 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Ankit Agrawal <ankita@nvidia.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>, "clg@redhat.com" <clg@redhat.com>,
 "shannon.zhaosl@gmail.com" <shannon.zhaosl@gmail.com>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>, "ani@anisinha.ca"
 <ani@anisinha.ca>, "berrange@redhat.com" <berrange@redhat.com>,
 "eduardo@habkost.net" <eduardo@habkost.net>, "imammedo@redhat.com"
 <imammedo@redhat.com>, "mst@redhat.com" <mst@redhat.com>,
 "eblake@redhat.com" <eblake@redhat.com>, "armbru@redhat.com"
 <armbru@redhat.com>, "david@redhat.com" <david@redhat.com>,
 "gshan@redhat.com" <gshan@redhat.com>, "Jonathan.Cameron@huawei.com"
 <Jonathan.Cameron@huawei.com>, Aniket Agashe <aniketa@nvidia.com>, Neo Jia
 <cjia@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>, "Tarun Gupta
 (SW-GPU)" <targupta@nvidia.com>, Vikram Sethi <vsethi@nvidia.com>, Andy
 Currid <acurrid@nvidia.com>, Dheeraj Nigam <dnigam@nvidia.com>, Uday Dhoke
 <udhoke@nvidia.com>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, <libvir-list@redhat.com>,
 Laine Stump <laine@redhat.com>
Subject: Re: [PATCH v2 3/3] qom: Link multiple numa nodes to device using a
 new object
Message-ID: <20231017092116.09ad2737.alex.williamson@redhat.com>
In-Reply-To: <BY5PR12MB3763CA80432643CE144C7A23B0D6A@BY5PR12MB3763.namprd12.prod.outlook.com>
References: <20231007201740.30335-1-ankita@nvidia.com>
 <20231007201740.30335-4-ankita@nvidia.com>
 <20231009151611.02175567.alex.williamson@redhat.com>
 <BY5PR12MB3763CA80432643CE144C7A23B0D6A@BY5PR12MB3763.namprd12.prod.outlook.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: w5pG0iqXYyiN

On Tue, 17 Oct 2023 14:00:54 +0000
Ankit Agrawal <ankita@nvidia.com> wrote:

> >>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -device vfio-pci-nohot=
plug,host=3D0009:01:00.0,bus=3Dpcie.0,addr=3D04.0,rombar=3D0,id=3Ddev0 \
> >>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -object nvidia-acpi-ge=
neric-initiator,id=3Dgi0,device=3Ddev0,numa-node-start=3D2,numa-node-count=
=3D8 =20
> >
> > Why didn't we just implement start and count in the base object (or a
> > list)? It seems like this gives the nvidia-acpi-generic-initiator two
> > different ways to set gi->node, either node=3D of the parent or
> > numa-node-start=3D here.=C2=A0 Once we expose the implicit node count i=
n the
> > base object, I'm not sure the purpose of this object.=C2=A0 I would hav=
e
> > thought it for keying the build of the NVIDIA specific _DSD, but that's
> > not implemented in this version. =20
>=20
> Agree, allowing a list of nodes to be provided to the acpi-generic-initia=
tor
> will remove the need for the nvidia-acpi-generic-initiator object.=20

And what happened to the _DSD?  Is it no longer needed?  Why?

> > I also don't see any programatic means for management tools to know how
> > many nodes to create.=C2=A0 For example what happens if there's a MIGv2=
 that
> > supports 16 partitions by default and makes use of the same vfio-pci
> > variant driver?=C2=A0 Thanks, =20
>=20
> It is supposed to stay at 8 for all the G+H devices. Maybe this can be ma=
naged
> through proper documentation in the user manual?

I thought the intention here was that a management tool would
automatically configure the VM with these nodes and GI object in
support of the device.  Planning only for Grace-Hopper isn't looking
too far into the future and it's difficult to make software that can
reference a user manual.  This leads to a higher maintenance burden
where the management tool needs to recognize not only the driver, but
the device bound to the driver and update as new devices are released.
The management tool will never automatically support new devices without
making an assumption about the node configuration.

Do we therefore need some programatic means for the kernel driver to
expose the node configuration to userspace?  What interfaces would
libvirt like to see here?  Is there an opportunity that this could
begin to define flavors or profiles for variant devices like we have
types for mdev devices where the node configuration would be
encompassed in a device profile?  Thanks,

Alex

