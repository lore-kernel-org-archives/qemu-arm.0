Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BCF0CCD199
	for <qemu-arm@archiver.kernel.org>; Fri, 17 Oct 2025 14:51:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v9lnO-0006JU-A0; Fri, 17 Oct 2025 10:51:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1v9lnM-0006JL-Of
 for qemu-arm@nongnu.org; Fri, 17 Oct 2025 10:51:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1v9lnH-0003Qa-8H
 for qemu-arm@nongnu.org; Fri, 17 Oct 2025 10:51:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1760712652;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N2C1SWwj+H3RYQoaCEY2KvsHrLOjBe1VUjho94JAR7g=;
 b=YNujBkyXQzbyNZH0UjARJLeDFRIfNWnennrMSbcIVxq92jnue2KmiXGndRsiMVCHN+r79P
 J1iLN+3LXfOmAEz+kA8rh5vzclya3r3OQZHdncXnqn0HpEpp2VhnkL5SdPRT7Ex5i+ikGm
 nz8uAaQg5ffQMJ1k8AZMafXowc1MlVw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-73-s1ka-o4tOmqQp8hQU33pPA-1; Fri, 17 Oct 2025 10:50:49 -0400
X-MC-Unique: s1ka-o4tOmqQp8hQU33pPA-1
X-Mimecast-MFC-AGG-ID: s1ka-o4tOmqQp8hQU33pPA_1760712648
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-3ef9218daf5so3165147f8f.1
 for <qemu-arm@nongnu.org>; Fri, 17 Oct 2025 07:50:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760712648; x=1761317448;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Slj7ZKPK0xvytalJly4TT5I3RXQEVVcilA0m7Bpil6o=;
 b=vVtL1vcwdDXbulHBPdSH0d4RqAfgMFuFiaheeG32eEg5qM3B2YXdBgxAnBlPRl05tq
 MVnNlZw97EJNvh+hdNnWCo+jIynbvbhPYdYQogGRlR6eQAg1AkomhKIWVk3kF6vXf7XC
 qletm6r3+6VeLvKWNvOGxQZdG5gLXDpUP/gF+fivm8ryj3KGA+xYDBaNQVeaXUtH+RNI
 MkDkpohA/kKQDxyD/SzJFqviWkHEchEwv0CZr9Ae4Wa2BPIX9wNh9V+mlFekH0HQSMoU
 81GGC/RsWY+zLqFJTUqWrVeb2FSBGChqoqM3ZSjxZF6zp3ux0sp7BgmOH2ZrKreq/nP/
 yCLA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX4zmq0L4xCeFhaK6RdStDXdcHd5kzUt4rOi9B1qhpXPl3Wg5jf1uFKOiy4k9rqhsKuDUvyAZPVvA==@nongnu.org
X-Gm-Message-State: AOJu0Yx3/i8ALecfDADJ0ZWNIhsMjYRThy8ZIZdATJTiF/auSvD45bQI
 ZCVcKkGgSYXpFpCguDV2ovnlPUfEN3Hott9hD7LMVRvhPn8FfHeKWmeHuhMeWHb7isQpAZzH2yH
 Y+LUS3+GA1lkFPm8A2+Bbo81pa1Ux2zyN7bXeJ3N3rV3N0jtCshj0HA==
X-Gm-Gg: ASbGncvru7T1n0HbFStSyiW5BzvgSiaAZwDb3BOpztXvHe/xCyyVNd6gZQlCWhNVtuP
 I8G30MqRy59JCdcxW5TGyhEGyYOmdLk3Og0/yYIF8DWUD+bWoZnXViUkyG5PKLgjK/6zI3E0x/9
 3PwDrhnAsnfKs22JSQM0XOeC29nEwByFs4tRkLT6FhFwNbAl9QcAGs1KMUB3ZfFWCAZ8zWRU2et
 ZKeYpYNXDsdCu/s63pn6WJfKC5LuYbfuwXgrZtAIyihVdixNGr4g8R/PSASI7jRuWsPlliq3t11
 7Z7c1Nk1Ozt10AxZr6V3Sms2Z4qOAZlJOv9w1ND7nG5jJoeJzURgJTvAb/+fBYh5+Q==
