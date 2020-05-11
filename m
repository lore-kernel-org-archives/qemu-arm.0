Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp2226286lfb;
        Sun, 10 May 2020 18:18:00 -0700 (PDT)
X-Google-Smtp-Source: APiQypKpf2GCC0C3uV0q3oiVJ+wobRKBSCXqwjuoprXGUlLWPGuFhfnbgDoARlv20QDj8yC/r9UO
X-Received: by 2002:a63:c109:: with SMTP id w9mr12284033pgf.114.1589159880708;
        Sun, 10 May 2020 18:18:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589159880; cv=none;
        d=google.com; s=arc-20160816;
        b=quywy4ui52jRtQXJWRpHGWiEZGkVaZnrLgS7sPxxCB1AuQJfbv3Tl8gK1IqXPcx6Ow
         fRkSE3vgBF+PmRV/leh1RBZqt+hj75NcPdBxcbbPhVsOL6acookpOIDHODJgfEp8AmYD
         dzwSWJ7naIg1GvDhGlaVv5okE2oxmSTlg5d9J6yzxAehxvO2Dht7JhLCan+avggHAqUB
         AIgX58qYjKhL78RMSPdJvlI6dGqcaOBvW8umfn34xYUu4hcckn5AmERsMcoajl18Z/up
         hJPvcKoZGz1xJtkSHODqdmkr/yjRghPnHV/+0Ux7lO/A/FH/pUMn+mgjBqtERRY5H9Ot
         UkmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=2m8T4IMy+1yHeGOEdvfd65ULug7dHYwtEvHQRQG+M0E=;
        b=ZWzDi2ykYHj8QmDuA3RfJHlpy04jcUiVdn0WLnHerTEx/CCnbT4fTd7UtAYOdzg+Yw
         IVoLnREgVUOYezEufoyqMA5nXTkPM1mINOzrDFqKElI/+2RjbTcgrQjtL5onM5XvQrEY
         Rz53PdArXB9uRZxFF8PHiFNUPh4ccOD70ZMN/qOSy3iKP9TuSbfxQFWT8gRb3Kc+UcVU
         YkCyEMe+r0uU1phwhSGZ4SLUHXreZOHgD+Xm7gzEVcI10W/54atRiWTiYPNocPK46l9l
         zCX2i0Cp/vsFu6SJgYOag68Pl/yr9MZi8SvFWWfjHXrt1QJyNBICA3xQyLcJJLVIBA7z
         t3Hg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gibson.dropbear.id.au header.s=201602 header.b=CuDtRFTy;
       spf=pass (google.com: domain of dgibson@ozlabs.org designates 203.11.71.1 as permitted sender) smtp.mailfrom=dgibson@ozlabs.org
Return-Path: <dgibson@ozlabs.org>
Received: from ozlabs.org (ozlabs.org. [203.11.71.1])
        by mx.google.com with ESMTPS id r23si1518851pls.378.2020.05.10.18.17.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2020 18:17:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of dgibson@ozlabs.org designates 203.11.71.1 as permitted sender) client-ip=203.11.71.1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gibson.dropbear.id.au header.s=201602 header.b=CuDtRFTy;
       spf=pass (google.com: domain of dgibson@ozlabs.org designates 203.11.71.1 as permitted sender) smtp.mailfrom=dgibson@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1007)
	id 49L32n5cn2z9sSF; Mon, 11 May 2020 11:17:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1589159873;
	bh=+IrjQfg3GKjaOpivn8ZKEZOB3swFULWWJ/xB7rXODPo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CuDtRFTySDYES1kYEEZAurGCWHf6U6SF0Z1y60IU0cp7kHVNB7uXRONBDFxJ0S8BF
	 QdlPgXyxjMDMCc4u0ozIgXRJ5FBp0rteKVaLpVX+wc7jGhOUD1Y23ESGmJGAr50pNQ
	 Eo/iWWn6O3RX43DOXV5MF4jJ9OeU3z7wa8PP473g=
