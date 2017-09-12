Received: by 10.223.172.38 with SMTP id v35csp6836152wrc;
        Tue, 12 Sep 2017 03:54:53 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QBWrIytdKm3N0aUfXb58usrEC5kHjtHZhvFiLj2yBS9XQonCI1AGq/PEsuFwpR5WfxjIVzJ
X-Received: by 10.55.15.227 with SMTP id 96mr20293326qkp.279.1505213693162;
        Tue, 12 Sep 2017 03:54:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505213693; cv=none;
        d=google.com; s=arc-20160816;
        b=vfgC0uIGyVboTvNUzL47JmL+rO2YwMqD83ShxT9xaPxGOHRT9sguVsbTcQZmCUWMmF
         u22Qf1IpVgONm4d49qnOZ0tQb7mxeP1n0PK2Hj+FpTFGKR4xxuOUmu7tkwkmN08KzLtl
         WiLXTqP5BUvnJaCLeJBSfQxEoVs1Cp5qD1AiOQ5zlpvAhBSE0LgQjWWGzVr0/FghAZ+p
         5Bm6PcbWzl6IPwoIN3S+8zjHrtW89gsbzwpYNCJHIfhBwQe51fl3cnQHs7VG2SnG7K2z
         MTKYzNINnDMFAcG+gt3zZtJlqh840+rr6i1mVdq2h6P/3xMNfw8aKHk+AHz8CZorLY0L
         s6Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date:dmarc-filter:arc-authentication-results;
        bh=Tp00xWtzYeCN7N27IevTBKlLrmI0sVR9DXBGT707LAI=;
        b=m0sbcggvkhOFK/SLEnnRpK/wWf5A3cTXLUsCT3G9Sj32KyXp+dAF6ue7e6jQBMERW8
         KrosewI0bYXA9xK6a/F1jHKkvVRd21XyvZD65wnCdiffUddv38uNojXn69pluEZCjIDW
         H0Q8hnlr3twKlZvOrehKpHGsuIgWZvAgkGL7D5A17wYl5qYMBakyChLKDeVRHz6iFJkF
         jsZ24zMlsSlgBmPyjTSb+pUkejBHMSAiQ1zoVHKuoSfKMAJGIT1LZbDv71m6s9zDqkJD
         2Q6HgWiBmoV//L/h+GIYuJaHJ3Yq2ScjPlNTFXH4+Ie32uEwKbGNS/Q249WuHH+z2P22
         eNNQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l11si4263132qtj.33.2017.09.12.03.54.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Sep 2017 03:54:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34889 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1driqA-0001pS-U4
	for alex.bennee@linaro.org; Tue, 12 Sep 2017 06:54:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43844)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1drioj-0000ci-Ex
	for qemu-devel@nongnu.org; Tue, 12 Sep 2017 06:53:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1drioi-0003Dt-Cu
	for qemu-devel@nongnu.org; Tue, 12 Sep 2017 06:53:21 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53646)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1driob-00039A-Hc; Tue, 12 Sep 2017 06:53:13 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 49F2E8553E;
	Tue, 12 Sep 2017 10:53:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 49F2E8553E
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=imammedo@redhat.com
Received: from nial.brq.redhat.com (unknown [10.43.2.209])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7DC6E6C92E;
	Tue, 12 Sep 2017 10:53:08 +0000 (UTC)
Date: Tue, 12 Sep 2017 12:53:07 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Message-ID: <20170912125307.5681ec0e@nial.brq.redhat.com>
In-Reply-To: <20170905221226.GZ7570@localhost.localdomain>
References: <1504533662-198084-1-git-send-email-imammedo@redhat.com>
	<1504533662-198084-7-git-send-email-imammedo@redhat.com>
	<20170905213152.GG17184@localhost.localdomain>
	<CAKmqyKPWDmVYJceYao7NkD5svWqN_fYbDoUJ4uLNFdAhv+kFwg@mail.gmail.com>
	<20170905221226.GZ7570@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Tue, 12 Sep 2017 10:53:12 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 6/6] arm: drop intermadiate cpu_model ->
 cpu type parsing and use cpu type directly
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
Cc: Rob Herring <robh@kernel.org>, Andrew Jones <drjones@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Jan Kiszka <jan.kiszka@web.de>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Alistair Francis <alistair23@gmail.com>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zjP3W3ApnjDh

