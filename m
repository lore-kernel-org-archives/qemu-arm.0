Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp829926lfp;
        Thu, 30 Sep 2021 18:52:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzAcw7DkCikHNDBBnkJ/66TCLMRou+c1LhKc2PZAqzTp2zlJjvqYKxEKuhxO2h2XceIEjvR
X-Received: by 2002:a05:6e02:1b8c:: with SMTP id h12mr6813468ili.93.1633053140751;
        Thu, 30 Sep 2021 18:52:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1633053140; cv=none;
        d=google.com; s=arc-20160816;
        b=pqZO/grGI6QqnzqzmjnxQGkCJuACvAGpb8kDRVTkOZ11tYrweW6uCbUfcJRqRTEW/f
         8D0fqsJVATOpkAihDSA6O8fIP4xejz/u9XVov8NcuYfyLDMOXtf2poXGn3HwocIZol/c
         VrsUBzILi1HfiBqAf2qgsGUp+6K4gkSi9R2HDCKOoHvuS6Qfv32RJoLeqpsBKhsKaKQd
         JykWl6mSlMHvLQERT+vXMEvurRHIM6li5mhPzvNXKojPev7OP8keWZ+9j5DaLqWIoFi8
         QOh32p7EMrmGwlxj/0/4J7q2J0tbx+bqCGfLi/X0Kw6cYNzsnnWt+ElBM01Xvw1C6ZzC
         rsVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=kj3kYZwuV9Cao4O13znPsCzgqpKMLsZyS/hxMlO2G2U=;
        b=yeogvDjyZQOWXJgbYciA59Q8+4w1uZRnpGvZbCGd/hebwj8HOrO8XWoOzotdneIX10
         9ArCMWK86XItZBFPn61xo1J5CHa+XCdCXYfAEGOVzJ44ZoqnzCMCqW9lBu0X4ZmctZtQ
         Hp//QIJK7UrqiQEyuJA0OjD3Rcw2w855Z+E48CuLKjhAAd/rSDaSjs0e9thvqTRYUSaz
         UsxXAX80vhT6dkXA2ACKMqPSEzRWSgZ4c67LUBCa5208wBH7GoKe5QL0S+Yu5QdSQTS1
         WoPNC1ni/BSOXg5nhDAxxQcQ7vhTFktL8F7acgL909fUSgGg0zYigVsfRjVg/CGYsccP
         ZZ/w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=AH07bxGF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s11si5241009jan.116.2021.09.30.18.52.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Sep 2021 18:52:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=AH07bxGF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:38680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mW7il-0002at-LO
	for alex.bennee@linaro.org; Thu, 30 Sep 2021 21:52:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mW7i2-0002ZI-5k; Thu, 30 Sep 2021 21:51:35 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:34407)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mW7hz-0003mi-F8; Thu, 30 Sep 2021 21:51:33 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HLCks2rtqz4xbL; Fri,  1 Oct 2021 11:51:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1633053077;
 bh=kj3kYZwuV9Cao4O13znPsCzgqpKMLsZyS/hxMlO2G2U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AH07bxGF1U+kFhYDS2cXHnzQCI8GzPwUPPDCc6LdEtGfUvwGCQrkObyjYGyPGqFlw
 u339MDx5yPqafqxGIrQrFhSG02DnV8+zfZ+5nqIHtD5WHoZ1870Midbr1KPUlb0mkN
 2UNJdHjA0N0wrOkddAbVxvludeYspl2TfYqWVz4w=
Date: Fri, 1 Oct 2021 11:41:29 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 3/3] dtc: Update to version 1.6.1
Message-ID: <YVZnSeuu1W1x+Oi7@yekko>
References: <20210827120901.150276-1-thuth@redhat.com>
 <20210827120901.150276-4-thuth@redhat.com>
 <7004c933-5262-3119-80f5-722a8e858046@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Vk4fOT/z0VAfYvvS"
Content-Disposition: inline
In-Reply-To: <7004c933-5262-3119-80f5-722a8e858046@redhat.com>
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 Greg Kurz <groug@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /cyPD2mYxMSi


--Vk4fOT/z0VAfYvvS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 30, 2021 at 09:10:12AM +0200, Thomas Huth wrote:
> On 27/08/2021 14.09, Thomas Huth wrote:
> > The dtc submodule is currently pointing to non-release commit. It's nic=
er
> > if submodules point to release versions instead and since dtc 1.6.1 is
> > available now, let's update to that version.
> >=20
> > Signed-off-by: Thomas Huth <thuth@redhat.com>
> > ---
> >   dtc | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/dtc b/dtc
> > index 85e5d83984..b6910bec11 160000
> > --- a/dtc
> > +++ b/dtc
> > @@ -1 +1 @@
> > -Subproject commit 85e5d839847af54efab170f2b1331b2a6421e647
> > +Subproject commit b6910bec11614980a21e46fbccc35934b671bd81
>=20
> Ping!
>=20
> David, could you please pick up this patch if you don't mind it?

Uhh... I'm dtc upstream maintainer, but I haven't typically been
handling the dtc submodule in qemu.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Vk4fOT/z0VAfYvvS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmFWZ0cACgkQbDjKyiDZ
s5Jj8xAA1dLDmbun+4eMBqHumQ85K9aJT6ysD5BSyt1ia9jguE1r0cOjDjoc5NRi
VVXfFOD88N0ZLKMuSfOKATx4zIV9t15/HGTNKJ8T77bI4l2fnE8evNCLSGntUrZl
Oz0jGydf3C3mOFXhS/6sp2v38rtQBl6qNLx4DCtGpPbveWjymXOU99e7Ts0xsbAy
+Bva+h0ZjKflHbuWGlUN/Kin/c1Y7LLMle3ri9j1wXeD1xZPEXcJqaxCIRv71pfZ
7FkvOENqQaLmgmhgme+z1tsdtAg5pHw2Ll8IJSceJVcioWL6LYlh3XhmPhpxEkGa
k13Y6d/khdjIiUS2Jbf5uqD+NJfp2hnTZYK5erea/M5t+pi6eZ3Fhx4wuabZogXr
cVVlc8qmJ73J4rHbdaGnkk4Zsed3Ywu5S8TFHDPz2O61C3XfhSwxYr7f5nq84LIZ
STYEnuIE3egi1LG76tRqFCXQE6+0MGsjORoelNuS/ywOiInjg2AyzsiL5dl3PvY7
FzL/5+D3HroAantWD03kW1a8m80aFjGu97yJqgNKMEf2W+HiIHiLKOS83ZCeSMvj
7YTV9WEMllCsiGoh+35iQONb2ZgxO69Sd6WNZ9nwT78vCWZvv8BxGP+EqpU+sAh7
cYxS2/3bMrkBacCLmmOMxcGDkwq3g8ZJM22AL3mTLsxlmaXz+/w=
=gGWu
-----END PGP SIGNATURE-----

--Vk4fOT/z0VAfYvvS--
