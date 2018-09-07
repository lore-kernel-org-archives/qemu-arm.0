Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp1405101wrd;
        Fri, 7 Sep 2018 00:46:56 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdYOZhJk32fSnON7zF/LBvW99oVtXK9b3dG8YLT0u9gPxzlI2fjBblfCF2l+Nndmgij6UbOn
X-Received: by 2002:a0c:c38e:: with SMTP id o14-v6mr4881817qvi.36.1536306416240;
        Fri, 07 Sep 2018 00:46:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1536306416; cv=none;
        d=google.com; s=arc-20160816;
        b=C4aTz3F4aTDFipRl2AVYXRr50h/MNd7rO0//FSzSwbv+5BjVwQitCZDf47mdEwR3pC
         wfhq5CR97c6V/TlZYErQgxtCZD33tA5qD/h7wXJZWYyRehRBd3qtNtAzcv3U5fwnupj3
         bomV7iT2cCN92YCmy/ti4/AJ513n4kgnt4BhXtgnuzJypmhpTGjXk0BnhD+t8HL+5Op0
         0RbNQTvc6BdujEO46QKlAaywp87SsQhoqGlXeEKoEQqwxKG3IRxufL0YGvFi1TDnI7lp
         3IGPSnHYsK9+1zKh5NSjHDTDgi0mp0kXsw9gNJ/rmERTGdpRzkTB/mvumSPhkHSoKiQV
         Hgtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :mime-version:user-agent:date:message-id:autocrypt:openpgp:from
         :references:to:dkim-signature;
        bh=Sog8RGM7EMPXKtmZcmFCfk0j1tRnRr64P8OsGpqnRCo=;
        b=IBO43qt5OiHsBRNZl4vZNZxrJ1sa2mOvidVSsIwy22xtpNjnMD245YHJ+CXTBIE+Zo
         M9uAEWdn1OM3f3OelZIyqfwd1uZH0TIhpSdxWB4lPFtsEM57cVenbnEVcFev5c55bH2k
         Uyv9UQ5SgQQOjh75HXGuGwT5MpK7C41m0vxrHw9uD7vqVYnrqA4JrtP64DjCTSmXoqRf
         kF1Q7izGzXqaZGk64KHeuk+SaYQbnYlWaB7uemeX2p+mCf0KFt5MeO6Z4RtASaOt/B3m
         +Hh1s3miGwBGL5eu2a3hrjgYs03Lt9kstQTzSqH7YHLLzxDUWAfxBYTCXbCHRBrGBATN
         gxbg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@antfield.fr header.s=mail header.b=mku47U9k;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=antfield.fr
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i43-v6si5675261qtf.22.2018.09.07.00.46.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 07 Sep 2018 00:46:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@antfield.fr header.s=mail header.b=mku47U9k;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=antfield.fr
Received: from localhost ([::1]:37211 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fyBTj-0005B4-QG
	for alex.bennee@linaro.org; Fri, 07 Sep 2018 03:46:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51767)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@antfield.fr>) id 1fyBTK-00059m-Os
	for qemu-devel@nongnu.org; Fri, 07 Sep 2018 03:46:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@antfield.fr>) id 1fyBTJ-0003Nc-L8
	for qemu-devel@nongnu.org; Fri, 07 Sep 2018 03:46:30 -0400
Received: from bee.antfield.fr ([188.165.75.195]:34438)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <luc.michel@antfield.fr>)
	id 1fyBTE-0003C1-PO; Fri, 07 Sep 2018 03:46:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=antfield.fr; s=mail;
	t=1536306382; bh=bJ+ld/TrAF7p/WCn5cWFgMc+xIqO8LcZIoEAnkM0YtY=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
	b=mku47U9kz6W02w657yqg+4qE/nrFUr1b1v0URAf7qXifou9V+MFWegq6d0HiKbANQ
	DWKhENzwQAAqT+rkIP5dG/pAsVqesbwqD4ECsk0rEPv05lQVU6c+khvnvt9qVCCodY
	qzRBWAPYNcuOlY9sqg3iFbDgAUYEiHt2RlOZPHRg=
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180824161819.11085-1-peter.maydell@linaro.org>
From: Luc Michel <luc.michel@antfield.fr>
Openpgp: preference=signencrypt
Autocrypt: addr=luc.michel@antfield.fr; prefer-encrypt=mutual; keydata=
	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
