Received: by 10.25.15.230 with SMTP id 99csp1456035lfp;
        Mon, 27 Mar 2017 22:09:45 -0700 (PDT)
X-Received: by 10.237.62.211 with SMTP id o19mr27549211qtf.135.1490677785815;
        Mon, 27 Mar 2017 22:09:45 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 129si2542424qkl.112.2017.03.27.22.09.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 27 Mar 2017 22:09:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:50012 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1csjO5-000051-7k
	for alex.bennee@linaro.org; Tue, 28 Mar 2017 01:09:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58233)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1csjNo-0008Ne-Dt
	for qemu-arm@nongnu.org; Tue, 28 Mar 2017 01:09:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1csjNn-0000Ov-6o
	for qemu-arm@nongnu.org; Tue, 28 Mar 2017 01:09:28 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:52961)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
	id 1csjNm-0000Mv-Cd; Tue, 28 Mar 2017 01:09:27 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 3vsf7y3D6Xz9s7D; Tue, 28 Mar 2017 16:09:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1490677758;
	bh=I70cjJ5HfXZ/mhIhu6bFCJkdglMP0RxOmhPbkeOEB/E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Fw5d644CsqQyaDyDEzEK0UwIRpQl0b6x9h4XDK9lf+t5qhbrn8sLiWNwJOivBzVFi
	Oz9RmPhyBlLtwbXIYlvYqS8HMqWLB13ogwK70nfb4lnMYUkY/taxtFsv5bEqZIqzBS
	RLTFsHHWUUUuxj+drmkMfpJ0I/YIk3uDt8b0+i7U=
Date: Tue, 28 Mar 2017 15:54:55 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20170328045455.GG21068@umbus.fritz.box>
References: <1490189568-167621-1-git-send-email-imammedo@redhat.com>
	<1490189568-167621-18-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="oXNgvKVxGWJ0RPMJ"
Content-Disposition: inline
In-Reply-To: <1490189568-167621-18-git-send-email-imammedo@redhat.com>
User-Agent: Mutt/1.8.0 (2017-02-23)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2401:3900:2:1::2
Subject: Re: [Qemu-arm] [PATCH for-2.10 17/23] numa: remove no longer used
 numa_get_node_for_cpu()
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CceYC1WFsabF


--oXNgvKVxGWJ0RPMJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 22, 2017 at 02:32:42PM +0100, Igor Mammedov wrote:
> it's been replaced by fetching mapping info from possible_cpus
>=20
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  include/sysemu/numa.h |  4 ----
>  numa.c                | 14 --------------
>  2 files changed, 18 deletions(-)
>=20
> diff --git a/include/sysemu/numa.h b/include/sysemu/numa.h
> index 46ea6c7..c67763a 100644
> --- a/include/sysemu/numa.h
> +++ b/include/sysemu/numa.h
> @@ -31,8 +31,4 @@ extern QemuOptsList qemu_numa_opts;
>  void numa_set_mem_node_id(ram_addr_t addr, uint64_t size, uint32_t node);
>  void numa_unset_mem_node_id(ram_addr_t addr, uint64_t size, uint32_t nod=
e);
>  uint32_t numa_get_node(ram_addr_t addr, Error **errp);
> -
> -/* on success returns node index in numa_info,
> - * on failure returns nb_numa_nodes */
> -int numa_get_node_for_cpu(int idx);
>  #endif
> diff --git a/numa.c b/numa.c
> index ab41776..187c93f 100644
> --- a/numa.c
> +++ b/numa.c
> @@ -583,20 +583,6 @@ MemdevList *qmp_query_memdev(Error **errp)
>      return list;
>  }
> =20
> -int numa_get_node_for_cpu(int idx)
> -{
> -    int i;
> -
> -    assert(idx < max_cpus);
> -
> -    for (i =3D 0; i < nb_numa_nodes; i++) {
> -        if (test_bit(idx, numa_info[i].node_cpu)) {
> -            break;
> -        }
> -    }
> -    return i;
> -}
> -
>  void ram_block_notifier_add(RAMBlockNotifier *n)
>  {
>      QLIST_INSERT_HEAD(&ram_list.ramblock_notifiers, n, next);

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--oXNgvKVxGWJ0RPMJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJY2eyfAAoJEGw4ysog2bOS8ZgQANfS+SE+Gg9l3WMqnU76S8Uw
cXPH9kpErHc2wBxn7lGmMm/uMon0FLUDkizuT79VNg/j5pPEPNoJw7TufqAYAIXk
OPkJyPPiq3vmsUkDrrdlBmX9Y3ofNg6vKOVBpkh4J50VkuRTVNKX2dELangkXbuq
cEeo/yx73UG+f/Ug+B9jVrUIYAsLwCh+XTbQiTi4boYlE3Y3Iv+LJuO6fJkD8RyV
DK39Ogxkae+l4gxb4+UDicwK451Aoxoq0nUg9fRHVY9uCyyv8hJnzFXx5jc8OwEk
WHYgP9gQcdNbTr57+jrd2DxBFqKD6ZGQbSh+bs8+qyyix44e56wDJLxEMUEw4Xio
+EBogoXPj4oU4FCEcDUXC2n6EqmzGkKKAzRcEWrfCBSo07R3NwELWVKbsfgMv+Ik
ov5QMdiZdTJNOTi5a0rX1P+KtNqxQ6R5HyoUPTy1o0eXBwXXmwQSgLEQcMO9YNb+
AXYBGqanZkzQJbCSezHCTTKJmzP4t513TzrUUY0TBSoxKoRB6fJ4wWLGwUex5B0D
EB+E4gyVYv3IlByY2wXoPlwXetxurr/Hg185pROrUbtnqtEXIWk1MvaDv0VkR72C
DWvmo9dia7ulpOATUiJAoCBempYMsMGPzhWLvB95tLHPsEzutRr1HxxMTecAsmpe
AOspgv6eBjkcC0lhbIU8
=qg7v
-----END PGP SIGNATURE-----

--oXNgvKVxGWJ0RPMJ--
