Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp597215lfc;
        Tue, 10 Mar 2020 04:00:33 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vsPJATN+v9XRQ5trs9OOIdaOJBevdnvMAbADrq7JwCA3ZgDVjhxbJ19vUNMeT30LOGDJIFp
X-Received: by 2002:a05:6214:11ec:: with SMTP id e12mr5192723qvu.89.1583838033170;
        Tue, 10 Mar 2020 04:00:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583838033; cv=none;
        d=google.com; s=arc-20160816;
        b=iwQnSYfGr5gXs6+CpoP6VLcQYlemsSeoPwj/ig+EU7lBn1Yf1QNVPjqF4g+bda8q51
         cFPGsq2UXixfO1TxMft9Wbht2NExG7Wtok3Aj/WvLcR7MhGAy4rCK/M78sSk90dyJQyH
         fQva8vegW0TNsw6Ed0C7c/GoOnKu92USyxICSzuyLBAOiIW8j+ojVmO5yNqyRi/CZFGP
         hwAJ7iXWrbbrrloTNAf4ox8530rE+VrDvyaWNAAnGEG4DFRNAleDGP8xUgCOeekzXxGu
         VzCIPsTDjx2YgawXhAaAkkCE4FasZ+dFpHgMVDslImmy40GVZ/XK5f5gwxMU6DOg0/iB
         jfxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:cc
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=Gi+UfiwrrjWaQGmQOhZsDkjT8/J92UHpDzggV9qy8BA=;
        b=ZcLTf55hDj0vvSQFyVleBeSHcmOdtz4XNuDyNcwfAUIzgL9MWiDfqnhZXbpA/v9PL4
         evCLafV/MgPXQALbxi0cW/xsW73i/y0iX+C8MmbwsZg7P0LeTCnrpKRF/0RAbjnFrz8s
         /cFoGlOB1kChrDXTBiH5grRcLlNGAVrqmwZ/WiCCYngk1MVtXR0P1hPm3QEGRJtZQiuM
         QtszqPYJqJl2rbFG8890S+6rlqCtgc0yw+OJyDBDx3O8lXgooJxjxKRioDYP+cBneeqg
         TUNfSFYivKH2H6Vcxyah/WbpU3TiYVrYhh+4/snf7n8ATaEibExfKwNnvbux89CJKOG2
         8UuA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@redhat.com header.s=mimecast20190719 header.b=UIauIOy3;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id x7si7979311qkx.96.2020.03.10.04.00.32;
        Tue, 10 Mar 2020 04:00:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@redhat.com header.s=mimecast20190719 header.b=UIauIOy3;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id A1A194A4A9;
	Tue, 10 Mar 2020 07:00:32 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
X-Spam-Flag: NO
X-Spam-Score: 0.909
X-Spam-Level: 
X-Spam-Status: No, score=0.909 required=6.1 tests=[BAYES_00=-1.9,
	DKIM_SIGNED=0.1, DNS_FROM_AHBL_RHSBL=2.699,
	RCVD_IN_DNSWL_NONE=-0.0001, T_DKIM_INVALID=0.01] autolearn=no
Authentication-Results: mm01.cs.columbia.edu (amavisd-new); dkim=softfail
	(fail, message has been altered) header.i=@redhat.com
Received: from mm01.cs.columbia.edu ([127.0.0.1])
	by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4h7c78og8ijU; Tue, 10 Mar 2020 07:00:31 -0400 (EDT)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 7675F4A4FC;
	Tue, 10 Mar 2020 07:00:31 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id 151114A4A9
 for <kvmarm@lists.cs.columbia.edu>; Tue, 10 Mar 2020 07:00:30 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jSeKoRnwGcHi for <kvmarm@lists.cs.columbia.edu>;
 Tue, 10 Mar 2020 07:00:29 -0400 (EDT)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id 20C484A1FA
 for <kvmarm@lists.cs.columbia.edu>; Tue, 10 Mar 2020 07:00:29 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583838028;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4JG1xSI0M7SxiOdT+XP4LAA8ykTyWX0vFprHuiZRRDg=;
 b=UIauIOy34+PcgMR7GIjCfGj/H5qCXl32I+70/xIVFsI8KrT+oso0njHazNPoXdmdsjWytn
 jc+GWdIN/o2vxQEhdI1XJHXBvSoYq62sBtz4SSanCvGobB7I4JsFyflmGRwQfhqkdGsmJq
 vQfKVzOtdgTMT7VSqN+jvoEycrqGja0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-298-si_hbHt5POCEjnAl5TJIig-1; Tue, 10 Mar 2020 07:00:26 -0400
X-MC-Unique: si_hbHt5POCEjnAl5TJIig-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 95F1213EA;
 Tue, 10 Mar 2020 11:00:24 +0000 (UTC)
Received: from [10.36.117.85] (ovpn-117-85.ams2.redhat.com [10.36.117.85])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 871E35C13D;
 Tue, 10 Mar 2020 11:00:21 +0000 (UTC)
Subject: Re: [kvm-unit-tests PATCH v4 03/13] arm/arm64: gic: Introduce
 setup_irq() helper
