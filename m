Received: by 10.223.159.74 with SMTP id f10csp2507501wrg;
        Fri, 22 Dec 2017 09:17:57 -0800 (PST)
X-Google-Smtp-Source: ACJfBovJgyDjkvB+3sdVYB7ytPNHSrQyfDyyXWXmpxF1LL42khcvoCAKvFHQOlckkr8oE2Y60nNo
X-Received: by 10.129.242.5 with SMTP id i5mr11207849ywm.71.1513963077708;
        Fri, 22 Dec 2017 09:17:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513963077; cv=none;
        d=google.com; s=arc-20160816;
        b=voS1QZJReKKuly/EN6mpOeLYz+tGLwjbM2QO+IFt6vPTo8cooN3fIkVPM6boaRgVcr
         cCn91LPb2b19hlH9TdvcJeW8AwYPgSdkD17YrtLhe4dVHVmYeBdcVGGMJFuFGmxoPp/z
         k5/FQulIh0JRNK2XFgT/SkgNDzZxKwC/IGtsDQoehtsrMNIXjcNoo63YlxBP+aWlcCSJ
         N2mMh7Pbx4FLP4/AhQieFWESxfXQz+UkL9ITQqmdtTtPuolPe1fjJ0l67745xPl5D3kJ
         7mm/5E/vHUKGLNUgCDk4pOo4WH/rt11JSjqNgoMYW5rGTcxRmVY7iRMkjMYHIt1EEi++
         IVVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=TplriHPFy8QgtByhfIobddN4KZNeQhI/95sVfNPxpeE=;
        b=ojzrSbJeAw38cjd88D2XkMfAzFUWXs5arg1aN6xn9eukIsEw/hjcEWEO8xIjRjzXLY
         kpyQ8PwT6KToy+67HfSFLUXGslDikJD2oKIGzYDGE9B5eNbXpteKlJzKwwPQa8tNgQXh
         jbIkFDnDS3Q6VDqazo1dDzdHELGW3+RJRYzEz/tvr11WzgHjpOa/uuMnPrKRpAdriUJZ
         WsFtu7VUS2J2rGcIApvgF/AQ4f4qtr7OtaBDmTu4AFl+O65cjGFTNsy5V+sI8FpLF1Rr
         pXbKYANU/xt0P8ySHNIoENgrPqPTGYY8EZonPoyEmHQ2ovooxjV0MnfoFZAmqdblAYPg
         mqWg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g203si4308746ywe.421.2017.12.22.09.17.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Dec 2017 09:17:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58897 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eSQxJ-0007M6-2q
	for alex.bennee@linaro.org; Fri, 22 Dec 2017 12:17:57 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39697)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1eSQx6-0007LX-H3
	for qemu-arm@nongnu.org; Fri, 22 Dec 2017 12:17:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1eSQx2-0007ZQ-HU
	for qemu-arm@nongnu.org; Fri, 22 Dec 2017 12:17:44 -0500
Received: from mx1.redhat.com ([209.132.183.28]:47148)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1eSQx2-0007YH-84; Fri, 22 Dec 2017 12:17:40 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 73EFBC05972A;
	Fri, 22 Dec 2017 17:17:38 +0000 (UTC)
Received: from [10.36.116.46] (ovpn-116-46.ams2.redhat.com [10.36.116.46])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F00E5627D8;
	Fri, 22 Dec 2017 17:17:35 +0000 (UTC)
To: Markus Armbruster <armbru@redhat.com>,
	Alistair Francis <alistair.francis@xilinx.com>
References: <cover.1513790494.git.alistair.francis@xilinx.com>
	<6bad4084f4cbc290e2e9f1a72fcfcda7223383ec.1513790495.git.alistair.francis@xilinx.com>
	<87lghulqno.fsf@dusky.pond.sub.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <1cfb1217-e32d-8e91-da46-07f1c72be77f@redhat.com>
Date: Fri, 22 Dec 2017 18:17:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <87lghulqno.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Fri, 22 Dec 2017 17:17:38 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v6 04/29] hw/arm: Replace
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
Cc: qemu-trivial@nongnu.org, alistair23@gmail.com, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BAS4BE9drb/+

On 22.12.2017 16:37, Markus Armbruster wrote:
> Second thoughts...
> 
> Alistair Francis <alistair.francis@xilinx.com> writes:
[...]
>>  #include "qemu/osdep.h"
>> +#include "qemu/error-report.h"
>>  #include "qapi/error.h"
>>  #include "qemu-common.h"
>>  #include "cpu.h"
>> @@ -1311,8 +1312,8 @@ static void omap_prcm_apll_update(struct omap_prcm_s *s)
>>      /* TODO: update clocks */
>>  
>>      if (mode[0] == 1 || mode[0] == 2 || mode[1] == 1 || mode[1] == 2)
>> -        fprintf(stderr, "%s: bad EN_54M_PLL or bad EN_96M_PLL\n",
>> -                        __func__);
>> +        error_report("%s: bad EN_54M_PLL or bad EN_96M_PLL",
>> +                     __func__);
>>  }
> 
> This one's different: we neither exit() nor return a "failed" status to
> the caller.
> 
> We get here when the guest writes something funny to a certain
> memory-mapped I/O register.  In other words, it's guest misbehavior, not
> a user error.  I doubt it should be reported with error_report().
> Peter, do we have a canonical way to report or log  guest misbehavior?

qemu_log_mask(LOG_GUEST_ERROR, ...) ?

 Thomas


