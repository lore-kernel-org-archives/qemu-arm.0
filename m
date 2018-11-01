Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp786839wro;
        Thu, 1 Nov 2018 06:08:33 -0700 (PDT)
X-Google-Smtp-Source: AJdET5cXgkQebH2c22a7yIHtSyi6A3FRFtVMkpc1rhvONlZcsDwzrEvRiQidZJlaTP/g8cplMy7l
X-Received: by 2002:a0c:9626:: with SMTP id 35mr6546394qvx.207.1541077713789;
        Thu, 01 Nov 2018 06:08:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1541077713; cv=none;
        d=google.com; s=arc-20160816;
        b=CG4vHuqQ9e3x1iGt0uvUuhqE4O1gJx4Tq3ml9kd2yLH9h0B7fQJofcI9mjO9cm5plT
         3Lb2e//MBiatWxPCOm8S+kUwZcVyVupOTHBRVndsWZTSz5cYqOJgIHPyAJ3ozLyX0JKT
         T1ft9jiMq4WOWFi8rKHMymUm7YUNfmpXkPAK4NKi/u1ay4gBJXctzgyS23jiKksD8UZD
         c6bNNIbYXQ68KowffpK+UCNJWtncu4UgV0/O1nIWzNjQNchr27ykIsCMysg+RwJSjj78
         iyDNfi1L2JbMBqUcjrIuCkUGPSH3hP5GzgPbet62c2soWccflGaa8i2XACHpXY3v9jGA
         kpYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature;
        bh=GeOAC4+GOxZna++S8Beb4O6Md3bN/jQUfHNqlw6Q8wE=;
        b=FZj0SMGvJTYWHIpjAjmvomI73GRxHaxIegCDmDBkDx1EbIoxXMo2QDTdj+hmLxz5k3
         FNUsHeKQZ4iqg2mdwIff296X2Xnw5zgiCPXXqHMHmf4cBxnHh6qZwe3GvGJIzCyzLBfR
         Jk7mz3gSeji7FYAdYlNw6Q+MIOev1GPLiPOHV8xbzlFNbqsNpvHe+p6b2lqhJ+KHY/ne
         GYq39I6ESOwHoDedppkDzokL1y6nfrOvw9E2fVcq0VxSJIQPIfqFp5db/lFGhIAaF7Jz
         1KwJE5mpiXYLdljdiVSVYyUYTLp33ob8Xou1CKfpODoB8jpJcTGxVm7IxXZqC+R5uMqV
         9Olw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=VS4EEA36;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 34-v6si807042qtp.70.2018.11.01.06.08.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 01 Nov 2018 06:08:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=VS4EEA36;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:42046 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gICi9-0000n6-Au
	for alex.bennee@linaro.org; Thu, 01 Nov 2018 09:08:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44857)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1gIChw-0000n1-8X
	for qemu-devel@nongnu.org; Thu, 01 Nov 2018 09:08:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1gIChr-0007aP-WF
	for qemu-devel@nongnu.org; Thu, 01 Nov 2018 09:08:20 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:44466)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <stefanha@gmail.com>)
	id 1gIChr-0007Zq-N5; Thu, 01 Nov 2018 09:08:15 -0400
