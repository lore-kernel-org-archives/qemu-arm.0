Received: by 10.25.150.194 with SMTP id y185csp2483302lfd;
        Tue, 29 Nov 2016 10:09:31 -0800 (PST)
X-Received: by 10.55.185.133 with SMTP id j127mr24352733qkf.39.1480442971630;
        Tue, 29 Nov 2016 10:09:31 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c11si28111000qtb.224.2016.11.29.10.09.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 Nov 2016 10:09:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:38601 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cBmqQ-0003iS-C4
	for alex.bennee@linaro.org; Tue, 29 Nov 2016 13:09:30 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55838)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1cBmpF-0003E7-Sv
	for qemu-devel@nongnu.org; Tue, 29 Nov 2016 13:08:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1cBmpE-0004Kf-Nj
	for qemu-devel@nongnu.org; Tue, 29 Nov 2016 13:08:17 -0500
Received: from mx1.redhat.com ([209.132.183.28]:36974)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kwolf@redhat.com>)
	id 1cBmp7-0004Hz-9K; Tue, 29 Nov 2016 13:08:09 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C4CBCC04B920;
	Tue, 29 Nov 2016 18:08:06 +0000 (UTC)
Received: from noname.redhat.com (ovpn-116-80.ams2.redhat.com [10.36.116.80])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id uATI84d2024441; Tue, 29 Nov 2016 13:08:04 -0500
Date: Tue, 29 Nov 2016 19:08:03 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Message-ID: <20161129180803.GC7080@noname.redhat.com>
References: <1480434248-27138-1-git-send-email-clg@kaod.org>
	<1480434248-27138-26-git-send-email-clg@kaod.org>
	<921d5257-fff3-5cde-3da2-b58c94e5c792@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <921d5257-fff3-5cde-3da2-b58c94e5c792@kaod.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Tue, 29 Nov 2016 18:08:07 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH for-2.9 25/30] block: add a model option
 for MTD devices
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
	Qemu-block <qemu-block@nongnu.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Andrew Jeffery <andrew@aj.id.au>,
	Marcin Krzeminski <marcin.krzeminski@nokia.com>,
	qemu-devel@nongnu.org, armbru@redhat.com, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4r+o7D99+wbM

Am 29.11.2016 um 18:30 hat C=E9dric Le Goater geschrieben:
> On 11/29/2016 04:44 PM, C=E9dric Le Goater wrote:
> > This could be used to define the flash model to use on some boards
> > definitions.
>=20
> As this patch was part of a larger set, I did not send the whole=20
> set to qemu-block@ list. Could you please take a look at the proposal ?=
=20

This is a device level option rather than a block backend one. We messed
up -drive in its early days by including some device options, but we
don't generally want to add to this.

The correct way would be to add a qdev property for this and specify it
with -device or -global.

Kevin

