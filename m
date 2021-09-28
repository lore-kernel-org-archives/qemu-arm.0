Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp4398770lfp;
        Mon, 27 Sep 2021 18:21:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzAWVFcjUsZ4MqTyAYbMvF+GMXqXkcyILRdSmGE+EbL6CYLJ6wXS9C+whRO0TfYzoouoKv8
X-Received: by 2002:ab0:6847:: with SMTP id a7mr2974617uas.48.1632792112194;
        Mon, 27 Sep 2021 18:21:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1632792112; cv=none;
        d=google.com; s=arc-20160816;
        b=BeXZuXc2jVu2dWcaM4gOP4+4dKhr/IvRKasL0Cn1tqVJaabwqmIF5XI0F+vfs4LeZh
         /lIm8hrMrm8LqLre+UArxnTUavnf1VMl6nna9oCD7jlCtQSu6d3Msy3yiX+/m3jZq8Ek
         YKDCZGyJeeU7OeFMfcmePRADbgEAcBD4+NQUx0MBPTo17auD/KSn+Pe85Z+BAcE3shQF
         bCNRdY26y2aMLuMZBUrzaBe3w5+dieRadtg4e/nvPXdEUFF9B1nLK88cg4vlm17A9sGJ
         fNzMEzQTCEJIdJG5ewWTcA2oRWmdqy/qux0bNeJZ5woZKU6p5sN9ClhzbVCOhVraNZM6
         1NMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=nZTTXo6Hz+LqdQWR4Mdw04MwHBzFkUGwj2e/lrrzddA=;
        b=UgRnujVBScJPrYPcS7ZRW8pKUZpNiLmKVzwKYGDQRlTeGqamOeV9WP1zW6odXBMwdT
         o1LIJ+LDQp7L4FtDUmCsQVcea/kfmeNUv3gJfhrEOt3zA96Gj0PMs3pF/xEl+HiMSzd7
         vbUerYHablX0WyCwldl+VVVJn9hUArdByD6QlOTmpEqRIcfzoKo0kqC0ygkK2bP8+GoT
         XnkTMS6P8pRsyEbBNZfMxiMPaPelZAcVFAbJvlhyqx/Pr0+bhhsT+5ks3fcJLcGjc1UU
         qFQRe/nzSw37uBpvnTateBk+gaLuRxDUKufyGEy4OJJUenlvYHx4bPDJu388Pmq0J5i5
         YnuQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q13si13530213vsn.232.2021.09.27.18.21.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Sep 2021 18:21:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:57076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mV1od-0000ba-GY
	for alex.bennee@linaro.org; Mon, 27 Sep 2021 21:21:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mV1oE-0000bF-Kt; Mon, 27 Sep 2021 21:21:26 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:2929)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mV1o8-0004VY-MN; Mon, 27 Sep 2021 21:21:23 -0400
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4HJM6S60Rnzbmp8;
 Tue, 28 Sep 2021 09:16:48 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Tue, 28 Sep 2021 09:21:04 +0800
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.8; Tue, 28 Sep 2021 09:21:03 +0800
Subject: Re: [PATCH v10 11/14] machine: Make smp_parse generic enough for all
 arches
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210926084541.17352-1-wangyanan55@huawei.com>
 <20210926084541.17352-12-wangyanan55@huawei.com>
 <YVGZE7boLhoD1w2r@redhat.com>
