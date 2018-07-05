Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp1626620wrq;
        Thu, 5 Jul 2018 06:47:35 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdFcR5MbpoSG4SeRheXIddOzz3Mu6GphurE9jg4qJt69O2Lh9Jk8m39OIjROSIpzkUszcyk
X-Received: by 2002:aed:3d95:: with SMTP id i21-v6mr5349117qtf.232.1530798455128;
        Thu, 05 Jul 2018 06:47:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530798455; cv=none;
        d=google.com; s=arc-20160816;
        b=XR62npwBYRi3bMoVX5jnh+CcD/ukNeo00rbMi1RQMPW6LB+FKBIFOLtoBO1+25hFp0
         XI71Ob0BCSwbmx8Chv4O+kpUIE7udl0EvNGqnOLJIPHnkM94rOeIBUQUMPHgt21Nz9/j
         WsXgL45Wa6h36yNG0OxM8+d9Tn/ufFE4lhoU3XDmmhUPg2qeORilgPBQItcjfWiO4lfM
         WldoqPDIEtI4ETAdZ/c2dGDr21lThK8CWYfSc8a/M/cRin0QLcQYTSM8y0eckLRAHq0v
         Avaltvidm4GAnM8PHuKxhhTHFX8GnNnp5Ny5GI/jvePHQBSY3gNThEgSSHU4lUxc2I98
         rjPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:content-disposition
         :mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=UnzqhbjycsoQOC8WunBYItyTo4BmDMQ8NcMTXsZT0uA=;
        b=aDT6GOay272iEIC1uyS+HYoZNY1DLfN6Jtw47yGY0PMiF1muuIPBNpYsDEh+TtlIol
         u+hNViZJwam0EjPpz7nvLQkR5xd9DFZayvltBEqIkdFus5kG5aoiBgLlKGs1A53CzCLd
         Ts+uHtCVKSo/WiV9cNuU+SaAMmvAp2jsozPY4Ww8kZ32/q5Z7Ast2+OUcTYtKvdfAJMl
         OScuTmPBKqzUlAOJedCWGlUAEvhufn1fhuDPkV/RKnj5Lp4Mk6tjjvCkHIq6ZB7I4Pgj
         1OuQuO8HRZ4npILZxSMixdgjdh0HsTGKsRZ2OZJCXdX+pE1jtjBxKVntccBguqIdlxkM
         8hZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 57-v6si1071831qtw.38.2018.07.05.06.47.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 05 Jul 2018 06:47:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52895 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fb4be-0004pq-K9
	for alex.bennee@linaro.org; Thu, 05 Jul 2018 09:47:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51206)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1fb4bL-0004o7-Id
	for qemu-arm@nongnu.org; Thu, 05 Jul 2018 09:47:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1fb4bI-0003eW-Gu
	for qemu-arm@nongnu.org; Thu, 05 Jul 2018 09:47:15 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:36920 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mst@redhat.com>)
	id 1fb4bI-0003ax-Co; Thu, 05 Jul 2018 09:47:12 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F384F406C76F;
	Thu,  5 Jul 2018 13:47:10 +0000 (UTC)
Received: from redhat.com (ovpn-124-6.rdu2.redhat.com [10.10.124.6])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E401D2026D74;
	Thu,  5 Jul 2018 13:47:08 +0000 (UTC)
Date: Thu, 5 Jul 2018 16:47:07 +0300
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Message-ID: <20180705164656-mutt-send-email-mst@kernel.org>
References: <20180704153919.12432-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20180704153919.12432-1-f4bug@amsat.org>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Thu, 05 Jul 2018 13:47:11 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Thu, 05 Jul 2018 13:47:11 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'mst@redhat.com' RCPT:''
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [PATCH 0/8] Coccinelle cleanups
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org,
	Alexander Graf <agraf@suse.de>, Gerd Hoffmann <kraxel@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	qemu-block@nongnu.org, Markus Armbruster <armbru@redhat.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	xen-devel@lists.xenproject.org, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
	=?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
	Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
	"Daniel P . Berrange" <berrange@redhat.com>,
	Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
	Max Reitz <mreitz@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2dLrBljschcH

On Wed, Jul 04, 2018 at 12:39:11PM -0300, Philippe Mathieu-Daud=E9 wrote:
> Nothing exciting here, patches created mechanically
> (common after soft freeze).

Acked-by: Michael S. Tsirkin <mst@redhat.com>

> Philippe Mathieu-Daud=E9 (8):
>   qobject: Catch another straggler for use of qdict_put_str()
>   error: Remove NULL checks on error_propagate() calls
>   crypto: Remove useless casts
>   xen: Remove useless casts
>   tests/bios-tables-test: Remove useless casts
>   ui/vnc: Remove useless parenthesis around DIV_ROUND_UP macro
>   hw/pci-host: Remove useless parenthesis around DIV_ROUND_UP macro
>   hw/intc/gicv3: Remove useless parenthesis around DIV_ROUND_UP macro
>=20
>  include/hw/intc/arm_gicv3_common.h | 2 +-
>  crypto/cipher-builtin.c            | 4 ++--
>  hw/pci-host/piix.c                 | 2 +-
>  hw/pci-host/q35.c                  | 2 +-
>  hw/s390x/virtio-ccw.c              | 4 +---
>  hw/xen/xen_pt_config_init.c        | 2 +-
>  qobject/block-qdict.c              | 2 +-
>  tests/bios-tables-test.c           | 2 +-
>  ui/vnc-enc-tight.c                 | 2 +-
>  ui/vnc.c                           | 3 ++-
>  10 files changed, 12 insertions(+), 13 deletions(-)
>=20
> --=20
> 2.18.0
