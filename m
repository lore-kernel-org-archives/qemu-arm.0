Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp2234939lff;
        Mon, 14 Jun 2021 12:02:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxkeZIHZgXYoR6ScULJM8Jfu+yhznmRmTP/ypHINxwihtzV45Asz3k/HjX9sCJ9suV63xCN
X-Received: by 2002:a17:906:1c4d:: with SMTP id l13mr16911663ejg.531.1623697331622;
        Mon, 14 Jun 2021 12:02:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623697331; cv=none;
        d=google.com; s=arc-20160816;
        b=XH57X9LsFNyPkXUWsrJ72kVEPLbncmLCIpSiJiTEN4C8nMWx4/TlK17gb1oMUEFKjB
         tSYpis4z6lPqnIa+4Y9vdgpH8eZRmuJqvUptc+DhAfiNxpJBUvv3kF2pAlpDeUQxNLct
         agPi1QurcEZe2dbLExVBfDsZGXfvAz/pv5ykYAdLnrdFhl9lAGVJc9Z/gVkma8FXgaoP
         vnGWWTlq77/+puaTRkEfzECnfS7j+q/PZNspZ0y16Kf04amkBC0vGx0aAdjZ44IqTd05
         0Y+jIwxuSgaL5/2HaIapCVuIMPxgjhK7D5mFMvzWpBjbozSHiZmHT7CSL5sjAIKGBGBh
         6Z5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature:dkim-signature;
        bh=SZOUpmepqsjCWsySgQ4MpFv35Ou0O5FW3CR/17UaIAY=;
        b=J4TBtIbE2AcPuKBrpUGaBEede8ynprf1PgN1gcZfJei6sOTIhrjnEWkFigM4jhOI9V
         OAMN9GSQS/JQZSIJKjLW6HXt5RZr6gDC3ihE2MD81j9uvjfuJr8JzzYyXPpMHCSgRhTW
         OzgT0k3c7exJK1Cg74cqGO2j7DZeZrYQHliZZE2KQbpUp9/4jkT10HXVs3KKRAxvFdQY
         g7wu0v0YEImqeMYl5/S5QIuSK3jAfXT12xvmd2eB3gU9LU60IxPsc4XY5SisiqDjhQqQ
         wrX8TWO9y8ndat9EWxBZMF9FgidcJl0FXwBN+f9daNRE3Ij59JQ4zGPf3NeUkHDKD8PQ
         VtMQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@irrelevant.dk header.s=fm3 header.b=cwl1n+tA;
       dkim=fail header.i=@messagingengine.com header.s=fm3 header.b=wXOXRwdz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s15si12180291edy.314.2021.06.14.12.02.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Jun 2021 12:02:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@irrelevant.dk header.s=fm3 header.b=cwl1n+tA;
       dkim=fail header.i=@messagingengine.com header.s=fm3 header.b=wXOXRwdz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:45714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lsrqc-0000dr-Ib
	for alex.bennee@linaro.org; Mon, 14 Jun 2021 15:02:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lsrkY-0004KI-5f; Mon, 14 Jun 2021 14:55:54 -0400
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:52275)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lsrkV-0007EU-Mo; Mon, 14 Jun 2021 14:55:53 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.nyi.internal (Postfix) with ESMTP id D4A745809B6;
 Mon, 14 Jun 2021 14:55:49 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Mon, 14 Jun 2021 14:55:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=SZOUpmepqsjCWsySgQ4MpFv35Ou
 0O5FW3CR/17UaIAY=; b=cwl1n+tAtpRzoif7FqMFVBTx990IRFVxXnzR5Def3GB
 0/CZmiqtZHB/UfAq7MKYjP7Av6w1yFbjoYVQvuBo2vD8w1bNqPro9DCL24c5vhWs
 9MJHBU+Bqw586aGYtV7nOrzQCgA62ko6gLGm8N7i1WJWiRxGH4AJZV5DciOb6Mwj
 eIGsY806mI3/2OLOTOyaMA+A6ipwOp2irPIYlwMURSxk+yGI86u8pVMjsmcaVAtB
 Z6TfR493CCAmysanYywpCUN092PX4R5j6tALhOAFMcUC4S3KiFlX5rfFCSv2uOzn
 bbD9oRzMsnMS/OqKEQz4JGs9he+Ri3okJFlrKrGT0zw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=SZOUpm
 epqsjCWsySgQ4MpFv35Ou0O5FW3CR/17UaIAY=; b=wXOXRwdzLr2e4aA7i1TOL6
 6RR6sBqbOO/68VnCkAqHQrHC3Xh9kfAwe0XIt6INLzrPz0SBBXqT3e3Q8gHjFfmv
 OT3yersa3jgbMedFgh0W57nV78DZaJh5qUTKOJImSC39MJ9nUyFU0/uZJ+WrLLvh
 KHCpiUt6G4kfj5RhS5eWNCeckQ39GI1rYEMQc0r0unuB4KMGOSyjntsbTTenXxmM
 9jy+QYps2IM+uNnoGtt38YUoPR0Kdi6W/rgM+vgD+TWGwbgn/bv/rXbDpw9HVXE1
 1wDeC1nk+zBmHLSFqd/AMDJWbJsLwIhQ+eVyNh3gtJky163pqhDno68RAyTeqSdw
 ==
