Received: by 10.25.134.130 with SMTP id i124csp1750883lfd;
        Sun, 10 Jan 2016 20:37:03 -0800 (PST)
X-Received: by 10.50.156.103 with SMTP id wd7mr10663288igb.5.1452487014696;
        Sun, 10 Jan 2016 20:36:54 -0800 (PST)
Return-Path: <dgibson@ozlabs.org>
Received: from ozlabs.org (ozlabs.org. [103.22.144.67])
        by mx.google.com with ESMTPS id 73si24276497ion.23.2016.01.10.20.36.53
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 10 Jan 2016 20:36:54 -0800 (PST)
Received-SPF: pass (google.com: domain of dgibson@ozlabs.org designates 103.22.144.67 as permitted sender) client-ip=103.22.144.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of dgibson@ozlabs.org designates 103.22.144.67 as permitted sender) smtp.mailfrom=dgibson@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1007)
	id 2D1D8140320; Mon, 11 Jan 2016 15:36:49 +1100 (AEDT)
Date: Mon, 11 Jan 2016 13:41:11 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Eric Auger <eric.auger@linaro.org>
Cc: eric.auger@st.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	peter.maydell@linaro.org, alex.williamson@redhat.com,
	alex.bennee@linaro.org, thuth@redhat.com,
	crosthwaitepeter@gmail.com, patches@linaro.org,
	christoffer.dall@linaro.org, pbonzini@redhat.com,
	b.reynal@virtualopensystems.com, suravee.suthikulpanit@amd.com,
	thomas.lendacky@amd.com
Subject: Re: [PATCH v2 5/7] hw/arm/sysbus-fdt: helpers for clock node
 generation
Message-ID: <20160111024111.GC22925@voom.redhat.com>
References: <1452093205-30167-1-git-send-email-eric.auger@linaro.org>
 <1452093205-30167-6-git-send-email-eric.auger@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="c3bfwLpm8qysLVxt"
Content-Disposition: inline
In-Reply-To: <1452093205-30167-6-git-send-email-eric.auger@linaro.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-TUID: UFahvhflMCay


--c3bfwLpm8qysLVxt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 06, 2016 at 03:13:23PM +0000, Eric Auger wrote:
> Some passthrough'ed devices depend on clock nodes. Those need to be
> generated in the guest device tree. This patch introduces some helpers
> to build a clock node from information retrieved in the host device tree.
>=20
> - inherit_properties copies properties from a host device tree node to
>   a guest device tree node

I dislike the name, since the first thing I think when I see "inherit"
is that it's about a node inheriting a property from an ancestor node,
not the guest inheriting properties from the host.  Maybe
"passthrough_properties()"?

