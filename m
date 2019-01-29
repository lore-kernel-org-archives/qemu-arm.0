Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp4595662wrt;
        Tue, 29 Jan 2019 07:42:39 -0800 (PST)
X-Google-Smtp-Source: ALg8bN7SmUTEv6weB7XigmtntWkFQ9DP3tr5AeoqfnIzIe1OhUrkZU3zXbrU9q150KQ+roogJgvy
X-Received: by 2002:adf:f504:: with SMTP id q4mr27612602wro.321.1548776559160;
        Tue, 29 Jan 2019 07:42:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548776559; cv=none;
        d=google.com; s=arc-20160816;
        b=0IZ23onfX/Dv32MpDwntx2bdfPewcYoi8cl5qAHfGqWAMpptjOG/tnu3ibm7OriGQ1
         P4zVNIhIU92mKxXFP3O5Uftj9JeRVLf3tMdJQqiq/nQny1pd26SLdbDlr91+CRSVW7mp
         L2p3RSqi3d9qqtuwxLv1a/j0jdG6uAnzMH53Tf3KeHC34NH2naqMiBI5/QpNTroKcW9+
         32b6qsmAs/MJGYoNItbhvt2F7eQEjKDW2+/qscVtYrVjaWMU9BRlco/tw5FytpMYPgEY
         Ee9ZEGbvP2gH1DUPErH9FUyLQ3WrZYlCRys9rTvzgTrtaX16VVImJWyAfT6KBmFQsYsK
         zw6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:organization:from:references:to:dkim-signature;
        bh=/b7kH2UlWYuq39a7E8Jk6v4nvMJ8IhJT6jNqPcucX2s=;
        b=pSUDxyHaPGrt/0MJvpyJhxqKkaskIhYZ0kV5gLNLkTXL2jsNI/GGqlDiAjQWSLacnm
         C3Uxy5bwbByvywu6ACraU0HFE3JBiMmpZvJUA2XtcD+uVb6uJYqTE7Xb/XZSqAP7dbQs
         KknQ3QYjkxvsswUaR8jyYHCtK/OR8bbTGyIkhVAyz0qOqxbWTplGDdA2P2bBwsBiKyhK
         7ggtGWDOoZBTfz8G7Qyipm/5n6xwOqzNeScAtzh8VpQJYvr74rRopOUAAE3qpzHzUBHQ
         cJcTKrteGWAncyuiav6UpmK6x3gfgxsBVOYdnDcmP1J9HAcQkv5oq4CzW2mxUUIB9jvQ
         yCeQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=IZgDvv1p;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e17si9820167wri.156.2019.01.29.07.42.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 Jan 2019 07:42:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=IZgDvv1p;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([127.0.0.1]:50598 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1goUqQ-0006GW-US
	for alex.bennee@linaro.org; Tue, 29 Jan 2019 09:58:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49691)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jiakernel2@gmail.com>) id 1goUpZ-0005rz-Fw
	for qemu-devel@nongnu.org; Tue, 29 Jan 2019 09:57:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jiakernel2@gmail.com>) id 1goUgU-0000zd-7q
	for qemu-devel@nongnu.org; Tue, 29 Jan 2019 09:48:27 -0500
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:39891)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <jiakernel2@gmail.com>)
	id 1goUbC-0000HZ-C7; Tue, 29 Jan 2019 09:48:06 -0500
Received: by mail-pf1-x441.google.com with SMTP id r136so9756511pfc.6;
	Tue, 29 Jan 2019 06:42:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:organization:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=/b7kH2UlWYuq39a7E8Jk6v4nvMJ8IhJT6jNqPcucX2s=;
	b=IZgDvv1pWxbLtFxD/YN+s2FElVdag2I0JKSP31Gu1cP2fbPxcegQFAjcDgX+9Pq89Q
	wUiKzA1a+fQMZcpsS5qDhxzcgtSFiF5cUFsBOuC4teVdEXA3HnBe1LRy3VnkxRJfsOnL
	Cq4B7fNlS7c3KH1qZzwHE9rpN8hcOu0NCM7MFhaS+ZssHEnNW5sQL7htZrNS4qwKShcE
	vxcob/8/8JzTC9v5BkbedYltwTKrAfMNQCdBKwtEcOs1ig97iFFiu6BEzeYyPtY1c33I
	XzDgHXjLM/+BCf7jdwxMfiLez2enm7s3CA5gqh2p2J3e3Xk7QBpwmWaeMnVzrtAVQc1S
	+ARQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding;
	bh=/b7kH2UlWYuq39a7E8Jk6v4nvMJ8IhJT6jNqPcucX2s=;
	b=VmmCtujLmZ8LQ3847Om0MKE2iSdbbawwkdrTakcKNKBzBks1T3L9hQH5L+yweYy4nu
	5gsyIDuwGGPkMZCNv3kN5/aJfEcazlR3QxaYHVYiUFrmYaAFUGEl/fEbQ1KAu+UWI4fS
	6n/5lNC0s42kSCRVcu1w815L9WOgaTIhaLh0veqakvnxWNwBG+HGWwVi+8MyS/pmAB6L
	jnQUB8hymMLHgLEmsShOaDpgQSJ4ww1HS3ZOmMwwijSY2DUSTgtzmfJyKkp9tqirZ20h
	4VbBFhJFnfAOBIYi4giSRePyhAOJVAnPaK8HB7KsvmEYwg/gERAgCkXfuJd/160LLKKZ
	wmRw==
