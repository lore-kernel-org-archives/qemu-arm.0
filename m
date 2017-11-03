Received: by 10.223.150.237 with SMTP id u100csp222991wrb;
        Fri, 3 Nov 2017 13:02:57 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+SrA6zHp1Hry3WkrmZpg9YR7mo91COo81suqT0M/O8NBdBFT0eyiattW9N86kEZWxbc59Yo
X-Received: by 10.37.252.28 with SMTP id v28mr5356178ybd.518.1509739376942;
        Fri, 03 Nov 2017 13:02:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1509739376; cv=none;
        d=google.com; s=arc-20160816;
        b=MYQq0j/lEU1lnStWXE1d/jJ1fU+yafBPOdkd9OT+OB4lIHtD8U/JwGy6yrtt5JikfY
         0jlCHE26FnLQzdMWEfykK/6pfus5DKtkE46mu+INUIliEi9zdrlY4Gu9wsg5yO1aPxfj
         7ohO99qUy5BQ4mlqKmkZ7ZwplQ+P8oPQKdsIjH8+wvY3BOLQOanPLl8OpXm0U9aaq7Or
         AKeKate78YkaHl2vbMv5udrFesstkpaQ0PJQXelKtnv4G7J96dGzkCKdYHhjUjllUvzS
         U6Z8bn1BMGkoJR8SAEEhu6nBy10C/VPt7kOs+/xR0knlBdofy6CCZ6chUSawAP2Mbza1
         IqRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dmarc-filter:arc-authentication-results;
        bh=4l+FfYZgKq+89e+OzpeZxpPcZRoaBHjPH7scdja7ATw=;
        b=snouWrtB8WilOcvVQ6aYxh4frFXX2T+jLWOxifSL2BOxmjj5ErYXi+trbaEf3cz1A9
         KC03ahP8xbul9QzQBMOqRcomIVka9hqP184Qd0iUSAOFw4b17g67g3T6iTvwDk/YQU2D
         u+1FYMRPeBw1D99alyfwNgbaZiEjV90AcudG8goNsWNXd3GivSYhwJkWY2rFvy2uzyPW
         XIwWLAYIu7V+Q2JDR/Ws7xazM1oHMq4KT7ezsQy2QBaOeWXqW0QorAFxV//MQW7MV2SK
         yMAaWF3iEHtpX9vmn4h0yjxG+0YDtJs3RsBs5SArcza8VbSTjkZ3owNx9POKsvnfS535
         Tw6A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i81si1508903ybg.611.2017.11.03.13.02.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 03 Nov 2017 13:02:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38264 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eAiB6-0001uJ-DU
	for alex.bennee@linaro.org; Fri, 03 Nov 2017 16:02:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43973)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1eAiAv-0001u7-2J
	for qemu-arm@nongnu.org; Fri, 03 Nov 2017 16:02:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1eAiAq-000564-6o
	for qemu-arm@nongnu.org; Fri, 03 Nov 2017 16:02:45 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50210)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1eAiAq-00055Y-0x; Fri, 03 Nov 2017 16:02:40 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8BB6581DE9;
	Fri,  3 Nov 2017 20:02:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 8BB6581DE9
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=ehabkost@redhat.com
Received: from localhost (ovpn-116-17.gru2.redhat.com [10.97.116.17])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F231E600C8;
	Fri,  3 Nov 2017 20:02:35 +0000 (UTC)
Date: Fri, 3 Nov 2017 21:02:33 +0100
From: Eduardo Habkost <ehabkost@redhat.com>
To: "Emilio G. Cota" <cota@braap.org>
Message-ID: <20171103200233.GI3111@localhost.localdomain>
References: <1509734853-3014-1-git-send-email-cota@braap.org>
	<20171103185610.GA3907@flamenco>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171103185610.GA3907@flamenco>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.9.1 (2017-09-22)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Fri, 03 Nov 2017 20:02:39 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH] hw: add .min_cpus and .default_cpus fields
 to machine_class
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm@nongnu.org, Marcel Apfelbaum <marcel@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lRJNFfzDgj7H

On Fri, Nov 03, 2017 at 02:56:10PM -0400, Emilio G. Cota wrote:
> On Fri, Nov 03, 2017 at 14:47:33 -0400, Emilio G. Cota wrote:
> > diff --git a/hw/arm/xlnx-zcu102.c b/hw/arm/xlnx-zcu102.c
> > index e2d15a1..395d1b5 100644
> > --- a/hw/arm/xlnx-zcu102.c
> > +++ b/hw/arm/xlnx-zcu102.c
> > @@ -185,6 +185,9 @@ static void xlnx_ep108_machine_class_init(ObjectClass *oc, void *data)
> >      mc->block_default_type = IF_IDE;
> >      mc->units_per_default_bus = 1;
> >      mc->ignore_memory_transaction_failures = true;
> > +    mc->max_cpus = XLNX_ZYNQMP_NUM_APU_CPUS + XLNX_ZYNQMP_NUM_RPU_CPUS;
> > +    mc->min_cpus = XLNX_ZYNQMP_NUM_APU_CPUS;
> > +    mc->default_cpus = XLNX_ZYNQMP_NUM_APU_CPUS;
> >  }
> >  
> >  static const TypeInfo xlnx_ep108_machine_init_typeinfo = {
> > @@ -241,6 +244,8 @@ static void xlnx_zcu102_machine_class_init(ObjectClass *oc, void *data)
> >      mc->units_per_default_bus = 1;
> >      mc->ignore_memory_transaction_failures = true;
> >      mc->max_cpus = XLNX_ZYNQMP_NUM_APU_CPUS + XLNX_ZYNQMP_NUM_RPU_CPUS;
> > +    mc->min_cpus = XLNX_ZYNQMP_NUM_APU_CPUS;
> > +    mc->default_cpus = XLNX_ZYNQMP_NUM_APU_CPUS;
> >  }
> 
> Should we update max_cpus to just NUM_APU_CPUS as well for these boards?
> -smp 5 or 6 (NUM_APU + NUM_RPU) still gets us 4 vCPUs.
> 
> I see there's code for RPU cpus but it seems disabled at compile-time
> at xlnx-zynqmp.c:431:
>    DEFINE_PROP_BOOL("has_rpu", XlnxZynqMPState, has_rpu, false)
> Or is there a run-time way to override this?

Device properties can be overridden using -global, e.g.:

  -global driver=xlnx,,zynqmp,property=has_rpu,value=on

(",," is how commas are escaped in QEMU options)

-- 
Eduardo
