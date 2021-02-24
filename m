Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp831507lfg;
        Wed, 24 Feb 2021 11:18:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxaABLU1+z74Gfa5JqRZwjaRtDCefIHo3uKVEJqRdMJbNRgDWpTeFxnRUcKqlUB/CBC8gJw
X-Received: by 2002:a02:3b01:: with SMTP id c1mr34854977jaa.109.1614194311952;
        Wed, 24 Feb 2021 11:18:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614194311; cv=none;
        d=google.com; s=arc-20160816;
        b=KCjJZgHmJd0zJjJiHLgyKbuHEL3hUblvsoiVjHrbCxnDZKb4QaZywTCEih9io6uOGs
         89N/ghcwEc2QxXV332/7reFctkiPiaWO9CwSeY2VtdGOEsDZfVQ3ZA+JR1g2SUmZSDml
         dcEOGzYcEw+Ewk2T1M3xs7WHNTjR5pz7EnE8Jmnr3yfElvRVg9auHovZeSlJ+ALAKSh2
         /G37mKKTmNbLZ9KKcYo7YIFP7NqWJvJiTgz9XpfzHht66qsTqrPUkcK1AWz1GObvDQKo
         Ad7Y6AQjNvOIJhUeH3N5GPYTAE3AxCx83DewyeFcbh1dEtUftOpCJHtpllu7H5+D0D8Z
         WPEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=Rhr/BLbfI26Tj8Gq6FQGAiA0bxAvTaYEpPerSP1Zwk4=;
        b=V8R7E1TesFHxyJnekfZ72rhgCz+a/PxF/eyffU2Pss75cGu/ckyGVg4ypYKirtoTEd
         e4sT9SmILaUCVEfHcbSKxLYO7u1nJDTaUm5JsLisoD42eJYI0DpTuh5HcrH7YWnaq4lL
         cBSSvJRwB5rL6raGKYT4fdZCqRVOejjFimCk4psOHKB9UHuA1DjJGc05IdyD7TcifjCj
         6/9BZi+j/x+xD7osQ0w29BCrJ6mvkS8vYqfxLCkU/x7suOvdoLObWjYgi7KR2YlSljMi
         +CAMqpNpLK5BGQV3TxseZte8nkbRdBCSsbMPUwTgfEz3zVKDDYUAhuw75kKvoVQ+/m4n
         Euxg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=OUQNNPAJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p14si2871014ils.144.2021.02.24.11.18.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 Feb 2021 11:18:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=OUQNNPAJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lEzg7-0000Bj-9b
	for alex.bennee@linaro.org; Wed, 24 Feb 2021 14:18:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lEzbz-0005e8-FL
 for qemu-arm@nongnu.org; Wed, 24 Feb 2021 14:14:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58349)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lEzbw-0001Ed-Fw
 for qemu-arm@nongnu.org; Wed, 24 Feb 2021 14:14:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614194048;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Rhr/BLbfI26Tj8Gq6FQGAiA0bxAvTaYEpPerSP1Zwk4=;
 b=OUQNNPAJ8ks++0HY8TB+zPIMzyHzfzaS7l7ZcqJ9cUY3xTEfjZZocj6KRZpLiIKz4MKhyb
 1d2J+XPyTvUyxeIWTpgREstR3zBVuuiqYdk2Y5AByJa36LyhmKzQgipheL6eh/cQodQQeC
 UuoBllKrh34tk3aYGNxWqb2Wi0Atyoo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-365-AbMovvJGNNWsguuXrzgBzw-1; Wed, 24 Feb 2021 14:14:05 -0500
X-MC-Unique: AbMovvJGNNWsguuXrzgBzw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 78F65102C81A;
 Wed, 24 Feb 2021 19:13:53 +0000 (UTC)
