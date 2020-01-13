Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp3625327lff;
        Sun, 12 Jan 2020 19:24:02 -0800 (PST)
X-Google-Smtp-Source: APXvYqyWc1c9jxb0GitTO2eudfFNxj46VVAtFsP9OK8ILagrtpgmAtdxz3xZuAql5Uv9ZO3XkoNz
X-Received: by 2002:a05:6808:208:: with SMTP id l8mr10612058oie.112.1578885842469;
        Sun, 12 Jan 2020 19:24:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578885842; cv=none;
        d=google.com; s=arc-20160816;
        b=ML0jhR2Zvz8SFkxualwhgGY1RzWxibyHJbQGcJdCo6fEsstHnFT/Fr4qSrqQotBukO
         MP10IwpoaE2yjwZGO0kfxWovn55whTuMO6ByOee5OeeeZ3iqcBc3zr0fROLL2/Jz0tbo
         ctdcivmNin0bR+NY1JWJM3RfJsTRSBf9QU3ONfkruJlkbpGdXuofBeaz4ElZ0I4k9gM2
         QJiRJID9QH4Uz1jPhw1W5b0PqJmKXkp6zDDgJ44zVweiaALSirD4mnKAyBglenp6DREz
         KKqqIC/VP6023QM/jumgKFnfAH3rsBtTmBAuzV18Oqeg7iRoWGsaBk+TCJpQKt4wpEeW
         qaCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=3DGGi7h0MdIL+n/SrFnYRAtTNfbNT2F2GJgV4agreUg=;
        b=nmS9/96avw6oP+Bqd9bvaCKPfh9GhwTxg4raxd9LEVMOMxnmqCXhtNwHlr9/L+sZk6
         Rtf+JnA957xeFGOjOsWJKwFeZWEfBQ6ZnhduE5wAW9z8lpdIIFXIUVV0PS2EaUrWdhE0
         YBtgB63wdPwGKxMJ42B51RmTmZgvlGE4FhHlsOUo5vWqMokQOSbkqg2l85H+7UnIulF4
         NFXH6NhjAw0g48IQQKvwqdRvFiP6VBhR+zOjPyv6dnqTfHye+fIp05qUfa8M9tzCiJcB
         DfEsG8IGxaBLOp9TZgplS/OkceXrFsFbQLMlaS9Oar/AWtOylM7ipyOSFXKE7rVafERW
         JXlA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gibson.dropbear.id.au header.s=201602 header.b="kqX/uxq7";
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id m90si5880652otc.259.2020.01.12.19.24.02;
        Sun, 12 Jan 2020 19:24:02 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gibson.dropbear.id.au header.s=201602 header.b="kqX/uxq7";
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733238AbgAMDYB (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 4 others); Sun, 12 Jan 2020 22:24:01 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:60779 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1733020AbgAMDYB (ORCPT <rfc822;kvm@vger.kernel.org>);
        Sun, 12 Jan 2020 22:24:01 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
        id 47wzTB5Mnvz9sP3; Mon, 13 Jan 2020 14:23:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1578885838;
        bh=GSzB1/RoqRWSpXQnvdZLFlk4mB9lNaa5NXZOktq/Pdg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kqX/uxq7YKvFvznFeTSk2Z1zXdJ5jVrQcZGikvBIAJnmZCH6fSYKG83W0Wsa9xoy4
         AXBbAaSyDXA9Nufd3jE7gMp7PYrdO2OOS+ECa9IeMgOd24wso2X1IBzZitintMzx27
         2oIBwq3YGF/dpFVzhqmFMCRiLIn/JK1gCYbOJxVY=
Date:   Mon, 13 Jan 2020 11:11:05 +1000
From:   David Gibson <david@gibson.dropbear.id.au>
To:     Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Cc:     qemu-devel@nongnu.org, Marcelo Tosatti <mtosatti@redhat.com>,
        Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
        Eduardo Habkost <ehabkost@redhat.com>,
        Juan Quintela <quintela@redhat.com>, kvm@vger.kernel.org,
        Paolo Bonzini <pbonzini@redhat.com>,
        Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
        Alistair Francis <alistair.francis@wdc.com>,
        qemu-ppc@nongnu.org,
        "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
        Richard Henderson <rth@twiddle.net>
Subject: Re: [PATCH 02/15] hw/ppc/spapr_rtas: Use local MachineState variable
Message-ID: <20200113011105.GA7045@umbus>
References: <20200109152133.23649-1-philmd@redhat.com>
 <20200109152133.23649-3-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="pf9I7BMVVzbSWLtt"
Content-Disposition: inline
In-Reply-To: <20200109152133.23649-3-philmd@redhat.com>
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: lN1aXaqDH771


--pf9I7BMVVzbSWLtt
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 09, 2020 at 04:21:20PM +0100, Philippe Mathieu-Daud=E9 wrote:
> Since we have the MachineState already available locally,
> ues it instead of the global current_machine.
>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>

Acked-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  hw/ppc/spapr_rtas.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/hw/ppc/spapr_rtas.c b/hw/ppc/spapr_rtas.c
> index 8d8d8cdfcb..e88bb1930e 100644
> --- a/hw/ppc/spapr_rtas.c
> +++ b/hw/ppc/spapr_rtas.c
> @@ -281,7 +281,7 @@ static void rtas_ibm_get_system_parameter(PowerPCCPU =
*cpu,
>                                            "DesProcs=3D%d,"
>                                            "MaxPlatProcs=3D%d",
>                                            max_cpus,
> -                                          current_machine->ram_size / Mi=
B,
> +                                          ms->ram_size / MiB,
>                                            ms->smp.cpus,
>                                            max_cpus);
>          if (pcc->n_host_threads > 0) {

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--pf9I7BMVVzbSWLtt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl4bw6MACgkQbDjKyiDZ
s5J3Rg/+PcAF6N1hOCWdn3fjZ7uZ8Dc6XsXHNfrNBUKNNZR5evR3f/Uw91FbBnWU
93bkX39mSNqucWhzHGS3AH0bryt5f//anWrTpzbBE+yYT2Zw1I9u355c5/FzJlVW
5qfcth5UPcqmQ0QJwtq46xpwMoOi7lH8mXsM8/LTBdRqgy9jMnW+tjuUOoC9vP+2
+55HExP5h03MBB3kKMxCGPogC8wzdo6PLueDD8TSm9OXSEQGrQKmG/0kXRjVxpRb
YUlT6u7R9P/pN+sVZ/+denw7CBYqMjrAhnu8tHP9PdGT7uRadR8VbfoUe9QEREwd
kd7BHhyN9RtspDMwx5vUDuICtjoFZW9gsVYzo80XCgVHMHqazBtcjIJMoyCP4u0d
jMDRCeKMX7/iXjjZ0BK4bAol/TbT/luZF+aQQRTT4uhK4H3aeQdheOanj3nsWB1t
kMbGTwUAKvLDFRPfUnUfDGyf1QxsO31izD2XRqHUiu1kbFHn3c83zBf5IOOXE1qP
IoD1ldQ5SMQ/anRHbvDyhhQyLHBNJlua2/baqj5U9a3J/nNKlrl1mrYCHMsShqUO
/QymmpNf/uwMtJoInAUeCPe5m+SfZmPewDawfebcSljiNPL2JFK2ixXXSlFDNQpp
uMusEfKsDPY8r/42sDhIerUu/TulgIa0YrDi0gf31NwV3sHaIRo=
=tUZF
-----END PGP SIGNATURE-----

--pf9I7BMVVzbSWLtt--
