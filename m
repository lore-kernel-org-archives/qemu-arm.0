Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp228995lff;
        Tue, 3 Dec 2019 22:16:18 -0800 (PST)
X-Google-Smtp-Source: APXvYqw1qrtiB/8+lVFLO/HILiNOrdOC3mBvVSSEa4nnnNgCHXqzJpTyCH6doNNOZc4acYc8CofS
X-Received: by 2002:aa7:cccf:: with SMTP id y15mr2243779edt.108.1575440178284;
        Tue, 03 Dec 2019 22:16:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575440178; cv=none;
        d=google.com; s=arc-20160816;
        b=kwafOwqT2e2PL3eO26TrvFKs+BVdQIh03yNqvTBf54FCgQWBv1bT92mBFoHhcZhWnV
         7tL0TlJWvqsNzWug2hyozyXdXqSfj0+CsD3GOiNu44jplTaOuUZ0xGyAnPMAdU6xiLni
         Q3tptzu/bZHxZzP5hmls4Q8csoRnAceF+8FtxDd7lRLnxtFmcZcI0OYIW6ckKYnFckzk
         /gLztpI/cDFxKGKez9z2qGXqOv+QqfdFNJBlzgTsemLr2bbyEwmAZWysTKdlkGyzyhUg
         LTLUo+0T/zoyFm3GavEyI7pIiewYYjOrUlDaQfB5oCOmN/thmzsCEAUx3X49OvFE4o5L
         hVNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:references:to:subject:from;
        bh=weGVvQ6e77ceel4hiKifDcCT4kRBjfzitLnQ75gVxaY=;
        b=0el68tTZbxuaQZ8iySdO6da4E+9qKMgQ2xL+pbDfK1n3UaPNr7BqvLWK3mSfSuGiwd
         WPj3i9b9T7Pw4QorK4KtavDXwgija0mSYXsFpmfrPTcGfRqPUZ1bAC/3AI2hLOTbnw3B
         aKGHDX4spS7NJEnk735y1fWHu1HYz6jKp6wtx2Bjl4/Uy9Waif//nLqpc/4zok7QWZ0Q
         2TXMbTIjl8sD0kU5G25BuBeuBhe5veJ9z7b11ekBzLveOyYLY1khHMzMyV/L7G/sQLHw
         7N6njl1dOl8j2zgeI7AvtqLkPlGbS5uiBKz//n//lhvSVbycykFWRzyC8u6IbbjghsFh
         ERsQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c19si4025803eds.386.2019.12.03.22.16.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Dec 2019 22:16:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:34388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1icNxP-0002SG-4j
	for alex.bennee@linaro.org; Wed, 04 Dec 2019 01:16:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49113)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zhengxiang9@huawei.com>) id 1icNva-0002Qp-Px
 for qemu-arm@nongnu.org; Wed, 04 Dec 2019 01:14:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <zhengxiang9@huawei.com>) id 1icNvU-0005Pl-BP
 for qemu-arm@nongnu.org; Wed, 04 Dec 2019 01:14:19 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2210 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <zhengxiang9@huawei.com>)
 id 1icNvT-0004YT-Te; Wed, 04 Dec 2019 01:14:16 -0500
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 6A12D230597084F36CD4;
 Wed,  4 Dec 2019 14:14:00 +0800 (CST)
Received: from [127.0.0.1] (10.133.224.57) by DGGEMS402-HUB.china.huawei.com
 (10.3.19.202) with Microsoft SMTP Server id 14.3.439.0; Wed, 4 Dec 2019
 14:13:54 +0800
From: Xiang Zheng <zhengxiang9@huawei.com>
Subject: Re: [PATCH 1/5] tests: fw_cfg: Rename pc_fw_cfg_* to fw_cfg_*
To: Peter Maydell <peter.maydell@linaro.org>
References: <20191203122753.19792-1-zhengxiang9@huawei.com>
 <20191203122753.19792-2-zhengxiang9@huawei.com>
 <CAFEAcA_TbC2haopmmbLChuE1bxA2KV74fximNu5kQ1pQB9VmYA@mail.gmail.com>
Message-ID: <76a92f2e-bf55-77e1-7691-30d76298aeca@huawei.com>
Date: Wed, 4 Dec 2019 14:13:53 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_TbC2haopmmbLChuE1bxA2KV74fximNu5kQ1pQB9VmYA@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.133.224.57]
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>,
 wanghaibin.wang@huawei.com, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: i26EI6OaFinX



On 2019/12/3 20:34, Peter Maydell wrote:
> On Tue, 3 Dec 2019 at 12:29, Xiang Zheng <zhengxiang9@huawei.com> wrote:
>>
>> Rename pc_fw_cfg_* to fw_cfg_* to make them common for other
>> architectures so that we can run fw_cfg tests on aarch64.
>>
>> Signed-off-by: Xiang Zheng <zhengxiang9@huawei.com>
> 
>> -static inline QFWCFG *pc_fw_cfg_init(QTestState *qts)
>> +static inline QFWCFG *fw_cfg_init(QTestState *qts)
>>  {
>> -    return io_fw_cfg_init(qts, 0x510);
>> +    const char *arch = qtest_get_arch();
>> +
>> +    if (!strcmp(arch, "aarch64")) {
>> +        return mm_fw_cfg_init(qts, 0x09020000);
>> +    } else {
>> +        return io_fw_cfg_init(qts, 0x510);
>> +    }
> 
> Presence and address of the fw_cfg device depends
> on the machine type, not the architecture, so is
> it possible to write this so that it varies by
> machine type, rather than by guest arch ?
> There should also presumably be a fallback path
> for "fw_cfg not present here", I suppose.
> 

Yes, "0x09020000" is the address of the fw_cfg device on virt machine, I
should have noticed it. I will have a try for varying the addresses
by machine type.

-- 

Thanks,
Xiang

