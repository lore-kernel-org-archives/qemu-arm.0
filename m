Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BD6ECD98CE
	for <qemu-arm@archiver.kernel.org>; Tue, 16 Jun 2026 05:26:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wZMJK-0006o0-11; Tue, 16 Jun 2026 01:26:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1wZMJJ-0006nY-GN
 for qemu-arm@nongnu.org; Tue, 16 Jun 2026 01:26:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1wZMJH-0002Jm-Tp
 for qemu-arm@nongnu.org; Tue, 16 Jun 2026 01:26:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1781587562;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iHMVucFQttqFOWfz8CZsdgvnHedB4IsaIsUZp6Fr5Bs=;
 b=ZB+pR57RdsTBvzJVyLkboDIgEJJ5gqr4WvwLw2PDbgmgkF4QMEulheCiBLgb/I7uyTR6Xo
 EBAL8pv80c/pyU7Yehi/7fhS7Xr83RZFkHGp5mGZLA5qA9GeRdB95K8gqbVVCR6Inbzy4z
 f/lK1hnQ2kgvFJfB7n/qZhtBKzhPFAM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-347-GA1F_REqNzWJ37BtdLtvWQ-1; Tue, 16 Jun 2026 01:26:01 -0400
X-MC-Unique: GA1F_REqNzWJ37BtdLtvWQ-1
X-Mimecast-MFC-AGG-ID: GA1F_REqNzWJ37BtdLtvWQ_1781587560
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-490c4f61a34so27981955e9.2
 for <qemu-arm@nongnu.org>; Mon, 15 Jun 2026 22:26:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781587560; x=1782192360;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iHMVucFQttqFOWfz8CZsdgvnHedB4IsaIsUZp6Fr5Bs=;
 b=igXGXQBm6XFEldgb/UwLptnYVCXnXuXe8ITSvvhTKcW5Lh2uqybwsJJqJkTeJoRySp
 HinzurO1DzA5ZMv0M9T8Cs2Q4ZRLBlLp49hdxPsJzlOfkFNSadIsUjHygZjj5LdkREfV
 7M4Qve23AcohDC3MB0sk5GosCrYKa8ItcQDUx+RutHI+RT7E7HwPJG7rqIfBKEymp94j
 8VdM7oUiIjZlp/NLmrFZkyt6bizXODKz1RP4j6a4PSZmjtMSeHBUOpPvB9sF3EpT5wPA
 AhBvRgFCsKxHk7Kea5YnKJoBtfb10Sk7nMdZ5OYcUwNLk520+S+JnXUh05+Mj5U9hFPu
 ALMw==
X-Forwarded-Encrypted: i=1;
 AFNElJ/9u8KQqpTaGhG65zESAb7csdjaews2KP2jww12GzLF/TmkQlNjurweR45OpLAacLZATLT9ldEBLA==@nongnu.org
X-Gm-Message-State: AOJu0Yzl/mF7hmePy9pfCz5gSCa1I3tHTHpRtTpZo5HO1Lerl4/7lP2S
 nxc5RN+3vwcI16suyvl6kM1hUrAU0h+NkM9vci5NiwOUIR5FMxSbW9Y1HIFWdoUDi2KxQkY0hVD
 rj8hVoK8pr8W9vawHXeDb2eoQiuJ4WUhJzkyB3w66s5O/ApRrsUSIqA==
X-Gm-Gg: Acq92OEsKQsqD0WQdMRBbQtxOwhpDRGhReZE2nZEUfdN5qMBstrIpzZw06ekymPCrKs
 YTQmT22Z+XrRE2S41KhwUdB0RnvG4wSDZ6xkvDmjhFiI9nREvUIbIK/z/qNRzFkVdhH8VHuSNXt
 j05dHJ68tpF/OtNoLWdbQkbjowdupXJnSXftV0oJkQFhcXOFki6Jbh4HUFZayAJvCellAWrGKf7
 GcXaIzyJ59TZtgL32rVTZsyMd8F08cK2QR+pP4hzKqgsk1UPQdtdpM+wmdllTs/lh8NyZqoSDVa
 xKMwjRRSyKj3mXRykd0ebBzwxuvx2EZJy5Fg842raGi3L7SuUyLxsm6xBYZpvooO2mp7vzTUlgo
 B35ez8l8+W2BTPPEyro+LTnZtPXoS1/2XkD7qM8Ok4Go=
