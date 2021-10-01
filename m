Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp829904lfp;
        Thu, 30 Sep 2021 18:52:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy1+biUQ62Itsnq3GuIzUcSTkLp/rg7CYBjyDqqilIN5Uva5fSFBFpBDLlbWUR0NFpnuZwt
X-Received: by 2002:a02:ac01:: with SMTP id a1mr7701959jao.93.1633053138583;
        Thu, 30 Sep 2021 18:52:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1633053138; cv=none;
        d=google.com; s=arc-20160816;
        b=V5G9FxbipUAfFCyzmqe41+SrurFAkzNRFO76YnFqJpJdAQLJaDJoadoU5eke1IORVq
         0g8skqElheNHRe2IKVpabVokwVZGVCwuPWa3PKAqhMIfR7H+I0Umgsvi9P2QFbTgdqhI
         6MXGKEkVyQyQtAVIsOjCPiznYBilYpNMC2O/YBbCEr4+G7z8Y06F2Iz6TKXvUnXEokPQ
         VaC7F3F250XUSaD9PiW0Asz5uL6SPmEXPqKzuWhMCiCBdxqxqCsoHiKm4cbUZDgbOf0P
         HgRPkAZsIh9oWhahDGeEfLdhYj8VhT2yA9H2isecLnm39ztEO/mz8o6SrHOVhCFrJ9DV
         P9wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=PLROqIRnu2IQz0NWe6c7Ul7eZ6i6t2tyEj/PPTrs+Vg=;
        b=tKtWDZq2ebit+IOYi2yIEYTqQSJwAKM6g3Lujg7vu0K4V2cJFOa5eovDtTcSlqLwqn
         lU6Jk+RwmUrzIKQ8Ej+SAQRkDTeiMhmlMgGhfocPkSg4OqlLW6n+qsHRLw+56QHIaaG8
         m2T/4zSq0wzpRl61HRdjXB2peSLNmD9+QS1qslx5elHalPPn0TIqOPtVk6soec+Y/dTo
         zCN6WqkvNFNlxou6eEafB27xAP1UfkJ/zutQnpUuFo7YODHSTOkKNutsmBzvzHDBy/lS
         Py652TFbO3EDg4PjlIP6BrV62MyHtXWMCFQw5MjZVbs61wi4DEP3D+piYxMeU9Ko8DzY
         13RA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=edMW3Tnb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d16si7501975iow.57.2021.09.30.18.52.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Sep 2021 18:52:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=edMW3Tnb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:38674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mW7ij-0002aN-M6
	for alex.bennee@linaro.org; Thu, 30 Sep 2021 21:52:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mW7i2-0002ZJ-Dv; Thu, 30 Sep 2021 21:51:35 -0400
Received: from gandalf.ozlabs.org ([2404:9400:2:0:216:3eff:fee2:21ea]:37585)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mW7hz-0003mh-Fd; Thu, 30 Sep 2021 21:51:34 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HLCks2yXDz4xbT; Fri,  1 Oct 2021 11:51:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1633053077;
 bh=PLROqIRnu2IQz0NWe6c7Ul7eZ6i6t2tyEj/PPTrs+Vg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=edMW3Tnbv5I2pr4lQzWHKzERpyP8y2lh/s4WhL/3sk/qt83ps54p0tBkKzu3t80Mo
 ckgt6xhcEzp2B/rrJNjZx8xXzBxbVmTP/xd3emSBaujv+lc+hbAgUOImKljfI0kqAL
 mcl931LqoKu8dGrtbTvcZMNNSjzuKzi9i+w83qWE=
Date: Fri, 1 Oct 2021 11:42:30 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH 3/3] dtc: Update to version 1.6.1
Message-ID: <YVZnhshGOgYzdNYL@yekko>
References: <20210827120901.150276-1-thuth@redhat.com>
 <20210827120901.150276-4-thuth@redhat.com>
 <7004c933-5262-3119-80f5-722a8e858046@redhat.com>
 <20210930135633.63566d4d@bahia.huguette>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="6r8RucNjW08wPYPP"
Content-Disposition: inline
In-Reply-To: <20210930135633.63566d4d@bahia.huguette>
Received-SPF: pass client-ip=2404:9400:2:0:216:3eff:fee2:21ea;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nOrvhFZ/TAwf


