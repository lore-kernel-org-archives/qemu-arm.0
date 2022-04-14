Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp492958lfk;
        Wed, 13 Apr 2022 17:09:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw1gifdTfBBvfmG1gZvIif3ZNrDcVHPxatEr6DGftDiQ0kU3HJc44DZENgYtTuOOi9EG9Qm
X-Received: by 2002:a25:2e43:0:b0:641:ba1c:55e7 with SMTP id b3-20020a252e43000000b00641ba1c55e7mr11651ybn.507.1649894973099;
        Wed, 13 Apr 2022 17:09:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649894973; cv=none;
        d=google.com; s=arc-20160816;
        b=WBrXL1L1smCbcvpkWlL8TblXdOBQG0AszhUfLbBAWDY9GepdAJFaEoSfjIABePHmDK
         99y/UTHpWsm3+NnBA4z/HDB8UmgcARBp+VyEnUItHyeXqpWSOiCq3Sy5DhfpLpY6lunq
         3sBevNeY4lQ4lECbUNX0+2MQfcZL5LKtI1OcQgRnqLq2YFk10yj3f+Os0mUFxEKLoRlo
         e/XhqOlPfs41Eue1SZEibANNsxHXSX/eV0eDd724+2BGTzqzcclFcjyzvd2jdkCbDCUr
         EbGO1rt76qqMnJfcZeeDqc7/Dya4sIWVQahuIwzCByzog3tfTLgxv5MpgkIvyN3OXBP+
         OoPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=Wc8saHFTHDJVGdJxVdnsqOAZ5jFxaUefTb1pve8qx5k=;
        b=S+ibP7P+uIZ1ZIOiR69zw/QTnYrTGEdUrLiNjQ2LgAXe2zF0A1W/dIpzhJQsGfIA2b
         KoYX5d8IkpIecWeUUBjaRR/uBDRvI7V/NJ3/YcZO6MK0bTJp4iL6PPEAkiF3qXg/pyIz
         C4St2d44X3pC+ArxKLbPYzO2zJnI9cH3I28p44Wsu23UJhsBrQsUV46x7ipXPY8vTR1H
         a0GlBGees9QA4437VFkyIXnb0ltFGZisSZ17dVwyP6K6fmPIjSxnzUNOV+Utoa807LMe
         JF+cQI2J9LyGOeAtQZTi2J/BVuN3wDCPPpt2F6JlbAWEoTE7xBJ9JwpHzm6tCNDEJjVt
         LfGQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=NZ2bemvf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e82-20020a816955000000b002ebfecb40cbsi7025350ywc.54.2022.04.13.17.09.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Apr 2022 17:09:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=NZ2bemvf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nen3E-00023Q-GT
	for alex.bennee@linaro.org; Wed, 13 Apr 2022 20:09:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1nen2t-00022T-CU
 for qemu-arm@nongnu.org; Wed, 13 Apr 2022 20:09:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34629)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1nen2r-0005oB-TG
 for qemu-arm@nongnu.org; Wed, 13 Apr 2022 20:09:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649894949;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Wc8saHFTHDJVGdJxVdnsqOAZ5jFxaUefTb1pve8qx5k=;
 b=NZ2bemvf5FAQkHvfnVWEsW6Auy6My/AAyk1/AxVtoOguzo5PNjYevZp/dYhcqkHzt/zu/v
 JLh3o/IXXlU1yUIsKuX/F17Be2xJeJ0iLhp9Oe2wEWaypqn+q8Ds2CSn8DvJSw9uxgrZOE
 GLAgzf6qdZnpS7p5TXvTHssll05FOcI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-595-KyqlbVgkPR-VagMUtJ-3Uw-1; Wed, 13 Apr 2022 20:09:06 -0400
X-MC-Unique: KyqlbVgkPR-VagMUtJ-3Uw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9AA4318A65B2;
 Thu, 14 Apr 2022 00:09:05 +0000 (UTC)
Received: from [10.72.13.171] (ovpn-13-171.pek2.redhat.com [10.72.13.171])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8FDD32166B4F;
 Thu, 14 Apr 2022 00:08:56 +0000 (UTC)