Date: Mon, 11 May 2020 11:15:27 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Max Filippov <jcmvbkbc@gmail.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Stafford Horne <shorne@gmail.com>,
	Cornelia Huck <cohuck@redhat.com>,
	Roman Bolshakov <r.bolshakov@yadro.com>,
	Sagar Karandikar <sagark@eecs.berkeley.edu>,
	Eduardo Habkost <ehabkost@redhat.com>, qemu-s390x@nongnu.org,
	Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
	Marek Vasut <marex@denx.de>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-riscv@nongnu.org,
	Aurelien Jarno <aurelien@aurel32.net>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Chris Wulff <crwulff@gmail.com>,
	Richard Henderson <rth@twiddle.net>,
	David Hildenbrand <david@redhat.com>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH 05/11] target/ppc: Restrict PPCVirtualHypervisorClass to
 system-mode
Message-ID: <20200511011527.GC2183@umbus.fritz.box>
References: <20200509130910.26335-1-f4bug@amsat.org>
 <20200509130910.26335-6-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="RIYY1s2vRbPFwWeW"
Content-Disposition: inline
In-Reply-To: <20200509130910.26335-6-f4bug@amsat.org>
X-TUID: WNZfNNBtkSak


--RIYY1s2vRbPFwWeW
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 09, 2020 at 03:09:04PM +0200, Philippe Mathieu-Daud=E9 wrote:
> The code related to PPC Virtual Hypervisor is pointless in user-mode.
>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>

