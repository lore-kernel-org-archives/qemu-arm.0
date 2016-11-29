Received: by 10.25.150.194 with SMTP id y185csp2495398lfd;
        Tue, 29 Nov 2016 10:34:45 -0800 (PST)
X-Received: by 10.200.57.71 with SMTP id t7mr27890178qtb.59.1480444485356;
        Tue, 29 Nov 2016 10:34:45 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h194si35570695qke.263.2016.11.29.10.34.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 Nov 2016 10:34:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:38714 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cBnEq-0002NP-3m
	for alex.bennee@linaro.org; Tue, 29 Nov 2016 13:34:44 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37488)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1cBnEj-0002Mc-MS
	for qemu-arm@nongnu.org; Tue, 29 Nov 2016 13:34:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1cBnEg-0006i0-J6
	for qemu-arm@nongnu.org; Tue, 29 Nov 2016 13:34:37 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:48413
	helo=mx0a-001b2d01.pphosted.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1cBnEg-0006hZ-3g
	for qemu-arm@nongnu.org; Tue, 29 Nov 2016 13:34:34 -0500
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id
	uATIYOWT027844
	for <qemu-arm@nongnu.org>; Tue, 29 Nov 2016 13:34:32 -0500
Received: from e06smtp06.uk.ibm.com (e06smtp06.uk.ibm.com [195.75.94.102])
	by mx0b-001b2d01.pphosted.com with ESMTP id 271f1v03sb-1
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
	for <qemu-arm@nongnu.org>; Tue, 29 Nov 2016 13:34:32 -0500
Received: from localhost
	by e06smtp06.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-arm@nongnu.org> from <clg@kaod.org>;
	Tue, 29 Nov 2016 18:34:27 -0000
Received: from d06dlp02.portsmouth.uk.ibm.com (9.149.20.14)
	by e06smtp06.uk.ibm.com (192.168.101.136) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Tue, 29 Nov 2016 18:34:24 -0000
Received: from b06cxnps4076.portsmouth.uk.ibm.com
	(d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
	by d06dlp02.portsmouth.uk.ibm.com (Postfix) with ESMTP id 1EAE3414008C; 
	Tue, 29 Nov 2016 16:17:11 +0000 (GMT)
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
	[9.149.105.232])
	by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id uATGHx0w34078898; Tue, 29 Nov 2016 16:17:59 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EEF68520BB;
	Tue, 29 Nov 2016 15:16:43 +0000 (GMT)
Received: from smtp.lab.toulouse-stg.fr.ibm.com (unknown [9.101.4.1])
	by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id C429B520E1;
	Tue, 29 Nov 2016 15:16:43 +0000 (GMT)
Received: from hermes.kaod.org (hermes.lab.toulouse-stg.fr.ibm.com
	[9.101.4.42])
	by smtp.lab.toulouse-stg.fr.ibm.com (Postfix) with ESMTP id 195BE220106;
	Tue, 29 Nov 2016 17:06:38 +0100 (CET)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1480434248-27138-1-git-send-email-clg@kaod.org>
	<1480434248-27138-26-git-send-email-clg@kaod.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Date: Tue, 29 Nov 2016 17:06:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1480434248-27138-26-git-send-email-clg@kaod.org>
Content-Type: text/plain; charset=utf-8
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16112918-0024-0000-0000-0000026703DD
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16112918-0025-0000-0000-0000217005B9
Message-Id: <416be5d9-f87b-7104-e8d5-5086786f8bfd@kaod.org>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-11-29_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	spamscore=0 suspectscore=2
	malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
	adjust=0 reason=mlx scancount=1 engine=8.0.1-1609300000
	definitions=main-1611290308
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
	mx0b-001b2d01.pphosted.com id uATIYOWT027844
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 148.163.158.5
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
X-TUID: C086h8mujx3k

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

