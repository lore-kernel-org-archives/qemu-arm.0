Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp4649410lfb;
        Tue, 27 Apr 2021 03:28:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxnX4262aItyzTYBMljM2cocT+0tP2pANJ3RT89JM2AJNdoounK9MtJbnVx+zEDTFVtAg2Z
X-Received: by 2002:a02:95e3:: with SMTP id b90mr21114651jai.14.1619519335265;
        Tue, 27 Apr 2021 03:28:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619519335; cv=none;
        d=google.com; s=arc-20160816;
        b=GHMZDCENZoe2GG72t+jVvUXRWvYgvSnDVxiBFzAMLTGEfZ8w5DHKB8mHdx3c8bnJ+A
         Prv6DCQRbCZcgCw9a7YGW2c0kZwoo3VWdPJ+1+zbs5pQ/sKJ+w+flbgbn3KqRtGLXix5
         hB45xomWDQQgkbAX2gFK9tPYJWXaJDnTYfwUfryICA+wzbjz+5vkc6M0FQYRX/hV0sJ5
         pkN0YHEtYhf4rBk5eOb+dh4ZbYjiWSanJoPz8LoD9zoBc4emDZ7xrj0ZvukpwNNz8Fwb
         WXsCITZ4du4B5HLJxMFvZ0CtUyQF7X0qo9LrpTUjxzQG3Eh557y6usMYItpFZ4k2oDB5
         3Bkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date;
        bh=NmRL+4vWIO2MbpwA8JyPMnA1PQY4QEMEyMckD8VKflM=;
        b=mt/DYKTRvgFssj54W0CL+MjN1ucVn/snMCjsHpHQrhgcir0mIMiF9GkJdsV5RsAZ99
         ycRCBl3PXEi/76vBN41e1P6SD7PtvFmtDMzLaHvaZxZhgmgdKTtyXukSFiiwbRERiolR
         dgxKaymW0manCMcHa1UX+ZD6gm8/+io9nJCax1huge0R8+28iHkyJj6H5RJ9JZ+E4YHp
         iK9QoPVL5kzGmHUSueLlrumczn10DD2yLCCtzOQFF6Mc/aSIpuqMhOHikZ/DFgfCNMp0
         H5tb+qGV3yYLswLwpddx8w4vQ+rYaXkGSupgRzFYECxU7JETxzHZNDykWml2RbAF8/UQ
         Qjaw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m2si3283068ilh.58.2021.04.27.03.28.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Apr 2021 03:28:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:60294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lbKxa-0001T7-Kv
	for alex.bennee@linaro.org; Tue, 27 Apr 2021 06:28:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lbKvw-0000L4-IC
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 06:27:12 -0400
Received: from smtpout3.3005.mail-out.ovh.net ([217.182.185.173]:52647)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lbKvq-00050O-Ku
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 06:27:12 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.173])
 by mo3005.mail-out.ovh.net (Postfix) with ESMTPS id 7509313FC9B;
 Tue, 27 Apr 2021 10:27:02 +0000 (UTC)
Received: from kaod.org (37.59.142.100) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Tue, 27 Apr
 2021 12:27:01 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R0033ab4eb1d-1842-4dc0-8e57-b3742ceaf5b8,
 B6AA52F3D5CB607530F59D2ADE64727CB37F7539) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Tue, 27 Apr 2021 12:27:00 +0200
From: Greg Kurz <groug@kaod.org>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
Subject: Re: [PATCH 1/5] hw/ppc/spapr_iommu: Register machine reset handler
Message-ID: <20210427122700.60d0a82a@bahia.lan>
In-Reply-To: <9dcc20c7-6371-dc77-1cd4-706301ec5c54@amsat.org>
References: <20210424162229.3312116-1-f4bug@amsat.org>
 <20210424162229.3312116-2-f4bug@amsat.org>
 <YIdso1hf+bXwZHmG@yekko.fritz.box>
 <9dcc20c7-6371-dc77-1cd4-706301ec5c54@amsat.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG7EX2.mxp5.local (172.16.2.62) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: f839ed25-cad2-45d5-bb12-83d3a54367b7
X-Ovh-Tracer-Id: 16642489476104624632
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrvddvtddgvdekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtgfhisehtqhertdertdejnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeevlefhtddufffhieevhefhleegleelgfetffetkedugeehjeffgfehhfefueduffenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddttdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtohepmhhrvghithiisehrvgguhhgrthdrtghomh
Received-SPF: pass client-ip=217.182.185.173; envelope-from=groug@kaod.org;
 helo=smtpout3.3005.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, =?UTF-8?B?SGVydsOp?= Poussineau <hpoussin@reactos.org>,
 qemu-ppc@nongnu.org, Max Reitz <mreitz@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: eOO74Wla6aKH

On Tue, 27 Apr 2021 11:20:07 +0200
Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wrote:

> On 4/27/21 3:45 AM, David Gibson wrote:
> > On Sat, Apr 24, 2021 at 06:22:25PM +0200, Philippe Mathieu-Daud=C3=A9 w=
rote:
> >> The TYPE_SPAPR_TCE_TABLE device is bus-less, thus isn't reset
> >> automatically.  Register a reset handler to get reset with the
> >> machine.
> >>
> >> It doesn't seem to be an issue because it is that way since the
> >> device QDev'ifycation 8 years ago, in commit a83000f5e3f
> >> ("spapr-tce: make sPAPRTCETable a proper device").
> >> Still, correct to have a proper API usage.
> >=20
> > So, the reason this works now is that we explicitly call
> > device_reset() on the TCE table from the TCE tables "owner", either a
> > PHB (spapr_phb_reset()) or a VIO device (spapr_vio_quiesce_one()).
> >=20
> > I think we want either that, or the register_reset(), not both.
>=20
> rtas_quiesce() seems to call a DeviceClass::reset() on the
> children of TYPE_SPAPR_VIO_BUS:
>=20
> Abstract TYPE_VIO_SPAPR_DEVICE has the TYPE_SPAPR_VIO_BUS bus_type,
> and registers the spapr_vio_busdev_reset() handler, which calls
> spapr_vio_quiesce_one()...
>=20
> So either we already have 2 resets, or the bus is never reset?
>=20

