Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9012DCA0EFA
	for <qemu-arm@archiver.kernel.org>; Tue, 26 Aug 2025 08:48:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uqpLZ-0001Jn-Vc; Tue, 26 Aug 2025 04:48:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1uqpLR-0001Dy-Rc
 for qemu-arm@nongnu.org; Tue, 26 Aug 2025 04:47:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1uqpLM-0001d1-U9
 for qemu-arm@nongnu.org; Tue, 26 Aug 2025 04:47:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1756198059;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EdNBK/G2CP/XYVHgsGugpIGSHBAagqVuwdkPmCuAfPQ=;
 b=IEBoZRCcTAIQwwd3ZFhhSOdHSDiBk+eZNrwLQX72KJ5kHiNho8RRy9OZtcrDK7/bMdO9Kg
 5LlrqvykX8UNNj+ymOxPYj9oWXtrX+TjLDOCyVCk0w1WSJl2dFfiAiZyijRv9mm7V5JTY/
 Kif4FFLDZbXztcEX7yDlFUpg6AMeIaA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-433-megk3bAxN3G_gOD7cNJthQ-1; Tue, 26 Aug 2025 04:47:37 -0400
X-MC-Unique: megk3bAxN3G_gOD7cNJthQ-1
X-Mimecast-MFC-AGG-ID: megk3bAxN3G_gOD7cNJthQ_1756198056
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-45a1b0045a0so36153265e9.0
 for <qemu-arm@nongnu.org>; Tue, 26 Aug 2025 01:47:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756198056; x=1756802856;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EdNBK/G2CP/XYVHgsGugpIGSHBAagqVuwdkPmCuAfPQ=;
 b=A8iNabIi+qg6cU6uCqe9ZTsBKCLOC84WdxwvLBwMyPeR/Hp3HUwp460pJBKcwpBozz
 q6ctEhjGIMJh71xTi/+zWIb8h0B98mGbyeWuY8wntWQH8LrZKayybMmHVqKjRfsH+OM4
 fHw7DKlqLfPiprDjYH2BM/c+HYvgPpEWYk88uzWEqu+qRT/5hzACzFpqCvI4UP9HJD4Q
 LPWa0UKHr7gdFS2e0nt05VM6SSn268zQBTj93DPo12AnMOJ/DjMlp4wOq18zJSTcZCu0
 2LWfF1VoEoqWZe9Q+PLHUzRbU8qZXP+4NIZtqE9IZrPUqDXQqgJVgh98ueBTg3HSCaio
 SoDQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV2DmPh3OiuzvPO/9DMMTgR/UEm3hGMlyM7jQtS6CwlHnsP9gCGck7X0CQyl5lNE918kUFGkKMSWQ==@nongnu.org
X-Gm-Message-State: AOJu0YyjlwlLvGcALz07Q8m/if0lA3lg0Gqmpqt13G8YcZrHtruBRwKH
 gpibnY23nDR7wlPNexAigxRYU0VKtc1JZQD2s82Uhol68SDjuQz1L327AFgtyW7bNbiDT8LWQDD
 rA/l8E+M/QOFiRanqmi9O80ghMt1lZgc4ZMhseFu35y9mAGw2agl94w==
X-Gm-Gg: ASbGnct0i5yoEkZ3h98ivx210wEfuqAp7ShdxRwqtUkeXCgJWtkc2FC/emIs0cdmUbU
 KREahzI7YL1Lj5JpHMoz+V9sJISq7PHzwWrwSDCN6ELQqYVGomRGd+NL4DV4rTByr3xGQlVbtu4
 zh2P+1Gm1hocgFvmoGlE2SNv3VYKiUABpO4GUPm8RDJlLVdRKbNkq/eCV6kjOg1uis6Ox+5sM0L
 +ZUG3SOZ5DtW0ws+HAv8Pd58G3Ubg49a5cYXAGbCt+SMpGbebQgqZwt0ARqHGkdEbyRMD/LtFyH
 SXi+HnwQr9Oj7um5aSLgmcnlm88b5g==
