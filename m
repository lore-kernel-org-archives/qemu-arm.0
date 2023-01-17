Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2512336ejc;
        Tue, 17 Jan 2023 08:17:46 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvkte6uPdkCe3S+K+MpJ5jXrgBsDv21CsoTDX7Lx6U7Brpc7HbsVLJDMXD2ZOZWpev+CsvW
X-Received: by 2002:ad4:580c:0:b0:531:9d43:d8e0 with SMTP id dd12-20020ad4580c000000b005319d43d8e0mr5929563qvb.31.1673972266538;
        Tue, 17 Jan 2023 08:17:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673972266; cv=none;
        d=google.com; s=arc-20160816;
        b=02LQb3jk2nsmNosL0F55gJi2TGBT1TFy5bCoGnC+SnWt8pdhJlbqnHauLZHEKKg7rk
         2gXORBmR1xpmsewyx1fr8ZRFgPa+FiwudhG5S4RAJ36W8KAVrSXksH3DO6qaNC1pGCg/
         cG1nuQaHwcGba4Mb0ZEsp+xw20RH37yh+rcddB7muLxh1H5GvzTj+e5wzQJKVSdBHQA8
         3kX3NFXpBzXGY6xqtb5rz8FhqHHYBjn9MYXyEr0btpXcBqbmgm13Rmj9t5m4gc01fNT/
         HIaITkJWNlSNlNSzfjKvtVs6bwslIN8oIiE2Fo2fgQ+hFmk2zi4/vd1Q1w11T43A3KWq
         jRqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=dS//4CC9MWKZdhc6dDGuWag5X3V5/eWtf6zZq+T21N0=;
        b=tQu84+SKgJhJa+YHEKL0I09e847N/OwRIM7K9LSysw2BDdV+otfLab2s/DfEfayjRI
         G994sgAfU77ZSpcK5NMpB7EH/+2Wt/Aia2NSUIyWSwHRv7dNsgJ0qIh/2sZXQ+/1z8KH
         ZMjaT4ZBJJ2r1M47CeWyHEeyq39xPmKmRvmFv4prWmd1yJwJsrmbfuRIx8ATPw7inhm0
         N90oJPVmilkJPJvqs9xHVQzGW/RD9h3Vv92VMpaX4BfaN761Es3WifZ7V54COOjAI9nm
         LptbtCkkkQauK7pl5BxtQp1FIzpGKDTl5yt3+15wpfrU2LWX8aBHHX2Fy63HwFvSWj6N
         VJHw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=CXK+4CeH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gu12-20020a056214260c00b00534dc6c5a50si4929480qvb.76.2023.01.17.08.17.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Jan 2023 08:17:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=CXK+4CeH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pHoeS-0003TG-Ol; Tue, 17 Jan 2023 11:17:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pHoeQ-0003Ot-8M
 for qemu-arm@nongnu.org; Tue, 17 Jan 2023 11:17:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pHoeO-0004YI-Sy
 for qemu-arm@nongnu.org; Tue, 17 Jan 2023 11:17:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673972248;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dS//4CC9MWKZdhc6dDGuWag5X3V5/eWtf6zZq+T21N0=;
 b=CXK+4CeHeDQE0TAtD4ZLwwtNykIdslLGzlNaNqQDBJvXbiKW6ciwpMEqT2sQEuJfpGl3cd
 bW6qQNVSg7/lUinaqPBRF7C/G3SoGWl1xkWjx9jWaN1ekyUM7f2ZIhW5Dr4jJ5YnaGl8cl
 EtXsC5E5KrKDvdAaX51SVScBOOFOAYo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-14-hNhV7_I3Ma2ZgfCj843hIQ-1; Tue, 17 Jan 2023 11:17:02 -0500
X-MC-Unique: hNhV7_I3Ma2ZgfCj843hIQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3C0143815F94;
 Tue, 17 Jan 2023 16:15:03 +0000 (UTC)
Received: from localhost (unknown [10.39.194.48])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B11962026D76;
 Tue, 17 Jan 2023 16:15:02 +0000 (UTC)
Date: Tue, 17 Jan 2023 11:15:00 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 qemu-trivial@nongnu.org, Alistair Francis <alistair@alistair23.me>
Subject: Re: [PATCH 0/4] hw: QOM housekeeping around IOTHREAD / IRQ types
Message-ID: <Y8bJhDWrIhP2Uq7C@fedora>
References: <20230113200138.52869-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="kASuhU4CZ/BEMZkj"
Content-Disposition: inline
In-Reply-To: <20230113200138.52869-1-philmd@linaro.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: WIbIFw1IEcBq


--kASuhU4CZ/BEMZkj
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 13, 2023 at 09:01:34PM +0100, Philippe Mathieu-Daud=E9 wrote:
> - remove unused code
> - use recent QOM macros
> - use CamelCase typedef
>=20
> Philippe Mathieu-Daud=E9 (4):
>   iothread: Remove unused IOThreadClass / IOTHREAD_CLASS
>   hw/irq: Declare QOM macros using OBJECT_DECLARE_SIMPLE_TYPE()
>   hw/or-irq: Declare QOM macros using OBJECT_DECLARE_SIMPLE_TYPE()
>   hw: Replace qemu_or_irq typedef by OrIRQState
>=20
>  hw/arm/exynos4210.c                  |  4 ++--
>  hw/arm/mps2-tz.c                     |  2 +-
>  hw/core/irq.c                        |  9 ++++-----
>  hw/core/or-irq.c                     | 18 +++++++++---------
>  hw/pci-host/raven.c                  |  2 +-
>  include/hw/arm/armsse.h              |  6 +++---
>  include/hw/arm/bcm2835_peripherals.h |  2 +-
>  include/hw/arm/exynos4210.h          |  4 ++--
>  include/hw/arm/stm32f205_soc.h       |  2 +-
>  include/hw/arm/stm32f405_soc.h       |  2 +-
>  include/hw/arm/xlnx-versal.h         |  6 +++---
>  include/hw/arm/xlnx-zynqmp.h         |  2 +-
>  include/hw/or-irq.h                  |  5 +----
>  iothread.c                           |  4 ----
>  14 files changed, 30 insertions(+), 38 deletions(-)
>=20
> --=20
> 2.38.1
>=20

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--kASuhU4CZ/BEMZkj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmPGyYQACgkQnKSrs4Gr
c8jskAgAr2qJn9PIVLPHgAOTV9G77je0Td+PM0xLKU8TeWqolhsn/ree/BmAu2+G
trFb150VcsfhMWy4Fp59wJSE7xOQynwVEoAPLl77THlWtkrID7Ig9DW4mnlemDKe
hvEM7t+fiddEcdXEVgReKi7QOZyrLGXtmGXgkJgRkJ47IXODrnhAQ3hN2Azo9RbR
ucvCqPVjw3ng1ZuI9NG01Y0hfEXM7SlHG/p097AWOUPlp8D078E82RNLndnFkYXG
5b3TL5sCbrbdM2a348P/jx4vMjxcGfORfh9kwzreisAL/0g23EUBQzESZsDMXr20
mEcN3SisKSgWRkTUC1WeO74//yrYYg==
=wQRH
-----END PGP SIGNATURE-----

--kASuhU4CZ/BEMZkj--

