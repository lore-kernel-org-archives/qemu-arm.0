Received: by 2002:a17:906:b088:0:0:0:0 with SMTP id x8csp1708268ejy;
        Tue, 20 Sep 2022 04:16:26 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7OSS6PbviJZY6jCmoMnEHXn5V7pCVbhk1GCphGeQ1IEgD8DlznwKR8c6C5InxkKNguQDxA
X-Received: by 2002:a05:6402:284:b0:454:3e53:feae with SMTP id l4-20020a056402028400b004543e53feaemr5921102edv.280.1663672586115;
        Tue, 20 Sep 2022 04:16:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1663672586; cv=none;
        d=google.com; s=arc-20160816;
        b=O4blqlcDrQGUeob8PwWdDK30JJui/LIXt5hA6hiO9Tn3lbvfLbA82mUAKlNPyfor+c
         qDzLyUYLNRqWyD2bEHta1G+M3buAx4Tg2rn6E9rF1C/9O9DulgIMoLwknOf5LfdKPHCp
         c1bE3kkJpxe+NIVA2eiJGpn/0oRhxjX5Md+fbLRSqb080pvvOAFSfP+N4VofUUBa6HE7
         R9rD+N+0zqt8Uy0up24ikUQVm2C+OjdnWw1Z2IS0N+Mf9DDXi908LeG4dfxfz2YKeax1
         vex4Wc6VwDO2RPB6xQ53n1QVQH9qnBNKdFsx9Db4kXyUjvQgbI/APY5idGi9sHHQysMs
         YIsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:content-transfer-encoding:content-language
         :in-reply-to:mime-version:user-agent:date:message-id:from:references
         :cc:to:subject;
        bh=Ud5CZPq3kJrXzfrjtH+kb4Yu5twY5TnGUIDlLZAVb0M=;
        b=lyqeFk65NOpGrlkJmEb0kePGnM/LVYoNRBhPutGP3M0hhB/Y2qGeH1n1ROkFFvRq+e
         o4RtC7YQ3djQsFWHhpmj2/I9KYLJEQ9+V7v4R7g6sdCXnrCaCwUusYhY+5i5nESfBqZl
         CJKSPDcmUcEeYS7IvuLQ6HCBANIQg/4cdAC8kfqvQHrc1NxX2Q9cWEeIZwJfkRvLonk+
         n9ljaQlsQgKez4s4rFdby6OUAUC1wHHrhoPx8/mIXrvC2VJ7h57kTDyAloiHDiaB96MH
         8xfkfQr/PwRRhdBUvZJRFZxCc4P7PoXonVV7fuLWg+VzVUnacYFWCnyk2csbtzi0x3zA
         rQbw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=fail (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from out1.vger.email (out1.vger.email. [2620:137:e000::1:20])
        by mx.google.com with ESMTP id eh20-20020a0564020f9400b0045174ca49fesi1230628edb.67.2022.09.20.04.16.26;
        Tue, 20 Sep 2022 04:16:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) client-ip=2620:137:e000::1:20;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=fail (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230386AbiITLQZ (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 2 others); Tue, 20 Sep 2022 07:16:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230217AbiITLQU (ORCPT <rfc822;kvm@vger.kernel.org>);
        Tue, 20 Sep 2022 07:16:20 -0400
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DCCE6FA0D
        for <kvm@vger.kernel.org>; Tue, 20 Sep 2022 04:16:19 -0700 (PDT)
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.56])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MWzPz6NLszMnNF;
        Tue, 20 Sep 2022 19:11:35 +0800 (CST)
Received: from kwepemm600007.china.huawei.com (7.193.23.208) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 20 Sep 2022 19:16:16 +0800
Received: from [10.174.185.179] (10.174.185.179) by
 kwepemm600007.china.huawei.com (7.193.23.208) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 20 Sep 2022 19:16:15 +0800
Subject: Re: [kvm-unit-tests PATCH v4 07/12] arm: pmu: Basic event counter
 Tests
To:     <eric.auger@redhat.com>
CC:     <eric.auger.pro@gmail.com>, <maz@kernel.org>,
        <kvmarm@lists.cs.columbia.edu>, <kvm@vger.kernel.org>,
        <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>,
        <andrew.murray@arm.com>, <andre.przywara@arm.com>
References: <20200403071326.29932-1-eric.auger@redhat.com>
 <20200403071326.29932-8-eric.auger@redhat.com>
 <8fa32eeb-f629-6c27-3b5f-a9a81656a679@huawei.com>
 <82f23813-a8ca-d350-891f-100d23c9601e@redhat.com>
From:   Zenghui Yu <yuzenghui@huawei.com>
Message-ID: <2f39a968-92fe-8ac7-94ab-e16f07019574@huawei.com>
Date:   Tue, 20 Sep 2022 19:16:14 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <82f23813-a8ca-d350-891f-100d23c9601e@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.185.179]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemm600007.china.huawei.com (7.193.23.208)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-6.4 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: SZ5mHVIP+Cmm

Hi Eric,

On 2022/9/20 17:23, Eric Auger wrote:
> Hi Zenghui,
> 
> On 9/19/22 16:30, Zenghui Yu wrote:
>> Hi Eric,
>>
>> A few comments when looking through the PMU test code (2 years after
>> the series was merged).
> 
> Thank you for reviewing even after this time! Do you want to address the
> issues yourself and send a patch series or do you prefer I proceed?

It'd be great if you could help to proceed. I'm afraid that I don't
have enough time to deal with it in the next few days.

Thanks,
Zenghui
