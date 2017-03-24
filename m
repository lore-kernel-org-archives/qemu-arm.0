Received: by 10.25.15.230 with SMTP id 99csp44270lfp;
        Fri, 24 Mar 2017 06:29:54 -0700 (PDT)
X-Received: by 10.200.37.81 with SMTP id 17mr7442499qtn.165.1490362194341;
        Fri, 24 Mar 2017 06:29:54 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t127si1863715qkf.315.2017.03.24.06.29.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 24 Mar 2017 06:29:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33215 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1crPHt-0006fM-QS
	for alex.bennee@linaro.org; Fri, 24 Mar 2017 09:29:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38422)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1crPHq-0006f3-6y
	for qemu-arm@nongnu.org; Fri, 24 Mar 2017 09:29:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1crPHm-0007jD-AF
	for qemu-arm@nongnu.org; Fri, 24 Mar 2017 09:29:50 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33882)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1crPHm-0007j1-4V; Fri, 24 Mar 2017 09:29:46 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E0F163B717;
	Fri, 24 Mar 2017 13:29:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com E0F163B717
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=imammedo@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com E0F163B717
Received: from nial.brq.redhat.com (dhcp-1-118.brq.redhat.com [10.34.1.118])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C62FD89E7D;
	Fri, 24 Mar 2017 13:29:42 +0000 (UTC)
Date: Fri, 24 Mar 2017 14:29:39 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Eric Blake <eblake@redhat.com>
Message-ID: <20170324142939.407b93fe@nial.brq.redhat.com>
In-Reply-To: <c22d6e03-e63c-6a90-e9f3-419255c2c4d2@redhat.com>
References: <1490189568-167621-1-git-send-email-imammedo@redhat.com>
	<1490189568-167621-23-git-send-email-imammedo@redhat.com>
	<c22d6e03-e63c-6a90-e9f3-419255c2c4d2@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Fri, 24 Mar 2017 13:29:46 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for-2.10 22/23] numa: add '-numa
 cpu, ...' option for property based node mapping
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IKlAFyqQTles

On Thu, 23 Mar 2017 08:23:32 -0500
Eric Blake <eblake@redhat.com> wrote:

...
> >  
> > +@samp{cpu} option is new alternative to @samp{cpus} option  
> 
> s/is/is a/
> 
> > +uses @samp{socket-id|core-id|thread-id} properties to assign  
> 
> s/uses/which uses/
> 
> > +CPU objects to a @var{node} using topology layout properties of CPU.
> > +Set of properties is machine specific, and depends on used machine  
> 
> s/Set/The set/
> 
Fixed in v2 branch