On Tue, 5 Sep 2017 19:12:26 -0300
Eduardo Habkost <ehabkost@redhat.com> wrote:

> On Tue, Sep 05, 2017 at 02:47:52PM -0700, Alistair Francis wrote:
> > On Tue, Sep 5, 2017 at 2:31 PM, Eduardo Habkost <ehabkost@redhat.com> wrote:  
> [...]
> > >> diff --git a/hw/arm/stm32f205_soc.c b/hw/arm/stm32f205_soc.c
> > >> index f61e735..1cd6374 100644
> > >> --- a/hw/arm/stm32f205_soc.c
> > >> +++ b/hw/arm/stm32f205_soc.c
> > >> @@ -112,7 +112,7 @@ static void stm32f205_soc_realize(DeviceState *dev_soc, Error **errp)
> > >>
> > >>      armv7m = DEVICE(&s->armv7m);
> > >>      qdev_prop_set_uint32(armv7m, "num-irq", 96);
> > >> -    qdev_prop_set_string(armv7m, "cpu-model", s->cpu_model);
> > >> +    qdev_prop_set_string(armv7m, "cpu-type", s->cpu_type);
> > >>      object_property_set_link(OBJECT(&s->armv7m), OBJECT(get_system_memory()),
> > >>                                       "memory", &error_abort);
> > >>      object_property_set_bool(OBJECT(&s->armv7m), true, "realized", &err);
> > >> @@ -200,7 +200,7 @@ static void stm32f205_soc_realize(DeviceState *dev_soc, Error **errp)
> > >>  }
> > >>
> > >>  static Property stm32f205_soc_properties[] = {
> > >> -    DEFINE_PROP_STRING("cpu-model", STM32F205State, cpu_model),
> > >> +    DEFINE_PROP_STRING("cpu-type", STM32F205State, cpu_type),  
> > >
> > > Same as armv7m: are we 100% sure users are not setting this
> > > manually?  
> > 
> > In an embedded board like this it really doesn't make sense to let the
> > user overwrite the CPU. The SoC will take it as an option, but the
> > board (which creates the SoC) just blindly always uses the same CPU.
> > That feature is more for QOMificatoion then any real reason though.
> >   
> 
> I'm not talking about -cpu (no user-visible change in the
> handling of -cpu should result from this patch), but about
> possible cases where the user set the "cpu-model" property using
> another mechanism, like -global.  Probably it's impossible for an
> user to override the property successfully, but I would like to
> be sure.
> 
> 
> > In saying that I think a warning if the user tries to set the CPU
> > would make sense. I know that this issues comes up in other ARM boards
> > (Zynq-7000 has the same issue as well) so maybe a machine property
> > saying that the board doesn't accept custom CPUs would be a good idea.
Agreed, it would be useful, however goal of the patch to drop
cpu_generic_init() preferably without changing behavior

so I'd leave extra stuff you mention upto board maintainers
to fix up on top.


> Yeah, there are multiple cases in this patch where boards are
> validating the CPU model, but not all boards do that.  A generic
> MachineClass::valid_cpu_types[] field would be useful.
so far I've met 3 use cases for valid_cpu_types
 * no check - just try to use whatever user provided
 * check for concrete cpu models (leaf classes)
 * check for super-class based in partial cpu_model match

it is nice to have valid_cpu_types[] /I recall even trying out something similar/
but then series turns into mess where one tries to fix several things
and on top of it in all targets, hence I've decided first to get rid of
all cpu_model handling in boards and only then think about valid_cpus using cpu types.

I'd gladly give up 'valid cpus' to someone else more interested in it,
there are other users beside of ARM boards for it.
/seems Alistair is interested in it, at least in ARM part/


> > Overall I think this patch is moving in the right direction though and
> > this CPU option being ignored existed before this series.  
> 
> I agree this is going on the right direction.  However, I don't
> see any board that ignore the CPU option: all of them seem to use
> cpu_model when creating the CPUs, already.
in ARM case there are boards that use
 * '-cpu' provided model
 * '-cpu' provided model with valid cpu checks
 * 'hardcoded' cpu model ignoring '-cpu'/-global

I've thought commit message sufficiently described current situation and changes.
