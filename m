Received: by 2002:a05:6512:15a3:0:0:0:0 with SMTP id bp35csp7295768lfb;
        Wed, 29 Dec 2021 07:45:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzWMhi0j69Xzx8UUuq2nXcuzmcip+mDbLQAmao/0C+boM4+03Ibrr9HJ5qWTuvVc0+mBJy2
X-Received: by 2002:a25:8b0e:: with SMTP id i14mr15244309ybl.218.1640792723709;
        Wed, 29 Dec 2021 07:45:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1640792723; cv=none;
        d=google.com; s=arc-20160816;
        b=d2MiNX6VVHnOhTFiUL7rlVER5lzOXm2pH2yYMY3NQlTGGf+iFlDnnafZ65DBLzjWet
         wvXIPiejzRbAxNampN0yUwUUx1jeDBe9doPNV2wO6wtHDjBL2gyipdH2MmfW80OeSunk
         Kod7fYjGIy3b320kTg9hBORitUdTxGHxXCr5VEc/lxcw0ssgp7ekGIWaxZ8WiPLIuLF5
         xQmL3/vIDxgJPvx5F1gYLBKVYF0V6XkJXcZOs+7p7iTzdKjJIwQ+XbNUVxJxDDlqM3qX
         Durs/fFa6HoNKFcPYrs+2seLGxeNsyWJWH6TE2w9xg9JOtANaQAmW4w5VU3jS9Y2J7eC
         8esA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=mExkZsv9A8Q1n0goSpSfiwDto8PAAQAk5+cxpi3m8w0=;
        b=AY4sRjaK12m6rmp1nJiNP8+OJAX0w4ExYWpqAOyli3C20A++9kGwNoBDYvqHA6Xi3L
         X9kBqPWIE39rXP6QoqnBZtuoclCZum5vZRGKaEbaJ+LRKmoaVlG/kK1PdMDbljjeJBB+
         j8aQwUC3fSIvO6dasnu3emp868MzF1HL/Y8XeJyamjEj91kv8OvBj2fIEH8j0CqXR2xl
         6dTDB/KfxonqPENvk7keGhgHxodQBz5wTPiBgGaTjQeWlLz8UjhlfgzVa3w7cTN4SQiq
         GHHs/Ka2Q6CKE8pZbzxVAeLZcPZWTUabp6RLplmwuRrNsrzi4FdvlJmY/ki8lj3QbH1u
         g36w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ZUskXbn1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 206si15540076ybz.761.2021.12.29.07.45.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 29 Dec 2021 07:45:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ZUskXbn1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1n2b8l-0003zO-46
	for alex.bennee@linaro.org; Wed, 29 Dec 2021 10:45:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n2b89-0003z8-Gi
 for qemu-arm@nongnu.org; Wed, 29 Dec 2021 10:44:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n2b86-0003u0-KB
 for qemu-arm@nongnu.org; Wed, 29 Dec 2021 10:44:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640792681;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mExkZsv9A8Q1n0goSpSfiwDto8PAAQAk5+cxpi3m8w0=;
 b=ZUskXbn1IoD3Nk0jqpWzej42vM6W1N7O4vpBpHZovDl4Hq7SNvGB1qNbLDnlxukTSNLOet
 XRWetw6uIAOvUNGuUSCiFZaLbjYV60T5kTL0G8pJh+OiCec/jIker7oJiPcnfgQJXSwn27
 D60IWda1158fPcj3dmYESKJsxbf/LKk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-583-ozcytM1DP8aOghiEIUS8JA-1; Wed, 29 Dec 2021 10:44:40 -0500
X-MC-Unique: ozcytM1DP8aOghiEIUS8JA-1
Received: by mail-wm1-f72.google.com with SMTP id
 a203-20020a1c7fd4000000b0034574187420so12550183wmd.5
 for <qemu-arm@nongnu.org>; Wed, 29 Dec 2021 07:44:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=mExkZsv9A8Q1n0goSpSfiwDto8PAAQAk5+cxpi3m8w0=;
 b=uL5sx1Q2Y00rUk8FL9B12TW9rR6pu3GeaPt/4v3UIla8ceUsUQk7k1YIjbi1OA6Wk4
 fcMLVarDIyo+ptXDjSVN+NtHpN/t58ecdAwe8iR0dZZMXC3AUtLXM01lkQBm63SAxpaR
 pLAJGuil4bwhPtGsze+wE3FcOwP522fljR0BwCc7aWVLL6y2EtQSwnh9f+/Lc2tbR0Y/
 +YX8IQf+r2jac6TUCJ00pzWsOreDe2Qj1VfkfpBel2rjLnXa/LK06KbU9xv2kM3HhcNK
 sbtuJovW+UZA4Ab5t/V0WtnUxw619r/3i/pcD5H+NyoUjoUqlo68eEYnzmQ1FpKSk0Ce
 imuw==
