Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp5187657lfp;
        Tue, 4 Feb 2020 02:35:01 -0800 (PST)
X-Google-Smtp-Source: APXvYqwiiiOeWOo+PVtwHk17hmMv+KZ1Ig8bcCrS9J6cEAkJLDP/myEAIYGSLjnzWa2Y3ZchYaD0
X-Received: by 2002:ad4:4aaa:: with SMTP id i10mr27425239qvx.27.1580812500955;
        Tue, 04 Feb 2020 02:35:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580812500; cv=none;
        d=google.com; s=arc-20160816;
        b=fou4QEZzrM9CDJFfVPT9R5ncyPdOjcFDsbi8U02LsKa5lga56aP4HZNe9rtMkFUZdB
         iBKqCrmq+f5A/zh/aoMWO44nDewCxQvs62FbmD8JHHvCtdix7B9XMgtqdTK1zRVwhwI1
         E1oFdZNx+CnLLYq0YDxkDmBq2ZVvVRfKG1yvOSowzwf1eP4JvP2oocbMDWrnOmermO/5
         qDoAzxPdeyKMnDE4lNDupRulbLpYUkAHOAeE3CY/9iAKXfE7V8a7Qv2bHkncdrli0qj4
         GzZDzjJ/uXZlv6PxYFND0VEeZYoNuxF6DdogD315DKeC4zBpIYjCPIrvqJ0TDhtu0rOP
         GWpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:cc
         :content-disposition:in-reply-to:mime-version:references:message-id
         :subject:to:from:date:dkim-signature;
        bh=zayxA1sSoKR2UdHHCp7D4LCttiVwfsBsmBLBx8/KgnM=;
        b=Vc5sJegbT7/jt/MgPXBfJQDUm+YKHawtrAzAs986IPCyIL+BM3k0GH+Zi2E3QCl+L2
         esyeFW1vXSafvSSEykX3zhmQMX0Mv7UiXbVKiJ3khLQGJu4iPQStkPW6LI5HPbfjVzh8
         W+Ff/nDD/cuHA1o2iICDYE7E12SQNKG0VUmQjZUBCSLD9p91As6jOto/8PhTX7k8sJW7
         fSgOvGKwWrMHEMkt2I2E8X3/Hb+vqxnDi9iUysXfDXRRC5cid/30qsdFKHvU0IR9y8CE
         U0M0htXAoxgJA+V0HBrhfK22OarcLrTBBwvR5MSWlWglh/mIrVi7T4RTZqgri/AvJczF
         vL5A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@redhat.com header.s=mimecast20190719 header.b=gNRicseZ;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id p186si13628711qkc.318.2020.02.04.02.35.00;
        Tue, 04 Feb 2020 02:35:00 -0800 (PST)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@redhat.com header.s=mimecast20190719 header.b=gNRicseZ;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 60C974A610;
	Tue,  4 Feb 2020 05:35:00 -0500 (EST)
X-Virus-Scanned: at lists.cs.columbia.edu
X-Spam-Flag: NO
X-Spam-Score: 0.909
X-Spam-Level: 
X-Spam-Status: No, score=0.909 required=6.1 tests=[BAYES_00=-1.9,
	DKIM_SIGNED=0.1, DNS_FROM_AHBL_RHSBL=2.699,
	RCVD_IN_DNSWL_NONE=-0.0001, T_DKIM_INVALID=0.01] autolearn=no
Authentication-Results: mm01.cs.columbia.edu (amavisd-new); dkim=softfail
	(fail, message has been altered) header.i=@redhat.com
Received: from mm01.cs.columbia.edu ([127.0.0.1])
	by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yqKlGtznjkRn; Tue,  4 Feb 2020 05:34:59 -0500 (EST)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 2DB174A535;
	Tue,  4 Feb 2020 05:34:59 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id 3AE854A4FC
 for <kvmarm@lists.cs.columbia.edu>; Tue,  4 Feb 2020 05:34:58 -0500 (EST)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ml64UADTgViD for <kvmarm@lists.cs.columbia.edu>;
 Tue,  4 Feb 2020 05:34:57 -0500 (EST)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id 15C104A49F
 for <kvmarm@lists.cs.columbia.edu>; Tue,  4 Feb 2020 05:34:57 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580812496;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N2ppv8VdQFYEFb3YbQEdr4SJtjIEKEg19DLBErWYPcY=;
 b=gNRicseZ0BtdEdDZOKj6sgX/5PJsM3ulQpVW/w/kPq75A5u3EGi7WqGvBZJ8KTOjU8dYIe
 sh2Ng5vP29seEVCdIsJmu8jumZ9GRWcTuCrvoBF8z9HrGvhOPagbKXM27LVSj8HdNTQWlF
 FebKOTufV8TT4XP38ADkmz5eadRj0mU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-52-Z-AHNODQMpS_xR1azR6Erw-1; Tue, 04 Feb 2020 05:34:52 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 443E9801A1F;
 Tue,  4 Feb 2020 10:34:51 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8A9DD8068E;
 Tue,  4 Feb 2020 10:34:49 +0000 (UTC)
Date: Tue, 4 Feb 2020 11:34:47 +0100
From: Andrew Jones <drjones@redhat.com>
To: Beata Michalska <beata.michalska@linaro.org>
Subject: Re: [PATCH v2 1/2] target/arm: kvm: Inject events at the last stage
 of sync