--6r8RucNjW08wPYPP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 30, 2021 at 01:56:33PM +0200, Greg Kurz wrote:
> On Thu, 30 Sep 2021 09:10:12 +0200
> Thomas Huth <thuth@redhat.com> wrote:
>=20
> > On 27/08/2021 14.09, Thomas Huth wrote:
> > > The dtc submodule is currently pointing to non-release commit. It's n=
icer
> > > if submodules point to release versions instead and since dtc 1.6.1 is
> > > available now, let's update to that version.
> > >=20
> > > Signed-off-by: Thomas Huth <thuth@redhat.com>
> > > ---
>=20
> > >   dtc | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > >=20
> > > diff --git a/dtc b/dtc
> > > index 85e5d83984..b6910bec11 160000
> > > --- a/dtc
> > > +++ b/dtc
> > > @@ -1 +1 @@
> > > -Subproject commit 85e5d839847af54efab170f2b1331b2a6421e647
> > > +Subproject commit b6910bec11614980a21e46fbccc35934b671bd81
> >=20
> > Ping!
> >=20
> > David, could you please pick up this patch if you don't mind it?
> >=20
> >   Thanks,
> >    Thomas
> >=20
>=20
> Hi Thomas !
>=20
> greg@bahia:[main]dtc$ git log --oneline  85e5d839847af54efab170f2b1331b2a=
6421e647..v1.6.1
> b6910bec1161 Bump version to v1.6.1
> 21d61d18f968 Fix CID 1461557
> 4c2ef8f4d14c checks: Introduce is_multiple_of()
> e59ca36fb70e Make handling of cpp line information more tolerant
> 0c3fd9b6aceb checks: Drop interrupt_cells_is_cell check
> 6b3081abc4ac checks: Add check_is_cell() for all phandle+arg properties
> 2dffc192a77f yamltree: Remove marker ordering dependency
> 61e513439e40 pylibfdt: Rework "avoid unused variable warning" lines
> c8bddd106095 tests: add a positive gpio test case
> ad4abfadb687 checks: replace strstr and strrchr with strends
> 09c6a6e88718 dtc.h: add strends for suffix matching
> 9bb9b8d0b4a0 checks: tigthen up nr-gpios prop exception
> b07b62ee3342 libfdt: Add FDT alignment check to fdt_check_header()
> a2def5479950 libfdt: Check that the root-node name is empty
> 4ca61f84dc21 libfdt: Check that there is only one root node
> 34d708249a91 dtc: Remove -O dtbo support
> 8e7ff260f755 libfdt: Fix a possible "unchecked return value" warning
> 88875268c05c checks: Warn on node-name and property name being the same
> 9d2279e7e6ee checks: Change node-name check to match devicetree spec
> f527c867a8c6 util: limit gnu_printf format attribute to gcc >=3D 4.4.0
> 183df9e9c2b9 gitignore: Ignore the swp files
> 0db6d09584e1 gitignore: Add cscope files
> 307afa1a7be8 Update Jon Loeliger's email
> ca16a723fa9d fdtdump: Fix gcc11 warning
> 64990a272e8f srcpos: increase MAX_SRCFILE_DEPTH
> 163f0469bf2e dtc: Allow overlays to have .dtbo extension
> 3b01518e688d Set last_comp_version correctly in new dtb and fix potential=
 version issues in fdt_open_into
