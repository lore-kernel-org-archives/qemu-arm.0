Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp2728594lfq;
        Mon, 14 Dec 2020 08:57:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzMm3Hv7kGCdxXh82zoxV7yIShyLalzjnmrVkVV01x0+YOPEnMiLUx7nxKQlbNe+i5Vkt8L
X-Received: by 2002:a25:2a11:: with SMTP id q17mr37793465ybq.477.1607965072814;
        Mon, 14 Dec 2020 08:57:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607965072; cv=none;
        d=google.com; s=arc-20160816;
        b=ZipMcZO8O+ZJvMimFnlH2XxJXJ/t0nUP4vyAybtVKIEG7UqgOUZRH5qiedHlEtH6LC
         sYD4O8wurVsNqYgFOaan74W3E2l3m8tMCa4iBc9AAPRsLquEsx24p8jNVotwWS9jOWUR
         nYPZlTLkRJFA5VZ9ysqu4E+KDNWTH88Y0nZFDscQIMzfPAFA+TzAMe5QVhvpCMlvWeu5
         Ivt28pTN5LHdowaiFQrZBqH2qmW6dTPb/f+1WU77DMP/uCDplsE70whUXt7+2W1WTwCt
         skaMvBA74Fo6HaoDkQNi3aHMB4vuDXCFF7SFC2RMfZ2usioUqxzrLOgQcPVZpW6sKWna
         yE7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=Vy11eL4SPTpFH8ha19SW6rVhq3mxfKeo6GeSoh9uImw=;
        b=byzSTbNUIizjw4SKItu7WUr7xjfcHaBjQHT2wxIYov3HMOO2Ha6fAbYGQjp+OdrkjD
         MrNf+MvMAZT+/KS8aKLOeSIimuirIKksNtkpGgyn+GZpBaLBOfIViLLbMMmfvuzzgaB9
         vhGLY4MUc2w5z6CIi+fQLn3IbfP2Y8QBuLMWYysTM5MYYTYXTSsELedkCjisvj8Al/ta
         ZDJqHDwow7hbnbMKni7ruLyJJreqoSOVKYeZXeOh3GCiujGBfpfpeGRF8LQtKmshuIJM
         wcHWpjjB+BJ4GraOy0EIQVgqsJdwsiIC4x1AUIJO4ldEnmJ5QgLW7wf/uXTOe3/jLDUj
         aqsg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="Hk/1Ut8K";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c2si15151040ybe.400.2020.12.14.08.57.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Dec 2020 08:57:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="Hk/1Ut8K";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1korAV-0002VD-VB
	for alex.bennee@linaro.org; Mon, 14 Dec 2020 11:57:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kor9p-0002Ue-Kd
 for qemu-arm@nongnu.org; Mon, 14 Dec 2020 11:57:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48298)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kor9l-0003Pj-8f
 for qemu-arm@nongnu.org; Mon, 14 Dec 2020 11:57:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607965024;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Vy11eL4SPTpFH8ha19SW6rVhq3mxfKeo6GeSoh9uImw=;
 b=Hk/1Ut8KAozBo77P0irFAfCP2Tsdw54Yfn0GRBe/0pjBAzMFQ3TD742OR/h70Iof1L17Xd
 qMlc1yOKmG0vvbZw4xkSymc4QpWLXK/HeHGt8k/dgbBl8htsSuIFE6MVJ+f1zVz8LyfPNk
 ceq17DCpeo4kHcZYWIdLONvU6BrKFJ0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-573-UWI2jJIwONaDWDAti9D55g-1; Mon, 14 Dec 2020 11:57:00 -0500
X-MC-Unique: UWI2jJIwONaDWDAti9D55g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 54F83800400;
 Mon, 14 Dec 2020 16:56:58 +0000 (UTC)
Received: from localhost (ovpn-113-200.ams2.redhat.com [10.36.113.200])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5116977BE1;
 Mon, 14 Dec 2020 16:56:50 +0000 (UTC)
Date: Mon, 14 Dec 2020 16:56:50 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: marcandre.lureau@redhat.com
Subject: Re: [PATCH v3 01/13] qemu/atomic: Drop special case for unsupported
 compiler
Message-ID: <20201214165650.GG620320@stefanha-x1.localdomain>
References: <20201210134752.780923-1-marcandre.lureau@redhat.com>
 <20201210134752.780923-2-marcandre.lureau@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201210134752.780923-2-marcandre.lureau@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="iJXiJc/TAIT2rh2r"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, qemu-arm@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 philmd@redhat.com, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EnhJoQgvCYAx

--iJXiJc/TAIT2rh2r
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 10, 2020 at 05:47:40PM +0400, marcandre.lureau@redhat.com wrote=
:
> From: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
>=20
> Since commit efc6c070aca ("configure: Add a test for the
> minimum compiler version") the minimum compiler version
> required for GCC is 4.8, which has the GCC BZ#36793 bug fixed.
>=20
> We can safely remove the special case introduced in commit
> a281ebc11a6 ("virtio: add missing mb() on notification").
>=20
> With clang 3.4, __ATOMIC_RELAXED is defined, so the chunk to
> remove (which is x86-specific), isn't reached either.
>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> Reviewed-by: Marc-Andr=E9 Lureau <marcandre.lureau@redhat.com>
> ---
>  include/qemu/atomic.h | 17 -----------------
>  1 file changed, 17 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--iJXiJc/TAIT2rh2r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl/XmVEACgkQnKSrs4Gr
c8jjJQgAo8d7/t5LGnL7hwWSSveWGkFFsOOGo/SVqa4OJ7XBEP26SZ7KCL5QIHYz
WGIKZI+jjROvOYI0wqtxkv/4VVxbD8Dbd5XsndSAKWBq/LPt18XYuFhmO2pLWOGy
r6zWizooyUsOPqvkOt4Oud3AWqCiWyDykKtnRhYOV07sv2TAnaR0LpoB6c0khohS
6hjCjj2GK2KuajUtwaVGbF/C12RYeAbnpy0bwzU+rKDFNcqII4VCEhkmYXZ5hhd5
aPASx3NU4L3cCK3RM7yhlHNsyk8fP/eeQhSarqTQy/uBQQvFHudI9xpk2fkDWbo5
7+NeGO0qXKCzVz6wmVob7FXMYCJK0Q==
=BDgQ
-----END PGP SIGNATURE-----

--iJXiJc/TAIT2rh2r--