Message-ID: <07ec9f46-7e11-cd28-2afa-b429f5b46bfc@antfield.fr>
Date: Fri, 7 Sep 2018 09:46:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20180824161819.11085-1-peter.maydell@linaro.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="7AdPgvmHAU0iaKS6eTvqPFazlG9amWJIS"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 188.165.75.195
X-Content-Filtered-By: Mailman/MimeDel 2.1.21
Subject: Re: [Qemu-devel] [PATCH] hw/intc/arm_gic: Drop GIC_BASE_IRQ macro
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
Cc: patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +K3G3PcGILXc

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--7AdPgvmHAU0iaKS6eTvqPFazlG9amWJIS
From: Luc Michel <luc.michel@antfield.fr>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: patches@linaro.org
Message-ID: <07ec9f46-7e11-cd28-2afa-b429f5b46bfc@antfield.fr>
Subject: Re: [Qemu-devel] [PATCH] hw/intc/arm_gic: Drop GIC_BASE_IRQ macro
References: <20180824161819.11085-1-peter.maydell@linaro.org>
In-Reply-To: <20180824161819.11085-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 8/24/18 6:18 PM, Peter Maydell wrote:
> The GIC_BASE_IRQ macro is a leftover from when we shared code
> between the GICv2 and the v7M NVIC. Since the NVIC is now
> split off, GIC_BASE_IRQ is always 0, and we can just delete it.
>=20
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Luc Michel <luc.michel@greensocs.com>

> ---
>  hw/intc/gic_internal.h   |  2 --
>  hw/intc/arm_gic.c        | 31 ++++++++++++++-----------------
>  hw/intc/arm_gic_common.c |  1 -
>  3 files changed, 14 insertions(+), 20 deletions(-)
>=20
> diff --git a/hw/intc/gic_internal.h b/hw/intc/gic_internal.h
> index 45c2af0bf59..8d29b40ca10 100644
> --- a/hw/intc/gic_internal.h
> +++ b/hw/intc/gic_internal.h
> @@ -26,8 +26,6 @@
> =20
>  #define ALL_CPU_MASK ((unsigned)(((1 << GIC_NCPU) - 1)))
> =20
> -#define GIC_BASE_IRQ 0
> -
>  #define GIC_DIST_SET_ENABLED(irq, cm) (s->irq_state[irq].enabled |=3D =
(cm))
>  #define GIC_DIST_CLEAR_ENABLED(irq, cm) (s->irq_state[irq].enabled &=3D=
 ~(cm))
>  #define GIC_DIST_TEST_ENABLED(irq, cm) ((s->irq_state[irq].enabled & (=
cm)) !=3D 0)
> diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
> index 542b4b93eab..b3ac2d11fc5 100644
> --- a/hw/intc/arm_gic.c
> +++ b/hw/intc/arm_gic.c
> @@ -955,7 +955,7 @@ static uint32_t gic_dist_readb(void *opaque, hwaddr=
 offset, MemTxAttrs attrs)