> f7e5737f26aa tests: Fix overlay_overlay_nosugar test case
> 7cd5d5fe43d5 libfdt: Tweak description of assume-aligned load helpers
> a7c404099349 libfdt: Internally perform potentially unaligned loads
> bab85e48a6f4 meson: increase default timeout for tests
> f8b46098824d meson: do not assume python is installed, skip tests
> 30a56bce4f0b meson: fix -Wall warning
> 5e735860c478 libfdt: Check for 8-byte address alignment in fdt_ro_probe_()
> 67849a327927 build-sys: add meson build
> 05874d08212d pylibfdt: allow build out of tree
> 3bc3a6b9fe0c dtc: Fix signedness comparisons warnings: Wrap (-1)
> e1147b159e92 dtc: Fix signedness comparisons warnings: change types
> 04cf1fdc0fcf convert-dtsv0: Fix signedness comparisons warning
> b30013edb878 libfdt: Fix kernel-doc comments
> cbca977ea121 checks: Allow PCI bridge child nodes without an address
> 73e0f143b73d libfdt: fdt_strerror(): Fix comparison warning
> 6c2be7d85315 libfdt: fdt_get_string(): Fix sequential write comparison wa=
rnings
> 82525f41d59e libfdt: libfdt_wip: Fix comparison warning
> fb1f65f15832 libfdt: fdt_create_with_flags(): Fix comparison warning
> f28aa271000b libfdt: fdt_move(): Fix comparison warnings
> 3d7c6f44195a libfdt: fdt_add_string_(): Fix comparison warning
> 10f682788c30 libfdt: fdt_node_offset_by_phandle(): Fix comparison warning
> 07158f4cf2a2 libfdt: overlay: Fix comparison warning
> ce9e1f25a7de libfdt: fdt_resize(): Fix comparison warning
> faa76fc10bc5 libfdt: fdt_splice_(): Fix comparison warning
> 54dca0985316 libfdt: fdt_get_string(): Fix comparison warnings
> f8e11e61624e libfdt: fdt_grab_space_(): Fix comparison warning
> 0c43d4d7bf5a libfdt: fdt_mem_rsv(): Fix comparison warnings
> 442ea3dd1579 libfdt: fdt_offset_ptr(): Fix comparison warnings
> ca19c3db2bf6 Makefile: Specify cflags for libyaml
> 7bb86f1c0956 libfdt: fix fdt_check_node_offset_ w/ VALID_INPUT
> 3d522abc7571 dtc: Include stdlib.h in util.h
> 808cdaaf524f dtc: Avoid UB when shifting
> 3e3138b4a956 libfdt: fix fdt_check_full buffer overrun
> 9d7888cbf19c dtc: Consider one-character strings as strings
> 8259d59f59de checks: Improve i2c reg property checking
> fdabcf2980a4 checks: Remove warning for I2C_OWN_SLAVE_ADDRESS
> 2478b1652c8d libfdt: add extern "C" for C++
> f68bfc2668b2 libfdt: trivial typo fix
> 7be250b4d059 libfdt: Correct condition for reordering blocks
> 81e0919a3e21 checks: Add interrupt provider test
>=20
> I don't see anything obvious that would preclude from updating
> to v1.6.1, but I don't think either David or I will post another
> PR anytime soon. Maybe better if this goes through someone else's
> tree.
>=20
> FWIW I could successfully build QEMU using the updated submodule,
> so as discussed on IRC :
>=20
> Acked-by: Greg Kurz <groug@kaod.org>
>=20
> David will hopefully nack it in time if he's aware of an issue.

No, it should be fine.

Acked-by: David Gibson <david@gibson.dropbear.id.au>

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--6r8RucNjW08wPYPP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmFWZ4YACgkQbDjKyiDZ
s5JOsRAAgC00c4/HtdU6IoUuOB17/U3QgXs2jn5keRCCEbVz3RY6d6bPVmsQUgin
e1Qk8kJlKVr5r0H8rj8b/cEDPTa3ksZbKChEwJTP5hjTFrlnKqQXHv+XTXgaFzck
SPtxCc6GUR3S4JVR0pLfMpn/Z9VBn2nBYRlwqPXya77WW+XtsWYEJqKQRTg7NHdV
M+InjxulmVkZmmkrLx7ZywMKdt6T7QtIYnlW7g8McwBzEEHWF5Tu7QrXjHsTdAGX
jTpg1S4ND9IpPX04+/i156xBUhuGqXOqyBsQbDTUhmGVVRe1jL8Fvgj5chbzCbzS
D7r7jHwUtc+4lTriB8lKtxDNh+151k6NDKe9Xaf73+8vsJUzvjt5Lo2hhCJSlqjR
5zn37kBLbsvpxDkD7vVM5XVy8x5Mu1WGZk49NgEIPIvhEZqKgZ4lvZ5bl/YBcsPy
rA9ZwvwlxWPY6od+UxoIcaMCy/EtnFd79uB73FjGH5O08uZO08xwt5WkNYEp1rTP
lS89GgwhekIkYUwE2IgNsEHlfP11uI12WQQ5/a2s4mPmGbwYr2lorUlG5e59qXIq
SF54p7Lu8EDMWIDm2GmsWaNGgrXvK50bfAqpQxeJKYf/nUUAb0G0MF5smOTR4YIV
U4Bz0PFbYZLJyNa+M7rsolw4xXSXUeSElnEONPm++eDdRClSMA8=
=mA36
-----END PGP SIGNATURE-----

--6r8RucNjW08wPYPP--
