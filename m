Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp7181869lff;
        Wed, 15 Jan 2020 09:05:15 -0800 (PST)
X-Google-Smtp-Source: APXvYqyafTD9gZIpyVtmkXJxoyUaXAI4yCHP0EnvrZXuTXOPRsdk5J9v/hzeKKzyrkMACFK48I58
X-Received: by 2002:a9d:624e:: with SMTP id i14mr3445929otk.371.1579107915199;
        Wed, 15 Jan 2020 09:05:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579107915; cv=none;
        d=google.com; s=arc-20160816;
        b=ml11Sz3RfXBaGr9+GrqhCx8YZIXthFTEVTCUY3OXKzwSj57LolEgcy01/85XVt9ib8
         RzYVYGTP70ZNhV9CoAmkZPkGQUO2Darqe0CqzFYSYoyrEBKzHRU26ymnNxd2vMMWmzlu
         UzgHYdSe30vkkdJipsq6hgAFFLzerqDGzq2EH88qYWTor5dQTrXocH+DfGTSyEViTjv+
         h1YvjYb4N32RtLFGwNSIU0GVT7ZPeeVcL8G61dWjhfYF8vJ/nEihQUJarDTcb0yPyoYy
         hUqlOvE+7LKs5PiPnVftydjevIFncQlM4WSe2UZWwTa38XDVPkW5GaRjD0gjS83/2P37
         TUcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:dkim-signature;
        bh=oVilqwU94UuE7g+i9EgveRsLq3IMTvQzQsS+OP2ANdY=;
        b=Jol45c35DMROjGVuBDue1nfOrZhbvFxyPU2ki9C8v79NEt0TEOHm8ihg9+KbYsgOB9
         J+0PyAGuznoI6hnDS/AKlQ78eROunfCgLTu9XKLNUMGc/lS4anpwDJj1ucu86aWZqme1
         sEuLoxd16vr3EU4g9Fc1By0Df25EtHv3LB7yz5ZF+QGAPUHwxb/ODSUFJuMHBhtIGU0d
         a1VasrOeDsbtN4mRZ7ld22aR1v7MN+T98pDqINal/3oi4SaaxiHVva/SxSf4YguF1ADU
         Q7PBLugV8a3xqFNGPa7L+2myc4vESqS9GkosEWfIgbqS08XiJpYlDeKQJuWrokR+Xm5G
         2dyA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Ak+Z+ZvF;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id l5si11118149otn.194.2020.01.15.09.05.08;
        Wed, 15 Jan 2020 09:05:15 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Ak+Z+ZvF;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728921AbgAORFI (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 4 others); Wed, 15 Jan 2020 12:05:08 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:21421 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726574AbgAORFH (ORCPT
        <rfc822;kvm@vger.kernel.org>); Wed, 15 Jan 2020 12:05:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1579107907;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=oVilqwU94UuE7g+i9EgveRsLq3IMTvQzQsS+OP2ANdY=;
        b=Ak+Z+ZvFYVy3Nz4GRupVqsu1pJ+mPmN0rACBeL34B2ge53zZSVDjY1PH0aZJz07QMBGwFq
        Ma261nmf8OFnRUeSGQYqNwoZGCsB/CfQ23RAD7I7eyxY7cUNS/4+vg2RR89zTt//YlB50k
        uI1/2jK4N1QdtUzPrQbapFvSw79bkRg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-87-GVl0oqNXOSOSMMHofD_XLw-1; Wed, 15 Jan 2020 12:05:03 -0500
X-MC-Unique: GVl0oqNXOSOSMMHofD_XLw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D22C5477;
        Wed, 15 Jan 2020 17:05:01 +0000 (UTC)
Received: from [10.36.117.108] (ovpn-117-108.ams2.redhat.com [10.36.117.108])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id B50C75D9C9;
        Wed, 15 Jan 2020 17:04:58 +0000 (UTC)
Subject: Re: [kvm-unit-tests PATCH v2 14/16] arm/run: Allow Migration tests
To:     Andrew Jones <drjones@redhat.com>
Cc:     eric.auger.pro@gmail.com, maz@kernel.org,
        kvmarm@lists.cs.columbia.edu, kvm@vger.kernel.org,
        qemu-devel@nongnu.org, qemu-arm@nongnu.org, andre.przywara@arm.com,
        peter.maydell@linaro.org, yuzenghui@huawei.com,
        alexandru.elisei@arm.com, thuth@redhat.com
References: <20200110145412.14937-1-eric.auger@redhat.com>
 <20200110145412.14937-15-eric.auger@redhat.com>
 <20200113184055.tu3qqpsc72xqfw6t@kamzik.brq.redhat.com>
