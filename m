Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp912943lfp;
        Fri, 24 Jan 2020 10:44:40 -0800 (PST)
X-Google-Smtp-Source: APXvYqzGxTA3q1lIkkSXXDlYydw0ffVtHB7tspDhsRM+fR35f3J/xT1ynjQno1i5FH+AQRl0GJgY
X-Received: by 2002:a05:620a:14a2:: with SMTP id x2mr4200340qkj.36.1579891479965;
        Fri, 24 Jan 2020 10:44:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579891479; cv=none;
        d=google.com; s=arc-20160816;
        b=SS4kV1m90p6iHL8zruYzTOwoJjPX0NvTno4fq++AL5QxfP9Xe0vDRnOmZgMIuN/1pO
         teSIVrcS8r+p+MjJeKJ46hTunDEjFiPvjncO6ESiqz1ZROKHjvIS5/u7S+v7M+0jzZeU
         rfk2ba8b/m/yQjMKutgfEXzX/699aTkN0lHCMtbBGLf4Q8paGtXUZo/CoEQpBdtlufff
         6GDksQjaDwEksMB8sCiaRz4+o0FOOBL/Vx4tQi+W/MlbdaZcy2Zf5KFfF6AR6j4PVOz3
         yWdrgchNP3ETdClzjkt8mInujVJMx3nTEHVvqu2pMvSfbcrRUlhmDuO1fOS4Dkvp8WWP
         d0uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:to:from;
        bh=179+1oyUIzK0qJXBb3q+LCYEpLYnaEHLH7fii/t33TE=;
        b=Kg/BJs0+tSk1+zAqkD9q6STiwZWNKo8sUZAE0Q7GVUwD/EUOmMdIJ/pxYfbJUsuHNn
         bAddzLiCTGW1bmzqrLDKnAGcdjRHOoCeBxtzs6MCvUG3VcbRkWWGN2SYuvQ4H8f+qbcY
         p1TWyrOjU5YfU8AxLICT+yEn2WSDqQVU6GNwC4i4dWZDgcWaH58+pEH4NLhEWkhp+QqE
         TrQweqOAXg+m4AzWZstfGSGSXex2sQwG4ck93za2j6QN4R4PtjBGEU0MxVbrHzlxZVmt
         Jc+ycSK7+iCyFiSV7qfMhNd7vnbh8T57zQxTiO5casyNTTjESYlYt4jitndr9U9Jac7h
         FjDg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w8si4305141qth.81.2020.01.24.10.44.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jan 2020 10:44:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:46428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iv3wd-0005xh-Cy
	for alex.bennee@linaro.org; Fri, 24 Jan 2020 13:44:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44772)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <salil.mehta@huawei.com>) id 1iv3wO-0005xV-5y
 for qemu-arm@nongnu.org; Fri, 24 Jan 2020 13:44:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <salil.mehta@huawei.com>) id 1iv3wM-0003yT-1i
 for qemu-arm@nongnu.org; Fri, 24 Jan 2020 13:44:24 -0500
Received: from lhrrgout.huawei.com ([185.176.76.210]:2065 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <salil.mehta@huawei.com>)
 id 1iv3wL-0003wL-P7; Fri, 24 Jan 2020 13:44:22 -0500
Received: from LHREML712-CAH.china.huawei.com (unknown [172.18.7.107])
 by Forcepoint Email with ESMTP id AB62C1C6AB996B753434;
 Fri, 24 Jan 2020 18:44:17 +0000 (GMT)
Received: from lhreml706-chm.china.huawei.com (10.201.108.55) by
 LHREML712-CAH.china.huawei.com (10.201.108.35) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Fri, 24 Jan 2020 18:44:17 +0000
Received: from lhreml703-chm.china.huawei.com (10.201.108.52) by
 lhreml706-chm.china.huawei.com (10.201.108.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1713.5; Fri, 24 Jan 2020 18:44:16 +0000
Received: from lhreml703-chm.china.huawei.com ([10.201.68.198]) by
 lhreml703-chm.china.huawei.com ([10.201.68.198]) with mapi id 15.01.1713.004; 
 Fri, 24 Jan 2020 18:44:16 +0000
From: Salil Mehta <salil.mehta@huawei.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: RE: [Question] Regarding containers "unattached/peripheral/anonymous"
 - their relation with hot(un)plug of devices
Thread-Topic: [Question] Regarding containers
 "unattached/peripheral/anonymous" - their relation with hot(un)plug of
 devices
Thread-Index: AdXSpuyfn6DVS59zTi+rGkiX0i4oLAAFtBwAAADWJeAAA8wjgAACyCnA
Date: Fri, 24 Jan 2020 18:44:16 +0000
Message-ID: <b8fccc99d7344b2485c0db76886af9c8@huawei.com>
References: <70446b6cbf5442488a40fe809f38c3c8@huawei.com>
 <20200124145404.1d15209e@redhat.com>
 <77dbc712482545078986adcd72567630@huawei.com>
 <20200124170645.3d794ac6@redhat.com>
In-Reply-To: <20200124170645.3d794ac6@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.202.226.53]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 185.176.76.210
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: "mst@redhat.com" <mst@redhat.com>, Marc Zyngier <maz@kernel.org>,
 Will Deacon <will.deacon@arm.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Linuxarm <linuxarm@huawei.com>,
 "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, pbonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IlJFFGVIXeb3

