Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp4956306wrd;
        Mon, 27 Aug 2018 00:17:17 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdZ4VdFO1JLR4jjrbWGzdo/eUtjXTp6rFMeSJbyLzFZ4nrdYxwvokmTGVlicfOK9P83DJ5nw
X-Received: by 2002:a37:8346:: with SMTP id f67-v6mr12347649qkd.18.1535354237621;
        Mon, 27 Aug 2018 00:17:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1535354237; cv=none;
        d=google.com; s=arc-20160816;
        b=0fSLJH9lCtLWNsEsDFpxhaek9SuLHKa92MtPvRFrP37CBCKx4M/KljpKWOLrbJGhNq
         OT/g34Rc+wg6enwCvmYAVBDzB73DKFRERFC8VQPKqtQXaouarT/K59zVJeakz2Xi6A8u
         SeyjhmgLZ+WuE3Zs2WhcWkYIGtwTFyEYuwy+bD/jmZo2CePe4dY5KNkYALF6l64Qh8LB
         XcOkE/CryraygzOKMIJji0wsP8bcnmZ4aiNLOL/rgqEq3C2aX4QGb2ZuYCxC5VhLTNtx
         2myE5KX7xmWl5yKQgz6GCcYB50gf7Be392y70HdTFnMMFBC74khzzJohnkClvh1LD3Z9
         8GaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :mime-version:user-agent:date:message-id:autocrypt:openpgp:from
         :references:to:dkim-signature:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=8cpwYWe1O/hXuWl/Xr9wvANRrK9whZDxbp/5o4kDpFk=;
        b=PB6CvaVOkiym0Ysto0SPniKC5Wn2QYmeW67QrvM9lGzQBPIM0tP1XvwUI81TJ9uTTl
         Ew2aqcaPuAPsr1i7AbQJ8cl24SE3DGhb7GcRibFoRIaH0v1lLd8GjtbuiXO3drbV4KDp
         9Uc5zP9nfd930LNk6BypyhtwBvlrJ5Zrf0ayCH9+WsUB8GOLPzg3/0+yDDkhxizOvFUC
         Je8yew9KmVt3lWlm29R4lBxzrQbI4MII6ejiSLoseaHoWsBkqlffmnH5z8fOwzAvVkQt
         L9oWZQJgETYWV6UUnQnlJUjCLPH8j29VEkMb5hn8rQIiq53ya6pC374+maTIA4luo1gU
         rQlg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=N1uEEj3C;
       dkim=fail header.i=@greensocs.com header.s=mail header.b="ezuOcg/Z";
       dkim=fail header.i=@greensocs.com header.s=mail header.b="ezuOcg/Z";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 27-v6si2787179qvu.77.2018.08.27.00.17.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 27 Aug 2018 00:17:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=N1uEEj3C;
       dkim=fail header.i=@greensocs.com header.s=mail header.b="ezuOcg/Z";
       dkim=fail header.i=@greensocs.com header.s=mail header.b="ezuOcg/Z";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:51751 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fuBm1-0000Ke-38
	for alex.bennee@linaro.org; Mon, 27 Aug 2018 03:17:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33703)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fuBlp-0000KZ-CX
	for qemu-arm@nongnu.org; Mon, 27 Aug 2018 03:17:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fuBll-0007Ps-Ak
	for qemu-arm@nongnu.org; Mon, 27 Aug 2018 03:17:05 -0400
Received: from greensocs.com ([193.104.36.180]:39786)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1fuBlk-0007PG-Rl; Mon, 27 Aug 2018 03:17:01 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id AF749C7AEA;
	Mon, 27 Aug 2018 09:16:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1535354212;
	bh=4r2I3DC/o7kIW+zH1ECrBGYoTgxqE8EWScz4QxwQxtM=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=N1uEEj3CiAIXdGWhtEEMDogUr2MXsTo+/dFhAP9J6GWAu4bXOLGChpJZssNAJcXYB
	Zz9y/T3vwkSJSlm5s1NBjR2Z7ifWOg/IQSDX0qAwmihdAhWwGlfJUoY2r9EEd3Q4qX
	Q9Lxu/L3MtOdvaDid1AOfmNSfNpzvZZmLKIUOnK0=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=ezuOcg/Z;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=ezuOcg/Z
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MXi2SBEj8sub; Mon, 27 Aug 2018 09:16:51 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id 7B759400FEB; Mon, 27 Aug 2018 09:16:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1535354211;
	bh=4r2I3DC/o7kIW+zH1ECrBGYoTgxqE8EWScz4QxwQxtM=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=ezuOcg/Z1gKdN1VAt0JhBMUAnBBWTgF3JXB1RDovpTHTZNt1J4NGZS4CQKHY0ccUV
	NDJIYB4YsZ0y45OfBfsEQxOndHU++Lamwb0m8L+7f/Kdr3QtOWc61gc+WKPEe+Ytun
	pCzDbU/mXkfAwbS0xDWgBJFH7tYq9Q0NEt0F5mpY=
