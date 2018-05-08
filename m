Received: by 10.28.4.212 with SMTP id 203csp4077595wme;
        Tue, 8 May 2018 05:02:35 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZqSSJZ9SNoRERjnPk/+6esqzVRIChVQC467cqhPASgMGsRvd+k+OI1ZbP+6dvLKfRYZAkdh
X-Received: by 10.55.78.215 with SMTP id c206mr29804447qkb.207.1525780955742;
        Tue, 08 May 2018 05:02:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525780955; cv=none;
        d=google.com; s=arc-20160816;
        b=KXBjSOZd4FmwIPqcNonqAwHqncyCFWk+57ctD4qyTC5gng1J9JRujGkJ95fmKqDKzJ
         7wo8rlnulVByD8WKfASqT7yxhMsuvbK2GPZz/8VQ1/zt5DdrRBKnCnHi9mrPP60mZHkK
         dIH4wNJycNhr7KNmyOVz1oa7+/nmUuGd+ohWAuhMBwJ9jLUKp7RhKIhtHu+qIh5wKUT8
         Np65syMr0++0BNKnQRDR22hf6t8vlXjxm6jJLt6zWvGCbgmEguZn0jn1IXvnVAbdTqJ6
         +xAUNCxFsb5MEZv/Df0IqDx3XrefG6WubFO+oMdaRLqbJiWx6iUaFSac+Bptb1Dbk2gG
         qP2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature:arc-authentication-results;
        bh=1DoqxjbPQycltPuNAfqjtk6lAOYfcAPbV4ngoQ/PNcE=;
        b=M/e50i2qbg/nKT0rhhMVK634Zfi5wAMqtySrWCQ7ECSlYexT1iEhIUmSDjBUwE+Dqh
         Y2JLT9v6aITqEmsZlnr2iw5JrAJHxVcYs3lFZTYiJHHrPhRqpzjOgw2AKye+Djp/TBuT
         dKl66akgfKN+tlGVDQzdLKE1U2PPkUJLj+yaTqI87LiIQWMcAGo70JQiCtPUAPBcA5rL
         UCHa3C4O3tKg6iHNdm+Yen4kvBp3XLqg3nK8GGEsB+c1mom4fC33I2YdnqGf3f3uiWjm
         yBYPGQPNh4TgOfgujNAbLYR4NNoJfvFbQwXsVyIlkrWdS4MfdDei5buzJubOHDA870Y7
         bJAQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=X2n+MB7J;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y33-v6si9874810qtj.136.2018.05.08.05.02.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 08 May 2018 05:02:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=X2n+MB7J;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:50813 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fG1KF-00038V-5M
	for alex.bennee@linaro.org; Tue, 08 May 2018 08:02:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33890)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1fG1Jq-000344-Rs
	for qemu-arm@nongnu.org; Tue, 08 May 2018 08:02:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1fG1Jl-0006kF-9x
	for qemu-arm@nongnu.org; Tue, 08 May 2018 08:02:10 -0400
Received: from mail-wm0-x244.google.com ([2a00:1450:400c:c09::244]:36185)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <stefanha@gmail.com>)
	id 1fG1JV-0006eq-QG; Tue, 08 May 2018 08:01:49 -0400
Received: by mail-wm0-x244.google.com with SMTP id n10-v6so20984902wmc.1;
	Tue, 08 May 2018 05:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=1DoqxjbPQycltPuNAfqjtk6lAOYfcAPbV4ngoQ/PNcE=;
	b=X2n+MB7J5xElz7bNGG6hOwghJWmg1sy7+1MEXi7CaKUnosDA16ZcGcpxFU6em7Om+u
	yBIYBrO12P8dYiBZKQFKrhaPI1+j8N0qHuP2UmWhHUk0bot52Mv9mXAc+6sH3Ph5VF31
	9K579RDZYp3+o9iOj3EVo0BdnU+T/gT1y7LmmjRPWx7T2S9KlDw+q1WnwpHwnpzbfz97
	uyHvOWv/kbGj86Clz98kNAwTrce5UUVRT3uaWAMkPDjiPVdC/J8FfSsKfqXpRmgpaffe
	mk/UVmKY3F4/dtOQizKmYSh5/4liMvjBmcjH1ahPw92Xv7WGpB/mvZyniySjf4NmsRtd
	iddA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=1DoqxjbPQycltPuNAfqjtk6lAOYfcAPbV4ngoQ/PNcE=;
	b=aTtQ1r+AgiXuWvLJBBsEzFQDqlHS+7/OVuUdREL4908P6txJBkBeLmvZh0o5ssvjU/
	ihG5EaIJQLc2bjIWoaDlHF+YxAmSS9YuYEahzcO37Rqx0JZewXNgvLiDNWn6Qp1FxPBP
	RjLjEgTD0Um92lp/ktUMsVXKa1P1VKdd470owx1f+nHx41t41ZSiowA+cc6cLQmU5Nce
	7bFAAjtzA4cI8EpF2Uk23P97G2Rume6yOBzR8tjHtV6dQU0JDkBXiX14ypf9buOADbHi
	dH1vVc6QsLF/QE0gsQIX1ARvG27crBHKD17N+yHWYW7UBuNzt++kc2skQt0uXEX7Et4s
	9e7g==