> From: Igor Mammedov [mailto:imammedo@redhat.com]
> Sent: Friday, January 24, 2020 4:07 PM
>=20
> On Fri, 24 Jan 2020 15:02:10 +0000
> Salil Mehta <salil.mehta@huawei.com> wrote:
>=20
> > > From: Igor Mammedov [mailto:imammedo@redhat.com]
> > > Sent: Friday, January 24, 2020 1:54 PM
> > > To: Salil Mehta <salil.mehta@huawei.com>
> > >
> > > On Fri, 24 Jan 2020 11:20:15 +0000
> > > Salil Mehta <salil.mehta@huawei.com> wrote:
> > >
> > > > Hello,
> > > > I am working on vCPU Hotplug feature for ARM64 and I am in mid of u=
nderstanding
> > > > some aspect of device_add/device_del interface of the QEMU.
> > > >
> > > > Observations:
> > > > 1. Any object initialised by qmp_device_add() gets into /machine/un=
attached
> > > > container. I traced the flow to code leg inside  device_set_realize=
d()
> > > > 2. I could see the reverse qmp_device_del() expects the device to b=
e in
> > > > /machine/peripheral container.
> > > > 3. I could see any object initially added to unattached container d=
id not had
> > > > their parents until object_add_property_child() was called further =
in the leg.
> > > > which effectively meant a new property was created and property tab=
le
> > > > populated and child was parented.
> > > > 4. Generally, container  /machine/peripheral was being used whereve=
r
> > > > DEVICE(dev)->id was present and non-null.
> > > >
> > > > Question:
> > > > 1. Wanted to confirm my understanding about the use of having separ=
ate
> > > > containers like unattached, peripheral and anonymous.
> > >
> > > > 2. At init time all the vcpus goes under *unattached* container. No=
w,
> > > > qmp_device_del() cannot be used to unplug them. I am wondering
> > >
> > > device is put into 'unattached' in case it wasn't assigned a parent.
> > > Usually it happens when board creates device directly.
> >
> >
> > Sure, but if we decide that certain number(N) of vcpus are hotplugabble
> > and certain subset of N (say 'n' < 'N') should be allowed to be present
> > or cold-plugged at the init time then I wonder which of the following
> > is correct approach:
> >
> > 1. Bring all of N vcpus at boot time under "peripheral" container
> >                                    OR
> > 2. Just bring subset 'n' of 'N' under "peripheral" container and rest
> >     under "unattached" container? And later as and when rest of the
> >     vcpus are hotplugged they should be transferred from "unattached"
> >     container to "peripheral" container?
>=20
> issue with that is that to put device into "peripheral" container,
> 'the user' must provide 'id'. (currently QEMU isn't able to do it on its =
own
> [1])
>=20
> But it doesn't mean that cold-plugged CPUs can't be unpluged.
> What current users could do is start QEMU like this (simplified version):
>=20
>  $QEMU -smp 1,maxcpus=3DN -device foo-cpu-type,id=3DCPU00 -device
> foo-cpu-type,id=3DCPU01 ...
>=20
> i.e. 1st CPU is not manageable due to lack if 'id' and is created by boar=
d code,
> the rest have 'id' and could be managed.


I understand, that we can somehow assign ids from the QMP interface but
above will not push vcpus into "peripheral" container. They will appear
in "unattached" container but with specified names and as-far-as I can
see in the code 'device_del' can only delete objects/devices from the
'peripheral' container?

Plus, having those many ids specified for over large number of vcpus
does not looks very practical solution. We need interface like auto
Generation of ids even at the boot time. I could see from the link you
have shared that it is already being used by ID_BLOCK subsystem. Can we
create a new subsystem for cpus under this and do the auto Generation
of vcpu ids as well?


> Question is:
>   why you are looking into 'what container' is used for CPUs?


Idea is to be able to use 'device_del' interface to unplug vcpus
both for the cold-plugged and hot-plugged cases using the standard
'device_add' interface.

Plus, there is another unique requirement specifically for realizing
vcpu hotplug for ARM64.

