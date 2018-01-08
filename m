Received: by 10.28.173.206 with SMTP id w197csp2656183wme;
        Mon, 8 Jan 2018 08:25:26 -0800 (PST)
X-Google-Smtp-Source: ACJfBovBJ/goZXzSieO31Ervx+nq3bc4x9UvcbLJ6t/U8fUTwq6h9G2Mkva3nfLf9E2rjfGJ5Xqj
X-Received: by 10.37.175.79 with SMTP id c15mr11811099ybj.271.1515428726229;
        Mon, 08 Jan 2018 08:25:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515428726; cv=none;
        d=google.com; s=arc-20160816;
        b=t50JEZhTWi+nb47XaYTvFf2PXC/t5AqFFrL34Il/faa9ZmQPWodUwq7AGh2Qvlelpv
         pxXU6jnO7YCfwO5I+Tvqy6VFQTbEhjOnfNKrNJG66yhl3hu8ib08XkX7Ex55093eZ7a5
         097uSeD+pGGV0Pp4nezIhJ97CKPLDUsmF3/MwgoB3fxViU20P1FTtBkSBoyduWaYS8G8
         uhUiOXzV+WtKjFXqdrxe5XNykBAvKS3em7Btus1/0oIjff0f3QjOzSt/mzipRZ3X05Vm
         tuBv6IzsnjXyV3A+9IQ13SmZ96KaTvCNwAOa76a/QJdTL0uR4vP3751/AKz/bDBx3n+l
         X78A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=LGUYwxubm868CPFY6ddqNvZxWu0o1HnJVVZncBqQ9rM=;
        b=P4r8wwiF0kGHge778kiXp/+v+8RquLs0AeFnHQM0BOLAXh0vWZ1EFG8+s7YDZFxylU
         kAE1xS83tp4u0xpiso4YBZhzcB0G4Fr9i/JuoYS5HUA0LgTeDYL4twYfwFOyaoMUyuQe
         pOZ5qgJYjnosMAyYIJwOtW1f+YU+655Cu5GZPFcSWlvi5DhzPieglVa6ZyRPrDu2vbCv
         suDFueYJBoFJUhDAGLZ7BzkgW850FNBdXQcbHtNnKmd15g0XQ5EmVhZz4WxT6fi7nWN3
         ZaspyAljSudu8b3+sO+tbTqBdJahOafPtzcqiOh1r211GLJ6FJ+ENwezQMl4huhIhkXF
         L/iA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q5si69874ybd.679.2018.01.08.08.25.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 08 Jan 2018 08:25:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42952 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eYaEn-0005ix-HD
	for alex.bennee@linaro.org; Mon, 08 Jan 2018 11:25:25 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54356)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1eYa2e-00032d-IQ
	for qemu-arm@nongnu.org; Mon, 08 Jan 2018 11:12:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1eYa2a-0003bh-F1
	for qemu-arm@nongnu.org; Mon, 08 Jan 2018 11:12:52 -0500
Received: from mx1.redhat.com ([209.132.183.28]:57412)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1eYa2a-0003Zw-6D; Mon, 08 Jan 2018 11:12:48 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3E4B3DF03;
	Mon,  8 Jan 2018 16:12:46 +0000 (UTC)
Received: from localhost (ovpn-116-66.gru2.redhat.com [10.97.116.66])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 86B8360C80;
	Mon,  8 Jan 2018 16:12:32 +0000 (UTC)
Date: Mon, 8 Jan 2018 14:12:31 -0200
From: Eduardo Habkost <ehabkost@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20180108161231.GF6646@localhost.localdomain>
References: <20180104144046.30793-1-f4bug@amsat.org>
	<20180104192203.GD3407@localhost.localdomain>
	<20180108135122.637e478a@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20180108135122.637e478a@redhat.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.9.1 (2017-09-22)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Mon, 08 Jan 2018 16:12:46 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
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
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
	qemu-arm@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
	=?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Sascha Silbe <silbe@linux.vnet.ibm.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MvYLKr9oJ052

