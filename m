Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9689CA0EFC
	for <qemu-arm@archiver.kernel.org>; Thu, 21 Aug 2025 16:02:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1up7jH-0006QU-E0; Thu, 21 Aug 2025 12:01:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1up7im-00064k-38
 for qemu-arm@nongnu.org; Thu, 21 Aug 2025 12:01:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1up7ij-0000oE-3z
 for qemu-arm@nongnu.org; Thu, 21 Aug 2025 12:00:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1755792055;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ifvj4MABzf1GWyv7GOzNLOvrdAcDcI8LHYQe/seyGSM=;
 b=WzRXyrlI33z+LFrWZ81qxk1Vo/kuZ4ruCy/86mQyMmkrKktcY3bGuG6d5HfzERzi7vGh/w
 UVCX/fGDK0tLmUESZPwv7C7uy4jbM+fSRwqZYYaRuVv+qe5nfrp9U7n+ofmq6BgkQgnFLZ
 /CcS9yB6x6KhAb2AdGtH6ull9mYBf84=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-624-30ogR9NsObK6lCXTVEY7dw-1; Thu, 21 Aug 2025 11:57:11 -0400
X-MC-Unique: 30ogR9NsObK6lCXTVEY7dw-1
X-Mimecast-MFC-AGG-ID: 30ogR9NsObK6lCXTVEY7dw_1755791831
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-70baffc03dbso31014276d6.0
 for <qemu-arm@nongnu.org>; Thu, 21 Aug 2025 08:57:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755791831; x=1756396631;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ifvj4MABzf1GWyv7GOzNLOvrdAcDcI8LHYQe/seyGSM=;
 b=f19Owvi5hFiYCEUwNtoGvJcnWCO9YB+Jh+eU/j8f2jwBAUk2jL7lL3cKXwM1RUFOoY
 nlcXFipprzXdbh5PVUi86s05pxMl6ppXvY63V8G1xLIufk7603X0cfbxyTzPhM3NskhT
 nvTrQR0+Xz76MTfMgj7Hh4MO9CqAcWpHjJ/csa3dKJRJia8sAhVnhDjZpAXRRGS+xy72
 hEMumFF6XlL2WfE3ndj5w4MjRfXfShxkHwXr+1Yh1Kwp1HzSinHlMGJ9fYQZGb8WIwzC
 GzLxAIFVdIiGjFcxF9qY5ujHYuQmYvyhDIe/FqfquUlLV50QSzYFwyAvsGqJfA2e8xO7
 F9cw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWIfqI3gThZEe82Jt4alt5S7xMrPJ9dbMHPi1SKGTBFJk2uukvufMQcK/kPdUfMpQQSjlByRhFSjw==@nongnu.org
X-Gm-Message-State: AOJu0YxwwVJSz75eofz3/M1kSOR+gbl4+2lXoYn0wHjQsk0qazKr2t9/
 lcdcTFYeu2lg+hFgjtBz2ZzP4lDYub7ElRINi6gzGZ79oqsyQmqg+p1GUctD2b0U3aDHT12/cAr
 Hi+RhQx4Qd1dFBpTkIN3NXPp/S3lwI1aWfy8Dh+lQcYy3Q2bZ+SvqKQ==
X-Gm-Gg: ASbGncvy+KL9QkCGFMAtuMaGnxmPFfjg8Av1vz/cHADIo5yH9Y/tHCQMUhlfdPmdg0Z
 Pu7atu/jX6unYhTFycWg7V5J456fo9OzN5rzDECjPSOlccr5tSMHihMKL3UjoNC4r1BJb+2LWp7
 3Sy5J2/aRhGoLFqZPAQHBLAZGvHgQOR1Axa8yafMciNU6B8FftOQjdnKwLpxKKqXurQ5iEPfBgB
 q+650fTX7ysDcMKnvNstjiVyGr/hgoXXXy032a+qjemnH6xT8Otjti2pGbGfgEDQjlHF63mfBc9
 TQcD0uo8uxos4pNv+BRVVMZaWL9lRg==
X-Received: by 2002:a05:6214:2248:b0:704:7dfa:3fd with SMTP id
 6a1803df08f44-70d8988d43fmr31649656d6.4.1755791830735; 
 Thu, 21 Aug 2025 08:57:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFBbepghKtLYdGRsHfa6Vu6LdvA1UZfQ7rkPI4waKMc6oIO2y0DpPtMsHn9d4P8Cq/zh0nPJA==
X-Received: by 2002:a05:6214:2248:b0:704:7dfa:3fd with SMTP id
 6a1803df08f44-70d8988d43fmr31649116d6.4.1755791830220; 
 Thu, 21 Aug 2025 08:57:10 -0700 (PDT)
