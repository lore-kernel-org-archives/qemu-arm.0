Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp1427958lfy;
        Thu, 20 Aug 2020 08:01:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwfHmcVouiVe0vZTMkI+OZWCe+HDqH9dNQfV0k0aJ1F0M08ia9ICBRFnpNpR8YP64f6C7Un
X-Received: by 2002:a25:c8a:: with SMTP id 132mr5346298ybm.444.1597935707010;
        Thu, 20 Aug 2020 08:01:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597935707; cv=none;
        d=google.com; s=arc-20160816;
        b=Bb81W9kqZMxbpvAd3mefZR0u09F2rrUQbZO8raHz3Ik/QfmsB7RIOl29il9nXKF6kT
         5rP3Hubx5RnCTHutD7PHTbpoXWXgq+dg3K4+0BQxvnbR9IvjBM0zK96FCT9Gq1IoxvvR
         3IOS8SpZ4aHf8J/TkAw1O+fW+uAKohoFM5UTHT+822gG7bTHdzrEkTfflD64M5HztOsd
         mHyfylRY0Cr7xbtZ+d+dP2nR5g934ZEf6vtb+EPxWsI4Dr5VjKAh4V+H2B5sb2i+W/fC
         NNOTBEwt0vAGGiR7CfUVmG1Y6EM5C8qcezl1eTTYDQoDsVzCOjJdI8VrMWRa0GUfvu8T
         iQYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=ZKYFlv9pMjMZ+ylfFrouaGwAkTEiqWGOisNTMU4ybOQ=;
        b=vYeSl7tPHPLkjYQ0ZNSWKjboH1dRv34EWXLaOdr6qSPUecxhWqrKxOmfMmEPxfR61o
         3zUcCjL5OsAyx5bL6gFZ2jmtYZYPfOnn3FmDgyk2RgXvyTrphGJxNvnE8pu8vVITM9ad
         lu4NIkHJoFasg6deDwzPCq4oNmXBgmALgrq1wgI7peQXT7fKQBTMEzOoovo9UrnB8G1B
         mT9WvJNO8rZIGD5EFau9c5dkFTXMsFVG+VhU2FkkcWXyNZsRihp2wJVsqIoVnqX+8HCR
         q1c0VuhJdt8o0hKcWcV9e4AQWcOXtBM5dZyUMfdiB+bEOmoHS+0MJfMddV6bsnfe2p6d
         fcAw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=YVMtSxHY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p64si2433304ybc.455.2020.08.20.08.01.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Aug 2020 08:01:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=YVMtSxHY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k8m4Y-0002zA-8w
	for alex.bennee@linaro.org; Thu, 20 Aug 2020 11:01:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1k8m40-0002xH-Jd
 for qemu-arm@nongnu.org; Thu, 20 Aug 2020 11:01:14 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:34642
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1k8m3q-0005SZ-13
 for qemu-arm@nongnu.org; Thu, 20 Aug 2020 11:01:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597935660;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZKYFlv9pMjMZ+ylfFrouaGwAkTEiqWGOisNTMU4ybOQ=;
 b=YVMtSxHYRaKafYpJsIHUmbYNotarFrHrsGcLbU9qmzrUxiG2uzTTR9TI0q3uvdvhM/e0+6
 d3PUaUjFW3LHH7TJt21Ocq7a9YYT6c8OFoXKamiA3l+xw7HXYHoTVQcexAHGebBFDy1Vkc
 mFhN/a2oulCvfqTlkyKny/PltZBXlQY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-254-kXuNOdyJMLeqB__-krVGFw-1; Thu, 20 Aug 2020 11:00:57 -0400
X-MC-Unique: kXuNOdyJMLeqB__-krVGFw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CC4C91885D82;
 Thu, 20 Aug 2020 15:00:55 +0000 (UTC)
Received: from localhost (ovpn-114-250.ams2.redhat.com [10.36.114.250])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9AA447E301;
 Thu, 20 Aug 2020 15:00:50 +0000 (UTC)
Date: Thu, 20 Aug 2020 16:00:49 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
Subject: Re: [PATCH v2] hw: add compat machines for 5.2
Message-ID: <20200820150049.GA25991@stefanha-x1.localdomain>
References: <20200819144016.281156-1-cohuck@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200819144016.281156-1-cohuck@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0.0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="7JfCtLOvnd9MIVvH"
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.120; envelope-from=stefanha@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/20 03:03:32
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Andrew Jones <drjones@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Greg Kurz <groug@kaod.org>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FmcGwb0dfpEf

--7JfCtLOvnd9MIVvH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 19, 2020 at 04:40:16PM +0200, Cornelia Huck wrote:
> Add 5.2 machine types for arm/i440fx/q35/s390x/spapr.
>=20
> Reviewed-by: Andrew Jones <drjones@redhat.com>
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> Reviewed-by: Greg Kurz <groug@kaod.org>
> Acked-by: Christian Borntraeger <borntraeger@de.ibm.com>
> Acked-by: David Gibson <david@gibson.dropbear.id.au>
> Acked-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> ---
>=20
> v1->v2: rebased on current master
>=20
> For whoever needs this :) I will include it into an eventually coming
> s390x pull request, if nobody beats me to it.
>=20
> ---
>  hw/arm/virt.c              |  9 ++++++++-
>  hw/core/machine.c          |  3 +++
>  hw/i386/pc.c               |  3 +++
>  hw/i386/pc_piix.c          | 14 +++++++++++++-
>  hw/i386/pc_q35.c           | 13 ++++++++++++-
>  hw/ppc/spapr.c             | 15 +++++++++++++--
>  hw/s390x/s390-virtio-ccw.c | 14 +++++++++++++-
>  include/hw/boards.h        |  3 +++
>  include/hw/i386/pc.h       |  3 +++
>  9 files changed, 71 insertions(+), 6 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--7JfCtLOvnd9MIVvH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl8+kB8ACgkQnKSrs4Gr
c8jfiAf/RhQn5im1nCjTJks6sU0biXgBOE1zbxFr+6eB0G1Zb9NZaPsBg10T5P2+
CQmkRAcBMQ5nQxj+dpldpfK1T+CpmM8/ZvvM4KztO+4zoPMhhoolqKiHocuLUDkl
Mgcd7no9lhS4eWt48d5g0uLgLM0MlqDh6FqOFUdtV6jUAC/UC2S9hWbsl/HjV56d
K3f1U9DRJToNtpH9fgnAdacadR51maYo2Qbo9osXK5Ogy2L9RQGsFx7KRCzxYG38
9XDVELULmq1/TAYlXuuwWdJtGb2utPobeGuWy6dq+BIsu+ZmRB1A9iJjNH+BDT7Y
yD/OdpNGzJTJG2cO6/fW60GWndLB8Q==
=RCYb
-----END PGP SIGNATURE-----

--7JfCtLOvnd9MIVvH--