On Mon, Jan 08, 2018 at 01:51:22PM +0100, Igor Mammedov wrote:
> On Thu, 4 Jan 2018 17:22:03 -0200
> Eduardo Habkost <ehabkost@redhat.com> wrote:
>=20
> > On Thu, Jan 04, 2018 at 11:40:40AM -0300, Philippe Mathieu-Daud=E9 wr=
ote:
> > > Hi,
> > >=20
> > > This RFC series is intended to simplify Flattened Device Tree suppo=
rt,
> > > in particular the 'compatible' FDT entry, when Linux names mismatch=
es
> > > QEMU ones, but this is the same device modelled.
> > >=20
> > > Eventually this might help to remove the QDevAlias qdev_alias_table=
[]
> > > in qdev-monitor.c.
> > >  =20
> >=20
> > Didn't look closely at the patches yet, but this sounds like a
> > nice generic way to replace other alias systems.  We have at
> > least:
> Though it seems easy and trivial, I'm a bit concerned about using
> QOM types for the task though.
> Also see commit 6acbe4c6f which labels aliases as a bad idea
> and says that they are there only for compatibility and shouldn't
> be used.

It's true that they are there only for compatibility.  But I
don't think commit 6acbe4c6f label aliases in general as a bad
idea.  It just removes a very limited mechanism and make it
specific to the only place where it was needed.  Now we have at
least 5 different places where we do the same thing, so now it
might be worth it.

But:

> So far I agree with that statement, because it introduces
> ambiguity in code used internally and more worrying is that
> this ambiguity will increase user visible ABI (think of '-device_add FO=
O_ALIAS')
> that we would need to maintain afterwards.

This is a reasonable worry.  If aliases exist only for
compatibility, they should be restricted to the places where
compatibility is really needed.

For example: aliases that affect -cpu shouldn't necessarily
affect -device.


> It would be nice to have unified alias API, but I think it should
> be separate one and limited to the same scope (i.e. compat stuff),
> and even that won't be easy as different alias impl. we have now
> have a different needs.

Starting with a separate API would be a good way to understand
what are our real needs, before deciding if we really want
aliases that affect all object_new() calls.

>=20
> wrt this series targeted usage, I'd prefer that object_new/initialize
> would use real type names when creating devices as it does currently
>=20
> FDT linux guest specific names wouldn't seep into device model
> itself. Firmware (FDT or ACPI) should be separate from device
> implementation.

I agree.  The QOM names and FDT names have different expectations
and assumptions (the commas added to some type names in this
series are one example).  Having the QOM type and FDT name match
on most cases is nice, but this shouldn't be a requirement.

I don't think we should rename user-visible QOM types and change
the command-line interface (and require additional compatibility
cruft) just to make it more convenient for internal FDT code.


>=20
> If really there is need to dynamically scan present devices
> and build FDT from result, then probably we should introduce
> interface that devices could implement if necessary.
> (I was thinking about such possibility for ACPI). But so far
> it looked to me as too much overhead for what we do now.
>=20
>=20
> > * qdev-monitor.c: qdev_alias_table[] (as mentioned above)
> > * chardev/char.c: chardev_alias_table[]
> > * target/alpha/cpu.c: alpha_cpu_aliases[]
> > * target/ppc/cpu-models.c: ppc_cpu_aliases[]
> > * include/hw/boards.h: MachineClass::alias
> >=20
> > Probably there are others I couldn't find.
> >=20
> >=20
> > > So far this is only a 'proof of concept'.
> > > To see how the qtests perform, I only modified 3 devices, 2 used by=
 the
> > > Xilinx Zynq machines (Cadence), and the e1000 (used by the PXE test=
).
> > >=20
> > > Regards,
> > >=20
> > > Phil.
> > >=20
> > > Philippe Mathieu-Daud=E9 (6):
> > >   qom: introduce TypeInfo name aliases
> > >   hw/net/e1000: real device name is 'e1000-82540em', 'e1000' is an =
alias
> > >   hw/char/cadence_uart: add FDT aliases
> > >   arm/xlnx-zynq: use FDT names for the Cadence UART
> > >   hw/net/cadence_gem: add FDT names as alias
> > >   hw/arm/xlnx-zynq: use FDT names for the Cadence GEM
> > >=20
> > >  include/qom/object.h   |  3 +++
> > >  hw/arm/xilinx_zynq.c   |  2 ++
> > >  hw/arm/xlnx-zynqmp.c   |  4 ++--
> > >  hw/char/cadence_uart.c |  7 +++++++
> > >  hw/net/cadence_gem.c   |  6 ++++++
> > >  hw/net/e1000.c         |  5 ++++-
> > >  qom/object.c           | 18 ++++++++++++++++--
> > >  7 files changed, 40 insertions(+), 5 deletions(-)
> > >=20
> > > --=20
> > > 2.15.1
> > >  =20
> >=20
>=20

--=20
Eduardo
