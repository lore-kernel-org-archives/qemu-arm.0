Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp1956153wrm;
        Wed, 9 Oct 2019 23:29:47 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxDxY+ghkUxbCH28pnpNHQVCuZuvG0wZ9ZeG4FxG08A6GqglZvgnFgrWzh/6fPhcbe9rsD0
X-Received: by 2002:ac8:75c6:: with SMTP id z6mr8478578qtq.197.1570688986928;
        Wed, 09 Oct 2019 23:29:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570688986; cv=none;
        d=google.com; s=arc-20160816;
        b=Yfx0ol6Yq9TstA886n8CRd8UiWe37QU+IEfqIavWa8HWW+oFTd9ZPy2YWqfitJv/xE
         +DQmXJBwbTgI4xoG73vFI9Zk0Ept2vCsUnNXxt5TWbYV6d78cvETa0JtIeT+HBJZROCq
         jHpEaHg7VyfIwv+NxBArCVYzHIYV+YtZO1ccofRdFpdC0S+tmbfydrvcRwxtaISykBRR
         Y/B7aTE9tMhIIIWW9w8fWIzU/4HNd7ZhHzWD3VFc8MJhal+2NW2rvcNvgFkkNILksQ56
         8p8HblC7+lobCOcjdCZj5MSeXEFNSsKhSxhwBJb6USIxPiNSTSS322RGFYbh6w8v5f6A
         OaNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:to
         :from:date;
        bh=lD4ZavwHOWuqjQJhEAHVRU//UD51rovBE5r1ipfqFR4=;
        b=Aw+8Dxxi/j1aaEs8sQ7m4v0GqnE7zeAnJcGejcaG7Z08iIWT1/hqapN5dapNB0okgG
         y/k9wtQSWA93uGHk1qvCRzshQfst22Apdw221aRyIJQzhCDgJUnFA7az9TfYbQdQo1mc
         OdqCRf7rFnvSfQgHIQ23h1PIMjx1N/OjHaZ6SEreqceqCWsdkBW0ovqP3vi6RxXZ4GrC
         BXytwbgioTQtolRmwW40Ip7gX+bTDn4zoJQFqzDkG2fYDPV7YoSBrPUHl9BqP8Y/PfVu
         Zq4D1QgEueg1LkWaCb0IjfxtOU3fzO9wiaVLPfyv/Ds1axO+PpPFfzN48KseQNyVPWrz
         19IA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w3si4633050qvl.29.2019.10.09.23.29.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Oct 2019 23:29:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iIRxK-0001Gl-DO
	for alex.bennee@linaro.org; Thu, 10 Oct 2019 02:29:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44951)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <drjones@redhat.com>) id 1iIRxA-0001Gc-MY
 for qemu-arm@nongnu.org; Thu, 10 Oct 2019 02:29:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <drjones@redhat.com>) id 1iIRx9-0007Av-9S
 for qemu-arm@nongnu.org; Thu, 10 Oct 2019 02:29:36 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36674)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <drjones@redhat.com>)
 id 1iIRx9-0007Ad-47; Thu, 10 Oct 2019 02:29:35 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id ABBA83164683;
 Thu, 10 Oct 2019 06:29:33 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3EB5360BF4;
 Thu, 10 Oct 2019 06:29:32 +0000 (UTC)
Date: Thu, 10 Oct 2019 08:29:29 +0200
From: Andrew Jones <drjones@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [RFC PATCH 3/5] target/arm/kvm: Implement cpu feature kvm-adjvtime
Message-ID: <20191010062929.arxwmdlc3i7p2u6u@kamzik.brq.redhat.com>
References: <20191007170622.1814-1-drjones@redhat.com>
 <20191007170622.1814-4-drjones@redhat.com>
 <892976b9-0e43-940d-1d36-046749d652c9@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <892976b9-0e43-940d-1d36-046749d652c9@linaro.org>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.41]); Thu, 10 Oct 2019 06:29:33 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, maz@kernel.org,
 qemu-devel@nongnu.org, bijan.mottahedeh@oracle.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mjt9zcEaEMbL

On Wed, Oct 09, 2019 at 08:50:02PM -0400, Richard Henderson wrote:
> On 10/7/19 1:06 PM, Andrew Jones wrote:
> > +static void kvm_arm_vm_state_change(void *opaque, int running, RunState state)
> > +{
> > +    CPUState *cs = opaque;
> > +    ARMCPU *cpu = ARM_CPU(cs);
> > +
> > +    if (running) {
> > +        if (cpu->kvm_adjvtime) {
> > +            kvm_arm_set_virtual_time(cs);
> > +        }
> > +    }
> > +}
> 
> Worth putting this in kvm.c too, so you don't have to duplicate it?  You can
> always split it apart later if you ever do need a different hook for 32 vs 64.

True. I'll send a v1 without the premature duplication of this function
and your r-b's

Thanks,
drew
