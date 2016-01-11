Received: by 10.25.134.130 with SMTP id i124csp1750839lfd;
        Sun, 10 Jan 2016 20:36:56 -0800 (PST)
X-Received: by 10.50.13.74 with SMTP id f10mr9311388igc.63.1452487014538;
        Sun, 10 Jan 2016 20:36:54 -0800 (PST)
Return-Path: <dgibson@ozlabs.org>
Received: from ozlabs.org (ozlabs.org. [2401:3900:2:1::2])
        by mx.google.com with ESMTPS id v15si21580643igd.22.2016.01.10.20.36.53
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 10 Jan 2016 20:36:54 -0800 (PST)
Received-SPF: pass (google.com: domain of dgibson@ozlabs.org designates 2401:3900:2:1::2 as permitted sender) client-ip=2401:3900:2:1::2;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of dgibson@ozlabs.org designates 2401:3900:2:1::2 as permitted sender) smtp.mailfrom=dgibson@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1007)
	id 1EB491402D9; Mon, 11 Jan 2016 15:36:49 +1100 (AEDT)
Date: Mon, 11 Jan 2016 13:38:53 +1100
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
Message-ID: <20160111023853.GB22925@voom.redhat.com>
References: <1452093205-30167-1-git-send-email-eric.auger@linaro.org>
 <1452093205-30167-4-git-send-email-eric.auger@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="E39vaYmALEf/7YXx"
Content-Disposition: inline
In-Reply-To: <1452093205-30167-4-git-send-email-eric.auger@linaro.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-TUID: VzWRP6UOfUVq


--E39vaYmALEf/7YXx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 06, 2016 at 03:13:21PM +0000, Eric Auger wrote:
> This new helper routine returns the node path of a device
> referred to by its node name and compat string.

What if there are multiple nodes matching the name and compat?

>=20
> Signed-off-by: Eric Auger <eric.auger@linaro.org>
>=20
> ---
>=20
> v1 -> v2:
> - move doc comment in header file
> - do not use a fixed size buffer
> - break on errors in while loop
> - use strcmp instead of strncmp
>=20
> RFC -> v1:
> - improve error handling according to Alex' comments
> ---
>  device_tree.c                | 37 +++++++++++++++++++++++++++++++++++++
>  include/sysemu/device_tree.h | 14 ++++++++++++++
>  2 files changed, 51 insertions(+)
>=20
> diff --git a/device_tree.c b/device_tree.c
> index b262c2d..8441e01 100644
> --- a/device_tree.c
> +++ b/device_tree.c
> @@ -231,6 +231,43 @@ static int findnode_nofail(void *fdt, const char *no=
de_path)
>      return offset;
>  }
> =20
> +int qemu_fdt_node_path(void *fdt, const char *name, char *compat,
> +                       char **node_path)
> +{
> +    int offset, len, ret;
> +    const char *iter_name;
> +    unsigned int path_len =3D 16;
> +    char *path;
> +
> +    *node_path =3D NULL;
> +    offset =3D fdt_node_offset_by_compatible(fdt, -1, compat);
> +
> +    while (offset >=3D 0) {
> +        iter_name =3D fdt_get_name(fdt, offset, &len);
> +        if (!iter_name) {
> +            offset =3D len;
> +            break;
> +        }
> +        if (!strcmp(iter_name, name)) {
> +            goto found;
> +        }
> +        offset =3D fdt_node_offset_by_compatible(fdt, offset, compat);
> +    }
> +    return offset;
> +
> +found:
> +    path =3D g_malloc(path_len);
> +    while ((ret =3D fdt_get_path(fdt, offset, path, path_len))
> +            =3D=3D -FDT_ERR_NOSPACE) {
> +        path_len +=3D 16;
> +        path =3D g_realloc(path, path_len);
> +    }
> +    if (!ret) {
> +        *node_path =3D path;
> +    }
> +    return ret;
> +}
> +
>  int qemu_fdt_setprop(void *fdt, const char *node_path,
>                       const char *property, const void *val, int size)
>  {
> diff --git a/include/sysemu/device_tree.h b/include/sysemu/device_tree.h
> index fdf25a4..269cb1c 100644
> --- a/include/sysemu/device_tree.h
> +++ b/include/sysemu/device_tree.h
> @@ -20,6 +20,20 @@ void *load_device_tree(const char *filename_path, int =
*sizep);
>  void *load_device_tree_from_sysfs(void);
>  #endif
> =20
> +/**
> + * qemu_fdt_node_path: return the node path of a device, given its
> + * node name and its compat string
> + * @fdt: pointer to the dt blob
> + * @name: device node name
> + * @compat: compatibility string of the device
> + * @node_path: returned node path
> + *
> + * upon success, the path is output at node_path address
> + * returns 0 on success, < 0 on failure
> + */
> +int qemu_fdt_node_path(void *fdt, const char *name, char *compat,
> +                       char **node_path);
> +
>  int qemu_fdt_setprop(void *fdt, const char *node_path,
>                       const char *property, const void *val, int size);
>  int qemu_fdt_setprop_cell(void *fdt, const char *node_path,

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--E39vaYmALEf/7YXx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWkxW8AAoJEGw4ysog2bOSLxIP/1B8z/hOXOl1Tecj5WfwOe1A
0spJI6gA5OdWHydKAv/tXbZjnG0OxBEvyPUcPS8iIbxV8CbSQ6c1tENTRgLVjCPA
aRJGDp8nqRFN1EJp43dvMqu6r1pbrw7bSd/3DU91OoKVg0tzWz7HQ8lJad+/aX1I
UNlC9j/Kw7XH+xDyMhskkYHY+wX5LZSmP1njDmoYhQPukXFMY+9c09Bq6/5Pz1GL
PK4hUvgwCh6OiKuAZWcBe1U01tccJYrT++a3DHv2Kp1XeoiVQV4HUS8x01H0emcu
8HhEPfijLOEW2eW6TIunVBKr+oXqdq17CmHomBWzK3C76GMp7uycpnKIJW45Ccdz
vN10hGN0ox57NM7xG9vI2NenzKosN+53iRc37NDzYK8tfrMAx3nyQjtcLc8wKovo
FEgepEz2d6i+VnNOHgGOvbax3FQUX4EJ2jpWLsRsIHZG5ukH/41zDqlNcdE6eyAz
Mg4wn0Kp8gPwYpPVViiN4uLX+WZzUy7bIHTQ7sCeoenHPIKtpIdnC6PA1l8/HJEN
sYkC7NF2jRAps4dHjzWqFZZQPUk10/jByu8/fXp6IAN+7jI679x/hqpuazuds22R
tZZNm7mvsIB7D57mP86Rnoouoz8F7R8N1vhP5mrZqU+fk+oxp6pxYtwxXZ/+e5e1
oYxzS1wb6UZWssD75G6j
=6gFD
-----END PGP SIGNATURE-----

--E39vaYmALEf/7YXx--