From:   Auger Eric <eric.auger@redhat.com>
Message-ID: <58be5530-e8a1-633d-0d69-dd7e9e420138@redhat.com>
Date:   Wed, 15 Jan 2020 18:04:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20200113184055.tu3qqpsc72xqfw6t@kamzik.brq.redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: 2dbDavSN79+b

Hi Drew,
On 1/13/20 7:40 PM, Andrew Jones wrote:
> On Fri, Jan 10, 2020 at 03:54:10PM +0100, Eric Auger wrote:
>> Let's link getchar.o to use puts and getchar from the
>> tests.
>>
>> Then allow tests belonging to the migration group to
>> trigger the migration from the test code by putting
>> "migrate" into the uart. Then the code can wait for the
>> migration completion by using getchar().
>>
>> The __getchar implement is minimalist as it just reads the
>> data register. It is just meant to read the single character
>> emitted at the end of the migration by the runner script.
>>
>> It is not meant to read more data (FIFOs are not enabled).
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> Reviewed-by: Thomas Huth <thuth@redhat.com>
>> ---
>>  arm/Makefile.common |  2 +-
>>  arm/run             |  2 +-
>>  lib/arm/io.c        | 13 +++++++++++++
>>  3 files changed, 15 insertions(+), 2 deletions(-)
>>
>> diff --git a/arm/Makefile.common b/arm/Makefile.common
>> index 7cc0f04..327f112 100644
>> --- a/arm/Makefile.common
>> +++ b/arm/Makefile.common
>> @@ -32,7 +32,7 @@ CFLAGS += -I $(SRCDIR)/lib -I $(SRCDIR)/lib/libfdt -I lib
>>  asm-offsets = lib/$(ARCH)/asm-offsets.h
>>  include $(SRCDIR)/scripts/asm-offsets.mak
>>  
>> -cflatobjs += lib/util.o
>> +cflatobjs += lib/util.o lib/getchar.o
>>  cflatobjs += lib/alloc_phys.o
>>  cflatobjs += lib/alloc_page.o
>>  cflatobjs += lib/vmalloc.o
>> diff --git a/arm/run b/arm/run
>> index 277db9b..a390ca5 100755
>> --- a/arm/run
>> +++ b/arm/run
>> @@ -61,6 +61,6 @@ fi
>>  M+=",accel=$ACCEL"
>>  command="$qemu -nodefaults $M -cpu $processor $chr_testdev $pci_testdev"
>>  command+=" -display none -serial stdio -kernel"
>> -command="$(timeout_cmd) $command"
>> +command="$(migration_cmd) $(timeout_cmd) $command"
>>  
>>  run_qemu $command "$@"
>> diff --git a/lib/arm/io.c b/lib/arm/io.c
>> index 99fd315..ed89e19 100644
>> --- a/lib/arm/io.c
>> +++ b/lib/arm/io.c
>> @@ -87,6 +87,19 @@ void puts(const char *s)
>>  	spin_unlock(&uart_lock);
>>  }
>>  
>> +/*
>> + * Minimalist implementation for migration completion detection.
>> + * Needs to be improved for more advanced Rx cases
> 
> Please add that QEMU supports reading a maximum of 16 characters in
> this minimal mode. We could even add a counter and then assert if
> we try to read 16 or more.
> 
>> + */
>> +int __getchar(void)
>> +{
>> +	int ret;
>> +
>> +	ret = readb(uart0_base);
>> +	if (!ret)
>> +		return -1;
>> +	return ret;
>> +}
> 
> What about taking the lock?
> 
>>  
>>  /*
>>   * Defining halt to take 'code' as an argument guarantees that it will
>> -- 
>> 2.20.1
>>
> 
> What do you think of the __getchar below?
> 
> Thanks,
> drew
> 
> 
> diff --git a/lib/arm/io.c b/lib/arm/io.c
> index 99fd31560084..77beb331d6b2 100644
> --- a/lib/arm/io.c
> +++ b/lib/arm/io.c
> @@ -79,6 +79,31 @@ void io_init(void)
>  	chr_testdev_init();
>  }
>  
> +static int ____getchar(void)
> +{
> +	int c;
> +
> +	spin_lock(&uart_lock);
> +	c = readb(uart0_base);
> +	spin_unlock(&uart_lock);
> +
> +	return c ?: -1;
> +}
> +
> +int __getchar(void)
> +{
> +	static int count;
> +	int c;
> +
> +	if ((c = ____getchar()) != -1)
> +		++count;
> +
> +	/* Without special UART initialization we can only read 16 characters. */
> +	assert(count < 16);
> +
> +	return c;
> +}
> +
>  void puts(const char *s)
>  {
>  	spin_lock(&uart_lock);
> 
Yep, I will take your improved version.

Thanks

Eric
