Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp1255069ejb;
        Thu, 30 Mar 2023 06:45:30 -0700 (PDT)
X-Google-Smtp-Source: AKy350aywbMj60IeM4wtucozOVYfNWLKECifALSy1aBK5InUE4mp6AhFEs91j33SfrLe3TetWdYn
X-Received: by 2002:a05:622a:106:b0:3e4:eebc:72ee with SMTP id u6-20020a05622a010600b003e4eebc72eemr19238284qtw.17.1680183929851;
        Thu, 30 Mar 2023 06:45:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680183929; cv=none;
        d=google.com; s=arc-20160816;
        b=fovfLu3nZEf76RziCHboRzDWGMwW/0eD5HM0FJib5crfi7B4SIRg1y8QNqCx8ozoI2
         5noRzcqNrRZcVsZOHpEMOy3PwxyEhL8zObYXpf9nHOk9QFQKMHhaCO6Orh6G60zpd3xk
         h01dCSlU9WCHU7cGpkjGb0mFtl4bmdGzl8TSdNowGKX+XLB0tDSXfg2OmVAqE7hrClMr
         Af6SSI27VXHlHgcc2CumiQLslTtIio/fhog6VXljNURn7P37691MilDUNnSu7CAR4Uy3
         p9miwK4dW/ymyIVEk6X47WqDyob1CEwj0GX1E235ZIbXDxlIBlw2DE/Obsbmx8hvgwTK
         +TFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=qnYKBQsAzFXmb51+LCyvwkhoPCyx+kIjOqsPwazgt7s=;
        b=q6fJbArU4z8HKQmAIycpoGb1zm7rFBqbiDp4hLAWi/YvXdsnpw6WrtXXkZUb6LTcnw
         BrfJ8bUaX5GTI9q5wqyE7AwLPBLeWqy65b99FXw+opsLfp4MmD998590I2jCbvmIw2In
         yBP6v+84qaM36SWJZ8enuL4Baj+89tl2IvxrPV4RnD+B+SX/+JiCx0aCs2Y5PleZf6SR
         dCIBKRsoED5RYYHch5NDHJwlQWy72bbrxpz4EfQbpq8iP5rlD/w8LxI0LQnX/kZpcv9V
         ie8QhHkZvAuEZTr1OTnpiju8/KH5/HtqwaukaZcZcZ1BoRJ/bka3K6JVhB+PhGQDudne
         NNEA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="B/oH92wz";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w20-20020ac87e94000000b003e2f9daf7f3si18432551qtj.339.2023.03.30.06.45.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Mar 2023 06:45:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="B/oH92wz";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1phsaO-00019g-6o; Thu, 30 Mar 2023 09:45:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1phsaM-00019A-M3
 for qemu-arm@nongnu.org; Thu, 30 Mar 2023 09:45:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1phsaL-0005dL-3J
 for qemu-arm@nongnu.org; Thu, 30 Mar 2023 09:45:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680183898;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qnYKBQsAzFXmb51+LCyvwkhoPCyx+kIjOqsPwazgt7s=;
 b=B/oH92wzKx1hUUL2yjsYLxcaFc3LOw5hvt38UPfTBjgFTH7h7lFF447UZ+6QIHDQpnHNJI
 nHcdoWBgPNivvLKRWSFL87Qo2HWQCsKWbNPOorYck+9Mm14eommMbSFNUlGEh+7Qwo3w+d
 rtNWWtNwxazfWyndODyWZk0h7Mva6gk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-75-smR8bjZxPNucA72zNt1wTw-1; Thu, 30 Mar 2023 09:44:56 -0400
X-MC-Unique: smR8bjZxPNucA72zNt1wTw-1
Received: by mail-wm1-f70.google.com with SMTP id
 bg33-20020a05600c3ca100b003ef6d684105so6135229wmb.1
 for <qemu-arm@nongnu.org>; Thu, 30 Mar 2023 06:44:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680183896;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qnYKBQsAzFXmb51+LCyvwkhoPCyx+kIjOqsPwazgt7s=;
 b=C3K8zp2Ym1C4ikldtzwtJEY+TwdzcZ1Sv1/amXSuhTuRjiIhDpzP8DlNc+HkV2AfYp
 7HdF2jqS+zdX5juihxbN3eZM6w16y/Fop7l4Sb+JggD3ILbx61B1ql+dw10ajmvCLd37
 Zk4qPi2c4Zj6v1BPTI5m5lzPzN3M4NonSzNUWap+18lqGTCJLo9gpJerDxKp1/SAf86k
 +9GASHgUi06HavN9OcxIBaSdozOWLRK/CttiLrOaeEN/ZIHkxWeqlUTcqqlw35XJH5a0
 Ps4lWe03yKJht6BHFlwUW41mlSVd6m1ewB0CzhUtwwaszAIC79wvdPAK/vrd36dNBkzd
 h97Q==
