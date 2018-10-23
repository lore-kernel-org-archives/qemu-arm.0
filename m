Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp4691915wrt;
        Tue, 23 Oct 2018 08:39:59 -0700 (PDT)
X-Google-Smtp-Source: ACcGV605i4Aux86/K310tIdcORRcWu7xXhowMjlHBIhXRDVD3+zfeGsIxg1xQtLnVK6u3IZ4KjpL
X-Received: by 2002:ac8:29d3:: with SMTP id 19-v6mr47849903qtt.174.1540309198980;
        Tue, 23 Oct 2018 08:39:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540309198; cv=none;
        d=google.com; s=arc-20160816;
        b=FyOfpzomex1GXUDoR1W24UIVuD2Ggk8RRzyK4cdA47s0Y0LqbJn46/A3P4czldhrjW
         r+yEZ2BCjQ5KKxaEz2GI2RIwqYwn6G12oALE9jWf5lKJub0dZ9Z1JZSJvFM4en7n364l
         rdg3PKB3I7MXtTWd8bdUfmL2Uk7p+VBaSjH6UsNnxhmo4N2Jr+9TOcP8nhtjfWpqxn5o
         FfQwP3s0hDQ6lBjstlO4gyo56KJY4REPF3BsYPmJJZKAEr9kkK5HflIhzJkjxOL6lwic
         bvp5GrBdUyBQWvkG8DC2+j6M8NkRnnHH2+TVpu7jDDlomBCpX04Uyez88mJioh2LSbZ9
         gUEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature;
        bh=KKFGDd2DV7lC/Ne5oqup3tr3gw1UQin7Hhh+31+vimQ=;
        b=Qt2uK1GOQ+akLecd/QdPiSyu9eR3QIR4RpgGa4qZkNB0ADwiqgmN+NqslIYSepVvyI
         KPfgsewtOYOBGpgbbpQw2v06/DbERn2rgvQt87E9u042IZefhJYkCHjGQ7QeI/tpJSW8
         TIJ9oXuU0ebC8qxIUkiYz2ki87wiwdqsGTacITujw1whVphIjNdPTUL/vXDt3C1Iozlf
         XhgpXXLqYB4svjDFum4Hv326v7WpieigPiAQif/H+g3CWDzgm9J11cAe7cQlcB0vt72r
         Rji/DHW3LdZ62jxjfNLYwjiNjXK3r+K5G8Bqrbv6AP1DBrBws4IZUIGvTN9dgHy+wluP
         QXqA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=hwt6lYhj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c26si371219qvh.13.2018.10.23.08.39.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 Oct 2018 08:39:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=hwt6lYhj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:42715 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gEymk-0002wb-EF
	for alex.bennee@linaro.org; Tue, 23 Oct 2018 11:39:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36857)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1gEyhE-0006fy-9g
	for qemu-devel@nongnu.org; Tue, 23 Oct 2018 11:34:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1gEybx-00076I-Rw
	for qemu-devel@nongnu.org; Tue, 23 Oct 2018 11:28:51 -0400
Received: from ozlabs.org ([203.11.71.1]:40459)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
	id 1gEybv-0006z2-0N; Tue, 23 Oct 2018 11:28:47 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 42fcj90VRlz9sNq; Wed, 24 Oct 2018 02:28:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1540308493;
	bh=LlCxyjQM1cc5+8hee25I/WAYPioNWqxH95sffGrLNrk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hwt6lYhjApiTZ/lJw9kuhqkz5Ws+jk2SWoGQB/gwAmMhWiH9sBg6MCgHtoZaqUPxV
	aDZ2Kd9EbkbCH9UOIJNydJXKKzPTEc0+qKn0/a3YxMjP0DTBR+oJdaQdOfX4XN0/xq
	d5iWMqld5Pfj3Fomu6Hk7vMXwPxKg8Zh+S7Zo29o=
Date: Tue, 23 Oct 2018 16:27:23 +0100
From: David Gibson <david@gibson.dropbear.id.au>
To: Eduardo Habkost <ehabkost@redhat.com>
Message-ID: <20181023152723.GY12127@umbus.hotspot.internet-for-guests.com>
References: <20181018200422.4358-1-ehabkost@redhat.com>
	<20181018200422.4358-46-ehabkost@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="PxDrs/Fpf4pPiewX"
Content-Disposition: inline
In-Reply-To: <20181018200422.4358-46-ehabkost@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 203.11.71.1
Subject: Re: [Qemu-devel] [PULL 45/45] numa: Clean up error reporting in
 parse_numa()
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>, libvir-list@redhat.com,
	Jason Wang <jasowang@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	qemu-devel@nongnu.org, Alexander Graf <agraf@suse.de>,
	Max Filippov <jcmvbkbc@gmail.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Rob Herring <robh@kernel.org>, Markus Armbruster <armbru@redhat.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
	Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: eMXx2fzCK8ij