rtas_quiesce() is called when the guests definitively transition
from the SLOF FW to the OS. It isn't a true reset path actually,
even if it needs to reset a few devices.

On the other hand, your patch would _really_ cause the TCE table
device to be reset twice at machine reset AFAICT.

> The bus is created in spapr_machine_init():
>=20
>     /* Set up VIO bus */
>     spapr->vio_bus =3D spapr_vio_bus_init();
>=20
> TYPE_SPAPR_MACHINE class registers spapr_machine_reset(), which
> manually calls qemu_devices_reset() and spapr_drc_reset_all(),
> but I can't understand if a callee resets vio_bus...

The vio_bus *is* reset:

#0  0x0000000100629a98 in spapr_vio_busdev_reset (qdev=3D0x10165c400) at /h=
ome/greg/Work/qemu/qemu-virtiofs/include/hw/ppc/spapr_vio.h:31
#1  0x00000001009fd32c in device_transitional_reset (obj=3D0x10165c400) at =
/home/greg/Work/qemu/qemu-virtiofs/include/hw/qdev-core.h:17
#2  0x0000000100a00e24 in resettable_phase_hold (obj=3D0x10165c400, opaque=
=3D<optimized out>, type=3D<optimized out>) at ../../hw/core/resettable.c:1=
82
#3  0x00000001009f9108 in bus_reset_child_foreach (obj=3D<optimized out>, c=
b=3D0x100a00cc0 <resettable_phase_hold>, opaque=3D0x0, type=3D<optimized ou=
t>) at ../../hw/core/bus.c:97
#4  0x0000000100a00db8 in resettable_child_foreach (rc=3D0x1014f5400, type=
=3DRESET_TYPE_COLD, opaque=3D0x0, cb=3D0x100a00cc0 <resettable_phase_hold>,=
 obj=3D0x10156e600) at ../../hw/core/resettable.c:96
#5  0x0000000100a00db8 in resettable_phase_hold (obj=3D0x10156e600, opaque=
=3D<optimized out>, type=3D<optimized out>) at ../../hw/core/resettable.c:1=
73
#6  0x00000001009fcaa8 in device_reset_child_foreach (obj=3D<optimized out>=
, cb=3D0x100a00cc0 <resettable_phase_hold>, opaque=3D0x0, type=3D<optimized=
 out>) at ../../hw/core/qdev.c:366
#7  0x0000000100a00db8 in resettable_child_foreach (rc=3D0x1013eef90, type=
=3DRESET_TYPE_COLD, opaque=3D0x0, cb=3D0x100a00cc0 <resettable_phase_hold>,=
 obj=3D0x10164a0e0) at ../../hw/core/resettable.c:96
#8  0x0000000100a00db8 in resettable_phase_hold (obj=3D0x10164a0e0, opaque=
=3D<optimized out>, type=3D<optimized out>) at ../../hw/core/resettable.c:1=
73
#9  0x00000001009f9108 in bus_reset_child_foreach (obj=3D<optimized out>, c=
b=3D0x100a00cc0 <resettable_phase_hold>, opaque=3D0x0, type=3D<optimized ou=
t>) at ../../hw/core/bus.c:97
#10 0x0000000100a00db8 in resettable_child_foreach (rc=3D0x1012b1a00, type=
=3DRESET_TYPE_COLD, opaque=3D0x0, cb=3D0x100a00cc0 <resettable_phase_hold>,=
 obj=3D0x10154d4b0) at ../../hw/core/resettable.c:96
#11 0x0000000100a00db8 in resettable_phase_hold (obj=3Dobj@entry=3D0x10154d=
4b0, opaque=3Dopaque@entry=3D0x0, type=3Dtype@entry=3DRESET_TYPE_COLD) at .=
./../hw/core/resettable.c:173
#12 0x0000000100a01794 in resettable_assert_reset (obj=3D0x10154d4b0, type=
=3D<optimized out>) at ../../hw/core/resettable.c:60
#13 0x0000000100a01c60 in resettable_reset (obj=3D0x10154d4b0, type=3D<opti=
mized out>) at ../../hw/core/resettable.c:45
#14 0x0000000100a020ec in resettable_cold_reset_fn (opaque=3D<optimized out=
>) at ../../hw/core/resettable.c:269
#15 0x0000000100a00718 in qemu_devices_reset () at ../../hw/core/reset.c:69
#16 0x0000000100624024 in spapr_machine_reset (machine=3D0x101545480) at ..=
/../hw/ppc/spapr.c:1587
#17 0x00000001007b8128 in qemu_system_reset (reason=3D<optimized out>) at .=
./../softmmu/runstate.c:442
#18 0x00000001007b8fa8 in main_loop_should_exit () at ../../softmmu/runstat=
e.c:687
#19 0x00000001007b8fa8 in qemu_main_loop () at ../../softmmu/runstate.c:721
#20 0x00000001002f5150 in main (argc=3D<optimized out>, argv=3D<optimized o=
ut>, envp=3D<optimized out>) at ../../softmmu/main.c:50

And it seems rtas_quiesce() could just do bus_cold_reset(&bus->bus)
rather than open-coding the walk of vio_bus children.
