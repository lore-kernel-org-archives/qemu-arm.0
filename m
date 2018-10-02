Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp4970842wrt;
        Tue, 2 Oct 2018 05:09:02 -0700 (PDT)
X-Google-Smtp-Source: ACcGV61qwEQz73HRriUQRm5v5rftUZHt2jRHscFMMpEuC/072sn+M+V9iqOTCzykregFjPhRRrh9
X-Received: by 2002:a37:4e49:: with SMTP id c70-v6mr11802507qkb.27.1538482142565;
        Tue, 02 Oct 2018 05:09:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538482142; cv=none;
        d=google.com; s=arc-20160816;
        b=fQG8KKnPa7HyqHA/YVxie5yjYYgCWzttNKrzlJKpgpI8KfYYRmEtEjLloTHLuRplcg
         oXiuDKnX/kjqbsTPtElnjmKaUF+1M91TPnU9jh5Fg0V/VzMsKoj3BmPCae6OUbbynjP3
         WYlOWvWWuCZNq2qkhJNGwsjToAd218GsxfYv805lBh7MVxbyX29G92IdCS8NZdK15HGU
         fSf1OTFkyO/SN1+HIdQAoTd/Ivd1s1yE6IZwlCTl3vcORT9XUfhWOYF2tt2RzSuiR6vH
         Zqn/cXtxukiFjBg8pcJmxf3peAz17iTRMC+O9g2mzdeBP3s8nWgaPPjF14/56SHdZElU
         894w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature;
        bh=Xhbpyp9VfdrjUUUNTRMHZ1sl4ljn9zRvlYS4JwAKiA8=;
        b=mHh99bbPhx7W3AOqiFTzPviHysCuNV63R8HU/nBsuawwrniegFQ+L+tzdHYtFqlIhk
         8+KmZCl3olssLhAwV78QpkPcM+1nNNe/s78TOxeMpuM88Sf+Lrq1NFoddmTrX2V8Seoj
         C1PtZ15I13c1e6LmNGFtq28zQuwQjZPPk9S474M0uHhiXzF0jNAPVnnV+wYKde4FmDp6
         R+2+6JJ4qQU8lE5C9rxtjot/o9d0VS7U2s5Dm6MFMBr6h4a7qVgNqbdbWPUhDDslEOew
         Emw3LDuZtRJwqRxKu2cmxFwWN5yJu9IbmhqFTTr2CGFvYix4mnUYBF9pJ5fk5LHJ1PEJ
         QaNg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=UVU5Zkri;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m189-v6si1825473qkd.19.2018.10.02.05.09.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 02 Oct 2018 05:09:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=UVU5Zkri;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43350 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g7JU6-0000o0-2o
	for alex.bennee@linaro.org; Tue, 02 Oct 2018 08:09:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35251)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1g7JSf-0000AQ-1R
	for qemu-devel@nongnu.org; Tue, 02 Oct 2018 08:07:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1g7JJz-0003R9-Jk
	for qemu-devel@nongnu.org; Tue, 02 Oct 2018 07:58:36 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:41426)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1g7JJz-0003QY-5D
	for qemu-devel@nongnu.org; Tue, 02 Oct 2018 07:58:35 -0400
Received: by mail-oi1-x243.google.com with SMTP id l197-v6so1245704oib.8
	for <qemu-devel@nongnu.org>; Tue, 02 Oct 2018 04:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=Xhbpyp9VfdrjUUUNTRMHZ1sl4ljn9zRvlYS4JwAKiA8=;
	b=UVU5Zkriq8EkAcxAjXItR1UByNr6i2QhnxP8YbqB26RRPXavbQu1FnVzlu6url4tKS
	z6Vb9SvG9+5fZDUXtr5ihGF5x8CvUW8DP9H23h1/Qt6PITJ/yVLUq9orVYCioNWgfP9U
	RdSPmO5gidpDI+YKgVNYZf2zePxh7v1fMM/8A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=Xhbpyp9VfdrjUUUNTRMHZ1sl4ljn9zRvlYS4JwAKiA8=;
	b=dexWrcC5qPB9Gy+6UTfxWAYs5R5rL1zFdJDLAUHFQFhAX5Gn6at/bnKdsahxzyIk1k
	huWHAxjTv+/CZqer5Lb1ooY9dfSAyHFEYV3QefJEHLyDrWxRf2A8gGOSQdhLXNOcTQLO
	1kHis5u9fcW3ty5ftg7gnx4TwdJTiUdxPIPIDwyoYtBqRONiZv6xnBqx93oQ6upfzdKT
	7vDO9/VfNAqnsIR05cgUL3y/ktxBUGE/KtIFIUJ6UfJlLnTPRD0ndiLoYXIFIeS3lZhw
	kRPGPeYllFIjZv/HxBlI+4w/7T1tlxLUuby+dfjGxr2tywSiUSK2Bef6201xJJkJF/K4
	cALQ==
