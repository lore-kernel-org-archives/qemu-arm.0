Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp5337902lfq;
        Wed, 30 Sep 2020 02:18:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz0+To8pNaaBVCarcCe9oISm388VBD48fdqRMfulMTRMqFq+BoXgE6s3c7/k5HrhNlfdArp
X-Received: by 2002:a25:9c08:: with SMTP id c8mr1797845ybo.24.1601457536999;
        Wed, 30 Sep 2020 02:18:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601457536; cv=none;
        d=google.com; s=arc-20160816;
        b=duXIZJfXbarOwFAIxJpCUsJGV3KuuLw77cf5sVxqSod4G7SiBdbAJU+UqN/TQQFiXA
         O06on5OILADgCxpaj/Vf8zYrTwx7bnLPanHatMU19lvcTcTicqGfATJheOyGYjtpZmiX
         4ylr8T7E4NKbHZx+1gTkXkOukvvV6n94ZTlw1u+1+icJB+LlogvY1gSzJGdEvipUBTYE
         MYPvRhsw0kmSlTtmxgJi2OQqUetwF8nKFJl9ZX/TTd9cS1MGQ5349cY4rEcucpKMFXwg
         yBv+An5XWMCRKSNuMbNpRV5/iT5cpWFTyYu+Kq+3JOQMma6J0SzUV1S1uelle4lAartw
         Ym5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=5hLExyzdHsPeln/6WT2UppnqZBUe9wmyC9llYGHLEkU=;
        b=Lo+37RB7HCxEFWSFyP72DVm3M+UcmyRLGna42zLJUcHOih4o6wsRJLOsYYje2Qa4Yu
         709kytCNPG8EoMWKmnZKmyAs5R5gFI1hNEErfz9m6HlzxDP+svkQ/ReaYnf9AUIdXDk8
         Z81sWIoTDnA74fruYYtWq63IqVThg8KN/uKDp4t0INhiOgVX3oh17KSyNLQ1A/ZOnvw7
         fZ30wY29Q6um9xj0HkHjZfoJtuoBCcA15Pgb9jKGxYXgZzMw3pHfjeT5Z2e+rQOUbLMz
         PJ0Y13lCXt9/LHpKU4Rqp4RRqN6DzJ6i+UuCPwWvUVQe20tMdA9gTOEmIOlzwQqtAG42
         uT+g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=LL9Cf+0a;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h188si1192855yba.388.2020.09.30.02.18.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 30 Sep 2020 02:18:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=LL9Cf+0a;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kNYGG-0006ej-Du
	for alex.bennee@linaro.org; Wed, 30 Sep 2020 05:18:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kNYG3-0006eN-Sf
 for qemu-arm@nongnu.org; Wed, 30 Sep 2020 05:18:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:46583)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kNYG1-00024Q-CF
 for qemu-arm@nongnu.org; Wed, 30 Sep 2020 05:18:43 -0400
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601457519;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5hLExyzdHsPeln/6WT2UppnqZBUe9wmyC9llYGHLEkU=;
 b=LL9Cf+0aqT8//nQkdBEzfeXoA+IMKLjTQeYcfDDiFBei6BCFaer/7g4mEKLH+xyS5oVTGb
 F7yfUmHgu6KJLE2iSBydq9A7fxk/pea7/xDvCXm6DEmLlQ/H/f9tH2umIFi3o/UWffHWdH
 xm38TPaKFbj3g544OhY29z9j5sYu1I4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-450--yvSdmZTPMayWmgNBT2DdQ-1; Wed, 30 Sep 2020 05:18:37 -0400
X-MC-Unique: -yvSdmZTPMayWmgNBT2DdQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 175101084D68;
 Wed, 30 Sep 2020 09:18:36 +0000 (UTC)
Received: from localhost (ovpn-114-33.ams2.redhat.com [10.36.114.33])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7D3551992F;
 Wed, 30 Sep 2020 09:18:29 +0000 (UTC)
Date: Wed, 30 Sep 2020 10:18:28 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Auger Eric <eric.auger@redhat.com>
Subject: Re: [PATCH v2 2/2] util/vfio-helpers: Rework the IOVA allocator to
 avoid IOVA reserved regions
