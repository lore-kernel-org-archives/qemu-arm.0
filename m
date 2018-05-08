Received: by 10.28.4.212 with SMTP id 203csp4081943wme;
        Tue, 8 May 2018 05:06:11 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZqO0/GFoeGAqs8AOpjqKMHx/ZpiTKqQoUhK7Ne1Jew1AoyrepaJrqvzf60rDcW7WTupitl4
X-Received: by 2002:a0c:8815:: with SMTP id 21-v6mr21674664qvl.167.1525781171140;
        Tue, 08 May 2018 05:06:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525781171; cv=none;
        d=google.com; s=arc-20160816;
        b=vWmmQ1MzZHVkUH5mzVuYdQQyqOhT/GyT25EFqEOn7uB2i+M2FQ6uUESgArHcQgcvuv
         bZcsH/RoYndo5iN7igfJG4MCZE67lB6jTK+tPqDODhgX6CIPFfwiEeMQ1c6vUetwZRAi
         wfTbZdgGQE3uXaDH0MltkNWqYXnLgEZ/k+RoTz3tul5OVzpJk5zfjq1DcADNBLhgeV1s
         zuNcx357mtxbAqkK9C5mZAfZO71Jyva3EQozTZ2wH6tTdP/hw7I75yVso+D2aUjvCtUY
         TJbK50faOeX+VUx5WcPGpP0tdPPoB5jl5KXU1wPJINHlyZUS1FoKYiCEwHU8TTxnhB+s
         ii9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature:arc-authentication-results;
        bh=N9MrWLLOG88Zdo/z/Afm06JTRQwYZj4lDkHjoFaKx+c=;
        b=W756U8vtJo6KN9DZBfYSsUsg5otbpstWjQpUmvSFAS9Hsjo19KX9XGf2CJIgRYhyrh
         gn70HF3lNP4+O/Ui1kix+Xd9ecJzakP+7tktXrbEFCxmlaDrn1/U7L6qUuAWGYIY1DDn
         8o+jPdu1NaBZS76vTial2zAVZQWRtUxhIUH5HIMFShd3efiitVOwPg6bc/5ZuKBm/mF+
         N7tFxIWjjfYA531lL1cx5e9UQ0ye8GbpqjtsGD6pYUmlloBPeL+2D1p23J487HyUFYUw
         oTweCgAbUX93YLRx+D0POrcQcGXjliNca8dEad1RXUTjbHnSNNBg3Ma0XPGsk9xdBNo8
         64ag==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ZKmKXjr5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t1-v6si5532432qvh.188.2018.05.08.05.06.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 08 May 2018 05:06:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ZKmKXjr5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:50824 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fG1Ni-0004sQ-Li
	for alex.bennee@linaro.org; Tue, 08 May 2018 08:06:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34691)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1fG1NV-0004pC-Hr
	for qemu-arm@nongnu.org; Tue, 08 May 2018 08:06:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1fG1NU-000827-K1
	for qemu-arm@nongnu.org; Tue, 08 May 2018 08:05:57 -0400
Received: from mail-wr0-x22d.google.com ([2a00:1450:400c:c0c::22d]:40002)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <stefanha@gmail.com>)
	id 1fG1NN-0007yH-3Q; Tue, 08 May 2018 08:05:49 -0400
Received: by mail-wr0-x22d.google.com with SMTP id v60-v6so32028214wrc.7;
	Tue, 08 May 2018 05:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=N9MrWLLOG88Zdo/z/Afm06JTRQwYZj4lDkHjoFaKx+c=;
	b=ZKmKXjr5dNihScTvK5PKJgYVLLLqDtQxpSO0rvbTmOoGlXpkDOCQqSbcLtU4g3kBNY
	jxm3Lc6mAVaOtAx2dAuZSjOkSfJ+8074h5DxAYACmwbdrgauIZbIhXEDxTy/GTHavTwg
	8K9J/79WbX8T22eGk+YjmsesZe5111VKFEnXUIrnvBclUH0TvFtkVYOXmS1bZR5Eev4z
	A5kErzK9MHvc7Ou2dQSWpQYb7Bea21+VrOjhYtTCNqx2qgtLdCr8dBtlq6c7brjw+P2V
	/wZyXmQ8ifuJ4eEfhM8oj58GbT1j3sm/P2obrMDhLluRySTDYreZxJ/+NXzAlrfwu4QP
	vcYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=N9MrWLLOG88Zdo/z/Afm06JTRQwYZj4lDkHjoFaKx+c=;
	b=GGDHAJLLlXMh5dlH9yVWs0E0K1PKbSGtg+4+7afoBCIf4+P1u0j2n/gakmu0sUrWoW
	bu+16NP+mKaLF2jLgXPnBeGRA1/HDzbc7D95HorYqsihw+RfNCJcpfL0pi+XjigUeUdr
	0MdWLgW4yZ5yiPC9m5C9+uDUrxdvg9bnqOIOfHlwPUiTyxyC5ZF+NZsfHuwOypt9u+qd
	2JDExAD1LIR3zI4v5/AciW9v7EtAqWz0LEP9r/EwTmp5lGUDUTv1xK4Ayx1CEly67Vld
	0xYi6vuQbxnVT1xo3v/qb3UgeM+OcdoYFddvufUyuTcpwJWJPTrkFrfs41m0OuDHOzLN
	ipJw==
