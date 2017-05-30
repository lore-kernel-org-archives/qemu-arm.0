Received: by 10.25.0.6 with SMTP id 6csp3443lfa;
        Tue, 30 May 2017 12:47:57 -0700 (PDT)
X-Received: by 10.237.36.219 with SMTP id u27mr28835515qtc.197.1496173677551;
        Tue, 30 May 2017 12:47:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1496173677; cv=none;
        d=google.com; s=arc-20160816;
        b=dqr9mJ2OBPJBV9YHovUnEWguRaSdsEOjpsnN6xuoOM7kBQxRclkJTEsRFAvh8LaWJJ
         0T1ARhVoVjhKxrSpF8zqPYjJTuGiDmSsB/Oi6M7zZoWOOPygFkxuyltUR353Nz6PCRLv
         gxrnl7D22sjx5us60o4gw8xG8uYcuVyfP2WbO2eAX7Gazsfydv/oISi6ouddznlTzeIn
         Pd7iu/zTkdh51luMeiAwj6h8GeN4P9WTI475xoQveED6fixQORC9GMx5227ITTK6Cdm+
         uzly1Dh5gpwkK1eOHULLCYYQzRiL7WMT4SIXRUF92lVW1u1SwzER9UA0lo5e+De7h7T8
         bmzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-filter:dmarc-filter:arc-authentication-results;
        bh=xEm4RwsEzVgzXPmw0dMQvm2DXCzguFROMoqp019z8Hk=;
        b=N9EcOTW2rik5imC/W3SmnANrw4gDdz5hQK8A+ochGPjHRVFPeLKJrhp6Iy1BLctI6Q
         KbW7oyAd7NAIQVMNXlSc+XZS+rgwu9eArCB77+6RRWo6Rz01cFa+ZnTJoLcnj7EJbUOw
         TMAWFy5jZlmVmVqq+GIZELRAH4Y1KxSoUTxCHMZt6ZK7Fh7bs7gkqCqf+/ygOACIv3jC
         ptXQMTo/A3OBp6ORKByfowU0McFqHZAQ5LTWMgsM6A1ZudHrZraPWUPdRYiSv7u4eP06
         KILa6Jwd/Jws2ivQeEkTiofM3UKsCjXicBomRoasY5vRgdqbMiay+7epx2lMFiMNBEd3
         a4dw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k62si6210923qkl.337.2017.05.30.12.47.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 30 May 2017 12:47:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55982 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dFn7V-00025f-19
	for alex.bennee@linaro.org; Tue, 30 May 2017 15:47:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35395)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1dFn7O-00025Z-Qp
	for qemu-arm@nongnu.org; Tue, 30 May 2017 15:47:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1dFn7J-0008K1-Ov
	for qemu-arm@nongnu.org; Tue, 30 May 2017 15:47:50 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36700)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1dFn7J-0008Jw-Ik; Tue, 30 May 2017 15:47:45 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7C38680C11;
	Tue, 30 May 2017 19:47:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 7C38680C11
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=ehabkost@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 7C38680C11
Received: from localhost (ovpn-116-43.gru2.redhat.com [10.97.116.43])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 879EA5C8A7;
	Tue, 30 May 2017 19:47:43 +0000 (UTC)
Date: Tue, 30 May 2017 16:47:42 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Eric Blake <eblake@redhat.com>
Message-ID: <20170530194742.GO32274@thinpad.lan.raisama.net>
References: <1496161442-96665-1-git-send-email-imammedo@redhat.com>
	<1496161442-96665-6-git-send-email-imammedo@redhat.com>
	<554eca2d-3c94-c341-299f-d71bcb020edd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <554eca2d-3c94-c341-299f-d71bcb020edd@redhat.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.8.0 (2017-02-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Tue, 30 May 2017 19:47:44 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3 5/7] numa: move numa_node
 from CPUState into target specific classes
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
Cc: Andrew Jones <drjones@redhat.com>, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	Igor Mammedov <imammedo@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OruP2/bb11hp

On Tue, May 30, 2017 at 11:30:27AM -0500, Eric Blake wrote:
> On 05/30/2017 11:24 AM, Igor Mammedov wrote:
> > Move vcpu's assocciated numa_node field out of generic CPUState
> 
> s/assocciated/associated/
> 
> > into inherited classes that actually care about cpu<->numa mapping,
> > i.e: ARMCPU, PowerPCCPU, X86CPU.
> > 
> > Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> > ---
> 
> > +++ b/target/arm/cpu.h
> > @@ -703,6 +703,8 @@ struct ARMCPU {
> >  
> >      ARMELChangeHook *el_change_hook;
> >      void *el_change_hook_opaque;
> > +
> > +    int32_t node_id; /* NUMA node this CPU is belonging to */
> 
> s/is belonging/belongs/  (multiple places in the patch)

I have fixed those while applying the patch.  Thanks!

-- 
Eduardo
