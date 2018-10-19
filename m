Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp3508509wrt;
        Fri, 19 Oct 2018 01:48:55 -0700 (PDT)
X-Google-Smtp-Source: ACcGV63bnnmXLv6VESYRH0mq2puqLeBjHZw8qcRbIJPT9bY/ddziudfxp971f2hkDk22gsebvmrR
X-Received: by 2002:ac8:4a11:: with SMTP id x17-v6mr32711609qtq.232.1539938935253;
        Fri, 19 Oct 2018 01:48:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539938935; cv=none;
        d=google.com; s=arc-20160816;
        b=xClNpRhUTy4+7bnkCUUig79N7P66Mfizi+fyVh0T2J1pYd5rJarEx50pVTzwthi4i5
         mwFt0i3fnrAHF8wQbyn59npMTz3qGjfjSUQKtQw6g5o0/qDmWCo35kO/o9pMCiOo2NAL
         tLV583sQZfyYgENoKr+CNIqOG6lT+EKHpaKRwXwqBanqqYn4aB9GInOGgS6AhMp4LCxR
         e9sx4mUdL5TPACPDIecKccLLB3NCIut/grc3df9+eN7kCaSJYR7qOYtP6tdtmltX/b45
         1iBdQYuuJC+BLG/m1UO3WJ49HiWCTGWvlapFy6r2WQIn7BkWSx0BlbNgpEJ18yDswot/
         nmDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=O/BOWkucKm6vdEEdZwAbv8A0RI/pvM9AjWCIDcIlh4U=;
        b=KQCfYdgrhEg9+7YKS1nh0XhaTBYL9DuRzuu7tK0hMc3BC4bmeDi3cDN150H2IJ1Gr4
         8YrhbbZ5jQq4BMgmU4zAhsSiTTwkBBDQmSce4VD4+fWMQ5uO2b7UOZhM4X7SQx2BkC9I
         e9FdpAY/bzSmssQXGD1YDXgiMuJqUXCsR0S3ngHjdXIOtEH8uf/AZwMmnEHBrmfh1XRb
         WGaZBIJXNc3obf0E3vfhudr9FVuo7VTCvagWjE0qHWFGG865BHEGpfBuI+4FuPiMqh/v
         yGpswy23nfoMPdeKy/tYKFSBIPby7gWxC7l+W6e8GGaeyYznfreTPYHZ0i0DmRyIYyjV
         HR6w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c3-v6si10567970qta.188.2018.10.19.01.48.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 19 Oct 2018 01:48:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:47910 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gDQSk-0001bZ-Ip
	for alex.bennee@linaro.org; Fri, 19 Oct 2018 04:48:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39666)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <suzuki.poulose@arm.com>) id 1gDQSW-0001WC-3t
	for qemu-arm@nongnu.org; Fri, 19 Oct 2018 04:48:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <suzuki.poulose@arm.com>) id 1gDQSP-0005ye-Kp
	for qemu-arm@nongnu.org; Fri, 19 Oct 2018 04:48:37 -0400
Received: from foss.arm.com ([217.140.101.70]:56292)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <suzuki.poulose@arm.com>)
	id 1gDQSL-0005fk-Qo; Fri, 19 Oct 2018 04:48:31 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7407580D;
	Fri, 19 Oct 2018 01:48:21 -0700 (PDT)
Received: from [10.37.12.214] (unknown [10.37.12.214])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0E9F03F5D3;
	Fri, 19 Oct 2018 01:48:18 -0700 (PDT)
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
	shameerali.kolothum.thodi@huawei.com, kwangwoo.lee@sk.com,
	imammedo@redhat.com, david@redhat.com
References: <20181018143042.29588-1-eric.auger@redhat.com>
	<20181018143042.29588-3-eric.auger@redhat.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
Message-ID: <872eeab2-7f0d-6cba-fd05-c75a32aac81b@arm.com>
Date: Fri, 19 Oct 2018 09:49:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20181018143042.29588-3-eric.auger@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 217.140.101.70
Subject: Re: [Qemu-arm] [RFC v4 02/16] linux-headers: header update for
 KVM/ARM KVM_ARM_GET_MAX_VM_PHYS_SHIFT
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
Cc: drjones@redhat.com, dgilbert@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /EVliIr0maSl

Hi Eric,

On 10/18/2018 03:30 PM, Eric Auger wrote:
> This is a header update against kvmarm next branch
> 
> git://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm kvmarm/next
> 
> to get the KVM_ARM_GET_MAX_VM_PHYS_SHIFT ioctl. This allows to retrieve
> the IPA address range KVM supports.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> 
> ---
> 
> v3 -> v4:
> - update against kvmarm next
> ---
>   linux-headers/linux/kvm.h | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/linux-headers/linux/kvm.h b/linux-headers/linux/kvm.h
> index 83ba4eb571..9647ce4fcb 100644
> --- a/linux-headers/linux/kvm.h
> +++ b/linux-headers/linux/kvm.h
> @@ -750,6 +750,15 @@ struct kvm_ppc_resize_hpt {
>   
>   #define KVM_S390_SIE_PAGE_OFFSET 1
>   
> +/*
> + * On arm64, machine type can be used to request the physical
> + * address size for the VM. Bits[7-0] are reserved for the guest
> + * PA size shift (i.e, log2(PA_Size)). For backward compatibility,
> + * value 0 implies the default IPA size, 40bits.
> + */
> +#define KVM_VM_TYPE_ARM_IPA_SIZE_MASK	0xffULL
> +#define KVM_VM_TYPE_ARM_IPA_SIZE(x)		\
> +	((x) & KVM_VM_TYPE_ARM_IPA_SIZE_MASK)
>   /*
>    * ioctls for /dev/kvm fds:
>    */
> @@ -953,6 +962,7 @@ struct kvm_ppc_resize_hpt {
>   #define KVM_CAP_NESTED_STATE 157
>   #define KVM_CAP_ARM_INJECT_SERROR_ESR 158
>   #define KVM_CAP_MSR_PLATFORM_INFO 159
> +#define KVM_CAP_ARM_VM_IPA_SIZE 160 /* returns maximum IPA bits for a VM */

Please be aware that there have been multiple merge conflicts with
the kvmarm-tree onto kvm tree upstream and the numbers have changed.
I assume that you will be rebasing this to mainline anyways.

Cheers
Suzuki
