Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp1412183lfm;
        Mon, 17 May 2021 09:05:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxJV2QqBmMbDdn7Kaj8vvyIqpFETFonniu+9LDs+CYj//vhF83nY9kOy/R5bdTCmNUhiUsv
X-Received: by 2002:a2e:b8d5:: with SMTP id s21mr126889ljp.163.1621267543810;
        Mon, 17 May 2021 09:05:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621267543; cv=none;
        d=google.com; s=arc-20160816;
        b=YLAw5XDCtZqX4ESVQ07DrIFhoPN6Z5lwQZqz1aL9w6qv1Qkh7HI2xJyPWB+pgcj/CJ
         Qj4NpqKb40qY/usjsdpCJmwPatVkRYuhm8OIBbCqbSnoh9hMCRaqpJyyhwh78ycFuTKg
         FaJEXMTGG77iZ9yG+bf2Unjde0ERjlOwChS3SdI5IKh667km/dxsL2aihXH2KILY6C5F
         C0RE/AjW6RwP3RzzdRNmbBMyYJiMBSppy26dncFQZ4Rn82g8KNstFEC40JPtWYBzh7cn
         lryK7g46R9vVD1BxG31aaghoZ0KF1E3ULqFQo6gSRjNJxNYZ6aP2rI7EfIBetO20NC8+
         dnPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=6O/IHc5ewWa9dTO3aVYAzD0eiASSUBLSXwkG3wd/Nl8=;
        b=dhtwUFZfx33YSzeaSSBVWVcU7Lv7FvGecYfL6NTvUP9tCT7jaUCBTqx5+sQxtwt4R4
         EEha2VvL4Jj7vDDLmn/xnjWrt0yVG5buM9IzR+czI7IzPHNgIQ1cTmA+pXSAblgPtl4Q
         XY35AcFe75xJ1aiH1r+eB5wY6sLvaBnUJa6VP0a5WjVGodPb2JbF8558FGt5rEG2vqjF
         Wc44KCdX6V9qn+O2yanR0lwtzyov4pPjdJis24U0F+gg+BVjgheR6vhVzFFJ7aXOBFRC
         uPXuoX/04IcuS/Ybrn9TWjLUojlWpCg4p6FbRxziLW/zeptZEUY0LK99gTNyJ0Q3Jg8W
         sp3g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y7si802470ljk.164.2021.05.17.09.05.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 May 2021 09:05:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:50348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lifkU-00089m-K4
	for alex.bennee@linaro.org; Mon, 17 May 2021 12:05:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1lifhM-0003Oq-O6; Mon, 17 May 2021 12:02:30 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:2287)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1lifhJ-0000zB-Tq; Mon, 17 May 2021 12:02:28 -0400
Received: from dggems706-chm.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FkP2v0TYCz17SLB;
 Mon, 17 May 2021 23:59:35 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggems706-chm.china.huawei.com (10.3.19.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 18 May 2021 00:02:18 +0800
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Tue, 18 May 2021 00:02:18 +0800
Subject: Re: [RFC PATCH v3 8/9] hw/arm/virt-acpi-build: Generate PPTT table
To: Andrew Jones <drjones@redhat.com>
References: <20210516102900.28036-1-wangyanan55@huawei.com>
 <20210516102900.28036-9-wangyanan55@huawei.com>
 <20210517080223.sajp445x5qsy57fq@gator.home>
 <2dee4bda-fe42-15b1-3a22-22decbc0dbd0@huawei.com>
 <20210517144518.enuc3x2eyzixvgx4@gator.home>
From: "wangyanan (Y)" <wangyanan55@huawei.com>
Message-ID: <63906b2c-26ec-0a45-4db7-815bd837706b@huawei.com>
Date: Tue, 18 May 2021 00:02:17 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210517144518.enuc3x2eyzixvgx4@gator.home>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme715-chm.china.huawei.com (10.1.199.111) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=wangyanan55@huawei.com; helo=szxga04-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Barry Song <song.bao.hua@hisilicon.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, wanghaibin.wang@huawei.com,
 zhukeqian1@huawei.com, qemu-devel@nongnu.org, yangyicong@huawei.com,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>, prime.zeng@hisilicon.com,
 Paolo Bonzini <pbonzini@redhat.com>, yuzenghui@huawei.com,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DwUUE3SI9Cwi


On 2021/5/17 22:45, Andrew Jones wrote:
> On Mon, May 17, 2021 at 09:43:34PM +0800, wangyanan (Y) wrote:
>> BTW, it seems patch 1 and 5 were possibly missed for some review.
>> Any comments for them too? Thanks!
> I reviewed them and agreed with them, but you already provided my
> s-o-b on them, so I didn't bother giving an r-b. Feel free to add
> my r-b to both, if you'd like.
I see, thanks !
> Thanks,
> drew
>
> .
