Received: by 2002:a17:504:240b:b0:1be9:327d:8ee3 with SMTP id v11csp1189885njc;
        Fri, 14 Feb 2025 02:12:54 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWNq8rDv64IGQlj7DjxNIkCXnCr7t3TTgJAurzQ5iHdW2Bh94WEkD7Z1m4KM65q8128tPBqfDdOgs1IlQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEXPbKggGZBbBN+h9EsfKW6dxfVZBW0DvaJrYzSYLukYlbNtndAUzKvvqpcF/IjZ84J8KgG
X-Received: by 2002:ad4:5ce4:0:b0:6e2:4ad7:24c8 with SMTP id 6a1803df08f44-6e65bf0d0c2mr110424866d6.2.1739527974180;
        Fri, 14 Feb 2025 02:12:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739527974; cv=none;
        d=google.com; s=arc-20240605;
        b=Gvc6QYkiAz5oWSdhqbBjaeugd6UwhvlDG+A6gPfmBLodc95OXd3u6MxLmYe4QwZ0CP
         UMW64zc3AYrkEAIPDGT7HfanSpAlriH2mj1cT/ffLk1kFKH4DVJflt3rKMCNjFIfuWBX
         I2jWH0N2hthXkgUkzdiyxvMrpAhLvB2iuSLuhxf9+0qMlCZnMc5OMqOjSQDgM9KgHbrh
         Ac/tgDVcN0OEcV0LD3sUU+x0ijnj+IMfdgIWpyaVV5J4ttVaNYId0AOimyxNlcuwuHZl
         AiHR3a/+jYuMHLDXI9vExKyTNB16c+At62T6KdFaVyx9sVlqDQpOw3XWkAhCwSSA31ey
         Qbmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:date;
        bh=epEaMBD5iwhlNT+EnVdhfs98NwQXVcInb988t4gIH9E=;
        fh=C+g26U4H6m0pfuaQsjUHD9mEjf8oyDbWFSuiQn1P4xs=;
        b=T0w4v68t36braWxF0agEjRrb/HYXDNxq5NUqAzMbsny+7YBiLH/l0DcVz1G8CL4ljp
         Jh2uo2SwVXFM5uSqHduc96gPuPSj7HLBKjEFMPreBzGWsj1xE8tmYAUkfRoYnuHNbXOe
         yUp+EOB7ZWMP/lasLybzk8UEivz2CMwo/RXrir3t0/6n1AJoDA1B8KnOcfg9qAUcyfEN
         XZONVK7TvY4SNtY5vRMB4mkNeWJwFnL9iibaSKLs6BfPmwAx2mRlfu07V8Ykov/a6tY5
         RXqWToGtdl1PIINwq2sa2UlwiyJIIgpCnhaOoit3d8S7RXKJgDh5hMDJG+aeT0nlZBKA
         tvzg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e65d9c5d9csi30591086d6.413.2025.02.14.02.12.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Feb 2025 02:12:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tisgZ-0004XO-Mt; Fri, 14 Feb 2025 05:12:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1tisgV-0004Wx-6g; Fri, 14 Feb 2025 05:12:35 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1tisgM-00064O-KM; Fri, 14 Feb 2025 05:12:30 -0500
Received: from mail.maildlp.com (unknown [172.18.186.31])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4YvSTX66dVz6M4XV;
 Fri, 14 Feb 2025 18:09:52 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
 by mail.maildlp.com (Postfix) with ESMTPS id DAF941400DA;
 Fri, 14 Feb 2025 18:12:20 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 14 Feb
 2025 11:12:20 +0100
Date: Fri, 14 Feb 2025 10:12:18 +0000
To: Gavin Shan <gshan@redhat.com>, Mauro Carvalho Chehab
 <mchehab+huawei@kernel.org>
CC: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>, <mst@redhat.com>,
 <imammedo@redhat.com>, <anisinha@redhat.com>, <gengdongjiu1@gmail.com>,
 <peter.maydell@linaro.org>, <pbonzini@redhat.com>, <shan.gavin@gmail.com>
Subject: Re: [PATCH 0/4] target/arm: Improvement on memory error handling
Message-ID: <20250214101158.00004f69@huawei.com>
In-Reply-To: <20250214041635.608012-1-gshan@redhat.com>
References: <20250214041635.608012-1-gshan@redhat.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml100004.china.huawei.com (7.191.162.219) To
 frapeml500008.china.huawei.com (7.182.85.71)
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=0.001, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Reply-to:  Jonathan Cameron <Jonathan.Cameron@huawei.com>
From:  Jonathan Cameron via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 0IuzREoIbMQY

On Fri, 14 Feb 2025 14:16:31 +1000
Gavin Shan <gshan@redhat.com> wrote:

> Currently, there is only one CPER buffer (entry), meaning only one
> memory error can be reported. In extreme case, multiple memory errors
> can be raised on different vCPUs. For example, a singile memory error
> on a 64KB page of the host can results in 16 memory errors to 4KB
> pages of the guest. Unfortunately, the virtual machine is simply aborted
> by multiple concurrent memory errors, as the following call trace shows.
> A SEA exception is injected to the guest so that the CPER buffer can
> be claimed if the error is successfully pushed by acpi_ghes_memory_errors(),
> Otherwise, abort() is triggered to crash the virtual machine.
> 
>   kvm_vcpu_thread_fn
>     kvm_cpu_exec
>       kvm_arch_on_sigbus_vcpu
>         kvm_cpu_synchronize_state
>         acpi_ghes_memory_errors         (a)
>         kvm_inject_arm_sea | abort
> 
> It's arguably to crash the virtual machine in this case. The better
> behaviour would be to retry on pushing the memory errors, to keep the
> virtual machine alive so that the administrator has chance to chime
> in, for example to dump the important data with luck. This series
> adds one more parameter to acpi_ghes_memory_errors() so that it will
> be tried to push the memory error until it succeeds.
Hi Gavin,

If the ultimate aim is to support multiple memory errors why not
just do that?  Been a while since I look at how that works, but 
the spec definitely allows it.  I think by just queuing up the errors
and updating the Error Status Address as each one is handled.
I think that's what GHESv2 ack is all about as it prevents the
RAS firmware updating the error record until it is acknowledged
at which point the RAS firmware can report the next one.

Or... Given the usecase above of a 64KiB host page and 4KiB guest
can we inject a single error record with multiple CPER entries and
just handle it all in one go?

Set the Error record header -> section count to 16 and provide
16 Memory Error Sections or equivalent.

Doesn't help with multiple errors in unrelated memory addresses but
maybe removes one problem case.

I've not checked all the information makes it to the right places
however or that we don't end up with a deadlock when multiple vCPU
involved.

If doing the more significant surgery this would involve, I'd
love to see Mauro's series land first as it cleans up a lot of
how HEST is handled etc.

Jonathan

> 
> Gavin Shan (4):
>   acpi/ghes: Make ghes_record_cper_errors() static
>   acpi/ghes: Use error_report() in ghes_record_cper_errors()
>   acpi/ghes: Allow retry to write CPER errors
>   target/arm: Retry pushing CPER error if necessary
> 
>  hw/acpi/ghes-stub.c    |  3 ++-
>  hw/acpi/ghes.c         | 45 +++++++++++++++++++++---------------------
>  include/hw/acpi/ghes.h |  5 ++---
>  target/arm/kvm.c       | 31 +++++++++++++++++++++++------
>  4 files changed, 51 insertions(+), 33 deletions(-)
> 

