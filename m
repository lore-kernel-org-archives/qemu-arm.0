Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp2729315lfq;
        Mon, 14 Dec 2020 08:59:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxLZIEO/AF8syxpUrNEkqWRJ8yI5PpzZIszxq77Icyeg8YY54xa4BzpYCmXYlKzaSkcbqXL
X-Received: by 2002:a25:d10f:: with SMTP id i15mr38161823ybg.244.1607965143738;
        Mon, 14 Dec 2020 08:59:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607965143; cv=none;
        d=google.com; s=arc-20160816;
        b=f0Xehrklq/Fc6GmBjiklAHKFXfcsNRvEo9CN2dBb0o+RFoGg58HZ0NDVg86k2L+W2k
         C+PGE7KRPeaJZxxbIBW5YZ45Ax/T7lL+NrsLxftBB3YrXsMI+ijDXdJBkSsNPuCBpgup
         cG7TBj2aLk9ntVThenDfJO9wDYGQ7u9HJt8PCiMX4WUs8vfEvOwae0M8MGJ5rWKWXHkj
         jXYCo2dtN15G8Zf6Ri2EmGqsllnDgbb3gW/Jtya9jILpxEW21kga5ILyXyFFddh/p3gR
         ek0vif0L8fHqBSQjcW8bgLfhX5atd4Mje6MOQF/JZkQc7O4rBgP7p66wYw3eWywJjZsG
         muXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=nzkkrxNsf/tKSpJy0Ol/DYhuNPJEQyRqILQRkCfzVFw=;
        b=Joyn5IdBZ4706bMPHzPoQgT68gE6dcW+a7IckxDIiaIX5OR1aeOyHOq5r+oB8phNcv
         OAyI31g6jdDMmIHoamiX8MQRHR3Ze5H56inl+XUyeyWEt/zfIYV2h7NYtmUvvqneWtRV
         xo8pTqQzvnCCHhliodcvP5zK7GV3kddzyDrVZMwGuR9G8FY+0SSOYWHYUPf3uzJADxMS
         qX5T6/FoMsCLxSv4rZRtTKr5VeS2S4KjuTSBiFGlCwtHIK/m7GjUTF96rmzl9HdsKh0r
         azR/slFuT3DqQT/60gY9jgbrYy4Wj6b5e6rU5sjLxHzEy6Z8i2Sm8HPnHR40myCsRyvz
         MLMQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="OKK/22HE";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v4si18375452ybj.249.2020.12.14.08.59.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Dec 2020 08:59:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="OKK/22HE";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1korBf-0002xr-3j
	for alex.bennee@linaro.org; Mon, 14 Dec 2020 11:59:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1korAX-0002ow-Gk
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 11:57:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29491)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1korAT-0003dL-2f
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 11:57:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607965066;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nzkkrxNsf/tKSpJy0Ol/DYhuNPJEQyRqILQRkCfzVFw=;
 b=OKK/22HEkZddUhpVI8gVNgUxzULUXeTxVv5VsJNn4NTD38eTo/2ird+4hsow3bojQmk7yX
 HbnylFKtpr1NuTIP2qW3otBjWniwyljBnV+T5Z8cC4gDoVvvUY3FjCgAUVVE/ARgYnDtyl
 +ABU5mG15gwtO5BhkPfhN0acSUgFOr8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-51-dOTt1Uv3MgeXrCvhXQnztA-1; Mon, 14 Dec 2020 11:57:42 -0500
X-MC-Unique: dOTt1Uv3MgeXrCvhXQnztA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 007DB1006C85;
 Mon, 14 Dec 2020 16:57:41 +0000 (UTC)
Received: from localhost (ovpn-113-200.ams2.redhat.com [10.36.113.200])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E6D352BCD0;
 Mon, 14 Dec 2020 16:57:32 +0000 (UTC)
Date: Mon, 14 Dec 2020 16:57:31 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: marcandre.lureau@redhat.com
Subject: Re: [PATCH v3 06/13] virtiofsd: replace _Static_assert with
 QEMU_BUILD_BUG_ON
Message-ID: <20201214165731.GH620320@stefanha-x1.localdomain>
References: <20201210134752.780923-1-marcandre.lureau@redhat.com>
 <20201210134752.780923-7-marcandre.lureau@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201210134752.780923-7-marcandre.lureau@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Enx9fNJ0XV5HaWRu"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, qemu-arm@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 philmd@redhat.com, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zOhlO4gzzqqG

--Enx9fNJ0XV5HaWRu
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 10, 2020 at 05:47:45PM +0400, marcandre.lureau@redhat.com wrote=
:
> From: Marc-Andr=E9 Lureau <marcandre.lureau@redhat.com>
>=20
> This allows to get rid of a check for older GCC version (which was a bit
> bogus too since it was falling back on c++ version..)
>=20
> Signed-off-by: Marc-Andr=E9 Lureau <marcandre.lureau@redhat.com>
> ---
>  tools/virtiofsd/fuse_common.h | 11 +----------
>  1 file changed, 1 insertion(+), 10 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--Enx9fNJ0XV5HaWRu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl/XmXsACgkQnKSrs4Gr
c8hM/QgAo7goQSbSjtniQApqy5STJw15VfReJdpV17jhRtfEYUPuLzhVUULS8G8b
WI0xMh1L83QCQmaFxogrLPGI+zXM+slDrmn/zPcX3tyVXcs6UfJw6hbV2gk1y8fA
kOCUVF1aTRe5M2SezgchbA6badCZ+Wv28xdAqvVbARJXOKKDWP3lZwaKsUESu9Os
JyzoFCOajcEZru/pMKpd3DYKKjmHyr+AWMaY3+LEXAjJYi2SZfuTNDb30aiomP9N
9ArM4OFuww0DmiKzYaOA8IurGv3KSXFbxMyckl05OKHW18iAjX2e9o7lXe3OFFOO
LI+MK8lFJx1vbKX7lBL8Li1tsThXnA==
=jtpu
-----END PGP SIGNATURE-----

--Enx9fNJ0XV5HaWRu--

