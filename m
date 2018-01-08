Received: by 10.28.173.206 with SMTP id w197csp2434218wme;
        Mon, 8 Jan 2018 04:51:54 -0800 (PST)
X-Google-Smtp-Source: ACJfBotT3Mnl1YW+r8gh+OOFLi6IE7rUzJc5GMUM3HX/ORDfdjNZDr/K+NnvnlFwCZ53TQGfZdbe
X-Received: by 10.13.231.129 with SMTP id q123mr10960270ywe.388.1515415914893;
        Mon, 08 Jan 2018 04:51:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515415914; cv=none;
        d=google.com; s=arc-20160816;
        b=lvwl6Qk2eRxgoOMtu7M02bphmM713PBze6x4RKlMkpAqWZ6sSkSU17WmeQ6KoYZJGA
         hNrT9GUpe8mHDPBED4MRILwHA9G4b1RdiHPfr3vqsDEuZe1v+5J5jiJBs/B/hCE2TDtH
         blMvQt63BojOzooc1Zxe7zLWRa+ormV6eWQPPJGfbs1+ZYu0cS1wY1xF0/JSC9GOpSZv
         4TdJYn+BgyEdS2ClOGO8QzpYWvQh7jZ8q8gRcAZA6UwHTVpsWdiZ1Bq4pDrUeV+8446K
         vXSeOAsm8LOnsSgMwS677jcRLc8WKrIsRuOkT4y0CX5t7rnLYIV5bcR1SrdWJRtztnVf
         1t4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date:arc-authentication-results;
        bh=SHawbNDq4CGlx6dasdYC4MTxy9fz7Efz6Jpfm27MdqQ=;
        b=YzoRZ42vU4eGc7f35wk0mGllwwSnesEavoEJwYMv1htqfTae+PbY0+IXczfFPYWVzB
         KKN+gT4gczpiDJLVuIpDg7xnOVYZglCk5810sOSljOpKDipZ87LFftUHAs+fhsQWfYno
         jyfDGshZUCpuZn/AcUzHuglgtmnHUkWnoktToiDEvuBkQXET5eS2ro1pscpUvglmEDeT
         UVycd6BZg5qH+b1etjq7S5xflVoDh1umD6FPoMcz85Hv1BFPftnTxrBdQFG7/Hacy9OF
         5xuDAATyEb/WfUaiXU66vsSRooDON7im9Yc71l2w+d7/It8t9t+08799BwiCKOTifO+h
         NRxw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x132si1447852ybb.356.2018.01.08.04.51.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 08 Jan 2018 04:51:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60841 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eYWuA-0005h2-CA
	for alex.bennee@linaro.org; Mon, 08 Jan 2018 07:51:54 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53332)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1eYWu0-0005gk-8f
	for qemu-arm@nongnu.org; Mon, 08 Jan 2018 07:51:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1eYWtx-0000T8-2X
	for qemu-arm@nongnu.org; Mon, 08 Jan 2018 07:51:44 -0500
Received: from mx1.redhat.com ([209.132.183.28]:28988)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1eYWtw-0000SH-Py; Mon, 08 Jan 2018 07:51:41 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A61E613A4E;
	Mon,  8 Jan 2018 12:51:39 +0000 (UTC)
Received: from localhost (unknown [10.43.2.134])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BB4915DC1E;
	Mon,  8 Jan 2018 12:51:24 +0000 (UTC)
Date: Mon, 8 Jan 2018 13:51:22 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Message-ID: <20180108135122.637e478a@redhat.com>
In-Reply-To: <20180104192203.GD3407@localhost.localdomain>
References: <20180104144046.30793-1-f4bug@amsat.org>
	<20180104192203.GD3407@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Mon, 08 Jan 2018 12:51:39 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [RFC PATCH 0/6] qom: introduce TypeInfo name aliases
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Alexander Graf <agraf@suse.de>, Fam Zheng <famz@redhat.com>,
	qemu-devel@nongnu.org, Juan Quintela <quintela@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>,
	qemu-arm@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
	=?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Andreas =?UTF-8?B?RsOkcmJlcg==?= <afaerber@suse.de>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Sascha Silbe <silbe@linux.vnet.ibm.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: E1EEri148BvO

