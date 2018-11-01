Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp656313wro;
        Thu, 1 Nov 2018 04:04:46 -0700 (PDT)
X-Google-Smtp-Source: AJdET5ctGN4iqpqIr7qZCRNZT7+Oj9u+gxaKmpdpThx8OysajEwkYBhteKuhlQR36nVml0cdiO+X
X-Received: by 2002:ac8:3437:: with SMTP id u52mr5922388qtb.237.1541070286562;
        Thu, 01 Nov 2018 04:04:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1541070286; cv=none;
        d=google.com; s=arc-20160816;
        b=GHGvCIRj9WRLHW3W114PkFZ/8xEIkm/8e4HdR5r4NO56/RPDV5U/YrOq3YkVn0zsLJ
         O5o90Q3DnzF9m99vH/w1mhSTv9vgPd1pMyhAfm1ouVMfReIQW+l8IVKngdRFOk2R6XXx
         Qcdez36kvde0nEZ5MYxlW07Aquku5UjdP4G8p/nKMvy8kg7g3yYp4Py4Qkx2k7u+zhUF
         7Y+KTp3UEoXe6wymXd1J7bjVlp1WtD2dwk0VZC7LPQrDux9Wf3oXha3UiORhWOCmAqDK
         axG3o1HSGCIY/7xS/LPfR0BsPZezT9J4cZx5J1sr/Y75Qca4QGmJ339rnqIUb2fFL+qF
         JUDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature;
        bh=8Mvd4brg6fMJRtUvnqcwC44DmX1Dg3w2fjRwtVPUOOk=;
        b=nYWW9HwgCW1UgAv/dFII3wEzGLR2rOO+bD+bO18BxHbRF4Ass29p5ftHET7p9Ciodm
         lg/xTkBHQ5zLIlqLgBqSlh+Qy1ofYi4OSnGIcG4atJEAW8wX+X9JcH9Mf8p+J+QvyEro
         ddBhThsEYlAEnd7BMoOdIFYkQRKOlX1BJ3rY4ZeHz34zGdGO6LWPCBpVdQLgHpbH3XuR
         BlkSUJtUAyhzGe49q+DHCpVeW0WL2bKUEkcdL4zEHugIM37a5AX5OuKQ5tZqLHn9Q3HA
         wGhY+2FqaSrO7TJnq/S4ly/sYnxYmUUO4Xna2erznlyQZw0XD3kjG1auVMDduRgOvPeA
         2BDQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=FUScz4+V;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o5si2378163qkc.148.2018.11.01.04.04.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 01 Nov 2018 04:04:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=FUScz4+V;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:41355 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gIAmM-00043k-4h
	for alex.bennee@linaro.org; Thu, 01 Nov 2018 07:04:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41130)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1gIAkg-0003Iv-Ro
	for qemu-devel@nongnu.org; Thu, 01 Nov 2018 07:03:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1gIAkd-0001XA-MF
	for qemu-devel@nongnu.org; Thu, 01 Nov 2018 07:03:02 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:51960)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <stefanha@gmail.com>)
	id 1gIAkd-0001Wb-Do; Thu, 01 Nov 2018 07:02:59 -0400
