Received: by 10.80.163.71 with SMTP id 65csp1804927edn;
        Thu, 15 Sep 2016 02:20:46 -0700 (PDT)
X-Received: by 10.200.39.201 with SMTP id x9mr8459362qtx.3.1473931246231;
        Thu, 15 Sep 2016 02:20:46 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id j62si2353776qkd.130.2016.09.15.02.20.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 15 Sep 2016 02:20:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:32958 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bkSqb-0004gv-MD
	for alex.bennee@linaro.org; Thu, 15 Sep 2016 05:20:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56523)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1bkSod-0003ZV-3q
	for qemu-devel@nongnu.org; Thu, 15 Sep 2016 05:18:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1bkSoY-000713-W3
	for qemu-devel@nongnu.org; Thu, 15 Sep 2016 05:18:43 -0400
Received: from mail-wm0-f68.google.com ([74.125.82.68]:35642)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1bkSoY-00070p-PJ; Thu, 15 Sep 2016 05:18:38 -0400
Received: by mail-wm0-f68.google.com with SMTP id 133so4135559wmq.2;
	Thu, 15 Sep 2016 02:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=T40fhRRC/b02BZKvg2zQSqH5cu0RO9S0INZZ5d8oZj8=;
	b=HtIM+neHo/ODqwtdF3Q22eNdPAjZLO04P93NTWlimmJthXQonVXBVp3vhe3oPGwPeA
	OfnR5HkR11+qhH02plP5enL02y05Oq5ZvzLjltaLuhni4wugAuitxrb7Z/Kwhj7e+zgS
	R5rYcKLVCHzLNfN3VqdAi7UigLsI8vu29ore6MF/mx9tYqKlMRxW9J3jV9rz5J49bCfz
	Y//PRLOO0RoS2E1PUEAihnZheUj693Oi3yD3lwubleKH6MD7K/Ld0Y+wLw0/QgDR8JZW
	2ibNwL18zUbhHBLlY4UVmAw5EsksCoyXEKaNz55qthKZxR3GYcxBro9AbE5p60EjgJJY
	xtJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=T40fhRRC/b02BZKvg2zQSqH5cu0RO9S0INZZ5d8oZj8=;
	b=FGRgacQ6sgTUNFYEqqBHuewREGMM19fTAMJCk6S7nokSj+pKExgLmeFvI7x6WAAIq7
	5swYcxhHqEbhnmRsLg0UZ7yXvaKK+1dr3YN8I8xx0i7wcPvA6GaweOzvm0f5XIQtnlkX
	N1ciejrB6gaD6H5l8VIGQqYWkOdtrG90mE/A6VS+8A7vtgxMmMfoqHh/knP0gX8GQca6
	+LJO62XQiKaF87uLs9foWUKGIVXbpo+AcoEU1ct3p9MdT8+heNtTaOdC7/9yJmvtr+r0
	2WbKcFqc3XaHET4s+QuIFOm8ZX39tgIy7QlxFf7YGZbweufNyaK3JkLh7J5LvmVvEkxo
	TiLg==
X-Gm-Message-State: AE9vXwN0+qfKMkavZB56GQE6dVfYtaXEF99kCVPa365LhJQe/1FlFloKsBI4N6if/vwR4A==
X-Received: by 10.28.180.86 with SMTP id d83mr1906472wmf.115.1473931056400;
	Thu, 15 Sep 2016 02:17:36 -0700 (PDT)
Received: from localhost (host109-156-65-4.range109-156.btcentralplus.com.
	[109.156.65.4])
	by smtp.gmail.com with ESMTPSA id n7sm2432459wjz.32.2016.09.15.02.17.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 15 Sep 2016 02:17:32 -0700 (PDT)
Date: Thu, 15 Sep 2016 10:17:30 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Mahmoud Abd el-hameed <mahmoudmahgoub92@hotmail.com>
Message-ID: <20160915091730.GB4214@stefanha-x1.localdomain>
References: <AM5PR0602MB28205F990FED17137DD19890C8EB0@AM5PR0602MB2820.eurprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gj572EiMnwbLXET9"
Content-Disposition: inline
In-Reply-To: <AM5PR0602MB28205F990FED17137DD19890C8EB0@AM5PR0602MB2820.eurprd06.prod.outlook.com>
User-Agent: Mutt/1.7.0 (2016-08-17)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 74.125.82.68
Subject: Re: [Qemu-devel] how to understand proccessor codes in Qemu
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
Cc: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SEhPngdZbXWR


--gj572EiMnwbLXET9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 23, 2016 at 12:57:09PM +0000, Mahmoud Abd el-hameed wrote:
> I am a new developer at Qemu and i want to understand how the processors =
code works. I am get lost through google and didn't know where i can begin =
to understand the code.
>=20
> my aim is to understand how can we model the proccessors using qemu?

One way to teach yourself is to look at commits that add a new processor
architecture to QEMU.

For example, the tilegx architecture was added in 2015 and is reasonably
small.  I don't know if it's the best example of how code should be
written but it's a starting point.

git log -p 2cb154bc19854232b5379236dd9dfc06d83ced1e..461aa6783eec27f209b026=
c6647fc7a83b2997cd

Keep in mind that QEMU has two main emulation modes: system emulation
and user emulation.  System emulation does full CPU (including
privileged modes, MMU, etc) and hardware emulation so you can boot a
guest operating system inside a virtual machine.  User emulation just
does the userspace ABI so you can directly run binaries like /bin/ls
that were compiled for another architecture - it doesn't run a full
virtual machine.

The tilegx architecture I mentioned above only implement Linux user
emulation.  It does not implement system emulation.

Start by learning how tilegx was added and then explore other things
like system emulation support (if necessary).

Stefan

--gj572EiMnwbLXET9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJX2mcqAAoJEJykq7OBq3PIqcQH/1AlUoJ72FHMpzmLAjpsAaqd
qUwO6uXaBT397KDfoYOU30ynLCG7OGeleJBU5H5LTT7kzt6ZVEti3JexeLao2aSk
UYQmUfbWZ6aVTVIE9lNHn3KgaKVVTgTxshwoL7J5dzJLOxAVfAB2Zd4uIcQ3jrO+
NB7Mc+DEbdZrKP735CnPWTD6hhIOV8xebc3TSe5ccw8rBD5CKLyHo7CixkuGr1GN
N6DNMnN7Y0MrI5cJxRYW08BoUw+Vh2tCfgq+j241Uy//NYSQ5fQ9ziiRzuDl1rCA
CkTG5OKPvC/QuIXZvhTqHqR0t//FETzxnJSMN1TBNngwxalX9vUnCl27oNb1LEw=
=/W9l
-----END PGP SIGNATURE-----

--gj572EiMnwbLXET9--
