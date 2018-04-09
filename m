Received: by 10.28.71.155 with SMTP id m27csp2765362wmi;
        Mon, 9 Apr 2018 09:42:34 -0700 (PDT)
X-Google-Smtp-Source: AIpwx48WyucscYfppPW4J9zvnNgZJ1Sr2Vf/um+QuxPame441zEE1auyUCbHv+W1QuciL7amP2sD
X-Received: by 10.55.155.138 with SMTP id d132mr35773470qke.247.1523292154326;
        Mon, 09 Apr 2018 09:42:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523292154; cv=none;
        d=google.com; s=arc-20160816;
        b=b3vN3rIdOcvW3cv3neZgdtEFKUiZmWcuwer57ozQjI6fACqlFA99QVjOxeykafJVBL
         RPyHi7irQ9H/Py8dMRSLPWbdT79CKKL2ZGLt4VPjLddDsWvZ2apMXSj+ptjvEr5QJRvE
         MTQuRsWSe09tv/amRW0RZpUyyXpuIrNDQBqj4l7KdhG6ONgw8jXezugcMbk6Y4BzftsK
         4+DPo6TxQULI+jaV1XAe+UomnZpE83BmtaXZW8BHggP6aBqhwTMFkKmFBAXJPh2fUlhx
         63BSlSl2z7fwLR6hacbCK9UHb6TP5PESzjR57LEybW4GyfJd4TM5FLPOvWlOOUwtFg/Q
         Lolg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=laXHiLXX2EXJA/72wItq2rUNv7Wctxps1citO8QnuoU=;
        b=m+s//cEdvZ81jfXX6Dunuu8CJDEjsF/zW1VmpBXr9+GChaqyYltMf0HxZm/tf6ytct
         QWRCKHggk4Qe+NX3fDEip6bO7cC/fHUtUCgmqTc8C26X+m4xXxB6gy3orMUFbompQTd2
         z3Htd+JPaawz+rkZ2bwejNdAgQrj1UMmGdBPsv/XHDDuqor+M5XiHVJ/CfkBGUFA4Uou
         5K2LX9NqSmRSShjMyiW8KE/mIFEmVCdPn8uuAatDfLDOZ09HCHhndInrV3N/2XfysB1P
         HeMpFeLEjndNiwKq649tHl7pHgxQUmM0Ks+Acad2rCXVltUEnhJbdscjse4Q5ICnBwbr
         uIxw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q34si123825qtg.163.2018.04.09.09.42.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 09 Apr 2018 09:42:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51219 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f5ZsH-00049e-R6
	for alex.bennee@linaro.org; Mon, 09 Apr 2018 12:42:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42016)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1f5Zs6-00048r-Da
	for qemu-arm@nongnu.org; Mon, 09 Apr 2018 12:42:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1f5Zs4-0000y3-8P
	for qemu-arm@nongnu.org; Mon, 09 Apr 2018 12:42:22 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:46976 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <wei@redhat.com>)
	id 1f5Zs4-0000xv-2R; Mon, 09 Apr 2018 12:42:20 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 92BDBEBFF0;
	Mon,  9 Apr 2018 16:42:19 +0000 (UTC)
Received: from [10.10.120.209] (ovpn-120-209.rdu2.redhat.com [10.10.120.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 39A4E202699A;
	Mon,  9 Apr 2018 16:42:19 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20180409154921.29906-1-wei@redhat.com>
	<CAFEAcA9Law6n+2bGwd4-VkAJ1HT10c0ZqHASmtLdHcTFV9YBHw@mail.gmail.com>
From: Wei Huang <wei@redhat.com>
Message-ID: <1d96c98e-3836-d05f-1dd1-259e89d02c18@redhat.com>
Date: Mon, 9 Apr 2018 11:42:17 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9Law6n+2bGwd4-VkAJ1HT10c0ZqHASmtLdHcTFV9YBHw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Mon, 09 Apr 2018 16:42:19 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Mon, 09 Apr 2018 16:42:19 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'wei@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 1/1] mach-virt: Change default
 cpu and gic-version setting to "max"
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
Cc: Andrew Jones <drjones@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Andrea Bolognani <abologna@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZQU/bETslcj2



On 04/09/2018 10:55 AM, Peter Maydell wrote:
> On 9 April 2018 at 16:49, Wei Huang <wei@redhat.com> wrote:
>> Running mach-virt machine types (i.e. "-M virt") on different systems can
>> result in various misleading warnings if -cpu and/or gic-version not specified.
>> For KVM, this can be solved mostly by using "host" type. But the "host" type
>> doesn't work for TCG. Compared with "host", the "max" type not only supports
>> auto detection under KVM mode, but also works with TCG.
>> So this patch set "max" as the default types for both -cpu and gic-version.
> 
> Using "max" will make the VM not migratable by default, and also
> means that the behaviour might differ between host machines and
> between different QEMU versions. I'm not sure we want that for the
> default ?

Understood. If you think the -cpu shouldn't be changed due to the
reasons list above, we should at lease give a better warning message
when cpu doesn't match. Right now, the error msg is something like
"kvm_init_vcpu failed, ...".

Secondly, how about gic-version part? Should we use "max" as the default
gic-version?

> 
>> Signed-off-by: Wei Huang <wei@redhat.com>
>> ---
>>  hw/arm/virt.c | 10 +++++-----
>>  1 file changed, 5 insertions(+), 5 deletions(-)
>>
>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>> index 94dcb125d3..1a9d68b8d5 100644
>> --- a/hw/arm/virt.c
>> +++ b/hw/arm/virt.c
>> @@ -1555,7 +1555,7 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
>>      mc->minimum_page_bits = 12;
>>      mc->possible_cpu_arch_ids = virt_possible_cpu_arch_ids;
>>      mc->cpu_index_to_instance_props = virt_cpu_index_to_props;
>> -    mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-a15");
>> +    mc->default_cpu_type = ARM_CPU_TYPE_NAME("max");
>>      mc->get_default_cpu_node_id = virt_get_default_cpu_node_id;
>>  }
>>
>> @@ -1609,13 +1609,13 @@ static void virt_2_12_instance_init(Object *obj)
>>                                      "Set on/off to enable/disable using "
>>                                      "physical address space above 32 bits",
>>                                      NULL);
>> -    /* Default GIC type is v2 */
>> -    vms->gic_version = 2;
>> +    /* Default GIC type is max */
>> +    vms->gic_version = -1;
>>      object_property_add_str(obj, "gic-version", virt_get_gic_version,
>>                          virt_set_gic_version, NULL);
>>      object_property_set_description(obj, "gic-version",
>> -                                    "Set GIC version. "
>> -                                    "Valid values are 2, 3 and host", NULL);
>> +                                    "Set GIC version. Valid values are 2, 3, "
>> +                                    "host, and max", NULL);
> 
> This change in the help string is a bug fix not related to the
> rest of the patch. You should send that as a separate patch,
> because we want that regardless of what we do about the default
> value.
> 
> thanks
> -- PMM
> 
