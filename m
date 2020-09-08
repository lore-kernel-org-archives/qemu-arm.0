Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp520171lfq;
        Tue, 8 Sep 2020 04:35:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzA3p6ndcyrnvaYIat2L96vCK2b+RPBCuq/JDGxqIxrWlCOULD2OMbVS/44fmrglaEqaO19
X-Received: by 2002:a25:ab91:: with SMTP id v17mr32909132ybi.76.1599564918529;
        Tue, 08 Sep 2020 04:35:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599564918; cv=none;
        d=google.com; s=arc-20160816;
        b=HbZtvZ5umbRGee4lZJn6Uy01pqjEbchBftFh5W5w8Gt4I8Y7WFy/uYoNubKegrxFWw
         W7gC7O8hfP82O8P+gVDYF+rerz8ofkCmugCUDHZNqTJF8IQneVWwBwNEXbHS9hxDtiFA
         9tjHKSfHS2XkmNibuEkIO3SOhrV0aQrAcPLXDwfzb35o8RNz2d4RL52LqNLVxZeAmWqQ
         n55JFSN/TdxlDGPwFelar6im5LqB5ipTysJ/4/ESVcpmHk6m2bcPaDYJLZ+LkzTvSOHQ
         iO+KExdkIY+ta52mH5JHEVq72CKKrR04ZMGB+soSPD5N5w/iuDOGQhkqvplM3/KzVxtJ
         rPrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=CH7yjQyNRgW+ZBkO+ZLU5ukDSXEg0SqcvPWAV6CIDN0=;
        b=sVPNbW000SXAytErNk736wqfAQD665xWkXWAVane8gvQ4dx3VkaofF0uP01BfYlYvw
         uHMnBBYKjSw+ZIeWRwYDp1edWtUlZxU/wqYD+7CCPmKbq91UDpsuOUBzUHCZ3c6ySvvX
         9iMxSdWtYMNb5n50cto2DRhSXkq5Dd+qzjxAy9CVUdlVn99SOLcKedKMsTFLBLsMe9hv
         2C6LLqcsBQhpOv/ZA99XF6iDW/F3wt0w2hwJE3wdyGIDk1IwLg5dmOBsQsr0mdZGdvBu
         OFqKts+U/01SxBiq0BBJC/QzcIUBfy9zv2I0onRIsACE6oUiQaUoKl8w4uuW/5ndy4jc
         iAfA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Lb1eEdxN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n84si5956219yba.7.2020.09.08.04.35.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Sep 2020 04:35:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Lb1eEdxN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kFbu9-0005TK-Jn
	for alex.bennee@linaro.org; Tue, 08 Sep 2020 07:35:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1kFbu1-0005R0-CF
 for qemu-arm@nongnu.org; Tue, 08 Sep 2020 07:35:09 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:35504
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1kFbtz-0000lw-Sm
 for qemu-arm@nongnu.org; Tue, 08 Sep 2020 07:35:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599564907;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CH7yjQyNRgW+ZBkO+ZLU5ukDSXEg0SqcvPWAV6CIDN0=;
 b=Lb1eEdxNvTEtZRrSIZdjIKGV8ega/E6d5HSIkxAHlM9CWZ6hy3dAb5Qb+NhgpiKgj+VnQk
 YhDcCoj0Xv9Tss70y+EJTrJy/4lym00baUmzrKhNc1kgpyI5MUYOmcA9bDzPp4CkUuZd5G
 8EqxWtWYNICIbbnW/RMjlgxeuYvAcb4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-287-kRBSe7UCNUmNDeZ1R21qmg-1; Tue, 08 Sep 2020 07:35:03 -0400
X-MC-Unique: kRBSe7UCNUmNDeZ1R21qmg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5F1AC18BA280;
 Tue,  8 Sep 2020 11:35:02 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.192.171])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EC67D60DA0;
 Tue,  8 Sep 2020 11:35:00 +0000 (UTC)
Date: Tue, 8 Sep 2020 13:34:58 +0200
From: Andrew Jones <drjones@redhat.com>
To: Haibo Xu <haibo.xu@linaro.org>
Subject: Re: [PATCH v2 11/12] target/arm/kvm: spe: Enable userspace irqchip
 support.
Message-ID: <20200908113458.2fdhbs7lpw63fvnv@kamzik.brq.redhat.com>
References: <cover.1599549462.git.haibo.xu@linaro.org>
 <6aaa406b824d0c427acbc3f3abfbbe841f3bb93c.1599549462.git.haibo.xu@linaro.org>
MIME-Version: 1.0
In-Reply-To: <6aaa406b824d0c427acbc3f3abfbbe841f3bb93c.1599549462.git.haibo.xu@linaro.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.120; envelope-from=drjones@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/08 00:33:58
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Cc: philmd@redhat.com, qemu-arm@nongnu.org, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, peter.maydell@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5wIpqsTHjjux

On Tue, Sep 08, 2020 at 08:13:29AM +0000, Haibo Xu wrote:
> Since the current kernel patches haven't enabled the
> userspace irqchip support, this patch is not verified yet!
> 
> Signed-off-by: Haibo Xu <haibo.xu@linaro.org>
> ---
>  linux-headers/linux/kvm.h | 1 +
>  target/arm/kvm.c          | 5 +++++
>  2 files changed, 6 insertions(+)
> 
> diff --git a/linux-headers/linux/kvm.h b/linux-headers/linux/kvm.h
> index 8840cbb01c..35ef0ae842 100644
> --- a/linux-headers/linux/kvm.h
> +++ b/linux-headers/linux/kvm.h
> @@ -1672,6 +1672,7 @@ struct kvm_assigned_msix_entry {
>  #define KVM_ARM_DEV_EL1_VTIMER		(1 << 0)
>  #define KVM_ARM_DEV_EL1_PTIMER		(1 << 1)
>  #define KVM_ARM_DEV_PMU			(1 << 2)
> +#define KVM_ARM_DEV_SPE			(1 << 3)

kernel header changes should be separate patches

>  
>  struct kvm_hyperv_eventfd {
>  	__u32 conn_id;
> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> index 58f991e890..7950ff1d83 100644
> --- a/target/arm/kvm.c
> +++ b/target/arm/kvm.c
> @@ -820,6 +820,11 @@ MemTxAttrs kvm_arch_post_run(CPUState *cs, struct kvm_run *run)
>              switched_level &= ~KVM_ARM_DEV_PMU;
>          }
>  
> +        if (switched_level & KVM_ARM_DEV_SPE) {
> +            qemu_set_irq(cpu->spe_interrupt,
> +                         !!(run->s.regs.device_irq_level & KVM_ARM_DEV_SPE));
> +            switched_level &= ~KVM_ARM_DEV_SPE;
> +        }
>          if (switched_level) {
>              qemu_log_mask(LOG_UNIMP, "%s: unhandled in-kernel device IRQ %x\n",
>                            __func__, switched_level);
> -- 
> 2.17.1
> 

Otherwise 

Reviewed-by: Andrew Jones <drjones@redhat.com>

