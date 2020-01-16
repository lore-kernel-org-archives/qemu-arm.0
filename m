Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp8364137lff;
        Thu, 16 Jan 2020 05:25:29 -0800 (PST)
X-Google-Smtp-Source: APXvYqyLGL/A7eu7fozs0XykDxNAcXfhrnMuGjIF0CASWJb5kPEKUW0/GZvyypPFgfrtgCjNuKK7
X-Received: by 2002:ad4:4e34:: with SMTP id dm20mr2569701qvb.163.1579181129758;
        Thu, 16 Jan 2020 05:25:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579181129; cv=none;
        d=google.com; s=arc-20160816;
        b=dsmumVM7KRo12sp1qw/WihaA2TrvwkBW7vIgA2dXHHO64q4Jtuaso/qoIxDkGDIgGG
         pOd/f6ZlJ2GeY2htLPUNOi45hXj0I3WbGgMJQP9NDkyiJO6IcMd8sBruYmq+DewMHdhk
         +5dyCvzMX4YMETGRBwacn0A7koU6jPGp/judwpkuj71Dvm0ImZiEszuzQluGw/ssvlyJ
         F5yR9SThm5zETY/bowHa6woWUgeDKnvWzHa8MJQYW+ncggqMpSzl5EvZroXlqrl9KX7h
         Wxt7PC1jqDJofSSwLwzujUN5Pcgun38Ots9txg1FN0bDKm6EFZRa0YBmpomXjf3JPnwf
         iiMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=Omd1dymP/aA8I6I3SnZ+1r2udZhBpsCMI9jYmRDtIBA=;
        b=zvOUvpaG3LlAkm140Mm1C/pcVCBbJSOxWLHDI1HqTWWtVJ6e+FLz63kyqP3LknHc5d
         z7+7CB+04ZjHmZLvCCR1S9sPfuVqdz8te0y/NZaV3P2jVYM6zaQ5XEITPBgSM9IuWBXk
         gl8tcamSypW3Zw64l9JMwD3Vub9xg+7Sy0ZMDGOh8PRfJrGn14sqRLc2XGhGWPDntu1U
         mePlR0RHVUhqIblciiNKqLDww1KMfeFDxkxOyiVNbSaYMfsMRdRExzvTLx+fvc+bagi0
         0aUod/cwa5xSwCiVF+ljnvauI5CF8SYxa5ghQmWXb8l5WsIMPZldlzBN44/lgO3zVoPS
         Xtvg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=GnfVp2fO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v34si12838147qtb.211.2020.01.16.05.25.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Jan 2020 05:25:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=GnfVp2fO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1is59N-0006UJ-3V
	for alex.bennee@linaro.org; Thu, 16 Jan 2020 08:25:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41957)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1is59D-0006U8-I7
 for qemu-arm@nongnu.org; Thu, 16 Jan 2020 08:25:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1is59C-00046C-9U
 for qemu-arm@nongnu.org; Thu, 16 Jan 2020 08:25:19 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:23511
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1is59C-00045y-64
 for qemu-arm@nongnu.org; Thu, 16 Jan 2020 08:25:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579181117;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Omd1dymP/aA8I6I3SnZ+1r2udZhBpsCMI9jYmRDtIBA=;
 b=GnfVp2fOIvIdmItLVYIKx2vqGWOGLTWQ/hhwkPn+fIvy0kWT4vr/YPns7AFenXiIpDFG/5
 fxc+qI3qa9hnDn2bBz0kcZwSUdP/DOtL275mDu/1nlhNDPyI5JJxfKSsn1Azv3zcB3xWvk
 br7UjwTJNS5ZIHORC3XZDT+EG3pXIcw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-247-nCSoRUIWOliI5kw8TDdvew-1; Thu, 16 Jan 2020 08:25:15 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2FFA21902EA4;
 Thu, 16 Jan 2020 13:25:14 +0000 (UTC)
Received: from localhost (unknown [10.43.2.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 36AD988894;
 Thu, 16 Jan 2020 13:25:09 +0000 (UTC)
Date: Thu, 16 Jan 2020 14:25:08 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Guoheyi <guoheyi@huawei.com>
Subject: Re: [PATCH 2/2] arm/virt/acpi: remove _ADR from devices identified
 by _HID
Message-ID: <20200116142508.1d82af31@redhat.com>
In-Reply-To: <a4992b63-e8e7-7f54-341e-f7dd3d7e8880@huawei.com>
References: <20191219064759.35053-1-guoheyi@huawei.com>
 <20191219064759.35053-3-guoheyi@huawei.com>
 <20200105072504-mutt-send-email-mst@kernel.org>
 <20200105074308-mutt-send-email-mst@kernel.org>
 <a4992b63-e8e7-7f54-341e-f7dd3d7e8880@huawei.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: nCSoRUIWOliI5kw8TDdvew-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Corey Minyard <cminyard@mvista.com>, wanghaibin.wang@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ELkk/mDPxCgr

On Thu, 16 Jan 2020 19:56:19 +0800
Guoheyi <guoheyi@huawei.com> wrote:

> =E5=9C=A8 2020/1/5 20:53, Michael S. Tsirkin =E5=86=99=E9=81=93:
> > On Sun, Jan 05, 2020 at 07:34:01AM -0500, Michael S. Tsirkin wrote: =20
> >> On Thu, Dec 19, 2019 at 02:47:59PM +0800, Heyi Guo wrote: =20
> >>> According to ACPI spec, _ADR should be used for device which is on a
> >>> bus that has a standard enumeration algorithm. It does not make sense
> >>> to have a _ADR object for devices which already have _HID and will be
> >>> enumerated by OSPM.
> >>>
> >>> Signed-off-by: Heyi Guo <guoheyi@huawei.com> =20
> >> Are you sure? I would think this depends on the ID and the device
> >> really. E.g. PCI devices all are expected to have _ADR and some of the=
m
> >> have a _HID. =20
> >
> > To clarify I am not commenting on patches.
> > The spec says this:
> > =096.1.5 _HID (Hardware ID)
> >
> > =09This object is used to supply OSPM with the device=E2=80=99s PNP ID =
or ACPI ID. 1
> >
> > =09When describing a platform, use of any _HID objects is optional. How=
ever, a _HID object must be
> >
> > =09used to describe any device that will be enumerated by OSPM. OSPM on=
ly enumerates a device
> >
> > =09when no bus enumerator can detect the device ID. For example, device=
s on an ISA bus are
> >
> > =09enumerated by OSPM. Use the _ADR object to describe devices enumerat=
ed by bus enumerators
> >
> > =09other than OSPM.
> >
> >
> > Note: "detect the device ID" not "enumerate the device" which I think
> > means there's a driver matching this vendor/device ID.
> >
> > So it seems fine to have _ADR so device is enumerated, and still have
> > _HID e.g. so ACPI driver can be loaded as fallback if there's
> > no bus driver.
> >
> >
> > Note I am not saying the patch itself is not correct.
> > Maybe these devices are not on any standard bus and that
> > is why they should not have _ADR? I have not looked.
> >
> > I am just saying that spec does not seem to imply _HID and _ADR
> > can't coexist. =20
>=20
> More reading on the spec, I found a statement as below=20
> (https://uefi.org/sites/default/files/resources/ACPI_6_3_May16.pdf,=20
> section 6.1, on top of page 343):

I'd replace 'It does not make sense ...' sentence with pointer to spec
and quote below in commit message.

> A device object must contain either an _HID object or an _ADR object,=20
> but should not contain both

[...]