Received: from localhost (ovpn-114-28.rdu2.redhat.com [10.10.114.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2F3479CA0;
 Wed, 24 Feb 2021 19:13:50 +0000 (UTC)
Date: Wed, 24 Feb 2021 14:13:41 -0500
From: Cleber Rosa <crosa@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH v2 1/2] tests/acceptance: replace unstable
 apt.armbian.com URLs for orangepi-pc, cubieboard
Message-ID: <20210224191341.GC1074102@amachine.somewhere>
References: <20210223225327.26700-1-nieklinnenbank@gmail.com>
 <20210223225327.26700-2-nieklinnenbank@gmail.com>
 <5556626c-0b4f-0de3-9cb8-d174cd210b5c@amsat.org>
MIME-Version: 1.0
In-Reply-To: <5556626c-0b4f-0de3-9cb8-d174cd210b5c@amsat.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="yLVHuoLXiP9kZBkt"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org, b.galvani@gmail.com,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 Pavel.Dovgaluk@ispras.ru, Willian Rampazzo <willianr@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MnMZFRiKNMRV

--yLVHuoLXiP9kZBkt
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 24, 2021 at 10:12:10AM +0100, Philippe Mathieu-Daud=E9 wrote:
> Hi Niek,
>=20
> On 2/23/21 11:53 PM, Niek Linnenbank wrote:
> > Currently the automated acceptance tests for the Orange Pi PC and cubie=
board
> > machines are disabled by default. The tests for both machines require a=
rtifacts
> > that are stored on the apt.armbian.com domain. Unfortunately, some of t=
hese artifacts
> > have been removed from apt.armbian.com and it is uncertain whether more=
 will be removed.
> >=20
> > This commit moves the artifacts previously stored on apt.armbian.com to=
 github
> > and retrieves them using the path: '/<machine>/<artifact>'.
> >=20
> > Signed-off-by: Niek Linnenbank <nieklinnenbank@gmail.com>
> > Reviewed-by: Willian Rampazzo <willianr@redhat.com>
> > Reviewed-by: Cleber Rosa <crosa@redhat.com>
>=20
> > Tested-by: Cleber Rosa <crosa@redhat.com>
>=20
> Did Cleber test this new version?
>

Nope, and I'm having issues with those URLs.  For instance:

   $ curl -L https://github.com/nieklinnenbank/QemuArtifacts/raw/master/cub=
ieboard/linux-image-dev-sunxi_5.75_armhf.deb
   version https://git-lfs.github.com/spec/v1
   oid sha256:a4b765c851de76592f55023b1ff4104f7fd29bf90937e6054e0a64fdda563=
80b
   size 20331524

Looks like it has to do with GitHub's behavior wrt quota.

Regards,
- Cleber.

--yLVHuoLXiP9kZBkt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAmA2pWMACgkQZX6NM6Xy
CfP6zw//bCTEvAnzrkmLlsSL8Xy53ClNbiJ3H6ypWbk12ksNE2LQuCq/IOvM6MOZ
ZOHr+N5QXsuf/jAxm8hsO81HiUsuA+Zsn5yIrRUj12+4tLIA00nT2Tev4gCJRmU8
fyjAAE2bsqvowIqP9lIGIVed3dHV7V3vp6HSYWJn4fBEVzrCBs3Q7lczQioo7YFF
dxo432TxUSyKE1ufGjmzNvhr4pXxxQQeVKUHys4dOSGXB2ppD9r2VTeVNTvLYWdg
mv6fwx4lxxfEl00+2FgQyy0IcRhNiWPpleGUMgajBEsTgRtEJpTPO7mzAcdd2bAr
6EcBrLnqbSuta3KyhcGnMZd82l8xWJBjURcfiR25IP49cDPxggRHJvrpBTZO5j53
5Du1nWIis+aL0wZLdKFrPavvvrDriKwi7mtUa5bBpplQ4KDM7PFFsvfzMZ+eYHTN
EFfKRHJ0U5Y4T30qiUNYfFPcktOM7RvEAP+83tpPQrRzg6jKYo8klcO++Cc/u/b+
+OSWDkY8sPdCth8JIS3KLUnh/bXP6zDxI40QtxvPjA/vy0bLfZ6buPMRnytyGlxo
ZTp/M0DMVTUr62ckdnxkET4OUmsFrbBCz5e12xk2/eEu0QXBMnGXSaODwPAC4ZYx
UC0uGrCoRqbO+JW4lIrCseAtv55cZ2hV8PvIyO2h+0VnZal834c=
=NS/f
-----END PGP SIGNATURE-----

--yLVHuoLXiP9kZBkt--

