Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp1740511lfi;
        Thu, 2 Apr 2020 02:32:40 -0700 (PDT)
X-Google-Smtp-Source: APiQypJ7IMgXPM/8PxUtJSzqrL4jVi4ByVF8BZJCZaY6kvPx0XhqHhf5yA9CgeI1MZSokFhkea4Z
X-Received: by 2002:ac8:749a:: with SMTP id v26mr1979241qtq.182.1585819960001;
        Thu, 02 Apr 2020 02:32:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585819959; cv=none;
        d=google.com; s=arc-20160816;
        b=NHBorr2Ww1Y5vFXFTeLyAyypDQlIO0BgtCsX9COKoQrg6EunFE30CjSulniGCXOYhM
         /RL3gfJILIhnNnny9UrQ9qY6aY/nWIHWLS0F2Fvzq62ObX6CSQQtLGLnQYIKuzc7Y1Jz
         9K809FnLEMztzJPlEaB6IPxxDHTPm6x2jMo2xelNwr2CeN4qhmaljLglwbHuvSylhSAN
         4IW56Ok4QUAjxZf/kDp63Y1UfZ9r6+xhe9SrGlPNQ5fa/P/e1wOW9dDACXnaAP9Dte1t
         GA8O9m36cTqUj1YLfKT7IdgNXyVVtF42//eO6NMRE3PAkqzs5AqlnkRU7ihP9cKrSuhq
         8WPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=X+KOdGcGEw2gSawHhNqh1nXXjrQa7I35RsICu1UaYPM=;
        b=E4PXv/41SQE/zsU5cSzMzQfYUArOl7TeOv6fZKeNuRzqmWHyh4ENO9IZTzu9GOSATM
         RseU96GVLdGwgSJxbjRmzsy9aun0OPaG3A/zPKquSVP2iXJjXu9kgR7EA/yblQZWfi+S
         qgxS6T75gSc1PEb+UoQmO8CECClzIm4lELSO/tEGmuIzkEJ+3SH/dRlnWt1El2hfjR2q
         P4pN18kRqRmZxLnHrXd2rbTft3Ou8YjHuErj2+rVHwEyNZ+zY8bFo4WuJuDIj4LZbzW9
         DLXpbFKr3BnbnH3M2kGwVEqjVRHfdJbpiJfaylPP36cdhrJuqszpcmyvt43Vt+d6O8jv
         CYLg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Dot+4X9P;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x188si3060485qka.54.2020.04.02.02.32.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Apr 2020 02:32:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Dot+4X9P;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jJwDH-00042e-Dd
	for alex.bennee@linaro.org; Thu, 02 Apr 2020 05:32:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55212)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanha@redhat.com>) id 1jJwD7-0003yg-GJ
 for qemu-arm@nongnu.org; Thu, 02 Apr 2020 05:32:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@redhat.com>) id 1jJwD6-0007bO-8m
 for qemu-arm@nongnu.org; Thu, 02 Apr 2020 05:32:29 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:45220
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefanha@redhat.com>) id 1jJwD6-0007bF-4I
 for qemu-arm@nongnu.org; Thu, 02 Apr 2020 05:32:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585819947;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=X+KOdGcGEw2gSawHhNqh1nXXjrQa7I35RsICu1UaYPM=;
 b=Dot+4X9PbmwLHf06SWkxK/2Ey2RwMAtEOkAuoZvGDieTtQ0A+1em5qlbaXFHCgP5GA4JrH
 2JaQtc4dbWOHVS34gmAnF5E8u6GmyMa6bq8NUfsWBqNiTgL+0b754eRLGqlPpMXoc6PNSO
 TmtP9izXxOlR/b3azwPkJbPA3ksXrQE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-448-a7oFSUDONxyxI6iWkCv5MQ-1; Thu, 02 Apr 2020 05:32:24 -0400
X-MC-Unique: a7oFSUDONxyxI6iWkCv5MQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C19A013F7;
 Thu,  2 Apr 2020 09:32:22 +0000 (UTC)
Received: from localhost (ovpn-113-134.ams2.redhat.com [10.36.113.134])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 54E9F5D9CA;
 Thu,  2 Apr 2020 09:32:22 +0000 (UTC)
Date: Thu, 2 Apr 2020 10:32:21 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2] util/async: Add memory barrier to aio_ctx_prepare
Message-ID: <20200402093221.GD28280@stefanha-x1.localdomain>
References: <20200402024431.1629-1-fangying1@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20200402024431.1629-1-fangying1@huawei.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="XvKFcGCOAo53UbWW"
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Cc: fam@euphon.net, zhang.zhanghailiang@huawei.com, qemu-devel@nongnu.org,
 qemu-stable@nongnu.org, qemu-arm@nongnu.org, Ying Fang <fangying1@huawei.com>,
 pbonzini@redhat.com, wu.wubin@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: s4Dwg8D+N1C2