From: "wangyanan (Y)" <wangyanan55@huawei.com>
Message-ID: <ffc4e1c6-1d41-fd19-7e78-d70d428d8ab8@huawei.com>
Date: Tue, 28 Sep 2021 09:21:03 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <YVGZE7boLhoD1w2r@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme714-chm.china.huawei.com (10.1.199.110) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=wangyanan55@huawei.com; helo=szxga01-in.huawei.com
X-Spam_score_int: -72
X-Spam_score: -7.3
X-Spam_bar: -------
X-Spam_report: (-7.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.136,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Pierre
 Morel <pmorel@linux.ibm.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 wanghaibin.wang@huawei.com, Paolo Bonzini <pbonzini@redhat.com>, David
 Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9GZMqiM93BwN


On 2021/9/27 18:12, Daniel P. Berrangé wrote:
> On Sun, Sep 26, 2021 at 04:45:38PM +0800, Yanan Wang wrote:
>> Currently the only difference between smp_parse and pc_smp_parse
>> is the support of dies parameter and the related error reporting.
>> With some arch compat variables like "bool dies_supported", we can
>> make smp_parse generic enough for all arches and the PC specific
>> one can be removed.
>>
>> Making smp_parse() generic enough can reduce code duplication and
>> ease the code maintenance, and also allows extending the topology
>> with more arch specific members (e.g., clusters) in the future.
>>
>> Suggested-by: Andrew Jones <drjones@redhat.com>
>> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
>> Reviewed-by: Andrew Jones <drjones@redhat.com>
>> ---
>>   hw/core/machine.c   | 110 ++++++++++++++++++++++++++++++++++++--------
>>   hw/i386/pc.c        |  84 +--------------------------------
>>   include/hw/boards.h |   9 ++++
>>   3 files changed, 100 insertions(+), 103 deletions(-)
>>
>> diff --git a/hw/core/machine.c b/hw/core/machine.c
>> index a21fcd7700..4b5c943f8e 100644
>> --- a/hw/core/machine.c
>> +++ b/hw/core/machine.c
>> @@ -15,6 +15,7 @@
>>   #include "qapi/qmp/qerror.h"
>>   #include "sysemu/replay.h"
>>   #include "qemu/units.h"
>> +#include "qemu/cutils.h"
>>   #include "hw/boards.h"
>>   #include "hw/loader.h"
>>   #include "qapi/error.h"
>> @@ -746,20 +747,87 @@ void machine_set_cpu_numa_node(MachineState *machine,
>>       }
>>   }
>>   
>> +static char *cpu_topology_hierarchy(MachineState *ms)
>> +{
>> +    MachineClass *mc = MACHINE_GET_CLASS(ms);
>> +    SMPCompatProps *smp_props = &mc->smp_props;
>> +    char topo_msg[256] = "";
>> +
>> +    /*
>> +     * Topology members should be ordered from the largest to the smallest.
>> +     * Concept of sockets/cores/threads is supported by default and will be
>> +     * reported in the hierarchy. Unsupported members will not be reported.
>> +     */
>> +    g_autofree char *sockets_msg = g_strdup_printf(
>> +            " * sockets (%u)", ms->smp.sockets);
>> +    pstrcat(topo_msg, sizeof(topo_msg), sockets_msg);
>> +
>> +    if (smp_props->dies_supported) {
>> +        g_autofree char *dies_msg = g_strdup_printf(
>> +                " * dies (%u)", ms->smp.dies);
>> +        pstrcat(topo_msg, sizeof(topo_msg), dies_msg);
>> +    }
>> +
>> +    g_autofree char *cores_msg = g_strdup_printf(
>> +            " * cores (%u)", ms->smp.cores);
>> +    pstrcat(topo_msg, sizeof(topo_msg), cores_msg);
>> +
>> +    g_autofree char *threads_msg = g_strdup_printf(
>> +            " * threads (%u)", ms->smp.threads);
>> +    pstrcat(topo_msg, sizeof(topo_msg), threads_msg);
>> +
>> +    return g_strdup_printf("%s", topo_msg + 3);
>> +}
> Mixing g_strdup_printf + pstrcat + fixed buffer is quite
> unpleasant. This method is begging to use 'GString' APIs
> for formatting.
>
Indeed, GString seems to be the ideal choice for this. It's
my bad not thinking about usage of it at the beginning.
I will update this patch in v11. Thanks for the suggestion.

Thanks,
Yanan

