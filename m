Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp1968064wrq;
        Thu, 21 Jun 2018 06:03:01 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKLHqy3Pz0fdFyPw7ErXdRmkZn1tkx9hg6EKCQepSzWSrte9CnDE8pphByN83wEiXyx7rMXX
X-Received: by 2002:a37:307:: with SMTP id 7-v6mr21673141qkd.317.1529586181773;
        Thu, 21 Jun 2018 06:03:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529586181; cv=none;
        d=google.com; s=arc-20160816;
        b=jfoXMFtu4N7OuN8tGWqmEKLD+UaW9nGSsYl8jJrT4e/WsGlYmMr+gGfk811F6aPFSn
         tggEisbQ5J/nx2ktAayOrqdX8b6Cq1m+8dnXbYy0oxw/RRclsenIMUU/zb6HvrVPbR8W
         SStnZwP4m/p63DcBNQtuMkTT23nUvkw67XiQv3ZY1P+ZokK7b6NK7ynddBwSEDYqo7EY
         jGC9ZRpt1AMDrcVMiVLODgaIZAkTVyLhfUkv4NqnuXKGCewIxU3cp9J6Aj+CU/sYwOa2
         rk5FxOlohEMYZWnXCg5qDPtp/7p1FZ55g68046m+xxrtDfmlRODpiBLY1HlJdFAsrLLG
         7wOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=Qy/82i0hbkRikSf9GyCKNmioJbWZR6bw95hwnuX8W6A=;
        b=GqZ5akZEMpW9+xGOzp4VVUs/wyJjQLcgXTtIrkkB1xIfyLdjUzWvKIuFJ0ztHYMtA4
         YEbXR+J79gAsOcNTaeuhp8YZCQO0Y/yBjTKOqLj5poCfPAAk/50ONRPRzlZMEWpyuig1
         luO5kH8g9/ekxmJcvt/dS1mwk5sJ6/Ne5tkyzbGANxgmJ+KkhOtTNTFKmz2QwC7wWEYR
         E6Y1GZbYRjjAWoksGBiXnalOmJ47z9ZXwKBWWTFKEm3wd7hqkpyNPeRcKo3i+UGLx3hR
         altbdDy6AVguWlXHzVZ9ZgDqkzKBwafu1RCYMOJilapKErmQVxt2GSkUOCj6BrPQZek1
         FE7g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l1-v6si2246349qkk.184.2018.06.21.06.03.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 21 Jun 2018 06:03:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55390 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fVzEr-0004B5-9m
	for alex.bennee@linaro.org; Thu, 21 Jun 2018 09:03:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60079)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fVzEV-00042t-N6
	for qemu-arm@nongnu.org; Thu, 21 Jun 2018 09:02:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fVzEP-0000li-5p
	for qemu-arm@nongnu.org; Thu, 21 Jun 2018 09:02:39 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:51206 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fVzEO-0000le-Vk; Thu, 21 Jun 2018 09:02:33 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 776188577C;
	Thu, 21 Jun 2018 13:02:32 +0000 (UTC)
Received: from localhost.localdomain (ovpn-117-106.ams2.redhat.com
	[10.36.117.106])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8A54351E4;
	Thu, 21 Jun 2018 13:02:31 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Markus Armbruster <armbru@redhat.com>
References: <20180621114015.9207-1-f4bug@amsat.org>
	<20180621114015.9207-3-f4bug@amsat.org>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <988a6d50-a911-6ac0-2955-0f99292d8a15@redhat.com>
Date: Thu, 21 Jun 2018 15:02:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20180621114015.9207-3-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Thu, 21 Jun 2018 13:02:32 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Thu, 21 Jun 2018 13:02:32 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3 2/3] hw/arm/sysbus-fdt:
 Replace error_setg(&error_fatal) by error_report() + exit()
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cRaagzdNr7j0

