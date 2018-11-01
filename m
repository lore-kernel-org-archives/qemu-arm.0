Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp757199wro;
        Thu, 1 Nov 2018 05:41:57 -0700 (PDT)
X-Google-Smtp-Source: AJdET5e1TjqefH5LR2iartxNroRgsW13AcdU7qOiITPtv4nuVuedQP8XltYy7NUauxpvo1nB01zO
X-Received: by 2002:ac8:4506:: with SMTP id q6-v6mr6673026qtn.68.1541076117873;
        Thu, 01 Nov 2018 05:41:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1541076117; cv=none;
        d=google.com; s=arc-20160816;
        b=eDF2KQyKyzI0Gm3eh6/V4HNGXigJh5zC760Y9RZA0G64zg4i4Crqityatct4UqE3bd
         Rr+Ka2Htvje8ObndQqqQPtlboIM+Km9/Wn0NrDDReF3fIQLMDf15mHOK/sCIUXrF9glp
         U8T6Q2lpJimEthzsDgFvlQzU6Po9IIdZot0hBBoICZ0rqGjhTZ8PiH5zwpS9rFMFnXvY
         5zUYKKuM2HmL+cK2nvgHpICqyFWYMQ0zKFAODv8vmsH0icrBLH+6WX/k/wsTeVZaucnw
         qlmHfVFiMXr/HEwYBZ/i7Uq7blU1eIB5bocADEux9O8FJYsvgWcRu0pXlZXHMrTJljxt
         g7MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature;
        bh=IlrC3b9QmmdK8qvYyrSDWvA0GN655hcEYauJXW1l8/s=;
        b=SLQLIOx/1iCtbXuIhK9fRa43RXnUNu3jK6SAQwk2n1EtWRiVbv+We7nizdmtuT1at9
         CrR+vbQKqNy1cAtpqFDgCG/Jv/gthaR6hA2mEoUjpcIPNQWRnvfn4jHFi6yV3aeZgo0w
         jJzxGj4Y15lA1h1WxqWbdUO5KhbiPip4PXdOTBqbtiw+DnkN9gFPpOEa7tC3JvP5/ELc
         SQy+v82DFwpATvPHu0xK1treSkNqVVdcQ54oUlD2RD5CipfYiW3W5/tCpMQbvKRiAvNW
         nCeo4cdyOHAkm5DU4W8oBkj1nymnDtI/Qh3GPguQ48J7iygs4A9J2ND18OOom+4o3bIR
         poaA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Fu2OYQl8;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 64-v6si7069qks.145.2018.11.01.05.41.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 01 Nov 2018 05:41:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Fu2OYQl8;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:41955 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gICIP-0004Vx-Dp
	for alex.bennee@linaro.org; Thu, 01 Nov 2018 08:41:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39112)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1gICHy-0004S1-7j
	for qemu-devel@nongnu.org; Thu, 01 Nov 2018 08:41:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1gICHj-00081j-EY
	for qemu-devel@nongnu.org; Thu, 01 Nov 2018 08:41:23 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:36627)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <stefanha@gmail.com>)
	id 1gICHj-00080l-47; Thu, 01 Nov 2018 08:41:15 -0400
