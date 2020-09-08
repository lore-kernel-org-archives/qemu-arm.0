Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp493415lfq;
        Tue, 8 Sep 2020 03:56:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwy7WNya8a3mjejFDat2Fuc2uAmQYaXT/k0qP4tpwesgMOt04ycJtHt7uaY5q+kIpcWPcGZ
X-Received: by 2002:a25:d304:: with SMTP id e4mr33261269ybf.226.1599562608737;
        Tue, 08 Sep 2020 03:56:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599562608; cv=none;
        d=google.com; s=arc-20160816;
        b=adw2uMzLIRZzQoFCwkbaB8HXnX7sM9KjdaJx/SpeFUwZIdv4wi8MPfD6s53+dAnXcJ
         ZP5Ov4FO0o+2/0+/Of8maF+xmK3eSdo4joki44Hl+V5KBjMEFJH5pkc7o1emtXTWSLYD
         6vcW3NNoWOjPjS7o29OBgNFebi3ZQf0C2GbC+HkDvmzzub5xMbSxSXcZigy/Urpvudg6
         GkSplPXcymSiS+C3FXboTbkIBCFoC4zFaiBeILWtfduGeCIraSGdxqBSNmKtGoXnIvRE
         7YePyFn9McGye8ooZP61lVioWSeZo1pMSIezjFWzaSkPAI0XmAFiteDMcEFFKdxT+PNQ
         BvHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=GIbNL/nVH5BNe+CWhBWkidXimhE+y5MW5kJvjNQ4FpI=;
        b=DqYdbVI8P2hN5O/u1WXhvub21JdwWZA6WwNKsjV6Irc6NMmieEz0zN0FNw+5cXUfMC
         tm7COz7dFVsbthiGJMoIT+4q/N8bMF5UWgotn8eJp3jcrWdSCoEk8iP9hp+IB1lZO+vf
         6LYwYwoZ/jZQe1TwsfRXFYAd+IJEREZ5ycRg9V1E8OsEh6NNgtHrHY64sE9EjdpRXBTN
         MGUCb0KA44RAUh2Yaf1sfrL1LBNyXP66B4joTwbU2MVYpCiyGHcw0hia5J/psK7kfMM2
         Jiv/muDClQ9X2/5et6eoN54HyRHh0/Yf0kR/XKeYP6CSbLX1gMP7S3kJGIAycGVUdY3o
         QUFA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=CyVQorHr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s3si6335388ybq.178.2020.09.08.03.56.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Sep 2020 03:56:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=CyVQorHr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kFbIu-0006ad-5g
	for alex.bennee@linaro.org; Tue, 08 Sep 2020 06:56:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1kFbIm-0006ZI-Oe
 for qemu-arm@nongnu.org; Tue, 08 Sep 2020 06:56:40 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:35343
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1kFbIl-0004St-5e
 for qemu-arm@nongnu.org; Tue, 08 Sep 2020 06:56:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599562598;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GIbNL/nVH5BNe+CWhBWkidXimhE+y5MW5kJvjNQ4FpI=;
 b=CyVQorHrUBajeHaqzLqRBcNt0pA/e7hlRmf4PFfLkK1GcM4n/1Wh1icZ8udu8yLPQBJPZQ
 XGaDkDea6BpJbI4PmJPkh94W2Ss9FpfkMMFPpJmFrbVsnVaXiRZVLY+0xLN1e8AUMu3riZ
 hyWv53hWjrnMivgYifCk+WAmRjwz2k8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-293-Uoa5l87BOjOghEpUzOdnbA-1; Tue, 08 Sep 2020 06:56:37 -0400
X-MC-Unique: Uoa5l87BOjOghEpUzOdnbA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AA977AF200;
 Tue,  8 Sep 2020 10:56:35 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.192.171])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0A52C82461;
 Tue,  8 Sep 2020 10:56:33 +0000 (UTC)
Date: Tue, 8 Sep 2020 12:56:31 +0200
From: Andrew Jones <drjones@redhat.com>
To: Haibo Xu <haibo.xu@linaro.org>
Subject: Re: [PATCH v2 05/12] target/arm/kvm: spe: Unify device attr
 operation helper
Message-ID: <20200908105631.etggiu56l65ohlyq@kamzik.brq.redhat.com>
References: <cover.1599549462.git.haibo.xu@linaro.org>
 <45eecae26272efc7a09837573cd5278296b58dc5.1599549462.git.haibo.xu@linaro.org>
MIME-Version: 1.0
In-Reply-To: <45eecae26272efc7a09837573cd5278296b58dc5.1599549462.git.haibo.xu@linaro.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: snkxeVl5NTW3

On Tue, Sep 08, 2020 at 08:13:23AM +0000, Haibo Xu wrote:
> From: Andrew Jones <drjones@redhat.com>
> 
> Rename kvm_arm_pmu_set_attr() to kvm_arm_set_device_attr(),
> So both the vPMU and vSPE device can share the same API.
> 
> Signed-off-by: Andrew Jones <drjones@redhat.com>

Looks like a faithful port of what I posted as a hunk of another patch, so
I'll accept the authorship. Please also add you s-b though.

Thanks,
drew

> ---
>  target/arm/kvm64.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
> index ef1e960285..8ffd31ffdf 100644
> --- a/target/arm/kvm64.c
> +++ b/target/arm/kvm64.c
> @@ -397,19 +397,20 @@ static CPUWatchpoint *find_hw_watchpoint(CPUState *cpu, target_ulong addr)
>      return NULL;
>  }
>  
> -static bool kvm_arm_pmu_set_attr(CPUState *cs, struct kvm_device_attr *attr)
> +static bool kvm_arm_set_device_attr(CPUState *cs, struct kvm_device_attr *attr,
> +                                    const char *name)
>  {
>      int err;
>  
>      err = kvm_vcpu_ioctl(cs, KVM_HAS_DEVICE_ATTR, attr);
>      if (err != 0) {
> -        error_report("PMU: KVM_HAS_DEVICE_ATTR: %s", strerror(-err));
> +        error_report("%s: KVM_HAS_DEVICE_ATTR: %s", name, strerror(-err));
>          return false;
>      }
>  
>      err = kvm_vcpu_ioctl(cs, KVM_SET_DEVICE_ATTR, attr);
>      if (err != 0) {
> -        error_report("PMU: KVM_SET_DEVICE_ATTR: %s", strerror(-err));
> +        error_report("%s: KVM_SET_DEVICE_ATTR: %s", name, strerror(-err));
>          return false;
>      }
>  
> @@ -426,7 +427,7 @@ void kvm_arm_pmu_init(CPUState *cs)
>      if (!ARM_CPU(cs)->has_pmu) {
>          return;
>      }
> -    if (!kvm_arm_pmu_set_attr(cs, &attr)) {
> +    if (!kvm_arm_set_device_attr(cs, &attr, "PMU")) {
>          error_report("failed to init PMU");
>          abort();
>      }
> @@ -443,7 +444,7 @@ void kvm_arm_pmu_set_irq(CPUState *cs, int irq)
>      if (!ARM_CPU(cs)->has_pmu) {
>          return;
>      }
> -    if (!kvm_arm_pmu_set_attr(cs, &attr)) {
> +    if (!kvm_arm_set_device_attr(cs, &attr, "PMU")) {
>          error_report("failed to set irq for PMU");
>          abort();
>      }
> -- 
> 2.17.1
> 
> 

