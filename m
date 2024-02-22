Received: by 2002:a17:906:c8d8:b0:a3e:79c1:d636 with SMTP id gc24csp2284382ejb;
        Wed, 21 Feb 2024 17:53:07 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVebH8IZes0LA/z6PFoRJ3wUTHpLZd67QdMJSE7d/W0U+nM5M54oo1xzqxt1oR6v15dTUzaifVmNSl9iUlAoXB2/zwA6YFi
X-Google-Smtp-Source: AGHT+IEZgj/HXo+eVYPg5GBDsknex0GDiMOH8qbVE5igKsxSYXF2MKru/PW6rQxz27DaRch1CR0O
X-Received: by 2002:ac8:7fc4:0:b0:42a:62e5:7733 with SMTP id b4-20020ac87fc4000000b0042a62e57733mr25458105qtk.23.1708566787106;
        Wed, 21 Feb 2024 17:53:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708566787; cv=none;
        d=google.com; s=arc-20160816;
        b=zH3wLcCAq9ktWYF06ovr8ob/AlMgxGV7ldl16wo81RtpdPHRX25MRgR26qwKOAMBrt
         0L9CMIE/RRd0dUktncFE1ANwPRLDGsC5uAg87RpDINpWL/NR17rLgLu0hJP0A3fW83ac
         PNRdAXWj10Ln2wg6OCqWwd7psxK/JJ9KPGmOqAxB5H3QBL0gZbLagDhfu733uQmi+I4X
         hR9vbeff2CLJoQ7o4e1Eh6+gTviPT5A2uH4qHbuSOvTQQOgpMI/IA4U7v3SkhzqknW0o
         Ofhaiq8Uo5SzZSrfI0I9KvYr6uixdRa0IQDikKPLmrXt4/dM+TIVrvbgY37wVE7+u4sF
         MkUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:in-reply-to:references:to
         :content-language:subject:user-agent:mime-version:date:message-id;
        bh=bhXpOovEX8SfVDN6CzG+XSYIZKcmYyPEHB7vqETgHdU=;
        fh=/TX5S8kgkt7/rBZYZ+crJ/+YKPw+5BFKLYKcqwsm7JU=;
        b=H3r6iy4zsLLfQ5GuenrimQCEevp155cuJRwyNm2hsjW6rzNgoE46gYVA6ck00gLqqa
         PfzIG55pu8oRiJQ4CMzUEjoJl7ht9GTV6CABLb4ABvMvutPau/NM+ZsahB3hC6kICaRI
         Lk2qgg9pxXoxiiEafYBj49vJXqzCZDQJneKyvEmTAAWOAhmqupLNkeA5Xlmsz+LV1VMK
         O+CZybJ3/mdFsZ1e96e/8/02gy4BPwJPkMgyvgipxzt7CV08jbA0HolWrKT7GbTX5bTr
         /xv4FEGTMwl+kNtffCrJ3hXTLFTwX+rNDJ4cXdnQVbXAPKbIKhk/IApf+54SrPyZEhaY
         h7yw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q23-20020ac84517000000b0042c3e04578bsi10996701qtn.688.2024.02.21.17.53.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Feb 2024 17:53:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rcyGV-0004nj-GI; Wed, 21 Feb 2024 20:52:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rcyGT-0004fq-W1; Wed, 21 Feb 2024 20:52:46 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rcyGR-0007pY-JD; Wed, 21 Feb 2024 20:52:45 -0500
Received: from mail.maildlp.com (unknown [172.19.163.44])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4TgGHQ1g5fz1FKns;
 Thu, 22 Feb 2024 09:47:46 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id 9C2D9140383;
 Thu, 22 Feb 2024 09:52:38 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemi500008.china.huawei.com (7.221.188.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 22 Feb 2024 09:52:37 +0800
Message-ID: <531a573e-fab3-930c-6cf6-cc69846817a8@huawei.com>
Date: Thu, 22 Feb 2024 09:52:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [RFC PATCH v2 01/22] target/arm: Add FEAT_NMI to max
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
References: <20240221130823.677762-1-ruanjinjie@huawei.com>
 <20240221130823.677762-2-ruanjinjie@huawei.com>
 <c6271668-1bee-4ff4-9a9c-5fe6acee4937@linaro.org>
In-Reply-To: <c6271668-1bee-4ff4-9a9c-5fe6acee4937@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemi500008.china.huawei.com (7.221.188.139)
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=ruanjinjie@huawei.com; helo=szxga05-in.huawei.com
X-Spam_score_int: -74
X-Spam_score: -7.5
X-Spam_bar: -------
X-Spam_report: (-7.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.297,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Reply-to:  Jinjie Ruan <ruanjinjie@huawei.com>
From:  Jinjie Ruan via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: X92o4kgcpQ7q



On 2024/2/22 5:22, Richard Henderson wrote:
> On 2/21/24 03:08, Jinjie Ruan via wrote:
>> Enable FEAT_NMI on the 'max' CPU.
>>
>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>> ---
>>   docs/system/arm/emulation.rst | 1 +
>>   target/arm/tcg/cpu64.c        | 1 +
>>   2 files changed, 2 insertions(+)
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> 
> However, this patch must be sorted last, after all support for FEAT_NMI
> is present.

Good suggestion! Placed it last is more reasonable.

> 
> 
> r~
> 
>>
>> diff --git a/docs/system/arm/emulation.rst
>> b/docs/system/arm/emulation.rst
>> index f67aea2d83..91baf7ad69 100644
>> --- a/docs/system/arm/emulation.rst
>> +++ b/docs/system/arm/emulation.rst
>> @@ -63,6 +63,7 @@ the following architecture extensions:
>>   - FEAT_MTE (Memory Tagging Extension)
>>   - FEAT_MTE2 (Memory Tagging Extension)
>>   - FEAT_MTE3 (MTE Asymmetric Fault Handling)
>> +- FEAT_NMI (Non-maskable Interrupt)
>>   - FEAT_NV (Nested Virtualization)
>>   - FEAT_NV2 (Enhanced nested virtualization support)
>>   - FEAT_PACIMP (Pointer authentication - IMPLEMENTATION DEFINED
>> algorithm)
>> diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
>> index 5fba2c0f04..60f0dcd799 100644
>> --- a/target/arm/tcg/cpu64.c
>> +++ b/target/arm/tcg/cpu64.c
>> @@ -1175,6 +1175,7 @@ void aarch64_max_tcg_initfn(Object *obj)
>>       t = FIELD_DP64(t, ID_AA64PFR1, RAS_FRAC, 0);  /* FEAT_RASv1p1 +
>> FEAT_DoubleFault */
>>       t = FIELD_DP64(t, ID_AA64PFR1, SME, 1);       /* FEAT_SME */
>>       t = FIELD_DP64(t, ID_AA64PFR1, CSV2_FRAC, 0); /* FEAT_CSV2_2 */
>> +    t = FIELD_DP64(t, ID_AA64PFR1, NMI, 1);       /* FEAT_NMI */
>>       cpu->isar.id_aa64pfr1 = t;
>>         t = cpu->isar.id_aa64mmfr0;
> 
