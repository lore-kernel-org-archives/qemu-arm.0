Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp192642lfm;
        Thu, 27 May 2021 03:01:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwNbjNyhOCJbp2lR6b0+U0CLZH0xfCd1M+oT/ZfKyb0O73Zwq4uPzAr91tXeQoK4WWnbOMI
X-Received: by 2002:a05:6602:72f:: with SMTP id g15mr2179587iox.5.1622109714226;
        Thu, 27 May 2021 03:01:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622109714; cv=none;
        d=google.com; s=arc-20160816;
        b=BAqt+BVQIkTjrLZqgbAE1QvV3wzykj4uYUp9UL8GJC8qnQIZpBXFInZmlWR/ZJ1EMi
         hTuxljRXAgb82bPE1lojKScUx9A0tV6VoVWsgPH1QG8goKvbCjfcnfEsKH9T6hK4dZPP
         tjakEs1w+lITKOF7Z3B75GOjEbmRIiU/goDtwzxmRm71BTCjzWWuMvqolGgqDBFE6vig
         sxvaA48/YQ0FlGq8i7CIKCK5qgXcVzsGzd63KvNfY3I1jCAZEbxN302c6U6CX6Y/CFW9
         YjrZyC4pew7QXh8DpNjxX5HLdy/PiodHQvnne7OZ50TI9bt4bo7k8TNWHdMcxClbIA6I
         6fbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=mcDgi9hTG8Vv1O6v/vf5EtYlsjhgWZxHD/rxGKh6A1U=;
        b=f3ujXq8WzYy1yzwF9ImI7GnJmS0f6lr8FeC85+lL3JXm9jyphtXlEl+UhbHANTtnZS
         gF+YqCQPyaV8uuE14iR4Rq09D56Zq9T4XxBSzLTtNWKTEJvF+83Bp8jaurCtO+OdEzTQ
         uveDPntTQoNd8AuU4S+9JAnq8l/dkW6wVtUj+aiHMfyfzMH4m/wID+9M9AydhOshA9QC
         RhYC736RQXclVK1sp04rzywv/7OHVWgnz/2m8nDE0Ahi7oanO6L4Y2B3tFEh+przu5tt
         ihyoMSoodNO7Pd2wxFc1V00dm6OnY/8so6vvd5HQyKtSMmwRVT1cctsdH+imTdDijriW
         ToBA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=WnVdrYbK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k7si2026251ilh.42.2021.05.27.03.01.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 May 2021 03:01:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=WnVdrYbK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lmCpt-0003Rv-L3
	for alex.bennee@linaro.org; Thu, 27 May 2021 06:01:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1lmCp0-0003Of-B8
 for qemu-arm@nongnu.org; Thu, 27 May 2021 06:01:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22385)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1lmCoq-0000Uq-9I
 for qemu-arm@nongnu.org; Thu, 27 May 2021 06:00:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622109644;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mcDgi9hTG8Vv1O6v/vf5EtYlsjhgWZxHD/rxGKh6A1U=;
 b=WnVdrYbK2tmPRx1JoJUqvfKObTPnfEolL4i2D2QZj2bU+QGIdph/zRWH1NA+4rOOyFAsoR
 MiZzNmvzLNXDoRcdFC/zA36qvhl5ux/DHuH8n4sPhz0BuBCSECJ7jcwoPk2PbJ6oTsEH4H
 /ZxOulLNIbdSUl5/8s08XMHZXmjz7nk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-530-yc-U1BrsMuSlalx4emj1xQ-1; Thu, 27 May 2021 06:00:40 -0400
X-MC-Unique: yc-U1BrsMuSlalx4emj1xQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E7F1080ED91;
 Thu, 27 May 2021 10:00:38 +0000 (UTC)