Received: by mail-wr1-x444.google.com with SMTP id y16so19946180wrw.3;
	Thu, 01 Nov 2018 05:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=IlrC3b9QmmdK8qvYyrSDWvA0GN655hcEYauJXW1l8/s=;
	b=Fu2OYQl8p+VeJWCVsVRtPd4+F/xuIZU4ihqlwSXx/lIYu44jiFnC010E9c4oj0CPXU
	u3PfZZQxOhuh/hZ2GsW1tNO7NNI2jY9+yhtToHC+Wa9swtvcZ0YDMDkSUhnyyhFycm+9
	p95bx7iC8s7ToqW8+wqYzMO0Xxk+5L4sf0H9l1Mxb4f5Kvubw4QlqIJCWF5nM0pxcl2R
	80GpcnZv29U1zUy+tTYMU336JYp0jnX8bj7tqU3hgFDUgsyLmnXasbXUjVKcTt+5vLX4
	HRid0QdmO0JjFYuuPhlklZJ2DnGUIYWjJM2qaKoGBIzbBkcHxeHCOYEBABrFqtWTMzPd
	jEbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=IlrC3b9QmmdK8qvYyrSDWvA0GN655hcEYauJXW1l8/s=;
	b=VSp/XPk/wqjmsdeAwMlBuuYLpxYHNhighWZswU6FnjxpYbcRhgdyhyU3VvBTEr8+lO
	PofMyedyTcON9ZqOSDMc4SlQ5DnckMPtDb1PsWqP6QK+JlF6jN2o0GXB7mW2RwJA/prz
	la13VPCjBpboUzPesQW+OP5rizO1QRNxD24YBMmbg537xatpnszuLLg/MRVcRMGOJTN3
	liM6PIigR5aLdx5eXxMiVbjdrBIUZIf/SNvafTb9XTeJC3f91WGP8unV/8WOf5St2vYE
	CmImNdMeiisjjqCR1tN6eSWOn1MtCBEe0UGQlNTSJTmSNk7Uwq2TZpjr6GjL2thRC4R+
	2LBA==
X-Gm-Message-State: AGRZ1gI15h3XKAnyMHCLHVcNiI0P6IjQDTP6U9pDMOyynV/BnADmFq5j
	ijgOQx//43Hhe8HjXTiJT7w=
X-Received: by 2002:adf:fa04:: with SMTP id
	m4-v6mr6512815wrr.155.1541076074069; 
	Thu, 01 Nov 2018 05:41:14 -0700 (PDT)
Received: from localhost ([51.15.41.238]) by smtp.gmail.com with ESMTPSA id
	134-v6sm22518973wmp.6.2018.11.01.05.41.13
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 01 Nov 2018 05:41:13 -0700 (PDT)
Date: Thu, 1 Nov 2018 12:41:12 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Steffen =?iso-8859-1?Q?G=F6rtz?= <contrib@steffen-goertz.de>
Message-ID: <20181101124112.GR24946@stefanha-x1.localdomain>
References: <20181031002526.14262-1-contrib@steffen-goertz.de>
	<20181031002526.14262-10-contrib@steffen-goertz.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="eyYj78xbwv+yMvU1"
Content-Disposition: inline
In-Reply-To: <20181031002526.14262-10-contrib@steffen-goertz.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::444
Subject: Re: [Qemu-devel] [PATCH v3 09/13] arm: Instantiate NRF51 general
 purpose I/O
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
X-TUID: bcXWeUe/SMiY


--eyYj78xbwv+yMvU1
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 30, 2018 at 08:25:23PM -0400, Steffen G=F6rtz wrote:
> Instantiates GPIO peripheral model
>=20
> Signed-off-by: Steffen G=F6rtz <contrib@steffen-goertz.de>
> ---
>  hw/arm/nrf51_soc.c         | 16 ++++++++++++++++
>  include/hw/arm/nrf51_soc.h |  2 ++
>  2 files changed, 18 insertions(+)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--eyYj78xbwv+yMvU1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJb2vRoAAoJEJykq7OBq3PIXesH/3sra0UaIff56ob2DhPbY+Ls
lEDkXfxMTwdw4QQwhSaTW6yH3h2KEDx5qBp7LLp/6aZlsSQ+obBqeBqJ5vhTzM97
9OG21ZoYPBF0JQML82jc8NHPJu7LOQRG4CMoH2Uxt9fLalmUsdGbqhUf2WF3TVNF
SIoFeevXCBuL92KgPKqL1qFRtYJc7Gw7MggwEiYKHOPkAqbtZSDiHAwn4H0vyvwV
lRyH2e46HU04DFcQFrkti7AaG4GvBXNXXnuV0/obLiK44nPIkvs6DWfoUp1gpyR7
wBazZAFKemU9CKuxem3z7CMWYf+wxCTWuj6BbZN+bx1oRXKVzBhPHA1VybTOKWQ=
=XODn
-----END PGP SIGNATURE-----

--eyYj78xbwv+yMvU1--
