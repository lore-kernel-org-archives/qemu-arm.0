Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp1693587lfj;
        Tue, 3 May 2022 14:11:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyO6576jh+nO5dNxRHZeNAPECVG8hdDWn6IIdhqVkYM9//N+MYBLYQ5dAL2LD/hmKdThcBy
X-Received: by 2002:a05:6214:f0c:b0:45a:b0d5:536c with SMTP id gw12-20020a0562140f0c00b0045ab0d5536cmr387529qvb.57.1651612281331;
        Tue, 03 May 2022 14:11:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651612281; cv=none;
        d=google.com; s=arc-20160816;
        b=0aG60EIfGMS3WYq8pKi83wsmqow5Z+KIB4FfvKlMwJxz6IZd7LUwYbCzQpM/1r/U5G
         WgidNdXCuO8c5oPIb1D6TprAXF3DOHX47rfJJNgW6xUggo8DYfCx51tCEcWz5o8npTo4
         OGz5gmHVEeursWyBQWN8lZnQZIe7QZnrS3IKlbeTPwP2HKkePMrZFJCFVM0JraCE1Sc7
         XTqtRfdLAMj3wENgx72pPkksJIBTWM8b48EIftMXrCdBxdbMNqtvUOdbH9leD8qQ13cb
         eH2R+mR1P47m6MX34ljjzuysp735eSY+mlL6U3tQNNDw/x8bEq5GbvPkwDFOzMur7Qf+
         6Vag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=CFAB95sIYKXYdWrDMmBoCXblncYGSltCfDp5vvk1vsw=;
        b=oNLVIvqrFeYXN2cDRPBUl3F6PCPuEuwO27wTBmqJhF7a3FAxZPrwj91xRoXaKO4e8q
         EMTQW0cd1RlTigZ+1LxqWGf1DNOEfMG8JHKreb0/vQNzZ7t0NM0Jk3qf6puj/aMopxSV
         6+HTEhQj6BtpAVr2pMWg8ODB19wVTL+MOiOc5AYOU5Fee2vcCJ+NPhILokb4pVVn7Z/J
         0A0vNuda/qd1UZ5XPDzNVholWNuhXIEPjxP3+os1OXems2u6I8j4AqbkFo2+PhDY6UY2
         rEt/WGX4fJOrSio+Mg+iB4IitMmGPt8PlHyz30IYoEqZtwzbkV52qKSJIJaNYQWID5rD
         F2+w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MY3GA+2Z;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s16-20020a05620a255000b0069c41fad5d0si9155714qko.290.2022.05.03.14.11.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 May 2022 14:11:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MY3GA+2Z;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nlznk-0002oJ-FG
	for alex.bennee@linaro.org; Tue, 03 May 2022 17:11:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1nlyme-0001VG-5O
 for qemu-devel@nongnu.org; Tue, 03 May 2022 16:06:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29938)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1nlymY-0008Qk-5z
 for qemu-devel@nongnu.org; Tue, 03 May 2022 16:06:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651608361;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CFAB95sIYKXYdWrDMmBoCXblncYGSltCfDp5vvk1vsw=;
 b=MY3GA+2ZWbTPWkbMBJa/6C8hqvBgIn53H7ZOL8/U3NHQkmXLm21Xtz44yGrYP5gPYJMcYH
 S2biCaDwDwm7FmnpFWW4+T4kgVmQoMS1t+0GD+8PAoyvwCbRMcWfFzvLf8nH6jXal73+Ip
 wwRvP7O5yS7/rTeeBW17u9wkV1e3on8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-589-FIKZ5VgCN3-ep3Ikyo4DYQ-1; Tue, 03 May 2022 11:23:45 -0400
X-MC-Unique: FIKZ5VgCN3-ep3Ikyo4DYQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A5B7A1D32394;
 Tue,  3 May 2022 13:47:35 +0000 (UTC)
Received: from [10.72.12.47] (ovpn-12-47.pek2.redhat.com [10.72.12.47])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6E03F2026D2D;
 Tue,  3 May 2022 13:47:07 +0000 (UTC)
Subject: Re: [PATCH v8 2/5] qtest/numa-test: Specify CPU topology in
 aarch64_numa_cpu()
To: Igor Mammedov <imammedo@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, lvivier@redhat.com,
 eduardo@habkost.net, thuth@redhat.com, berrange@redhat.com,
 shan.gavin@gmail.com, peter.maydell@linaro.org, Jonathan.Cameron@Huawei.com,
 zhenyzha@redhat.com, mst@redhat.com, armbru@redhat.com, ani@anisinha.ca,
 pbonzini@redhat.com, drjones@redhat.com, eblake@redhat.com, f4bug@amsat.org,
 wangyanan55@huawei.com
