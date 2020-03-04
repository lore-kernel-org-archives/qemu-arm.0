Received: by 2002:ac2:4942:0:0:0:0:0 with SMTP id o2csp1488365lfi;
        Wed, 4 Mar 2020 03:15:09 -0800 (PST)
X-Google-Smtp-Source: ADFU+vvj7tzAFm8xppvjRH5b2SqBS3Kb31ItXosTzBbg4HJNpayDQXhROLl1UUKMnTBwS5rOoxu5
X-Received: by 2002:a05:620a:2118:: with SMTP id l24mr2229726qkl.383.1583320509723;
        Wed, 04 Mar 2020 03:15:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583320509; cv=none;
        d=google.com; s=arc-20160816;
        b=n+VLyISu1IpnOOdAKPzzMPPUPh6UtMS11WFYycYULBvnQbfWezXIuw2J1k0SIJVngF
         2jerZeF6XbXtgML8+MuiC5MQxuV65tkzEEwz8Z9XgRQO86wAEC7Ez008O8gh4RPL7NFz
         lXoGVZ5qsVT0f7gCajbt+u6i40yvNVRnJYFqWJKqBrd5WijO8KBzHHMFMEIvXqdsEq7Z
         Adul99mRwZGGLU7t7X+yRqttIfBw93DxIoKhOECu57rfvKjMv1S7w7llS2u0v4CIVb4Q
         lfXPgrrrgU4lHXCxUqyA50GSJodsA+kL66Jlu6g6qPoFBge6tuxP5drxVOg0YSrRn0tw
         wT9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=HSK98NP1FXKbRshKg14Z6I9R093MnlZSyFArmEQhph8=;
        b=GyjzIpkdq02YW97sRqf9DPcjH4mSCCvi0WSQaxErqfQtz+t3znYeIqK02YCmnlDPvz
         m6Zin4q9CoUIyijsH7/t3hMcxKkcXg60X/sregeyikfHofGJY2MshazlJ4KjrYsvt/hL
         MZ34VXGjT2fXt6w6fUEZYEFXKf4laIa+/XFBpU+HH8DPCvKBiyp0ZSHdPF6TRzH5L3hn
         UXVZNWH9Y20/6ihhPTeeaA0l7v4JwCHPagUKI2HeuKefxTJkV6ptewbHAZNZP4x0ig5a
         yN9TF1oJ2snHEoMUmbVjmcjNVF9cZ2h08IJqNNbTUi4EUrYxdLtRsMGFbT4u+xMbjfRi
         MqXw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ikcmFJVk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g8si748975qto.369.2020.03.04.03.15.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Mar 2020 03:15:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ikcmFJVk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:32770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j9RzZ-0004nr-4l
	for alex.bennee@linaro.org; Wed, 04 Mar 2020 06:15:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39257)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1j9RzQ-0004mQ-Nn
 for qemu-arm@nongnu.org; Wed, 04 Mar 2020 06:15:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1j9RzP-0005qk-J0
 for qemu-arm@nongnu.org; Wed, 04 Mar 2020 06:15:00 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:23935
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1j9RzP-0005oP-43
 for qemu-arm@nongnu.org; Wed, 04 Mar 2020 06:14:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583320498;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HSK98NP1FXKbRshKg14Z6I9R093MnlZSyFArmEQhph8=;
 b=ikcmFJVk8c+t1XLwYTuoWhXK3yE7ptuSJpAY3N91kw+8YtdgXACsPPjSesUyRlsGNWnrz0
 2Zj+a9RmYmeXFDYoHk+HEjS5vOxRY44EctcT6OePAM1WkDLiHrMgnXgPt9Rfvtetc6zi9j
 BTf1S4Ox77OJOY0/Bz7TeL/co1n5QaI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-339-JpH0Ci6UMqirx7Oc_SHTxg-1; Wed, 04 Mar 2020 06:14:56 -0500
X-MC-Unique: JpH0Ci6UMqirx7Oc_SHTxg-1
Received: by mail-wr1-f70.google.com with SMTP id b12so721037wro.4
 for <qemu-arm@nongnu.org>; Wed, 04 Mar 2020 03:14:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AWb2lS/0Q4WHKen5zSqK5CWqt+E1FAZE9sUsehJoDaA=;
 b=m3RUU7i+7DSCUEtz5NCMui0U9y2OcpWG//KAdxvloE6F5z5FarPVv3TnKNBM4FbMH6
 ktDRWWSwQKQ2X1tEgJpc2mHlN999K517LZ4G8mDR3R4wETWdZ+ygJZnuicFdq1rKT5KZ
 CX5pJeDorUMp+0S+JOG7RbDn47zcumI4hflyvel2p4gaf+JfNsV9n1DbVZNjPbKX0Gk1
 1KGcQPlwqpcN/ZL2Pau8hFKLbMn9suQKRZUwu7LMKxn9xrqq93pH5Cu11nAxSOAfzSnN
 gqst6ra2ZAJVTALUQ87tEHCAlGMkWP3tcVjHSPcDpl1uk2OZjWg5JbNf7pLWFa7GySTV
 bW0g==
X-Gm-Message-State: ANhLgQ03HcvcJJuhsfgjykqs8LnnN0fW2wuPXACUN00opSCptTGODyQn
 FNEaxRrXvSMXssHUpe7m3lEZnW6yI2K233j0MTzLG41L7CSOxdYhZ59v6PEYXjbahAyMqjks/J9
 qxNf9jSi7RJaa