Received: by mail-wr1-x442.google.com with SMTP id d17-v6so19706123wre.11;
	Thu, 01 Nov 2018 06:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=GeOAC4+GOxZna++S8Beb4O6Md3bN/jQUfHNqlw6Q8wE=;
	b=VS4EEA36syt9iiVbpEwCy7dKtpZ9GL9Ysq5g+okOjs6bWGS0am0PFPDgERNHm5mDj3
	N+0pSHK5x9l+2n5AFaZsHtGcmjJIV8QYRQrzDuV2+8HZa6aSEVy9H3z327Lg/DGCsKtp
	taeBhg4pcoE3sAGTQIBvjjW5XCvAwMujN3MwggQJfll0FyNnVgtb6ZORiUiR09p6E5Il
	k09uXdiZ7ZDPf5BDKVxQKFBpDrH8E0d3jNZYipXT5EZ/vkZoh2TolCnsHK1eydnOeoHk
	CgHzRH5K51Vaiq7Wz6ZNgh6zkBzSxk8e/1m1CsoL4QEyzMyPYGzIS8gdfEUxxejxW2zX
	VNVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=GeOAC4+GOxZna++S8Beb4O6Md3bN/jQUfHNqlw6Q8wE=;
	b=ih4YnKtJgK7HWcUvlvKE9BGoEq/0ZnFpW/l+3lUmpTAvBeJH3Iw6FPGkj0ihCzDetM
	9FazXyy8prCLZ6csMSzYOtPPDkCSNVMlR9qMBcOrmB4lQg/DwJ6kGzm+Hw4QOXwtVDxv
	tuoHur0Yr/4Qwc1nX090FYf97UYKSud8RN3Fa4T3yNG86F7ZByZDe5ZtgJb/+FRr2T8Q
	bJH7/wg7rrgwYVxaA/GbGinlJYtKS9DplXjJygA9OQ16ZXf7mxNCAo7k6Pd4pAqZGl0Z
	KVaF/XAFWUpInhECSn2FUIGQZC6LlqfENunlUo1J9vAFkVIJEVFDA4+U8Cp1MAnGj1/C
	Crjg==
X-Gm-Message-State: AGRZ1gLwXITaoov8KhNMcjSz+AzndlrGB37Jdi4YQCs7w3wRzCOC1GHJ
	0GmhXLuOq6F/Ef9E3V7B8+M=
X-Received: by 2002:adf:e0ce:: with SMTP id
	e14-v6mr6713811wri.199.1541077694515; 
	Thu, 01 Nov 2018 06:08:14 -0700 (PDT)
Received: from localhost ([51.15.41.238]) by smtp.gmail.com with ESMTPSA id
	v19-v6sm16961510wmd.20.2018.11.01.06.08.13
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 01 Nov 2018 06:08:13 -0700 (PDT)
Date: Thu, 1 Nov 2018 13:08:12 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Steffen =?iso-8859-1?Q?G=F6rtz?= <contrib@steffen-goertz.de>
Message-ID: <20181101130812.GV24946@stefanha-x1.localdomain>
References: <20181031002526.14262-1-contrib@steffen-goertz.de>
	<20181031002526.14262-14-contrib@steffen-goertz.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="b3OyYALfe3DXUU4J"
Content-Disposition: inline
In-Reply-To: <20181031002526.14262-14-contrib@steffen-goertz.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::442
Subject: Re: [Qemu-devel] [PATCH v3 13/13] arm: Add Clock peripheral stub to
 NRF51 SOC
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
X-TUID: flyryjg0rDVG


--b3OyYALfe3DXUU4J
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 30, 2018 at 08:25:27PM -0400, Steffen G=F6rtz wrote:
> This stubs enables the microbit-micropython firmware to run
> on the microbit machine.
>=20
> Signed-off-by: Steffen G=F6rtz <contrib@steffen-goertz.de>
> ---
>  hw/arm/nrf51_soc.c         | 27 +++++++++++++++++++++++++++
>  include/hw/arm/nrf51_soc.h |  1 +
>  2 files changed, 28 insertions(+)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--b3OyYALfe3DXUU4J
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJb2vq8AAoJEJykq7OBq3PIktkIAJKWpH2zEto8HkjNlQyBwdkN
EeuZb7Y+W0gnCb/oCo7iYt0MSUDrHiwNqSgfU/FAj14xfFJaaND5mA5mZv76PWxo
V/4VKHw3Kmr0lnMlZqenknCf+BYdaze0A3AB393HiUKTVkvGLjvY6RSVYKAoaxnV
MzPn+02zod4bOVAhg6WTJp+tEKjyjy4AbEemrBLuw+fIyG09yDp+VRX+xucHRyGH
0fv8C43ZeYwPDLVu+BQXysbcCaonlYBiE6jfPpvNCGnpciK2n6HBzBIPDKTkzzOM
X7rmN0Hd/KyAg3fR9eooA9N1sJPFGZwsPbwwR78kc28pVTOYUIyMDwVML15PFN4=
=mtG6
-----END PGP SIGNATURE-----

--b3OyYALfe3DXUU4J--
