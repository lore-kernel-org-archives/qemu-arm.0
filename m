Received: by 10.25.21.96 with SMTP id l93csp1399978lfi;
        Mon, 4 Jul 2016 01:04:52 -0700 (PDT)
X-Received: by 10.200.48.46 with SMTP id f43mr16790367qte.10.1467619492624;
        Mon, 04 Jul 2016 01:04:52 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q131si1351317qka.276.2016.07.04.01.04.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 04 Jul 2016 01:04:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:45781 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bJys8-00021v-41
	for alex.bennee@linaro.org; Mon, 04 Jul 2016 04:04:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42547)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1bJys4-00021l-P8
	for qemu-arm@nongnu.org; Mon, 04 Jul 2016 04:04:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1bJyrz-000248-DB
	for qemu-arm@nongnu.org; Mon, 04 Jul 2016 04:04:47 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55193)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>)
	id 1bJyrz-000244-4i; Mon, 04 Jul 2016 04:04:43 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3B420633F4;
	Mon,  4 Jul 2016 08:04:41 +0000 (UTC)
Received: from 172-15-182-60.lightspeed.austtx.sbcglobal.net
	(ovpn-112-47.ams2.redhat.com [10.36.112.47])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u6484aXr013603; Mon, 4 Jul 2016 04:04:37 -0400
Date: Mon, 4 Jul 2016 10:04:31 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Message-ID: <20160704100431.6b20fd28@172-15-182-60.lightspeed.austtx.sbcglobal.net>
In-Reply-To: <1465492263-28472-1-git-send-email-imammedo@redhat.com>
References: <1465492263-28472-1-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Mon, 04 Jul 2016 08:04:41 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 0/6] cpus: make "-cpu cpux,
 features" global properties
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com,
	mark.cave-ayland@ilande.co.uk, groug@kaod.org,
	blauwirbel@gmail.com, qemu-arm@nongnu.org, pbonzini@redhat.com,
	david@gibson.dropbear.id.au, rth@twiddle.net
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vYEdh8hH0vHY

On Thu,  9 Jun 2016 19:10:57 +0200
Igor Mammedov <imammedo@redhat.com> wrote:

Eduardo,

is anything more left to review/fix so remaining patches of this series
could be merged?

There is PPC series[1] that would introduce a conflict (using old style
feature parsing code), it would be better if this series are merged
and so that [1] could be rebased on top of it if there aren't any issues
left.

https://www.mail-archive.com/qemu-devel@nongnu.org/msg383073.html

> Changelog:
>   since v1:
>     - rebase on top of x86-next tree, which shaves off already
> applied several patches and fixed deps on wrong tree (v1 was against
> my device_add_cpu tree)
>     - add TODO comments
>     - set cpu_globals_initialized = true early
>     - move error_propagate() to the end of x86_cpu_parse_featurestr()
>   since RFC:
>     - include "target-i386: Remove xlevel & hv-spinlocks option
> fixups"
>     - use Eduardo's version of:
>         target-i386: cpu: consolidate calls of
> object_property_parse...
>     - fix error handling of +-feat
>     - add comment why +-feat is special
>     - add comment to remove +-feat static vars
>     - reuse x86_cpu_class_get_model_name()
> 
> Current CLI option -cpu cpux,features serves as template
> for all created cpus of type: cpux. However QEMU parses
> "features" every time it creates a cpu instance and applies
> them to it while doing parsing.
> 
> That doesn't work well with -device/device_add infrastructure
> as it has no idea about cpu specific hooks that's used for
> parsing "features".
> In order to make -device/device_add utilize "-cpu features"
> template convert it into a set of global properties, so that
> every new CPU created will have them applied automatically.
> 
> That also allows to parse features only once, instread of
> doing it for every CPU instance being created.
> 
> Git tree for testing:
>   https://github.com/imammedo/qemu.git cpu_parse_into_global_props_V2 
> web view:
>   https://github.com/imammedo/qemu/commits/cpu_parse_into_global_props_V2
> 
> 
> Eduardo Habkost (1):
>   target-i386: cpu: consolidate calls of object_property_parse() in
>     x86_cpu_parse_featurestr
> 
> Igor Mammedov (5):
>   target-i386: print obsolete warnings if +-features are used
>   target-sparc: cpu: use sparc_cpu_parse_features() directly
>   cpu: use CPUClass->parse_features() as convertor to global
> properties arm: virt: parse cpu_model only once
>   pc: parse cpu features only once
> 
>  hw/arm/virt.c      |  41 ++++++++--------
>  hw/i386/pc.c       |  37 +++++++++++----
>  include/qom/cpu.h  |   2 +-
>  qom/cpu.c          |  38 ++++++++++-----
>  target-i386/cpu.c  | 135
> +++++++++++++++++++++++++----------------------------
> target-i386/cpu.h  |   1 - target-sparc/cpu.c |   7 +--
>  7 files changed, 143 insertions(+), 118 deletions(-)
> 