X-Received: by 2002:adf:b609:: with SMTP id f9mr3364453wre.380.1583320494961; 
 Wed, 04 Mar 2020 03:14:54 -0800 (PST)
X-Received: by 2002:adf:b609:: with SMTP id f9mr3364408wre.380.1583320494634; 
 Wed, 04 Mar 2020 03:14:54 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:9def:34a0:b68d:9993?
 ([2001:b07:6468:f312:9def:34a0:b68d:9993])
 by smtp.gmail.com with ESMTPSA id i7sm4213331wma.32.2020.03.04.03.14.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Mar 2020 03:14:53 -0800 (PST)
Subject: Re: [PATCH 0/2] misc: Replace zero-length arrays with flexible array
 member
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20200304005105.27454-1-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <447f74eb-d47e-e03c-5686-ae02a700d040@redhat.com>
Date: Wed, 4 Mar 2020 12:14:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200304005105.27454-1-philmd@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Eric Blake <eblake@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 qemu-block@nongnu.org, David Hildenbrand <david@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Paul Durrant <paul@xen.org>, Eric Auger <eric.auger@redhat.com>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, xen-devel@lists.xenproject.org,
 John Snow <jsnow@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Kevin Wolf <kwolf@redhat.com>, Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Max Reitz <mreitz@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3Id5r5yb0dAR

On 04/03/20 01:51, Philippe Mathieu-Daud=C3=A9 wrote:
> This is a tree-wide cleanup inspired by a Linux kernel commit
> (from Gustavo A. R. Silva).
>=20
> --v-- description start --v--
>=20
>   The current codebase makes use of the zero-length array language
>   extension to the C90 standard, but the preferred mechanism to
>   declare variable-length types such as these ones is a flexible
>   array member [1], introduced in C99:
>=20
>   struct foo {
>       int stuff;
>       struct boo array[];
>   };
>=20
>   By making use of the mechanism above, we will get a compiler
>   warning in case the flexible array does not occur last in the
>   structure, which will help us prevent some kind of undefined
>   behavior bugs from being unadvertenly introduced [2] to the
>   Linux codebase from now on.
>=20
> --^-- description end --^--
>=20
> Do the similar housekeeping in the QEMU codebase (which uses
> C99 since commit 7be41675f7cb).
>=20
> The first patch is done with the help of a coccinelle semantic
> patch. However Coccinelle does not recognize:
>=20
>   struct foo {
>       int stuff;
>       struct boo array[];
>   } QEMU_PACKED;
>=20
> but does recognize:
>=20
>   struct QEMU_PACKED foo {
>       int stuff;
>       struct boo array[];
>   };
>=20
> I'm not sure why, neither it is worth refactoring all QEMU
> structures to use the attributes before the structure name,
> so I did the 2nd patch manually.
>=20
> Anyway this is annoying, because many structures are not handled
> by coccinelle. Maybe this needs to be reported to upstream
> coccinelle?
>=20
> I used spatch 1.0.8 with:
>=20
>   -I include --include-headers \
>   --macro-file scripts/cocci-macro-file.h \
>   --keep-comments --indent 4
>=20
> Regards,
>=20
> Phil.
>=20
> Philippe Mathieu-Daud=C3=A9 (2):
>   misc: Replace zero-length arrays with flexible array member
>     (automatic)
>   misc: Replace zero-length arrays with flexible array member (manual)
>=20
>  docs/interop/vhost-user.rst           |  4 ++--
>  block/qed.h                           |  2 +-
>  bsd-user/qemu.h                       |  2 +-
>  contrib/libvhost-user/libvhost-user.h |  2 +-
>  hw/m68k/bootinfo.h                    |  2 +-
>  hw/scsi/srp.h                         |  6 +++---
>  hw/xen/xen_pt.h                       |  2 +-
>  include/hw/acpi/acpi-defs.h           | 16 ++++++++--------
>  include/hw/arm/smmu-common.h          |  2 +-
>  include/hw/boards.h                   |  2 +-
>  include/hw/i386/intel_iommu.h         |  3 ++-
>  include/hw/s390x/event-facility.h     |  2 +-
>  include/hw/s390x/sclp.h               |  8 ++++----
>  include/hw/virtio/virtio-iommu.h      |  2 +-
>  include/sysemu/cryptodev.h            |  2 +-
>  include/tcg/tcg.h                     |  2 +-
>  pc-bios/s390-ccw/bootmap.h            |  2 +-
>  pc-bios/s390-ccw/sclp.h               |  2 +-
>  tests/qtest/libqos/ahci.h             |  2 +-
>  block/linux-aio.c                     |  2 +-
>  block/vmdk.c                          |  2 +-
>  hw/acpi/nvdimm.c                      |  6 +++---
>  hw/char/sclpconsole-lm.c              |  2 +-
>  hw/char/sclpconsole.c                 |  2 +-
>  hw/dma/soc_dma.c                      |  2 +-
>  hw/i386/x86.c                         |  2 +-
>  hw/misc/omap_l4.c                     |  2 +-
>  hw/nvram/eeprom93xx.c                 |  2 +-
>  hw/rdma/vmw/pvrdma_qp_ops.c           |  4 ++--
>  hw/s390x/virtio-ccw.c                 |  2 +-
>  hw/usb/dev-network.c                  |  2 +-
>  hw/usb/dev-smartcard-reader.c         |  4 ++--
>  hw/virtio/virtio.c                    |  4 ++--
>  net/queue.c                           |  2 +-
>  target/s390x/ioinst.c                 |  2 +-
>  35 files changed, 54 insertions(+), 53 deletions(-)
>=20

Queued (minus the qed part).

Paolo

