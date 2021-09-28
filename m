Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp4769575lfp;
        Tue, 28 Sep 2021 04:22:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxjwrvqiOie8F+HttywHW1uwsx/0MzBPw/jMqC4nXjPse9pqKep2fcPfPGjiuHYgjgbOKgN
X-Received: by 2002:a1f:6e82:: with SMTP id j124mr3906159vkc.17.1632828120428;
        Tue, 28 Sep 2021 04:22:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1632828120; cv=none;
        d=google.com; s=arc-20160816;
        b=VDT7lWoA/y/RliRYeDDwu7gpHhvOcQ53tA4BlcUU8JT/DFljbrwJ+QGhShKpDHDgV/
         gE03fmUew4jmQUSyHZpG/rpkOQISL1f/N6NR8MXdgEeJ5pqXeFh2pJYXPy/4AGoxlKp2
         xAU6ixK+AN5pdoghqKoTROuwza+ZYYFfZpt9Zzrxdptu8VPteigcrI+IxygQRo4R46QL
         FsiKF2HP5fKTN7EIddbB+S50OpH2X/0v3OLID5PHLJHXI7+z7KTRP+dTbJQkHG/vDtX1
         DtmYZtByhp4oCR00Gpqr05QeQaR96ZnssED/BVAqeuBqPtNX4/KuZXMTkkUGt7alqbdc
         bwQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=CvT8/ygnMd1cl1/fnXdchkz5rqhcd5WeQuFKUzld19A=;
        b=dekhFVq4q8q/ZT/ImtH8127iIYR4T11PJjm6Xj0/TqPSZSQE9k0JiFkxR3tash/wkN
         dYmDPoNnoe7GDNhAs7Cq98S/KZ8/Vw9jp9sAPUUmF0CP1qCgW8O2kG9FRMylWWQgS9NR
         ZjLm7lEOHgMOeGtjnZ9PEJ+NNhmNLP9OFDqAhk6k8NXwx80PnmF9jwng2lm2C27LNpix
         sM7rKbfaSeIvAZUPYdycO9B4d10kJiw4sWvXOAzCdcpRQ/Ut68qJue2i2ZK1L6Z07nt9
         Ng2DJB4xqrwWSULvqkXAlBxxXeMyz1RCjb09sECMzPLh0iN3zS55tXhVy45HqVW5V8nC
         kBDg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f6si9569513vsa.144.2021.09.28.04.22.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Sep 2021 04:22:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:48940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mVBBO-0008MM-9J
	for alex.bennee@linaro.org; Tue, 28 Sep 2021 07:21:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mVBAM-0008Hr-PK; Tue, 28 Sep 2021 07:20:54 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:3476)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mVBAJ-000795-Ka; Tue, 28 Sep 2021 07:20:54 -0400
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4HJcTq1ZcczWNZ8;
 Tue, 28 Sep 2021 19:19:27 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Tue, 28 Sep 2021 19:20:45 +0800
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.8; Tue, 28 Sep 2021 19:20:44 +0800
Subject: Re: [PATCH v11 14/14] machine: Put all sanity-check in the generic
 SMP parser
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>, "Eduardo
 Habkost" <ehabkost@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>, Andrew Jones
 <drjones@redhat.com>
References: <20210928035755.11684-1-wangyanan55@huawei.com>
 <20210928035755.11684-15-wangyanan55@huawei.com>
 <cf292444-d89c-5acb-f47b-c135079a60b2@redhat.com>
From: "wangyanan (Y)" <wangyanan55@huawei.com>
Message-ID: <749fb897-04b7-e67b-d3d2-988449e0ed0b@huawei.com>
Date: Tue, 28 Sep 2021 19:20:43 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <cf292444-d89c-5acb-f47b-c135079a60b2@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme715-chm.china.huawei.com (10.1.199.111) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=wangyanan55@huawei.com; helo=szxga01-in.huawei.com
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.562,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Pierre Morel <pmorel@linux.ibm.com>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>, qemu-ppc@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 "Michael S . Tsirkin" <mst@redhat.com>, wanghaibin.wang@huawei.com,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5ZKPUiHlhPg7


On 2021/9/28 19:01, Philippe Mathieu-Daudé wrote:
> On 9/28/21 05:57, Yanan Wang wrote:
>> Put both sanity-check of the input SMP configuration and sanity-check
>> of the output SMP configuration uniformly in the generic parser. Then
>> machine_set_smp() will become cleaner, also all the invalid scenarios
>> can be tested only by calling the parser.
>>
>> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
>> Reviewed-by: Andrew Jones <drjones@redhat.com>
>> Reviewed-by: Pankaj Gupta <pankaj.gupta@ionos.com>
>> ---
>>   hw/core/machine.c | 63 +++++++++++++++++++++++------------------------
>>   1 file changed, 31 insertions(+), 32 deletions(-)
>>
>> diff --git a/hw/core/machine.c b/hw/core/machine.c
>> index e2a48aa18c..637acd8d42 100644
>> --- a/hw/core/machine.c
>> +++ b/hw/core/machine.c
>> @@ -798,6 +798,20 @@ static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
>>       unsigned threads = config->has_threads ? config->threads : 0;
>>       unsigned maxcpus = config->has_maxcpus ? config->maxcpus : 0;
>>   
>> +    /*
>> +     * Specified CPU topology parameters must be greater than zero,
>> +     * explicit configuration like "cpus=0" is not allowed.
>> +     */
>> +    if ((config->has_cpus && config->cpus == 0) ||
>> +        (config->has_sockets && config->sockets == 0) ||
>> +        (config->has_dies && config->dies == 0) ||
>> +        (config->has_cores && config->cores == 0) ||
>> +        (config->has_threads && config->threads == 0) ||
>> +        (config->has_maxcpus && config->maxcpus == 0)) {
>> +        warn_report("Invalid CPU topology deprecated: "
> Maybe:
>
>     "Deprecated CPU topology: "
> or
>
>     "Deprecated CPU topology (considered invalid): "
Ok, I will chose the second one which I think is clearer.

Thanks,
Yanan
>> +                    "CPU topology parameters must be greater than zero");
>> +    }
> .