Acked-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  target/ppc/cpu.h                |  4 ++--
>  target/ppc/kvm_ppc.h            | 22 +++++++++++-----------
>  target/ppc/translate_init.inc.c |  4 ++++
>  3 files changed, 17 insertions(+), 13 deletions(-)
>=20
> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> index 6b6dd7e483..73920a9cac 100644
> --- a/target/ppc/cpu.h
> +++ b/target/ppc/cpu.h
> @@ -1176,6 +1176,7 @@ PowerPCCPUClass *ppc_cpu_class_by_pvr(uint32_t pvr);
>  PowerPCCPUClass *ppc_cpu_class_by_pvr_mask(uint32_t pvr);
>  PowerPCCPUClass *ppc_cpu_get_family_class(PowerPCCPUClass *pcc);
> =20
> +#ifndef CONFIG_USER_ONLY
>  struct PPCVirtualHypervisorClass {
>      InterfaceClass parent;
>      void (*hypercall)(PPCVirtualHypervisor *vhyp, PowerPCCPU *cpu);
> @@ -1189,10 +1190,8 @@ struct PPCVirtualHypervisorClass {
>      void (*hpte_set_r)(PPCVirtualHypervisor *vhyp, hwaddr ptex, uint64_t=
 pte1);
>      void (*get_pate)(PPCVirtualHypervisor *vhyp, ppc_v3_pate_t *entry);
>      target_ulong (*encode_hpt_for_kvm_pr)(PPCVirtualHypervisor *vhyp);
> -#ifndef CONFIG_USER_ONLY
>      void (*cpu_exec_enter)(PPCVirtualHypervisor *vhyp, PowerPCCPU *cpu);
>      void (*cpu_exec_exit)(PPCVirtualHypervisor *vhyp, PowerPCCPU *cpu);
> -#endif
>  };
> =20
>  #define TYPE_PPC_VIRTUAL_HYPERVISOR "ppc-virtual-hypervisor"
> @@ -1204,6 +1203,7 @@ struct PPCVirtualHypervisorClass {
>  #define PPC_VIRTUAL_HYPERVISOR_GET_CLASS(obj) \
>      OBJECT_GET_CLASS(PPCVirtualHypervisorClass, (obj), \
>                       TYPE_PPC_VIRTUAL_HYPERVISOR)
> +#endif /* CONFIG_USER_ONLY */
> =20
>  void ppc_cpu_do_interrupt(CPUState *cpu);
>  bool ppc_cpu_exec_interrupt(CPUState *cpu, int int_req);
> diff --git a/target/ppc/kvm_ppc.h b/target/ppc/kvm_ppc.h
> index fcaf745516..701c0c262b 100644
> --- a/target/ppc/kvm_ppc.h
> +++ b/target/ppc/kvm_ppc.h
> @@ -280,6 +280,17 @@ static inline bool kvmppc_has_cap_spapr_vfio(void)
>      return false;
>  }
> =20
> +static inline void kvmppc_read_hptes(ppc_hash_pte64_t *hptes,
> +                                     hwaddr ptex, int n)
> +{
> +    abort();
> +}
> +
> +static inline void kvmppc_write_hpte(hwaddr ptex, uint64_t pte0, uint64_=
t pte1)
> +{
> +    abort();
> +}
> +
>  #endif /* !CONFIG_USER_ONLY */
> =20
>  static inline bool kvmppc_has_cap_epr(void)
> @@ -310,17 +321,6 @@ static inline int kvmppc_load_htab_chunk(QEMUFile *f=
, int fd, uint32_t index,
>      abort();
>  }
> =20
> -static inline void kvmppc_read_hptes(ppc_hash_pte64_t *hptes,
> -                                     hwaddr ptex, int n)
> -{
> -    abort();
> -}
> -
> -static inline void kvmppc_write_hpte(hwaddr ptex, uint64_t pte0, uint64_=
t pte1)
> -{
> -    abort();
> -}
> -
>  static inline bool kvmppc_has_cap_fixup_hcalls(void)
>  {
>      abort();
> diff --git a/target/ppc/translate_init.inc.c b/target/ppc/translate_init.=
inc.c
> index 2b6e832c4c..4ea0cc501b 100644
> --- a/target/ppc/translate_init.inc.c
> +++ b/target/ppc/translate_init.inc.c
> @@ -10946,16 +10946,20 @@ static const TypeInfo ppc_cpu_type_info =3D {
>      .class_init =3D ppc_cpu_class_init,
>  };
> =20
> +#ifndef CONFIG_USER_ONLY
>  static const TypeInfo ppc_vhyp_type_info =3D {
>      .name =3D TYPE_PPC_VIRTUAL_HYPERVISOR,
>      .parent =3D TYPE_INTERFACE,
>      .class_size =3D sizeof(PPCVirtualHypervisorClass),
>  };
> +#endif
> =20
>  static void ppc_cpu_register_types(void)
>  {
>      type_register_static(&ppc_cpu_type_info);
> +#ifndef CONFIG_USER_ONLY
>      type_register_static(&ppc_vhyp_type_info);
> +#endif
>  }
> =20
>  type_init(ppc_cpu_register_types)

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--RIYY1s2vRbPFwWeW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl64py8ACgkQbDjKyiDZ
s5KPpBAA5bxjqRBzOm3Urkc2h2bO+rwKrnVMha5YhWCCdA1YQEbRWTCrIEg/WRZF
w493kB3qwZ32Zx2kAA07QxMV7OXpklh1ORtIniK/uSwyrZpatOZ2LxaZEsS8eHwB
qLNnvIcOWz9v3HLeyWfM3tSI0I038PhTeJe0GKud4LyJXJt/Zhs+30WEfMUvt7Ep
Bjnpvnl/XPJ7O7VB0Cg3sOOK64mILGzIfFY09dr/1/mImORuU4Wn1eODcSEIKl5N
PPIhjGe0QJf0ei4hKTmYOVmd0lKWME1LTIUR/7xR0P16m96C3yQsW5dwgdZs5a+b
2uCzoZjzOk8UAYS8XNsFP2MGquBrmuSuRBqyDar1YdObjdvYIOvhApkNR7IUieyt
trj+dE0LO1y9Nl5O/EZ3+bBhNp0zfF/2c3j5GkSolvoyabmndBFHfzyDjtzfyXHd
JcAvwFSzCvZYV07IBFYqdCVmTMjBCXMI6n71Xu1vN8IahzlcEmhfoa4xJJ6JRHy1
7BKNZWwiiOVvrK80I9k9zv2pZLixP5EB4MWQ4HO/Ntgs8Uwf6qJ6ZEWU3MdqEiEF
qjOIHNZRfFLiboi/bFSrolBb5HsVj7V2/ng2BZOStktEtsjSYQqExVvs1+S10biZ
Owy8SXiV6S0Hc4ypwHIupsEH/ylN71ZFlZ6XzollvzBsUvLojrA=
=pbhG
-----END PGP SIGNATURE-----

--RIYY1s2vRbPFwWeW--
