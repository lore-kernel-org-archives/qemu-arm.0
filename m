Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp2213498lfo;
        Tue, 8 Mar 2022 02:03:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxId5BzqkSSea1I9UbGqrO9rd4bUWqpj/Rx6/XVmHUAX8yYCVU5QaYg8bCeTApCpDv4qvn6
X-Received: by 2002:ad4:5769:0:b0:435:41db:9bca with SMTP id r9-20020ad45769000000b0043541db9bcamr11282414qvx.73.1646733801279;
        Tue, 08 Mar 2022 02:03:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646733801; cv=none;
        d=google.com; s=arc-20160816;
        b=rYRMnknLq1AdITcE79FclZelu0ne/tFIhH1I4AmNHUiFIzjVxgrJCtn2KYzjZRugRj
         /f8taT8pK2T/P1w9N/5OjKRXp1dgm76P6dJhK/hmF9LfVC5O/g5VfM3JNEbm7L+WofGN
         tGB3hOBHLsUpUtYr3SnZrFtVtD0CS0FR9dcuZ1AwFbadcZ7XSM9dLnLe845Cqio1VQ+Z
         XCzLaKeTH2Fc9n3l20W/SFGYJzrjlcm+ElFyL27GjQgL09Isansey5pnVo+XtI0Moyym
         dXXbk9WXremhEBEVGyNva/2RQ7pUUOIlt/vzfprwc/WXrcCBPl9+rgFhMHD4k5DDOJuB
         wPlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=f8QC/TmF9wXqpJ+bytwv3ytsVHAwtv6Xne1HOpEXTIw=;
        b=eNHr16RuiJyuLy+k8+e7Nx4xoZJHimc9AJEkgbvh3s9eH2hWL8m7IA400fgYhxBbHN
         E/1uz1H5kxTRZo2u2H6pXtExqiLvsIwrW1A1CKt11nu4O4XiUNr/4uYaZYb6/uyZI40N
         NQJbs7lCk+Zh1o5s4UVFYdEmAOQrqX13gweMFHX1oEu4oJBB4xrpFHJg3IM4koOp/iXr
         HO3o49MF+q0Ldw7BCxLtU3iOSV8NBGeNwFuta/MmPzb45cwD0CFNco2nOglj0hqA9O9K
         Cm+FcfeY31pwFnB/flzuGNLp1Xaz7vNX9tVa1OlR+fqj3q6V+LBlvpVT7mbG4AdIBdZA
         C2Nw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=SKKaKtvp;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v9-20020ac87489000000b002e063f3475asi2587977qtq.184.2022.03.08.02.03.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Mar 2022 02:03:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=SKKaKtvp;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nRWga-0000C2-P7
	for alex.bennee@linaro.org; Tue, 08 Mar 2022 05:03:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nRWgG-0008UU-Gr
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 05:03:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31259)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nRWgC-00073Q-Ji
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 05:02:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646733775;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=f8QC/TmF9wXqpJ+bytwv3ytsVHAwtv6Xne1HOpEXTIw=;
 b=SKKaKtvpkz+OAm/R9QhcOzqROb+oDf/PWoyBIkOvdO8ozAXXdctTLFLaEZxn5UBs7njegc
 SorBXHukqbIqLogZwzZ5FJDSrFuWnjh3YubF0Nj6gk1V9NA8yfDZcogdPipyk6Edgij0qf
 W3zh21ftOmv3t6/uX5WLI6nan/M+fG0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-100-MpxoNGVyMgmkE4SLi0VyNA-1; Tue, 08 Mar 2022 05:02:53 -0500
X-MC-Unique: MpxoNGVyMgmkE4SLi0VyNA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E15431854E21;
 Tue,  8 Mar 2022 10:02:51 +0000 (UTC)
Received: from localhost (unknown [10.39.193.143])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 66872842C1;
 Tue,  8 Mar 2022 10:02:21 +0000 (UTC)
Date: Tue, 8 Mar 2022 10:02:20 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v4 3/4] tests/qtest/vhost-user-blk-test: Temporary hack
 to get tests passing on aarch64
Message-ID: <YicprIn75glZ0zYe@stefanha-x1.localdomain>
References: <20220307211439.213133-1-eric.auger@redhat.com>
 <20220307211439.213133-4-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="blOfLr3jwt2qj6GN"
Content-Disposition: inline
In-Reply-To: <20220307211439.213133-4-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: eesposit@redhat.com, jean-philippe@linaro.org, mst@redhat.com,
 qemu-devel@nongnu.org, Coiby.Xu@gmail.com, qemu-arm@nongnu.org, clg@kaod.org,
 pbonzini@redhat.com, eric.auger.pro@gmail.com, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yxTe1q/lZTza


--blOfLr3jwt2qj6GN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 07, 2022 at 10:14:38PM +0100, Eric Auger wrote:
> When run on ARM, basic and indirect tests currently fail with the
> following error:
>=20
> ERROR:../tests/qtest/libqos/virtio.c:224:qvirtio_wait_used_elem:
> assertion failed (got_desc_idx =3D=3D desc_idx): (50331648 =3D=3D 0)
> Bail out! ERROR:../tests/qtest/libqos/virtio.c:224: qvirtio_wait_used_ele=
m:
> assertion failed (got_desc_idx =3D=3D desc_idx): (50331648 =3D=3D 0)
>=20
> I noticed it worked when I set up MSI and I further reduced the
> code to a simple guest_alloc() that removes the error. At the moment
> I am not able to identify where ths issue is and this blocks the
> whole pci/aarch64 enablement.
>=20
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>  tests/qtest/vhost-user-blk-test.c | 6 ++++++
>  1 file changed, 6 insertions(+)

What is the plan to identify the root cause?

Acked-by: Stefan Hajnoczi <stefanha@redhat.com>

--blOfLr3jwt2qj6GN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmInKawACgkQnKSrs4Gr
c8ivdwgAhH0mPTLW6HlLtgZxyR9SPpeRjyUQExX04yy1QQEOhkz3pQG/yUk0vD1A
w02O9ViTF4uQ3IT3gIK58ZtgtBu4RRqMcI+RkKV505M7YmkRYWFqItG3LQC/PfGL
HGqnnQYkVeXWBDjaapkmw0SBQh+82FyRwigYfPYYuMKvBWJc6C3jhBDf2d3idPuP
bIcRZ8MVcR134NACYC+hosds9dX1/ATRc+8OF17Aqi3dahezYvkhZHxXhtJG56Lt
T6ItYIJ0sC2mKtJses2A7YPp3UXaVEUl49xyOCnP0E7zRiLvZ0f0TcwN+/h1ONtY
GO3QabROxue1oTH4o9olRnxYX9LQrQ==
=Nd0H
-----END PGP SIGNATURE-----

--blOfLr3jwt2qj6GN--

