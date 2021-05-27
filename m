Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp204287lfm;
        Thu, 27 May 2021 03:16:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzD7wb/m9JhmutlVGTYQ/+AlKt1rs9syEhzh6/ogpiNYeu9MS1UzED65L5StYWIByAYWO+9
X-Received: by 2002:a02:9f96:: with SMTP id a22mr2805473jam.14.1622110602656;
        Thu, 27 May 2021 03:16:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622110602; cv=none;
        d=google.com; s=arc-20160816;
        b=lC5GBf0qp3XUVcC/STc4arcGAcQGR+E/eXKPCRC7lzREbe51dkhdhr5m3XcKc3oHQC
         2rTL62hzFoSck5F8TBdicBwUzQ3JjiXMoq/hkTPDVS8lXA4PoX++79W5GlOy2wDSK9y4
         NO85mDOmDe0WmnPSVKaUdnQzKzeMtDitGaBow3cOO3h0vGcygoz0d6bMV93S+91rDRVU
         akIBjjY2huOT+kIHKjtWjZ8/aWYpIXXJGJIcU97jvJYaPZuZSktKgKEpGXBg1qOdRWVa
         qcoRbAFSCTOfvZ4JX7SUVsRRMs6EUscxP45wGt8ZElJ6gBQCMcv7b9N9af/p+TBwZ+E0
         XekQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=s7YbnOoeF2eq4SDW2UjnFgxxsCwCNqiP0QmYraAAXFk=;
        b=Ec6YCuqCwr6T3WlR2c0JSgRG+9ueHfYZS4R2y6xsYxdC4m3uxGI22zxN29VD+gdw0Y
         seL5kXAGZUwBe4TZzDggQZ5Y+wFT9I+biyBcthTKDYQWQyqx3gqH7EFr6qYsqorI+/f2
         MuKRQxuM6CHJVkJvuUXiCsl1NEqWveHiIeExOl6u2O3l+B10tNGtuvBOKCq3QSYAeg6N
         U4KdAzogtZZEOe6SYBWcqNb8aF8N3GuH5On2yD1cOm6MNxmDv8JK90ErMJeCjzE/0aJ1
         fr3lgsQg4z1BmMLC/XC1UXAhtbCUkGEb56WsQxzCDcIrutDvbMIzCOK+S7J1TraR5pSe
         cAZg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=FEVUNyXK;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w7si2368818ilu.149.2021.05.27.03.16.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 May 2021 03:16:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=FEVUNyXK;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lmD4B-0001H3-GB
	for alex.bennee@linaro.org; Thu, 27 May 2021 06:16:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1lmCq1-0003wx-PH
 for qemu-devel@nongnu.org; Thu, 27 May 2021 06:02:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33515)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1lmCpw-00010s-Vs
 for qemu-devel@nongnu.org; Thu, 27 May 2021 06:01:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622109716;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=s7YbnOoeF2eq4SDW2UjnFgxxsCwCNqiP0QmYraAAXFk=;
 b=FEVUNyXKHXkKu9LM5YG2O8hgr9NPdA+2C32+DFTlTMm8c2n+j6cD4Lzxn9//rvK8ETvfBt
 w4sFYCsZfNe4V+XqGZ2VeEobJhSrohFcmFXUhUlMj60iROH1/dLake1iIiS5xO/P5zBasz
 a/deuGGP1fqaBYQI2zooyEjge7NOwFs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-404-jzLZkckCMmy3l4Rynl1EvA-1; Thu, 27 May 2021 06:01:51 -0400
X-MC-Unique: jzLZkckCMmy3l4Rynl1EvA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 52D086D4EC;
 Thu, 27 May 2021 10:01:50 +0000 (UTC)