X-Gm-Message-State: ALQs6tDh8BXREf+HFpXZ0HuNg4x23E0YaRAWijqZOQEdzihVga86y1WL
	78B9HxUk+bfQN9WCVgV91Hc=
X-Received: by 2002:adf:8004:: with SMTP id
	4-v6mr30465043wrk.274.1525781147917; 
	Tue, 08 May 2018 05:05:47 -0700 (PDT)
Received: from localhost ([51.15.41.238]) by smtp.gmail.com with ESMTPSA id
	69-v6sm13595082wmi.29.2018.05.08.05.05.46
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 08 May 2018 05:05:46 -0700 (PDT)
Date: Tue, 8 May 2018 13:05:45 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Joel Stanley <joel@jms.id.au>
Message-ID: <20180508120545.GK19710@stefanha-x1.localdomain>
References: <20180503090532.3113-1-joel@jms.id.au>
	<20180503090532.3113-2-joel@jms.id.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ogUXNSQj4OI1q3LQ"
Content-Disposition: inline
In-Reply-To: <20180503090532.3113-2-joel@jms.id.au>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::22d
Subject: Re: [Qemu-arm] [PATCH 1/2] arm: Add Nordic Semiconductor nRF51 SoC
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	Jim Mussared <jim.mussared@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Jq03P5LTbYUa


--ogUXNSQj4OI1q3LQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 03, 2018 at 06:35:31PM +0930, Joel Stanley wrote:
> diff --git a/hw/arm/nrf51_soc.c b/hw/arm/nrf51_soc.c
> new file mode 100644
> index 000000000000..a2e3d6f013f0
> --- /dev/null
> +++ b/hw/arm/nrf51_soc.c
> @@ -0,0 +1,101 @@
> +/*
> + * Nordic Semiconductor nRF51 SoC
> + *
> + * Copyright 2018 Joel Stanley <joel@jms.id.au>
> + *
> + * This code is licensed under the GPL version 2 or later.  See
> + * the COPYING file in the top-level directory.

Please include the link in the comment:

  The reference manual is available here:
  http://infocenter.nordicsemi.com/pdf/nRF51_RM_v3.0.pdf

> +static void nrf51_soc_realize(DeviceState *dev_soc, Error **errp)
> +{
> +    NRF51State *s = NRF51_SOC(dev_soc);
> +    DeviceState *nvic;
> +    Error *err = NULL;
> +
> +    /* IO space */
> +    create_unimplemented_device("nrf51_soc.io", IOMEM_BASE, IOMEM_SIZE);
> +
> +    /* FICR */
> +    create_unimplemented_device("nrf51_soc.ficr", FICR_BASE, FICR_SIZE);
> +
> +    MemoryRegion *system_memory = get_system_memory();
> +    MemoryRegion *sram = g_new(MemoryRegion, 1);
> +    MemoryRegion *flash = g_new(MemoryRegion, 1);
> +
> +    memory_region_init_ram_nomigrate(flash, NULL, "nrf51.flash", FLASH_SIZE,
> +            &err);
> +    if (err) {
> +        error_propagate(errp, err);
> +        return;

Please free resources (e.g. sram and flash) in error code paths.

--ogUXNSQj4OI1q3LQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJa8ZKZAAoJEJykq7OBq3PIjnAH/3BpDyCxCuP1mq8lY6wkk2wH
kejCscpdqCAw5XLUWw6kstCjYqOjQ9QSiRKEohDwQcXwMp2SJuVJG44ZhR0EhsGM
S23rYGycW2O9EjyEvObBHCgvK5l2WVd9eY5SsGk3TKCjlgjVUkIkPN2eoVG8JeGD
hiPsGxXP1q21UmwKLI0rVMrRTp1eowqCorzndQl8pwH7Szyn1iH85WQvdS2p4DD8
5+7vmN2xtPayI8Rqy5fIEWnFgu5eLe4qtZNKkYCH2Ckn7F014Hxv+Q2q0464D+g6
u9apQhB0VO+yQUQmBQuoaN0+vUZMfUCYRRVL5E2KzWyvVrLDz8Gl7zi57Yl2QXU=
=4Qc7
-----END PGP SIGNATURE-----

--ogUXNSQj4OI1q3LQ--