On Thu, 4 Jan 2018 17:22:03 -0200
Eduardo Habkost <ehabkost@redhat.com> wrote:

> On Thu, Jan 04, 2018 at 11:40:40AM -0300, Philippe Mathieu-Daud=C3=A9 wro=
te:
> > Hi,
> >=20
> > This RFC series is intended to simplify Flattened Device Tree support,
> > in particular the 'compatible' FDT entry, when Linux names mismatches
> > QEMU ones, but this is the same device modelled.
> >=20
> > Eventually this might help to remove the QDevAlias qdev_alias_table[]
> > in qdev-monitor.c.
> >  =20
>=20
> Didn't look closely at the patches yet, but this sounds like a
> nice generic way to replace other alias systems.  We have at
> least:
Though it seems easy and trivial, I'm a bit concerned about using
QOM types for the task though.
Also see commit 6acbe4c6f which labels aliases as a bad idea
and says that they are there only for compatibility and shouldn't
be used.
So far I agree with that statement, because it introduces
ambiguity in code used internally and more worrying is that
this ambiguity will increase user visible ABI (think of '-device_add FOO_AL=
IAS')
that we would need to maintain afterwards.
It would be nice to have unified alias API, but I think it should
be separate one and limited to the same scope (i.e. compat stuff),
and even that won't be easy as different alias impl. we have now
have a different needs.

wrt this series targeted usage, I'd prefer that object_new/initialize
would use real type names when creating devices as it does currently

FDT linux guest specific names wouldn't seep into device model
itself. Firmware (FDT or ACPI) should be separate from device
implementation.

If really there is need to dynamically scan present devices
and build FDT from result, then probably we should introduce
interface that devices could implement if necessary.
(I was thinking about such possibility for ACPI). But so far
it looked to me as too much overhead for what we do now.


> * qdev-monitor.c: qdev_alias_table[] (as mentioned above)
> * chardev/char.c: chardev_alias_table[]
> * target/alpha/cpu.c: alpha_cpu_aliases[]
> * target/ppc/cpu-models.c: ppc_cpu_aliases[]
> * include/hw/boards.h: MachineClass::alias
>=20
> Probably there are others I couldn't find.
>=20
>=20
> > So far this is only a 'proof of concept'.
> > To see how the qtests perform, I only modified 3 devices, 2 used by the
> > Xilinx Zynq machines (Cadence), and the e1000 (used by the PXE test).
> >=20
> > Regards,
> >=20
> > Phil.
> >=20
> > Philippe Mathieu-Daud=C3=A9 (6):
> >   qom: introduce TypeInfo name aliases
> >   hw/net/e1000: real device name is 'e1000-82540em', 'e1000' is an alias
> >   hw/char/cadence_uart: add FDT aliases
> >   arm/xlnx-zynq: use FDT names for the Cadence UART
> >   hw/net/cadence_gem: add FDT names as alias
> >   hw/arm/xlnx-zynq: use FDT names for the Cadence GEM
> >=20
> >  include/qom/object.h   |  3 +++
> >  hw/arm/xilinx_zynq.c   |  2 ++
> >  hw/arm/xlnx-zynqmp.c   |  4 ++--
> >  hw/char/cadence_uart.c |  7 +++++++
> >  hw/net/cadence_gem.c   |  6 ++++++
> >  hw/net/e1000.c         |  5 ++++-
> >  qom/object.c           | 18 ++++++++++++++++--
> >  7 files changed, 40 insertions(+), 5 deletions(-)
> >=20
> > --=20
> > 2.15.1
> >  =20
>=20

