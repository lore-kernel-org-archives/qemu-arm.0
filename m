Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp3872718lfc;
        Mon, 25 Nov 2019 15:41:49 -0800 (PST)
X-Google-Smtp-Source: APXvYqy6/YJTjtZgxDa6Qrv/Csb7h8SefX4XIA02eiJpguijILvBzhei78XlVQEH/wHqwIAB00hC
X-Received: by 2002:a17:906:7a47:: with SMTP id i7mr39561137ejo.22.1574725309422;
        Mon, 25 Nov 2019 15:41:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1574725309; cv=none;
        d=google.com; s=arc-20160816;
        b=LwyvG9oqFxT7sD/m4FNZdw7sLH+Q5KMC53WoigCxzmcknPm+Bl4GlaASzC/5O4v16t
         bnqwfPRDbOciJr7+3gPLMTE0+mvOAQwUMSpW0LvCIWVJxbt+EHuyMB/4UYHVey8PX4Dg
         NLquf7uRvQUYIegObZ8/JLVfK6LJUb8Y/eTIFpQ7/yZlz6A/sfQsej+CVZ/fYLQZlZwR
         XFbLEssiqS8+wuRc0zNqtgryrCHGMAXXJ4xnwFcRXWDhEDWoLYKlXNomSb9RGrmnh8SV
         rIen1nuFRfYnWlpKX0jEIRX1ZYPd8Ubo6/vwjZFDiv2NuV6IKW0An4VIprb6DqdCJxBe
         NOag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:to
         :from:date:dkim-signature;
        bh=QAdVPPe1tUpa+Ho3e7co7/Kr2+igq7hT0DBz0TmnXkM=;
        b=i9KiBr7RnhYcEaIcwKYnDGVgSoviiS5/XkzMzfpu2jhGU8AwkoTfHwYpwv6H/N+VlC
         96p47DMLFHNoEN43ax4sXHwR1gP3gmYcVla/mTfSbWfaqG8W0k3kaU2Dj5zLP75iVA7j
         qeZ42IQYtBOvSrgCANjwJbedS1BExJgmJkBUQNvzYLCKjA9ijXnw6LbUUm2nxTx1kHTX
         tI/FRsm9uwP8s69/K6z91+niLJWZQPfQcIea/uppORkav+1Yv8C0f9bgylRiFywEl3Pu
         CaD98EFuIWrE53cOCiF8XowN0W0CFppI16O9uFqZ7N2oEEP/tPUnNYsmX35nv72BOMRn
         BoKQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=ojOOHrrE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c25si5824871eja.24.2019.11.25.15.41.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Nov 2019 15:41:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=ojOOHrrE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:49154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iZNzI-0007MO-5D
	for alex.bennee@linaro.org; Mon, 25 Nov 2019 18:41:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48755)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1iZNz8-0007MD-MC
 for qemu-arm@nongnu.org; Mon, 25 Nov 2019 18:41:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1iZNz6-0002Is-Up
 for qemu-arm@nongnu.org; Mon, 25 Nov 2019 18:41:38 -0500
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:60045 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1iZNz5-0002Gr-Mv; Mon, 25 Nov 2019 18:41:36 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 47MNpb3qMzz9sPV; Tue, 26 Nov 2019 10:41:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1574725287;
 bh=Owj2sPwgBBXpnX55ffiLjsTXa1GOZ/cyCYzT8o8kHcg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ojOOHrrE+7uHiuB7Rkkz3I34hvlYEj4Zo8NP48CAoyPQNJWtaxMzLwc/Q+qhaDk6V
 1jlAgV+A/McIEyq1LYo5ttCcQHLvOaj5vD8TrS46DoeZWl8jv2zLgbJSkBvvImChQM
 r6Q/Lnsg2TPKZM9a7wEzBmmrfyYTDCP9Npd07Kd4=
Date: Tue, 26 Nov 2019 10:13:27 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: pannengyuan@huawei.com
Subject: Re: [PATCH V2] ppc/spapr_events: fix potential NULL pointer
 dereference in rtas_event_log_dequeue
Message-ID: <20191125231327.GJ5582@umbus.fritz.box>
References: <1574685291-38176-1-git-send-email-pannengyuan@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="r5zNLCKCFspl+eMg"
Content-Disposition: inline
In-Reply-To: <1574685291-38176-1-git-send-email-pannengyuan@huawei.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2401:3900:2:1::2
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: kuhn.chenqun@huawei.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 kenny.zhangjun@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rJMlFUhbmMuc


--r5zNLCKCFspl+eMg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 25, 2019 at 08:34:51PM +0800, pannengyuan@huawei.com wrote:
> From: PanNengyuan <pannengyuan@huawei.com>
>=20
> This fixes coverity issues 68911917:
>         360
>     CID 68911917: (NULL_RETURNS)
>         361. dereference: Dereferencing "source", which is known to be
>              "NULL".
>         361        if (source->mask & event_mask) {
>         362            break;
>         363        }
>=20
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: PanNengyuan <pannengyuan@huawei.com>

Applied to ppc-for-4.2, thanks.

> ---
>  hw/ppc/spapr_events.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/hw/ppc/spapr_events.c b/hw/ppc/spapr_events.c
> index 0e4c195..e355e00 100644
> --- a/hw/ppc/spapr_events.c
> +++ b/hw/ppc/spapr_events.c
> @@ -358,6 +358,7 @@ static SpaprEventLogEntry *rtas_event_log_dequeue(Spa=
prMachineState *spapr,
>              rtas_event_log_to_source(spapr,
>                                       spapr_event_log_entry_type(entry));
> =20
> +        g_assert(source);
>          if (source->mask & event_mask) {
>              break;
>          }

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--r5zNLCKCFspl+eMg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl3cYBcACgkQbDjKyiDZ
s5JeAg//WG/Xk9QxNIkg5FHg1LKa40JcA4SJ+3E5IUomubJD9I+6KVeho0ercejC
iv0fcXgbUsb7uChE9eHE2WYwwIg9OaA34r+jlON5lpiQ7MGmf5qVmiZjJK/cZIRu
jnn9XWRV3reQf7y/dWVvR7ZStFACXhH77jUkfOaM+MBICVninWaI8VDcmNtdJK6C
eE0fUK/9PHizZVjCY232iwkxVGoE0YmC/+AlW/CwILPrT2IPYwKv568HpsynJtGm
DuakN7apdHnl55ay+gTaObunb1zlXJOM859rISudq0iCdZapF30xWDeEJo+jz6Za
uHT2PYBoO660r7bG1BD62ZIWC61Xq34jym2EYua4r5M5Ddnlspo1H9e8AMn04Lll
/ChXyF8IH1Ql1uhnSyRWG8V5Bk0nXQircA4BVm1895f+9F0v0LwxIlr6D3gHujf1
aZ3naU8ilk3ujxDkrlvF+T3msOqSBJ69NMPDSvLh3FTFTzFZz669Kdwtp4qi+jGa
oBNeZJEbLiPTAW3wGQDzXmg2jo+CxJfr79Ty7/eiprNq7CQOPRwAwKaab7gw7sDm
w4hXObEfMHs5e6i3BNWcnBRNw8air9ilWgRfNd7YExgHWAXep9UwCG+Bl4hcSNb4
QX3w/7rS9nd+SuzYo2eVxTwAr3lKKMpYi1AC/8l85wXxTj4fgns=
=/k7R
-----END PGP SIGNATURE-----

--r5zNLCKCFspl+eMg--
