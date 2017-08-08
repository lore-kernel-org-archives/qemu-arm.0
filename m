Received: by 10.25.221.202 with SMTP id w71csp4191289lfi;
        Tue, 8 Aug 2017 06:23:21 -0700 (PDT)
X-Received: by 10.159.57.201 with SMTP id p9mr2932501uag.209.1502198601159;
        Tue, 08 Aug 2017 06:23:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1502198601; cv=none;
        d=google.com; s=arc-20160816;
        b=QrzrAZjRa9gBq4oGl5WcGnOYmPR07KoPnpN+QERctw40xd69CDfOmhn7eFRkwgp2VQ
         igxplto8mKn4fBB+Y9GbZF9IBfiQWrWvIJecA8cWgPCXVwV3fFlmWi7rHebwrZzrmRqy
         X5Fidn3pyeqQOQj+dodDu04RFOIS4OlC9qmIp5RVOhST8UK/PBvg2oqq747kmdl/x/+z
         D9NJ/4UXPgIQ/gRvDRl3M/6RdRhoov40QLzY0sypOL5ewtnX7JQl1Hu83OJMKGmLxYLO
         szrGLvw9R/ucWjIg44/iVIkAH97MnS/WdTBFR1pc0vmqRTw7vlXNIzBINKONRd1MliD4
         aXLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dmarc-filter:arc-authentication-results;
        bh=nrOvrT0equAyLPMoyacP5cXqLxEcolLyeZyxJW/y8HE=;
        b=odzs9BJLPa5Z6LP1Fq2wkIpft5XR/hK8DdLwEr3kFBOBmlEZukU1rSCIZvXJlu5ITx
         VW09JCvg7g116RdLlkayJhnUpYXLKHYsYzUWpJJidYJ8pQBmrFj2q9ARNexIdg1LoHgL
         YJQM4fOiH0K7LXdLtcjnXoWMthg+a7e6KIooXG3rYTK9qiciMTljUSnOumeWVPS4v/V2
         2KGJUPSYJZocMwWLwQKKNVC/ze8sA49Bd6Cev8IoII+jIVMvORoUsWqHvC7WoeyqwYxv
         ugcp+QN2i47PkDydLfFJMANrHEDThrQm0Yv/yH4qUl/KwlB3JfyTRPiAxkdwAk6D343U
         HIgQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 74si733980vke.166.2017.08.08.06.23.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 08 Aug 2017 06:23:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42584 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1df4Tg-00010p-Jw
	for alex.bennee@linaro.org; Tue, 08 Aug 2017 09:23:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55107)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1df4TY-00010J-Uf
	for qemu-arm@nongnu.org; Tue, 08 Aug 2017 09:23:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1df4TU-0000Fz-4M
	for qemu-arm@nongnu.org; Tue, 08 Aug 2017 09:23:12 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37026)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1df4TT-0000Ep-Lk; Tue, 08 Aug 2017 09:23:08 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3F476C057FA6;
	Tue,  8 Aug 2017 13:23:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 3F476C057FA6
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=drjones@redhat.com
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 07C6E95A6A;
	Tue,  8 Aug 2017 13:23:02 +0000 (UTC)
Date: Tue, 8 Aug 2017 15:23:00 +0200
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Message-ID: <20170808132300.uyrrmgoij4qlwy52@kamzik.brq.redhat.com>
References: <1500471597-2517-1-git-send-email-drjones@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1500471597-2517-1-git-send-email-drjones@redhat.com>
User-Agent: Mutt/1.6.0.1 (2016-04-01)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Tue, 08 Aug 2017 13:23:04 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 0/4] ARM: KVM: Enable
 in-kernel PMU with user space gic
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
Cc: peter.maydell@linaro.org, agraf@suse.de, cdall@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: t925tmjfukKU


Peter,

ping?

Thanks,
drew


On Wed, Jul 19, 2017 at 09:39:53AM -0400, Andrew Jones wrote:
> v2:
>  - renamed the kvm pmu 'create' function to 'set_irq' after doing the
>    create/set-irq split
>  - added another patch that improves the error handling of the kvm pmu
>    init and set-irq calls
> 
> Andrew Jones (4):
>   hw/arm/virt: add pmu interrupt state
>   target/arm/kvm: pmu: split init and set-irq stages
>   hw/arm/virt: allow pmu instantiation with userspace irqchip
>   target/arm/kvm: pmu: improve error handling
> 
>  hw/arm/virt.c        | 12 ++++++++--
>  target/arm/cpu.c     |  2 ++
>  target/arm/cpu.h     |  2 ++
>  target/arm/kvm.c     |  6 ++++-
>  target/arm/kvm32.c   |  7 +++++-
>  target/arm/kvm64.c   | 63 ++++++++++++++++++++++++++++++----------------------
>  target/arm/kvm_arm.h |  9 ++++----
>  7 files changed, 65 insertions(+), 36 deletions(-)
> 
> -- 
> 1.8.3.1
> 
> 
