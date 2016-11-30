Received: by 10.25.159.131 with SMTP id i125csp337531lfe;
        Wed, 30 Nov 2016 07:12:54 -0800 (PST)
X-Received: by 10.200.57.55 with SMTP id s52mr2234480qtb.191.1480518774145;
        Wed, 30 Nov 2016 07:12:54 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 2si37875234qkb.172.2016.11.30.07.12.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 30 Nov 2016 07:12:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:44594 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cC6Z2-0002L5-QF
	for alex.bennee@linaro.org; Wed, 30 Nov 2016 10:12:52 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60611)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1cC6W0-0000Iv-8Z
	for qemu-devel@nongnu.org; Wed, 30 Nov 2016 10:09:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1cC6Vv-0006az-A4
	for qemu-devel@nongnu.org; Wed, 30 Nov 2016 10:09:44 -0500
Received: from 8.mo69.mail-out.ovh.net ([46.105.56.233]:46077)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1cC6Vv-0006Zu-1B
	for qemu-devel@nongnu.org; Wed, 30 Nov 2016 10:09:39 -0500
Received: from player699.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo69.mail-out.ovh.net (Postfix) with ESMTP id C91E69A33
	for <qemu-devel@nongnu.org>; Wed, 30 Nov 2016 16:09:35 +0100 (CET)
Received: from hermes.kaod.org (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
	[90.76.55.107]) (Authenticated sender: postmaster@kaod.org)
	by player699.ha.ovh.net (Postfix) with ESMTPSA id EEBA62400A6;
	Wed, 30 Nov 2016 16:09:25 +0100 (CET)
To: Kevin Wolf <kwolf@redhat.com>
References: <1480434248-27138-1-git-send-email-clg@kaod.org>
	<1480434248-27138-26-git-send-email-clg@kaod.org>
	<921d5257-fff3-5cde-3da2-b58c94e5c792@kaod.org>
	<20161129180803.GC7080@noname.redhat.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <fc7bced6-9e03-f0a5-b991-52566a42d288@kaod.org>
Date: Wed, 30 Nov 2016 16:09:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20161129180803.GC7080@noname.redhat.com>
Content-Type: text/plain; charset=windows-1252
X-Ovh-Tracer-Id: 16982792720841280398
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelfedrfeelgdeikecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 46.105.56.233
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
X-TUID: NG9LI+DWSAll

On 11/29/2016 07:08 PM, Kevin Wolf wrote:
> Am 29.11.2016 um 18:30 hat C=E9dric Le Goater geschrieben:
>> On 11/29/2016 04:44 PM, C=E9dric Le Goater wrote:
>>> This could be used to define the flash model to use on some boards
>>> definitions.
>>
>> As this patch was part of a larger set, I did not send the whole=20
>> set to qemu-block@ list. Could you please take a look at the proposal =
?=20
>=20
> This is a device level option rather than a block backend one. We messe=
d
> up -drive in its early days by including some device options, but we
> don't generally want to add to this.
>=20
> The correct way would be to add a qdev property for this and specify it
> with -device or -global.

OK. I see. I should use something like this on the command line :

	-drive file=3Dflash-romulus-test,format=3Draw,if=3Dmtd,id=3Dbmc \
	-device mx25l25635e,drive=3Dbmc \
	-drive file=3Dflash-romulus-test2,format=3Draw,if=3Dmtd,id=3Dbmc2 \
	-device mx25l25635e,drive=3Dbmc2 \
	-drive file=3Dromulus.pnor,format=3Draw,if=3Dmtd,id=3Dpnor \
	-device mx66l1g45g,drive=3Dpnor=20

and retrieve the attached m25p80 device from the drive with the=20
routine blk_get_attached_dev(). That is changing a bit the way
the platform is initialized but it is cleaner as no default=20
devices are automatically added.

Thanks,

C.=20