X-Gm-Message-State: AOAM531/5MaHErMBSWkFhcR7ER3yKjSmI5sJckkbDT0iHdf8UW7SsZaE
 RoS/JaHOe6BQZ6DJToKpcDOOxflGYzSkayw/UNFw92JyfEAR0wvzzkwW57CgWdZ1CX4+/pfnCFh
 lRKnsPfeHZoxf
X-Received: by 2002:a1c:f609:: with SMTP id w9mr22389570wmc.99.1640792678955; 
 Wed, 29 Dec 2021 07:44:38 -0800 (PST)
X-Received: by 2002:a1c:f609:: with SMTP id w9mr22389535wmc.99.1640792678590; 
 Wed, 29 Dec 2021 07:44:38 -0800 (PST)
Received: from [192.168.1.16] (adijon-655-1-69-27.w90-13.abo.wanadoo.fr.
 [90.13.240.27])
 by smtp.gmail.com with ESMTPSA id z11sm27506670wmf.9.2021.12.29.07.44.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Dec 2021 07:44:37 -0800 (PST)
Message-ID: <e93b2162-fbab-dd03-ab80-9b8564c0c8c8@redhat.com>
Date: Wed, 29 Dec 2021 16:44:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v5 02/14] hw/core/machine: Introduce CPU cluster topology
 support
To: "wangyanan (Y)" <wangyanan55@huawei.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
References: <20211228092221.21068-1-wangyanan55@huawei.com>
 <20211228092221.21068-3-wangyanan55@huawei.com>
 <fa7f67b2-ca1d-bd95-1a33-534a50b2d4c8@redhat.com>
 <2248a06d-7c3d-2ee3-e683-901d9bcbec02@huawei.com>
 <084c5004-6eb6-9952-0d9c-6ae3dc69aca0@redhat.com>
 <4efc3a6e-4077-86fb-2d11-5e15fe6ad886@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <4efc3a6e-4077-86fb-2d11-5e15fe6ad886@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) DKIMWL_WL_HIGH=-0.573, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.024,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, wanghaibin.wang@huawei.com,
 Markus Armbruster <armbru@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kDs6hAfNeyLF

On 12/29/21 14:04, wangyanan (Y) wrote:
> 
> On 2021/12/29 18:44, Philippe Mathieu-Daudé wrote:
>> On 12/29/21 04:48, wangyanan (Y) wrote:
>>> Hi Philippe,
>>> Thanks for your review.
>>>
>>> On 2021/12/29 3:17, Philippe Mathieu-Daudé wrote:
>>>> Hi,
>>>>
>>>> On 12/28/21 10:22, Yanan Wang wrote:
>>>>> The new Cluster-Aware Scheduling support has landed in Linux 5.16,
>>>>> which has been proved to benefit the scheduling performance (e.g.
>>>>> load balance and wake_affine strategy) on both x86_64 and AArch64.
>>>>>
>>>>> So now in Linux 5.16 we have four-level arch-neutral CPU topology
>>>>> definition like below and a new scheduler level for clusters.
>>>>> struct cpu_topology {
>>>>>       int thread_id;
>>>>>       int core_id;
>>>>>       int cluster_id;
>>>>>       int package_id;
>>>>>       int llc_id;
>>>>>       cpumask_t thread_sibling;
>>>>>       cpumask_t core_sibling;
>>>>>       cpumask_t cluster_sibling;
>>>>>       cpumask_t llc_sibling;
>>>>> }
>>>>>
>>>>> A cluster generally means a group of CPU cores which share L2 cache
>>>>> or other mid-level resources, and it is the shared resources that
>>>>> is used to improve scheduler's behavior. From the point of view of
>>>>> the size range, it's between CPU die and CPU core. For example, on
>>>>> some ARM64 Kunpeng servers, we have 6 clusters in each NUMA node,
>>>>> and 4 CPU cores in each cluster. The 4 CPU cores share a separate
>>>>> L2 cache and a L3 cache tag, which brings cache affinity advantage.
>>>>>
>>>>> In virtualization, on the Hosts which have pClusters, if we can
>>>> Maybe [*] -> reference to pClusters?
>>> Hm, I'm not sure what kind of reference is appropriate here.
>> So I guess the confusion comes from a simple typo =)
> I tried to mean "physical clusters" on host by pClusters, on the contrary
> to "virtual clusters" on guest. But obviously it brings confusion.

OK, I got confused because you don't use "vClusters".

>> Is it OK if I replace "pClusters" by "Clusters"?
> Sure, it's clearer to just use "clusters", please do that.

OK.

