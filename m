Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp2460864lfm;
        Tue, 16 Jun 2020 02:49:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzm2EKBbI/HmpNzNKKn1k4jYxxddmk0n8XgGAdu3agEeRLuvdZQCDP7nXpDjXZGDrCrUBRn
X-Received: by 2002:a25:3b94:: with SMTP id i142mr2657812yba.46.1592300964707;
        Tue, 16 Jun 2020 02:49:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592300964; cv=none;
        d=google.com; s=arc-20160816;
        b=AgBIWinUU95gNfsAj2+W1tTVE5BdOqZmxigWbe0TN4UyKav3J86MtTD4PJDLCD7C34
         PkitrDacI4MYNLCcr2Ql7c3BHT9n5qSFtUCMHATuH+0lTDtcL+PuhlM+7blunyeFglxq
         FfrCF0/0IdzeTAEx4tHTzlIZEfDL7txpC18EkaK1s+PpBn7TDafpo9sbrNXbWyXQ7bvP
         mutLuZE1EyeEsIEzh4ZcmJ1vIket2GmccA1R+1srtVQYjwl2HDQD7oUq5TeE+E8Q8CvQ
         yA/w/kXHUYs6wr0bcFgf94UpnNO7wyv11IROIK645w8/hwlePsvbe0mJXMo30VlFbuk0
         rXlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:mime-version:user-agent:date:message-id:from:references
         :to:subject;
        bh=0Crtl4fyOkJvY1dzxZuG6C1WOVHoUBK+/G9RnuBuwHw=;
        b=BGy4acmbz2uJ9S9dnYwtvt78l9eRLwOMO1iDV6ndzMnyp2LS9mMOeXnuVm3tlB6Zvi
         vhnUzThElwEVzJxcxX6vY6eyLZ5JQOG20/7oYC2gSbrZ/fSbnbU3aGLokWoy+vkoElzZ
         cyBbY07/KPOQDdaoAvexubjM4RsWd3jeDen9J1Idl6C6mmW+zvWg8lFI4IscdlOZm9Pv
         mcNXKbHU/gPE2AOZ8xdHblqeIDBt4jEG25b3OS4ZdBLdyG+BOChhuHJA+5hOwIQ/vsqm
         BbO78f/GgtuVc/9/G/27GMPymJde/Ed8zJRZZSlp542M/s+YKhKVR8cVkes1Md0+n9Bu
         1AHw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j11si15700967ybt.84.2020.06.16.02.49.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Jun 2020 02:49:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:35070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jl8Dc-0004Ow-53
	for alex.bennee@linaro.org; Tue, 16 Jun 2020 05:49:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1jl8DS-0004MO-Ll; Tue, 16 Jun 2020 05:49:14 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:33710 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1jl8DQ-0002eP-Lk; Tue, 16 Jun 2020 05:49:14 -0400
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 71BAB91A2A3153EE3CE0;
 Tue, 16 Jun 2020 17:49:04 +0800 (CST)
Received: from [10.173.221.230] (10.173.221.230) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.487.0; Tue, 16 Jun 2020 17:48:57 +0800
Subject: Re: [PATCH v2] migration: Count new_dirty instead of real_dirty
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20200616021059.25984-1-zhukeqian1@huawei.com>
 <20200616093551.GA2790@work-vm>
From: zhukeqian <zhukeqian1@huawei.com>
Message-ID: <3a45d5a0-3acf-336d-520f-523bf588b551@huawei.com>
Date: Tue, 16 Jun 2020 17:48:57 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <20200616093551.GA2790@work-vm>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.173.221.230]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.32; envelope-from=zhukeqian1@huawei.com;
 helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/16 05:49:05
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: zhang.zhanghailiang@huawei.com, Paolo Bonzini <pbonzini@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Chao
 Fan <fanc.fnst@cn.fujitsu.com>, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 jianjay.zhou@huawei.com, wanghaibin.wang@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YKy5ZEs69ZZk

Hi Dave,

On 2020/6/16 17:35, Dr. David Alan Gilbert wrote:
> * Keqian Zhu (zhukeqian1@huawei.com) wrote:
>> real_dirty_pages becomes equal to total ram size after dirty log sync
>> in ram_init_bitmaps, the reason is that the bitmap of ramblock is
>> initialized to be all set, so old path counts them as "real dirty" at
>> beginning.
>>
>> This causes wrong dirty rate and false positive throttling at the end
>> of first ram save iteration.
>>
>> Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
> 
> Since this function already returns num_dirty, why not just change the
> caller to increment a counter based off the return value?
Yes, that would be better :-) .

> 
> Can you point to the code which is using this value that triggers the
> throttle?
> 
In migration_trigger_throttle(), rs->num_dirty_pages_period is used.
And it corresponds to real_dirty_pages here.

Thanks,
Keqian

> Dave
> 
> 
[...]
>>
>>
> --
> Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
> 
> .
> 