--PxDrs/Fpf4pPiewX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 18, 2018 at 05:04:22PM -0300, Eduardo Habkost wrote:
> From: Markus Armbruster <armbru@redhat.com>
>=20
> Calling error_report() in a function that takes an Error ** argument
> is suspicious.  parse_numa() does that, and then fails without setting
> an error.  Its caller main(), via qemu_opts_foreach(), is fine with
> it, but clean it up anyway.
>=20
> While there, give parse_numa() internal linkage.
>=20
> Cc: Eduardo Habkost <ehabkost@redhat.com>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> Message-Id: <20181008173125.19678-26-armbru@redhat.com>
> Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  include/sysemu/numa.h | 1 -
>  numa.c                | 8 +++-----
>  2 files changed, 3 insertions(+), 6 deletions(-)
>=20
> diff --git a/include/sysemu/numa.h b/include/sysemu/numa.h
> index 7a0ae751aa..21713b7e2f 100644
> --- a/include/sysemu/numa.h
> +++ b/include/sysemu/numa.h
> @@ -22,7 +22,6 @@ struct NumaNodeMem {
>  };
> =20
>  extern NodeInfo numa_info[MAX_NODES];
> -int parse_numa(void *opaque, QemuOpts *opts, Error **errp);
>  void parse_numa_opts(MachineState *ms);
>  void numa_complete_configuration(MachineState *ms);
>  void query_numa_node_mem(NumaNodeMem node_mem[]);
> diff --git a/numa.c b/numa.c
> index 1d7c49ad43..50ec016013 100644
> --- a/numa.c
> +++ b/numa.c
> @@ -215,7 +215,7 @@ end:
>      error_propagate(errp, err);
>  }
> =20
> -int parse_numa(void *opaque, QemuOpts *opts, Error **errp)
> +static int parse_numa(void *opaque, QemuOpts *opts, Error **errp)
>  {
>      NumaOptions *object =3D NULL;
>      MachineState *ms =3D MACHINE(opaque);
> @@ -239,7 +239,7 @@ int parse_numa(void *opaque, QemuOpts *opts, Error **=
errp)
>  end:
>      qapi_free_NumaOptions(object);
>      if (err) {
> -        error_report_err(err);
> +        error_propagate(errp, err);
>          return -1;
>      }
> =20
> @@ -444,9 +444,7 @@ void numa_complete_configuration(MachineState *ms)
> =20
>  void parse_numa_opts(MachineState *ms)
>  {
> -    if (qemu_opts_foreach(qemu_find_opts("numa"), parse_numa, ms, NULL))=
 {
> -        exit(1);
> -    }
> +    qemu_opts_foreach(qemu_find_opts("numa"), parse_numa, ms, &error_fat=
al);
>  }
> =20
>  void qmp_set_numa_node(NumaOptions *cmd, Error **errp)

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--PxDrs/Fpf4pPiewX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIyBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlvPPdsACgkQbDjKyiDZ
s5IY1w/3YTnxWHRx5ccKEb+uu2vnMVPNEVHA02E5QbkE5mQoLmOSDj1j6m567WIG
nI4UcdjRXYM249ZfYQSPlPPzBUtWx5EF0MSal7rriBe9aYD1eVkgJKHqCGykQIiy
MJXNGZJK3B/JJrEAkalfNUWb3H7KLexraAwwWwHJ0P9X/00Yv0ke6VrUyXo7LkD9
DWPS7DYIBdvSzybPN2Aw+GBF8onsiEhOdJsaaz/1xVaeQ+nishSN6M1Vl+8/180r
+Sle7HJHcf0mVB6pI1zAbk353E8Jl1q/faDvYeyh+GGu663Il2c5iRHYpDrndtEn
H0Y6N24eW5APDZKbZ/UV0tOxgYxxG2QvOz4fLLD6WjEP1XzmeCqUZhCACh2/loLz
cWVYjTnhxidPcWxSi52MmvYxRQ9tUjW4cmkzNMS2BRkPjqTKkAKmByezXTpoOaHm
6FiEACjrwcuY12mh5HFyD89McbVEGDw6S3PErn9kN6YzOaAzKTeO7HHJY/0PjHcD
4yqRL4bQY59J/DD8+lUeeiPWunWQw/2CS68Gw1e6EP+t2ucxDPyAa4cRC09FcNev
Mg2CwdCGKZHPIq1akSZ5vB5LGyFtM2HmUNntD7ntTlHBwE4A/zfEfkVR/i8SAXSs
dv/5LKCruK8o425kz7hPlmzUKqi9xD7dSsxB2vgQ2bGpovudKw==
=LZFT
-----END PGP SIGNATURE-----

--PxDrs/Fpf4pPiewX--