Received: from [192.168.61.102] (LFbn-LYO-1-488-36.w2-7.abo.wanadoo.fr
	[2.7.77.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 2698FC7AEA;
	Mon, 27 Aug 2018 09:16:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1535354211;
	bh=4r2I3DC/o7kIW+zH1ECrBGYoTgxqE8EWScz4QxwQxtM=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=ezuOcg/Z1gKdN1VAt0JhBMUAnBBWTgF3JXB1RDovpTHTZNt1J4NGZS4CQKHY0ccUV
	NDJIYB4YsZ0y45OfBfsEQxOndHU++Lamwb0m8L+7f/Kdr3QtOWc61gc+WKPEe+Ytun
	pCzDbU/mXkfAwbS0xDWgBJFH7tYq9Q0NEt0F5mpY=
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180823103818.31189-1-peter.maydell@linaro.org>
From: Luc Michel <luc.michel@greensocs.com>
Openpgp: preference=signencrypt
Autocrypt: addr=luc.michel@greensocs.com; prefer-encrypt=mutual; keydata=
	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
Message-ID: <0d9483b2-eab3-3361-8d10-bd31bb11e169@greensocs.com>
Date: Mon, 27 Aug 2018 09:16:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20180823103818.31189-1-peter.maydell@linaro.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="hdW4xaa2HNUcyl3Yo8L6EbvSp3oqdDfmk"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: Re: [Qemu-arm] [PATCH v2] hw/intc/arm_gic: Document QEMU interface
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mT8B/RvJVPjC

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--hdW4xaa2HNUcyl3Yo8L6EbvSp3oqdDfmk
Content-Type: multipart/mixed; boundary="P2382f9yOxII7VC3Vvz4zPRMEXmnHD2bs";
 protected-headers="v1"
From: Luc Michel <luc.michel@greensocs.com>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: patches@linaro.org
Message-ID: <0d9483b2-eab3-3361-8d10-bd31bb11e169@greensocs.com>
Subject: Re: [PATCH v2] hw/intc/arm_gic: Document QEMU interface
References: <20180823103818.31189-1-peter.maydell@linaro.org>
In-Reply-To: <20180823103818.31189-1-peter.maydell@linaro.org>

--P2382f9yOxII7VC3Vvz4zPRMEXmnHD2bs
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable



On 8/23/18 12:38 PM, Peter Maydell wrote:
> The GICv2's QEMU interface (sysbus MMIO regions, IRQs,
> etc) is now quite complicated with the addition of the
> virtualization extensions. Add a comment in the header
> file which documents it.
>=20
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> I needed to write this out to figure out what I was
> connecting to what in the a15mpcore object :-)
>=20
> v1->v2 changes: fixed errors in sysbus IRQ and per-cpu GICH
> memory region docs pointed out by Luc.
>=20
>  include/hw/intc/arm_gic.h | 43 +++++++++++++++++++++++++++++++++++++++=

