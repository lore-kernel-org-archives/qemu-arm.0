Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp888426wrx;
        Fri, 1 Mar 2019 09:40:44 -0800 (PST)
X-Google-Smtp-Source: APXvYqx5zeBfa1izIKxJFCsSXVDraisOg2PwX7pO9ptj4YvDXms3FD74uYM7Otg9gz6xXOn7rLPD
X-Received: by 2002:a25:3dc4:: with SMTP id k187mr5263329yba.443.1551462044078;
        Fri, 01 Mar 2019 09:40:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551462044; cv=none;
        d=google.com; s=arc-20160816;
        b=Pr/1BT0ZiJhiY/REE89qki8Tl9ajH5mHN3/mET1psoquz3h/9SbhsgEv26Joi+up3L
         3D/jWkgxQOZp9cwDd23QG8YOxCMFVdtHFc8e30b9DMgx4A1IJME5+Cl2znpIwQXb4hrG
         o99bZuFYi2vvLSJWXNoCouTgc11ZW2p3V4B7i+r/zp84ttJL1e34lbZMAaleQG/RI4Gz
         yakxPtR2A5avGcAsBM9Hoy4ANtiV4kCcGgI4jj/stVcmH//hFJRCgTfk7zEDlCfaybkz
         4rlLOv/b3aotPVBoRKEtCDR3Au9IdTEcxjW2o38K7tPqhy/fsjV92FtdWRZxn9ggC98c
         Qqjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=enDrNEHxDEz8uTaX5Go+AVAG9KOVDx0v08f+N7p3dAw=;
        b=NRCLx1KjIfvztZSNjhDPcYAwV1C2uqaoOglNwfcQteQoZ7EWRwAQFE2p4CRpalC7ni
         Kn841yv1H1z9qGWPtuSZEB75HYtkUsoUh+jc8xGfVnFXT6SadX7YK5f07YFjJalMNafS
         Ty1YKCRBO/xv5HkP3qyxCmfPf0F4hjCVF9B9Ngn5M34FWmFiiioudCmxyJXETjumm0MP
         +qvayGrlQx2+HCCv7/zT71lV7r+NAchJffrrzPraXqZ2qte6A6+t9UwyZk23y9OL3LSA
         OBWEk+c4Yxzp0zCEE6hLhxwgqyuZ2Dmh+xq0WGqS3yskuZxpgDl9teE9E51kfJy59Jxa
         woDw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p191si12990578ywe.69.2019.03.01.09.40.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 01 Mar 2019 09:40:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:41576 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gzm9L-0000LE-GK
	for alex.bennee@linaro.org; Fri, 01 Mar 2019 12:40:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47704)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gzm99-0000Ko-WB
	for qemu-arm@nongnu.org; Fri, 01 Mar 2019 12:40:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gzm99-0007oc-3Q
	for qemu-arm@nongnu.org; Fri, 01 Mar 2019 12:40:31 -0500
Received: from mx1.redhat.com ([209.132.183.28]:20732)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1gzm98-00078l-QU; Fri, 01 Mar 2019 12:40:30 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3A6F19B365;
	Fri,  1 Mar 2019 17:39:30 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E8CBD60DB4;
	Fri,  1 Mar 2019 17:39:25 +0000 (UTC)
Date: Fri, 1 Mar 2019 18:39:24 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Laszlo Ersek <lersek@redhat.com>
Message-ID: <20190301183924.5fdd2a0f@redhat.com>
In-Reply-To: <f5d04d6d-6e99-ba52-c903-6f59d83eff6c@redhat.com>
References: <20190128110545.20644-1-shameerali.kolothum.thodi@huawei.com>
	<3a6bf5ea-5b48-18c2-8a2c-0ced777be816@redhat.com>
	<892e3eb7-66f5-92a3-5891-de8665fc984a@redhat.com>
	<5FC3163CFD30C246ABAA99954A238FA8392D6875@lhreml524-mbs.china.huawei.com>
	<d3c99948-2fdb-f345-8b22-03a7e181122c@redhat.com>
	<6f4276b4-c79c-00a0-530e-be72c8093ad1@redhat.com>
	<5FC3163CFD30C246ABAA99954A238FA8392D778D@lhreml524-mbs.china.huawei.com>
	<f5d04d6d-6e99-ba52-c903-6f59d83eff6c@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Fri, 01 Mar 2019 17:39:30 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [RFC PATCH 0/4] ARM virt: ACPI memory hotplug support
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"shannon.zhaosl@gmail.com" <shannon.zhaosl@gmail.com>,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
	Linuxarm <linuxarm@huawei.com>, Auger Eric <eric.auger@redhat.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"Leif Lindholm \(Linaro address\)" <leif.lindholm@linaro.org>,
	"xuwei \(O\)" <xuwei5@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1Pe+Toh5yjdh

On Fri, 1 Mar 2019 14:49:45 +0100
Laszlo Ersek <lersek@redhat.com> wrote:

> On 02/28/19 15:02, Shameerali Kolothum Thodi wrote:
>=20
> > Ah..I missed the fact that, firmware indeed sees an update in the blob =
len here
> > (rounded or not) after reboot. So don=E2=80=99t think x86 has the same =
issue and padding
> > is not the right solution as Igor explained in his reply.
> >=20
> > I will try to debug this further. Any pointers welcome. =20
>=20
> How about this.
>=20
> (1) The firmware looks up the fw_cfg file called "etc/table-loader" in
> the fw_cfg file directory (identified by constant selector key 0x0019,
> FW_CFG_FILE_DIR).
>=20
> (2) The directory entry, once found, tells the firmware two things
> simultaneously. The selector key, and the size of the blob.
>=20
> (3) The firmware selects the selector key from step (2).
>=20
> (4) QEMU regenerates the ACPI payload (as a select callback).
>=20
> (5) The firmware reads the number of bytes from the fw_cfg blob that it
> learned in step (2).
>=20
> Here's the problem. As long as QEMU used to perform step (4) only for
> the purpose of refreshing PCI resources in the ACPI payload, step (4)
> wouldn't *resize* the blob.
>=20
> However, if step (4) enlarges the blob, then the byte count that step
> (5) uses -- from step (2) -- for reading, is obsolete.
I've thought that was a problem with IO based fw_cfg, as reading size/conte=
nt
were separates steps and that it was solved by DMA based fw_cfg file read.


>=20
> Thanks
> Laszlo

