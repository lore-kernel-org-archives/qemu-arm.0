Received: by 10.223.159.82 with SMTP id f18csp2111287wrg;
        Fri, 24 Nov 2017 05:39:23 -0800 (PST)
X-Google-Smtp-Source: AGs4zMbuKvrZ5wrSRPPhpdceRn6TZH9hdGAQ/8/1g54Tsp1rMmPryQN69VIyMiCKtj1nx28p+Uhk
X-Received: by 10.129.86.214 with SMTP id k205mr11874863ywb.478.1511530763722;
        Fri, 24 Nov 2017 05:39:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1511530763; cv=none;
        d=google.com; s=arc-20160816;
        b=fC3fw2UL5KSn844xBdohwOJTFqL3SB4l/pRJHFbN7jxdj4jS3s0ecVD7szT5eBtAJr
         qcb5AzdPJkkp7C8M1C8ETT1RjEt/hloSm8yWpYnIgV66MaYrNO8CTYDvCRPapGsZXoPV
         hSaJ/RXM5CHig17z/FzoNmtbifGUmhSeoK+l8HUiuQWMBRWRk6XFma1Zv/8AIoaNUS12
         hvN8+6JZAPOR9ZK0Up9bciBKeNI4QY9aEkrF39mLLRFyKnpUPSYTsGGpOm7hH7K3Ezq6
         uocOivyBURAn+wtNAHeVImAwkW2Q96oZUQNd3p0+CjQT4Lzd7DGUTXMFm8madBRYoMEt
         8uGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=nr0fCyK5XoXJIyQmpfggr+kvGmq1kw2M8K5bAZGEhUY=;
        b=y3b/XsjmjdKv1yzS8aFq24F0yN8na34RZgqMQ2Ub2Vnn989bUvTGgLHGT9gAgA4TSu
         CntU7qUKPS/BDybtpZjZC9MfjORh6MYieSK6rK2UKo33a2LhnyNaSZxE+bunPwQiLZt0
         wfQkw1E8t5HDHFUILiyRyh2yACQUA8M+iN6MjDPlpxNifJq+10sQtzbrxaeRetceZKWr
         7R44f3L2E+BJvXSMRtWFaFELiZrgWjPhh0iHm0MyQQaCKpqu3msMFIW28LwkLQ/fJwHS
         RJ1j4CH4EHQxMg6A0CWrK/VFNziNH9ri4bq+A4rFOc1DPZeahipY3/KzQkGaVwTSiYq7
         diBg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kIwqGS+2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f11si2336254ywa.339.2017.11.24.05.39.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 24 Nov 2017 05:39:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kIwqGS+2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49327 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eIECR-0007lA-2j
	for alex.bennee@linaro.org; Fri, 24 Nov 2017 08:39:23 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47763)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eIEC6-0007kh-9v
	for qemu-arm@nongnu.org; Fri, 24 Nov 2017 08:39:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eIEC5-0008J1-7U
	for qemu-arm@nongnu.org; Fri, 24 Nov 2017 08:39:02 -0500
Received: from mail-oi0-x244.google.com ([2607:f8b0:4003:c06::244]:34464)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eIEC5-0008Ir-2R
	for qemu-arm@nongnu.org; Fri, 24 Nov 2017 08:39:01 -0500
Received: by mail-oi0-x244.google.com with SMTP id a75so15104826oib.1
	for <qemu-arm@nongnu.org>; Fri, 24 Nov 2017 05:39:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=nr0fCyK5XoXJIyQmpfggr+kvGmq1kw2M8K5bAZGEhUY=;
	b=kIwqGS+2vSpAiJbPThkc90JNYAzr7TqRSGZRa/eG22RhSa72ssUqQzhn5/bfKfaIXc
	xDTRjZit9ubA1480632kcmCwsLWd0+zd3sEkmfLuCyF7gW4paDI2wOWPjaGjkwYVgrlY
	zTkL0OOSCPhrOC2cXiQ5FubnFhOMECpoRV6zI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=nr0fCyK5XoXJIyQmpfggr+kvGmq1kw2M8K5bAZGEhUY=;
	b=o8T8wDIuwxL8jmkHhUvYR/icrFFERaVoxLl/VZgemjx5PHSO9lBlNU8NA1sZ6ntSwX
	DIeR8tgeZ7A9QH+Serjd9KMQ0Ds/TjdWI1Ga25VZF9kwKusUqy830+y/rIcyABAYyr7H
	F8fRQylruFE24om7zWJH23D6MbCz8AlqxuUWjGUt0RL4FDONhH5yfi9NEIB/b+HLDzkY
	dUmqDPvJlg2mIH+uuB2CLSUiGjH6axMo7tTIxUrBAexgbdjQAzXvBjpnzTe2A9pKtQoc
	l4AzQN5wYDtMllaLlbFvGQieQtlMHl/OnRPPOTxO5Nn1I9yYiRFLlNOQrnI7KAQ6h6NM
	2Ubg==