X-Gm-Message-State: AJcUukeQaLhgs6nGmYoTyNGDV5BaRHdBZHl3UTpldNfeMo0wsy5D7Hnb
	YD1S1s+yGGNBvo1p/K7eT2Y=
X-Received: by 2002:a63:1c09:: with SMTP id c9mr23606312pgc.200.1548771945347; 
	Tue, 29 Jan 2019 06:25:45 -0800 (PST)
Received: from [0.0.0.0] (96.45.178.72.16clouds.com. [96.45.178.72])
	by smtp.gmail.com with ESMTPSA id
	n186sm44670182pfn.137.2019.01.29.06.25.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 29 Jan 2019 06:25:44 -0800 (PST)
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
	shameerali.kolothum.thodi@huawei.com, imammedo@redhat.com, david@redhat.com
References: <20190123101458.12478-1-eric.auger@redhat.com>
	<20190123101458.12478-8-eric.auger@redhat.com>
From: Jia He <jiakernel2@gmail.com>
Organization: ARM
Message-ID: <85896c69-2434-ee08-331a-2216704d25e0@gmail.com>
Date: Tue, 29 Jan 2019 22:25:31 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190123101458.12478-8-eric.auger@redhat.com>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::441
Subject: Re: [Qemu-devel] [PATCH v5 07/18] kvm: add
 kvm_arm_get_max_vm_phys_shift
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: drjones@redhat.com, dgilbert@redhat.com, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5S0ZhKAMaYar

Hi Eric

On 2019/1/23 18:14, Eric Auger wrote:
> Add the kvm_arm_get_max_vm_phys_shift() helper that returns the
> log of the maximum IPA size supported by KVM. This capability
> needs to be known to create the VM with a specific IPA max size
> (kvm_type passed along KVM_CREATE_VM ioctl.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>
> ---
> v3 -> v4:
> - s/s/ms in kvm_arm_get_max_vm_phys_shift function comment
> - check KVM_CAP_ARM_VM_IPA_SIZE extension
>
> v1 -> v2:
> - put this in ARM specific code
> ---
>   target/arm/kvm.c     |  8 ++++++++
>   target/arm/kvm_arm.h | 16 ++++++++++++++++
>   2 files changed, 24 insertions(+)
>
> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> index e00ccf9c98..877c588ef5 100644
> --- a/target/arm/kvm.c
> +++ b/target/arm/kvm.c
> @@ -18,6 +18,7 @@
>   #include "qemu/error-report.h"
>   #include "sysemu/sysemu.h"
>   #include "sysemu/kvm.h"
> +#include "sysemu/kvm_int.h"
>   #include "kvm_arm.h"
>   #include "cpu.h"
>   #include "trace.h"
> @@ -162,6 +163,13 @@ void kvm_arm_set_cpu_features_from_host(ARMCPU *cpu)
>       env->features = arm_host_cpu_features.features;
>   }
>   
> +int kvm_arm_get_max_vm_phys_shift(MachineState *ms)
> +{
> +    KVMState *s = KVM_STATE(ms->accelerator);
> +
> +    return kvm_check_extension(s, KVM_CAP_ARM_VM_IPA_SIZE);

If KVM_CAP_ARM_VM_IPA_SIZE is not supported in host kernel, would it be

better if kvm_arm_get_max_vm_phys_shift returns a default value

(e.g. 40),instead of an errno?

---
Cheers,
Jia He

> +}
> +
>   int kvm_arch_init(MachineState *ms, KVMState *s)
>   {
>       /* For ARM interrupt delivery is always asynchronous,
> diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
> index 6393455b1d..5969c41f83 100644
> --- a/target/arm/kvm_arm.h
> +++ b/target/arm/kvm_arm.h
> @@ -207,6 +207,17 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf);
>    */
>   void kvm_arm_set_cpu_features_from_host(ARMCPU *cpu);
>   
> +/**
> + * kvm_arm_get_max_vm_phys_shift - Returns log2 of the max IPA size
> + * supported by KVM
> + *
> + * @ms: Machine state handle
> + *
> + * Return the max number of IPA bits or a negative value if
> + * the host kernel does not expose this value.
> + */
> +int kvm_arm_get_max_vm_phys_shift(MachineState *ms);
> +
>   /**
>    * kvm_arm_sync_mpstate_to_kvm
>    * @cpu: ARMCPU
> @@ -239,6 +250,11 @@ static inline void kvm_arm_set_cpu_features_from_host(ARMCPU *cpu)
>       cpu->host_cpu_probe_failed = true;
>   }
>   
> +static inline int kvm_arm_get_max_vm_phys_shift(MachineState *ms)
> +{
> +    return -ENOENT;
> +}
> +
>   static inline int kvm_arm_vgic_probe(void)
>   {
>       return 0;

