Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp1884370lfg;
        Fri, 26 Mar 2021 19:25:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxXM3Y4wm306PbmdMOCXS4vEmDWFK/VzdbLe9hBide690Ah9wBJagCe1jTevSYSO4IkA38q
X-Received: by 2002:a25:5d6:: with SMTP id 205mr24277317ybf.344.1616811955016;
        Fri, 26 Mar 2021 19:25:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616811955; cv=none;
        d=google.com; s=arc-20160816;
        b=lp6p8fhbPd/KYH0/6kRZ3AVhbKpFowMbtpweIoFDFJjkbnkWp1ZLKONOaUrIrjejyM
         Ywi+hEL0PPjZtprt4J4if8ZlsXyrZ4BzIRG6KC8b/CVnyidkFqoSm1aQiqrBdweZiddr
         UFB28rLx6cgBd8M4Yk3WqJY8Uud6o6MkCPAPV2oybkv0XYku1ERoH3+iUg6pEpbn8FLJ
         w/4aNZY2AaXyBTf52CpdthfBnOcd90FgGSpjNQfi3QEt6/Ksi26wXEZmvq6pUS3kwLUu
         CM1X2I+gv5DOGx25ChlrG/c5UdHrSQ7NzKt3kEatN4pdulrNaWwW9Mk9WcGqwzj8ZC1K
         GRrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:mime-version:user-agent:date:message-id
         :subject:from:to;
        bh=zsQ5OVUdEtZRl3pbaoD1/YM4lb5axA2w3dkk/dTpJnE=;
        b=KOx//l0GWFHba+HaEkNwJVm4E0sUqx0qNOxKbEUKZgC+Ht54U9qLgpEnKC4skd7oy7
         9KFTSFZzjI5M3dBOayVyJ7n00peeN0YmNJPzNRsZtCHlNaOG3MEHG/kpGnhJOGqGk6EE
         phvlhngyqT+B8266ypaPyjljBFEFCEDoaRgZUDQTytsUOySG0vA33NT9VnGc3eVs319W
         ioQAXIRt2YgVv5iXWIHBQK0wr7Zkku6CgxyLurFHNWZT0Lo9OEp6zAHLAFClmf+mn2+9
         fu83BJZ5IystPx8rUN9ZA4D4sOSfddTHc+wg8x8/KQbhTFPygvE9wIQe3o+JtARzAvYY
         QoAQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x10si4758241ybh.479.2021.03.26.19.25.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Mar 2021 19:25:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:58204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lPye6-0000ch-24
	for alex.bennee@linaro.org; Fri, 26 Mar 2021 22:25:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1lPydZ-0000cS-34; Fri, 26 Mar 2021 22:25:17 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:2500)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1lPydW-0002yQ-I1; Fri, 26 Mar 2021 22:25:16 -0400
Received: from dggeml406-hub.china.huawei.com (unknown [172.30.72.56])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4F6jJj67WxzWQF9;
 Sat, 27 Mar 2021 10:21:41 +0800 (CST)
Received: from dggema765-chm.china.huawei.com (10.1.198.207) by
 dggeml406-hub.china.huawei.com (10.3.17.50) with Microsoft SMTP Server (TLS)
 id 14.3.498.0; Sat, 27 Mar 2021 10:24:55 +0800
Received: from [10.174.185.210] (10.174.185.210) by
 dggema765-chm.china.huawei.com (10.1.198.207) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2106.2; Sat, 27 Mar 2021 10:24:55 +0800
To: Eric Auger <eric.auger@redhat.com>, Prem Mallappa
 <prem.mallappa@broadcom.com>, Peter Maydell <peter.maydell@linaro.org>,
 <linuc.decode@gmail.com>
From: Kunkun Jiang <jiangkunkun@huawei.com>
Subject: A question about the translation granule size supported by the vSMMU
Message-ID: <fa696532-5f04-aeeb-1ba3-6427675c6655@huawei.com>
Date: Sat, 27 Mar 2021 10:24:44 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.174.185.210]
X-ClientProxiedBy: dggeme709-chm.china.huawei.com (10.1.199.105) To
 dggema765-chm.china.huawei.com (10.1.198.207)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=jiangkunkun@huawei.com; helo=szxga01-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
Cc: Zenghui Yu <yuzenghui@huawei.com>,
 "wanghaibin.wang@huawei.com" <wanghaibin.wang@huawei.com>,
 "open list:ARM SMMU" <qemu-arm@nongnu.org>, Keqian Zhu <zhukeqian1@huawei.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bwuGJmKMukx5

Hi all,

Recently, I did some tests on SMMU nested mode. Here is
a question about the translation granule size supported by
vSMMU.

There is such a code in SMMUv3_init_regs():

>    /* 4K and 64K granule support */
>     s->idr[5] = FIELD_DP32(s->idr[5], IDR5, GRAN4K, 1);
>     s->idr[5] = FIELD_DP32(s->idr[5], IDR5, GRAN64K, 1);
>     s->idr[5] = FIELD_DP32(s->idr[5], IDR5, OAS, SMMU_IDR5_OAS); /* 44 
> bits */
Why is the 16K granule not supported? I modified the code
to support it and did not encounter any problems in the
test. Although 4K and 64K minimal granules are "strongly
recommended", I think vSMMU should still support 16K.😉
Are there other reasons why 16K is not supported here?

When in SMMU nested mode, it may get errors if pSMMU
doesn't support 16K but vSMMU supports 16K. But we
can get some settings of pSMMU to avoid this situation.
I found some discussions between Eric and Linu about
this [1], but this idea does not seem to be implemented.

[1] https://lists.gnu.org/archive/html/qemu-arm/2017-09/msg00149.html

Best regards,
Kunkun Jiang

