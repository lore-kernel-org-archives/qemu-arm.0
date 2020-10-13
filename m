Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp1493743lfa;
        Mon, 12 Oct 2020 17:48:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzfa5crbECJ3FlsE8nqr9yWFlhIi58gZsN4bdf/ilrCV0hW2o/zHiFMEOH1oJsLhhGJONgj
X-Received: by 2002:a5b:302:: with SMTP id j2mr38276116ybp.50.1602550136916;
        Mon, 12 Oct 2020 17:48:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602550136; cv=none;
        d=google.com; s=arc-20160816;
        b=mF5aXdtEkWa2dtah965ZmMFjXkNXLch/DG7Kv3v1kZzkgx0lH8U2jdcYga95Nu8265
         cKcEy93sFWccjtOVI6FUvBBvt06BhMlea+mduU14OVzCOENAtqK1NFefVuaoeaPaqQil
         qzUnFBPCaA8m1o2+QaduuvK+EcqF2yvSVr9dAHisE0OyXOcrIdKhLTYnoqM9JViei8fT
         VLZlj4yctCmzOtFroofIdCci6rxzv6AqTHGzKvEz03VYVe23Yrusdhbf/upyFILayYQW
         FQ3WxFRQ+AOqCwZdRJaot0rWb4olFWYUyYu75cohYLfI1FNhm5+DyNp+cN/goAdIj08A
         asvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=zFB82YZFtE+AiMImdErB5kXqfAseax7cS+3pAx7DLvM=;
        b=AUN5Um8aZFwRAP10bA4Z8YqheFCe2dzC7MLP7QutWT64m4fZ/aqU/a8zjT0tb4U4NP
         bc969E5ZHHIKZq5/Wj4kQqbwWE9t0xDY0vYWqvaVpm1BN8J4Eaqwz8bPHsG9cRNrSgnD
         qyYGNDKyJjTKfUc4i7IF/U2WIJdM/f2Anyk9aGge0sQzopwthlwHhPMbOy0VolxOLE6m
         XZlF+DFzdqW+k4jMkpqAyrNq+11LB5Oxqm5Ktsc+ZI/MYE5tztgyVheedg9WyTHmaIPe
         Act6hdv6X0L98K9Olf9Kt90sHPvxq05jhdQOZ+fla57c4A+x1cs6gdqL8vQIeUhUIDpA
         vkEQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=Zfh5tPd5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o19si6635039ybg.370.2020.10.12.17.48.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 Oct 2020 17:48:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=Zfh5tPd5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kS8Uq-0005Rb-AM
	for alex.bennee@linaro.org; Mon, 12 Oct 2020 20:48:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kS8RN-00023V-Ix; Mon, 12 Oct 2020 20:45:21 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:54461 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kS8RI-0006nD-So; Mon, 12 Oct 2020 20:45:20 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4C9GzQ2kfkz9sTt; Tue, 13 Oct 2020 11:45:06 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1602549906;
 bh=6z03D1ZV3p2wtWtAQ8HdiMejCmKYM8pplIFaWXlD8hg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Zfh5tPd5hMeq64adb90DDfNzMuDGuOVRs8Ifdlc8DR3LjBQWAgTUHf/Po97ZEGu8W
 ndDXL0gxBLQKs0mJIjAQnOr9ekbU86UYMtLsuFFJ3SbC1eFrK22hbZxekU7OFKMygG
 VUdBDaOmeqhjL14Ffsxb4Fm/c008JgvhPTizANX8=
Date: Tue, 13 Oct 2020 11:42:29 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH 2/5] hw/pci-host: Use the PCI_BUILD_BDF() macro from
 'hw/pci/pci.h'
Message-ID: <20201013004229.GG71119@yekko.fritz.box>
References: <20201012124506.3406909-1-philmd@redhat.com>
 <20201012124506.3406909-3-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="WkfBGePaEyrk4zXB"
Content-Disposition: inline
In-Reply-To: <20201012124506.3406909-3-philmd@redhat.com>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Paul Durrant <paul@xen.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Huacai Chen <chenhc@lemote.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, qemu-trivial@nongnu.org,
 Helge Deller <deller@gmx.de>, "Michael S. Tsirkin" <mst@redhat.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-arm@nongnu.org,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 Richard Henderson <rth@twiddle.net>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2HeuR4CGVdF2