Subject: Re: [PATCH v5 2/4] hw/arm/virt: Consider SMP configuration in CPU
 topology
To: "wangyanan (Y)" <wangyanan55@huawei.com>, qemu-arm@nongnu.org
References: <20220403145953.10522-1-gshan@redhat.com>
 <20220403145953.10522-3-gshan@redhat.com>
 <6f713fec-71e6-3300-a504-817f45a82a51@huawei.com>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <27df8771-ebe0-b5fe-39c4-83696e21e3a3@redhat.com>
Date: Thu, 14 Apr 2022 08:08:52 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <6f713fec-71e6-3300-a504-817f45a82a51@huawei.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=gshan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Reply-To: Gavin Shan <gshan@redhat.com>
Cc: peter.maydell@linaro.org, drjones@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, zhenyzha@redhat.com, shan.gavin@gmail.com,
 imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Lhi8C43bupat

Hi Yanan,

On 4/13/22 8:39 PM, wangyanan (Y) wrote:
> On 2022/4/3 22:59, Gavin Shan wrote:
>> Currently, the SMP configuration isn't considered when the CPU
>> topology is populated. In this case, it's impossible to provide
>> the default CPU-to-NUMA mapping or association based on the socket
>> ID of the given CPU.
>>
>> This takes account of SMP configuration when the CPU topology
>> is populated. The die ID for the given CPU isn't assigned since
>> it's not supported on arm/virt machine yet.
>>
>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>> ---
>>   hw/arm/virt.c | 16 +++++++++++++++-
>>   1 file changed, 15 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>> index d2e5ecd234..3174526730 100644
>> --- a/hw/arm/virt.c
>> +++ b/hw/arm/virt.c
>> @@ -2505,6 +2505,7 @@ static const CPUArchIdList *virt_possible_cpu_arch_ids(MachineState *ms)
>>       int n;
>>       unsigned int max_cpus = ms->smp.max_cpus;
>>       VirtMachineState *vms = VIRT_MACHINE(ms);
>> +    MachineClass *mc = MACHINE_GET_CLASS(vms);
>>       if (ms->possible_cpus) {
>>           assert(ms->possible_cpus->len == max_cpus);
>> @@ -2518,8 +2519,21 @@ static const CPUArchIdList *virt_possible_cpu_arch_ids(MachineState *ms)
>>           ms->possible_cpus->cpus[n].type = ms->cpu_type;
>>           ms->possible_cpus->cpus[n].arch_id =
>>               virt_cpu_mp_affinity(vms, n);
>> +
>> +        assert(!mc->smp_props.dies_supported);
>> +        ms->possible_cpus->cpus[n].props.has_socket_id = true;
>> +        ms->possible_cpus->cpus[n].props.socket_id =
>> +            (n / (ms->smp.clusters * ms->smp.cores * ms->smp.threads)) %
>> +            ms->smp.sockets;
> No need for "% ms->smp.sockets".

Yeah, lets remove it in v6.

>> +        ms->possible_cpus->cpus[n].props.has_cluster_id = true;
>> +        ms->possible_cpus->cpus[n].props.cluster_id =
>> +            (n / (ms->smp.cores * ms->smp.threads)) % ms->smp.clusters;
>> +        ms->possible_cpus->cpus[n].props.has_core_id = true;
>> +        ms->possible_cpus->cpus[n].props.core_id =
>> +            (n / ms->smp.threads) % ms->smp.cores;
>>           ms->possible_cpus->cpus[n].props.has_thread_id = true;
>> -        ms->possible_cpus->cpus[n].props.thread_id = n;
>> +        ms->possible_cpus->cpus[n].props.thread_id =
>> +            n % ms->smp.threads;
>>       }
>>       return ms->possible_cpus;
>>   }
> Otherwise, looks good to me:
> Reviewed-by: Yanan Wang <wangyanan55@huawei.com>
> 

Thanks for your time to review :)

Thanks,
Gavin

