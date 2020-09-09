Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp264814lfq;
        Wed, 9 Sep 2020 02:34:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy67XB7mWd5jQyqBJcR2vAPcUgsfNNlOp3Fgv+F4B2auErXuwIKFEZjFjwc+zBMth/FRNrv
X-Received: by 2002:a25:1c4:: with SMTP id 187mr3959107ybb.481.1599644095497;
        Wed, 09 Sep 2020 02:34:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599644095; cv=none;
        d=google.com; s=arc-20160816;
        b=WSHxxJB6bQGz4hJ1IgqS/unxS7KPPKX7IKr4m1MakGX5uaUvy2YhLzgAsKfj9QhKtr
         8RyNKRy02aA4WvCokDhe5uFq3rQ0r3NnGQL0rmOJdCLazJ1KNXoth9ydjwwFCvrno8sR
         rgi87B+EvZkHFgujx8IwuDJlyXaiQCJwwJNBGEIh3wIOMe5XPXhyL22K8z8TLPsoOiQE
         CAA9z4kFDqMbOE1/+Es9BhfdqFUj9viiHJ9P1UR+d+Gu89kUWIClysCDq3UM4doLBjoe
         A5Qk0H4x9t0bDy5wraVf/zEASximh1tQ/nd91gNiU+bo7aZH0Bm0OqvpxU3tt1L/d2QO
         djOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=uy7ouSRZrCqIK2d64Twf7tkOpwiPj82LipvPt9O1uDA=;
        b=qxVMf/qpYlCdhlGZVPKbUWfHq5Lez3+JB5lu/pPEHms6/lcIM57faRBGvawI5zYdL4
         m5ks9ga8CV19RNP8qnzhQ1OMhmtWu2hAJLSea4FGPU+HLqbaQYfnwN85TEjGwdrmWj2I
         k49PxjsTLd91DsDRM3LqUXYe9HeMgZuF0Vaj+j6cjLOa1/oMbcnENhhcs9EmE9DT1sza
         aA37H2VA7w35FzQCHwXwbBCGGVSOqUY0pLEV15TX6/hGRXh9sAfms5rIXo4IA9ARQ9N7
         XJHoz45/VBdlaRhgamZ38aj0ul0z9ry+TCJAGZAPma1kbfCGJw7TJMD+nboOoI1SPNYd
         eBpg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=FWnUkUMP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e76si2316180ybb.54.2020.09.09.02.34.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Sep 2020 02:34:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=FWnUkUMP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kFwVC-00068b-TG
	for alex.bennee@linaro.org; Wed, 09 Sep 2020 05:34:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1kFwV5-00068M-HI
 for qemu-arm@nongnu.org; Wed, 09 Sep 2020 05:34:47 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:44860
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1kFwV3-0005yx-MG
 for qemu-arm@nongnu.org; Wed, 09 Sep 2020 05:34:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599644084;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uy7ouSRZrCqIK2d64Twf7tkOpwiPj82LipvPt9O1uDA=;
 b=FWnUkUMPTJEtOSTvvpKFUwq08oOgIM7etgCKQoT4Y/8iS/mJvyE8nvCCjesvi9o51oGcBz
 ehzqkM+DzyZROoxFXeHaz5rPa8z+QV1t7zYd/l3FZ9hjXU8yYrmHVNbkh2O2/CxHw4ivBz
 0X0SzpecDSNz61NJEbkAQmPnWDLHTLg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-300-wiTG1aiVMMqwcGvJqqEBYg-1; Wed, 09 Sep 2020 05:34:41 -0400
X-MC-Unique: wiTG1aiVMMqwcGvJqqEBYg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1417B80EF8A;
 Wed,  9 Sep 2020 09:34:40 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.192.171])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 89B6E3A40;
 Wed,  9 Sep 2020 09:34:38 +0000 (UTC)
Date: Wed, 9 Sep 2020 11:34:35 +0200
From: Andrew Jones <drjones@redhat.com>
To: Haibo Xu <haibo.xu@linaro.org>
Subject: Re: [PATCH v2 09/12] hw/arm/virt: spe: Add SPE fdt binding for virt
 machine
Message-ID: <20200909093435.txd7bkt6n3z7tm4u@kamzik.brq.redhat.com>
References: <cover.1599549462.git.haibo.xu@linaro.org>
 <c6ac607d2cd253de6a990538edfde7f86066f04f.1599549462.git.haibo.xu@linaro.org>
 <20200908111625.2wzzn7jh5wt4nnmu@kamzik.brq.redhat.com>
 <CAJc+Z1GCmf5fEjifa84O6jmfd6WCih1jT07AXb7vWFC7=sXfrA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJc+Z1GCmf5fEjifa84O6jmfd6WCih1jT07AXb7vWFC7=sXfrA@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.120; envelope-from=drjones@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/09 03:13:17
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3JCrH/x1FQj6

On Wed, Sep 09, 2020 at 03:51:14PM +0800, Haibo Xu wrote:
> > > +
> > > +            if (spe) {
> > > +                assert(ARM_CPU(cpu)->has_spe == ON_OFF_AUTO_ON);
> > > +                if (kvm_irqchip_in_kernel()) {
> > > +                    kvm_arm_spe_set_irq(cpu, PPI(VIRTUAL_SPE_IRQ));
> > > +                }
> > > +                kvm_arm_spe_init(cpu);
> >
> > A later patch introduces userspace irqchip support. Should we avoid
> > allowing it until then to avoid breaking bisection?
> >
> 
> Yes, it's possible to break the bisection. To avoid it I think we can
> move the above codes
> block to a separate patch after adding the userspace irqchip support,
> Or, just put the userspace
> irqchip support patch before this patch. What's your opinion?
>

This patch ca forbid SPE without kernel irqchip. Then the patch that adds
userspace irqchip support would also remove the restriction.

Thanks,
drew 