X-ME-Sender: <xms:M6bHYCHswuT5hKnzjkQbVsLLfAbNJrVVyoTeI8d21nwTNj4rsCeCjQ>
 <xme:M6bHYDVMhhuAnhMAWDwKvI3u4Gps9khJsJ9RUco_twuNuge4DcCKJMX0jQmiUA6uf
 VKGSjEM6cPDB9lMems>
X-ME-Received: <xmr:M6bHYMJo4o6Mlo0hnJL8M7cogb_9Xkv4CSXlxLd3fuPVFBkbnRNytsyC34FEl-5q-XN0i0kys6nG77y2_BoD14wQjpbP3aIW_8SByA-Gq07dWSo76w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedvhedguddvjecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjeegudffueeiteekieelkedvueelteevjeduieeludfffeejgeffhfduvddu
 ffeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:M6bHYMFSQFR1HNLlJDxy56FpGxnzcc1ogA5i1UdYbuVcSBkwxFHE3w>
 <xmx:M6bHYIVm7I0R4bPt7J4AD0iZjAXsjHrwUlM2lnne_MG_VqaMaXQR9w>
 <xmx:M6bHYPPARSsFtEuX-dRThEFe_nG40V4QPwdcZ_1FLfJOCCrcpQEP5w>
 <xmx:NabHYMSlg-G83kAD3eKLpBI_izAkuftjuv3Vgr_wK29kGsn69zioow>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 14 Jun 2021 14:55:45 -0400 (EDT)
Date: Mon, 14 Jun 2021 20:55:44 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Keith Busch <kbusch@kernel.org>
Subject: Re: [PATCH v2 2/3] hw/nvme: namespace parameter for EUI-64
Message-ID: <YMemMAQXDhUKB13d@apples.localdomain>
References: <20210611234631.81314-1-xypron.glpk@gmx.de>
 <20210611234631.81314-3-xypron.glpk@gmx.de>
 <20210614184858.GA646050@dhcp-10-100-145-180.wdc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Ox65v9Isoo25yPXQ"
Content-Disposition: inline
In-Reply-To: <20210614184858.GA646050@dhcp-10-100-145-180.wdc.com>
Received-SPF: pass client-ip=66.111.4.224; envelope-from=its@irrelevant.dk;
 helo=new2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Cornelia Huck <cohuck@redhat.com>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3WEbPFdNlM/n


--Ox65v9Isoo25yPXQ
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jun 14 11:48, Keith Busch wrote:
>On Sat, Jun 12, 2021 at 01:46:30AM +0200, Heinrich Schuchardt wrote:
>> +``eui64``
>> +  Set the EUI-64 of the namespace. This will be reported as a "IEEE Ext=
ended
>> +  Unique Identifier" descriptor in the Namespace Identification Descrip=
tor List.
>
>This needs to match Identify Namespace's EUI64 field, too. The
>Descriptor List is really just a copy of what is reported in that
>structure.

It's missing in the documentation here, but the patch does include a=20
hunk that sets id_ns->eui64.

--Ox65v9Isoo25yPXQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmDHpi4ACgkQTeGvMW1P
DekjwAf/adZCTAq200RVQ6w9RELhq8UTLDmGYaEPUI6ZFi5Ni+dtT0RBmEXxtOXq
/d/V13Jwj2J2pOGey8WGbACBSfbU1f3dKFt1ZpKWFjBHpREPYFHyqM25D7bcPnes
VDfGylcbQwKijGzTjnSfZQAhoFUL9RTaaSjoCMPLNAAawEBFSN5wabKjsxjb8omu
0qiYtoNFwlACoYgSG+Bk5g890F63FOUFB6p/GJB7gPVL9M2Qj6eZgR6xB9wZu9FU
c93bKP1x6y2dzfZkZpy7soCjNuY5posqVrMtaz6cvKCyjIJfCRLGBqsAj9xDtLl1
sXhJ2rO6PQUGZf6sm0G36KCKm8yx6Q==
=e06O
-----END PGP SIGNATURE-----

--Ox65v9Isoo25yPXQ--
