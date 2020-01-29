Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp348136lfp;
        Wed, 29 Jan 2020 01:30:05 -0800 (PST)
X-Google-Smtp-Source: APXvYqzMX0n0qI/G8D9FEQkeNgO7LPwx3/rULjg/nUuqtgjeaPv8rjQ3ATazp/UJPfIhTDGMoA8u
X-Received: by 2002:aca:b7c5:: with SMTP id h188mr5912192oif.100.1580290205004;
        Wed, 29 Jan 2020 01:30:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580290205; cv=none;
        d=google.com; s=arc-20160816;
        b=Evqa/buA0KXaXkHvwj7u5eFYxF61MxiVdLWN4T8WYzTlPH8QFV71/tjjtz27Qe5s5Q
         Nhf3wRpO9zr2Bz3yXf5DfG0JIQuBn3XDz8walTWtRhkGHNnwPXPzud4S5CwvjnrYaEcv
         /Mf8M+FNYyVjrGtSeLcOMlJ85uDkypVWehD8qg00PbRH9zDJx4fjvukiFzt1fHBHqyMq
         PVBpxjT8v34/k3Tl+LwUZuw3KOzEGWVmF3THOrwFhiW38JNhu40/jN8oDFCKzjwK2rZ4
         YytYnKPwCs90XE1/etYd5PqloCgG2kYlsKCwgrn3ZNSTR+ogK2AlhSxyncK4qq4JdvKX
         FUxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:dkim-signature;
        bh=D9f7QdvFboxwQ5TVJWf6be3JYQu7wrZQ2uymnn5sFPo=;
        b=oVr3mosaqjdmpI5RUjwAtHMLZvldEbNkUOUbFCAbzhks/p30Asyy/ljJRpp/Xa1FPF
         EL1ibE6lidZb23smzZmflKfMOvg4osqWsW4avsvRKUbTpTwzyhbd4FFdLDZrtCQ3TatR
         ij/s+LADOPsYkKODiQqXOVWsTKZQB++utVCZ0B3eduMm8b6FKGje1z7HeHKPrvD5DPSI
         /rY7M6qtHzE0cj7OLA0/pHVnCQGKx8gJWHUPBy0pFs83WxfBlGS2EBhYFkFgmys5F7Jc
         d+76AvpZDGOwcW+tZC4aqpdK/k4m8smjwGaWwiviGUe9ESRaHrNU+n9muf5ix4kcsneH
         mKWw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FeNptHl7;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id d5si760491oij.139.2020.01.29.01.30.04;
        Wed, 29 Jan 2020 01:30:04 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FeNptHl7;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726154AbgA2JaE (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Wed, 29 Jan 2020 04:30:04 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:36438 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726010AbgA2JaD (ORCPT
        <rfc822;kvm@vger.kernel.org>); Wed, 29 Jan 2020 04:30:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1580290203;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=D9f7QdvFboxwQ5TVJWf6be3JYQu7wrZQ2uymnn5sFPo=;
        b=FeNptHl7bDqh5sTDJKNjgkQU+v0bjjlhcOR8OGRFZjrVh1zXPI3AoAVTcjHqWDXob5Grss
        FOYMtvVaBTYKIktYSlIYMx0c0u82BFnLuSvzrQ1VEDmY4UDLYHpGLzSu3DHsgeQz8FRDf9
        ylxx4IfgW6yCVq8d+DWXIRS1voNqS3k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-164-eI79hYDfNj62FSq7pKOfoA-1; Wed, 29 Jan 2020 04:29:55 -0500
X-MC-Unique: eI79hYDfNj62FSq7pKOfoA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0DF45800D41;
        Wed, 29 Jan 2020 09:29:53 +0000 (UTC)
Received: from [10.36.116.37] (ovpn-116-37.ams2.redhat.com [10.36.116.37])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 1095D60BE0;
        Wed, 29 Jan 2020 09:29:47 +0000 (UTC)
Subject: Re: [kvm-unit-tests PATCH v3 12/14] arm/run: Allow Migration tests
To:     Thomas Huth <thuth@redhat.com>, eric.auger.pro@gmail.com,
        maz@kernel.org, kvmarm@lists.cs.columbia.edu, kvm@vger.kernel.org,
        qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc:     drjones@redhat.com, andre.przywara@arm.com,
        peter.maydell@linaro.org, yuzenghui@huawei.com,
        alexandru.elisei@arm.com
References: <20200128103459.19413-1-eric.auger@redhat.com>
 <20200128103459.19413-13-eric.auger@redhat.com>
 <3962373a-0e03-5ab9-30cc-3b385fc55702@redhat.com>
From:   Auger Eric <eric.auger@redhat.com>
Message-ID: <c00b26e8-5197-a977-963e-b0b9366ad6d0@redhat.com>
Date:   Wed, 29 Jan 2020 10:29:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <3962373a-0e03-5ab9-30cc-3b385fc55702@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: lKFy6H9z/fK6

Hi Thomas,

On 1/29/20 9:07 AM, Thomas Huth wrote:
> On 28/01/2020 11.34, Eric Auger wrote:
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
>>
>> ---
>>
>> v2 -> v3:
>> - take the lock
>> - assert if more than 16 chars
>> - removed Thomas' R-b
>> ---
>>  arm/Makefile.common |  2 +-
>>  arm/run             |  2 +-
>>  lib/arm/io.c        | 28 ++++++++++++++++++++++++++++
>>  3 files changed, 30 insertions(+), 2 deletions(-)
>>
>> diff --git a/arm/Makefile.common b/arm/Makefile.common
>> index b8988f2..a123e85 100644
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
>> index 99fd315..d8e7745 100644
>> --- a/lib/arm/io.c
>> +++ b/lib/arm/io.c
>> @@ -87,6 +87,34 @@ void puts(const char *s)
>>  	spin_unlock(&uart_lock);
>>  }
>>  
>> +static int ____getchar(void)
> 
> Three underscores? ... that's quite a lot already. I'd maybe rather name
> the function "do_getchar" or something similar instead. Or simply merge
> the code into the __getchar function below - it's just three lines.
OK
> 
>> +{
>> +	int c;
>> +
>> +	spin_lock(&uart_lock);
>> +	c = readb(uart0_base);
>> +	spin_unlock(&uart_lock);
>> +
>> +	return c ? : -1;
> 
> Just a matter of taste, but I prefer the elvis operator without space in
> between.
OK
> 
>> +}
>> +
>> +/*
>> + * Minimalist implementation for migration completion detection.
>> + * Without FIFOs enabled on the QEMU UART device we just read
>> + * the data register: we cannot read more than 16 characters.
> 
> Where are the 16 bytes buffered if FIFOs are disabled?
I think this is in the PL011 data register (UARTDR), 4 words.
https://developer.arm.com/docs/ddi0183/latest/programmers-model/register-descriptions/data-register-uartdr

> 
>> + */
>> +int __getchar(void)
>> +{
>> +	int c = ____getchar();
>> +	static int count;
>> +
>> +	if (c != -1)
>> +		++count;
>> +
>> +	assert(count < 16);
>> +
>> +	return c;
>> +}
> 
> The above comments were only nits ... feel free to ignore them if you
> don't want to respin the series just because of this.
No Problem. Thank you for your time.

Thanks

Eric
> 
>  Thomas
> 
