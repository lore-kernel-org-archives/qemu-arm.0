Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp1032549wrd;
        Wed, 29 Aug 2018 13:43:59 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdZKrIJbSsEdpzfndsl397U1x6oJWbnIi9yl7ZmyJQ77UaWrDlLZkGhL8vqU4b3O7aC5AOPn
X-Received: by 2002:ae9:e8d8:: with SMTP id a207-v6mr8311448qkg.235.1535575439524;
        Wed, 29 Aug 2018 13:43:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1535575439; cv=none;
        d=google.com; s=arc-20160816;
        b=YMQciY0eG+11/1iXl/uNbqfK9gQ14eiYn4L9+v1CMdc3gf3xFfW8Ravx5zCfvregxm
         VAqhTn5EKPJ39gqfXZ7SGTY1OErTxv/xCN5wpfKedrLbNryUPMd4exOvzre/gzIsJDoN
         cGKXAjlz4Ij1tG28ZoIKurjo06edgyQPQK4JkYbbR7xaAkZtr6JOcA0f4KVptEl/1bE8
         tUmLUviLABv78xyBPnUtSSF8uDCoIOd5mps9L32vdITch3oDr1sTaeniuUywnVkoJgEI
         Wt/tKGtiCtd18QdM9TCJ95bQrPu9KbTdVh+KoM1b/hEjKdzmj5g3Y4Jbbs4ljjrjqJcp
         8oSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature:arc-authentication-results;
        bh=bTUWMQKXwi1/2BkP7JQ2PT0h5W5LGzelpfTAWkT6XRA=;
        b=t+1TiB0MBBCD84MdxH/JQq5/H8TjN8R/zZxxnIhPRkTTj1LxMZPtmGkWUw/6mgB/md
         0k0Wv302OPiynxP9+PZ/wQw2iZ2coXvt/t2pp4Iaao4B1O4xI9yMaFL/07YEHpOUVrd0
         2HX51dgo5G9MJ7z6OBE1N/jeuPwmmYCrGhfpjUJTS6ZrhXO7oRbR8w1xeGuf0Iyu/Mqa
         8F7cKr7SiYQvfFx8P5PMzyn7HfnBadVjfZiWkQezDqTW7cI0y7ryDBzAFVK1fh4bkRR7
         9+0SVdgbEKtIHxeqIfEPlgaWjP6jZkk3lLVUzAXAT++O8XNiTWDeTSs4qyLDDMsJWIo4
         xgEw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=mFZVzKo7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h4-v6si4196474qtq.135.2018.08.29.13.43.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 29 Aug 2018 13:43:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=mFZVzKo7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:44868 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fv7Jn-0000KC-2q
	for alex.bennee@linaro.org; Wed, 29 Aug 2018 16:43:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57065)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1fv7Je-0000JY-8Y
	for qemu-arm@nongnu.org; Wed, 29 Aug 2018 16:43:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1fv7Jd-0003hS-De
	for qemu-arm@nongnu.org; Wed, 29 Aug 2018 16:43:50 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:35460)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <stefanha@gmail.com>)
	id 1fv7JX-0003bz-Cy; Wed, 29 Aug 2018 16:43:43 -0400
Received: by mail-wr1-x441.google.com with SMTP id j26-v6so6042366wre.2;
	Wed, 29 Aug 2018 13:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=bTUWMQKXwi1/2BkP7JQ2PT0h5W5LGzelpfTAWkT6XRA=;
	b=mFZVzKo7aJBOEsJ5C/OhEJlVIRv/vr+IOLMNxZ6crJP99EJh3hMf7vByWw02a8bkku
	9k2FJ+lUMetiPX6a5s+4L7Ure4G9lbmNKzpMnEn+jLtO7Rrs0vofcEiBelh/68eHxAMl
	i6R30VgKUN+aKerwpWFHxQm9NnZqFY+sfKWXZsDsEcmVkprdas4mINVHpLkFJa8cJSKm
	MDgkZhA7ofKST/OJBkysUxyK/JaLvRXKH5zzyM5OCkLGr6dp3Ryi8obFscgUyfvVOs/m
	Hn7iCtSTCBQS5yCi3RGhUHaj/71+xc2bPEa33goqxqtAEt05Lay9Pu1z776zwtxYHT6/
	/Vsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=bTUWMQKXwi1/2BkP7JQ2PT0h5W5LGzelpfTAWkT6XRA=;
	b=M8aUttDIX4l/HP0ZHxxvtyBkJrNSA52CMUtn5FdcbL9/Z2TF8p4wudjmgKzJbj+ZR8
	tJMi3Z5uzjOMYZp1YRPUW5+poygIY93URrQRnmQXZWJNBeoZ6Nj5RsWwxFtgm2r1tlbC
	0z8jAJOI2SjNE6hDxtss67wzTfNeTCt5QHlhC2BFfXUDH0NxEtcPQPranh0fEV1EiGT6
	XgrPSyDbQmnK8NaBrFnnMwem7kMOXHKUmTXzKAs8MRaieYVef8tWWsCNNpirs8aJHG10
	D+p0375+z/10kDnwh4qHnOX/mVjoNqXYo3tmIipLHSXcYZJN3qS8LOKwUp7G2jcBk0BH
	zdrA==
