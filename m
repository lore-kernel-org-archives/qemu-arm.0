Received: by 10.25.44.15 with SMTP id s15csp2133312lfs;
        Thu, 6 Jul 2017 07:46:14 -0700 (PDT)
X-Received: by 10.200.10.10 with SMTP id b10mr57794765qti.226.1499352374226;
        Thu, 06 Jul 2017 07:46:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499352374; cv=none;
        d=google.com; s=arc-20160816;
        b=ktiAog4Cb4lcOXjNDIqVJZs/hoWTLkrdeEHYR7xNvEutcaqc22bAmHPcz5SXbLSkM4
         0/vYQ+FtacI3kqRIkw6y/OU+HtjAuSJjTBvTfKEmszxbKsq9OQArvetMkNRs+JDAF4AD
         SZHovhXm4aFgBtBdCRDy6PMYQ70YL2eJruGcUvmPnqkhSfKZ/sP8BKtg5dXbvSq0iIDt
         6p4jjvxTnkYSFmQ+fp9bQfXXA5YaENy9O3RxwwyNMLbmrfjHyvOPJlIAiZaaHV/5g4U1
         kfQtMYAgWqJpX1dtebVs/F7nXZt5vKlLypcmKaxh/Y+0WgC0PY14uQMK6kSlLIaK9gEN
         b4Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:user-agent
         :message-id:in-reply-to:date:references:to:from:dkim-filter
         :dmarc-filter:arc-authentication-results;
        bh=UTQbM//IPOzSaxVmWAplENtH14RJMrYpq+ssracGL4k=;
        b=HabJFc0ORR2YKfPwHb/EmpLf2y9/iyUsbnelIHljhCX00ZTc8UUzpx/SQvzD85A5QP
         dL/yerRWn0Gmy73iV7oJukcWPP2oMhK4G/TfvMsKSI1S8Kib+9sTWCdaioRfzsvoZbdB
         qtwhG8td1AO74lite3ntz5FXg5GOUx20wf/ltKN9dTj2QiogYOhP595SGDstBG5hxtwW
         yf/avnpVNNpYch7M9nAZEyQ6YwhA8kwIftD81WH9WT1sht4BnQgArmHNAwoUc00qbeDL
         Yf3VYWvLWZUhUsGdLngZ6BLeM0HGGKD1vB5RFzLYRdrswlr5Gw2OJ4NH3Iihvq4lwvo9
         QKVg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w55si342871qtc.66.2017.07.06.07.46.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 06 Jul 2017 07:46:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51835 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dT82l-0006Q3-HO
	for alex.bennee@linaro.org; Thu, 06 Jul 2017 10:46:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48519)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1dT82b-0006Op-EJ
	for qemu-arm@nongnu.org; Thu, 06 Jul 2017 10:46:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1dT82a-0002kD-8j
	for qemu-arm@nongnu.org; Thu, 06 Jul 2017 10:46:01 -0400
Received: from mx1.redhat.com ([209.132.183.28]:16186)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1dT82Z-0002jG-Vz; Thu, 06 Jul 2017 10:46:00 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C94E823E6CA;
	Thu,  6 Jul 2017 14:45:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com C94E823E6CA
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=armbru@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com C94E823E6CA
Received: from blackfin.pond.sub.org (ovpn-116-60.ams2.redhat.com
	[10.36.116.60])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8A7D55C54A;
	Thu,  6 Jul 2017 14:45:55 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 402F81138619; Thu,  6 Jul 2017 16:45:54 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
References: <20170608133906.12737-1-ehabkost@redhat.com>
	<20170608133906.12737-2-ehabkost@redhat.com>
	<87fuebrtuk.fsf@dusky.pond.sub.org>
	<20170706140837.GE12152@localhost.localdomain>
Date: Thu, 06 Jul 2017 16:45:54 +0200
In-Reply-To: <20170706140837.GE12152@localhost.localdomain> (Eduardo Habkost's
	message of "Thu, 6 Jul 2017 11:08:37 -0300")
Message-ID: <8737a9ipy5.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Thu, 06 Jul 2017 14:45:59 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 1/5] xilinx: Fix error handling
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
Cc: Jason Wang <jasowang@redhat.com>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, Alistair Francis <alistair.francis@xilinx.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5I1Qe/kDceyt

Eduardo Habkost <ehabkost@redhat.com> writes:

> On Wed, Jul 05, 2017 at 01:44:35PM +0200, Markus Armbruster wrote:
>> Eduardo Habkost <ehabkost@redhat.com> writes:
>> 
>> > Assigning directly to *errp is not valid, as errp may be NULL,
>> > &error_fatal, or &error_abort.  Use error_propagate() instead.
>> >
>> > error_propagate() handles non-NULL *errp correctly, so the
>> > "if (!*errp)" check can be removed.
>> >
>> > Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
>> > Cc: Alistair Francis <alistair.francis@xilinx.com>
>> > Cc: Jason Wang <jasowang@redhat.com>
>> > Cc: qemu-arm@nongnu.org
>> > Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
>> > ---
>> >  hw/dma/xilinx_axidma.c  | 4 +---
>> >  hw/net/xilinx_axienet.c | 4 +---
>> >  2 files changed, 2 insertions(+), 6 deletions(-)
>> >
>> > diff --git a/hw/dma/xilinx_axidma.c b/hw/dma/xilinx_axidma.c
>> > index 6065689ad1..3987b5ff96 100644
>> > --- a/hw/dma/xilinx_axidma.c
>> > +++ b/hw/dma/xilinx_axidma.c
>> > @@ -554,9 +554,7 @@ static void xilinx_axidma_realize(DeviceState *dev, Error **errp)
>> >      return;
>> >  
>> >  xilinx_axidma_realize_fail:
>> > -    if (!*errp) {
>> > -        *errp = local_err;
>> > -    }
>> > +    error_propagate(errp, local_err);
>> >  }
>> >  
>> >  static void xilinx_axidma_init(Object *obj)
>> > diff --git a/hw/net/xilinx_axienet.c b/hw/net/xilinx_axienet.c
>> > index b6701844d3..5ffa739f68 100644
>> > --- a/hw/net/xilinx_axienet.c
>> > +++ b/hw/net/xilinx_axienet.c
>> > @@ -981,9 +981,7 @@ static void xilinx_enet_realize(DeviceState *dev, Error **errp)
>> >      return;
>> >  
>> >  xilinx_enet_realize_fail:
>> > -    if (!*errp) {
>> > -        *errp = local_err;
>> > -    }
>> > +    error_propagate(errp, local_err);
>> >  }
>> >  
>> >  static void xilinx_enet_init(Object *obj)
>> 
>> The qdev core always passes &err.  So this is "merely" a fix for a
>> latent bug.
>> 
>> If it could pass null, you'd fix a crash bug.
>> 
>> If it could pass pointer to non-null (&error_fatal, &error_abort), you'd
>> plug a memory leak.
>> 
>> Suggest to rephrase the commit message:
>> 
>>     xilinx: Fix latent error handling bug
>> 
>>     Assigning directly to *errp is not valid, as errp may be null,
>>     &error_fatal, or &error_abort.  The !*errp conditional protects
>>     against the latter two, but we then leak @local_err.  Fortunately,
>>     the qdev core always passes pointer to null, so this is "merely" a
>>     latent bug.
>> 
>>     Use error_propagate() instead.
>> 
>> What do you think?
>
> Looks good to me.  Do you want to fix it when applying?

Can do!

>> With something like that:
>> Reviewed-by: Markus Armbruster <armbru@redhat.com>
>
> Thanks!
