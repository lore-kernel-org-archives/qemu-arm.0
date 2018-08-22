Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp2776828wrd;
        Wed, 22 Aug 2018 00:20:53 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPxz5qfdY7qExenrZMjihI0vvqr1zHCUL1+0sC4aCP6J9WaVxqm0t8FYQIQCnCE9xgR3IkLo
X-Received: by 2002:a0c:f883:: with SMTP id u3-v6mr49604549qvn.28.1534922453617;
        Wed, 22 Aug 2018 00:20:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534922453; cv=none;
        d=google.com; s=arc-20160816;
        b=NLoizp5etRKEeJDIDCLxofBYZqJ7jkoge0QBdNRkH7NXEDE9P4KwiwnnSWDc9uR7RO
         pL+qAKR4c8cfTtjBw4YQy52bj+Ax9Vc+Jv5EnpyvCuhzoqFwipMzWE5GgqIp5/OSxt49
         NLQlPuK7QaqMrpxGqTA6XplloTK0Xm/xPvLHnPgPVSsFriYL5xw+XXvKGEaEplhq6RIs
         NJOAqOw8/SobP4RibrbIKyzyaqXLlJcILFIU3RuSKCpADBQGk9X8YHv25SPHtXk0x5+E
         pesub6kVMk2K3rn6UBp9nTSBww28ZOa6c28Eu4Lfzrz1/mAj6i8AK/C2RZmu5mastPnN
         Dv6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :mime-version:user-agent:date:message-id:autocrypt:openpgp:from
         :references:to:dkim-signature:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=B9n5lw6kdgYeQmu+Zfe/3d6PNVQQwt9Etc4lHlmc/e0=;
        b=R5NIIZwuCkbYhUsAQboiTh5cBsvwqh+g2FrsLsgrUrOe4Uzf2ONc1CEXQFhOe5FERu
         fQPyCdR8pdseckV566ena0xGLFe6Ss+oN460xMjjz6k3PiMFYlBjop0iKhzv9IPJEnNY
         NVk09gP9pChFSXiwqQ9AoXV0gII5vhqHjh7ybrMDc2+PMMutFepiZcC8icffdS1+qw/j
         V7+G5tjU/IngFmP0KTjQ0QwbG3sVdzeRNcMxXzBKDCxRang5sC+qhPy0coq3XS9PPeTt
         Z7l4VCO7zwipQQfmrzF7txvN2Mfc3edIjWmpmVQ8UTxO1p4gPCdGjwtbiVNndytJDN33
         utIQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=wrjf6Tmm;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=VANup2lx;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=VANup2lx;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o82-v6si996671qkh.276.2018.08.22.00.20.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 22 Aug 2018 00:20:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=wrjf6Tmm;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=VANup2lx;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=VANup2lx;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:57241 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fsNRl-0001iC-4T
	for alex.bennee@linaro.org; Wed, 22 Aug 2018 03:20:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51429)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fsNRI-0001gL-BS
	for qemu-devel@nongnu.org; Wed, 22 Aug 2018 03:20:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fsNRH-0005nE-9k
	for qemu-devel@nongnu.org; Wed, 22 Aug 2018 03:20:24 -0400
Received: from greensocs.com ([193.104.36.180]:44005)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1fsNR9-0005gA-Bz; Wed, 22 Aug 2018 03:20:15 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id A4B0F238745;
	Wed, 22 Aug 2018 09:20:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1534922403;
	bh=INjuq7HDsKcy7sGcST3e+bYsGj+OmuuxclgGUSA8Go8=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=wrjf6TmmPtM8lGyvHUG6XkVIeASD09YUU/cE3Sz1nqOjBU9JajDy8zXabVLrhw8gc
	+fb+vALL3weuWHYBPks+IYoH5dT9236Qa0UIXsjP+GQ+73DTRanpvzpR8HTbMNwROL
	qtq7f8pKKxw/VLHvp5D2VRCw1rb6xTJ9aaJxQyK8=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=VANup2lx;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=VANup2lx
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qFScx9qfFU1N; Wed, 22 Aug 2018 09:20:02 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id B772923874A; Wed, 22 Aug 2018 09:20:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1534922402;
	bh=INjuq7HDsKcy7sGcST3e+bYsGj+OmuuxclgGUSA8Go8=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=VANup2lxNk0qsS76/WPF1cKydwU4M/st2bj+bn4utvbOw3/HEEtWc8dl0C74+0iN/
	sZsT5o9gK358Ll+DTj4ZvCouzRUjEXaKJqBcG1XCLvUvkUKouLikQ8AtdqSwEnL6nz
	hQ0x4/M9IXsT8t/8TbG8kYCJSbXTZRJg7L3naksY=
