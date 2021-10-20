Received: by 2002:ac2:5f6a:0:0:0:0:0 with SMTP id c10csp1077441lfc;
        Tue, 19 Oct 2021 18:48:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxfhjUktou9VWgPc99wtQP1/fIm5aaCTJnR4n3r+6ppOyvZSn0XL2sj31W17yhJI9zVY775
X-Received: by 2002:a05:6830:4002:: with SMTP id h2mr8517426ots.49.1634694528534;
        Tue, 19 Oct 2021 18:48:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1634694528; cv=none;
        d=google.com; s=arc-20160816;
        b=k9m0JwL487cFrDRNIdLQDkY3GAbMhnsDqGRP7+s/ksnUKj+NLbQ0whSwxJxWBWlM9H
         y9Pr/HXWz+dMSPjiSOL7DxibdKDeURiZAW608Ju882gvM35C4J+G1I5E630hXECj23rO
         S9rw2GWvbePBekBRmjljUzt2qLSoUOZVxuKK5uFWx+IeQjOXmD/sHcH6dYBbdz/chIHx
         +B4+iiInHdTzz7uKMKXjIZKFrNJD5OyKVC7odMGWi2OGZzR6T7glYi0n1vbnTTc4PYEA
         qWq/EZCsTxzgfMmSoRfDoG9NmWMR+OMEqUZFHeuPADzUSpjl6hEOR7wf1mxIrz1FUL/X
         Perw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=2+Axril01hWaiprx4CkAeYQTbIPeVDI5K8MizCVPLGg=;
        b=fJgxRf7aalLgFWvbiuhP1SV9iLAZXMHyWfyx3ww9w5kgrUImz12cFE3BF3mD+Qyv4F
         BKUYF3UXDh9qK3lrBM/mjdOtmj9S5a6XtZziQ6Pi5c40ItAYhihF4NpWQHvysLI1mVWr
         zp33SppGchPjRBcaAwpPVdO/Aobkbw3xMeGba8FpYlG+6NY2xBmWBBkJAW8jIhVToEeH
         BRDMsy4rocrmZFfigvwQgJd0cGEOtm/pWhUtMYHe6X5IVtirX1ExaEMzGZhFSM6zcMC4
         y7hs8W+38aoq52JRwneHoj374zW2ctxououKeNPnfnCyVdSMP8IC6jjRWfQ+lNFiR6Lc
         cbpg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v16si901192otn.128.2021.10.19.18.48.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Oct 2021 18:48:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:44830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1md0il-00021B-OI
	for alex.bennee@linaro.org; Tue, 19 Oct 2021 21:48:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1md0bx-00087T-3P; Tue, 19 Oct 2021 21:41:45 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:2829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1md0bu-0005xz-QX; Tue, 19 Oct 2021 21:41:44 -0400
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4HYtWf5yz1zbhFL;
 Wed, 20 Oct 2021 09:37:02 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Wed, 20 Oct 2021 09:41:33 +0800
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.15; Wed, 20 Oct 2021 09:41:32 +0800
Subject: Re: [PATCH v8 6/8] tests/data/acpi/virt: Add an empty expected file
 for PPTT
To: "Michael S . Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>
References: <20211014132206.19220-1-wangyanan55@huawei.com>
 <20211014132206.19220-7-wangyanan55@huawei.com>
From: "wangyanan (Y)" <wangyanan55@huawei.com>
Message-ID: <5dae46cc-7ae2-06d5-8018-9313f8915003@huawei.com>
Date: Wed, 20 Oct 2021 09:41:32 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20211014132206.19220-7-wangyanan55@huawei.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme702-chm.china.huawei.com (10.1.199.98) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=wangyanan55@huawei.com; helo=szxga02-in.huawei.com
X-Spam_score_int: -62
X-Spam_score: -6.3
X-Spam_bar: ------
X-Spam_report: (-6.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.074,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 qemu-devel@nongnu.org, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YhHsXkqYMSJX

Ping...

On 2021/10/14 21:22, Yanan Wang wrote:
> Add a generic empty binary file for the new introduced PPTT table
> under tests/data/acpi/virt, and list it as files to be changed in
> tests/qtest/bios-tables-test-allowed-diff.h
>
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> ---
>   tests/data/acpi/virt/PPTT                   | 0
>   tests/qtest/bios-tables-test-allowed-diff.h | 1 +
>   2 files changed, 1 insertion(+)
>   create mode 100644 tests/data/acpi/virt/PPTT
>
> diff --git a/tests/data/acpi/virt/PPTT b/tests/data/acpi/virt/PPTT
> new file mode 100644
> index 0000000000..e69de29bb2
> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
> index dfb8523c8b..cb143a55a6 100644
> --- a/tests/qtest/bios-tables-test-allowed-diff.h
> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> @@ -1 +1,2 @@
>   /* List of comma-separated changed AML files to ignore */
> +"tests/data/acpi/virt/PPTT",

