Received: by 10.25.0.147 with SMTP id 141csp973762lfa;
        Wed, 22 Feb 2017 05:30:42 -0800 (PST)
X-Received: by 10.55.121.194 with SMTP id u185mr30262742qkc.56.1487770242307;
        Wed, 22 Feb 2017 05:30:42 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i10si860278qtg.274.2017.02.22.05.30.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 22 Feb 2017 05:30:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:52525 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cgX0B-0003IF-E1
	for alex.bennee@linaro.org; Wed, 22 Feb 2017 08:30:39 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54544)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1cgX02-0003I5-8K
	for qemu-arm@nongnu.org; Wed, 22 Feb 2017 08:30:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1cgWzy-0006hU-1K
	for qemu-arm@nongnu.org; Wed, 22 Feb 2017 08:30:30 -0500
Received: from mx1.redhat.com ([209.132.183.28]:44756)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1cgWzx-0006h4-RI; Wed, 22 Feb 2017 08:30:25 -0500
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DB45A4E4DE;
	Wed, 22 Feb 2017 13:30:25 +0000 (UTC)
Received: from nial.brq.redhat.com (dhcp-1-118.brq.redhat.com [10.34.1.118])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v1MDUNcM014960; Wed, 22 Feb 2017 08:30:23 -0500
Date: Wed, 22 Feb 2017 14:30:19 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Message-ID: <20170222143019.789cfbbf@nial.brq.redhat.com>
In-Reply-To: <1487357795-52614-1-git-send-email-imammedo@redhat.com>
References: <1487357795-52614-1-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Wed, 22 Feb 2017 13:30:25 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC 0/3] generalize parsing of
 cpu_model
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, patches@linaro.org,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	Marcel Apfelbaum <marcel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nZgobI2Fi0nx

On Fri, 17 Feb 2017 19:56:32 +0100
Igor Mammedov <imammedo@redhat.com> wrote:

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

series has been written on top my numa tree which apply it to
upstream master. So here goes rebased on top of current master variant:

https://github.com/imammedo/qemu/commits/generilize_cpu_model_parsing_rfc