X-Gm-Message-State: APzg51Bj9xs7CC7BdB75pR3krFBNyv5uSoC7IMKrFSVucSo6lHFfvAGL
	NScClEQ3B5DS6PggzPL31qY=
X-Received: by 2002:a5d:6451:: with SMTP id
	d17-v6mr5049124wrw.64.1535575422009; 
	Wed, 29 Aug 2018 13:43:42 -0700 (PDT)
Received: from localhost ([51.15.41.238]) by smtp.gmail.com with ESMTPSA id
	g2-v6sm11344250wrd.71.2018.08.29.13.43.40
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 29 Aug 2018 13:43:40 -0700 (PDT)
Date: Mon, 27 Aug 2018 14:19:31 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Joel Stanley <joel@jms.id.au>
Message-ID: <20180827131931.GA20843@stefanha-x1.localdomain>
References: <20180816141303.20518-1-joel@jms.id.au>
	<20180816141303.20518-3-joel@jms.id.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="8t9RHnE3ZwKMSgU+"
Content-Disposition: inline
In-Reply-To: <20180816141303.20518-3-joel@jms.id.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::441
Subject: Re: [Qemu-arm] [PATCH v5 2/3] arm: Add Nordic Semiconductor nRF51
 SoC
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Steffen =?iso-8859-1?Q?G=F6rtz?= <contrib@steffen-goertz.de>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	Jim Mussared <jim.mussared@gmail.com>, Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: va9H25UG7cXs


--8t9RHnE3ZwKMSgU+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 16, 2018 at 11:43:02PM +0930, Joel Stanley wrote:
> The nRF51 is a Cortex-M0 microcontroller with an on-board radio module,
> plus other common ARM SoC peripherals.
>=20
>  http://infocenter.nordicsemi.com/pdf/nRF51_RM_v3.0.pdf
>=20
> This defines a basic model of the CPU and memory, with no peripherals
> implemented at this stage.
>=20
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
> v2:
>   put memory as struct fileds in state structure
>   pass OBJECT(s) as owner, not NULL
>   Add missing addresses for ficr
>   Fix flash and sram sizes for microbit
>   Embed cpu object in state object an initalise it without use of armv7m_=
init
>   Link to datasheet
> v3:
>   rebase nrf51 on m0 changes
>   remove unused kernel_filename
>   clarify flash and sram size
>   make flash and sram size properties of the soc state
> v4:
>   set the number of interrupts to 32
> v5:
>  move back to armv7m calls, as v4 of Stefan's patch removed the
>  m_profile changes
> ---
>  default-configs/arm-softmmu.mak |   1 +
>  hw/arm/Makefile.objs            |   1 +
>  hw/arm/nrf51_soc.c              | 119 ++++++++++++++++++++++++++++++++
>  include/hw/arm/nrf51_soc.h      |  42 +++++++++++
>  4 files changed, 163 insertions(+)
>  create mode 100644 hw/arm/nrf51_soc.c
>  create mode 100644 include/hw/arm/nrf51_soc.h

Besides what has already been discussed:

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--8t9RHnE3ZwKMSgU+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJbg/pjAAoJEJykq7OBq3PIYfAIAKU5HKGzSlW3FNQI9LBIYfiU
xaQtcQpNZCPdPOMcWfhYsJpiu+3Y2TyepbEt8gX8LREhc3BXoRZv16D7ENKt9DbT
lqBanTi/r4PdgxaAPAy+wsfiSgZ4xWFy/eeTi+jBcraSzVP9xZGTlF+oegZ0HB8w
sUtBsLtDNlIGAnpQyMbimaffyPrsQ+ImbEzyCuGGerkXWnbbxvsPSozTWXi9Kj+Z
am5fTiszM7c9XAb/FjWYdGjqJLu7j83o0ns1zC/qqRLwDGn1BPFGplvDV5zO94Y/
5n1j08nRmEMNESwXMfrnOSTkSgl+tJivdR9ZlliPtD5pnmEF8UlGZxtYASySyIM=
=ObAi
-----END PGP SIGNATURE-----

--8t9RHnE3ZwKMSgU+--
