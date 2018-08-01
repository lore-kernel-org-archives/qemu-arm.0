Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp557555wru;
        Wed, 1 Aug 2018 03:06:30 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdnx6RSjKjFOSn5Ud38T+wiXfz2zJcnBVxu1CGBAB2xIpjigzFZoDIy3bdCCRVkWUPIwDbk
X-Received: by 2002:a37:5d02:: with SMTP id r2-v6mr23384151qkb.22.1533117990486;
        Wed, 01 Aug 2018 03:06:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533117990; cv=none;
        d=google.com; s=arc-20160816;
        b=UujpompR/u+vYpi7NXuJbDlCG9OWQULDc39cTgkuxPbBWMGG2hLfn9106Ln4cMnMwM
         QWhx4xlY4uMyVY/TCpdRptj0CNDSPbZ6t7UNTYlg3BGx5PZqIVpziovxZ64RLTjFsO63
         DeeL/L5FR4y3vIDmXetcLAVlu2ViiFhd4LbkRSbZukgJ/y/bgM0gkKLfMINHTZ1GsLiJ
         SONxYGplbSnP1hOplnYsbg77YBNYgioOUN96C0R4vj+dMfffEjj2wNgCVfMV/4pKyU/h
         4sZQmalwRiCjlVtsunO2njkMkD3rnxtNZbUIfo6/SJWdHC4LDsnH1GNFkuqp/zbXthiK
         Tgvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=X5rP/IjAAAYj9wQH4Q1pn/foeIqKZWHfeW8M2mWoCNE=;
        b=0/qOaccR1So1tvwbHQ0gGcP698wLsFaD+3L3M4RKbJTNz0feVEg6155RwWDJvivgvj
         22JrtL0daHYcmfFx6uN4l/hv7ImPwAA2Q4r3Y9QkVP8WMEjUdHFflYRfq/LwR5Zpldhf
         y4tBKYRhld2/yoR0PEJDAobRiQyjW1g20BVznUhFzmQE7Hz95woAiXQokmxdKLBkM6t2
         L7deFXYgrII0lLocFgTaYcFnR4tsLHF9ZdA22W/aJlSyWlcK95YSkpQadyd9iGoT52dC
         L8E1LR43aPjrCJ5vNFFXTPmjMu8VndOBinqe+UOsix5Sv08SaW1LX6EEgnqo0WEYvP7S
         6KqQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 9-v6si1765870qkl.30.2018.08.01.03.06.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 01 Aug 2018 03:06:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:38728 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fko1W-0002cm-2a
	for alex.bennee@linaro.org; Wed, 01 Aug 2018 06:06:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47292)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1fko1O-0002cG-Lf
	for qemu-arm@nongnu.org; Wed, 01 Aug 2018 06:06:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1fko1L-0004zA-Fh
	for qemu-arm@nongnu.org; Wed, 01 Aug 2018 06:06:22 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:37917 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <gengdongjiu@huawei.com>)
	id 1fko1L-0004wT-3P; Wed, 01 Aug 2018 06:06:19 -0400
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.59])
	by Forcepoint Email with ESMTP id EFD283B702E3;
	Wed,  1 Aug 2018 18:06:09 +0800 (CST)
Received: from [127.0.0.1] (10.142.68.147) by DGGEMS411-HUB.china.huawei.com
	(10.3.19.211) with Microsoft SMTP Server id 14.3.399.0; Wed, 1 Aug 2018
	18:06:03 +0800
To: <peter.maydell@linaro.org>, <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
References: <1532196162-29453-1-git-send-email-gengdongjiu@huawei.com>
From: gengdongjiu <gengdongjiu@huawei.com>
Message-ID: <4beb699e-8e9b-0a3e-01a6-891033ebc7a5@huawei.com>
Date: Wed, 1 Aug 2018 18:05:55 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <1532196162-29453-1-git-send-email-gengdongjiu@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.142.68.147]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 45.249.212.35
Subject: Re: [Qemu-arm] [PATCH v6 0/3] add support for VCPU event states
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
Cc: linuxarm@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FgSzlYCqRM0k

Hi Peter,
   sorry to disturb you, any comments for this series patch? thanks you in advance.

On 2018/7/22 2:02, Dongjiu Geng wrote:
> Support for KVM_GET/SET_VCPU_EVENTS to get/set the SError exception
> state, and support the state migration.
> 
> change since v4:
> 1. update the linux header files to 4.18-rc5 
> 
> change since v3:
> 1. Add a new new subsection with a suitable 'ras_needed' function
> controlling whether it is present
> 2. Add a ARM_FEATURE_RAS feature bit for CPUARMState
> 
> change since v2:
> 1. add header definition for arm platform
> 
> change since v1:
> 1. update the code to fix the build errors
> 
> The related kernel change has been already applied to kvmarm/next.
> (https://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm.git/log/?h=next)
> 
> Dongjiu Geng (3):
>   Update Linux headers to 4.18-rc5
>   kvm: sync linux headers
>   target: arm: Add support for VCPU event states
> 
>  include/standard-headers/linux/virtio_config.h | 16 +++++--
>  linux-headers/asm-arm/kvm.h                    | 13 ++++++
>  linux-headers/asm-arm64/kvm.h                  | 13 ++++++
>  linux-headers/asm-mips/unistd.h                | 18 +++++---
>  linux-headers/asm-powerpc/kvm.h                |  1 +
>  linux-headers/asm-powerpc/unistd.h             |  1 +
>  linux-headers/asm-s390/unistd_32.h             |  2 +
>  linux-headers/asm-s390/unistd_64.h             |  2 +
>  linux-headers/linux/kvm.h                      |  1 +
>  target/arm/cpu.h                               |  6 +++
>  target/arm/kvm64.c                             | 59 ++++++++++++++++++++++++++
>  target/arm/machine.c                           | 22 ++++++++++
>  12 files changed, 144 insertions(+), 10 deletions(-)
> 