X-Received: by 2002:a5d:5d8a:0:b0:408:9c48:e26c with SMTP id
 ffacd0b85a97d-42704ded11cmr2662177f8f.62.1760712648251; 
 Fri, 17 Oct 2025 07:50:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHH46TewHy39mb4mEpu2uB9bkN7QAfp6b18sxLO05JMkKg19tLq/t7Z5uGdZKGMd8kUXk96ww==
X-Received: by 2002:a5d:5d8a:0:b0:408:9c48:e26c with SMTP id
 ffacd0b85a97d-42704ded11cmr2662131f8f.62.1760712647682; 
 Fri, 17 Oct 2025 07:50:47 -0700 (PDT)
Received: from fedora ([85.93.96.130]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4711444c8adsm89053555e9.13.2025.10.17.07.50.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Oct 2025 07:50:47 -0700 (PDT)
Date: Fri, 17 Oct 2025 16:50:44 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: salil.mehta@opnsrc.net, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 mst@redhat.com, salil.mehta@huawei.com, maz@kernel.org,
 jean-philippe@linaro.org, jonathan.cameron@huawei.com,
 lpieralisi@kernel.org, peter.maydell@linaro.org,
 richard.henderson@linaro.org, andrew.jones@linux.dev, david@redhat.com,
 philmd@linaro.org, eric.auger@redhat.com, will@kernel.org, ardb@kernel.org,
 oliver.upton@linux.dev, pbonzini@redhat.com, gshan@redhat.com,
 rafael@kernel.org, borntraeger@linux.ibm.com, alex.bennee@linaro.org,
 gustavo.romero@linaro.org, npiggin@gmail.com, harshpb@linux.ibm.com,
 linux@armlinux.org.uk, darren@os.amperecomputing.com,
 ilkka@os.amperecomputing.com, vishnu@os.amperecomputing.com,
 gankulkarni@os.amperecomputing.com, karl.heubaum@oracle.com,
 miguel.luis@oracle.com, zhukeqian1@huawei.com, wangxiongfeng2@huawei.com,
 wangyanan55@huawei.com, wangzhou1@hisilicon.com, linuxarm@huawei.com,
 jiakernel2@gmail.com, maobibo@loongson.cn, lixianglai@loongson.cn,
 shahuang@redhat.com, zhao1.liu@intel.com, devel@lists.libvirt.org
Subject: Re: [PATCH RFC V6 22/24] monitor,qdev: Introduce 'device_set' to
 change admin state of existing devices
Message-ID: <20251017165044.76b39f5c@fedora>
In-Reply-To: <87wm54nmyt.fsf@pond.sub.org>
References: <20251001010127.3092631-1-salil.mehta@opnsrc.net>
 <20251001010127.3092631-23-salil.mehta@opnsrc.net>
 <87plawh2sz.fsf@pond.sub.org> <20251009145125.6583a24a@fedora>
 <87wm54nmyt.fsf@pond.sub.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 4qR26MCTdNKj_nMjObzoMoH-EhGnL_xVDSHjseAX6r4_1760712648
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Thu, 09 Oct 2025 16:55:54 +0200
Markus Armbruster <armbru@redhat.com> wrote:

> Igor Mammedov <imammedo@redhat.com> writes:
>=20
> > On Thu, 09 Oct 2025 10:55:40 +0200
> > Markus Armbruster <armbru@redhat.com> wrote:
> > =20
> >> salil.mehta@opnsrc.net writes:
> >>  =20
> >> > From: Salil Mehta <salil.mehta@huawei.com>
> >> >
> >> > This patch adds a "device_set" interface for modifying properties of=
 devices
> >> > that already exist in the guest topology. Unlike 'device_add'/'devic=
e_del'
> >> > (hot-plug), 'device_set' does not create or destroy devices. It is i=
ntended
> >> > for guest-visible hot-add semantics where hardware is provisioned at=
 boot but
> >> > logically enabled/disabled later via administrative policy.
> >> >
> >> > Compared to the existing 'qom-set' command, which is less intuitive =
and works
> >> > only with object IDs, device_set provides a more device-oriented int=
erface.
> >> > It can be invoked at the QEMU prompt using natural device arguments,=
 and the
> >> > new '-deviceset' CLI option allows properties to be set at boot time=
, similar
> >> > to how '-device' specifies device creation.   =20
> >>=20
> >> Why can't we use -device? =20
> >
> > that's was my concern/suggestion in reply to cover letter
> > (as a place to put high level review and what can be done for the next =
revision) =20
>=20
> Yes.
>=20
> > (PS: It looks like I'm having email receiving issues (i.e. not getting =
from
> > mail list my own emails that it bonces to me, so threading is all broke=
n on
> > my side and I'm might miss replies). But on positive side it looks like=
 my
> > replies reach the list and CCed just fine) =20
>=20
> For what it's worth, your replies arrive fine here.
>=20
> >> > While the initial implementation focuses on "admin-state" changes (e=
.g.,
> >> > enable/disable a CPU already described by ACPI/DT), the interface is=
 designed
> >> > to be generic. In future, it could be used for other per-device set/=
unset
> >> > style controls =E2=80=94 beyond administrative power-states =E2=80=
=94 provided the target
> >> > device explicitly allows such changes. This enables fine-grained run=
time
> >> > control of device properties.   =20
> >>=20
> >> Beware, designing a generic interface can be harder, sometimes much
> >> harder, than designing a specialized one.
> >>=20
> >> device_add and qom-set are generic, and they have issues:
> >>=20
> >> * device_add effectively bypasses QAPI by using 'gen': false.
> >>=20
> >>   This bypasses QAPI's enforcement of documentation.  Property
> >>   documentation is separate and poor.
> >>=20
> >>   It also defeats introspection with query-qmp-schema.  You need to
> >>   resort to other means instead, say QOM introspection (which is a bag
> >>   of design flaws on its own), then map from QOM to qdev.
> >>=20
> >> * device_add lets you specify any qdev property, even properties that
> >>   are intended only for use by C code.
> >>=20
> >>   This results in accidental external interfaces.
> >>=20
> >>   We tend to name properties like "x-prop" to discourage external use,
> >>   but I wouldn't bet my own money on us getting that always right.
> >>   Moreover, there's beauties like "x-origin".
> >>=20
> >> * qom-set & friends effectively bypass QAPI by using type 'any'.
> >>=20
> >>   Again, the bypass results in poor documentation and a defeat of
> >>   query-qmp-schema.
> >>=20
> >> * qom-set lets you mess with any QOM property with a setter callback.
> >>=20
> >>   Again, accidental external interfaces: most of these properties are
> >>   not meant for use with qom-set.  For some, qom-set works, for some i=
t
> >>   silently does nothing, and for some it crashes.  A lot more dangerou=
s
> >>   than device_add.
> >>=20
> >>   The "x-" convention can't help here: some properties are intended fo=
r
> >>   external use with object-add, but not with qom-set.
> >>=20
> >> We should avoid such issues in new interfaces. =20
>=20
> [...]
>=20
> >> > diff --git a/hmp-commands.hx b/hmp-commands.hx
> >> > index d0e4f35a30..18056cf21d 100644
> >> > --- a/hmp-commands.hx
> >> > +++ b/hmp-commands.hx
> >> > @@ -707,6 +707,36 @@ SRST
> >> >    or a QOM object path.
> >> >  ERST
> >> > =20
> >> > +{
> >> > +    .name       =3D "device_set",
> >> > +    .args_type  =3D "device:O",
> >> > +    .params     =3D "driver[,prop=3Dvalue][,...]",
> >> > +    .help       =3D "set/unset existing device property",
> >> > +    .cmd        =3D hmp_device_set,
> >> > +    .command_completion =3D device_set_completion,
> >> > +},
> >> > +
> >> > +SRST
> >> > +``device_set`` *driver[,prop=3Dvalue][,...]*
> >> > +  Change the administrative power state of an existing device.
> >> > +
> >> > +  This command enables or disables a known device (e.g., CPU) using=
 the
> >> > +  "device_set" interface. It does not hotplug or add a new device.
> >> > +
> >> > +  Depending on platform support (e.g., PSCI or ACPI), this may trig=
ger
> >> > +  corresponding operational changes =E2=80=94 such as powering down=
 a CPU or
> >> > +  transitioning it to active use.
> >> > +
> >> > +  Administrative state:
> >> > +    * *enabled*  =E2=80=94 Allows the guest to use the device (e.g.=
, CPU_ON)
> >> > +    * *disabled* =E2=80=94 Prevents guest use; device is powered of=
f (e.g., CPU_OFF)
> >> > +
> >> > +  Note: The device must already exist (be declared during machine c=
reation).
> >> > +
> >> > +  Example:
> >> > +      (qemu) device_set host-arm-cpu,core-id=3D3,admin-state=3Ddisa=
bled
> >> > +ERST   =20
> >>=20
> >> How exactly is the device selected?  You provide a clue above: 'can be
> >> located by "id" or via driver+property match'.
> >>=20
> >> I assume by "id" is just like device_del, i.e. by qdev ID or QOM path.
> >>=20
> >> By "driver+property match" is not obvious.  Which of the arguments are
> >> for matching, and which are for setting?
> >>=20
> >> If "id" is specified, is there any matching?
> >>=20
> >> The matching feature complicates this interface quite a bit.  I doubt
> >> it's worth the complexity.  If you think it is, please split it off in=
to
> >> a separate patch. =20
> >
> > It's likely /me who to blame for asking to invent generic
> > device-set QMP command.
> > I see another application (beside ARM CPU power-on/off) for it,
> > PCI devices to simulate powering on/off them at runtime without
> > actually removing device. =20
>=20
> I prefer generic commands over collecting ad hoc single-purpose
> commands, too.  Getting the design right can be difficult.
>=20
> > wrt command,
> > I'd use only 'id' with it to identify target device
> > (i.e. no template matching nor QMP path either).
> > To enforce rule, what user hasn't named explicitly by providing 'id'
> > isn't meant to be accessed/manged by user later on.  =20
>=20
> Works well, except when we need to access / manage onboard devices.
> That's still an unsolved problem.
>=20
> > potentially we can invent specialized power_set/get command as
> > an alternative if it makes design easier.
> > But then we would be spawning similar commands for other things,
> > where as device-set would cover it all. But then I might be
> > over-complicating things by suggesting a generic approach.  =20
>=20
> Unclear.
>=20
> I feel it's best to start the design process with ensvisaged uses.  Can
> you tell me a bit more about the uses you have in mind?

We have nic failover 'feature'
   https://www.qemu.org/docs/master/system/virtio-net-failover.html
to make it work we do abuse hotplug and that poses problem
during migration, since:
  - unplugging primary device releases resources (which might not be
    possible to claim back in case migration failure)
  - it's similar on destination side, where attempt to hotplug
    primary might fail die to insufficient resources leaving guest
    on 'degraded' virtio-net link.

Idea was that instead of hotplug we can power off primary device,
(it will still exist and keep resources), initiate migration,
and then on target do the same starting with primary fully realized
but powered of (and failing migration early if it can't claim resources,
safely resuming QEMU on source incl. primary link), and then guest
failover driver on destination would power primary on as part of
switching to primary link.

Above would require -device/device_add support for specifying device's
power state as minimum.

> >> Next question.  Is there a way for management applications to detect
> >> whether a certain device supports device_set for a certain property? =
=20
> >
> > is there some kind of QMP command to check what does a device support,
> > or at least what properties it supports? Can we piggy-back on that? =20
>=20
> Maybe.
>=20
> QAPI schema introspection (query-qmp-schema) has been a success.  It has
> a reasonably expressive type system, deprecation information, and hides
> much implementation detail.  Sadly, it doesn't cover most of QOM and all
> of qdev due to QAPI schema bypass.
>=20
> QOM type introspection (qom-list-types and qom-list-properties) is weak.
> You can retrieve a property's name and type.  The latter is seriously
> underspecified, and somewhere between annoying and impossible to use
> reliably.  Properties created in certain ways are not visible here.
> These are rare.
>=20
> QOM object introspection (qom-list) is the same for concrete objects
> rather than types.
>=20
> qdev introspection (device-list-properties) is like QOM type
> introspection.  I'm not sure why it exists.  Use QOM type introspection
> instead.
>=20
> QOM introspection is servicable for checking whether a certain property
> exists.  Examining a property's type is unadvisable.
>=20
> >> Without that, what are management application supposed to do?  Hard-co=
de
> >> what works?  Run the command and see whether it fails? =20
> >
> > Adding libvirt list to discussion and possible ideas on what can be don=
e here.
> > =20
> >> I understand right now the command supports just "admin-state" for a
> >> certain set of devices, so hard-coding would be possible.  But every n=
ew
> >> (device, property) pair then requires management application updates,
> >> and the hard-coded information becomes version specific.  This will
> >> become unworkable real quick.  Not good enough for a command designed =
to
> >> be generic. =20
>=20
> [...]
>=20


