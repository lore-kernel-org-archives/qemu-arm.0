Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp4466802lfm;
        Mon, 13 Apr 2020 19:31:50 -0700 (PDT)
X-Google-Smtp-Source: APiQypJonbZ+ZraUiXqPVz6py8rGbtvi07bUrnO8ZX5akn5uhR10xWByM/ZTy8snemzovx4eVPFO
X-Received: by 2002:a0c:ba2e:: with SMTP id w46mr15939489qvf.97.1586831510789;
        Mon, 13 Apr 2020 19:31:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586831510; cv=none;
        d=google.com; s=arc-20160816;
        b=iJ+O03jD9Z6DczrK6HTGsFpE/XhrbPwViOLlYLlgPsVYsEgXh9/FVp4pGoIMzZVCAA
         ydCTSgezS0RLiwqvV36pvHUWEeNqpWPYhmsRMBKiWZykBCA8QyQmzyGTfYm/iW8lG60Z
         99A86pgoKVm4F7dBQjLCgVmNnJnsUoUMWgripmtqLzHmRwPAHR8IVrraNPUki4xBu6QM
         WWhVpCgr0oFOCmN2zIM8rut1Zdu1mRnMmfRYKU5tdQ3jEaiC30yKjUu3ar28fvpkmG0p
         l6MWSyass/GlGxJ0/Qkckkpf/Ahs1ZToFV3PSosL9b/ydBxhyoYJ1kKb9jtbV6XYDliP
         TnSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=4PYCvyfFWCM9ka2ksajPZ0+YqGnkBizSv/5OOIBMuQQ=;
        b=B4P31cQ6OYmT1echXGMWOzKyW7eHsg2iTmknnUHhNK3JcDLQebFhZRF9Lxa0Aql/2X
         /T8Lx/kgIXcNnXmXRU1vf9OqhJ9CHKXt0wTNyOLNIiD78cc9JXScXmsVImGb4tCc6V/u
         y12+8xhC2GiWJLIC1sbZsE2hRyOPdJxBQPx029erjBbyc0Sr1bjKcrFniKEQgDpTAFqe
         wBACxUkIoqY4M68lYbiT6puFOzZz5ZKadY0Bmt/N+jibJKOkqRHrLZGtL5jvaE/56k2z
         2RFUZiV03YPZ4wu3/DD7DKQK9qFPfKN/YD5C+RJj+6S1mB88dwPz9rqCnThShPuzLoTv
         l4CQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=c02G4tpw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g8si1294914qvl.100.2020.04.13.19.31.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Apr 2020 19:31:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=c02G4tpw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:51708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jOBMc-0001zN-7R
	for alex.bennee@linaro.org; Mon, 13 Apr 2020 22:31:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46595)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1jOBMJ-0001c0-LT
 for qemu-arm@nongnu.org; Mon, 13 Apr 2020 22:31:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1jOBMI-0003Ni-7Y
 for qemu-arm@nongnu.org; Mon, 13 Apr 2020 22:31:31 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:43929 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1jOBMH-0003Ld-SC; Mon, 13 Apr 2020 22:31:30 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 491Twy4ztKz9sV1; Tue, 14 Apr 2020 12:25:10 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1586831426;
 bh=/kHCQs6uMq+5u4/mtGXY7lBRycSbLGC1KTKNOnBA2Y4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=c02G4tpwBKtSX4Cy8dl3mWquRLc7WiCQh5osqLeugliTuijy/MqJw6vfNgSiAPsAB
 H0YZVfk8CA0NZX5GT9p219pJeA47NIauIGJIowvaA560ShRZvHfBEXyj1poiCf1JRv
 eqv3brG/NrRLimiYlJ5uPxblFDSFWPQwtvkelr1A=
Date: Tue, 14 Apr 2020 12:06:34 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH-for-5.1 1/3] target: Remove unnecessary CPU() cast
Message-ID: <20200414020634.GE48061@umbus.fritz.box>
References: <20200412210954.32313-1-f4bug@amsat.org>
 <20200412210954.32313-2-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="65ImJOski3p8EhYV"
