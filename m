Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp236383lff;
        Tue, 3 Dec 2019 22:26:32 -0800 (PST)
X-Google-Smtp-Source: APXvYqyWTXajtdn5oVwTFOkuqWkSH51t56cI0tjfOk2b84mA2owDU1HYvXKSjz4xQGlC2NW8gjOI
X-Received: by 2002:aa7:cd49:: with SMTP id v9mr2185424edw.269.1575440792293;
        Tue, 03 Dec 2019 22:26:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575440792; cv=none;
        d=google.com; s=arc-20160816;
        b=cNHlk+d7gvAbmHJfbNzfwNA45CDh2j+bOcPTyxpchoXbGY3sIDtN4xv2eNG+Flt0kI
         u4Iny4cs+657MjEkZwTOCKCmGWm347mB5T91a5oeQStOsGjOQrzMSHI9iaQxGfWtXvSQ
         IAYLww5S3HqKARk4WafGBsa3PzxR0U0fKpD/ZPLk4QSm/29Cf0qcUCWfjGXI7E0Mo9KE
         ZW9YBDATXsyc2gokKdJ/dkhoXoBLgWnWTRjYKkOaQLf+ZZAOVfWlv435pyx2AdnADqTt
         qAxB51y+vhTvE9t27Lu4JpnIaaJHKJM+wN8jAuGyi3NYKJK4zxWatyTSvIR4qJEQKkr/
         TT2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=f7K/0VsAOZln+jsnCQ7dF2N4qwvYOhlSzEOX2dHujCE=;
        b=fgDEs7u+iJcx36VSx1eW3mElkneF21XXJ5VKi+Iwk0vAUJnlyhfElQq4QErabokjzX
         kHqUT9UByLybKjBrPKEQtHrp6J0tYkFy44VPHPtLifqwPT7iK2HD9BJzrcPBEdFAe778
         N4LioRhg0jCYxyqnuTr7LYBysxQPBW65zpHTgenZfwtFUCnTDoVo0EUro2nQyrvrTLmG
         gk/HnugOi55KBaYH5PpnVNntiC2wJLggRFOq8oWPHFz0SUZD0iUdiHugadVv7SCjt3ms
         0TcSG7YWAsnt9+Xw//tCQUF5POdRtDOdaSYyRAJ1wgVhYADuLh695U9164jz/GLiMi4P
         CfcA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w42si4180911edd.55.2019.12.03.22.26.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Dec 2019 22:26:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:34452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1icO7G-0005fN-AF
	for alex.bennee@linaro.org; Wed, 04 Dec 2019 01:26:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59005)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zhengxiang9@huawei.com>) id 1icNzb-0003hV-RK
 for qemu-arm@nongnu.org; Wed, 04 Dec 2019 01:18:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <zhengxiang9@huawei.com>) id 1icNzU-0008Us-Pr
 for qemu-arm@nongnu.org; Wed, 04 Dec 2019 01:18:26 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:45878 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <zhengxiang9@huawei.com>)
 id 1icNzU-0007np-BZ; Wed, 04 Dec 2019 01:18:24 -0500
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 9EB029CEB8646D368816;
 Wed,  4 Dec 2019 14:18:14 +0800 (CST)
Received: from [127.0.0.1] (10.133.224.57) by DGGEMS405-HUB.china.huawei.com
 (10.3.19.205) with Microsoft SMTP Server id 14.3.439.0; Wed, 4 Dec 2019
 14:18:06 +0800
Subject: Re: [PATCH 0/5] tests: Enable fw_cfg tests on AArch64
To: Thomas Huth <thuth@redhat.com>, <peter.maydell@linaro.org>,
 <lvivier@redhat.com>
References: <20191203122753.19792-1-zhengxiang9@huawei.com>
 <b5ef73c8-fa23-8efe-ef03-1d223a49bb93@redhat.com>
From: Xiang Zheng <zhengxiang9@huawei.com>
Message-ID: <b8ac6a18-36d6-20a1-4c04-f6742572c7c7@huawei.com>
Date: Wed, 4 Dec 2019 14:18:04 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <b5ef73c8-fa23-8efe-ef03-1d223a49bb93@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.133.224.57]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.32
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
Cc: lersek@redhat.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 kraxel@redhat.com, wanghaibin.wang@huawei.com, pbonzini@redhat.com,
 philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: X4xdPm2XUkoi



On 2019/12/3 21:01, Thomas Huth wrote:
> On 03/12/2019 13.27, Xiang Zheng wrote:
>> There are quite a few tests disabled on AArch64 such as fw_cfg-tests.
>> This patch series fix some problems in test code and adapt it to
>> virt machine.
>>
>> Xiang Zheng (5):
>>   tests: fw_cfg: Rename pc_fw_cfg_* to fw_cfg_*
>>   tests: fw_cfg: Support read/write of fw_cfg registers on aarch64
>>   tests: fw_cfg: Use virt as default machine in fw_cfg-test.c
>>   hw/arm/virt: Add FW_CFG_RAM_SIZE and FW_CFG_MAX_CPUS into fw_cfg
>>   tests: Enable fw_cfg test on aarch64
> 
>  Hi,
> 
> this breaks "make check-qtest-ppc64":
> 
>   TEST    check-qtest-ppc64: tests/boot-order-test
> **
> ERROR:tests/boot-order-test.c:40:test_a_boot_order: assertion failed
> (actual == expected_boot): (0x00000000 == 0x00000063)
> 
> Please make sure that "make check" continuous to work with all other
> targets, too.
> 

Hi Thomas,

Thanks for your suggestion, I will make sure for that. :)

-- 

Thanks,
Xiang