X-Gm-Message-State: ABuFfojW2XFWL4j0lKWW/fnEQLbSh41JPLMWmq2JKJ2tv2YhIepf3AFH
	mjGjBmVUdaBWRoIuJcS7N1Coe+TOI5JGJGZ+Bro/zQ==
X-Received: by 2002:aca:68ce:: with SMTP id
	o75-v6mr6065361oik.44.1538481514354; 
	Tue, 02 Oct 2018 04:58:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:20e3:0:0:0:0:0 with HTTP;
	Tue, 2 Oct 2018 04:58:13 -0700 (PDT)
In-Reply-To: <35ffbd68-f783-b6f4-18a2-dd995819c046@redhat.com>
References: <20181001115704.701-1-luc.michel@greensocs.com>
	<20181001115704.701-16-luc.michel@greensocs.com>
	<35ffbd68-f783-b6f4-18a2-dd995819c046@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Oct 2018 12:58:13 +0100
Message-ID: <CAFEAcA9vHi=qrV-Aj5ptgBQntafLGwL6VezxnmOuuR=6=Pr8cA@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::243
Subject: Re: [Qemu-devel] [PATCH v2 15/15] arm/xlnx-zynqmp: put APUs and
 RPUs in separate GDB groups
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
Cc: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
	Alistair Francis <alistair@alistair23.me>,
	Mark Burton <mark.burton@greensocs.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	Sai Pavan Boddu <saipava@xilinx.com>, Edgar Iglesias <edgari@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
	Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3BcVLXt0qGtg

On 2 October 2018 at 12:33, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>=
 wrote:
> Cc'ing more QOM involved people.
>
> On 01/10/2018 13:57, Luc Michel wrote:
>> Create two separate QOM containers for APUs and RPUs to indicate to the
>> GDB stub that those CPUs should be put in different processes.
>>
>> Signed-off-by: Luc Michel <luc.michel@greensocs.com>
>> ---
>>  hw/arm/xlnx-zynqmp.c | 7 +++++--
>>  1 file changed, 5 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
>> index c195040350..5e92adbc71 100644
>> --- a/hw/arm/xlnx-zynqmp.c
>> +++ b/hw/arm/xlnx-zynqmp.c
>> @@ -22,10 +22,11 @@
>>  #include "hw/arm/xlnx-zynqmp.h"
>>  #include "hw/intc/arm_gic_common.h"
>>  #include "exec/address-spaces.h"
>>  #include "sysemu/kvm.h"
>>  #include "kvm_arm.h"
>> +#include "exec/gdbstub.h"
>>
>>  #define GIC_NUM_SPI_INTR 160
>>
>>  #define ARM_PHYS_TIMER_PPI  30
>>  #define ARM_VIRT_TIMER_PPI  27
>> @@ -175,17 +176,18 @@ static void xlnx_zynqmp_create_rpu(XlnxZynqMPState=
 *s, const char *boot_cpu,
>>                                     Error **errp)
>>  {
>>      Error *err =3D NULL;
>>      int i;
>>      int num_rpus =3D MIN(smp_cpus - XLNX_ZYNQMP_NUM_APU_CPUS, XLNX_ZYNQ=
MP_NUM_RPU_CPUS);
>> +    Object *rpu_group =3D gdb_cpu_group_container_get(OBJECT(s));
>
> I'd rather keep this generic: not involve 'gdb' container name.

Yes, I agree. We should structure how we construct our
model to follow what the hardware has (two CPU clusters
with 4 cores each), and then the gdb code should introspect
the system later to decide how it exposes things to the gdb
user. GDB specifics should (as far as possible) be kept out
of the board code.

The fact that there are two clusters here also
affects other things, like whether they have the
same view of memory, whether they can share translated
code (they shouldn't but do at the moment), and so on --
it's not just a GDB-relevant distinction. So we should
be modelling it somehow, definitely. I don't have a clear
view how just yet.

This probably ties into the stuff I have somewhere on
my todo list about supporting multiple heterogenous
systems. The problem with this xilinx board is that it
is trying to model that kind of system but we don't actually
properly support that in QEMU yet.

thanks
-- PMM