>              res =3D 0;
>              if (!(s->security_extn && !attrs.secure) && gic_has_groups=
(s)) {
>                  /* Every byte offset holds 8 group status bits */
> -                irq =3D (offset - 0x080) * 8 + GIC_BASE_IRQ;
> +                irq =3D (offset - 0x080) * 8;
>                  if (irq >=3D s->num_irq) {
>                      goto bad_reg;
>                  }
> @@ -974,7 +974,6 @@ static uint32_t gic_dist_readb(void *opaque, hwaddr=
 offset, MemTxAttrs attrs)
>              irq =3D (offset - 0x100) * 8;
>          else
>              irq =3D (offset - 0x180) * 8;
> -        irq +=3D GIC_BASE_IRQ;
>          if (irq >=3D s->num_irq)
>              goto bad_reg;
>          res =3D 0;
> @@ -994,7 +993,6 @@ static uint32_t gic_dist_readb(void *opaque, hwaddr=
 offset, MemTxAttrs attrs)
>              irq =3D (offset - 0x200) * 8;
>          else
>              irq =3D (offset - 0x280) * 8;
> -        irq +=3D GIC_BASE_IRQ;
>          if (irq >=3D s->num_irq)
>              goto bad_reg;
>          res =3D 0;
> @@ -1019,7 +1017,6 @@ static uint32_t gic_dist_readb(void *opaque, hwad=
dr offset, MemTxAttrs attrs)
>              goto bad_reg;
>          }
> =20
> -        irq +=3D GIC_BASE_IRQ;
>          if (irq >=3D s->num_irq)
>              goto bad_reg;
>          res =3D 0;
> @@ -1036,7 +1033,7 @@ static uint32_t gic_dist_readb(void *opaque, hwad=
dr offset, MemTxAttrs attrs)
>          }
>      } else if (offset < 0x800) {
>          /* Interrupt Priority.  */
> -        irq =3D (offset - 0x400) + GIC_BASE_IRQ;
> +        irq =3D (offset - 0x400);
>          if (irq >=3D s->num_irq)
>              goto bad_reg;
>          res =3D gic_dist_get_priority(s, cpu, irq, attrs);
> @@ -1046,7 +1043,7 @@ static uint32_t gic_dist_readb(void *opaque, hwad=
dr offset, MemTxAttrs attrs)
>              /* For uniprocessor GICs these RAZ/WI */
>              res =3D 0;
>          } else {
> -            irq =3D (offset - 0x800) + GIC_BASE_IRQ;
> +            irq =3D (offset - 0x800);
>              if (irq >=3D s->num_irq) {
>                  goto bad_reg;
>              }
> @@ -1060,7 +1057,7 @@ static uint32_t gic_dist_readb(void *opaque, hwad=
dr offset, MemTxAttrs attrs)
>          }
>      } else if (offset < 0xf00) {
>          /* Interrupt Configuration.  */
> -        irq =3D (offset - 0xc00) * 4 + GIC_BASE_IRQ;
> +        irq =3D (offset - 0xc00) * 4;
>          if (irq >=3D s->num_irq)
>              goto bad_reg;
>          res =3D 0;
> @@ -1183,7 +1180,7 @@ static void gic_dist_writeb(void *opaque, hwaddr =
offset,
>               */
>              if (!(s->security_extn && !attrs.secure) && gic_has_groups=
(s)) {
>                  /* Every byte offset holds 8 group status bits */
> -                irq =3D (offset - 0x80) * 8 + GIC_BASE_IRQ;
> +                irq =3D (offset - 0x80) * 8;
>                  if (irq >=3D s->num_irq) {
>                      goto bad_reg;
>                  }
> @@ -1204,7 +1201,7 @@ static void gic_dist_writeb(void *opaque, hwaddr =
offset,
>          }
>      } else if (offset < 0x180) {
>          /* Interrupt Set Enable.  */
> -        irq =3D (offset - 0x100) * 8 + GIC_BASE_IRQ;
> +        irq =3D (offset - 0x100) * 8;
>          if (irq >=3D s->num_irq)
>              goto bad_reg;
>          if (irq < GIC_NR_SGIS) {
> @@ -1239,7 +1236,7 @@ static void gic_dist_writeb(void *opaque, hwaddr =
offset,
>          }
>      } else if (offset < 0x200) {
>          /* Interrupt Clear Enable.  */
> -        irq =3D (offset - 0x180) * 8 + GIC_BASE_IRQ;
> +        irq =3D (offset - 0x180) * 8;
>          if (irq >=3D s->num_irq)
>              goto bad_reg;
>          if (irq < GIC_NR_SGIS) {
> @@ -1264,7 +1261,7 @@ static void gic_dist_writeb(void *opaque, hwaddr =
offset,
>          }
>      } else if (offset < 0x280) {
>          /* Interrupt Set Pending.  */
> -        irq =3D (offset - 0x200) * 8 + GIC_BASE_IRQ;
> +        irq =3D (offset - 0x200) * 8;
>          if (irq >=3D s->num_irq)
>              goto bad_reg;
>          if (irq < GIC_NR_SGIS) {
> @@ -1283,7 +1280,7 @@ static void gic_dist_writeb(void *opaque, hwaddr =
offset,
>          }
>      } else if (offset < 0x300) {
>          /* Interrupt Clear Pending.  */
> -        irq =3D (offset - 0x280) * 8 + GIC_BASE_IRQ;
> +        irq =3D (offset - 0x280) * 8;
>          if (irq >=3D s->num_irq)
>              goto bad_reg;
>          if (irq < GIC_NR_SGIS) {
> @@ -1309,7 +1306,7 @@ static void gic_dist_writeb(void *opaque, hwaddr =
offset,
>              goto bad_reg;
>          }
> =20
> -        irq =3D (offset - 0x300) * 8 + GIC_BASE_IRQ;
> +        irq =3D (offset - 0x300) * 8;
>          if (irq >=3D s->num_irq) {
>              goto bad_reg;
>          }
> @@ -1333,7 +1330,7 @@ static void gic_dist_writeb(void *opaque, hwaddr =
offset,
>              goto bad_reg;
>          }
> =20
> -        irq =3D (offset - 0x380) * 8 + GIC_BASE_IRQ;
> +        irq =3D (offset - 0x380) * 8;
>          if (irq >=3D s->num_irq) {
>              goto bad_reg;
>          }
> @@ -1353,7 +1350,7 @@ static void gic_dist_writeb(void *opaque, hwaddr =
offset,
>          }
>      } else if (offset < 0x800) {
>          /* Interrupt Priority.  */
> -        irq =3D (offset - 0x400) + GIC_BASE_IRQ;
> +        irq =3D (offset - 0x400);
>          if (irq >=3D s->num_irq)
>              goto bad_reg;
>          gic_dist_set_priority(s, cpu, irq, value, attrs);
> @@ -1362,7 +1359,7 @@ static void gic_dist_writeb(void *opaque, hwaddr =
offset,
>           * annoying exception of the 11MPCore's GIC.
>           */
>          if (s->num_cpu !=3D 1 || s->revision =3D=3D REV_11MPCORE) {
> -            irq =3D (offset - 0x800) + GIC_BASE_IRQ;
> +            irq =3D (offset - 0x800);
>              if (irq >=3D s->num_irq) {
>                  goto bad_reg;
>              }
> @@ -1375,7 +1372,7 @@ static void gic_dist_writeb(void *opaque, hwaddr =
offset,
>          }
>      } else if (offset < 0xf00) {
>          /* Interrupt Configuration.  */
> -        irq =3D (offset - 0xc00) * 4 + GIC_BASE_IRQ;
> +        irq =3D (offset - 0xc00) * 4;
>          if (irq >=3D s->num_irq)
>              goto bad_reg;
>          if (irq < GIC_NR_SGIS)
> diff --git a/hw/intc/arm_gic_common.c b/hw/intc/arm_gic_common.c
> index 547dc41185e..57569a4e590 100644
> --- a/hw/intc/arm_gic_common.c
> +++ b/hw/intc/arm_gic_common.c
> @@ -191,7 +191,6 @@ static void arm_gic_common_realize(DeviceState *dev=
, Error **errp)
>                     s->num_cpu, GIC_NCPU);
>          return;
>      }
> -    s->num_irq +=3D GIC_BASE_IRQ;
>      if (s->num_irq > GIC_MAXIRQ) {
>          error_setg(errp,
>                     "requested %u interrupt lines exceeds GIC maximum %=
d",
>=20


--7AdPgvmHAU0iaKS6eTvqPFazlG9amWJIS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEUvSC0Bi15mxw2PT5d8knW3QnTr4FAluSLMwACgkQd8knW3Qn
Tr5R8RAAnulpmeSiI0zf2gnWz0GvmgixHFTvMnxQvPXxSJG2SRZ9vluWXv/JcwCP
5PzJX5qiaeh7ncpzH/lBt9izyqlAPbca9Clu76vULzt75k4XcdA6fQR6Vk9S/3Pq
aJWRKepuULf8vIFVCC7O/idoFrhdIbxg5sg2RmC8m6WE+qood83IQ6bXopzxjx8T
3WlVXox15iv2vBlwO4u6Bfuw45QfcgEXxWN7SmF6i7ZjIfHnDG7YN7N0D9jrAj35
NWglFweFTlT3/caVtbyear4aQspfzyBPsB8ZRLMF3egLVzv8UycQBMtsUJGNStWh
HkjdzvzqlL/o8yUY0XZVThzunLmAY2oL1kGbVAbM/Ed12j3efDW+JcsJrWiVKH8B
Jsu4BPsV32qlE41lWttMttXuuI1QtWCxNznCupQOfsGweoFeefQRpIk/ZhibmwbR
DpbRpBEhSFv39x3dr+B+PFb+LO3Y+ACmxY8gYt9E83AEuEphOnO7cNp62AG068bL
sWCryLhHls0C41y5rcOfLlrh7dBN2a1W0ceZ+ghYPPwyPlw0MxNXlgJX3xCGGVGP
+J0xZCY71Pe9Eljpa9P/nJTiGsGSGIrN+gFWZTm3XQESTp5haLta7wHT5NzBO8eJ
fCKSq56VqUWqI233rsJ33/ia/hikPJIdqLWRgc7KTGSV50iDCn8=
=G5AK
-----END PGP SIGNATURE-----

--7AdPgvmHAU0iaKS6eTvqPFazlG9amWJIS--