> > Signed-off-by: C=E9dric Le Goater <clg@kaod.org>
> > Reviewed-by: Joel Stanley <joel@jms.id.au>
> > ---
> >  blockdev.c                | 12 ++++++++++++
> >  include/sysemu/blockdev.h |  1 +
> >  qemu-options.hx           |  4 +++-
> >  3 files changed, 16 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/blockdev.c b/blockdev.c
> > index 245e1e1d177a..bcc99365b86c 100644
> > --- a/blockdev.c
> > +++ b/blockdev.c
> > @@ -742,6 +742,10 @@ QemuOptsList qemu_legacy_drive_opts =3D {
> >              .type =3D QEMU_OPT_STRING,
> >              .help =3D "pci address (virtio only)",
> >          },{
> > +            .name =3D "model",
> > +            .type =3D QEMU_OPT_STRING,
> > +            .help =3D "flash model (mtd only)",
> > +        },{
> >              .name =3D "serial",
> >              .type =3D QEMU_OPT_STRING,
> >              .help =3D "disk serial number",
> > @@ -790,6 +794,7 @@ DriveInfo *drive_new(QemuOpts *all_opts, BlockInt=
erfaceType block_default_type)
> >      bool read_only =3D false;
> >      bool copy_on_read;
> >      const char *serial;
> > +    const char *model;
> >      const char *filename;
> >      Error *local_err =3D NULL;
> >      int i;
> > @@ -1076,6 +1081,12 @@ DriveInfo *drive_new(QemuOpts *all_opts, Block=
InterfaceType block_default_type)
> >          qdict_put(bs_opts, "rerror", qstring_from_str(rerror));
> >      }
> > =20
> > +    model =3D qemu_opt_get(legacy_opts, "model");
> > +    if (model && type !=3D IF_MTD) {
> > +        error_report("model is not supported by this bus type");
> > +        goto fail;
> > +    }
> > +
> >      /* Actual block device init: Functionality shared with blockdev-=
add */
> >      blk =3D blockdev_init(filename, bs_opts, &local_err);
> >      bs_opts =3D NULL;
> > @@ -1102,6 +1113,7 @@ DriveInfo *drive_new(QemuOpts *all_opts, BlockI=
nterfaceType block_default_type)
> >      dinfo->unit =3D unit_id;
> >      dinfo->devaddr =3D devaddr;
> >      dinfo->serial =3D g_strdup(serial);
> > +    dinfo->model =3D g_strdup(model);
> > =20
> >      blk_set_legacy_dinfo(blk, dinfo);
> > =20
> > diff --git a/include/sysemu/blockdev.h b/include/sysemu/blockdev.h
> > index 16432f350805..10c66e5e86a4 100644
> > --- a/include/sysemu/blockdev.h
> > +++ b/include/sysemu/blockdev.h
> > @@ -39,6 +39,7 @@ struct DriveInfo {
> >      int cyls, heads, secs, trans;
> >      QemuOpts *opts;
> >      char *serial;
> > +    char *model;
> >      QTAILQ_ENTRY(DriveInfo) next;
> >  };
> > =20
> > diff --git a/qemu-options.hx b/qemu-options.hx
> > index 4a5b29f349f7..16add85bd0f5 100644
> > --- a/qemu-options.hx
> > +++ b/qemu-options.hx
> > @@ -517,7 +517,7 @@ DEF("drive", HAS_ARG, QEMU_OPTION_drive,
> >      "-drive [file=3Dfile][,if=3Dtype][,bus=3Dn][,unit=3Dm][,media=3D=
d][,index=3Di]\n"
> >      "       [,cyls=3Dc,heads=3Dh,secs=3Ds[,trans=3Dt]][,snapshot=3Do=
n|off]\n"
> >      "       [,cache=3Dwritethrough|writeback|none|directsync|unsafe]=
[,format=3Df]\n"
> > -    "       [,serial=3Ds][,addr=3DA][,rerror=3Dignore|stop|report]\n=
"
> > +    "       [,serial=3Ds][,model=3Dm][,addr=3DA][,rerror=3Dignore|st=
op|report]\n"
> >      "       [,werror=3Dignore|stop|report|enospc][,id=3Dname][,aio=3D=
threads|native]\n"
> >      "       [,readonly=3Don|off][,copy-on-read=3Don|off]\n"
> >      "       [,discard=3Dignore|unmap][,detect-zeroes=3Don|off|unmap]=
\n"
> > @@ -570,6 +570,8 @@ the format.  Can be used to specify format=3Draw =
to avoid interpreting
> >  an untrusted format header.
> >  @item serial=3D@var{serial}
> >  This option specifies the serial number to assign to the device.
> > +@item model=3D@var{model}
> > +This option specifies the model to use to create a flash device (if=3D=
mtd only).
> >  @item addr=3D@var{addr}
> >  Specify the controller's PCI address (if=3Dvirtio only).
> >  @item werror=3D@var{action},rerror=3D@var{action}
> >=20
>=20