Received: from [192.168.61.102] (LFbn-LYO-1-488-36.w2-7.abo.wanadoo.fr
	[2.7.77.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 6EB65238745;
	Wed, 22 Aug 2018 09:20:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1534922402;
	bh=INjuq7HDsKcy7sGcST3e+bYsGj+OmuuxclgGUSA8Go8=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=VANup2lxNk0qsS76/WPF1cKydwU4M/st2bj+bn4utvbOw3/HEEtWc8dl0C74+0iN/
	sZsT5o9gK358Ll+DTj4ZvCouzRUjEXaKJqBcG1XCLvUvkUKouLikQ8AtdqSwEnL6nz
	hQ0x4/M9IXsT8t/8TbG8kYCJSbXTZRJg7L3naksY=
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180820153020.21478-1-peter.maydell@linaro.org>
From: Luc Michel <luc.michel@greensocs.com>
Openpgp: preference=signencrypt
Autocrypt: addr=luc.michel@greensocs.com; prefer-encrypt=mutual; keydata=
	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
Message-ID: <aec8f424-f2eb-b52b-d2ed-c1249cdf32a0@greensocs.com>
Date: Wed, 22 Aug 2018 09:19:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20180820153020.21478-1-peter.maydell@linaro.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="N3tevn2M5jWscMpV88bE8XKIgUQ60Nvs7"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
X-Content-Filtered-By: Mailman/MimeDel 2.1.21
Subject: Re: [Qemu-devel] [PATCH v2 0/6] target/arm: Some pieces of support
 for 32-bit Hyp mode
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>, patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LDGfCkfAfDSn

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--N3tevn2M5jWscMpV88bE8XKIgUQ60Nvs7
From: Luc Michel <luc.michel@greensocs.com>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: patches@linaro.org, "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>
Message-ID: <aec8f424-f2eb-b52b-d2ed-c1249cdf32a0@greensocs.com>
Subject: Re: [PATCH v2 0/6] target/arm: Some pieces of support for 32-bit Hyp
 mode
References: <20180820153020.21478-1-peter.maydell@linaro.org>
In-Reply-To: <20180820153020.21478-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 8/20/18 5:30 PM, Peter Maydell wrote:
> Now we have virtualization support in the GICv2 emulation,
> I thought I'd have a look at how much we were still missing
> for being able to enable EL2 support for AArch32.
> This set of patches fixes some minor missing pieces:
>  * AArch32 HACTLR2
>  * AArch32 HCR, HCR2
>  * support for taking exceptions to Hyp mode
>  * boot AArch32 kernels in Hyp mode where available
> and I threw in a trivial bugfix:
>  * Clear CPSR.IL and CPSR.J on 32-bit exception entry
> since it would otherwise have a conflict with the refactoring
> of exception entry.
>=20
> Changes v1->v2:
>  * some patches are now upstream
>  * v8-only registers no longer created for v7 CPUs
>  * split the "factor out exception-entry code" into
>    its own patch
>  * new patch: clear CPSR.IL and CPSR.J
>  * new patch: boot kernels in Hyp mode if possible
>=20
> (I still have the same "guest EL0 segv" issue as for v1
> if I actually enable the EL2 feature on Cortex-A15.)
>=20

Reviewed-By: Luc Michel <luc.michel@greensocs.com>

> thanks
> -- PMM
>=20
> Peter Maydell (6):
>   target/arm: Implement RAZ/WI HACTLR2
>   target/arm: Implement AArch32 HCR and HCR2
>   target/arm: Factor out code for taking an AArch32 exception
>   target/arm: Implement support for taking exceptions to Hyp mode
>   target/arm: Clear CPSR.IL and CPSR.J on 32-bit exception entry
>   hw/arm/boot: AArch32 kernels should be started in Hyp mode if
>     available
>=20
>  hw/arm/boot.c       |  11 +++
>  target/arm/helper.c | 212 ++++++++++++++++++++++++++++++++++++++------=

>  2 files changed, 196 insertions(+), 27 deletions(-)
>=20


--N3tevn2M5jWscMpV88bE8XKIgUQ60Nvs7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEUvSC0Bi15mxw2PT5d8knW3QnTr4FAlt9DpoACgkQd8knW3Qn
Tr7zkRAAgtr5gcdGbI5GShfRCuXnl4Kj7SCCWlZvGmaqLtnrWFyQZKpHqa/vL1c1
oh25kMcow4o96mtwZlO8Mt154MEQMp3NhhKHZegz2MxrebZ89rY2ro6Yt0DOUFcA
mXJARciOU94Zp93p0BUGGcndmrUF+rLBm1RYStrXCJv/Zz+2Fj0vvA6njzpSJiFO
7NkHCw4v5HbLWiIhKksrIL1Gles2ZzjgiwN2duTDwc0f/+Y8Wh9PFCkii7xDlL/b
FseNd4z0aomar5YcdfGmEpdAeB19ZyHOMWC/JygJjUgGDnn5q1T8ZYzLgykqdBo7
uVHODVCUIbmazohsGDP9rpfS26++PnKEas4hhmx8Q1Q+bDVE4vk/XEjS0esSO08p
BwLcm5jjcTMmgIYPO646qO/imcIuAxbq6eRWPn/kcBVhTW+SU0CUSMG3uYsf7gJX
RlG5Q4CkiQWkeBojINRCKUDwWlWfuD/tg1yscOmtgwDnL4a+EesUDnieA6HWuQ29
B2DGbJZGBZBcULzNl7IhWqZz5iIMmSW9v7QkVWk+P2wi1ZxVa7Qw2KwV7zhfSM+1
K5BFomYo5mC8rbrKd59BAmMDe/Gf88ICjeQxlCjd0KDAD2dgOF1lLG1rD7z0ufaC
ntSXqR/XQtDcjWecyXylpaFWu11CgoAtPZKJosJHeUoDHAs/MVA=
=rJ2C
-----END PGP SIGNATURE-----

--N3tevn2M5jWscMpV88bE8XKIgUQ60Nvs7--
