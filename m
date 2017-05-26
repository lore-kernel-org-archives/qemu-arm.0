Received: by 10.25.0.6 with SMTP id 6csp343225lfa;
        Fri, 26 May 2017 08:02:19 -0700 (PDT)
X-Received: by 10.55.101.143 with SMTP id z137mr2387580qkb.50.1495810939399;
        Fri, 26 May 2017 08:02:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1495810939; cv=none;
        d=google.com; s=arc-20160816;
        b=wmsv3mVEyymEfSVKfjvbXCKJyg2NLoUXVaZpHv9QLc3EojTdrMUz/1VKxf/y+z0f3i
         VA53OuZTUU2SzGpsp5Bi3ZUGNMomW9EjoSZ4/4kznzF3AUw+k315/daC+B9IDzk43LE7
         f3aOUwiAxNbbzGbpwGnRV6yXcQC9Ol1EAG5cCKUYEGgH5pa+lwE723UKSQeUys333BbH
         myOqNmc9sE+l7pW9x6O+0WfODiHD2ggN7Zdcpcpq+fB5mw3X0SK2F/THmLFwmKRWEQ8S
         a1Jx95cPLn0armlQ9e4In1UBNFqfrKEb/58fEOVyZ1ta+JA8yhgSPpEaQeap1qNu2pDS
         0q6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-filter:dmarc-filter:arc-authentication-results;
        bh=g6jT1ZPZ5PE5TJPd6Pz++LrNtUtRtltJEKY6sTI8iPA=;
        b=DiM8JCizr1H02iu12DSHQug5B9tI2yGJCI+aAZ5fq+gqu940oUzFtzJtPweosd7r/H
         qbiqhF9DPUCenY3xguPqX1VKSQEu2ifr6Uxp58lJxJnACHGm93BLObJdtYI0FrZtpwaW
         dYjRnFsme/PktPPidDPOOFYVJfUt6ghmoRGfiMo18ZikhGbnS+i6qfpfLVr0n4a4fMS0
         UBd8sycANz96I4HR6naPc4qxNDtB8XYmmZ3fNiw/L7mu2luHcl05EpEqRW8Lqaxu7fZl
         yNa+sb1IrvONbkyzshOl4aLnzhzDznexsBTxvJu1o5WR6zKBNSVyO5JX0G0VHgm1wONW
         D+xQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n16si1026876qtc.35.2017.05.26.08.02.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 26 May 2017 08:02:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37190 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dEGks-0006X3-Pr
	for alex.bennee@linaro.org; Fri, 26 May 2017 11:02:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40757)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1dEGkj-0006SJ-Ud
	for qemu-arm@nongnu.org; Fri, 26 May 2017 11:02:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1dEGkg-0001vv-SD
	for qemu-arm@nongnu.org; Fri, 26 May 2017 11:02:10 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56122)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1dEGkg-0001sy-Lf; Fri, 26 May 2017 11:02:06 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7B7458E3E2;
	Fri, 26 May 2017 15:02:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 7B7458E3E2
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=ehabkost@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 7B7458E3E2
Received: from localhost (ovpn-116-57.gru2.redhat.com [10.97.116.57])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 05F558278B;
	Fri, 26 May 2017 15:02:04 +0000 (UTC)
Date: Fri, 26 May 2017 12:02:03 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20170526150203.GG22043@thinpad.lan.raisama.net>
References: <1495550330-34087-1-git-send-email-imammedo@redhat.com>
	<1495550330-34087-3-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1495550330-34087-3-git-send-email-imammedo@redhat.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.8.0 (2017-02-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Fri, 26 May 2017 15:02:05 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 2/5] numa: move default
 mapping init to machine
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
Cc: Andrew Jones <drjones@redhat.com>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OHewPxIJOVzg

On Tue, May 23, 2017 at 04:38:47PM +0200, Igor Mammedov wrote:
> there is no need use cpu_index_to_instance_props() for setting
> default cpu -> node mapping. Generic machine code can do it
> without cpu_index by just enabling already preset defaults
> in possible_cpus.
> 
> PS:
> as bonus it makes one less user of cpu_index_to_instance_props()
> 
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>

Queued on numa-next, thanks!

-- 
Eduardo