> Kevin
>=20
>>> Signed-off-by: C=E9dric Le Goater <clg@kaod.org>
>>> Reviewed-by: Joel Stanley <joel@jms.id.au>
>>> ---
>>>  blockdev.c                | 12 ++++++++++++
>>>  include/sysemu/blockdev.h |  1 +
>>>  qemu-options.hx           |  4 +++-
>>>  3 files changed, 16 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/blockdev.c b/blockdev.c
>>> index 245e1e1d177a..bcc99365b86c 100644
>>> --- a/blockdev.c
>>> +++ b/blockdev.c
>>> @@ -742,6 +742,10 @@ QemuOptsList qemu_legacy_drive_opts =3D {
>>>              .type =3D QEMU_OPT_STRING,
>>>              .help =3D "pci address (virtio only)",
>>>          },{
>>> +            .name =3D "model",
>>> +            .type =3D QEMU_OPT_STRING,
>>> +            .help =3D "flash model (mtd only)",
>>> +        },{
>>>              .name =3D "serial",
>>>              .type =3D QEMU_OPT_STRING,
>>>              .help =3D "disk serial number",
>>> @@ -790,6 +794,7 @@ DriveInfo *drive_new(QemuOpts *all_opts, BlockInt=
erfaceType block_default_type)
>>>      bool read_only =3D false;
>>>      bool copy_on_read;
>>>      const char *serial;
>>> +    const char *model;
>>>      const char *filename;
>>>      Error *local_err =3D NULL;
>>>      int i;
>>> @@ -1076,6 +1081,12 @@ DriveInfo *drive_new(QemuOpts *all_opts, Block=
InterfaceType block_default_type)
>>>          qdict_put(bs_opts, "rerror", qstring_from_str(rerror));
>>>      }
>>> =20
>>> +    model =3D qemu_opt_get(legacy_opts, "model");
>>> +    if (model && type !=3D IF_MTD) {
>>> +        error_report("model is not supported by this bus type");
>>> +        goto fail;
>>> +    }
>>> +
>>>      /* Actual block device init: Functionality shared with blockdev-=
add */
>>>      blk =3D blockdev_init(filename, bs_opts, &local_err);
>>>      bs_opts =3D NULL;
>>> @@ -1102,6 +1113,7 @@ DriveInfo *drive_new(QemuOpts *all_opts, BlockI=
nterfaceType block_default_type)
>>>      dinfo->unit =3D unit_id;
>>>      dinfo->devaddr =3D devaddr;
>>>      dinfo->serial =3D g_strdup(serial);
>>> +    dinfo->model =3D g_strdup(model);
>>> =20
>>>      blk_set_legacy_dinfo(blk, dinfo);
>>> =20
>>> diff --git a/include/sysemu/blockdev.h b/include/sysemu/blockdev.h
>>> index 16432f350805..10c66e5e86a4 100644
>>> --- a/include/sysemu/blockdev.h
>>> +++ b/include/sysemu/blockdev.h
>>> @@ -39,6 +39,7 @@ struct DriveInfo {
>>>      int cyls, heads, secs, trans;
>>>      QemuOpts *opts;
>>>      char *serial;
>>> +    char *model;
>>>      QTAILQ_ENTRY(DriveInfo) next;
>>>  };
>>> =20
>>> diff --git a/qemu-options.hx b/qemu-options.hx
>>> index 4a5b29f349f7..16add85bd0f5 100644
>>> --- a/qemu-options.hx
>>> +++ b/qemu-options.hx
>>> @@ -517,7 +517,7 @@ DEF("drive", HAS_ARG, QEMU_OPTION_drive,
>>>      "-drive [file=3Dfile][,if=3Dtype][,bus=3Dn][,unit=3Dm][,media=3D=
d][,index=3Di]\n"
>>>      "       [,cyls=3Dc,heads=3Dh,secs=3Ds[,trans=3Dt]][,snapshot=3Do=
n|off]\n"
>>>      "       [,cache=3Dwritethrough|writeback|none|directsync|unsafe]=
[,format=3Df]\n"
>>> -    "       [,serial=3Ds][,addr=3DA][,rerror=3Dignore|stop|report]\n=
"
>>> +    "       [,serial=3Ds][,model=3Dm][,addr=3DA][,rerror=3Dignore|st=
op|report]\n"
>>>      "       [,werror=3Dignore|stop|report|enospc][,id=3Dname][,aio=3D=
threads|native]\n"
>>>      "       [,readonly=3Don|off][,copy-on-read=3Don|off]\n"
>>>      "       [,discard=3Dignore|unmap][,detect-zeroes=3Don|off|unmap]=
\n"
>>> @@ -570,6 +570,8 @@ the format.  Can be used to specify format=3Draw =
to avoid interpreting
>>>  an untrusted format header.
>>>  @item serial=3D@var{serial}
>>>  This option specifies the serial number to assign to the device.
>>> +@item model=3D@var{model}
>>> +This option specifies the model to use to create a flash device (if=3D=
mtd only).
>>>  @item addr=3D@var{addr}
>>>  Specify the controller's PCI address (if=3Dvirtio only).
>>>  @item werror=3D@var{action},rerror=3D@var{action}
>>>
>>