To: Andrew Jones <drjones@redhat.com>
References: <20200309102420.24498-1-eric.auger@redhat.com>
 <20200309102420.24498-4-eric.auger@redhat.com>
 <20200309105601.3hm2kfhuufgxoydl@kamzik.brq.redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <3e1e2c24-2f30-03f2-ca9c-a2d99aba0740@redhat.com>
Date: Tue, 10 Mar 2020 12:00:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20200309105601.3hm2kfhuufgxoydl@kamzik.brq.redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Cc: thuth@redhat.com, kvm@vger.kernel.org, maz@kernel.org,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, andre.przywara@arm.com,
 kvmarm@lists.cs.columbia.edu, eric.auger.pro@gmail.com
X-BeenThere: kvmarm@lists.cs.columbia.edu
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: Where KVM/ARM decisions are made <kvmarm.lists.cs.columbia.edu>
List-Unsubscribe: <https://lists.cs.columbia.edu/mailman/options/kvmarm>,
 <mailto:kvmarm-request@lists.cs.columbia.edu?subject=unsubscribe>
List-Archive: <https://lists.cs.columbia.edu/pipermail/kvmarm>
List-Post: <mailto:kvmarm@lists.cs.columbia.edu>
List-Help: <mailto:kvmarm-request@lists.cs.columbia.edu?subject=help>
List-Subscribe: <https://lists.cs.columbia.edu/mailman/listinfo/kvmarm>,
 <mailto:kvmarm-request@lists.cs.columbia.edu?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kvmarm-bounces@lists.cs.columbia.edu
Sender: kvmarm-bounces@lists.cs.columbia.edu
X-TUID: yvbMRtzUuTNy

Hi Drew,
On 3/9/20 11:56 AM, Andrew Jones wrote:
> On Mon, Mar 09, 2020 at 11:24:10AM +0100, Eric Auger wrote:
>> ipi_enable() code would be reusable for other interrupts
>> than IPI. Let's rename it setup_irq() and pass an interrupt
>> handler pointer.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>
>> ---
>>
>> v2 -> v3:
>> - do not export setup_irq anymore
>> ---
>>  arm/gic.c | 20 +++++++-------------
>>  1 file changed, 7 insertions(+), 13 deletions(-)
>>
>> diff --git a/arm/gic.c b/arm/gic.c
>> index fcf4c1f..abf08c7 100644
>> --- a/arm/gic.c
>> +++ b/arm/gic.c
>> @@ -34,6 +34,7 @@ static struct gic *gic;
>>  static int acked[NR_CPUS], spurious[NR_CPUS];
>>  static int bad_sender[NR_CPUS], bad_irq[NR_CPUS];
>>  static cpumask_t ready;
>> +typedef void (*handler_t)(struct pt_regs *regs __unused);
> 
> This is just irq_handler_fn, which is already defined in processor.h.
> We don't need the __unused, not since 6b07148d06b1 ("Replace -Wextra
> with a saner list of warning flags").
Shall I duplicate it into ./lib/arm/asm/processor.h as well?

Thanks

Eric
> 
>>  
>>  static void nr_cpu_check(int nr)
>>  {
>> @@ -215,20 +216,20 @@ static void ipi_test_smp(void)
>>  	report_prefix_pop();
>>  }
>>  
>> -static void ipi_enable(void)
>> +static void setup_irq(handler_t handler)
>>  {
>>  	gic_enable_defaults();
>>  #ifdef __arm__
>> -	install_exception_handler(EXCPTN_IRQ, ipi_handler);
>> +	install_exception_handler(EXCPTN_IRQ, handler);
>>  #else
>> -	install_irq_handler(EL1H_IRQ, ipi_handler);
>> +	install_irq_handler(EL1H_IRQ, handler);
>>  #endif
>>  	local_irq_enable();
>>  }
>>  
>>  static void ipi_send(void)
>>  {
>> -	ipi_enable();
>> +	setup_irq(ipi_handler);
>>  	wait_on_ready();
>>  	ipi_test_self();
>>  	ipi_test_smp();
>> @@ -238,7 +239,7 @@ static void ipi_send(void)
>>  
>>  static void ipi_recv(void)
>>  {
>> -	ipi_enable();
>> +	setup_irq(ipi_handler);
>>  	cpumask_set_cpu(smp_processor_id(), &ready);
>>  	while (1)
>>  		wfi();
>> @@ -295,14 +296,7 @@ static void ipi_clear_active_handler(struct pt_regs *regs __unused)
>>  static void run_active_clear_test(void)
>>  {
>>  	report_prefix_push("active");
>> -	gic_enable_defaults();
>> -#ifdef __arm__
>> -	install_exception_handler(EXCPTN_IRQ, ipi_clear_active_handler);
>> -#else
>> -	install_irq_handler(EL1H_IRQ, ipi_clear_active_handler);
>> -#endif
>> -	local_irq_enable();
>> -
>> +	setup_irq(ipi_clear_active_handler);
>>  	ipi_test_self();
>>  	report_prefix_pop();
>>  }
>> -- 
>> 2.20.1
>>

_______________________________________________
kvmarm mailing list
kvmarm@lists.cs.columbia.edu
https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