Content-Disposition: inline
In-Reply-To: <20200412210954.32313-2-f4bug@amsat.org>
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 BALATON Zoltan <balaton@eik.bme.hu>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>, qemu-block@nongnu.org,
 Paul Durrant <paul@xen.org>, Markus Armbruster <armbru@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Joel Stanley <joel@jms.id.au>, Anthony Perard <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Corey Minyard <minyard@acm.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Peter Chubb <peter.chubb@nicta.com.au>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 John Snow <jsnow@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>, Cornelia Huck <cohuck@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kHKM2b/C1zQA


--65ImJOski3p8EhYV
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 12, 2020 at 11:09:52PM +0200, Philippe Mathieu-Daud=E9 wrote:
> The CPU() macro is defined as:
>=20
>   #define CPU(obj) ((CPUState *)(obj))
>=20
> Remove an unnecessary CPU() cast.
>=20
> Patch created mechanically using spatch with this script:
>=20
>   @@
>   typedef CPUState;
>   CPUState *s;
>   @@
>   -   CPU(s)
>   +   s
>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>

Acked-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  target/ppc/mmu_helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/target/ppc/mmu_helper.c b/target/ppc/mmu_helper.c
> index 86c667b094..8972714775 100644
> --- a/target/ppc/mmu_helper.c
> +++ b/target/ppc/mmu_helper.c
> @@ -1820,7 +1820,7 @@ static inline void do_invalidate_BAT(CPUPPCState *e=
nv, target_ulong BATu,
>      if (((end - base) >> TARGET_PAGE_BITS) > 1024) {
>          /* Flushing 1024 4K pages is slower than a complete flush */
>          LOG_BATS("Flush all BATs\n");
> -        tlb_flush(CPU(cs));
> +        tlb_flush(cs);
>          LOG_BATS("Flush done\n");
>          return;
>      }

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--65ImJOski3p8EhYV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl6VGqoACgkQbDjKyiDZ
s5KKyg/9FKEqC9D+alWv+8iNCU4sWOQEsmLKphUN1iQEQx1mOEnwEWoegLrG9pUK
mwn+RgxzzFhb2w5xatd+CDz2NzGNYfNNjOiraIrEWWKaPwK9Lz3xLw2J9ChxWcTs
BCb9Tpjl2dwIMYFW4GaLevqosEDRE0Z0IoVKGpyrlVnDLmRWX3ajL1g6KeFILh0c
TBWZlu0/WoHUIk8YZQHWtWQinxOoutnQzshdD4vxpX6qQ6ujrIhbyUFObWNJICse
A2pwFIA41B3rTESPKkxMeFoNXiWcEyd0Jk4qZvJRP0EI5TgLwkFFYogCGFYNS+Z7
UgPPvjgfGd/XbKXuf8sXjUcZgxg6M2lu8nbZ/fsRTTZV33Cjf9scAISZpLkH9bJ1
e4Ln3ge1xIUjhnQvsJ86nzHQLUPE9B1c9XHLYPI8xvDRy3Iup1DvZFi2zqZeMxP6
w0BO5X9OXBJLfo9d3O5UhsOe7fPfojFhHSp1PMovJzhRovcs40eWrJbbl6eJ0pA4
AIJeFYhPxdG/FYCdHPaDS6yIuAgrDHI0v/LXv9aQrfs4qa+ImpUosZwIY8CplZDa
HrM1GoVtuK9RcT/hANmrzlOg+dBFmQJ7IgimXNnVxBgMFQywio61NLYFrhJgfMTq
4mgomt1X+/UMWLjTmnBfgGap+QMG9ORP+H5M7RpHrwcnIjJ6vnI=
=dPwq
-----END PGP SIGNATURE-----

--65ImJOski3p8EhYV--
