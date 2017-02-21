Received: by 10.25.0.147 with SMTP id 141csp625032lfa;
        Tue, 21 Feb 2017 10:29:18 -0800 (PST)
X-Received: by 10.55.164.208 with SMTP id n199mr15604799qke.322.1487701758156;
        Tue, 21 Feb 2017 10:29:18 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 15si9041755qke.64.2017.02.21.10.29.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 21 Feb 2017 10:29:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:47785 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cgFBb-0001ub-Dp
	for alex.bennee@linaro.org; Tue, 21 Feb 2017 13:29:15 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59141)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1cgFBU-0001nZ-HC
	for qemu-arm@nongnu.org; Tue, 21 Feb 2017 13:29:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1cgFBO-0008Gn-RU
	for qemu-arm@nongnu.org; Tue, 21 Feb 2017 13:29:08 -0500
Received: from mx1.redhat.com ([209.132.183.28]:46704)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1cgFBO-0008GV-MJ; Tue, 21 Feb 2017 13:29:02 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A93EA80476;
	Tue, 21 Feb 2017 18:29:02 +0000 (UTC)
Received: from localhost (ovpn-116-33.gru2.redhat.com [10.97.116.33])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v1LIT1fX023799; Tue, 21 Feb 2017 13:29:02 -0500
Date: Tue, 21 Feb 2017 15:28:59 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20170221182859.GH2778@thinpad.lan.raisama.net>
References: <1487357795-52614-1-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1487357795-52614-1-git-send-email-imammedo@redhat.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.7.1 (2016-10-04)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Tue, 21 Feb 2017 18:29:02 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [RFC 0/3] generalize parsing of cpu_model
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
Cc: Peter Maydell <peter.maydell@linaro.org>, patches@linaro.org,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	Marcel Apfelbaum <marcel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kLfXNtn96328

On Fri, Feb 17, 2017 at 07:56:32PM +0100, Igor Mammedov wrote:
> 
> Some callers call CPUClass->parse_features manually to convert
> '-cpu cpufoo,featurestr' string to cpu type and featurestr
> into a set of global properties. And theni do controlled
> cpu creation with setting properties and completing it with realize.
> That's a lot of code duplication as they are practically
> reimplement the same parsing logic.
> 
> Some don't and use cpu_generic_init() instead which does
> the same parsing along with creation/realizing cpu within one
> wrapper.
> 
> And some trying to switch to controlled cpu creation,
> implement object_new()/set properties/realize steps
> but forget feature parsing logic witch lieads to 'bugs'
> commit 00909b585 (hw/arm/integratorcp: Support specifying features via -cpu)
> 
> 
> This series moves -cpu option parsing to generic machine code
> that removes a little of code duplication and makes cpus creation
> process more unified.
> 
> PS:
> As I don't have time to rewrite this part QEMU, being busy
> rewritting yet another part of QEMU,
> SERIES IS UNFINISHED AND SERVERS TO SHOW IDEA HOW IT SHOULD
> BE DONE. FEEL FREE TO PICK UP AND COMPLETE THIS PATCHES
> TO HANDLE ALL BOARDS (series does it only for virt-arm/spapr/pc)
> 
> It compiles and pc machine even starts but otherwise is untested.

The approach makes sense to me, but I haven't reviewed all the
code yet.

That said, I don't think this excludes the possiblity of adding a
temporary cpu_generic_new() wrapper in case it is useful in the
meantime. After this series is applied, cpu_generic_new() could
be automatically replaced by object_new(machine->cpu_typename).

Peter, do you think a wrapper for parse_features + object_new()
would still be necessary to avoid too much code duplication on
arm boards in 2.9, or can we live without it until we apply
Igor's series (probaly after 2.9)?

-- 
Eduardo
