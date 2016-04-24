Received: by 10.25.208.194 with SMTP id h185csp505960lfg;
        Sun, 24 Apr 2016 10:17:54 -0700 (PDT)
X-Received: by 10.140.102.193 with SMTP id w59mr30113275qge.58.1461518274902;
        Sun, 24 Apr 2016 10:17:54 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o20si8422613qka.256.2016.04.24.10.17.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 24 Apr 2016 10:17:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:56026 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1auNfN-0008Vo-AK
	for alex.bennee@linaro.org; Sun, 24 Apr 2016 13:17:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41258)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1auNfK-0008ON-WC
	for qemu-arm@nongnu.org; Sun, 24 Apr 2016 13:17:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1auNfH-0006WE-QJ
	for qemu-arm@nongnu.org; Sun, 24 Apr 2016 13:17:50 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53858)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>)
	id 1auNfH-0006W4-LI; Sun, 24 Apr 2016 13:17:47 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 23B3CC057EC9;
	Sun, 24 Apr 2016 17:17:47 +0000 (UTC)
Received: from hawk.localdomain (ovpn-204-19.brq.redhat.com [10.40.204.19])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u3OHHhjF010812
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Sun, 24 Apr 2016 13:17:45 -0400
Date: Sun, 24 Apr 2016 19:17:42 +0200
From: Andrew Jones <drjones@redhat.com>
To: Shannon Zhao <zhaoshenglong@huawei.com>
Message-ID: <20160424171742.xkk5gxy2qqjhrwwp@hawk.localdomain>
References: <1461405855-15576-1-git-send-email-zhaoshenglong@huawei.com>
	<1461405855-15576-2-git-send-email-zhaoshenglong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1461405855-15576-2-git-send-email-zhaoshenglong@huawei.com>
User-Agent: Mutt/1.5.23.1 (2014-03-12)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v2 1/3] target-arm: kvm64: set guest PMUv3
 feature bit if supported
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
Cc: peter.maydell@linaro.org, shannon.zhao@linaro.org, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, peter.huangpeng@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: A9v3EOqHbO+L

On Sat, Apr 23, 2016 at 06:04:13PM +0800, Shannon Zhao wrote:
> From: Shannon Zhao <shannon.zhao@linaro.org>
> 
> Check if kvm supports guest PMUv3. If so, set the corresponding feature
> bit for vcpu.
> 
> Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
> ---
>  target-arm/cpu-qom.h | 2 ++
>  target-arm/kvm64.c   | 5 +++++
>  2 files changed, 7 insertions(+)

Reviewed-by: Andrew Jones <drjones@redhat.com>

> 
> diff --git a/target-arm/cpu-qom.h b/target-arm/cpu-qom.h
> index 1061c08..93aa6a4 100644
> --- a/target-arm/cpu-qom.h
> +++ b/target-arm/cpu-qom.h
> @@ -105,6 +105,8 @@ typedef struct ARMCPU {
>      bool powered_off;
>      /* CPU has security extension */
>      bool has_el3;
> +    /* CPU has PMU (Performance Monitor Unit) */
> +    bool has_pmu;
>  
>      /* CPU has memory protection unit */
>      bool has_mpu;
> diff --git a/target-arm/kvm64.c b/target-arm/kvm64.c
> index e8527bf..b364789 100644
> --- a/target-arm/kvm64.c
> +++ b/target-arm/kvm64.c
> @@ -461,6 +461,11 @@ int kvm_arch_init_vcpu(CPUState *cs)
>      if (!arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
>          cpu->kvm_init_features[0] |= 1 << KVM_ARM_VCPU_EL1_32BIT;
>      }
> +    if (kvm_irqchip_in_kernel() &&
> +        kvm_check_extension(cs->kvm_state, KVM_CAP_ARM_PMU_V3)) {
> +        cpu->has_pmu = true;
> +        cpu->kvm_init_features[0] |= 1 << KVM_ARM_VCPU_PMU_V3;
> +    }
>  
>      /* Do KVM_ARM_VCPU_INIT ioctl */
>      ret = kvm_arm_vcpu_init(cs);
> -- 
> 2.0.4
> 
> 
