Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86E9CCA0EFA
	for <qemu-arm@archiver.kernel.org>; Mon, 25 Aug 2025 15:20:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uqYys-0001Vb-4p; Mon, 25 Aug 2025 11:19:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1uqYyr-0001UW-1P
 for qemu-arm@nongnu.org; Mon, 25 Aug 2025 11:19:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1uqYyl-0007G7-Ez
 for qemu-arm@nongnu.org; Mon, 25 Aug 2025 11:19:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1756135164;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+4UqUGvOgnGqYy+91rT8H1p2QF5s7kvaLHqsAoVzw04=;
 b=J3ERqZ3Zgu8N/UAQtFb+vUIOz/8FHjY0cr9+Vi5t02KNev6Ix+0pHdzOO/xGlxH8YDrUZN
 pp2o6kMIjF7Vbf8oIC5er0N6FU/CfXas7I8QDDx6BePK/brgkoH6TBJYR4rRl3EXnd9iRO
 cZaRPwc/RXz7NxSPV7j3oq7v7YhHqtk=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-520-YYCozQTMMzelA1maLK8vMA-1; Mon, 25 Aug 2025 11:19:21 -0400
X-MC-Unique: YYCozQTMMzelA1maLK8vMA-1
X-Mimecast-MFC-AGG-ID: YYCozQTMMzelA1maLK8vMA_1756135161
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7e870614b86so1593434085a.2
 for <qemu-arm@nongnu.org>; Mon, 25 Aug 2025 08:19:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756135161; x=1756739961;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+4UqUGvOgnGqYy+91rT8H1p2QF5s7kvaLHqsAoVzw04=;
 b=d+TJyxhJDviwuKoOdf4LvUASOCyYC419VBQ2M8cIBv4fzTxM/r59VEPJSfNPQycpUM
 KClvfXWdC8WH0dnGNT1ugpOBUjMYsveDaIo99jUaZAB10BMDjfNWJyqMqA46MxLwen74
 vGnUI9JBQ9+9OcCuaw1DC/Kdy/X4Vr4Iz9G9hWWyKg41vwvu9XIX4Z0bviOj2wGdylMa
 ev/42u2tp6RcTb1sAzYW0yXx/8SGaC6GzskYFyk0VeDsuZpc0QufbpC6j49it2e7KA9E
 B+9Tlppnca2baF79mXv3UWyePU3xD1llrT47Ci0tnAc1snT9plbj912f1LLzT9uQoDSM
 Bfzw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWOYN3FzC0Z4RxG4TBDeWOCKq53cmi/PR4MIcRO6JcfVMhsYsJZiot9ls8CUhrCHbPQY/0isHl/CQ==@nongnu.org
X-Gm-Message-State: AOJu0YwViAcirnWTZzfytvKFQigXfr94ad3dl88rj3BCMVIcvSUoiPDX
 QDbII9JzGRjT0m6yLL/7B6o2XzLtk0nb4qEobOyudvj9qdyHt8SiliGHpDJ3ay5NucI2UFEO542
 K+DiFh3C9AbUF4JKVCFku7Qd+2uJdZdVpfKwwU2sQ2Q6sLcTOgceUPg==
X-Gm-Gg: ASbGncvO5LDYIctknEZssYtlyiCXIGNvkAYCiq2NxWWzmnfCjDfsMlnRZXwf8Y7kIXf
 X2HIVkSHBbtLBMlCVoGKUtds13PWfCXujN/wdiCYLKM6SX9gxisK3S0U//pwADDv3aHoWh/SbGj
 3T+5nM8jv3GXLSkQGy1eTfYW3sm5p/AJAQQjrVQWOlGUZv9HK9OIt6vYUkaFPJUUPDCkCvGV+r/
 Nu4+a6MhEGmCu947Y/wlGCC+K9eLtOUnYUpiZPiYlyBGMBqIQU8M6yfzAb8IUE5JujU6y4KOBBC
 8o3CIi/LTrf7bbVuxEvvcKjMvDrQSw==
X-Received: by 2002:a05:620a:a804:b0:7e9:f81f:ce8d with SMTP id
 af79cd13be357-7ea110a5b71mr1173409785a.79.1756135160964; 
 Mon, 25 Aug 2025 08:19:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEYjMPSQlC7ckKhpraLakG+EtN4ksSgKesQ2e6V1dfyWlvoo1vXXbocOD4Dj8hUzaTE3UZGvQ==
X-Received: by 2002:a05:620a:a804:b0:7e9:f81f:ce8d with SMTP id
 af79cd13be357-7ea110a5b71mr1173401985a.79.1756135160380; 
 Mon, 25 Aug 2025 08:19:20 -0700 (PDT)
Received: from fedora ([85.93.96.130]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7ebf36e7640sm496931085a.59.2025.08.25.08.19.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Aug 2025 08:19:20 -0700 (PDT)
Date: Mon, 25 Aug 2025 17:19:12 +0200
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
Message-ID: <20250825171912.1bc7b841@fedora>
In-Reply-To: <aKyBFlCtnxnP9kt/@intel.com>
References: <20250814160600.2327672-7-imammedo@redhat.com>
 <20250821155603.2422553-1-imammedo@redhat.com>
 <aKyBFlCtnxnP9kt/@intel.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: dBmV50DSq-pwYZHYXP-dZYvVPPmu3qkyKGavzsBpAwI_1756135161
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

On Mon, 25 Aug 2025 23:28:22 +0800
Zhao Liu <zhao1.liu@intel.com> wrote:

> Hi Igor,
>  
> > diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
> > index 5eaf41a566..1dee9d4c76 100644
> > --- a/include/hw/core/cpu.h
> > +++ b/include/hw/core/cpu.h
> > @@ -942,6 +942,31 @@ CPUState *cpu_by_arch_id(int64_t id);
> >  
> >  void cpu_interrupt(CPUState *cpu, int mask);
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
> > + * Sets interrupts in @mask as pending on @cpu.
> > + */
> > +static inline void cpu_set_interrupt(CPUState *cpu, int mask)
> > +{
> > +    qatomic_store_release(&cpu->interrupt_request,
> > +        cpu->interrupt_request | mask);  
> 
> It seems the read access of cpu->interrupt_request is not atomic, should
> we also protect it by qatomic_read(cpu->interrupt_request)? like
> 
> qatomic_store_release(&cpu->interrupt_request,
>                       qatomic_read(cpu->interrupt_request) | mask)

it's not necessary according to doc:

  - ``qatomic_store_release()``, which guarantees the STORE to appear to           
  happen, ...,                    
  after all the LOAD or STORE operations specified before.
  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^  

that includes 'cpu->interrupt_request | mask' part

> 
> or futher,
> 
> qatomic_fetch_or(&cpu->interrupt_request, mask)
that would work as well  but it also could be more expensive than
qatomic_store_release()

> 
> > +}
> > +  
> 
> Thanks,
> Zhao
> 


