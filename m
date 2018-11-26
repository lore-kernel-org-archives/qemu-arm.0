Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp5559040wrt;
        Mon, 26 Nov 2018 05:28:08 -0800 (PST)
X-Google-Smtp-Source: AJdET5er9mvLjsdUG+Yg08MmtlA9EYiVSQIfKHaRGUZYcbLN5njWCD+vdtv/ELRAz49bYKcTWpJB
X-Received: by 2002:a81:2ac1:: with SMTP id q184mr27432597ywq.99.1543238888325;
        Mon, 26 Nov 2018 05:28:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543238888; cv=none;
        d=google.com; s=arc-20160816;
        b=I6BIs5jbJeZehUluBfpgFonqJJWVlvirnklxBtjYxyib3pP2b0QmSdpJtQU55WexGy
         HPAswPBFwOHaTgyx9ABOVmBHOdaNMx3AfxwkuaLQWP4ZsTtIaBMiLj56OncI171/mJqs
         BU0BP1QnP1b6lw2bbufKRANi30uBR29yvlTCmzUTC5VMonSPNah+dRWrbr1e2DYc3kBn
         R5LPq+C8Gc7ONPbdcSXJR3LO4a5WUcX4VwF3VF7ISm3h34N3xYaX28d36/jcB+SnKqv2
         U+Rp79179wOyXcaIOGYXAehI2cW6uTSljF3AaDK162y8It06M6QlzcJJIJImK5dGPW+6
         vg0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=FAFAO9oAClkvIu8URWtqtM6OVxm2v8dD2MboyM+vuF0=;
        b=bCAwrwA7co3oBSbxzF1EXbMwbJsBpSx94etlgN5DrMEY9O84X/d8QUpiEi7wPBIyRg
         AYJrQRBwEbk1VTF+2dYOSYOsf45hGwGDUw4/dYPm/xc/+97260++8XUZy2L63jPR+P6R
         Xeg78ibZRsALsnosIq2z6g6CLP0gJHtbtiDijUIZczjMstJHFqQtiADRtrmG1uiBzVbe
         hPmQkafxzv5jFn6Ka/vl9eqri/qauJmxG2e4YiHx0pY7KticoheA9NKRg31bmwJN1sQq
         p0vCruZ/FCzkan8CvQa1oXOltxdUDE6g1qjXm2hoau4MiqatqysnWngrB3EL5UExMh+n
         hV3Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f11-v6si221935ybg.275.2018.11.26.05.28.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 26 Nov 2018 05:28:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35954 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gRGvn-0002pF-Ia
	for alex.bennee@linaro.org; Mon, 26 Nov 2018 08:28:07 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34268)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gRGvO-0002jZ-2k
	for qemu-devel@nongnu.org; Mon, 26 Nov 2018 08:27:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gRGvN-0006ME-8x
	for qemu-devel@nongnu.org; Mon, 26 Nov 2018 08:27:42 -0500
Received: from mx1.redhat.com ([209.132.183.28]:47830)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1gRGvL-0006Jx-A6; Mon, 26 Nov 2018 08:27:39 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 24A9D2D804;
	Mon, 26 Nov 2018 13:27:37 +0000 (UTC)
Received: from localhost (ovpn-116-21.gru2.redhat.com [10.97.116.21])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 41295608E6;
	Mon, 26 Nov 2018 13:27:33 +0000 (UTC)
Date: Mon, 26 Nov 2018 11:27:31 -0200
From: Eduardo Habkost <ehabkost@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Message-ID: <20181126132731.GJ18284@habkost.net>
References: <20181123091729.29921-1-luc.michel@greensocs.com>
	<20181123091729.29921-2-luc.michel@greensocs.com>
	<20181123181059.GN18284@habkost.net>
	<65d3a572-9a80-f332-1f88-69e43e8a3663@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <65d3a572-9a80-f332-1f88-69e43e8a3663@redhat.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Mon, 26 Nov 2018 13:27:37 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v7 01/16] hw/cpu: introduce CPU clusters
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
Cc: Peter Maydell <peter.maydell@linaro.org>, alistair@alistair23.me,
	mark.burton@greensocs.com, qemu-devel@nongnu.org,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
	saipava@xilinx.com, edgari@xilinx.com, qemu-arm@nongnu.org,
	Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AohcFI9uSpM/

On Sun, Nov 25, 2018 at 10:27:04PM +0100, Philippe Mathieu-Daud=E9 wrote:
> Hi Eduardo,
>=20
> On 23/11/18 19:10, Eduardo Habkost wrote:
> > Hi,
> >=20
> > Sorry for not reviewing this series earlier.  I just stumbled
> > upon this part of the code:
> >=20
> > On Fri, Nov 23, 2018 at 10:17:14AM +0100, Luc Michel wrote:
> >> This commit adds the cpu-cluster type. It aims at gathering CPUs fro=
m
> >> the same cluster in a machine.
> >>
> >> For now it only has a `cluster-id` property.
> >>
> >> Signed-off-by: Luc Michel <luc.michel@greensocs.com>
> >> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> >> Reviewed-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> >> Tested-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> >> Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> > [...]
> >> +static void cpu_cluster_init(Object *obj)
> >> +{
> >> +    static uint32_t cluster_id_auto_increment;
> >> +    CPUClusterState *cluster =3D CPU_CLUSTER(obj);
> >> +
> >> +    cluster->cluster_id =3D cluster_id_auto_increment++;
> >=20
> > I see that you implemented this after a suggestion from Philippe,
> > but I'm worried about this kind of side-effect on object/device
> > code.  I'm afraid this will bite us back in the future.  We were
> > bitten by problems caused by automatic cpu_index assignment on
> > CPU instance_init, and we took a while to fix that.
>=20
> Oops, thanks for catching this. I'm not aware of the cpu_index past iss=
ue.
>=20
> >=20
> > If you really want to do this and assign cluster_id
> > automatically, please do it on realize, where it won't have
> > unexpected side-effects after a simple `qom-list-properties` QMP
> > command.
>=20
> This looks clean enough to me.
> Do you prefer we don't use static auto_increment at all?

I would prefer to avoid the static variable if possible, but I
won't reject it if the alternatives make the API too complex to
use.

In either case, I'd like to ensure the caveats of the cluster_id
field are clearly documented: no guarantees about ordering or
predictability, making it not appropriate for external
interfaces.


>=20
> >=20
> > I would also add a huge warning above the cluster_id field
> > declaration, mentioning that the field is not supposed to be used
> > for anything except debugging.  I think there's a large risk of
> > people trying to reuse the field incorrectly, just like cpu_index
> > was reused for multiple (conflicting) purposes in the past.
> >=20
> >=20
> >> +}
> >> +
> >> +static Property cpu_cluster_properties[] =3D {
> >> +    DEFINE_PROP_UINT32("cluster-id", CPUClusterState, cluster_id, 0=
),
> >> +    DEFINE_PROP_END_OF_LIST()
> >> +};
> > [...]
> >=20

--=20
Eduardo
