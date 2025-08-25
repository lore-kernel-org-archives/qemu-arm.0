Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81C15CA0FE7
	for <qemu-arm@archiver.kernel.org>; Mon, 25 Aug 2025 15:07:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uqYm4-0004F5-Sr; Mon, 25 Aug 2025 11:06:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1uqYm2-0004EK-Nn
 for qemu-arm@nongnu.org; Mon, 25 Aug 2025 11:06:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1uqYlz-0005ed-I4
 for qemu-arm@nongnu.org; Mon, 25 Aug 2025 11:06:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1756134374;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8/tEGPEwqht/mT9P2DP6ilOXHA65XRuJlmjuUdlnRXc=;
 b=Ecc75K2jbKemwtWRMpobse8XWAN8HPbQLpDTPBOHRL/+cVE0926pnBTpKDlYAcIxjYEJhP
 VUXgC4A8fwN11djFYWEt9WDRYpXMxDOwGvlzd0OApoMwr1DU5yDr2/nkqy27IAew5bo9Nt
 D1GhJHSUxTWjbwFZ8dQPG2tT15zyK8o=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-600-_GCkvquuObWmUwCJv5oR5g-1; Mon, 25 Aug 2025 11:06:11 -0400
X-MC-Unique: _GCkvquuObWmUwCJv5oR5g-1
X-Mimecast-MFC-AGG-ID: _GCkvquuObWmUwCJv5oR5g_1756134370
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-45a1b05d8d0so32699785e9.1
 for <qemu-arm@nongnu.org>; Mon, 25 Aug 2025 08:06:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756134370; x=1756739170;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8/tEGPEwqht/mT9P2DP6ilOXHA65XRuJlmjuUdlnRXc=;
 b=NT4+keQ8KdZpztu3Img1eOwJkj6LJYfTDrv7Bn2Kqt17leh3I2iRmdK1S5KVflBJv0
 YsOTrsIuih7aBhn1Isgmfd6Ojgj2jQPZmCvbls4hHgSoJZNIA6wq4esaqSvw8X2efAtY
 2x0jUJ3WnI7mgMOTQys4g+LTTl1p2BnTf9D8kbARxQRrlse8K3qFX8vcpcmBwySvZ+S3
 kxZJ3WEPcFyy4CYOyTDH177Tq/HZs2DoigSTHPWqgMr4+km2I5AO4WULpMy/ZtEvWxwS
 adAO1oUqv5M//0NSKp62P4UYoC43G+SkpP2y9fQ0zjH3pOteoACpEWr7XtHMUEgBY9ql
 Nc7A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUTDEcVc+lPQfuVRUxRYeA8/M2tDgpaY5t1IqWH0FFxDtus3724BOcgKzS6AngEJY1VfG5mvuy/bQ==@nongnu.org
X-Gm-Message-State: AOJu0YxCcuVtdDDvXZnFHFVtp1Ij7JZJx1POMaJVKHtAxFgF6aEnfrO4
 RIr1wZN7OPEer7s2zEYpj71XjqUENuNyCVqH4jzz7HosYSrST2IB8TmkIMz+sP4MuIEB9hZp/tC
 6OY+OQWeInGet8LJbPH6xjIhxbD2wx473Pgr/TvnFfdn6j1POQ/gfRg==
X-Gm-Gg: ASbGncucSSzuzbSNiPVSZBLEFcOILZW3jLeaxxU48oWG0i1wBXJODV+6LMOFikoXk0H
 +qZwbkvGu3Hr3FmzlC5wFV25QI7voYQwf/C6HSUTNyFKLpUempOGjCp4Ly52Q2Su9miDV6Y4ujX
 Ro4BmFCmtBywND4GGGmUCzmA4nmTzTl3T97EYEzz5rLCJ3MEBMmopNphgbgsZQV5yweJT3EBza4
 NSh1ZuOCMkUC8WQdD81zlsHCIJXRHn18WjXdsgepdqDpRdxK2+qX+A+ewh5XPnVWBJQDd3/auJM
 gd+f1BeUJjdTudmR93i/hbLoF1L2oQ==
X-Received: by 2002:a05:600c:3147:b0:459:d46a:ee3d with SMTP id
 5b1f17b1804b1-45b51798f71mr100542905e9.2.1756134369947; 
 Mon, 25 Aug 2025 08:06:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFFLfkKK0GmVjjvEd0RWmdsHavBP8/zEPvrLj6aBR4MKi8R6Xlofs83XJe6PQlipH33XRyeWg==
