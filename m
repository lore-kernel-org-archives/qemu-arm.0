Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1432344lfm;
        Thu, 18 Jun 2020 01:57:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJybWSYic03IrRZ5btJqwCB014z5poBO0Ul/W7eydfnhQHHksK7F0X1rycS3M08KLAZuDbnR
X-Received: by 2002:a25:76c8:: with SMTP id r191mr4653202ybc.519.1592470665518;
        Thu, 18 Jun 2020 01:57:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592470665; cv=none;
        d=google.com; s=arc-20160816;
        b=aSwKC+PCzog7L/AujZud+EJz8IPoq/LyQ2nxEZrnuuVI5LWLZ2O9UJrRwkmrSEnjVN
         ksa//tPdZvafICvM0rFBtdYgkA/9jegbN+IBgM+vDXG8khen5SiX2c9xEjDcr9UsnQB+
         GBY+us9ZAzNQdvSicvKf4RNk0ftu6Nk29N4D2gUjTArYC6WLtSFGQSKRSM5YoyYmfOwv
         copeT3TLwdOT4wjcJMmt2NnSzKbK7HdpaWM9DOawtl9GBNzIdylY6BqY5dO2dxrSCkvM
         p0attYOQR+dTb6U11WspqjapD0m764jOF1RajjiZJII6DEVuCqeWiRGI1uljClcBMv0v
         PtOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=wqDesyDEKvVE0arFjXLzrboQB8n4OlGRbAZdAmnqecc=;
        b=Q+hoCRanbVFxqHym97m16XiR2Q2pjT/RYI0VjlTKTcRaNCfyLMEql2WRNE/xWlZO6c
         6g18FUlCX1gJE/I2bAr+0zqCoMHADBDqnMxbPCxiMVNWo1M3B2PPqMNrh+ocnflN9u7L
         2ggaoT64YsgR7FKrjs/08Elt4UCtVJ/MqTnszpqUrzRH0jvw7AH0H85S9j9I0EoAnxh7
         2t6pOAZ1vXA5yYfdUPZmgh3TCUVqsxu7NujjHG68Ffdm9JboOc7ikpHGAhphP3YmNSOt
         gQaRBztiPiDxD6jY/Z8XNJjsWxMlJZJ1iK61OejgWbVxxNFnACBRnXw/cRcFb9eEaX6m
         OEUg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=U1vogZ1k;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a16si2182109ybj.203.2020.06.18.01.57.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 18 Jun 2020 01:57:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=U1vogZ1k;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jlqMi-0001CR-UI
	for alex.bennee@linaro.org; Thu, 18 Jun 2020 04:57:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1jlqMc-0001CF-80
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 04:57:38 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:27997
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1jlqMa-0005bh-M9
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 04:57:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592470655;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wqDesyDEKvVE0arFjXLzrboQB8n4OlGRbAZdAmnqecc=;
 b=U1vogZ1ka9Brq6Ea/NgSmgkpfroSeapkxhj1i+RBe7BL4I+lcRMW5umN5nbLcEeTxlCQGD
 yCvJVRGkGT3KF7FVJDY2yx3n5P4P3L3/ws/vwvmDN7I00f3BQk6Df2O29TdxvkmXoEzBrQ
 A9iY6WgMQtRpSQJvNVpX8SMIz5Tx4us=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-471-nDrm9QDzPK-zvyR-WUdb0Q-1; Thu, 18 Jun 2020 04:57:31 -0400
X-MC-Unique: nDrm9QDzPK-zvyR-WUdb0Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 83ECE107ACCA;
 Thu, 18 Jun 2020 08:57:30 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.195.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E31285D9D3;
 Thu, 18 Jun 2020 08:57:28 +0000 (UTC)
Date: Thu, 18 Jun 2020 10:57:26 +0200
From: Andrew Jones <drjones@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] target/arm/kvm: Check supported feature per accelerator
 (not per vCPU)
Message-ID: <20200618085726.ti2hny6554l4l5kt@kamzik.brq.redhat.com>
References: <20200617130800.26355-1-philmd@redhat.com>
 <20200617152319.l77b4kdzwcftx7by@kamzik.brq.redhat.com>
 <69f9adc8-28ec-d949-60aa-ba760ea210a9@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <69f9adc8-28ec-d949-60aa-ba760ea210a9@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Received-SPF: pass client-ip=207.211.31.120; envelope-from=drjones@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/18 01:47:12
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>, kvm@vger.kernel.org,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, Haibo Xu <haibo.xu@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XhKz/WT22jfS

On Wed, Jun 17, 2020 at 07:37:42PM +0200, Paolo Bonzini wrote:
> On 17/06/20 17:23, Andrew Jones wrote:
> >>
> >> Fix by kvm_arm_<FEATURE>_supported() functions take a AccelState
> >> argument (already realized/valid at this point) instead of a
> >> CPUState argument.
> > I'd rather not do that. IMO, a CPU feature test should operate on CPU,
> > not an "accelerator".
> 
> If it's a test that the feature is enabled (e.g. via -cpu) then I agree.  
> For something that ends up as a KVM_CHECK_EXTENSION or KVM_ENABLE_CAP on 
> the KVM fd, however, I think passing an AccelState is better.

I can live with that justification as long as we don't support
heterogeneous VCPU configurations. And, if that ever happens, then I
guess we'll be reworking a lot more than just the interface of these
cpu feature probes.

Thanks,
drew


> kvm_arm_pmu_supported case is clearly the latter, even the error message
> hints at that:
> 
> +        if (kvm_enabled() && !kvm_arm_pmu_supported(current_accel())) {
>              error_setg(errp, "'pmu' feature not supported by KVM on this host");
>              return;
>          }
> 
> but the same is true of kvm_arm_aarch32_supported and kvm_arm_sve_supported.
> 
> Applying the change to kvm_arm_pmu_supported as you suggest below would be
> a bit of a bandaid because it would not have consistent prototypes.  Sp
> for Philippe's patch
> 
> Acked-by: Paolo Bonzini <pbonzini@redhat.com>
> 
> Thanks,
> 
> Paolo
> 
> > How that test is implemented is another story.
> > If the CPUState isn't interesting, but it points to something that is,
> > or there's another function that uses globals to get the job done, then
> > fine, but the callers of a CPU feature test shouldn't need to know that.
> > 
> > I think we should just revert d70c996df23f and then apply the same
> > change to kvm_arm_pmu_supported() that other similar functions got
> > with 4f7f589381d5.
> 
> 

