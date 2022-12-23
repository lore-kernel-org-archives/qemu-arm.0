Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp548558ejb;
        Fri, 23 Dec 2022 08:38:56 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvm3lUhOsVkNprX1k1P3h4e12Lsy6Z8sTF7tXPjN7okjaKbXvD/3J/1ZJJmudUvfWfirwj+
X-Received: by 2002:a05:6214:28b:b0:52e:c439:c3dc with SMTP id l11-20020a056214028b00b0052ec439c3dcmr3821952qvv.5.1671813535903;
        Fri, 23 Dec 2022 08:38:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671813535; cv=none;
        d=google.com; s=arc-20160816;
        b=Nlrv2FJgx4rBq8w3PHnaF8PMHiZfMN1Mg8/lKJpF4LtmPPLwuo4MoSAuTaqNbVIsJe
         Oga2DyQos/MwrkPKR+8YNk8mgIZMZTtbwXjtMQ7Nsdp+PchNz/Rg+XcisYuanz8zayFo
         h21xSeKW3uXtLEnCtoFbNAoYzM1xc0lXBsw8BHNwF7/ibBJrRCKNQqYTEW5AYYzSe+qJ
         fKwqu1/jOxVmfm/5pgoOTDWIl79NQ75JSG8nNEl6LfF6151DrTN8nxyga5dMt3Yivbup
         iYTC1bQFrvCc1oqfdAvhwf8pQrb6pe1xwFXWbrAu4YiGcc8RchcEwIksCfBEXZ/wmCFo
         9mXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=Uhg6aTdNMA8S4RpoahMJcLmPdTR01zFJ/TM3P6I8Mak=;
        b=0gSTXzGGO3uWZwIARkzI79kplDun1Az9WJildD7EuhtgoWZNmDcB0pG5B8r8eS7haq
         63meMUEk1dyiDurJg2IPXKf8k9nrnXgqkzEX1p17g9ddhaAFWFJK5/JiaDV5fWbpE9xs
         fuEYGK/IE7NZYnTd9EH69hUOc8DG9RsQ3P27ail2uSrM9UZ6oS3ID7lIlt5BJyywoVrc
         BrHyvyPh4e+FENY6MwieMrCXlgYKz99Z86HJGmdTht6z6kV7mpil2NmDWxVF99NlDFv9
         X1VBh7kUwzuAtAiXebyK4RnV9XnYbBeMKeosiep6ZXidKWSKwLcq6ra5dxj7wJV+FovD
         QrCA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jf6-20020a0562142a4600b004b17ac12d33si1344663qvb.247.2022.12.23.08.38.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Dec 2022 08:38:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1p8l3P-0005D0-4q; Fri, 23 Dec 2022 11:37:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1p8l3N-0005Cn-T8; Fri, 23 Dec 2022 11:37:50 -0500
Received: from mail.csgraf.de ([85.25.223.15] helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1p8l3L-0004Xk-PQ; Fri, 23 Dec 2022 11:37:49 -0500
Received: from [192.168.106.118]
 (dynamic-095-118-065-151.95.118.pool.telefonica.de [95.118.65.151])
 by csgraf.de (Postfix) with ESMTPSA id B196E6080584;
 Fri, 23 Dec 2022 17:37:44 +0100 (CET)
Message-ID: <94c1de49-c028-3368-f980-a6908049dca9@csgraf.de>
Date: Fri, 23 Dec 2022 17:37:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.0
Subject: Re: [PATCH v3 1/2] hw/arm/virt: Consolidate GIC finalize logic
Content-Language: en-US
To: Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Zenghui Yu <yuzenghui@huawei.com>, Eric Auger <eric.auger@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
References: <20221223090107.98888-1-agraf@csgraf.de>
 <20221223090107.98888-2-agraf@csgraf.de> <87mt7expy4.fsf@redhat.com>
From: Alexander Graf <agraf@csgraf.de>
In-Reply-To: <87mt7expy4.fsf@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=85.25.223.15; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.148,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: XhO8FCU5neh1

Hey Cornelia,

On 23.12.22 13:30, Cornelia Huck wrote:
> On Fri, Dec 23 2022, Alexander Graf <agraf@csgraf.de> wrote:
>
>> Up to now, the finalize_gic_version() code open coded what is essentially
>> a support bitmap match between host/emulation environment and desired
>> target GIC type.
>>
>> This open coding leads to undesirable side effects. For example, a VM with
>> KVM and -smp 10 will automatically choose GICv3 while the same command
>> line with TCG will stay on GICv2 and fail the launch.
>>
>> This patch combines the TCG and KVM matching code paths by making
>> everything a 2 pass process. First, we determine which GIC versions the
>> current environment is able to support, then we go through a single
>> state machine to determine which target GIC mode that means for us.
>>
>> After this patch, the only user noticable changes should be consolidated
>> error messages as well as TCG -M virt supporting -smp > 8 automatically.
>>
>> Signed-off-by: Alexander Graf <agraf@csgraf.de>
>>
>> ---
>>
>> v1 -> v2:
>>
>>    - Leave VIRT_GIC_VERSION defines intact, we need them for MADT generation
>>
>> v2 -> v3:
>>
>>    - Fix comment
>>    - Flip kvm-enabled logic for host around
>> ---
>>   hw/arm/virt.c         | 198 ++++++++++++++++++++++--------------------
>>   include/hw/arm/virt.h |  15 ++--
>>   2 files changed, 112 insertions(+), 101 deletions(-)
>>
>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>> index ea2413a0ba..6d27f044fe 100644
>> --- a/hw/arm/virt.c
>> +++ b/hw/arm/virt.c
>> @@ -1820,6 +1820,84 @@ static void virt_set_memmap(VirtMachineState *vms, int pa_bits)
>>       }
>>   }
>>   
>> +static VirtGICType finalize_gic_version_do(const char *accel_name,
>> +                                           VirtGICType gic_version,
>> +                                           int gics_supported,
>> +                                           unsigned int max_cpus)
>> +{
>> +    /* Convert host/max/nosel to GIC version number */
>> +    switch (gic_version) {
>> +    case VIRT_GIC_VERSION_HOST:
>> +        if (!kvm_enabled()) {
>> +            error_report("gic-version=host requires KVM");
>> +            exit(1);
>> +        }
>> +
>> +        /* For KVM, gic-version=host means gic-version=max */
>> +        return finalize_gic_version_do(accel_name, VIRT_GIC_VERSION_MAX,
>> +                                       gics_supported, max_cpus);
> I think I'd still rather use /* fallthrough */ here, but let's leave
> that decision to the maintainers.


I originally had a fallthrough here, then looked at the code and 
concluded for myself that I dislike fallthroughs :). They make more 
complicated code flows insanely complicated and are super error prone.

> In any case,
>
> Reviewed-by: Cornelia Huck <cohuck@redhat.com>
>
> [As an aside, we have a QEMU_FALLTHROUGH #define that maps to
> __attribute__((fallthrough)) if available, but unlike the Linux kernel,
> we didn't bother to convert everything to use it in QEMU. Should we?
> Would using the attribute give us some extra benefits?]


IMHO we're be better off just refactoring code in ways that don't 
require fall-throughs. Modern compilers inline functions pretty well, so 
I think there's very little reason for them anymore.

Thanks a lot for the reviews!


Alex