>  1 file changed, 43 insertions(+)
>=20
> diff --git a/include/hw/intc/arm_gic.h b/include/hw/intc/arm_gic.h
> index 42bb535fd45..1af5051ed5d 100644
> --- a/include/hw/intc/arm_gic.h
> +++ b/include/hw/intc/arm_gic.h
> @@ -18,6 +18,49 @@
>   * with this program; if not, see <http://www.gnu.org/licenses/>.
>   */
> =20
> +/*
> + * QEMU interface:
> + *  + QOM property "num-cpu": number of CPUs to support
> + *  + QOM property "num-irq": number of IRQs (including both SPIs and =
PPIs)
> + *  + QOM property "revision": GIC version (1 or 2), or 0 for the 11MP=
Core GIC
> + *  + QOM property "has-security-extensions": set true if the GIC shou=
ld
> + *    implement the security extensions
> + *  + QOM property "has-virtualization-extensions": set true if the GI=
C should
> + *    implement the virtualization extensions
> + *  + unnamed GPIO inputs: (where P is number of PPIs, i.e. num-irq - =
32)
I think here it's "where P is the number of SPIs".

Apart from that:

Reviewed-by: Luc Michel <luc.michel@greensocs.com>

--=20
Luc

> + *    [0..P-1]  SPIs
> + *    [P..P+31] PPIs for CPU 0
> + *    [P+32..P+63] PPIs for CPU 1
> + *    ...
> + *  + sysbus IRQs: (in order; number will vary depending on number of =
cores)
> + *    - IRQ for CPU 0
> + *    - IRQ for CPU 1
> + *      ...
> + *    - FIQ for CPU 0
> + *    - FIQ for CPU 1
> + *      ...
> + *    - VIRQ for CPU 0 (exists even if virt extensions not present)
> + *    - VIRQ for CPU 1 (exists even if virt extensions not present)
> + *      ...
> + *    - VFIQ for CPU 0 (exists even if virt extensions not present)
> + *    - VFIQ for CPU 1 (exists even if virt extensions not present)
> + *      ...
> + *    - maintenance IRQ for CPU i/f 0 (only if virt extensions present=
)
> + *    - maintenance IRQ for CPU i/f 1 (only if virt extensions present=
)
> + *  + sysbus MMIO regions: (in order; numbers will vary depending on
> + *    whether virtualization extensions are present and on number of c=
ores)
> + *    - distributor registers (GICD*)
> + *    - CPU interface for the accessing core (GICC*)
> + *    - virtual interface control registers (GICH*) (only if virt extn=
s present)
> + *    - virtual CPU interface for the accessing core (GICV*) (only if =
virt)
> + *    - CPU 0 CPU interface registers
> + *    - CPU 1 CPU interface registers
> + *      ...
> + *    - CPU 0 virtual interface control registers (only if virt extns =
present)
> + *    - CPU 1 virtual interface control registers (only if virt extns =
present)
> + *      ...
> + */
> +
>  #ifndef HW_ARM_GIC_H
>  #define HW_ARM_GIC_H
> =20
>=20


--P2382f9yOxII7VC3Vvz4zPRMEXmnHD2bs--

--hdW4xaa2HNUcyl3Yo8L6EbvSp3oqdDfmk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEUvSC0Bi15mxw2PT5d8knW3QnTr4FAluDpV0ACgkQd8knW3Qn
Tr5abg/8DvqdBhWgDNK9EOIWiBMnypgdwr0gONeXjjnWbXmVkV5gXdZVdDJajsLX
X4W8Y+gEZ/bKVaFL1Hfw7HlFI8VtB2D7xXJjikIz65N6CExScxVc/E9QslrmmP19
/4jHdzugFIAc+whVdmwO5ijpfyUWa0TviNyJBOPaiZEb0wjnYovpj4B0+If+ULIw
yGJaQcSsuDPcuemo+RjmGRT6fYZ4OlbwbEwXMm0anSYlGHPmjeugZ4bsxPYa0/Ko
XIR7mIWKdEwrO8qvBfoIf4sND5uYwwexcVJmS735zchCnl6VgzKFIXR+O19cuIDB
QZA4Hy6DzlKVpcdeEtjb45V4E2W+w94dzrE87eNtYOdRnisz+31elSWmCcXz/BRJ
RSt9GP2vKgbtTUZLB+1OrVg2cQ83LkR0dE/nmoqw/x1b2YHZkx2X7Z8059gh6ve1
FBTbD3w5cxJwDXM4IGJ5Bh1S/OSk/kR/F2+m0HoVkUOC37WjwASqA7Q8kGj8gYd/
rk0A5NE29qRKX5dHl/9R/ZzD/iP/hv90CuPdKsVf4yN1thXn6WlXlmscQrjNz484
yfu5NX4D/PfURY470BdwY3KmfkE5UfmM/yVoFkpqCVPTSYPGR9ajNNtcu/8rXdS7
94eO4LbWL8fHXqYNZ1GGsPx+JMX8g4H2g5blO6Ibmg+5Je0n81s=
=kzpr
-----END PGP SIGNATURE-----

--hdW4xaa2HNUcyl3Yo8L6EbvSp3oqdDfmk--