X-Received: by 2002:a05:600c:3147:b0:459:d46a:ee3d with SMTP id
 5b1f17b1804b1-45b51798f71mr100542555e9.2.1756134369451; 
 Mon, 25 Aug 2025 08:06:09 -0700 (PDT)
Received: from fedora ([85.93.96.130]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3c711ca623asm11877704f8f.59.2025.08.25.08.06.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Aug 2025 08:06:09 -0700 (PDT)
Date: Mon, 25 Aug 2025 17:06:07 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Harsh Prateek Bora <harshpb@linux.ibm.com>
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, peterx@redhat.com,
 mst@redhat.com, mtosatti@redhat.com, richard.henderson@linaro.org,
 riku.voipio@iki.fi, thuth@redhat.com, pasic@linux.ibm.com,
 borntraeger@linux.ibm.com, david@redhat.com, jjherne@linux.ibm.com,
 shorne@gmail.com, eduardo@habkost.net, marcel.apfelbaum@gmail.com,
 philmd@linaro.org, wangyanan55@huawei.com, zhao1.liu@intel.com,
 peter.maydell@linaro.org, agraf@csgraf.de, mads@ynddal.dk,
 mrolnik@gmail.com, deller@gmx.de, dirty@apple.com, rbolshakov@ddn.com,
 phil@philjordan.eu, reinoud@netbsd.org, sunilmut@microsoft.com,
 gaosong@loongson.cn, laurent@vivier.eu, edgar.iglesias@gmail.com,
 aurelien@aurel32.net, jiaxun.yang@flygoat.com, arikalo@gmail.com,
 chenhuacai@kernel.org, npiggin@gmail.com, rathc@linux.ibm.com,
 yoshinori.sato@nifty.com, iii@linux.ibm.com, mark.cave-ayland@ilande.co.uk,
 atar4qemu@gmail.com, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org
Subject: Re: [PATCH v5 6/8] add cpu_test_interrupt()/cpu_set_interrupt()
 helpers and use them tree wide
Message-ID: <20250825170607.14134285@fedora>
In-Reply-To: <9fde8cf9-19c4-4265-90dd-75ac4f12c584@linux.ibm.com>
References: <20250814160600.2327672-7-imammedo@redhat.com>
 <20250821155603.2422553-1-imammedo@redhat.com>
 <9fde8cf9-19c4-4265-90dd-75ac4f12c584@linux.ibm.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: BDYouCgWEq3MOR5UJNA6Ht_6D2sx6jZy28CzCZR4QqQ_1756134370
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
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

On Mon, 25 Aug 2025 13:46:45 +0530
Harsh Prateek Bora <harshpb@linux.ibm.com> wrote:

> On 8/21/25 21:26, Igor Mammedov wrote:
> > the helpers form load-acquire/store-release pair and use them to replace
> > open-coded checkers/setters consistently across the code, which
> > ensures that appropriate barriers are in place in case checks happen
> > outside of BQL.
> > 
> > Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> > Reviewed-by: Peter Xu <peterx@redhat.com>
> > Reviewed-by: Jason J. Herne <jjherne@linux.ibm.com>
> > ---
...
> > --- a/accel/tcg/cpu-exec.c
> > +++ b/accel/tcg/cpu-exec.c
> > @@ -778,7 +778,7 @@ static inline bool cpu_handle_interrupt(CPUState *cpu,
> >        */
> >       qatomic_set_mb(&cpu->neg.icount_decr.u16.high, 0);
> >   
> > -    if (unlikely(qatomic_read(&cpu->interrupt_request))) {
> > +    if (unlikely(cpu_test_interrupt(cpu, ~0))) {
> >           int interrupt_request;
> >           bql_lock();
> >           interrupt_request = cpu->interrupt_request;
> > @@ -786,7 +786,7 @@ static inline bool cpu_handle_interrupt(CPUState *cpu,
> >               /* Mask out external interrupts for this step. */
> >               interrupt_request &= ~CPU_INTERRUPT_SSTEP_MASK;
> >           }
> > -        if (interrupt_request & CPU_INTERRUPT_DEBUG) {
> > +        if (cpu_test_interrupt(cpu, CPU_INTERRUPT_DEBUG)) {
> >               cpu->interrupt_request &= ~CPU_INTERRUPT_DEBUG;  
> 
> Do we need a helper for instances like these (logical &) as well ?
> I see a couple more such instances below.

there is more than a couple tree wide,
perhaps they are candidate for replacement with already existing
cpu_reset_interrupt().
Though I'd prefer to do it on top of this series if necessary.



