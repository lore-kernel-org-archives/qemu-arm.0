Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp245216lfg;
        Thu, 1 Apr 2021 00:39:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwgtcB59BAcSETXCwVBDid46IlTxWBEI2NKR5YytJzAboF+Nh9dt4973FkDpMIanVD6p/Cx
X-Received: by 2002:a25:bc4e:: with SMTP id d14mr10728040ybk.67.1617262782605;
        Thu, 01 Apr 2021 00:39:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1617262782; cv=none;
        d=google.com; s=arc-20160816;
        b=Au1d6DX8GPr86pDPpsGUeoGqlxATnGDwi4zLMsucyORCdxuT/cRCFuEYMJiylsLAB4
         L8wEn8NkLOg0lTUrZvFK3R/6Nf4TDJjgR9SrHQlIieS/SNGSaoYV2P33DK1Td/WByYSB
         lQPQfQspH0UfgeLFzr1oe3LycP69bbYKBoSn5hebZeFYbTVeyo/nGBwpzfLLAK0zPMWo
         pWU1Sms20xk13/NSswW6Aw040cY66HD70q6pb/rPfcRTQt80Y6c2BzO+Bur4iLzNA9Wa
         5zqZ2BhKCczTGpeynwMMOAKxJwPhZeFRnbt3PAv5ntHhAKz3Sa4oAmVwXrbhg+Q9X43D
         56kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=TU0r91KXX4rtNU+1Zyu6MJRpyfSjCZRLlbvHXG8v7A0=;
        b=Hf8FWDJ4FaoSPcavxapeyonaqFehiG8fvTJZVPtdi5ar0ziVZhTQJb5dtAb/vq4T1M
         AF6OotNHdZtRrjKLMUEyrTr/vCEpN/L22ErJEEV9s/KHsGkO2jZWBqsv8AcabJ2ijZRr
         uEeFJNJFsdWI7UNomg4/IsM2UcSqVtlLcG7rM6w6sIr+kDo3Ug8A3qMPS7V/yt7wcLig
         P0SsAQ4KebaXNX7WavBz8eSuRkI0LTl4ovNAoClDuSvTCIX55lwnpq8ScmaOTcXshS9f
         xx2gYiPixr2Kl3npBpQBB7nJELBiz829K3G7a8bwIL+p3Yqx/sBP3Werzc8sx+TIdowE
         Oksw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r10si4841638ybb.236.2021.04.01.00.39.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 01 Apr 2021 00:39:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:54228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lRrvZ-0002sF-UQ
	for alex.bennee@linaro.org; Thu, 01 Apr 2021 03:39:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuzenghui@huawei.com>)
 id 1lRrvR-0002s2-08; Thu, 01 Apr 2021 03:39:33 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:4493)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuzenghui@huawei.com>)
 id 1lRrvL-0002YJ-3f; Thu, 01 Apr 2021 03:39:32 -0400
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4F9w4W04FqzyNPW;
 Thu,  1 Apr 2021 15:37:15 +0800 (CST)
Received: from [10.174.185.179] (10.174.185.179) by
 DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server id
 14.3.498.0; Thu, 1 Apr 2021 15:39:11 +0800
Subject: Re: [PATCH for-6.0] Revert "target/arm: Make number of counters in
 PMCR follow the CPU"
To: Peter Maydell <peter.maydell@linaro.org>, <qemu-arm@nongnu.org>,
 <qemu-devel@nongnu.org>
References: <20210331154822.23332-1-peter.maydell@linaro.org>
From: Zenghui Yu <yuzenghui@huawei.com>
Message-ID: <1860c98c-edb7-7a89-969a-9f2f67847abf@huawei.com>
Date: Thu, 1 Apr 2021 15:39:09 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20210331154822.23332-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.185.179]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191; envelope-from=yuzenghui@huawei.com;
 helo=szxga05-in.huawei.com
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
Cc: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 wanghaibin.wang@huawei.com, Leif Lindholm <leif@nuviainc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QgNo9M4CYATI

This works for me.

Tested-by: Zenghui Yu <yuzenghui@huawei.com>
