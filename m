Received: by 2002:a05:6512:e9d:0:0:0:0 with SMTP id bi29csp886818lfb;
        Wed, 30 Mar 2022 05:07:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzKR9Ijc6Oa2dO3UyrT95Cp6YlgayDf74pDqZ2nIiVbDwiviNEhRzWyHL2Tic0M64tUQNc3
X-Received: by 2002:ad4:5ba5:0:b0:441:6ee2:9a30 with SMTP id 5-20020ad45ba5000000b004416ee29a30mr28830035qvq.36.1648642033848;
        Wed, 30 Mar 2022 05:07:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1648642033; cv=none;
        d=google.com; s=arc-20160816;
        b=ApGgBMs7y//7XzBR8yK7HRhDAno6bu69AFFRa1MyLUoFrO7uvsD2NtklbD4mGjB2l9
         dv1u2UO7CTgskyl28XI/mHyEJq+xQlpzJiWf14nTChkz0iFNOvvj6TAOdm2OJ1vqyRTP
         q5n6np/vivk5Djvrhpjrk2WkQzBJnjobCwcLpwR7p/Z5vFnWmxHfKK+dym82bbVMd4Lh
         nbtgpdZn5RGADwVfw46IrFb0btVr7gcwi/UsmJBC/NjPOT+avZJ1RbqnUgiMjxmEkW+5
         Liz0ag4v7PdkyNmiJtBnhuuJaCquheciGbZA+8y5+6A3fx3KFnhXE3B5PJ1JDz+nQRdL
         k96g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=WF3Y6wSAhjVL90I5Zq3P6Xa0Jj8xsBfWt9fmuGVr6mI=;
        b=i8DD3WdiKUq7pe+/EBOGOpJG4GI1SX88P8KEkW/MbVXNgTym3TGdvP8npjv0efQK0z
         4/22a4y1/DBYTyiAjs+ch+qnPECQiqfyDHzoz8qXyUk3ZCWIE4hOrJiWu9daKYt2RTS8
         8ozyl8RE65SL68tzc6uweOKKzthS/3PtQnUrCrOtt1hiNgp0vipbd/Ie9B1+hgIG0NMF
         n6u4/mpKZdJWlaD1BOoeynaYDfJ88aIw3iTFQBoXfZwqapM551OsGdDSsL/lq3uyHx4Z
         9ZJ6qJSNXCy+wMTYeJ84yVnnu1p3a2OO+dpKo3NPZUXezUFMMXsOBC13Cl85TKmcDPIi
         0Nhg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=EY40jLuF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j123-20020a378781000000b0067e4be23a4bsi10422286qkd.656.2022.03.30.05.07.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 30 Mar 2022 05:07:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=EY40jLuF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nZX6X-0008JE-BC
	for alex.bennee@linaro.org; Wed, 30 Mar 2022 08:07:13 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nZX67-0008GO-H3
 for qemu-arm@nongnu.org; Wed, 30 Mar 2022 08:06:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31526)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nZX64-0001H9-Vq
 for qemu-arm@nongnu.org; Wed, 30 Mar 2022 08:06:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648642003;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WF3Y6wSAhjVL90I5Zq3P6Xa0Jj8xsBfWt9fmuGVr6mI=;
 b=EY40jLuFZgubkgvCOBvJWPBi3DKSVmarqx2nxTOc8YWFJ2ST1CLhQQYM3iBumZ0vRIH7BM
 5yCnH9/u1apANaXBNdb4rc3boq/rbRiKm3LynMbhXD6xuLYQe6IuYijKu0jrmTeKSBX7Fb
 mZYu4Pth6VAlApehrt4cmGMuTF8lfaE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-489-dVwkvtUbPZy-IKgexgCh3g-1; Wed, 30 Mar 2022 08:06:40 -0400
X-MC-Unique: dVwkvtUbPZy-IKgexgCh3g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8F953380450B;
 Wed, 30 Mar 2022 12:06:39 +0000 (UTC)
Received: from localhost (unknown [10.39.195.140])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4798C1121314;
 Wed, 30 Mar 2022 12:06:39 +0000 (UTC)
Date: Wed, 30 Mar 2022 13:06:38 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: marcandre.lureau@redhat.com
Subject: Re: [PATCH 1/5] trace: fix compilation with lttng-ust >= 2.13
Message-ID: <YkRHzqi0y/dA1Ptw@stefanha-x1.localdomain>
References: <20220328084717.367993-1-marcandre.lureau@redhat.com>
 <20220328084717.367993-2-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Pt5p326PevMT0P9s"
Content-Disposition: inline
In-Reply-To: <20220328084717.367993-2-marcandre.lureau@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 David Hildenbrand <david@redhat.com>, Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Beniamino Galvani <b.galvani@gmail.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Antony Pavlov <antonynpavlov@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9O+PmLepwAN9


--Pt5p326PevMT0P9s
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 28, 2022 at 12:47:13PM +0400, marcandre.lureau@redhat.com wrote:
> From: Marc-Andr=E9 Lureau <marcandre.lureau@redhat.com>
>=20
> On Fedora 36, with lttng-ust 2.13.1, compilation fails with:
>=20
> In file included from trace/trace-ust-all.h:49085,
>                  from trace/trace-ust-all.c:13:
> /usr/include/lttng/tracepoint-event.h:67:10: error: #include expects "FIL=
ENAME" or <FILENAME>
>    67 | #include LTTNG_UST_TRACEPOINT_INCLUDE
>       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>=20
> In lttng-ust commit 41858e2b6e8 ("Fix: don't do macro expansion in
> tracepoint file name") from 2012, starting from lttng-ust 2.1, the API
> was changed to expect TRACEPOINT_INCLUDE to be defined as a string.
>=20
> In lttng-ust commit d2966b4b0b2 ("Remove TRACEPOINT_INCLUDE_FILE
> macro"), in 2021, the compatibility macro was removed.
>=20
> Use the "new" API from 2012, and bump the version requirement to 2.1 to
> fix compilation with >=3D 2.13.
>=20
> According to repology, all distributions we support have >=3D 2.1 (centos
> 8 has oldest with 2.8.1 afaict)
>=20
> Signed-off-by: Marc-Andr=E9 Lureau <marcandre.lureau@redhat.com>
> ---
>  meson.build                              | 4 ++--
>  scripts/tracetool/format/ust_events_h.py | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

Thank you!

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--Pt5p326PevMT0P9s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmJER84ACgkQnKSrs4Gr
c8hyCAgAgBWCwx138hMb1OBxp4jl8wVXw92ueIFHUubpdxFw9e8wlN3uwO02eLJ/
6Zv0abjSKk09r5sgieOTbhwUAEL7s8oGJNRY5vVTISp5EUwjOaQQSBGDEpnnVxAo
BQfIu3ZhyZn7ZXQz3mEkUSzuIHKPluZGO/ssqJGiTB84FbH8m2bnTBPj0p8n3FiF
hBtbnVbgGLb5Fr3owGH/i1584yRUQNEgKBOelM5f00FyDM4PPNsRo2OD+Yx04xY0
bEcx2V6vPC/vY+FFlb7Y+vG39ExdQORYVgReDsmc0diviFLSMEQEPrHxcYey4ELP
HOCtiJ9ERkr/s3puE1+GGPvZ9Jmuqg==
=2b0Q
-----END PGP SIGNATURE-----

--Pt5p326PevMT0P9s--