Received: from localhost (unknown [10.33.36.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E32F4687EB;
 Thu, 27 May 2021 10:01:49 +0000 (UTC)
Date: Thu, 27 May 2021 12:01:48 +0200
From: Sergio Lopez <slp@redhat.com>
To: Alexander Graf <agraf@csgraf.de>
Subject: Re: [PATCH v8 02/19] hvf: Move vcpu thread functions into common
 directory
Message-ID: <20210527100148.hyw5id5mv7qmxlln@mhamilton>
References: <20210519202253.76782-1-agraf@csgraf.de>
 <20210519202253.76782-3-agraf@csgraf.de>
MIME-Version: 1.0
In-Reply-To: <20210519202253.76782-3-agraf@csgraf.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=slp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="3jxkac6z7sphnybw"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=slp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Peter Collingbourne <pcc@google.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm <qemu-arm@nongnu.org>,
 Frank Yang <lfy@google.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ejt0P54mwe4B

--3jxkac6z7sphnybw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 19, 2021 at 10:22:36PM +0200, Alexander Graf wrote:
> Until now, Hypervisor.framework has only been available on x86_64 systems=
.
> With Apple Silicon shipping now, it extends its reach to aarch64. To
> prepare for support for multiple architectures, let's start moving common
> code out into its own accel directory.
>=20
> This patch moves the vCPU thread loop over.
>=20
> Signed-off-by: Alexander Graf <agraf@csgraf.de>
> ---
>  {target/i386 =3D> accel}/hvf/hvf-accel-ops.c | 0
>  {target/i386 =3D> accel}/hvf/hvf-accel-ops.h | 0
>  accel/hvf/meson.build                      | 1 +
>  target/i386/hvf/meson.build                | 1 -
>  target/i386/hvf/x86hvf.c                   | 2 +-
>  5 files changed, 2 insertions(+), 2 deletions(-)
>  rename {target/i386 =3D> accel}/hvf/hvf-accel-ops.c (100%)
>  rename {target/i386 =3D> accel}/hvf/hvf-accel-ops.h (100%)

Reviewed-by: Sergio Lopez <slp@redhat.com>

--3jxkac6z7sphnybw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEvtX891EthoCRQuii9GknjS8MAjUFAmCvbgsACgkQ9GknjS8M
AjWynA//bvm0XYNAYFmAeXtx9ULNul4qudE7+FoiaA0GkgIE8wn+5AjVO+0JCS3y
yPjjNlLdHSYOUXBpICuZGCFy+P+lns1vatgjJXuWDG2jCK64/SPU3So9VdCCXqhe
CkrrdCw/ONTJE06FhqzCKMIcLBrmvYBHoanCg8IzszlzWmMOb+d35bfsVXZ2DmGm
wieIeD39CbIgothUNxbmO4Sgb/2h+qAkWXVulEK4p+JQeoQty0UCaWy+RxHl62Ry
+i/4eqxKUBGH4hsr/z58hU0CaR9oqjH1Opc6Ade7raS5ZGa1n/xDvpsxLZXLpYwn
wedVK1vDYSsGOmEPs+J5XUgwDh5KTZBQHu7m9QnjsnAK50TJ47l22pGCnrjKVQHn
HNcDBhJsRdyGK/hB23CcwG/6x0ZZeJXDVt7lGhEdJcjkU49245GzdNLTxrf/S6YS
ES6c9LW5QHvcPRViHdH3N9l9VD1y2QWkdR52NYNTQAiDYtdDJgAP3Kl1FIbdBzhE
a0dqotIjzOKnUWSrwWgZ/Elgi8f38XYIVn1r6JvrDW4ODE5xM+qT8iOvqsb1sPQW
pLGV7S5eV9S8IQg3PCRGRnGtiiwzZXiWR10GOcnFdNmVC8FjTRralAq6klvX1amS
Gnl1RfgofQkE8QoswkiW6GZQK8BslJrLd152ECbcmFT7XsNw2Nc=
=uS0m
-----END PGP SIGNATURE-----

--3jxkac6z7sphnybw--