X-Gm-Message-State: AJaThX7QJvBthlBVf3W5OIgMpokKqmeJymVmQM5NKimw9ojvSC62ynd0
	rMD+qZtlMFcKoa7W4FUNDsPzXylKbeF+2sAP8oc/8g==
X-Received: by 10.202.83.22 with SMTP id h22mr8722975oib.8.1511530740172; Fri,
	24 Nov 2017 05:39:00 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.63.74 with HTTP; Fri, 24 Nov 2017 05:38:39 -0800 (PST)
In-Reply-To: <1511530238-18318-4-git-send-email-eric.auger@redhat.com>
References: <1511530238-18318-1-git-send-email-eric.auger@redhat.com>
	<1511530238-18318-4-git-send-email-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Nov 2017 13:38:39 +0000
Message-ID: <CAFEAcA-ro5AkFt-eAhDX+AhDv5HDs6oezS9UYuT+jsMy5jYMWw@mail.gmail.com>
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::244
Subject: Re: [Qemu-arm] [PATCH v4 3/4] linux-headers: update to pre 4.15-rc0
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
Cc: Andrew Jones <drjones@redhat.com>, Vijay Kilari <vijay.kilari@gmail.com>,
	Juan Quintela <quintela@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, wu.wubin@huawei.com,
	wanghaibin.wang@huawei.com, Christoffer Dall <christoffer.dall@linaro.org>,
	eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ugw5XpAo2fUL

On 24 November 2017 at 13:30, Eric Auger <eric.auger@redhat.com> wrote:
> Update headers against post v4.14 and pre v4.15-rc0.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>  include/standard-headers/asm-s390/virtio-ccw.h     |   1 +
>  include/standard-headers/asm-x86/hyperv.h          | 394 +--------------------
>  include/standard-headers/linux/input-event-codes.h |   2 +
>  include/standard-headers/linux/input.h             |   1 +
>  include/standard-headers/linux/pci_regs.h          |  45 ++-
>  linux-headers/asm-arm/kvm.h                        |   8 +
>  linux-headers/asm-arm/kvm_para.h                   |   1 +
>  linux-headers/asm-arm/unistd.h                     |   2 +
>  linux-headers/asm-arm64/kvm.h                      |   8 +
>  linux-headers/asm-arm64/unistd.h                   |   1 +
>  linux-headers/asm-powerpc/epapr_hcalls.h           |   1 +
>  linux-headers/asm-powerpc/kvm.h                    |   1 +
>  linux-headers/asm-powerpc/kvm_para.h               |   1 +
>  linux-headers/asm-powerpc/unistd.h                 |   1 +
>  linux-headers/asm-s390/kvm.h                       |   1 +
>  linux-headers/asm-s390/kvm_para.h                  |   1 +
>  linux-headers/asm-s390/unistd.h                    |   4 +-
>  linux-headers/asm-x86/kvm.h                        |   1 +
>  linux-headers/asm-x86/kvm_para.h                   |   2 +-
>  linux-headers/asm-x86/unistd.h                     |   1 +
>  linux-headers/linux/kvm.h                          |   2 +
>  linux-headers/linux/kvm_para.h                     |   1 +
>  linux-headers/linux/psci.h                         |   1 +
>  linux-headers/linux/userfaultfd.h                  |   1 +
>  linux-headers/linux/vfio.h                         |   1 +
>  linux-headers/linux/vfio_ccw.h                     |   1 +
>  linux-headers/linux/vhost.h                        |   1 +

> --- a/include/standard-headers/asm-x86/hyperv.h
> +++ b/include/standard-headers/asm-x86/hyperv.h
> @@ -1,393 +1 @@
> -#ifndef _ASM_X86_HYPERV_H
> -#define _ASM_X86_HYPERV_H
> -
> -#include "standard-headers/linux/types.h"
> -
> -/*
> - * The below CPUID leaves are present if VersionAndFeatures.HypervisorPresent
> - * is set by CPUID(HvCpuIdFunctionVersionAndFeatures).
> - */
> -#define HYPERV_CPUID_VENDOR_AND_MAX_FUNCTIONS  0x40000000
> -#define HYPERV_CPUID_INTERFACE                 0x40000001
> -#define HYPERV_CPUID_VERSION                   0x40000002
> -#define HYPERV_CPUID_FEATURES                  0x40000003
> -#define HYPERV_CPUID_ENLIGHTMENT_INFO          0x40000004
> -#define HYPERV_CPUID_IMPLEMENT_LIMITS          0x40000005
> -
> -#define HYPERV_HYPERVISOR_PRESENT_BIT          0x80000000
> -#define HYPERV_CPUID_MIN                       0x40000005
> -#define HYPERV_CPUID_MAX                       0x4000ffff

Did you test building on x86 host? It's hard to see how the
code in QEMU that uses these HYPERV #defines will still compile.

thanks
-- PMM
