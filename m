Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp1347210lfc;
        Tue, 3 Dec 2019 03:06:08 -0800 (PST)
X-Google-Smtp-Source: APXvYqxSpB2Bmvm2Lg8BY3+RZCzfNay2s9Wz4I04Qv0mHDorttUUpmYYJCyGmQW1N63mJgoQXyEf
X-Received: by 2002:a17:906:394:: with SMTP id b20mr5452910eja.188.1575371167981;
        Tue, 03 Dec 2019 03:06:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575371167; cv=none;
        d=google.com; s=arc-20160816;
        b=lM1XvRie8EF/tlCoakpL8hhoU0y91KDTJA/NyftCw20Vc9kVeDXr5PsTfM9QbcjARF
         Qa6rtdJyYqlsHaYRUTW+jbLk7YNOpfsK9tiOEHfGwNmhu/Dm9XnpSySQ4Vc728zUJAAJ
         QBLWiwVIZc434fSTsHjHXn0dvbptPO1ig5TT5xscP49FupIzPl9pMaFmQBOb3tbucHOn
         t5m04qUnJDoAsZY+WOomLDxRa6DO8R9uxr8cOe6yUOu1m2Zeb5fzUhNTC54bCCTygyLb
         W6WWIrBM1V5EoLrD6HKwS8Zcx3JWHL6ZmWcuYOZbB3JpMlOZW8SXrwHvPHeWvrFlm1tv
         z/EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:organization:references:in-reply-to:message-id:subject
         :to:from:date:dkim-signature;
        bh=Sz1GpD+3T1QWTgobHdtGvt1jXECG9RFlmUdUGH0uwVA=;
        b=PUFnZEGRQnTbLTOI9NRYrXO60beMZcFq3ZhGY7XeSOBi6tGYscQeR5mBf+4L0d0q79
         7kpC5i5dUyO7PtQCzRrKkEzcRNJCFCmwqrgpPaSk054Dnk1NpNTWAH87dsDhuCLVqw6S
         CwGr9dK6RbpM4LxC2FoIHNc4MKz/8UtxVMeMRcrIZZyOn/a0pUTwRafJB7GSzp6bBpOq
         Z2G/s/rbea2rTfzcmnf/FaJEDMIeO+R/qAGiwjXX+62AXv3q+gL05UGb85sc9JJoakio
         ja7tQz2qeZ53v4YfxaZJ3nj9IPPOJTuYQrsmrLdXCkymwM5mVYnvhNrOV7L/ZYkWxhUs
         Wk0g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=LmqRVpEv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c29si2112297ede.50.2019.12.03.03.06.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Dec 2019 03:06:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=LmqRVpEv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ic60J-0006n8-VH
	for alex.bennee@linaro.org; Tue, 03 Dec 2019 06:06:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53415)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <cohuck@redhat.com>) id 1ic5qM-0003LW-IN
 for qemu-arm@nongnu.org; Tue, 03 Dec 2019 05:55:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1ic5qH-0006sW-Dm
 for qemu-arm@nongnu.org; Tue, 03 Dec 2019 05:55:45 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:36425
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>) id 1ic5qH-0006od-8A
 for qemu-arm@nongnu.org; Tue, 03 Dec 2019 05:55:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575370536;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Sz1GpD+3T1QWTgobHdtGvt1jXECG9RFlmUdUGH0uwVA=;
 b=LmqRVpEvt4adYYmUedXsYAi0ZitjTyL8lPSeUbqs1lLbTjnJ2aEWHU0spcZSphvrGdO3O8
 kyp77x+/TLYNFe+pPZxNULc9hQSUNyrMiTzfe1xTfg4fn5L7r3t9dS2Sfh2tij9AT3TE+r
 4HbO5QGCLIcz7SWvbiasLxmFXJG0abs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-138-OVaDAPWzNkKWeEFJbPRAwg-1; Tue, 03 Dec 2019 05:55:35 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ADB97107ACC5;
 Tue,  3 Dec 2019 10:55:32 +0000 (UTC)
Received: from gondolin (ovpn-116-214.ams2.redhat.com [10.36.116.214])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 62E0A10016DA;
 Tue,  3 Dec 2019 10:55:12 +0000 (UTC)
Date: Tue, 3 Dec 2019 11:55:08 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Damien Hedde <damien.hedde@greensocs.com>
Subject: Re: [PATCH v5 01/13] add device_legacy_reset function to prepare
 for reset api change
Message-ID: <20191203115508.6c2a6ef4.cohuck@redhat.com>
In-Reply-To: <20191018150630.31099-2-damien.hedde@greensocs.com>
References: <20191018150630.31099-1-damien.hedde@greensocs.com>
 <20191018150630.31099-2-damien.hedde@greensocs.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: OVaDAPWzNkKWeEFJbPRAwg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Cc: Fam Zheng <fam@euphon.net>, peter.maydell@linaro.org,
 Collin Walling <walling@linux.ibm.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, "Michael S.
 Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, David Hildenbrand <david@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, david@gibson.dropbear.id.au,
 philmd@redhat.com, ehabkost@redhat.com, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>,
 John Snow <jsnow@redhat.com>, Richard Henderson <rth@twiddle.net>,
 berrange@redhat.com, mark.burton@greensocs.com, edgari@xilinx.com,
 pbonzini@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nCit3M8WZxnW

On Fri, 18 Oct 2019 17:06:18 +0200
Damien Hedde <damien.hedde@greensocs.com> wrote:

> Provide a temporary device_legacy_reset function doing what
> device_reset does to prepare for the transition with Resettable
> API.
>=20
> All occurrence of device_reset in the code tree are also replaced
> by device_legacy_reset.
>=20
> The new resettable API has different prototype and semantics
> (resetting child buses as well as the specified device). Subsequent
> commits will make the changeover for each call site individually; once
> that is complete device_legacy_reset() will be removed.
>=20
> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Acked-by: David Gibson <david@gibson.dropbear.id.au>
> ---
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: "Daniel P. Berrang=C3=A9" <berrange@redhat.com>
> Cc: Eduardo Habkost <ehabkost@redhat.com>
> Cc: Richard Henderson <rth@twiddle.net>
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
> Cc: John Snow <jsnow@redhat.com>
> Cc: "C=C3=A9dric Le Goater" <clg@kaod.org>
> Cc: Collin Walling <walling@linux.ibm.com>
> Cc: Cornelia Huck <cohuck@redhat.com>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Halil Pasic <pasic@linux.ibm.com>
> Cc: Christian Borntraeger <borntraeger@de.ibm.com>
> Cc: Dmitry Fleytman <dmitry.fleytman@gmail.com>
> Cc: Fam Zheng <fam@euphon.net>
> ---
>  hw/audio/intel-hda.c     | 2 +-
>  hw/core/qdev.c           | 6 +++---
>  hw/hyperv/hyperv.c       | 2 +-
>  hw/i386/pc.c             | 2 +-
>  hw/ide/microdrive.c      | 8 ++++----
>  hw/intc/spapr_xive.c     | 2 +-
>  hw/ppc/pnv_psi.c         | 2 +-
>  hw/ppc/spapr_pci.c       | 2 +-
>  hw/ppc/spapr_vio.c       | 2 +-
>  hw/s390x/s390-pci-inst.c | 2 +-
>  hw/scsi/vmw_pvscsi.c     | 2 +-
>  hw/sd/omap_mmc.c         | 2 +-
>  hw/sd/pl181.c            | 2 +-
>  include/hw/qdev-core.h   | 4 ++--
>  14 files changed, 20 insertions(+), 20 deletions(-)

Acked-by: Cornelia Huck <cohuck@redhat.com>

