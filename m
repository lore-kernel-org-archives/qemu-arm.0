Received: by 10.80.163.71 with SMTP id 65csp1528494edn;
        Wed, 14 Sep 2016 08:10:23 -0700 (PDT)
X-Received: by 10.237.60.44 with SMTP id t41mr3631150qte.102.1473865823809;
        Wed, 14 Sep 2016 08:10:23 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id s127si3296663qkc.40.2016.09.14.08.10.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 14 Sep 2016 08:10:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:56701 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bkBpP-0002ve-88
	for alex.bennee@linaro.org; Wed, 14 Sep 2016 11:10:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47867)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1bkBoQ-00028Q-8J
	for qemu-arm@nongnu.org; Wed, 14 Sep 2016 11:09:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1bkBoI-0002c9-Pb
	for qemu-arm@nongnu.org; Wed, 14 Sep 2016 11:09:21 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35650)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wei@redhat.com>)
	id 1bkBoI-0002bx-Hn; Wed, 14 Sep 2016 11:09:14 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 332BA3F723;
	Wed, 14 Sep 2016 15:09:14 +0000 (UTC)
Received: from [10.10.50.167] (unused [10.10.50.167] (may be forged))
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u8EF9C4a009446; Wed, 14 Sep 2016 11:09:13 -0400
To: Andrew Jones <drjones@redhat.com>
References: <1473833343-31531-1-git-send-email-wei@redhat.com>
	<1473833343-31531-3-git-send-email-wei@redhat.com>
	<20160914083719.u63mw2myf3xza3wf@hawk.localdomain>
From: Wei Huang <wei@redhat.com>
Message-ID: <79c5aee6-01bb-c974-7b9d-3d38a7f4bdc7@redhat.com>
Date: Wed, 14 Sep 2016 10:09:12 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <20160914083719.u63mw2myf3xza3wf@hawk.localdomain>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Wed, 14 Sep 2016 15:09:14 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH V2 2/2] arm: virt: add PMU
 property to machvirt machine type
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
Cc: peter.maydell@linaro.org, shannon.zhao@linaro.org, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, abologna@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iPznZqm0wp5x



On 09/14/2016 03:37 AM, Andrew Jones wrote:
> On Wed, Sep 14, 2016 at 02:09:03AM -0400, Wei Huang wrote:
>> CPU vPMU is now turned off by default, but it was ON in virt-2.7
>> machine type. To solve this problem, this patch adds a PMU option
>> in machine state, which is used to control CPU's vPMU status. This
>> PMU option is not exposed to command line and is turned on in
>> virt-2.7 machine type to make sure it is backward compatible.
>>
>> Signed-off-by: Wei Huang <wei@redhat.com>
>> ---
>>  hw/arm/virt.c | 12 ++++++++++++
>>  1 file changed, 12 insertions(+)
>>
>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>> index a781ad0..83cfea7 100644
>> --- a/hw/arm/virt.c
>> +++ b/hw/arm/virt.c
>> @@ -91,6 +91,7 @@ typedef struct {
>>      bool secure;
>>      bool highmem;
>>      int32_t gic_version;
>> +    bool pmu;
>>  } VirtMachineState;
> 
> The compat bool doesn't need to be in machine state, so it should
> be in the class. See 'disallow_affinity_adjustment' in VirtMachineClass
> for an example of a adding a compat bool for a different reason. Also,
> I'd name it something like pmu_default_on.

This should be an easy fix.

> 
>>  
>>  #define TYPE_VIRT_MACHINE   MACHINE_TYPE_NAME("virt")
>> @@ -1317,6 +1318,11 @@ static void machvirt_init(MachineState *machine)
>>              }
>>          }
>>  
>> +        if (vms->pmu) {
>> +            /* Note: the property name is "pmu", not "has_pmu" */
> 
> The comment is unnecessary. Please remove.
> 

I might still say something here. :-) The reason is the confusion of
"pmu" as a command line property and "has_pmu" as a property of ARMCPU.
Most other properties use the same naming, so they are OK. But PMU, due
to naming difference, did cause trouble for me and took a while to debug.

>> +            object_property_set_bool(cpuobj, true, "pmu", NULL);
>> +        }
>> +
>>          if (object_property_find(cpuobj, "reset-cbar", NULL)) {
>>              object_property_set_int(cpuobj, vbi->memmap[VIRT_CPUPERIPHS].base,
>>                                      "reset-cbar", &error_abort);
>> @@ -1510,6 +1516,8 @@ static void virt_2_7_instance_init(Object *obj)
>>      object_property_set_description(obj, "gic-version",
>>                                      "Set GIC version. "
>>                                      "Valid values are 2, 3 and host", NULL);
>> +    /* Default PMU is on for 2.7 */
> 
> This comment is unnecessary. Please remove.

OK

> 
>> +    vms->pmu = true;
>>  }
>>  
>>  static void virt_machine_2_7_options(MachineClass *mc)
>> @@ -1522,7 +1530,11 @@ DEFINE_VIRT_MACHINE_AS_LATEST(2, 7)
>>  
>>  static void virt_2_6_instance_init(Object *obj)
>>  {
>> +    VirtMachineState *vms = VIRT_MACHINE(obj);
>> +
>>      virt_2_7_instance_init(obj);
>> +    /* Default PMU is off for 2.6 */
>> +    vms->pmu = false;
> 
> You shouldn't need to touch 2.6 code. The compat bool is false
> by default (BSS init), which is the correct value for every
> machine type, except the 2.7 machine type.

I will fix the comments, using the next email from you.

> 
>>  }
>>  
>>  static void virt_machine_2_6_options(MachineClass *mc)
>> -- 
>> 1.8.3.1
>>
>>
> 
> Thanks,
> drew
> 