Received: from localhost (unknown [10.33.36.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5DB4067CC4;
 Thu, 27 May 2021 10:00:33 +0000 (UTC)
Date: Thu, 27 May 2021 12:00:32 +0200
From: Sergio Lopez <slp@redhat.com>
To: Alexander Graf <agraf@csgraf.de>
Subject: Re: [PATCH v8 01/19] hvf: Move assert_hvf_ok() into common directory
Message-ID: <20210527100032.xkq57c37jepff6bz@mhamilton>
References: <20210519202253.76782-1-agraf@csgraf.de>
 <20210519202253.76782-2-agraf@csgraf.de>
MIME-Version: 1.0
In-Reply-To: <20210519202253.76782-2-agraf@csgraf.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=slp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="bta7ssz4bo6dj32q"
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
 Eduardo Habkost <ehabkost@redhat.com>, Peter Collingbourne <pcc@google.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm <qemu-arm@nongnu.org>,
 Frank Yang <lfy@google.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: I27Ej9J3IePl

--bta7ssz4bo6dj32q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 19, 2021 at 10:22:35PM +0200, Alexander Graf wrote:
> Until now, Hypervisor.framework has only been available on x86_64 systems=
.
> With Apple Silicon shipping now, it extends its reach to aarch64. To
> prepare for support for multiple architectures, let's start moving common
> code out into its own accel directory.
>=20
> This patch moves assert_hvf_ok() and introduces generic build infrastruct=
ure.
>=20
> Signed-off-by: Alexander Graf <agraf@csgraf.de>
> ---
>  MAINTAINERS              |  8 +++++++
>  accel/hvf/hvf-all.c      | 47 ++++++++++++++++++++++++++++++++++++++++
>  accel/hvf/meson.build    |  6 +++++
>  accel/meson.build        |  1 +
>  include/sysemu/hvf_int.h | 18 +++++++++++++++
>  target/i386/hvf/hvf.c    | 33 +---------------------------
>  6 files changed, 81 insertions(+), 32 deletions(-)
>  create mode 100644 accel/hvf/hvf-all.c
>  create mode 100644 accel/hvf/meson.build
>  create mode 100644 include/sysemu/hvf_int.h

Reviewed-by: Sergio Lopez <slp@redhat.com>

--bta7ssz4bo6dj32q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEvtX891EthoCRQuii9GknjS8MAjUFAmCvbbUACgkQ9GknjS8M
AjUumA/+KqbqRxsOi2T6wJWg99+A4vcAEhWTQvAIJcKE825TvEVW81RprG6pgAj3
doFflIeyDjDnOomazk978SelG+dJCPDYvAv6YCOJM5BFLUCWDm5S4/9VMf1FSTAo
WeCJ1UTTdXyinQVBvoyqkEdVE9q5XPaN2Nz9eDVED03mzaFZIDoEgW47C0jlw3Gv
5PFpfrFKnSsN+zFg5KFNUTU/mI/Ipxo7wSNFMKJgc9y4994Cyors4o043v3A9fF/
NDrSSivxnltDUADxBeQhADo7U+SDfR9qPjmCKNWyxz1jkVQPZ6StfuDatOjADFf0
l0zbO45zxAIasGN+9em+oGBkYVnbAdUt8M8IBUCgVRbDjbCoCz3B1lfyKg1RgLZ0
79mff4PZ+t27T3R3yeM2gmuz56MingE9SNXXrIjO/j1vDFk9s01g0v+herVbs0zW
80R+VNMudU3e5H9LTqWlv1Bu9CAu96NofyZ2zsVE2n8IM3DiEMWO18XjMuS7Qmma
WuILczRTJ9qHR4be44I4IOIFDbRRurOJNelow9rD0z8V5cUVU25WrwuKpCCRk+p+
MtFYwN6IUxTTdmNoh8W56b980miSKTd4hIaADR8dXyEFNbWae7LtOtw1g0fr93M9
0Dxm2vxp+bWv1pzIImZMEbZ4dBXx40xvJmHKp/S9WMq3i/2oE3g=
=dzlR
-----END PGP SIGNATURE-----

--bta7ssz4bo6dj32q--

