Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp3460039lfp;
        Sun, 9 Feb 2020 22:15:08 -0800 (PST)
X-Google-Smtp-Source: APXvYqyMH8GpBFN8lXQKdmYTnAYsbh0Z8t2N5MmwxTHK1reoH9zxT0Uy03U8fYGrlcbrdppBHfFa
X-Received: by 2002:a0c:ffc9:: with SMTP id h9mr8878108qvv.50.1581315308323;
        Sun, 09 Feb 2020 22:15:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581315308; cv=none;
        d=google.com; s=arc-20160816;
        b=qeZOv9OfcOYYbPJL4GbFkuw4v5N12Uoa4/ebc4C/qD2U5dKM60A6/eWF65abwz+hrx
         psa/jP+A2cy9xUnVtSusjmqF+8uOQh1ZGWQ4hR5Lrbp6bLQqsovhegOT0kLmO+iPMU0z
         vLePPHeYVx22mZpfxvtYDn3b+TEx66E0XEcsxZs1jHsmZONBh9/YPLC8kXDlgQHmndnT
         vIcWdCZV+bZFjDeBuqqU56Y5JNvQs8z8B9LAXnU63JRqUXRQVNKL/gLoXn+F8TN9qAR+
         5oYgt+oGNn7gQAoZ607OQvsnqMIdia33qlSXjBscoBXp0zz2r7jyTTIZMIC+ODXBdDjj
         qTlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:mime-version:user-agent:date:message-id:from:references
         :to:subject;
        bh=8K2xpLHolhId60QnugG0HIOPyYIdOitvOircKSRqY+8=;
        b=Ihfq2pwtyeP1ADuBW7D1ipV93KQdscNgSJ5iEhn9GazbWv9U8238pr6iPq8MAYEOnR
         1t/sMSeT0+FNpN0lXfhGj6Ly73EmyszkksFFMwQN/pX5D/g/Xci+BGipTRjE9bt1CZNf
         5ACvoMb7+hYVAYm2+I3QW1mcZRrRZE1QK5XhyXyOrfe+jExt/9z5D7u/RhTPc40DRc3N
         fea0ByStUiioy7Bv7/khrWBNcoFeCt5FirQjn6xMCdBR7vaSi91+tfhfB4distoXcHDi
         W35TkpSWjIemDwJCZsWzAZzrm2BrHus2jXK92QG1t64l8t4AC9OXE08zv8h+9u3Kc7y9
         TLfA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n7si3663317qkg.290.2020.02.09.22.15.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 09 Feb 2020 22:15:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:57260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j12Lb-0002BS-Iz
	for alex.bennee@linaro.org; Mon, 10 Feb 2020 01:15:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55183)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zhukeqian1@huawei.com>) id 1j12LQ-0002BC-P6
 for qemu-arm@nongnu.org; Mon, 10 Feb 2020 01:14:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <zhukeqian1@huawei.com>) id 1j12LP-0007d2-HL
 for qemu-arm@nongnu.org; Mon, 10 Feb 2020 01:14:56 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2699 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <zhukeqian1@huawei.com>)
 id 1j12LP-0007DO-6J; Mon, 10 Feb 2020 01:14:55 -0500
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 051FF14E37D5277C505C;
 Mon, 10 Feb 2020 14:14:46 +0800 (CST)
Received: from [127.0.0.1] (10.173.221.230) by DGGEMS410-HUB.china.huawei.com
 (10.3.19.210) with Microsoft SMTP Server id 14.3.439.0;
 Mon, 10 Feb 2020 14:14:35 +0800
Subject: Re: [PATCH] migration: Optimization about wait-unplug migration state
To: <quintela@redhat.com>
References: <20200204050841.44453-1-zhukeqian1@huawei.com>
 <87blqehfyn.fsf@secure.laptop>
From: zhukeqian <zhukeqian1@huawei.com>
Message-ID: <4c6ab663-0d59-765a-e4b2-4dbf63afe9e9@huawei.com>
Date: Mon, 10 Feb 2020 14:14:35 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <87blqehfyn.fsf@secure.laptop>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.173.221.230]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.190
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
Cc: jfreimann@redhat.com, wanghaibin.wang@huawei.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1Rf9O6L50FF9



On 2020/2/4 17:14, Juan Quintela wrote:
> Keqian Zhu <zhukeqian1@huawei.com> wrote:
>> qemu_savevm_nr_failover_devices() is originally designed to
>> get the number of failover devices, but it actually returns
>> the number of "unplug-pending" failover devices now. Moreover,
>> what drives migration state to wait-unplug should be the number
>> of "unplug-pending" failover devices, not all failover devices.
>>
>> We can also notice that qemu_savevm_state_guest_unplug_pending()
>> and qemu_savevm_nr_failover_devices() is equivalent almost (from
>> the code view). So the latter is incorrect semantically and
>> useless, just delete it.
>>
>> In the qemu_savevm_state_guest_unplug_pending(), once hit a
>> unplug-pending failover device, then it can return true right
>> now to save cpu time.
>>
>> Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
> 
> Reviewed-by: Juan Quintela <quintela@redhat.com>
> 
> For my reading you are right:
> - 1st function naming is not right
> - 2nd function achieves exactly the same effect
> 
> I will wait until Jens says anything, but then I will queue it.
> 
> Thanks, Juan.
> 
> 
> .
> 
Thanks,
Keqian.