References: <20220425032802.365061-1-gshan@redhat.com>
 <20220425032802.365061-3-gshan@redhat.com>
 <20220502105227.0146dcce@redhat.com>
 <aa4c165b-6aa1-e633-ffa9-d2ae5b286d36@redhat.com>
 <20220503105408.60d9e07c@redhat.com>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <dd218a15-8bbe-36ab-4297-db280343e348@redhat.com>
Date: Tue, 3 May 2022 21:47:04 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20220503105408.60d9e07c@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Gavin Shan <gshan@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OVMzTogv8Sgu

Hi Igor,

On 5/3/22 4:54 PM, Igor Mammedov wrote:
> On Mon, 2 May 2022 18:07:00 +0800
> Gavin Shan <gshan@redhat.com> wrote:
>> On 5/2/22 4:52 PM, Igor Mammedov wrote:
>>> On Mon, 25 Apr 2022 11:27:59 +0800
>>> Gavin Shan <gshan@redhat.com> wrote:
>>>    
>>>> The CPU topology isn't enabled on arm/virt machine yet, but we're
>>>> going to do it in next patch. After the CPU topology is enabled by
>>>> next patch, "thrad-id=1" becomes invalid because the CPU core is
>>>                    ^^^ typo
>>>    
>>
>> hmm, my bad. Lets fix it in next revision.
>>
>>>> preferred on arm/virt machine. It means these two CPUs have 0/1
>>>> as their core IDs, but their thread IDs are all 0. It will trigger
>>>> test failure as the following message indicates:
>>>>
>>>>     [14/21 qemu:qtest+qtest-aarch64 / qtest-aarch64/numa-test  ERROR
>>>>     1.48s   killed by signal 6 SIGABRT
>>>>     >>> G_TEST_DBUS_DAEMON=/home/gavin/sandbox/qemu.main/tests/dbus-vmstate-daemon.sh \
>>>>         QTEST_QEMU_STORAGE_DAEMON_BINARY=./storage-daemon/qemu-storage-daemon         \
>>>>         QTEST_QEMU_BINARY=./qemu-system-aarch64                                       \
>>>>         QTEST_QEMU_IMG=./qemu-img MALLOC_PERTURB_=83                                  \
>>>>         /home/gavin/sandbox/qemu.main/build/tests/qtest/numa-test --tap -k
>>>>     ――――――――――――――――――――――――――――――――――――――――――――――
>>>>     stderr:
>>>>     qemu-system-aarch64: -numa cpu,node-id=0,thread-id=1: no match found
>>>>
>>>> This fixes the issue by providing comprehensive SMP configurations
>>>> in aarch64_numa_cpu(). The SMP configurations aren't used before
>>>> the CPU topology is enabled in next patch.
>>>>
>>>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>>>> Reviewed-by: Yanan Wang <wangyanan55@huawei.com>
>>>> ---
>>>>    tests/qtest/numa-test.c | 3 ++-
>>>>    1 file changed, 2 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/tests/qtest/numa-test.c b/tests/qtest/numa-test.c
>>>> index 90bf68a5b3..aeda8c774c 100644
>>>> --- a/tests/qtest/numa-test.c
>>>> +++ b/tests/qtest/numa-test.c
>>>> @@ -223,7 +223,8 @@ static void aarch64_numa_cpu(const void *data)
>>>>        QTestState *qts;
>>>>        g_autofree char *cli = NULL;
>>>>    
>>>> -    cli = make_cli(data, "-machine smp.cpus=2 "
>>>> +    cli = make_cli(data, "-machine "
>>>> +        "smp.cpus=2,smp.sockets=1,smp.clusters=1,smp.cores=1,smp.threads=2 "
>>>>            "-numa node,nodeid=0,memdev=ram -numa node,nodeid=1 "
>>>>            "-numa cpu,node-id=1,thread-id=0 "
>>>                                   ^^^^
>>> make it sensible as well, i.e. socket/cluster/cores-ids ...
>>>    
>>
>> Could you help if the following command lines are what you want? I don't
>> think we can do it. Without PATCH[v8 3/5] applied, {socket,cluster,core}-id
>> are invalid from arm/virt machine side and we will run into errors.
> you are right, you can only fix -numa after 3/5
> 
> btw:
> splitting threads between several numa nodes here probably is unreal
> configuration. Should be fixed in follow up patches.
> 

Lets fix it in PATCH[v9 4/6] with the following command lines. Besides,
socket/cluster/core/thread IDs should be checked when the NUMA IDs are
verified. It helps to check if the CPU topology is properly populated
at least.

v9 should be sent shortly after doing some tests. Please take a look.

     -machine                                                           \
     smp.cpus=2,smp.sockets=2,smp.clusters=1,smp.cores=1,smp.threads=1  \
     -numa node,nodeid=0,memdev=ram -numa node,nodeid=1                 \
     -numa cpu,node-id=0,socket-id=1,cluster-id=0,core-id=0,thread-id=0 \
     -numa cpu,node-id=1,socket-id=0,cluster-id=0,core-id=0,thread-id=0

[...]

Thanks,
Gavin