Received: by mail-wm1-x341.google.com with SMTP id w7-v6so1015138wmc.1;
	Thu, 01 Nov 2018 04:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=8Mvd4brg6fMJRtUvnqcwC44DmX1Dg3w2fjRwtVPUOOk=;
	b=FUScz4+V7RugqAttlCXeVdNN7w6QPDdMEImVKOsJpPCqIwqdx0MrcBhQLYgVRoUzl5
	Ml1XIzwKU+TBSZ6rxvIfUfai6GgvwXc22PdrY2Xx3gDgouecyzSbTwUM9/mnBIcxbBLx
	i7B/VCyvtY24Cees/JFjIWRc3n7jwrVKFv5EZuU1yvRiw8tmJQwilaqFtpIkTbF0nlqy
	QiyZ6UKr7hQKQ9Nvw0y7w52Z8D21hnNXKeScHk3OkWKyERCxA8ZZmylBhbgqyDiylBTk
	bxY/MizxVf2RCBeIb1hYG03tF0v71Q83C5dteH5YurjnCgKskLLSwx56kEuw/KYkN5rk
	70aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=8Mvd4brg6fMJRtUvnqcwC44DmX1Dg3w2fjRwtVPUOOk=;
	b=F0HuiQc8nHMEM3JHR/g2CS0fyJOB1Qo7uH+6JUVU04NVKbSfOtkufjGQzROJQSOmdE
	ygVJIau6y2JUHu2HoqKKrC+9Da/6qpQtftTWWjxJHyhcl8M24ELsoTg0rugimixbaNJK
	cCPeepe6affMzKFH/nHrmTTty7A7mZgUnPsFeYz+v91XFT3NRjic7kOEHFV5MaxIjm4L
	Vh2FSftd00rpF3MkrKn1LZNvpq3j1SYI+4m2fYuT0Cyxbkb8fLp3usXO4o+kP0qiOrzU
	4967qsr5pf7ToAO/Ugq48pDsmiYOR2s2st6KLK0gByl0t+txFxnJ3M6/fLdapQ7jRybJ
	/tzg==
X-Gm-Message-State: AGRZ1gJYZer9Z70hh4VKDKPAwbYk+B5ORlmPqLldp7Ut0KHUavcJLm+G
	3ez6NiALHVf/jSggPflVLVI=
X-Received: by 2002:a1c:7a0a:: with SMTP id
	v10-v6mr5358904wmc.41.1541070178459; 
	Thu, 01 Nov 2018 04:02:58 -0700 (PDT)
Received: from localhost ([51.15.41.238]) by smtp.gmail.com with ESMTPSA id
	82-v6sm37524179wms.17.2018.11.01.04.02.57
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 01 Nov 2018 04:02:57 -0700 (PDT)
Date: Thu, 1 Nov 2018 11:02:56 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Steffen =?iso-8859-1?Q?G=F6rtz?= <contrib@steffen-goertz.de>
Message-ID: <20181101110256.GL24946@stefanha-x1.localdomain>
References: <20181031002526.14262-1-contrib@steffen-goertz.de>
	<20181031002526.14262-5-contrib@steffen-goertz.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="XRwESHC7KXlqFpSs"
Content-Disposition: inline
In-Reply-To: <20181031002526.14262-5-contrib@steffen-goertz.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::341
Subject: Re: [Qemu-devel] [PATCH v3 04/13] arm: Instantiate NRF51 random
 number generator
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Jim Mussared <jim@groklearning.com>, qemu-devel@nongnu.org,
	"open list:NRF51" <qemu-arm@nongnu.org>,
	Joel Stanley <joel@jms.id.au>, Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fcMJJMUPpgtj


--XRwESHC7KXlqFpSs
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 30, 2018 at 08:25:18PM -0400, Steffen G=F6rtz wrote:
> Use RNG in SOC.
>=20
> Signed-off-by: Steffen G=F6rtz <contrib@steffen-goertz.de>
> ---
>  hw/arm/nrf51_soc.c         | 16 ++++++++++++++++
>  include/hw/arm/nrf51_soc.h |  2 ++
>  2 files changed, 18 insertions(+)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--XRwESHC7KXlqFpSs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJb2t1gAAoJEJykq7OBq3PIrB4IAKfXYSs3TvrmnRG0WJZllbeq
/F7UhgghPHulvBlYGOSMBs4wQImzhlfz9tJac9CUFONdVH7R8vxBDg88/TNuyrWz
wBjusREidbKWcRoOvPowzGnCqMkip763gI3Ce30TkD9DqHgOSP6m3+r4CUJg82al
L+qjoVJEYhJHtTHaQomBCPA87DrxKPyjNiQ45NmBaXHAsZBfU9HaERfPF6vvs0yj
HcPnPlJMK4JBTxqyFrKDHBhpPacZlLLr/Tw/pC7fZEKEzlQtn8VfTxlejjXjBqTn
EJRzPF25s5FkDyUAzUqVw2GycEHGnf18nQPEML+PG8vW5/YXXHD7kq6hmsE7FH0=
=fZEF
-----END PGP SIGNATURE-----

--XRwESHC7KXlqFpSs--
