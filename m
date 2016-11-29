Received: by 10.25.150.194 with SMTP id y185csp2465167lfd;
        Tue, 29 Nov 2016 09:31:19 -0800 (PST)
X-Received: by 10.55.52.7 with SMTP id b7mr24888385qka.223.1480440679037;
        Tue, 29 Nov 2016 09:31:19 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l126si35454486qkd.76.2016.11.29.09.31.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 Nov 2016 09:31:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:38395 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cBmFR-0003u7-NI
	for alex.bennee@linaro.org; Tue, 29 Nov 2016 12:31:17 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43566)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1cBmFN-0003ts-Da
	for qemu-arm@nongnu.org; Tue, 29 Nov 2016 12:31:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1cBmFI-00061E-EC
	for qemu-arm@nongnu.org; Tue, 29 Nov 2016 12:31:13 -0500
Received: from 2.mo69.mail-out.ovh.net ([178.33.251.80]:56842)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1cBmFI-00060i-8g
	for qemu-arm@nongnu.org; Tue, 29 Nov 2016 12:31:08 -0500
Received: from player699.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo69.mail-out.ovh.net (Postfix) with ESMTP id C522BCBD0
	for <qemu-arm@nongnu.org>; Tue, 29 Nov 2016 18:31:06 +0100 (CET)
Received: from hermes.kaod.org (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
	[90.76.55.107]) (Authenticated sender: postmaster@kaod.org)
	by player699.ha.ovh.net (Postfix) with ESMTPSA id 7D39C24006C;
	Tue, 29 Nov 2016 18:30:58 +0100 (CET)
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
References: <1480434248-27138-1-git-send-email-clg@kaod.org>
	<1480434248-27138-26-git-send-email-clg@kaod.org>
Message-ID: <921d5257-fff3-5cde-3da2-b58c94e5c792@kaod.org>
Date: Tue, 29 Nov 2016 18:30:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1480434248-27138-26-git-send-email-clg@kaod.org>
Content-Type: text/plain; charset=utf-8
X-Ovh-Tracer-Id: 13500102836617448443
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelfedrfeejgddvfeduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 178.33.251.80
Subject: Re: [Qemu-arm] [PATCH for-2.9 25/30] block: add a model option for
 MTD devices
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
Cc: Kevin Wolf <kwolf@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
	Andrew Jeffery <andrew@aj.id.au>,
	Marcin Krzeminski <marcin.krzeminski@nokia.com>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gaEyb6bVLAfV

On 11/29/2016 04:44 PM, C=C3=A9dric Le Goater wrote:
> This could be used to define the flash model to use on some boards
> definitions.

As this patch was part of a larger set, I did not send the whole=20
set to qemu-block@ list. Could you please take a look at the proposal ?=20

Thanks,

C.


> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> Reviewed-by: Joel Stanley <joel@jms.id.au>
> ---
>  blockdev.c                | 12 ++++++++++++
>  include/sysemu/blockdev.h |  1 +
>  qemu-options.hx           |  4 +++-
>  3 files changed, 16 insertions(+), 1 deletion(-)
>=20
> diff --git a/blockdev.c b/blockdev.c
> index 245e1e1d177a..bcc99365b86c 100644
> --- a/blockdev.c
> +++ b/blockdev.c
> @@ -742,6 +742,10 @@ QemuOptsList qemu_legacy_drive_opts =3D {
>              .type =3D QEMU_OPT_STRING,
>              .help =3D "pci address (virtio only)",
>          },{
> +            .name =3D "model",
> +            .type =3D QEMU_OPT_STRING,
> +            .help =3D "flash model (mtd only)",
> +        },{
>              .name =3D "serial",
>              .type =3D QEMU_OPT_STRING,
>              .help =3D "disk serial number",
> @@ -790,6 +794,7 @@ DriveInfo *drive_new(QemuOpts *all_opts, BlockInter=
faceType block_default_type)
>      bool read_only =3D false;
>      bool copy_on_read;
>      const char *serial;
> +    const char *model;
>      const char *filename;
>      Error *local_err =3D NULL;
>      int i;
> @@ -1076,6 +1081,12 @@ DriveInfo *drive_new(QemuOpts *all_opts, BlockIn=
terfaceType block_default_type)
>          qdict_put(bs_opts, "rerror", qstring_from_str(rerror));
>      }
> =20
> +    model =3D qemu_opt_get(legacy_opts, "model");
> +    if (model && type !=3D IF_MTD) {
> +        error_report("model is not supported by this bus type");
> +        goto fail;
> +    }
> +
>      /* Actual block device init: Functionality shared with blockdev-ad=
d */
>      blk =3D blockdev_init(filename, bs_opts, &local_err);
>      bs_opts =3D NULL;
> @@ -1102,6 +1113,7 @@ DriveInfo *drive_new(QemuOpts *all_opts, BlockInt=
erfaceType block_default_type)
>      dinfo->unit =3D unit_id;
>      dinfo->devaddr =3D devaddr;
>      dinfo->serial =3D g_strdup(serial);
> +    dinfo->model =3D g_strdup(model);
> =20
>      blk_set_legacy_dinfo(blk, dinfo);
> =20
> diff --git a/include/sysemu/blockdev.h b/include/sysemu/blockdev.h
> index 16432f350805..10c66e5e86a4 100644
> --- a/include/sysemu/blockdev.h
> +++ b/include/sysemu/blockdev.h
> @@ -39,6 +39,7 @@ struct DriveInfo {
>      int cyls, heads, secs, trans;
>      QemuOpts *opts;
>      char *serial;
> +    char *model;
>      QTAILQ_ENTRY(DriveInfo) next;
>  };
> =20
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 4a5b29f349f7..16add85bd0f5 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -517,7 +517,7 @@ DEF("drive", HAS_ARG, QEMU_OPTION_drive,
>      "-drive [file=3Dfile][,if=3Dtype][,bus=3Dn][,unit=3Dm][,media=3Dd]=
[,index=3Di]\n"
>      "       [,cyls=3Dc,heads=3Dh,secs=3Ds[,trans=3Dt]][,snapshot=3Don|=
off]\n"
>      "       [,cache=3Dwritethrough|writeback|none|directsync|unsafe][,=
format=3Df]\n"
> -    "       [,serial=3Ds][,addr=3DA][,rerror=3Dignore|stop|report]\n"
> +    "       [,serial=3Ds][,model=3Dm][,addr=3DA][,rerror=3Dignore|stop=
|report]\n"
>      "       [,werror=3Dignore|stop|report|enospc][,id=3Dname][,aio=3Dt=
hreads|native]\n"
>      "       [,readonly=3Don|off][,copy-on-read=3Don|off]\n"
>      "       [,discard=3Dignore|unmap][,detect-zeroes=3Don|off|unmap]\n=
"
> @@ -570,6 +570,8 @@ the format.  Can be used to specify format=3Draw to=
 avoid interpreting
>  an untrusted format header.
>  @item serial=3D@var{serial}
>  This option specifies the serial number to assign to the device.
> +@item model=3D@var{model}
> +This option specifies the model to use to create a flash device (if=3D=
mtd only).
>  @item addr=3D@var{addr}
>  Specify the controller's PCI address (if=3Dvirtio only).
>  @item werror=3D@var{action},rerror=3D@var{action}
>=20

