Received: by 10.25.0.198 with SMTP id 189csp1201673lfa;
        Sun, 7 May 2017 22:40:16 -0700 (PDT)
X-Received: by 10.84.238.9 with SMTP id u9mr81617998plk.126.1494222016507;
        Sun, 07 May 2017 22:40:16 -0700 (PDT)
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id a5si11747464plh.187.2017.05.07.22.40.16;
        Sun, 07 May 2017 22:40:16 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gibson.dropbear.id.au;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751875AbdEHFkO (ORCPT <rfc822;francois.ozog@linaro.org>
        + 6 others); Mon, 8 May 2017 01:40:14 -0400
Received: from ozlabs.org ([103.22.144.67]:43045 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750721AbdEHFkM (ORCPT <rfc822;kvm@vger.kernel.org>);
        Mon, 8 May 2017 01:40:12 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
        id 3wLrtf2V07z9s89; Mon,  8 May 2017 15:40:10 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1494222010;
        bh=/bgb3kQlSAsheKN6r7M27j86ga4EkSm4xW5vjCIAsqA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RGpVdY1lfCNHCIJGuMyIxMfh5rfPxrez64bwx3OIvjzq4+UcWuhv1rvDeYSGl5p7w
         VyUZ58VCGCI1DoaVtbO24Qqpjo/7d2wCUDCoCwT3zqKYhAVZN845cin1p/uBSJh5MF
         9BzZmFGhNJz6uSxVXjM3Kim8wBuKs2vpEgAwFVuI=
Date:   Mon, 8 May 2017 15:26:17 +1000
From:   David Gibson <david@gibson.dropbear.id.au>
To:     Eric Blake <eblake@redhat.com>
Cc:     qemu-devel@nongnu.org, armbru@redhat.com, berrange@redhat.com,
        alistair.francis@xilinx.com, "Michael S. Tsirkin" <mst@redhat.com>,
        Igor Mammedov <imammedo@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Peter Maydell <peter.maydell@linaro.org>,
        Jan Kiszka <jan.kiszka@web.de>,
        Andrzej Zaborowski <balrogg@gmail.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Richard Henderson <rth@twiddle.net>,
        Eduardo Habkost <ehabkost@redhat.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Anthony Perard <anthony.perard@citrix.com>,
        Paul Burton <paul.burton@imgtec.com>,
        Aurelien Jarno <aurelien@aurel32.net>,
        Yongbok Kim <yongbok.kim@imgtec.com>,
        Alexander Graf <agraf@suse.de>,
        Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
        "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
        Cornelia Huck <cornelia.huck@de.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Michael Walle <michael@walle.cc>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Stefan Weil <sw@weilnetz.de>,
        Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
        Marcelo Tosatti <mtosatti@redhat.com>,
        Artyom Tarasenko <atar4qemu@gmail.com>,
        Gerd Hoffmann <kraxel@redhat.com>,
        "open list:Calxeda Highbank" <qemu-arm@nongnu.org>,
        "open list:X86" <xen-devel@lists.xenproject.org>,
        "open list:Old World" <qemu-ppc@nongnu.org>,
        "open list:Overall" <kvm@vger.kernel.org>
Subject: Re: [PATCH v6 3/5] shutdown: Add source information to SHUTDOWN and
 RESET
Message-ID: <20170508052617.GC25748@umbus.fritz.box>
References: <20170505193810.2934-1-eblake@redhat.com>
 <20170505193810.2934-4-eblake@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="xo44VMWPx7vlQ2+2"
Content-Disposition: inline
In-Reply-To: <20170505193810.2934-4-eblake@redhat.com>
User-Agent: Mutt/1.8.0 (2017-02-23)
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: 0rghlCf6RJaZ


--xo44VMWPx7vlQ2+2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 05, 2017 at 02:38:08PM -0500, Eric Blake wrote:
> Time to wire up all the call sites that request a shutdown or
> reset to use the enum added in the previous patch.
>=20
> It would have been less churn to keep the common case with no
> arguments as meaning guest-triggered, and only modified the
> host-triggered code paths, via a wrapper function, but then we'd
> still have to audit that I didn't miss any host-triggered spots;
> changing the signature forces us to double-check that I correctly
> categorized all callers.
>=20
> Since command line options can change whether a guest reset request
> causes an actual reset vs. a shutdown, it's easy to also add the
> information to reset requests.
>=20
> Replay adds a FIXME to preserve the cause across the replay stream,
> that will be tackled in the next patch.
>=20
> Signed-off-by: Eric Blake <eblake@redhat.com>
> Acked-by: David Gibson <david@gibson.dropbear.id.au> [ppc parts]
> Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk> [SPARC part]

[snip]

> diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
> index 9f18f75..2735fe9 100644
> --- a/hw/ppc/spapr_hcall.c
> +++ b/hw/ppc/spapr_hcall.c
> @@ -1166,7 +1166,7 @@ static target_ulong h_client_architecture_support(P=
owerPCCPU *cpu,
>      spapr_ovec_cleanup(ov5_updates);
>=20
>      if (spapr->cas_reboot) {
> -        qemu_system_reset_request();
> +        qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_RESET);

I'm not 100% sure about this one, since I'm not sure 100% of how the
different enum values are defined.  This one is tripped when feature
negotiation between firmware and guest can't be satisfied without
rebooting (next time round the firmware will use some different
options).

So it's essentially a firmware/hypervisor triggered reset, but one
that should only ever be tripped during early guest boot.  Is
CAUSE_GUEST_RESET correct for that?

Apart from this, ppc changes

Acked-by: David Gibson <david@gibson.dropbear.id.au>

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--xo44VMWPx7vlQ2+2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJZEAF3AAoJEGw4ysog2bOSKUEQAIHEYWHQbtglHYNeWCFshRU1
B2yYZkSIpestqK2pOaBSYHw7GAnIcqCS47d9jJZsvVqzivJyV+pZGm+oWnCMyYVX
vrMjN16R3TSALFVAnSEwqNlgR3my62B7ElUaWEn6A9nUbZj4lKiXGF2HtSK1GjuK
CIBtxN65CQobrO+YGtq2fVLKFt/yONvKbwgOTNixEpmxuPEuGa5+d3c9xnV2FhT1
LOMsvv4EEqZaMEay3DkV+BYyMShogMB8th+oF7FTYWo1l0FWOEqQlQRTiSg44WPk
U5WCyGEXG22ljDFzdau5r0YAZNfMHzajEQ6c+A81ebQr41NNuE0d9nMXDUEH3BG1
UN3j5XdC0j/gSh03PTMob0di/cqjONhYbrdZEjaX5AFqt88T7WgsNbWhFZBCr1KW
ihHP1fLuTDCd2Hmbr6yTCIHjf8dagI8okTFUZey+9JF9N/KLYXUEbk8tVckX3jKi
+KBvLUm8RoG7IcrY4qKyELtuUaOvx2Nh5Sthdl3dOahmXuEfxzwGb0AkCYZ/ycK/
a2XZ/6D/v5Z3kIeMbCWJt7ATIyIzDG+0A5f41V6s87Nda5FTe50IxHFaoRPquCO+
8t9JFEW3YFN2MxrIAcXjI6mvFoC9jhbR2w/4F+utRmdi+AqaGgsXah7Kl7s2iEmK
GI6v5jijqm6cgO6HeFdZ
=UO+j
-----END PGP SIGNATURE-----

--xo44VMWPx7vlQ2+2--
