Received: by 10.223.172.38 with SMTP id v35csp1506084wrc;
        Tue, 5 Sep 2017 07:45:08 -0700 (PDT)
X-Google-Smtp-Source: ADKCNb6jNhGPR7yVpdte6KCB+gdWlMtGIqFyNjO9DmHTm3Abhsyo/rzWCjEiS9USv81DSaDY/F6v
X-Received: by 10.200.12.198 with SMTP id o6mr5504348qti.330.1504622708801;
        Tue, 05 Sep 2017 07:45:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504622708; cv=none;
        d=google.com; s=arc-20160816;
        b=pypEXYF80lAeCg6eNJ08E+gJ46jzOXBPymiL/cyqO/FEBTuULKaDI4pML4oHVAIvom
         HklrY5K8HbrDBJWRa2fUqzd/Fuv3qZg1fmIJ/rhyLfeqdRY+KtOO+3PZ/oRcxOWDoNTw
         7M3AlJxkoI5UyOsv+ubeMJHqo8YyWYqjf7wlddyW/BqlKOcn0+aM6rVgiTt0mukqixEQ
         QfbQgnUjNhMuC/10M67/syz5onfGHZCmDbNNXL6JVrDWKngd+q8Ku3WnpQgx81wVhcmG
         wxQYLP2XxmelCmn6BNHCtqdqsIrFpLkvCmGynQX57t80w6MEOVw1RjzlxHCMVdmJwWws
         rb5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dmarc-filter:arc-authentication-results;
        bh=Y13nLVGqsNhj6QU5K7M/4NkC5dfK6VnUy/JPMuVzbkE=;
        b=UVGPFGctsRTCCtpqvag+bCVdW/qdbiC/6L4xDaYfiydIR5DGc6N4/GegLgW5w1MO9h
         qIBWaIpw6mlwA+q3E83dYx7UC2TBYyiHU8mhN/J6+ZZGHl9H6kYmVtn5zMC9Uhxk4dxx
         HVBAM9EtBFMgiZIJx2B0SKTpKF9xYbmeu+keF5nBUJ/Y1P6uGSw+sAYH5rdcbpJM6OtG
         YVuMtm1fYXv6M9NEmNXUlgwL14sQFmv/7svnJShp/40I8t5Dj7urdg5ocMF7D04Wzi1Y
         JIzZeqtrW6tnSbr+u940B8cG5VrFBvXE+O2vug49v60kXTx7/cTXY2GUomGFTDLSroaU
         mWmg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r67si558847qka.453.2017.09.05.07.45.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 05 Sep 2017 07:45:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59411 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dpF6A-0001hm-K5
	for alex.bennee@linaro.org; Tue, 05 Sep 2017 10:45:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55851)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1dpF63-0001h5-Ht
	for qemu-arm@nongnu.org; Tue, 05 Sep 2017 10:45:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1dpF5y-0002TO-W9
	for qemu-arm@nongnu.org; Tue, 05 Sep 2017 10:44:59 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49018)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1dpF5y-0002PK-QC; Tue, 05 Sep 2017 10:44:54 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id ED07574A36;
	Tue,  5 Sep 2017 14:44:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com ED07574A36
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=drjones@redhat.com
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C9F46679CA;
	Tue,  5 Sep 2017 14:44:51 +0000 (UTC)
Date: Tue, 5 Sep 2017 16:44:49 +0200
From: Andrew Jones <drjones@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20170905144449.yiupcvhbnfc3sakn@kamzik.brq.redhat.com>
References: <1500471597-2517-1-git-send-email-drjones@redhat.com>
	<1500471597-2517-5-git-send-email-drjones@redhat.com>
	<CAFEAcA_xDei18gfdLuo5=aPM=9D9Ou6LBLfT+gtGUKgcpDC88A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA_xDei18gfdLuo5=aPM=9D9Ou6LBLfT+gtGUKgcpDC88A@mail.gmail.com>
User-Agent: Mutt/1.6.0.1 (2016-04-01)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Tue, 05 Sep 2017 14:44:53 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 4/4] target/arm/kvm: pmu:
 improve error handling
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
Cc: Christoffer Dall <cdall@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>, Alexander Graf <agraf@suse.de>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fsHSDJSjStHo

On Mon, Sep 04, 2017 at 03:17:21PM +0100, Peter Maydell wrote:
> On 19 July 2017 at 14:39, Andrew Jones <drjones@redhat.com> wrote:
> > If a KVM PMU init or set-irq attr call fails we just silently stop
> > the PMU DT node generation. The only way they could fail, though,
> > is if the attr's respective KVM has-attr call fails. But that should
> > never happen if KVM advertises the PMU capability, because both
> > attrs have been available since the capability was introduced. Let's
> > just abort if this should-never-happen stuff does happen, because,
> > if it does, then something is obviously horribly wrong.
> >
> > Signed-off-by: Andrew Jones <drjones@redhat.com>
> > ---
> >  hw/arm/virt.c        |  9 +++------
> >  target/arm/kvm32.c   |  3 +--
> >  target/arm/kvm64.c   | 28 ++++++++++++++++++++--------
> >  target/arm/kvm_arm.h | 15 ++++-----------
> >  4 files changed, 28 insertions(+), 27 deletions(-)
> 
> This breaks compile on 32-bit ARM:
> 
> /home/peter.maydell/qemu/target/arm/kvm32.c:530:5: error: conflicting
> types for 'kvm_arm_pmu_init'
>  int kvm_arm_pmu_init(CPUState *cs)
>      ^
> In file included from /home/peter.maydell/qemu/target/arm/kvm32.c:21:0:
> /home/peter.maydell/qemu/target/arm/kvm_arm.h:199:6: note: previous
> declaration of 'kvm_arm_pmu_init' w
> as here
>  void kvm_arm_pmu_init(CPUState *cs);
>       ^

Argh. Sorry about that. I could have sworn I compile-tested for 32-bit
ARM. Maybe I changed the series afterwards and forgot to compile-test
again...

> 
> Looks like you forgot to update the 32-bit version of the function
> to the new API; I'll just fix up the patch in my queue.

Thanks!

drew