X-Received: by 2002:a05:600c:354f:b0:490:d354:d151 with SMTP id
 5b1f17b1804b1-490ec4fe7aamr232642545e9.18.1781587560174; 
 Mon, 15 Jun 2026 22:26:00 -0700 (PDT)
X-Received: by 2002:a05:600c:354f:b0:490:d354:d151 with SMTP id
 5b1f17b1804b1-490ec4fe7aamr232641975e9.18.1781587559601; 
 Mon, 15 Jun 2026 22:25:59 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-85-71.inter.net.il. [80.230.85.71])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4922fa47ce3sm53945275e9.6.2026.06.15.22.25.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jun 2026 22:25:59 -0700 (PDT)
Date: Tue, 16 Jun 2026 01:25:55 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, peterx@redhat.com, alex@shazbot.org,
 berrange@redhat.com, philmd@oss.qualcomm.com, philmd@mailo.com,
 david@kernel.org, clg@redhat.com, pbonzini@redhat.com,
 phrdina@redhat.com, jugraham@redhat.com,
 liugang24219@sangfor.com.cn, dinghui@sangfor.com.cn, shan.gavin@gmail.com
Subject: Re: [PATCH v2 1/2] system/memory: Use qemu_ram_{copy, move}() in ram
 device region accessors
Message-ID: <20260616011744-mutt-send-email-mst@kernel.org>
References: <CAFEAcA9CT6E8dhEV7Ek6ruT_o2dKUf==2V+U-1WFDOLtYbgeeQ@mail.gmail.com>
 <20260615105556-mutt-send-email-mst@kernel.org>
 <CAFEAcA9Gi43qNZoZcGtq8ioffGwOc_XuhoFAjGx7-bt4U8qfxw@mail.gmail.com>
 <e399ceb9-bc4a-4ba6-8efd-ed2742d0853b@redhat.com>
 <20260615154054-mutt-send-email-mst@kernel.org>
 <22d55870-b521-4002-add7-791bce8ea96a@redhat.com>
 <20260615224658-mutt-send-email-mst@kernel.org>
 <0038f601-7647-4547-a67a-c6a17fae26ca@linaro.org>
 <20260616005429-mutt-send-email-mst@kernel.org>
 <081a9e18-6504-4a13-a3c6-47e94be63f7c@redhat.com>
MIME-Version: 1.0
In-Reply-To: <081a9e18-6504-4a13-a3c6-47e94be63f7c@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: cF3D7IizkV-fdyZopDl9R-vbGkYbIarn_7sDfTJCNd8_1781587560
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Tue, Jun 16, 2026 at 03:07:27PM +1000, Gavin Shan wrote:
> On 6/16/26 2:59 PM, Michael S. Tsirkin wrote:
> > On Mon, Jun 15, 2026 at 09:48:00PM -0700, Richard Henderson wrote:
> > > On 6/15/26 21:23, Michael S. Tsirkin wrote:
> > > > B. Also on x86, I do not see why we should not use memcpy for large
> > > > accesses if we can. Better perf.
> > > 
> > > We have an example where memcpy writes to the same location 3 times.
> > > This is not appropriate for any host.
> > > 
> > > 
> > > r~
> > 
> > Ah, checked libc and sure enough, it does it. E.g. it uses 2 overlapping SSE
> > stores to do a 17 byte write. Not sure how we get 3 but whatevs.
> > 
> > 
> > But just to clarify, I am talking about DMA accesses, that are not
> > initiated by the VCPU.  I am not so sure we care about multiple stores
> > in this instance? Do we? We do care about speed, for sure.
> > 
> 
> In current implementation, qemu_ram_copy/move are differentiated on x86
> and other architectures. Do we need to unify the implementations (qemu_ram_copy/move)
> on all architectures to avoid using memcpy() and memmove()?

I am not sure for anything outside 1,2,4,8 bytes the issues are not
theoretical.

I'd be care

> Maybe it's time for me to post (v3) for a new round of discussions.
> 
> Thanks,
> Gavin

maybe start a toppost with the list of issues and solutions first of
all.

Let's add more to the list:


10. on x86 memcpy will sometimes do multiple overlapping stores when
size is not a power of 2. for example, a 15 byte write is done with
2 8-byte stores. This is theoretically an issue
if guest does something super clever with ordering,
but does not seem to be in practice.

10. on non-x86 memcpy will do multiple overlapping stores even
for single byte writes. E.g. it does it to avoid extra branches.
This is causing issues in practice.


-- 
MST


