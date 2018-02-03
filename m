Received: by 10.28.71.27 with SMTP id u27csp344839wma;
        Sat, 3 Feb 2018 00:42:20 -0800 (PST)
X-Google-Smtp-Source: AH8x227u5GJk1HCUbgB1Wc1RjvUnzwvE6ORS8uY5Ut3PjuelMFhnQJzBX3zNO5j6ldvI3xEntbL0
X-Received: by 10.129.73.142 with SMTP id w136mr28395008ywa.437.1517647340676;
        Sat, 03 Feb 2018 00:42:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1517647340; cv=none;
        d=google.com; s=arc-20160816;
        b=lH0l0cif4LcDHEfzoyUY3RSPz3o+o+85q/UKlah0LVa9YI69gecpZ4MOP//8cfjJxN
         VrnvHM8r5uKdQy/q+3EInjnNGVb/j+KyB7VCH5EJAb0Opcc9iI2e0HDAkf7OOCm8+XeG
         vfQ5UxKZVti2g5XiJhMJld+9PQWXf9W4vDBns+c/vAfg19fiv9W+j6pz/0KVm89zV8QE
         azW/unqYImHefElBkOUYxiesgUbDX4pK6QO5FjIo2lIImhwI3dvuXZ8vUx64LVAFczzZ
         9H95kM57TQNS78vfkMW+rgte7s1EXQlHU7ionPfyYX1RbIA5/YsHOUMD2RkzMZnXLMah
         uiXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:user-agent
         :message-id:in-reply-to:date:references:to:from
         :arc-authentication-results;
        bh=nB56u+pJsxeNHGy9KSijXxFfr6Fxnvsny1tidi0/en0=;
        b=fQcFR83unZey0UU1lUm/onJ7Jk99a00956M8VOP0Ime5K4AFRP3AAFtKGbEQhhWYyR
         xG1481IZ2NoDQACZspVkz/pS5FYMGkCq/43BYEMBBiTzKTMmC3Hyg0hihs/UP58oZSAm
         gWfpMUJdsXHv1wIO21HZAko3bEt4zKvuYoGckDguTztLg5szFt2MsdpdQFZwRSogxa4X
         mSaZkSAiiqueZNnAkAdiMrqmXSR3cRkbTrU0ijBV8QEMqmBQKWMhuBiyjCrhLmHO159S
         jUMtNzDSmHoBf5mZ8X3u2OSBc7IB7bZ9uQlxc5k+wipTKh8D0Bf5JjfUmWXTTSsR7XuV
         gAXg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k6si766859ywl.208.2018.02.03.00.42.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 03 Feb 2018 00:42:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59203 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ehtOu-00011T-36
	for alex.bennee@linaro.org; Sat, 03 Feb 2018 03:42:20 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58337)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1ehtOk-0000yk-KZ
	for qemu-arm@nongnu.org; Sat, 03 Feb 2018 03:42:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1ehtOh-00088K-Dm
	for qemu-arm@nongnu.org; Sat, 03 Feb 2018 03:42:10 -0500
Received: from mx1.redhat.com ([209.132.183.28]:35098)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1ehtOh-000886-7i; Sat, 03 Feb 2018 03:42:07 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 53E8B81DF5;
	Sat,  3 Feb 2018 08:42:06 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-148.ams2.redhat.com
	[10.36.116.148])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0D2BE6BF55;
	Sat,  3 Feb 2018 08:42:05 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 75E251138645; Sat,  3 Feb 2018 09:42:04 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Eric Blake <eblake@redhat.com>
References: <20180202183731.29990-1-armbru@redhat.com>
	<20180202183731.29990-3-armbru@redhat.com>
	<11be568a-8c6d-3d45-8c32-dc41ea70c352@redhat.com>
Date: Sat, 03 Feb 2018 09:42:04 +0100
In-Reply-To: <11be568a-8c6d-3d45-8c32-dc41ea70c352@redhat.com> (Eric Blake's
	message of "Fri, 2 Feb 2018 13:35:52 -0600")
Message-ID: <87h8qy5usj.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Sat, 03 Feb 2018 08:42:06 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v7 02/15] hw/arm: Replace
 fprintf(stderr, "*\n" with error_report()
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, alistair.francis@xilinx.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oWHLkLyZ9DCb

Eric Blake <eblake@redhat.com> writes:

> On 02/02/2018 12:37 PM, Markus Armbruster wrote:
>> From: Alistair Francis <alistair.francis@xilinx.com>
>> 
>> Replace a large number of the fprintf(stderr, "*\n" calls with
>> error_report(). The functions were renamed with these commands and then
>> compiler issues where manually fixed.
>> 
>
>> 
>> Some lines where then manually tweaked to pass checkpatch.
>> 
>> The 'qemu: ' prefix was manually removed from the hw/arm/boot.c file.
>> 
>> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
>> Cc: qemu-arm@nongnu.org
>> 
>> Conversions that aren't followed by exit() dropped, because they might
>> be inappropriate.
>> 
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> ---
>
>> +++ b/hw/arm/gumstix.c
>> @@ -35,6 +35,7 @@
>>   */
>>  
>>  #include "qemu/osdep.h"
>> +#include "qemu/error-report.h"
>>  #include "hw/hw.h"
>>  #include "hw/arm/pxa.h"
>>  #include "net/net.h"
>> @@ -62,8 +63,8 @@ static void connex_init(MachineState *machine)
>>  
>>      dinfo = drive_get(IF_PFLASH, 0, 0);
>>      if (!dinfo && !qtest_enabled()) {
>> -        fprintf(stderr, "A flash image must be given with the "
>> -                "'pflash' parameter\n");
>> +        error_report("A flash image must be given with the "
>> +                     "'pflash' parameter");
>>          exit(1);
>>      }
>>  
>> @@ -76,7 +77,7 @@ static void connex_init(MachineState *machine)
>>                                 dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
>>                                 sector_len, connex_rom / sector_len,
>>                                 2, 0, 0, 0, 0, be)) {
>> -        fprintf(stderr, "qemu: Error registering flash memory.\n");
>> +        error_report("Error registering flash memory.");
>
> Do we care about consistency on trailing dots in these conversions?

Good opportunity to get rid of trailing punctuation in converted error
messages.

> At any rate, all of these are sane rewrites of existing patterns;
> Reviewed-by: Eric Blake <eblake@redhat.com>

Thanks!
