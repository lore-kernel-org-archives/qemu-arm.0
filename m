Received: by 10.25.159.19 with SMTP id i19csp288532lfe;
        Mon, 11 Jan 2016 20:31:17 -0800 (PST)
X-Received: by 10.107.155.149 with SMTP id d143mr69599180ioe.118.1452573075100;
        Mon, 11 Jan 2016 20:31:15 -0800 (PST)
Return-Path: <dgibson@ozlabs.org>
Received: from ozlabs.org (ozlabs.org. [2401:3900:2:1::2])
        by mx.google.com with ESMTPS id w70si5519187iod.187.2016.01.11.20.31.14
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 11 Jan 2016 20:31:15 -0800 (PST)
Received-SPF: pass (google.com: domain of dgibson@ozlabs.org designates 2401:3900:2:1::2 as permitted sender) client-ip=2401:3900:2:1::2;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of dgibson@ozlabs.org designates 2401:3900:2:1::2 as permitted sender) smtp.mailfrom=dgibson@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1007)
	id 6677C1402EC; Tue, 12 Jan 2016 15:31:12 +1100 (AEDT)
Date: Tue, 12 Jan 2016 15:28:56 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Eric Auger <eric.auger@linaro.org>
Cc: eric.auger@st.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	peter.maydell@linaro.org, alex.williamson@redhat.com,
	alex.bennee@linaro.org, thuth@redhat.com,
	crosthwaitepeter@gmail.com, patches@linaro.org,
	christoffer.dall@linaro.org, pbonzini@redhat.com,
	b.reynal@virtualopensystems.com, suravee.suthikulpanit@amd.com,
	thomas.lendacky@amd.com
Subject: Re: [PATCH v2 3/7] device_tree: introduce qemu_fdt_node_path
Message-ID: <20160112042856.GQ22925@voom.redhat.com>
References: <1452093205-30167-1-git-send-email-eric.auger@linaro.org>
 <1452093205-30167-4-git-send-email-eric.auger@linaro.org>
 <20160111023853.GB22925@voom.redhat.com>
 <56938586.5050503@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="YttKMwf6abDJOSyE"
Content-Disposition: inline
In-Reply-To: <56938586.5050503@linaro.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-TUID: hJUkMmRHveNB


--YttKMwf6abDJOSyE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 11, 2016 at 11:35:50AM +0100, Eric Auger wrote:
> Hi David,
> On 01/11/2016 03:38 AM, David Gibson wrote:
> > On Wed, Jan 06, 2016 at 03:13:21PM +0000, Eric Auger wrote:
> >> This new helper routine returns the node path of a device
> >> referred to by its node name and compat string.
> >=20
> > What if there are multiple nodes matching the name and compat?
> The function would return the first one. I can improve the doc comment.
> Do you think it is a problem stopping at the first one? Is it a real
> life test case I have to handle here?

Well, I don't know of a specific system which will have this, but it's
absolutely possible to get this situation:  e.g. two different PCI
busses, both of which have their own slot 0 populated with different
instances of the same device.

Whether it's possible for platform devices will depend on the
platform's specific bus toplogies, but you certainly can't rule it out
in general.

I could consider adding a new libfdt function like
fdt_node_offset_by_compatible() that searches by name as well.  It's
just I'm not sure that matching by name and compatible isn't a sign of
a poor approach in the caller.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--YttKMwf6abDJOSyE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWlIEIAAoJEGw4ysog2bOSsj8P/2MoSbHfmx5g4MjQp/fWL84K
K8zF8thQjJ6K5UcDyQIo7CtjmO7lkXCI/aEltny/j7vbijRlVbRPyiFzyuVrI0Ft
SbQz0IhXc5aJUQitO1eNn6KRMxM6wk1ji6ID6kENjDn68hbNfqyOhzLes77gVOPG
cY+1EqvkdQ5dawz0rXDtUR3QEBAvEf990slI9UJiBY8m/ZpQKTEtrwzQ/Zk94MGP
HxRYCtwow4+wVnnLXq4jekgkXhjykFauW72HIe2NvihKplh2AvF5e7pj2NsVu7yA
usiY20Nf/QCMonLKz8IaUEm2OuAveDbwn+kDjIPNGVW9b/xgp++oGWGmnetW9IZq
f+i1DpThHWOvmp+pyZcXD/jUO5kIMH1XjJfPhjScNZD/x0ShCo305WvTuBLmJ7y3
EvShOvdmGmcd71x0IIqHAMtldJDUxfpUhjlsrMKhV2w6MJ2MTX6FkHw/V0+iXCti
93ySTgvYuG0iae8TAxuoZffiY0R5GbmJYZTfuM6hM7lEKodtyu6S4VEZdtDXqjO1
1Be0w/pDqvmZLbbZ7XWfUneQ+Tl6d3Z9KGib4kkCvgEEMQyVDIOa4MU1Vo6hUoJD
bQTiuVugXhXz4mdo/RFDLL5IuZU5SY7i4ll3xhh4wCfWgbckR51EVPCFJ2jYkrbX
IUlCvJR+jFkxugWPqpvm
=u6gS
-----END PGP SIGNATURE-----

--YttKMwf6abDJOSyE--