--XvKFcGCOAo53UbWW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 02, 2020 at 10:44:31AM +0800, Ying Fang wrote:
> Qemu main thread is found to hang up in the mainloop when doing
> image format convert on aarch64 platform and it is highly
> reproduceable by executing test using:
>=20
> qemu-img convert -f qcow2 -O qcow2 origin.qcow2 converted.qcow2
>=20
> This mysterious hang can be explained by a race condition between
> the main thread and an io worker thread. There can be a chance that
> the last worker thread has called aio_bh_schedule_oneshot and it is
> checking against notify_me to deliver a notfiy event. At the same
> time, the main thread is calling aio_ctx_prepare however it first
> calls qemu_timeout_ns_to_ms, thus the worker thread did not see
> notify_me as true and did not send a notify event. The time line
> can be shown in the following way:
>=20
>  Main Thread
>  ------------------------------------------------
>  aio_ctx_prepare
>     atomic_or(&ctx->notify_me, 1);
>     /* out of order execution goes here */
>     *timeout =3D qemu_timeout_ns_to_ms(aio_compute_timeout(ctx));
>=20
>  Worker Thread
>  -----------------------------------------------
>  aio_bh_schedule_oneshot -> aio_bh_enqueue
>     aio_notify
> =09smp_mb();
> =09if (ctx->notify_me) {   /* worker thread checks notify_me here */
> =09    event_notifier_set(&ctx->notifier);
> =09    atomic_mb_set(&ctx->notified, true);
> =09}

Paolo, I'm not sure how to interpret this case according to
docs/devel/atomics.txt.  Maybe you can clarify.

atomic_or() is sequentially consistent and I therefore expected it to
act as a barrier.  Or does sequential consistency only cover the memory
accessed via the sequentially consistent atomics APIs and everything
else (like aio_compute_timeout()) can be reordered?

>=20
> Normal VM runtime is not affected by this hang since there is always some
> timer timeout or subsequent io worker come and notify the main thead.
> To fix this problem, a memory barrier is added to aio_ctx_prepare and
> it is proved to have the hang fixed in our test.
>=20
> This hang is not observed on the x86 platform however it can be easily
> reproduced on the aarch64 platform, thus it is architecture related.
> Not sure if this is revelant to Commit eabc977973103527bbb8fed69c91cfaa66=
91f8ab
>=20
> Signed-off-by: Ying Fang <fangying1@huawei.com>
> Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
> Reported-by: Euler Robot <euler.robot@huawei.com>
>=20
> ---
> =09v2: add comments before the barrier
>=20
> ---
>  util/async.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/util/async.c b/util/async.c
> index b94518b..89a4f3e 100644
> --- a/util/async.c
> +++ b/util/async.c
> @@ -250,7 +250,8 @@ aio_ctx_prepare(GSource *source, gint    *timeout)
>      AioContext *ctx =3D (AioContext *) source;
> =20
>      atomic_or(&ctx->notify_me, 1);
> -
> +    /* Make sure notify_me is set before aio_compute_timeout */
> +    smp_mb();
>      /* We assume there is no timeout already supplied */
>      *timeout =3D qemu_timeout_ns_to_ms(aio_compute_timeout(ctx));
> =20
> --=20
> 1.8.3.1
>=20
>=20

--XvKFcGCOAo53UbWW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl6FsSUACgkQnKSrs4Gr
c8jxmwf/WbDZ3sZ09kVAjfwMqMWFjjIgEoekyuEL7nfvi/1ZmG9JHqH6SW66rUrw
ZPtSHKJew8ex87lEZWwoHrIRkUBWrQal8zq3j0vzismRTMTXC/YyG9uLzG7GuIKB
bkZUJCPD67G66gG+rGmkM+QD1aAAUGML8mHRG3uPp9B9mpA+REtl+w+LDXPechTx
mlNqaD4Q/NiSovjzM9zbaNkH2icTNBBjseTs0ooahjMzUrBAOI9q3E8PnRJCNxq9
Y3ItDnFG82N/o0U7+eUmh0jj5lF1kIiUy3yUkdsfpuARbP+5MTEBsoPWw8FOetSk
sEoTR4RAp/R4ZYtCEqtAVjAG34Simw==
=o9TH
-----END PGP SIGNATURE-----

--XvKFcGCOAo53UbWW--

