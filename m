Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp2784377lfg;
        Tue, 24 Aug 2021 06:05:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJysF8AekbAaLfqQl/6J0yrMycuJeF1fk8Xfow+K/8VT92wbDqCH6hy5npqa/q1NdFv+ylFS
X-Received: by 2002:a19:c306:: with SMTP id t6mr3714490lff.200.1629810337382;
        Tue, 24 Aug 2021 06:05:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629810337; cv=none;
        d=google.com; s=arc-20160816;
        b=QqFoUvP7CDxgC2IfoR/jMEkC3XniBSziYw7FpfdL3cM3cHW46v5NnJzRaXuwmwQRqt
         Vbdzbde5qeWoRwvWmngHVP1HKzE/SoHHymJecYfRwch9glg8qr19UhvCeGUhpZZyFa99
         OHt9fyuGuY+VrGsaKnauwplJqyoRq1PkY5kWZFYOiB+5mY9yypic6xob9GJSX3sLJDH8
         SmhEeM3ATsWLjioXnoo5I7zcQHBCeTbMTZzf9b767pJRKwUus/FnfNmX/e9ORph85+kL
         0PHmQvU2rlEqCfq4N1cxjHHP/HkIlV0TLoZ1bSjiVF63BKTEOEIKNYdGadB1ZUrRvDkz
         sx5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=snuk4UPJ9uc2wT2DWg7Glcc8KqPa60AQcodwz5kF3vw=;
        b=PaDer9pW2ZR+utIIvdcdB0RYiu0cTLrPATjOtG5zfpUhBNohCAZGYzChSyArjgy0jZ
         Nh2DE341bobokgA96QNPrsbHRSLVJn90Q8EwdyKLWwHch24kx8XpKfRioYe/GEMpiL0q
         lxSh9DUdLrOUp85P5pVoIVU01DESVvVZ58Azn9/sYn9rur5u//QOJT2gnZh7W579YBhM
         Q91kXXQ4IrJ95kMuyfLsyo9+l9OXaEbLlarwkciKVjedyoRzZx7u/3thh38W4xcwUwl8
         etyb4fwUJOWxR1rPer2vyWOJnZab4n94w1hEaHP8GUDVtcVv0p2w7Db5e4dUSsLn5BFm
         hDAg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="gF5xL/y4";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t22si17849957ejt.594.2021.08.24.06.05.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 24 Aug 2021 06:05:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="gF5xL/y4";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mIW7U-0006p1-F5
	for alex.bennee@linaro.org; Tue, 24 Aug 2021 09:05:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mIW7F-0006lq-Ti
 for qemu-arm@nongnu.org; Tue, 24 Aug 2021 09:05:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45320)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mIW7E-00020H-Ku
 for qemu-arm@nongnu.org; Tue, 24 Aug 2021 09:05:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629810320;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=snuk4UPJ9uc2wT2DWg7Glcc8KqPa60AQcodwz5kF3vw=;
 b=gF5xL/y4aK399xunLBznADslJ9bvTcXIxiBlWy+EBvOrYqbbKdyJL5zTZGQ3pVxrOLbRHH
 2w1kvl74iLiouazfCP11L712g0+8Lro0zgvM9BSbg8QmvHImduzE5vcZMsPG/v3sPwUoo2
 sFrkrLGciyTose8JjYYucaHpOXOZvCc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-594-G74PkHLYOyCjyRTuZo_w2w-1; Tue, 24 Aug 2021 09:05:18 -0400
X-MC-Unique: G74PkHLYOyCjyRTuZo_w2w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 50A3F8799ED;
 Tue, 24 Aug 2021 13:05:17 +0000 (UTC)
Received: from localhost (unknown [10.39.195.0])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 713521036D33;
 Tue, 24 Aug 2021 13:05:05 +0000 (UTC)
Date: Tue, 24 Aug 2021 14:04:59 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [RFC PATCH v2 1/5] softmmu/physmem: Simplify flatview_write and
 address_space_access_valid
Message-ID: <YSTue5TgNjgsEQIz@stefanha-x1.localdomain>
References: <20210823164157.751807-1-philmd@redhat.com>
 <20210823164157.751807-2-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210823164157.751807-2-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="1jzY9H28WvcIEqMK"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.747,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 David Hildenbrand <david@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Alexander Bulekov <alxndr@bu.edu>, qemu-arm@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uyW39AiYkmJ2

--1jzY9H28WvcIEqMK
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 23, 2021 at 06:41:53PM +0200, Philippe Mathieu-Daud=E9 wrote:
> Remove unuseful local 'result' variables.
>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> ---
>  softmmu/physmem.c | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--1jzY9H28WvcIEqMK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmEk7nsACgkQnKSrs4Gr
c8iLKAgAoQswVglvrV26ANWbzeUvVAcMVey3eW0PUCbVC5l3HVzs9jQJ6+2Ws5U/
CbRlKkzwGOfLG5EzHqUy8ya/AxwY6w2bOrRsrTGAfQSnQoQg0WZnr/KGg4YCwNPU
ktzvjNJ9ns2An5mV5PUqu+aliTF9P4RfBRddCW0MxUK5KXGrv8EJEiwi3ZN+n0ee
gxI2jvx65cJFw++IoseNKbth7d0Xui/GOk6HA29hm/APlsxk69AGM/GYi20Z4BGN
2Gu0VPBTIlBJH1NHfQlSV9N5+URijjge6iktpxMx3Whh2C6h22yRzc3g5VCs/afg
5vVKXI1fQczdMPyxisTlXny5zF+s7w==
=Gqa/
-----END PGP SIGNATURE-----

--1jzY9H28WvcIEqMK--