X-Gm-Message-State: ALKqPwcYfvJI3kZN9VnrXCO0vYSbmuVqI+r5uEVRheLHEbz+MQjGSNCG
	MjzujDRANsDOW4Dt35fA7yI=
X-Received: by 2002:a1c:a104:: with SMTP id
	k4-v6mr3093310wme.106.1525780908471; 
	Tue, 08 May 2018 05:01:48 -0700 (PDT)
Received: from localhost ([51.15.41.238]) by smtp.gmail.com with ESMTPSA id
	y45-v6sm28399862wrd.97.2018.05.08.05.01.47
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 08 May 2018 05:01:47 -0700 (PDT)
Date: Tue, 8 May 2018 13:01:46 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20180508120146.GJ19710@stefanha-x1.localdomain>
References: <20180503090532.3113-1-joel@jms.id.au>
	<20180503090532.3113-2-joel@jms.id.au>
	<CAFEAcA_4EiWXdSNdbiEWO_Q2Sac7qzNduhyWVNwW-crc5=w_nA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ZG+WKzXzVby2T9Ro"
Content-Disposition: inline
In-Reply-To: <CAFEAcA_4EiWXdSNdbiEWO_Q2Sac7qzNduhyWVNwW-crc5=w_nA@mail.gmail.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::244
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Jim Mussared <jim.mussared@gmail.com>,
	qemu-arm <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 78NIamIvN9YQ


--ZG+WKzXzVby2T9Ro
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 03, 2018 at 10:17:51AM +0100, Peter Maydell wrote:
> On 3 May 2018 at 10:05, Joel Stanley <joel@jms.id.au> wrote:
> I'm a bit reluctant to take these patches until we have an
> actual cortex-m0 model, because anything we take into QEMU
> master is then something we have to support. My rule of thumb
> is that it's ok to have board models that are missing
> functionality, but we should avoid models that have wrong
> functionality (like the wrong CPU) where we can.

For the purposes of the micro:bit emulation project we're not sure yet
how far the M3 model will take us.  The M0 is a subset of the M3 and we
intend to use it during bring-up...and even afterwards if software runs
okay with it.

If you don't want to merge this into qemu.git/master we'll have to
maintain a "microbit" project branch on which Julia and Steffen (and
others) can work during the Google Summer of Code and Outreachy period.

My concern about keeping it out-of-tree is that we want Julia and
Steffen to participate in the upstream community and get their patches
merged.  Anything out-of-tree could still be rejected at a later date
:(.

Can we mark the machine type "experimental" and merge it in
qemu.git/master with the understanding that it may be removed if there
is no active development?

Stefan

--ZG+WKzXzVby2T9Ro
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJa8ZGqAAoJEJykq7OBq3PIaE0H/3cns7lplbrLFQTQcgi2VTvl
SDz1njVbhEGY0FzzH/oiNUiGDSt4NwjKXRD0od/N5xb/Bb6a/NqpnRUCILpr3eQ+
520mmazWazsiqgmCbdHiONSKatDKJKiXTPztnVgAHH2l/7i/DhfmGwZl+rSTArY2
mYFBbKXgf9qXoGjwx7dPSsNsDrI5P6IHAr8EZOfxF0lo4afMdabP54qhcdZiZu4M
8NjoDl2eEJ/0AgwuFyktg/lGK1DjrQF3sml8i5Sm+dVfISPFAvM1IyrGHBqjQbHL
w5EoMO0dEl7Hp244cNARx1xUSg2Um1jI2mllCxRBr21mUO/uHOJ2T5+Xl3eC120=
=DqKL
-----END PGP SIGNATURE-----

--ZG+WKzXzVby2T9Ro--