X-Gm-Message-State: AAQBX9dsOHgW/ebzk9eWLdLl0T1oo/Zty5KHyc0RMwPHKgwo0SjbyxSR
 0wQhR0cXqzqaaRe0DphPaxuyIH44rSMxZfSJtfG2oB2m16apkkUvm0bUmnQKWBFy/J1kXbKwzKJ
 8IeYOrWxF0n88
X-Received: by 2002:adf:df88:0:b0:2c7:604:52a1 with SMTP id
 z8-20020adfdf88000000b002c7060452a1mr16653563wrl.29.1680183895896; 
 Thu, 30 Mar 2023 06:44:55 -0700 (PDT)
X-Received: by 2002:adf:df88:0:b0:2c7:604:52a1 with SMTP id
 z8-20020adfdf88000000b002c7060452a1mr16653545wrl.29.1680183895523; 
 Thu, 30 Mar 2023 06:44:55 -0700 (PDT)
Received: from redhat.com ([2.52.159.107]) by smtp.gmail.com with ESMTPSA id
 s17-20020a5d4251000000b002d1801018e2sm32956870wrr.63.2023.03.30.06.44.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Mar 2023 06:44:55 -0700 (PDT)
Date: Thu, 30 Mar 2023 09:44:51 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Ani Sinha <ani@anisinha.ca>
Cc: Eric DeVolder <eric.devolder@oracle.com>, shannon.zhaosl@gmail.com,
 imammedo@redhat.com, peter.maydell@linaro.org, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, marcel.apfelbaum@gmail.com,
 pbonzini@redhat.com, richard.henderson@linaro.org,
 eduardo@habkost.net, boris.ostrovsky@oracle.com
Subject: Re: [PATCH 0/2] hw/acpi: bump MADT to revision 5
Message-ID: <20230330094323-mutt-send-email-mst@kernel.org>
References: <20230328155926.2277-1-eric.devolder@oracle.com>
 <20230329010406-mutt-send-email-mst@kernel.org>
 <96144a1b-efa7-ecc2-3e35-56825fcf48c6@oracle.com>
 <20230329124442-mutt-send-email-mst@kernel.org>
 <68579d53-cbb5-154a-6c1e-e733f16540@anisinha.ca>
MIME-Version: 1.0
In-Reply-To: <68579d53-cbb5-154a-6c1e-e733f16540@anisinha.ca>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: OntCCtEfZR3e

On Thu, Mar 30, 2023 at 01:06:36PM +0530, Ani Sinha wrote:
> 
> 
> On Wed, 29 Mar 2023, Michael S. Tsirkin wrote:
> 
> > On Wed, Mar 29, 2023 at 08:14:37AM -0500, Eric DeVolder wrote:
> > >
> > >
> > > On 3/29/23 00:19, Michael S. Tsirkin wrote:
> > > > Hmm I don't think we can reasonably make such a change for 8.0.
> > > > Seems too risky.
> > > > Also, I feel we want to have an internal (with "x-" prefix") flag to
> > > > revert to old behaviour, in case of breakage on some guests.  and maybe
> > > > we want to keep old revision for old machine types.
> > > Ok, what option name, for keeping old behavior, would you like?
> >
> > Don't much care. x-madt-rev?
> >
> > > >
> > > >
> > > > On Tue, Mar 28, 2023 at 11:59:24AM -0400, Eric DeVolder wrote:
> > > > > The following Linux kernel change broke CPU hotplug for MADT revision
> > > > > less than 5.
> > > > >
> > > > >   commit e2869bd7af60 ("x86/acpi/boot: Do not register processors that cannot be onlined for x2APIC")
> > > >
> > > > Presumably it's being fixed? Link to discussion? Patch fixing that in
> > > > Linux?
> > >
> > > https://lore.kernel.org/linux-acpi/20230327191026.3454-1-eric.devolder@oracle.com/T/#t
> >
> > Great! Maybe stick a Link: tag in the commit log.
> 
> If the original bug is in the kernel and kernel upstream has accepted both
> your fix and Mario's patch on the acpi revision mess, I see no urgency to
> fix this in QEMU.
> 
> Maybe we can address this in the 8.1 development window.

Why "maybe"? Eric is working on a patch I don't see why we won't
address it.

-- 
MST