Received: from fedora ([85.93.96.130]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-70ba9032801sm105836596d6.16.2025.08.21.08.57.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Aug 2025 08:57:09 -0700 (PDT)
Date: Thu, 21 Aug 2025 17:57:00 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: "Jason J. Herne" <jjherne@linux.ibm.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, Peter Xu
 <peterx@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 mtosatti@redhat.com, richard.henderson@linaro.org, riku.voipio@iki.fi,
 thuth@redhat.com, pasic@linux.ibm.com, borntraeger@linux.ibm.com,
 david@redhat.com, shorne@gmail.com, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, philmd@linaro.org, wangyanan55@huawei.com,
 zhao1.liu@intel.com, peter.maydell@linaro.org, agraf@csgraf.de,
 mads@ynddal.dk, mrolnik@gmail.com, deller@gmx.de, dirty@apple.com,
 rbolshakov@ddn.com, phil@philjordan.eu, reinoud@netbsd.org,
 sunilmut@microsoft.com, gaosong@loongson.cn, laurent@vivier.eu,
 edgar.iglesias@gmail.com, aurelien@aurel32.net, jiaxun.yang@flygoat.com,
 arikalo@gmail.com, chenhuacai@kernel.org, npiggin@gmail.com,
 rathc@linux.ibm.com, harshpb@linux.ibm.com, yoshinori.sato@nifty.com,
 iii@linux.ibm.com, mark.cave-ayland@ilande.co.uk, atar4qemu@gmail.com,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org
Subject: Re: [PATCH v4 6/8] add cpu_test_interrupt()/cpu_set_interrupt()
 helpers and use them tree wide
Message-ID: <20250821175700.00e7ea97@fedora>
In-Reply-To: <2d7317bc-e2cd-4f92-8956-4122f0860a49@linux.ibm.com>
References: <20250814160600.2327672-1-imammedo@redhat.com>
 <20250814160600.2327672-7-imammedo@redhat.com>
 <2d7317bc-e2cd-4f92-8956-4122f0860a49@linux.ibm.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: LEpDhd5mcm96ZVkqGo-8bYLDrDTgCkCx2z8CRQRfaoQ_1755791831
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
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Wed, 20 Aug 2025 11:01:13 -0400
"Jason J. Herne" <jjherne@linux.ibm.com> wrote:

> On 8/14/25 12:05 PM, Igor Mammedov wrote:
> > the helpers form load-acquire/store-release pair and use them to replace
> > open-coded checkers/setters consistently across the code, which
> > ensures that appropriate barriers are in place in case checks happen
> > outside of BQL.
> > 
> > Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> > ---
> > v4:
> >     add cpu_set_interrupt() and merge helpers patch with
> >     patches that use them (v3 6-7,9/10).
> >         Peter Xu <peterx@redhat.com>
> > 
> > CC: mst@redhat.com
> > ...
> > 
> > diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
> > index 5eaf41a566..3e233ff6de 100644
> > --- a/include/hw/core/cpu.h
> > +++ b/include/hw/core/cpu.h
> > @@ -942,6 +942,31 @@ CPUState *cpu_by_arch_id(int64_t id);
> >   
> >   void cpu_interrupt(CPUState *cpu, int mask);
> >   
> > +/**
> > + * cpu_test_interrupt:
> > + * @cpu: The CPU to check interrupt(s) on.
> > + * @mask: The interrupts to check.
> > + *
> > + * Checks if any of interrupts in @mask are pending on @cpu.
> > + */
> > +static inline bool cpu_test_interrupt(CPUState *cpu, int mask)
> > +{
> > +    return qatomic_load_acquire(&cpu->interrupt_request) & mask;
> > +}
> > +
> > +/**
> > + * cpu_set_interrupt:
> > + * @cpu: The CPU to set pending interrupt(s) on.
> > + * @mask: The interrupts to set.
> > + *
> > + * Checks if any of interrupts in @mask are pending on @cpu.
> > + */  
> 
> Copy paste error, comment description for 'set' appears to be for the 
> 'test' variant. :)

thanks, I'll post fixed up v5 here
> 
> > ...
> >   
> > diff --git a/hw/intc/s390_flic.c b/hw/intc/s390_flic.c
> > index 8f4c9fd52e..1eed5125d1 100644
> > --- a/hw/intc/s390_flic.c
> > +++ b/hw/intc/s390_flic.c
> > @@ -190,7 +190,7 @@ static void qemu_s390_flic_notify(uint32_t type)
> >       CPU_FOREACH(cs) {
> >           S390CPU *cpu = S390_CPU(cs);
> >   
> > -        cs->interrupt_request |= CPU_INTERRUPT_HARD;
> > +        cpu_set_interrupt(cs, CPU_INTERRUPT_HARD);
> >   
> >           /* ignore CPUs that are not sleeping */
> >           if (s390_cpu_get_state(cpu) != S390_CPU_STATE_OPERATING &&  
> 
> Looks good wrt s390-flic.
> 
> Reviewed-by: Jason J. Herne <jjherne@linux.ibm.com>
> 