Message-ID: <20200930091828.GC201070@stefanha-x1.localdomain>
References: <20200929085550.30926-1-eric.auger@redhat.com>
 <20200929085550.30926-3-eric.auger@redhat.com>
 <20200929155951.GB191675@stefanha-x1.localdomain>
 <6ebdb1f7-792b-6fbe-d4b3-f06aafc8deef@redhat.com>
MIME-Version: 1.0
In-Reply-To: <6ebdb1f7-792b-6fbe-d4b3-f06aafc8deef@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="S1BNGpv0yoYahz37"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/30 00:31:59
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
X-TUID: dvKXv9GDUcRX

--S1BNGpv0yoYahz37
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 29, 2020 at 09:44:48PM +0200, Auger Eric wrote:
> Hi Stefan,
>=20
> On 9/29/20 5:59 PM, Stefan Hajnoczi wrote:
> > On Tue, Sep 29, 2020 at 10:55:50AM +0200, Eric Auger wrote:
> >> diff --git a/util/vfio-helpers.c b/util/vfio-helpers.c
> >> index ba0ee6e21c..71145970f3 100644
> >> --- a/util/vfio-helpers.c
> >> +++ b/util/vfio-helpers.c
> >> @@ -667,6 +667,50 @@ static bool qemu_vfio_verify_mappings(QEMUVFIOSta=
te *s)
> >>      return true;
> >>  }
> >> =20
> >> +static int
> >> +qemu_vfio_find_fixed_iova(QEMUVFIOState *s, size_t size, uint64_t *io=
va)
> >> +{
> >> +    int i;
> >> +
> >> +    for (i =3D 0; i < s->nb_iova_ranges; i++) {
> >> +        if (s->usable_iova_ranges[i].end < s->low_water_mark) {
> >> +            continue;
> >> +        }
> >> +        s->low_water_mark =3D
> >> +            MAX(s->low_water_mark, s->usable_iova_ranges[i].start);
> >> +
> >> +        if (s->usable_iova_ranges[i].end - s->low_water_mark + 1 >=3D=
 size ||
> >> +            s->usable_iova_ranges[i].end - s->low_water_mark + 1 =3D=
=3D 0) {
> >=20
> > I don't understand the =3D=3D 0 case. It seems like we are allocating a=
n
> > IOVA beyond usable_iova_ranges[i].end?>
> It is meant to handle the case were low_water_mark =3D 0 and
> s->usable_iova_ranges[0].end =3D ULLONG_MAX (I know it cannot exist at th=
e
> moment but may happen in the future) where we get an overflow. Given the
>         if (s->usable_iova_ranges[i].end < s->low_water_mark) {
>             continue;
>         }
> I think this prevents us from allocating beyond
> usable_iova_ranges[i].end or do I miss something?

Yes, you are right. Here are the constraints:

e >=3D l
j =3D max(l, s)
e - j + 1 < s
e - j + 1 =3D=3D 0

Assume l >=3D s so we can replace j with l:

e >=3D l
e - l + 1 < s
e - l + 1 =3D=3D 0

The case I'm worried about is when the iova range cannot fit s bytes.
The last condition is only true when e =3D l - 1, but this violates the
first condition e >=3D l.

So the problem scenario cannot occur.

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--S1BNGpv0yoYahz37
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl90TWQACgkQnKSrs4Gr
c8gsMAf+MRUWiPrCRBHqprYb2LE2N75XlMbk1T03NhuyEWQIZBumbZPY+4qpqgKp
o1Q7FAcRlWJnXUNZAkVNH+qb7/JoWkUdSh9g2+Fp/X7w6Yd/EL284WX3QYkPUmra
HUonQgJlK8vJIe1r7UjZUmCwYGT8KRS6f1KGEhxNctZ2rM+HEehRZL5rGpX43nOY
Zukla5ii84G1C8fRBB+TfQs02y64g/nBCWDlnCCYbMzYOWyxdE01AyQ+pIaQLP94
YOeWhyaYLFj95Zn2K+TbvXSbpss1qiZEXseCBioeoY7JGMsyYd4SXDtcddd4FN5n
ZRjT67VLiSK6rtio7u3lYFRMbR9p6g==
=FDRZ
-----END PGP SIGNATURE-----

--S1BNGpv0yoYahz37--