X-Received: by 2002:a05:600c:458a:b0:459:da76:d7aa with SMTP id
 5b1f17b1804b1-45b517dc897mr142438035e9.25.1756198055892; 
 Tue, 26 Aug 2025 01:47:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHVVmrnYcmC7VxaHNcL2r77LEs9HfW4js8Gz73X0F0e1YEXP0YHi7ixvt+oQRxtNLEoXqb7Fw==
X-Received: by 2002:a05:600c:458a:b0:459:da76:d7aa with SMTP id
 5b1f17b1804b1-45b517dc897mr142437595e9.25.1756198055386; 
 Tue, 26 Aug 2025 01:47:35 -0700 (PDT)
Received: from fedora ([85.93.96.130]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3c86a8ccd1bsm10740609f8f.27.2025.08.26.01.47.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Aug 2025 01:47:33 -0700 (PDT)
Date: Tue, 26 Aug 2025 10:47:31 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Zhao Liu <zhao1.liu@intel.com>
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, peterx@redhat.com,
 mst@redhat.com, mtosatti@redhat.com, richard.henderson@linaro.org,
 riku.voipio@iki.fi, thuth@redhat.com, pasic@linux.ibm.com,
 borntraeger@linux.ibm.com, david@redhat.com, jjherne@linux.ibm.com,
 shorne@gmail.com, eduardo@habkost.net, marcel.apfelbaum@gmail.com,
 philmd@linaro.org, wangyanan55@huawei.com, peter.maydell@linaro.org,
 agraf@csgraf.de, mads@ynddal.dk, mrolnik@gmail.com, deller@gmx.de,
 dirty@apple.com, rbolshakov@ddn.com, phil@philjordan.eu,
 reinoud@netbsd.org, sunilmut@microsoft.com, gaosong@loongson.cn,
 laurent@vivier.eu, edgar.iglesias@gmail.com, aurelien@aurel32.net,
 jiaxun.yang@flygoat.com, arikalo@gmail.com, chenhuacai@kernel.org,
 npiggin@gmail.com, rathc@linux.ibm.com, harshpb@linux.ibm.com,
 yoshinori.sato@nifty.com, iii@linux.ibm.com, mark.cave-ayland@ilande.co.uk,
 atar4qemu@gmail.com, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org
Subject: Re: [PATCH v5 6/8] add cpu_test_interrupt()/cpu_set_interrupt()
 helpers and use them tree wide
Message-ID: <20250826104731.1440e3ed@fedora>
In-Reply-To: <aK1mHGan+n9NSAOk@intel.com>
References: <20250814160600.2327672-7-imammedo@redhat.com>
 <20250821155603.2422553-1-imammedo@redhat.com>
 <aKyBFlCtnxnP9kt/@intel.com> <20250825171912.1bc7b841@fedora>
 <aK1mHGan+n9NSAOk@intel.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: OOocuvVJ6DpY8mbvllsSJlj75z8LSUPBTuMOTIt3Ic4_1756198056
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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

On Tue, 26 Aug 2025 15:45:32 +0800
Zhao Liu <zhao1.liu@intel.com> wrote:

> On Mon, Aug 25, 2025 at 05:19:12PM +0200, Igor Mammedov wrote:
> > Date: Mon, 25 Aug 2025 17:19:12 +0200
> > From: Igor Mammedov <imammedo@redhat.com>
> > Subject: Re: [PATCH v5 6/8] add cpu_test_interrupt()/cpu_set_interrupt()
> >  helpers and use them tree wide
> > X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
> > 
> > On Mon, 25 Aug 2025 23:28:22 +0800
> > Zhao Liu <zhao1.liu@intel.com> wrote:
> >   
> > > Hi Igor,
> > >    
> > > > diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
> > > > index 5eaf41a566..1dee9d4c76 100644
> > > > --- a/include/hw/core/cpu.h
> > > > +++ b/include/hw/core/cpu.h
> > > > @@ -942,6 +942,31 @@ CPUState *cpu_by_arch_id(int64_t id);
> > > >  
> > > >  void cpu_interrupt(CPUState *cpu, int mask);
> > > >  
> > > > +/**
> > > > + * cpu_test_interrupt:
> > > > + * @cpu: The CPU to check interrupt(s) on.
> > > > + * @mask: The interrupts to check.
> > > > + *
> > > > + * Checks if any of interrupts in @mask are pending on @cpu.
> > > > + */
> > > > +static inline bool cpu_test_interrupt(CPUState *cpu, int mask)
> > > > +{
> > > > +    return qatomic_load_acquire(&cpu->interrupt_request) & mask;
> > > > +}
> > > > +
> > > > +/**
> > > > + * cpu_set_interrupt:
> > > > + * @cpu: The CPU to set pending interrupt(s) on.
> > > > + * @mask: The interrupts to set.
> > > > + *
> > > > + * Sets interrupts in @mask as pending on @cpu.
> > > > + */
> > > > +static inline void cpu_set_interrupt(CPUState *cpu, int mask)
> > > > +{
> > > > +    qatomic_store_release(&cpu->interrupt_request,
> > > > +        cpu->interrupt_request | mask);    
> > > 
> > > It seems the read access of cpu->interrupt_request is not atomic, should
> > > we also protect it by qatomic_read(cpu->interrupt_request)? like
> > > 
> > > qatomic_store_release(&cpu->interrupt_request,
> > >                       qatomic_read(cpu->interrupt_request) | mask)  
> > 
> > it's not necessary according to doc:
> > 
> >   - ``qatomic_store_release()``, which guarantees the STORE to appear to           
> >   happen, ...,                    
> >   after all the LOAD or STORE operations specified before.
> >   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^  
> > 
> > that includes 'cpu->interrupt_request | mask' part  
> 
> Yes, thanks for your explaination and patience.
> 
> > > 
> > > or futher,
> > > 
> > > qatomic_fetch_or(&cpu->interrupt_request, mask)  
> > that would work as well  but it also could be more expensive than
> > qatomic_store_release()  
> 
> Behind this helper, I mainly considerred the case of multiple writers:
> 
>    thread 0      .        thread 1
>                  .
> load:  x         .
> OR:    x | a     .
>                  .
>                  .      load:  x
>                  .      OR:    x | b
>                  .      store: x | b
>                  .
> store: x | a     .      (x | b is missed)
> 
> In the above case, "load" means the direct access:
> cpu->interrupt_request w/o protection, and "store" is done by
> qatomic_store_release.
> 
> The memory order is guaranteed, but the operation result of thread 1
> seems lost. Only BQL or other mutex could avoid such case.
> 
> qatomic_store_release is already a great step to avoid issues outside
> BQL, so I'm not sure if it's worth going further to ensure atomicity,
> especifically for multiple writers (my initial understanding is that
> iothread or callback may have multiple writers, but I'm also a bit
> unsure.). The overhead is also indeed an issue.

it looks like we are always holding BQL when setting interrupt.

However currently we also have places that check interrupts
without BQL but without using any atomics. This patch aims to ensure
that proper barriers are in place when checking for interrupts
and introduces release/acquire pair helpers for cpu->interrupt_request,
to ensure it's don consistently.

While overhead might be issue, it's better to have correcteness 1st.
(that's why blanket tree wide change to make sure we don't miss places that
set/test interrupts).

Then if performance issues were found somewhere, as was suggested
in previous reviews, we may opencode that place without barriers
with a mandatory comment/justification why it's okey doing so.
(well, at least that's the plan)

> 
> Thanks,
> Zhao
> 


