Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp3795799lfa;
        Mon, 2 Nov 2020 02:15:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzY3H4Vv5tme4xC2T1lfvb4wo98xOvPDzOLOUWGbLw/JPWxjmrFtLA2jJ+RPWr/nG++BRmo
X-Received: by 2002:a25:ae97:: with SMTP id b23mr21352711ybj.26.1604312125018;
        Mon, 02 Nov 2020 02:15:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604312125; cv=none;
        d=google.com; s=arc-20160816;
        b=mFJhj2Ti1wSQFngmPVYgBu35JN5is03Kk4Yv0UyT0sSs4hql46mc1oAoMi1tiHWNn3
         QfiRe/AeUMBbzJqT0I/gaYhHKBxGNU9MtAbS/r2R3qgCIUf8jq/ponmF9JiX//vytpjd
         o3MorrSt9ZbF2G2QJEiFiXGNMSEO53juZ/lao1pvGg1W2/aa9UCOe+Cou6KJg6ExRgXT
         VzsA9TaQZkO/9kp9J1lRqEddhTw3mBavOQ8O0yJN6N2sXjiiI4BdUuuycEAX05cF9iuW
         wbzpulfJ2RSMlnQ3M+DbpqmHq8kj6ISFVLKiMCcRPyuXJE8T9x7I1AzTxMu2LZPCUbdz
         yZLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:references:subject:to:mime-version:user-agent:from:date
         :message-id;
        bh=vTW6En2bsAk9+eVDDlHXeTjski9Giu8KVvIrB7TnMOA=;
        b=Kfgxbmt/76TB7m94J8WD13nDEga9Xz26c7tTThG1iKWma+lWQXjY/x8qIhLYoI6zKt
         K701TXbR7cUOZfBHIOH9M8ORWw6JmkhzWWqazek+DmEsWMzsA+neujIsIU5wmnwsgZIS
         R0gB958yeVgUO7UDJqEqqHT4lqyaTmBxrnY6EcWwPJA4qdkfpvTocqx201WD7ZbZgrkB
         8eoDwIz0dRSMGPE78hyXehA7zax3gb/XOX92eqsjEeQvM5BiUXx5eYJt2OwkQFti43ru
         Q4C+DGahsYY2/lIXm55J6HClNQ4MOyOT1miC34FLJhcw4/FyMeTvzNmEnJ9fJDr7x2qW
         6dHA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v2si14430669ybe.345.2020.11.02.02.15.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Nov 2020 02:15:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:50944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kZWs0-0000dE-BQ
	for alex.bennee@linaro.org; Mon, 02 Nov 2020 05:15:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1kZWnb-00059o-GP; Mon, 02 Nov 2020 05:10:51 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:2066)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1kZWnY-00069t-BM; Mon, 02 Nov 2020 05:10:50 -0500
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4CPpZn4jQ1zhZ39;
 Mon,  2 Nov 2020 18:10:41 +0800 (CST)
Received: from [10.174.187.138] (10.174.187.138) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.487.0; Mon, 2 Nov 2020 18:10:34 +0800
Message-ID: <5F9FDB1A.4010700@huawei.com>
Date: Mon, 2 Nov 2020 18:10:34 +0800
From: AlexChen <alex.chen@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.2; WOW64;
 rv:17.0) Gecko/20130509 Thunderbird/17.0.6
MIME-Version: 1.0
To: =?UTF-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Subject: Re: [PATCH V2] hw/display/exynos4210_fimd: Fix potential NULL pointer
 dereference
References: <5F9F8D88.9030102@huawei.com>
 <b2945df0-186e-e670-bdfc-34104d8ddf2c@redhat.com>
In-Reply-To: <b2945df0-186e-e670-bdfc-34104d8ddf2c@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.187.138]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.32; envelope-from=alex.chen@huawei.com;
 helo=szxga06-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/02 05:10:42
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU <qemu-devel@nongnu.org>, zhang.zhanghailiang@huawei.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5hlxP7migETZ

On 2020/11/2 17:16, Philippe Mathieu-Daudé wrote:
> On 11/2/20 5:39 AM, AlexChen wrote:
>> In exynos4210_fimd_update(), the pointer s is dereferinced before
> 
> Typo dereferinced -> dereferenced.
> 
>> being check if it is valid, which may lead to NULL pointer dereference.
>> So move the assignment to global_width after checking that the s is valid.
> 
> Easier to read "after checking 's' is valid."
> 
>>
>> Reported-by: Euler Robot <euler.robot@huawei.com>
>> Signed-off-by: Alex Chen <alex.chen@huawei.com>
>> ---
>>  hw/display/exynos4210_fimd.c | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> 

Thanks for your review, I will fix it in my patch V3.

Thanks,
Alex