Hi Philippe,
On 06/21/2018 01:40 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> Use error_report() + exit() instead of error_setg(&error_fatal),
> as suggested by the "qapi/error.h" documentation:
>=20
>    Please don't error_setg(&error_fatal, ...), use error_report() and
>    exit(), because that's more obvious.
>=20
> This fixes CID 1352173:
>     "Passing null pointer dt_name to qemu_fdt_node_path, which derefere=
nces it."
>=20
> And this also fixes:
>=20
>     hw/arm/sysbus-fdt.c:322:9: warning: Array access (from variable 'no=
de_path') results in a null pointer dereference
>         if (node_path[1]) {
>             ^~~~~~~~~~~~
>=20
> Fixes: Coverity CID 1352173 (Dereference after null check)
> Suggested-by: Eric Blake <eblake@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Reviewed-by: Markus Armbruster <armbru@redhat.com>
> ---
>  hw/arm/sysbus-fdt.c | 45 ++++++++++++++++++++++++++-------------------
>  1 file changed, 26 insertions(+), 19 deletions(-)
>=20
> diff --git a/hw/arm/sysbus-fdt.c b/hw/arm/sysbus-fdt.c
> index 277ed872e7..63b74a353e 100644
> --- a/hw/arm/sysbus-fdt.c
> +++ b/hw/arm/sysbus-fdt.c
> @@ -92,7 +92,7 @@ static void copy_properties_from_host(HostProperty *p=
rops, int nb_props,
>          r =3D qemu_fdt_getprop(host_fdt, node_path,
>                               props[i].name,
>                               &prop_len,
> -                             props[i].optional ? &err : &error_fatal);
> +                             &err);
>          if (r) {
>              qemu_fdt_setprop(guest_fdt, nodename,
>                               props[i].name, r, prop_len);
> @@ -103,6 +103,10 @@ static void copy_properties_from_host(HostProperty=
 *props, int nb_props,
>              } else {
>                  error_free(err);
>              }
> +            if (!props[i].optional) {
> +                /* mandatory property not found: bail out */
> +                exit(1);
reading that code again, I am not sure this does the same thing as
before. In case case the property is tagged not optional and is not
found in the host dt, qemu_fdt_getprop will fill err with error_setg.
However prop_len =3D=3D -FDT_ERR_NOTFOUND so we are going to call error_f=
ree
and no trace will be output to the user. Before the
error_setg(&error_fatal) printed the cause of error error and exited. Do
I miss something?

Thanks

Eric
> +            }
>          }
>      }
>  }
> @@ -138,9 +142,9 @@ static void fdt_build_clock_node(void *host_fdt, vo=
id *guest_fdt,
> =20
>      node_offset =3D fdt_node_offset_by_phandle(host_fdt, host_phandle)=
;
>      if (node_offset <=3D 0) {
> -        error_setg(&error_fatal,
> -                   "not able to locate clock handle %d in host device =
tree",
> -                   host_phandle);
> +        error_report("not able to locate clock handle %d in host devic=
e tree",
> +                     host_phandle);
> +        exit(1);
>      }
>      node_path =3D g_malloc(path_len);
>      while ((ret =3D fdt_get_path(host_fdt, node_offset, node_path, pat=
h_len))
> @@ -149,16 +153,16 @@ static void fdt_build_clock_node(void *host_fdt, =
void *guest_fdt,
>          node_path =3D g_realloc(node_path, path_len);
>      }
>      if (ret < 0) {
> -        error_setg(&error_fatal,
> -                   "not able to retrieve node path for clock handle %d=
",
> -                   host_phandle);
> +        error_report("not able to retrieve node path for clock handle =
%d",
> +                     host_phandle);
> +        exit(1);
>      }
> =20
>      r =3D qemu_fdt_getprop(host_fdt, node_path, "compatible", &prop_le=
n,
>                           &error_fatal);
>      if (strcmp(r, "fixed-clock")) {
> -        error_setg(&error_fatal,
> -                   "clock handle %d is not a fixed clock", host_phandl=
e);
> +        error_report("clock handle %d is not a fixed clock", host_phan=
dle);
> +        exit(1);
>      }
> =20
>      nodename =3D strrchr(node_path, '/');
> @@ -301,34 +305,37 @@ static int add_amd_xgbe_fdt_node(SysBusDevice *sb=
dev, void *opaque)
> =20
>      dt_name =3D sysfs_to_dt_name(vbasedev->name);
>      if (!dt_name) {
> -        error_setg(&error_fatal, "%s incorrect sysfs device name %s",
> -                    __func__, vbasedev->name);
> +        error_report("%s incorrect sysfs device name %s",
> +                     __func__, vbasedev->name);
> +        exit(1);
>      }
>      node_path =3D qemu_fdt_node_path(host_fdt, dt_name, vdev->compat,
>                                     &error_fatal);
>      if (!node_path || !node_path[0]) {
> -        error_setg(&error_fatal, "%s unable to retrieve node path for =
%s/%s",
> -                   __func__, dt_name, vdev->compat);
> +        error_report("%s unable to retrieve node path for %s/%s",
> +                     __func__, dt_name, vdev->compat);
> +        exit(1);
>      }
> =20
>      if (node_path[1]) {
> -        error_setg(&error_fatal, "%s more than one node matching %s/%s=
!",
> -                   __func__, dt_name, vdev->compat);
> +        error_report("%s more than one node matching %s/%s!",
> +                     __func__, dt_name, vdev->compat);
> +        exit(1);
>      }
> =20
>      g_free(dt_name);
> =20
>      if (vbasedev->num_regions !=3D 5) {
> -        error_setg(&error_fatal, "%s Does the host dt node combine XGB=
E/PHY?",
> -                   __func__);
> +        error_report("%s Does the host dt node combine XGBE/PHY?", __f=
unc__);
> +        exit(1);
>      }
> =20
>      /* generate nodes for DMA_CLK and PTP_CLK */
>      r =3D qemu_fdt_getprop(host_fdt, node_path[0], "clocks",
>                           &prop_len, &error_fatal);
>      if (prop_len !=3D 8) {
> -        error_setg(&error_fatal, "%s clocks property should contain 2 =
handles",
> -                   __func__);
> +        error_report("%s clocks property should contain 2 handles", __=
func__);
> +        exit(1);
>      }
>      host_clock_phandles =3D (uint32_t *)r;
>      guest_clock_phandles[0] =3D qemu_fdt_alloc_phandle(guest_fdt);
>=20
