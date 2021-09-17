Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp1837424lfp;
        Fri, 17 Sep 2021 00:33:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxuBG/uspK8fedEeL2MLCPxbbN6rQBTOzBVfw2j6jmIk4p32hKcVqZaF4f/EHGiccWaBf3N
X-Received: by 2002:a05:6e02:13d4:: with SMTP id v20mr7008794ilj.247.1631864031403;
        Fri, 17 Sep 2021 00:33:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631864031; cv=none;
        d=google.com; s=arc-20160816;
        b=M2qfYGYRZBAl1dk/2hVWoJlnySMirONAMcSgoCFETO2TVedBZWhj7DD5CsbDNONBN8
         kZOVcmv4FR0yukMxx2TFSfSMW4o+fSyk84mNBklGFKKk5wiuaMyskgWvgjpsHVlRr9Yo
         ZEzZY5BwSlWYfxVfg0qy4SsLUKAEEhPLKIkbdQ7DY2E3v3+8OrKZEyBTW+qm4ro1aVka
         kS46pWvAxsQHLr5Gk2j5PApCYUBo9eqZeuKyoIF2D7fEi3X5oN1tPdFzIVqWDQ2/Z9kJ
         oN4mPbqPMjy6z+7Cis28quwuFD4cnaJNEwdBzz482uhniJDqdEScM5s90DLsazwTVTob
         qA4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=QQIHjTkGaQldLSOM/ejeHlpQEXcItLWfCq8Wn1Xxu5s=;
        b=Bi7t2WSTFpg6ZZCd29otYVLqkCf168d3CdzkqyrSJXENpfK81pbQALgH/veGIoi/20
         xdGqRHgemtAjA6HKZXwDAZtc4sst/fHDA5Ci20eouYRZj61UjIybegEDTlbR1bGhO7Jx
         0hn+dfAOZX4YIMfaU9ZneDDBK9Eu2L7zDZJ+NjJOxuf/wDXPr19dr4E5hOSbi3tw3e9c
         mmmSgCgQ+n3xZuu97Et3Capruf+u5anuoUEkVMfEdaqxl79i9QeuK9S+onJ4TNrP+psM
         sVrEA7PD+zSodWEoraW3lt3v3wmxaHLwPGas3FAyJZnfGUR+8eED5m7X5keeXFbRAvdE
         OKig==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t2si5076463iol.64.2021.09.17.00.33.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 17 Sep 2021 00:33:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:50960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mR8Na-0001wJ-QB
	for alex.bennee@linaro.org; Fri, 17 Sep 2021 03:33:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mR8NP-0001uu-89; Fri, 17 Sep 2021 03:33:39 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:2798)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mR8NM-0006YX-EU; Fri, 17 Sep 2021 03:33:39 -0400
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4H9lvP3TNzzRFkr;
 Fri, 17 Sep 2021 15:29:21 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Fri, 17 Sep 2021 15:33:29 +0800
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.8; Fri, 17 Sep 2021 15:33:28 +0800
Subject: Re: [PATCH v9 07/16] qtest/numa-test: Use detailed -smp CLI in
 test_def_cpu_split
To: Andrew Jones <drjones@redhat.com>
References: <20210910073025.16480-1-wangyanan55@huawei.com>
 <20210910073025.16480-8-wangyanan55@huawei.com>
 <20210910081751.jptjdea3qhuu6jsa@gator>
From: "wangyanan (Y)" <wangyanan55@huawei.com>
Message-ID: <6d0f55da-9ef8-2a4c-7049-04ed737227a6@huawei.com>
Date: Fri, 17 Sep 2021 15:33:27 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210910081751.jptjdea3qhuu6jsa@gator>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme707-chm.china.huawei.com (10.1.199.103) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=wangyanan55@huawei.com; helo=szxga02-in.huawei.com
X-Spam_score_int: -56
X-Spam_score: -5.7
X-Spam_bar: -----
X-Spam_report: (-5.7 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.488,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Pierre Morel <pmorel@linux.ibm.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>, qemu-devel@nongnu.org,
 Greg Kurz <groug@kaod.org>, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 wanghaibin.wang@huawei.com, Paolo
 Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qHZzAXEYIQX1


On 2021/9/10 16:17, Andrew Jones wrote:
> On Fri, Sep 10, 2021 at 03:30:16PM +0800, Yanan Wang wrote:
>> Since commit 80d7835749 (qemu-options: rewrite help for -smp options),
>> the preference of sockets/cores in -smp parsing is considered liable
>> to change, and actually we are going to change it in a coming commit.
>> So it'll be more stable to use detailed -smp CLIs in the testcases
>> that have strong dependency on the parsing results.
>>
>> Currently, test_def_cpu_split use "-smp 8" and will get 8 CPU sockets
>> based on current parsing rule. But if we change to prefer cores over
>> sockets we will get one CPU socket will 8 cores, and this testcase
>> will not get expected numa set by default on x86_64 (Ok on aarch64).
>>
>> So now explicitly use "-smp 8,sockets=8" to avoid affect from parsing
>> logic change.
>>
>> Cc: Thomas Huth <thuth@redhat.com>
>> Cc: Laurent Vivier <lvivier@redhat.com>
>> Cc: Paolo Bonzini <pbonzini@redhat.com>
>> Cc: Igor Mammedov <imammedo@redhat.com>
>> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
>> ---
>>   tests/qtest/numa-test.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/tests/qtest/numa-test.c b/tests/qtest/numa-test.c
>> index fd7a2e80a0..90bf68a5b3 100644
>> --- a/tests/qtest/numa-test.c
>> +++ b/tests/qtest/numa-test.c
>> @@ -42,7 +42,8 @@ static void test_def_cpu_split(const void *data)
>>       g_autofree char *s = NULL;
>>       g_autofree char *cli = NULL;
>>   
>> -    cli = make_cli(data, "-machine smp.cpus=8 -numa node,memdev=ram -numa node");
>> +    cli = make_cli(data, "-machine smp.cpus=8,smp.sockets=8 "
>> +                         "-numa node,memdev=ram -numa node");
>>       qts = qtest_init(cli);
>>   
>>       s = qtest_hmp(qts, "info numa");
>> -- 
>> 2.23.0
>>
>   
> Reviewed-by: Andrew Jones <drjones@redhat.com>
>
> .
Thanks to Andrew for the reviewing.

Yanan
.