Message-ID: <20200204103447.naw26xl2y2zbyrqb@kamzik.brq.redhat.com>
References: <20200129202441.12745-1-beata.michalska@linaro.org>
 <20200129202441.12745-2-beata.michalska@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20200129202441.12745-2-beata.michalska@linaro.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: Z-AHNODQMpS_xR1azR6Erw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, pbonzini@redhat.com,
 kvmarm@lists.cs.columbia.edu
X-BeenThere: kvmarm@lists.cs.columbia.edu
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: Where KVM/ARM decisions are made <kvmarm.lists.cs.columbia.edu>
List-Unsubscribe: <https://lists.cs.columbia.edu/mailman/options/kvmarm>,
 <mailto:kvmarm-request@lists.cs.columbia.edu?subject=unsubscribe>
List-Archive: <https://lists.cs.columbia.edu/pipermail/kvmarm>
List-Post: <mailto:kvmarm@lists.cs.columbia.edu>
List-Help: <mailto:kvmarm-request@lists.cs.columbia.edu?subject=help>
List-Subscribe: <https://lists.cs.columbia.edu/mailman/listinfo/kvmarm>,
 <mailto:kvmarm-request@lists.cs.columbia.edu?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kvmarm-bounces@lists.cs.columbia.edu
Sender: kvmarm-bounces@lists.cs.columbia.edu
X-TUID: xM/HqUis9eHG

On Wed, Jan 29, 2020 at 08:24:40PM +0000, Beata Michalska wrote:
> KVM_SET_VCPU_EVENTS might actually lead to vcpu registers being modified.
> As such this should be the last step of sync to avoid potential overwriting
> of whatever changes KVM might have done.
> 
> Signed-off-by: Beata Michalska <beata.michalska@linaro.org>
> ---
>  target/arm/kvm32.c | 20 ++++++++++----------
>  target/arm/kvm64.c | 20 ++++++++++----------
>  2 files changed, 20 insertions(+), 20 deletions(-)
> 
> diff --git a/target/arm/kvm32.c b/target/arm/kvm32.c
> index 32bf8d6..cf2b47f 100644
> --- a/target/arm/kvm32.c
> +++ b/target/arm/kvm32.c
> @@ -386,17 +386,17 @@ int kvm_arch_put_registers(CPUState *cs, int level)
>          return ret;
>      }
>  
> -    ret = kvm_put_vcpu_events(cpu);
> -    if (ret) {
> -        return ret;
> -    }
> -
>      write_cpustate_to_list(cpu, true);
>  
>      if (!write_list_to_kvmstate(cpu, level)) {
>          return EINVAL;
>      }
>  
> +    ret = kvm_put_vcpu_events(cpu);
> +    if (ret) {
> +        return ret;
> +    }
> +

I think we should put a comment above this that says basically the same
thing as the commit message in order to explain why kvm_put_vcpu_events()
*must* be after write_list_to_kvmstate().

>      kvm_arm_sync_mpstate_to_kvm(cpu);
>  
>      return ret;
> @@ -462,11 +462,6 @@ int kvm_arch_get_registers(CPUState *cs)
>      }
>      vfp_set_fpscr(env, fpscr);
>  
> -    ret = kvm_get_vcpu_events(cpu);
> -    if (ret) {
> -        return ret;
> -    }
> -
>      if (!write_kvmstate_to_list(cpu)) {
>          return EINVAL;
>      }
> @@ -475,6 +470,11 @@ int kvm_arch_get_registers(CPUState *cs)
>       */
>      write_list_to_cpustate(cpu);
>  
> +    ret = kvm_get_vcpu_events(cpu);
> +    if (ret) {
> +        return ret;
> +    }
> +

Why are we moving kvm_get_vcpu_events()?

>      kvm_arm_sync_mpstate_to_qemu(cpu);
>  
>      return 0;
> diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
> index 6344113..d06fd32 100644
> --- a/target/arm/kvm64.c
> +++ b/target/arm/kvm64.c
> @@ -1043,17 +1043,17 @@ int kvm_arch_put_registers(CPUState *cs, int level)
>          return ret;
>      }
>  
> -    ret = kvm_put_vcpu_events(cpu);
> -    if (ret) {
> -        return ret;
> -    }
> -
>      write_cpustate_to_list(cpu, true);
>  
>      if (!write_list_to_kvmstate(cpu, level)) {
>          return -EINVAL;
>      }
>  
> +    ret = kvm_put_vcpu_events(cpu);
> +    if (ret) {
> +        return ret;
> +    }
> +
>      kvm_arm_sync_mpstate_to_kvm(cpu);
>  
>      return ret;
> @@ -1251,11 +1251,6 @@ int kvm_arch_get_registers(CPUState *cs)
>      }
>      vfp_set_fpcr(env, fpr);
>  
> -    ret = kvm_get_vcpu_events(cpu);
> -    if (ret) {
> -        return ret;
> -    }
> -
>      if (!write_kvmstate_to_list(cpu)) {
>          return -EINVAL;
>      }
> @@ -1264,6 +1259,11 @@ int kvm_arch_get_registers(CPUState *cs)
>       */
>      write_list_to_cpustate(cpu);
>  
> +    ret = kvm_get_vcpu_events(cpu);
> +    if (ret) {
> +        return ret;
> +    }
> +
>      kvm_arm_sync_mpstate_to_qemu(cpu);
>  
>      /* TODO: other registers */
> -- 
> 2.7.4
> 
> 

Same comments for kvm64.c as for kvm32.c

Thanks,
drew

_______________________________________________
kvmarm mailing list
kvmarm@lists.cs.columbia.edu
https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
