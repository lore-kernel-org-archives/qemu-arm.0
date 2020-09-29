Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp4713324lfq;
        Tue, 29 Sep 2020 09:02:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxRFeKB0rwlWOcvsGI8oix/6KW238CLn2QjOYA5mzc+lNFznC4qzDvKyt0XJiwd5IghmZbv
X-Received: by 2002:a5b:4d2:: with SMTP id u18mr6338262ybp.56.1601395331762;
        Tue, 29 Sep 2020 09:02:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601395331; cv=none;
        d=google.com; s=arc-20160816;
        b=k6ti37b4GGn+MwuA4KA0DPJIrDkmuicrCU39S7Fm8XWVHgyj43SgpqYU4CgMc2w/GH
         YlqW9DYvWeJqdeuiTka1AR3C95mdmCsB9UXKUkrwdL+Wcva8/2/hTE4LEePdBRFL8vyE
         IFXvhhCEWFtn5q2Rzxg2InKFUufCltPLYUwl0SeqXj+BJUSi5gszbx+8eVVDWzDjpR/u
         7idOMYA5FvOW3+amvPvRfcHSgSjJEmAT/xIG1VOb0hM+ucV+Fru2ehbAJR0oesHyXj/B
         KCFZ1mz9FJZht6/RYFZs4GV04OSXb9VFW8O3+wuXhvlh3ShTF1jcPVX6VBBP0PWP3CbG
         8kdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=N8hr4pAyQSdAWYa5vOUugmVSNFm/4X3EnoakMPUfEwk=;
        b=g5se4lNNsZYNCIaPVgcH1Og9ocp217iAWq3HpOAuffWiG/c7iRIdeyUuG/ZCvtTvUi
         kD/wN+WcYcTDKACdrQOqqq9J4//oyVYNp8qvgwj38otEkglljQbLpmnOByeBohekVXa0
         gcfN+mk2mL/11gaP7h5ngQCQVOfCC0IBwlyaBPM/Ayxdh5Fy6P/RNELURfgSZMj7lyYi
         LkJxK4sfr+461QLeLvxNrDH+tawJRVnT6Fdn20wY9B1MBjTPbCxOCfGWX1bCAJGNMamF
         FDB6X4/H3+W8n+UV8InVS8l6uS5SMcHuVouP0rgDCwi5bKdoEmFNe802bSROIc2wFasJ
         +ywg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=FmW0h55u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 191si4389655ybd.475.2020.09.29.09.02.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 Sep 2020 09:02:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=FmW0h55u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kNI4w-0008Lu-Uv
	for alex.bennee@linaro.org; Tue, 29 Sep 2020 12:02:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kNI2x-0007mS-Ru
 for qemu-arm@nongnu.org; Tue, 29 Sep 2020 12:00:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:32514)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kNI2u-0006ca-MQ
 for qemu-arm@nongnu.org; Tue, 29 Sep 2020 12:00:07 -0400
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601395203;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=N8hr4pAyQSdAWYa5vOUugmVSNFm/4X3EnoakMPUfEwk=;
 b=FmW0h55uk0/r78idbUoFDQUFixlSeB8RS5I5d7NTwvE+A6HKL81dwTWUNiIGNaDeXLbE8r
 ZhY1quOjvgx9MBWk/W8wn3l/g4e64rrG3v9eOk2YYljmN9hh6+agFp9sxEFfHBwl426S+M
 Pjlj2bPqOI3tk8fPgERyOhSbDBJwIZs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-200-giww8qCvMwih6J64--_0WA-1; Tue, 29 Sep 2020 12:00:00 -0400
X-MC-Unique: giww8qCvMwih6J64--_0WA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 72A2210A7AE3;
 Tue, 29 Sep 2020 15:59:59 +0000 (UTC)
Received: from localhost (ovpn-113-13.ams2.redhat.com [10.36.113.13])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F1E305C1C4;
 Tue, 29 Sep 2020 15:59:52 +0000 (UTC)
Date: Tue, 29 Sep 2020 16:59:51 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v2 2/2] util/vfio-helpers: Rework the IOVA allocator to
 avoid IOVA reserved regions
Message-ID: <20200929155951.GB191675@stefanha-x1.localdomain>
References: <20200929085550.30926-1-eric.auger@redhat.com>
 <20200929085550.30926-3-eric.auger@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200929085550.30926-3-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="+pHx0qQiF2pBVqBT"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/28 22:47:55
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.687,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: fam@euphon.net, lvivier@redhat.com, cohuck@redhat.com,
 qemu-devel@nongnu.org, mreitz@redhat.com, alex.williamson@redhat.com,
 qemu-arm@nongnu.org, kwolf@redhat.com, philmd@redhat.com,
 eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: geJ7/jQezcps

--+pHx0qQiF2pBVqBT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 29, 2020 at 10:55:50AM +0200, Eric Auger wrote:
> diff --git a/util/vfio-helpers.c b/util/vfio-helpers.c
> index ba0ee6e21c..71145970f3 100644
> --- a/util/vfio-helpers.c
> +++ b/util/vfio-helpers.c
> @@ -667,6 +667,50 @@ static bool qemu_vfio_verify_mappings(QEMUVFIOState =
*s)
>      return true;
>  }
> =20
> +static int
> +qemu_vfio_find_fixed_iova(QEMUVFIOState *s, size_t size, uint64_t *iova)
> +{
> +    int i;
> +
> +    for (i =3D 0; i < s->nb_iova_ranges; i++) {
> +        if (s->usable_iova_ranges[i].end < s->low_water_mark) {
> +            continue;
> +        }
> +        s->low_water_mark =3D
> +            MAX(s->low_water_mark, s->usable_iova_ranges[i].start);
> +
> +        if (s->usable_iova_ranges[i].end - s->low_water_mark + 1 >=3D si=
ze ||
> +            s->usable_iova_ranges[i].end - s->low_water_mark + 1 =3D=3D =
0) {

I don't understand the =3D=3D 0 case. It seems like we are allocating an
IOVA beyond usable_iova_ranges[i].end?

--+pHx0qQiF2pBVqBT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl9zWfcACgkQnKSrs4Gr
c8hnOggAiZISmIVXIB1CYgD5ryEilvJO/zzOZENq24WN75MQjgrxXyhoe0pnk5S2
ONN3znYQn36KG5t8nG5a+JLouOWZsrLteUXg8AvCfN6kv/YkiOzJzP4GZ5X3NYvn
12QzAVvlbxNFvOz7ySxahJvQe2FCyfVRG8D/GeZofzGnKgphivsyaAT3bfS5hZqQ
w5L2ugRZSS6+jTPJ+hLO7eV8BZcUyeaQHEYnignBrmmR3CG1btAYeL++ksIbAdSv
Gv1uW53u35oXSOU3bjxfHdox9smRKrc6SHdOctI7dsYkKwJFGdtfbPiK4QOkEEjP
MC4/NapG3vSWUVZWh+nE8U+vbYXn0g==
=qPxM
-----END PGP SIGNATURE-----

--+pHx0qQiF2pBVqBT--