Summary:
Right now ARM architecture does not allows reinitializing the GIC
after VM has booted. Therefore, we are planning to pre-size the GIC
interfaces at init time by initializing all of the possible vcpus
and keep them in 'realized' but 'unavailable' state to the Guest
VM. They shall be made available as-and-when vcpus are hot-plugged
later-on. Therefore, current efforts are to be able to plug and
unplug from the qemu QOM without destroying the existing state of
the devices/objects representing vcpus. These all possible vcpus
shall be created once at the boot time of the VM. The vcpus which
are not available to the Guest VM can be Parked.=20

Once the vcpus are hot-(un)plug'ged only the (pre-)plug/unplug(-request)
interfaces are used to convey this even information to the Guest
VM.

I have tested this solution and it works but I wanted to make sure
that I am not doing anything which breaks any of the existing Qemu
QOM interfaces and basic fundamental idea behind being able to attach
and detach from the Qemu QOM is okay?

Any suggestion are welcome in this regard?


NOTE: I plan to share the patches with the community which includes
both the changes of the Linux Kernel and the QEMU in near future.



> 1) here is what I could find on IDs topic
>    https://lists.gnu.org/archive/html/qemu-block/2015-09/msg00011.html
>=20
> > > >    if all the hotplug devices need to go under the *peripheral* con=
tainer while
> > > > they are hotplugged and during object init time as well?
> > >
> > > theoretically device_del may use QOM path (the later users can get wi=
th
> > > query-hotpluggable-cpus),
> > > but I think it's mostly debugging feature.
> >
> >
> > Sure.
> >
> >
> > > users are supposed to specify 'id' during -device/device_add if they =
are going
> > > to manage that device.
> > > afterwards (like unplugging it). Then they could use that 'id' in oth=
er commands
> > > (including device_del)
> > >
> > > So 'id'-ed devices end up in 'peripheral' container.
> >
> >
> > Sure, what if hotplugged device is removed and then added again? It loo=
ks
> > qmp_device_add() interface will again end up calling the device_set_rea=
lized()
> > which eventually would put hotplugged devices under "unattached" contai=
ner?
>=20
> it won't, see call chain:
>=20
>   qmp_device_add()
>       -> qdev_device_add()
>           -> qdev_set_id()

Ok, sure. I did see the qdev_set_id() interface. Infact, earlier I was actu=
ally
trying to play with it by making it more generic and adding even the 'unatt=
ached'
container handling to it(which is missing right now) and calling it inside =
the
device_set_realized()  instead of below code:

        if (!obj->parent) {
            gchar *name =3D g_strdup_printf("device[%d]", unattached_count+=
+);

            object_property_add_child(container_get(qdev_get_machine(),
                                                    "/unattached"),
                                      name, obj, &error_abort);
            unattached_parent =3D true;
            g_free(name);
        }

Idea of above dabbling was to have common interface for 'unattached' contai=
ner
and call it from virt.c from machvirt_init() where possible vcpus are being
created. Force them to be located either inside 'unttached' or 'peripheral'
container akin to the example you had given.

If we look at qdev_device_add() function, after setting dev->id using
qdev_set_id() (which would also result in parenting of an object under
'peripheral' container), it calls the function to 'realize' the device/obje=
ct
which would end up in hitting above shared code excerpt and now because
it will have the parent already set, the object won't go into 'unattached'
container.

Currently, later cannot be controlled for the cold-lugged vcpus. Therefore,
before this discussion my initial thought process was to either make
qdev_set_id() universal (i.e. include handling for all type of containers
unattached/peripheral/anonymous in qdev_set_id()). Then call it from
machvirt_init() just before the vcpus have been 'realized' so that
cold-plugged cpus could get into 'peripheral' container. This would help
in hot-unplugging using the standard 'device_del' interface.

Earlier, I was not sure if there was any special significance to the
'unattached' container - which by the discussion it looks there is not
any and we could actually choose to place all of the cold-plugged vpus
as well in the 'peripheral' container. Please correct me here if I
have mis-understood anything here?

Now, assuming we are allowed to push all of the vcpus in the 'peripheral'
container then I could simply call unmodified qdev_set_id() just before
the 'realization' of the cold-plugged vcpus. And maybe we could generate
the cpus-ids using auto generate function which has been mentioned in the
link you shared and just like it is being done for the block devices.

Thoughts?


> > > > 3. I could not see any device being place under *anonymous* contain=
er during
> > > init time. What is the use of this container?
> > >
> > > if I recall it right, devices created with help of device_add but wit=
hout
> 'id'
> > > go to this container
> >
> >
> > Any examples on top of your head where such an interface might be of us=
e?
>=20
> ex:
> one could use -device/device_add without any ids if such devices aren't p=
lanned
> to be unplugged during runtime or for unpluggable devices

Ok. Thanks!


Best Regards
Salil