--WkfBGePaEyrk4zXB
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2020 at 02:45:03PM +0200, Philippe Mathieu-Daud=E9 wrote:
> From: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
>=20
> We already have a generic PCI_BUILD_BDF() macro in "hw/pci/pci.h"
> to pack these values, use it.
>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>

pnv part

Acked-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  hw/pci-host/bonito.c   | 3 +--
>  hw/pci-host/pnv_phb4.c | 2 +-
>  2 files changed, 2 insertions(+), 3 deletions(-)
>=20
> diff --git a/hw/pci-host/bonito.c b/hw/pci-host/bonito.c
> index abb3ee86769..b05295639a6 100644
> --- a/hw/pci-host/bonito.c
> +++ b/hw/pci-host/bonito.c
> @@ -196,8 +196,7 @@ FIELD(BONGENCFG, PCIQUEUE,      12, 1)
>  #define PCI_IDSEL_VIA686B          (1 << PCI_IDSEL_VIA686B_BIT)
> =20
>  #define PCI_ADDR(busno , devno , funno , regno)  \
> -    ((((busno) << 8) & 0xff00) + (((devno) << 3) & 0xf8) + \
> -    (((funno) & 0x7) << 8) + (regno))
> +    ((PCI_BUILD_BDF(busno, PCI_DEVFN(devno , funno)) << 8) + (regno))
> =20
>  typedef struct BonitoState BonitoState;
> =20
> diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
> index 03daf40a237..6328e985f81 100644
> --- a/hw/pci-host/pnv_phb4.c
> +++ b/hw/pci-host/pnv_phb4.c
> @@ -889,7 +889,7 @@ static bool pnv_phb4_resolve_pe(PnvPhb4DMASpace *ds)
>      /* Read RTE */
>      bus_num =3D pci_bus_num(ds->bus);
>      addr =3D rtt & PHB_RTT_BASE_ADDRESS_MASK;
> -    addr +=3D 2 * ((bus_num << 8) | ds->devfn);
> +    addr +=3D 2 * PCI_BUILD_BDF(bus_num, ds->devfn);
>      if (dma_memory_read(&address_space_memory, addr, &rte, sizeof(rte)))=
 {
>          phb_error(ds->phb, "Failed to read RTT entry at 0x%"PRIx64, addr=
);
>          /* Set error bits ? fence ? ... */

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--WkfBGePaEyrk4zXB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl+E9/UACgkQbDjKyiDZ
s5Ir4RAAgIeuP6joYj5FhZqzV4VbZ4t/QTHS4dXl1LknvyV37IXxicFsUz2A5aIj
PFrJU+tBknpj/rFbZIw5dWCK1N2kt2FM0fR9pIHzgOlH8Nv4LUawy4Fq4LREQGSV
LLS5OAEQ+SiphKfeMjYeokeznwVQYKIPGGY2lFk/DPQrHjYOx2Ln6sS3FcAvKO/4
5H+5b6uWMw9X4quka9o8p56m3/oBUYL3Yoy5wlZO8X8gniZ0GfV9DfqH3otegrZu
/1mEbsGK0hgILQrKi4mcND7aPFF9ijcGuj9HkS9xz9emXb2y9cXSSmHVr3lFmCsc
iyXWwqnehxrZn/3mAYmaISt9ACZENDaZ5zHTSvmXrEhz8RBsy0eiqD7i852Y86zZ
Sw9OuC135HwBDpvqVR2duwhORJt1+OVLFtJjijRImcWZQXiKIsmORRoWhNxRRCjE
pLsba7IztCdSsn7NMAfJCTZmaaPCq3ckqxj5C8zFOrJrV5P47lPZ+/v13iCZ7P4b
RZ5QQ35Hf9H8udCCu2cfij/0h9i+00BJO2o7az4htlCG2N3t5b0Fh6RTFWcTHGCe
WL9V/O16r+GmQ3P3wWCgMejlQ7/E37B3C/RPCCjkD8eNhz8sMc9m4ZvuIk7/Vovi
72S/ctPCd/MMjoRxjWSRehdhjrvUzRAzEaHlK2+NMCY6mJOLsqk=
=ZKQ5
-----END PGP SIGNATURE-----

--WkfBGePaEyrk4zXB--