> - fdt_build_clock_node builds a guest clock node and checks the host
>   fellow clock is a fixed one.
>=20
> fdt_build_clock_node will become static as soon as it gets used. A
> dummy pre-declaration is needed for compilation of this patch.
>=20
> Signed-off-by: Eric Auger <eric.auger@linaro.org>
>=20
> ---
>=20
> v1 -> v2:
> - inherit properties now outputs an error message in case
>   qemu_fdt_getprop fails for an existing optional property
> - no hardcoded fixed buffer length
> - fdt_build_clock_node becomes void and auto-asserts on error
> - use boolean values when defining the clock properties
>=20
> RFC -> v1:
> - use the new proto of qemu_fdt_getprop
> - remove newline in error_report
> - fix some style issues
> ---
>  hw/arm/sysbus-fdt.c | 120 ++++++++++++++++++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 120 insertions(+)
>=20
> diff --git a/hw/arm/sysbus-fdt.c b/hw/arm/sysbus-fdt.c
> index 9d28797..a1cf57b 100644
> --- a/hw/arm/sysbus-fdt.c
> +++ b/hw/arm/sysbus-fdt.c
> @@ -21,6 +21,7 @@
>   *
>   */
> =20
> +#include <libfdt.h>
>  #include "hw/arm/sysbus-fdt.h"
>  #include "qemu/error-report.h"
>  #include "sysemu/device_tree.h"
> @@ -56,6 +57,125 @@ typedef struct NodeCreationPair {
>      int (*add_fdt_node_fn)(SysBusDevice *sbdev, void *opaque);
>  } NodeCreationPair;
> =20
> +/* helpers */
> +
> +typedef struct HostProperty {
> +    const char *name;
> +    bool optional;
> +} HostProperty;
> +
> +/**
> + * inherit_properties
> + *
> + * copies properties listed in an array from host device tree to
> + * guest device tree. If a non optional property is not found, the
> + * function self-asserts. An optional property is ignored if not found
> + * in the host device tree.
> + * @props: array of HostProperty to copy
> + * @nb_props: number of properties in the array
> + * @host_dt: host device tree blob
> + * @guest_dt: guest device tree blob
> + * @node_path: host dt node path where the property is supposed to be
> +              found
> + * @nodename: guest node name the properties should be added to
> + */
> +static void inherit_properties(HostProperty *props, int nb_props,
> +                               void *host_fdt, void *guest_fdt,
> +                               char *node_path, char *nodename)
> +{
> +    int i, prop_len;
> +    const void *r;
> +    Error *err =3D NULL;
> +
> +    for (i =3D 0; i < nb_props; i++) {
> +        r =3D qemu_fdt_getprop(host_fdt, node_path,
> +                             props[i].name,
> +                             &prop_len,
> +                             props[i].optional ? &err : &error_fatal);
> +        if (r) {
> +            qemu_fdt_setprop(guest_fdt, nodename,
> +                             props[i].name, r, prop_len);
> +        } else {
> +            if (prop_len !=3D -FDT_ERR_NOTFOUND) {
> +                /* optional property not returned although property exis=
ts */
> +                error_report_err(err);
> +            } else {
> +                error_free(err);
> +            }
> +        }
> +    }
> +}
> +
> +/* clock properties whose values are copied/pasted from host */
> +static HostProperty clock_inherited_properties[] =3D {
> +    {"compatible", false},
> +    {"#clock-cells", false},
> +    {"clock-frequency", true},
> +    {"clock-output-names", true},
> +};
> +
> +/**
> + * fdt_build_clock_node
> + *
> + * Build a guest clock node, used as a dependency from a passthrough'ed
> + * device. Most information are retrieved from the host clock node.
> + * Also check the host clock is a fixed one.
> + *
> + * @host_fdt: host device tree blob from which info are retrieved
> + * @guest_fdt: guest device tree blob where the clock node is added
> + * @host_phandle: phandle of the clock in host device tree
> + * @guest_phandle: phandle to assign to the guest node
> + */
> +void fdt_build_clock_node(void *host_fdt, void *guest_fdt,
> +                         uint32_t host_phandle,
> +                         uint32_t guest_phandle);
> +void fdt_build_clock_node(void *host_fdt, void *guest_fdt,
> +                         uint32_t host_phandle,
> +                         uint32_t guest_phandle)
> +{
> +    char *node_path =3D NULL;
> +    char *nodename;
> +    const void *r;
> +    int ret, node_offset, prop_len, path_len =3D 16;
> +
> +    node_offset =3D fdt_node_offset_by_phandle(host_fdt, host_phandle);
> +    if (node_offset <=3D 0) {
> +        error_setg(&error_fatal,
> +                   "not able to locate clock handle %d in host device tr=
ee",
> +                   host_phandle);
> +    }
> +    node_path =3D g_malloc(path_len);
> +    while ((ret =3D fdt_get_path(host_fdt, node_offset, node_path, path_=
len))
> +            =3D=3D -FDT_ERR_NOSPACE) {
> +        path_len +=3D 16;
> +        node_path =3D g_realloc(node_path, path_len);
> +    }
> +    if (ret < 0) {
> +        error_setg(&error_fatal,
> +                   "not able to retrieve node path for clock handle %d",
> +                   host_phandle);
> +    }
> +
> +    r =3D qemu_fdt_getprop(host_fdt, node_path, "compatible", &prop_len,
> +                         &error_fatal);
> +    if (strcmp(r, "fixed-clock")) {
> +        error_setg(&error_fatal,
> +                   "clock handle %d is not a fixed clock", host_phandle);
> +    }
> +
> +    nodename =3D strrchr(node_path, '/');
> +    qemu_fdt_add_subnode(guest_fdt, nodename);
> +
> +    inherit_properties(clock_inherited_properties,
> +                       ARRAY_SIZE(clock_inherited_properties),
> +                       host_fdt, guest_fdt,
> +                       node_path, nodename);
> +
> +    qemu_fdt_setprop_cell(guest_fdt, nodename, "phandle", guest_phandle);
> +
> +    g_free(node_path);
> +}
> +
>  /* Device Specific Code */
> =20
>  /**

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--c3bfwLpm8qysLVxt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWkxZHAAoJEGw4ysog2bOSSYsQAJIqBBYlTJWc0AJH6dRoCiLP
k53qJqBiz1b4K4EoQ4OK4429Uv3cGbbSszC9CW0/HQB6tfiTV+gQTjodmfp+C4/J
uOE78LrbHKKAuS77nr+SwmbChhNalnA/h/uOgY7cQeg4UtS/wqGAmcONywOgVHt7
YXBpUOCigw5bMrWScN27XxPccJRuTTVJelwCyZ0nHWprULjjPUwboEPWD23ZaclL
EN3+IUiMtFVxmU85pNJeT9+wB+z8L+PCJV21qYsusi8Lc2goWbYCTZsGIuZQwvK7
iw2mAgvZr0ZwI9GZsR8BrdSwNWF8RA2m1pMVeROWBBTvRUTzNJIetJti/WejaEcP
/YIXdohykeFm2oW3BFE0T/rCVJVNRqveYEu8jOGXJ4kN8nBo+mlc+dbZqDKII1oP
9klJ+feXzmuAs+wOtazdzqpl7nT86AszJz0gXjYCo2/aVV5RNt/JNuimkphffqym
UXqqRUsBx0/DF3q0FUpDz74oX9dU1FN1wyD5IyILc2NLfWtAnTUmH6IDgGtr3osj
P05mYVHahkYIAai4ygHa0dYmGYPqNz5c+LjL7ORWPpPSEkcTTk47rdB/XHHv++nI
0gxcWhpGCoUAbLYbSYdU1uYFb53UKBvAG8qqfyA7All3XQ1v/kD+dOLreXkkyedF
do9pep4K3g8rGuEjSgY4
=qPcd
-----END PGP SIGNATURE-----

--c3bfwLpm8qysLVxt--
