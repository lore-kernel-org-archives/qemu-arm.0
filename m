Received: by 10.223.134.117 with SMTP id 50csp12847674wrw;
        Thu, 4 Jan 2018 11:22:34 -0800 (PST)
X-Google-Smtp-Source: ACJfBovB7yqJP+E972UnYpKTVHyYNBLONWeyqcAkNXpZkg7UGRnYMK8c3bnNdVJLidVLiMkShYTQ
X-Received: by 10.129.200.11 with SMTP id n11mr564504ywi.221.1515093753954;
        Thu, 04 Jan 2018 11:22:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515093753; cv=none;
        d=google.com; s=arc-20160816;
        b=IQ1d3l1EVxj+ebxLsYpRPg63YJXrW+qXV83okVi4on72V8EUj2pbooVu0wtMmqZTyG
         LLcrj9IngbatwyyjfmyEXqJnkHVGkB44A2TkGdheX/XIW1HcQF5Pn3iDEZ+p93YZwGBy
         4irfrLyrlgeMsPe18RNnjs+7HOEyaz6Gi5N54IGm6tbwjv6Mr6OvVpR0YAQ5IBf5KOhY
         o2AkojoennSMu2CnRNnI0AKZVCSXq/2SHyJWUnIk02dDIPkIzV5CUH9YJK+aNgRzk6AN
         NE02M8xr/arZscpZykF3ae+7pAX/OZonkG8zaN7glmiOiLwnGZW9RbgxxLFfBTy+Hwdt
         b7jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=H4ELfDvdY6YasszyAkZq3tnhAqHyulmnQeKrr5hf4AY=;
        b=v0UvrrVOWrNx47RgC6jYDxKNYVYvbuerqeRqWkcJqmLpEe30lz/cjBK+0PUdMRzBnk
         65cG8Q5Jd3+Hr0Ke0uytSHHc286mJwgn7Q93weHfwsLW3uo8/fKWKy2Ah7clxX+N91kZ
         tlkqmlwZ4dX78twrdWup46OG3roZ0ub0F1sVrQrcfVYBjVUeleqvlS8TUWs647yTk0cU
         BPtl/ehUVL4ykzXmclt7JbsNW0IDZpL3RyqIv2Y86uGgf5i8if5ciHFxcn7Gmfu0QUh+
         t3klRmcTuSLqG0gqy5OTI/7Z/JTVha608ud8+SjkWoXIjvwSCV8fVmzJuziaE67XOYkJ
         Tf2Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w13si841742ybl.783.2018.01.04.11.22.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 04 Jan 2018 11:22:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34753 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eXB61-00005O-Du
	for alex.bennee@linaro.org; Thu, 04 Jan 2018 14:22:33 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39882)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1eXB5o-0008VT-GB
	for qemu-arm@nongnu.org; Thu, 04 Jan 2018 14:22:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1eXB5j-00025w-Ej
	for qemu-arm@nongnu.org; Thu, 04 Jan 2018 14:22:20 -0500
Received: from mx1.redhat.com ([209.132.183.28]:54628)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1eXB5j-00025F-8R; Thu, 04 Jan 2018 14:22:15 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 383AD3DE44;
	Thu,  4 Jan 2018 19:22:14 +0000 (UTC)
Received: from localhost (ovpn-116-28.gru2.redhat.com [10.97.116.28])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E5FCB60BE7;
	Thu,  4 Jan 2018 19:22:04 +0000 (UTC)
Date: Thu, 4 Jan 2018 17:22:03 -0200
From: Eduardo Habkost <ehabkost@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Message-ID: <20180104192203.GD3407@localhost.localdomain>
References: <20180104144046.30793-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20180104144046.30793-1-f4bug@amsat.org>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.9.1 (2017-09-22)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Thu, 04 Jan 2018 19:22:14 +0000 (UTC)
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
	Alistair Francis <alistair.francis@xilinx.com>,
	=?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
	qemu-arm@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Sascha Silbe <silbe@linux.vnet.ibm.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DZ4XndqS1IuS

On Thu, Jan 04, 2018 at 11:40:40AM -0300, Philippe Mathieu-Daud=E9 wrote:
> Hi,
>=20
> This RFC series is intended to simplify Flattened Device Tree support,
> in particular the 'compatible' FDT entry, when Linux names mismatches
> QEMU ones, but this is the same device modelled.
>=20
> Eventually this might help to remove the QDevAlias qdev_alias_table[]
> in qdev-monitor.c.
>=20

Didn't look closely at the patches yet, but this sounds like a
nice generic way to replace other alias systems.  We have at
least:

* qdev-monitor.c: qdev_alias_table[] (as mentioned above)
* chardev/char.c: chardev_alias_table[]
* target/alpha/cpu.c: alpha_cpu_aliases[]
* target/ppc/cpu-models.c: ppc_cpu_aliases[]
* include/hw/boards.h: MachineClass::alias

Probably there are others I couldn't find.


> So far this is only a 'proof of concept'.
> To see how the qtests perform, I only modified 3 devices, 2 used by the
> Xilinx Zynq machines (Cadence), and the e1000 (used by the PXE test).
>=20
> Regards,
>=20
> Phil.
>=20
> Philippe Mathieu-Daud=E9 (6):
>   qom: introduce TypeInfo name aliases
>   hw/net/e1000: real device name is 'e1000-82540em', 'e1000' is an alia=
s
>   hw/char/cadence_uart: add FDT aliases
>   arm/xlnx-zynq: use FDT names for the Cadence UART
>   hw/net/cadence_gem: add FDT names as alias
>   hw/arm/xlnx-zynq: use FDT names for the Cadence GEM
>=20
>  include/qom/object.h   |  3 +++
>  hw/arm/xilinx_zynq.c   |  2 ++
>  hw/arm/xlnx-zynqmp.c   |  4 ++--
>  hw/char/cadence_uart.c |  7 +++++++
>  hw/net/cadence_gem.c   |  6 ++++++
>  hw/net/e1000.c         |  5 ++++-
>  qom/object.c           | 18 ++++++++++++++++--
>  7 files changed, 40 insertions(+), 5 deletions(-)
>=20
> --=20
> 2.15.1
>=20

--=20
Eduardo
