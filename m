Received: by 2002:a17:906:bc5a:b0:a46:bbde:2c08 with SMTP id s26csp908076ejv;
        Thu, 21 Mar 2024 19:54:58 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUY4x0WT3POh0I0g8spWS/N1Niybt5Zlin3Ta/+l/FomqjaxfuEnk7QGHr3a4aU+Nh7bZLnkweu6V7wtoJqsI+eEW7/sl35
X-Google-Smtp-Source: AGHT+IHnPidjXwkKCEvOHd/rQ1PLmClEo7GgDCmLPCIm+XvS+PKnXHMBF6TCRRT8ar1i3L2EELJr
X-Received: by 2002:a0d:e404:0:b0:609:6eb0:4714 with SMTP id n4-20020a0de404000000b006096eb04714mr1009953ywe.34.1711076098104;
        Thu, 21 Mar 2024 19:54:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711076098; cv=none;
        d=google.com; s=arc-20160816;
        b=CHJsbpU4lIA28m3Zwwtu4tNHR5U4Ff8oecbTD3+4MnB50dZYsFJyCLJ5jfMcuj2UOY
         0rnOId6ajCehZgxmUg4P+v9J4LcN+Z+Qf+sxoLkpDJriqNa0X3VKsSDL3SV/jxezS63o
         XIKuJfAkMzooW24Ryi7PsjVTM2A57AhIKwYpq8quG7xMt4VAiHMnImwiAP1wfscjgnvh
         LkinK0zbW77p0E5MZ+wVu+dP+4ADsWbtYaXBPgWZb/l+u+ulFoTMew0HXBevU6RlpPOo
         WZVemFgF1W/Ou98MlmTLb8/LqZhIQt2FTRA3JAZwhMCIVniXcrO/7ItVDEkub8EFnDJd
         dxDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id;
        bh=Cm50oTufDfMSTP43pvmyqALIUqoQnlZgWYXE11queA8=;
        fh=/MSHAyhUJiTYoT4ekOyS/HopHNLqBW111kC/699+MBU=;
        b=v/r8m0EDpGddBzE6sPCf0lEtY8g1zTzP8T+0RCfDkd4yiQZubiKur3IO7XvnkCO0Ye
         JePZzm/eJvDOX/7+UAm0HsKtHaS1TqcZy/DtSoePTYdVZE1JYEYPazT2SZ2B+2rzagrs
         ECNrdzTADdGSwTuKsB7ajKFCuUNCG2jBy0DHX2VIRoju+o/QdaeHwWx7AwcI+kV1lsj3
         w6/q3tx4sa5IvYmaBP+vUDM3e4kHuPHetFFxaFrIyuJlYaAcLwT6/f2uGaL/D46CjR9A
         NOnLPSeSxA06O+fuQkATeRAtDQz2jVm5X5dP01kzIr9LJj8psHpak/MjHFh5cPdDS2MV
         6oIw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f3-20020ac85d03000000b00430a07f5c5fsi1235776qtx.524.2024.03.21.19.54.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Mar 2024 19:54:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rnV3Q-0007nn-PS; Thu, 21 Mar 2024 22:54:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rnV3P-0007nY-MT; Thu, 21 Mar 2024 22:54:47 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rnV3M-0006XR-Kw; Thu, 21 Mar 2024 22:54:47 -0400
Received: from mail.maildlp.com (unknown [172.19.88.194])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4V16LB1K7fzwPsY;
 Fri, 22 Mar 2024 10:52:02 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id A09C5140444;
 Fri, 22 Mar 2024 10:54:36 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemi500008.china.huawei.com (7.221.188.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 22 Mar 2024 10:54:35 +0800
Message-ID: <63399f3b-1569-07c3-5784-7efd6dadb742@huawei.com>
Date: Fri, 22 Mar 2024 10:54:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [RFC PATCH v8 13/23] hw/intc/arm_gicv3: Add irq superpriority
 information
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
CC: <eduardo@habkost.net>, <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, 
 <wangyanan55@huawei.com>, <richard.henderson@linaro.org>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
References: <20240318093546.2786144-1-ruanjinjie@huawei.com>
 <20240318093546.2786144-14-ruanjinjie@huawei.com>
 <CAFEAcA_VWko1zNvbdGNBgHJ3TiC1duiQ0wZLJUnDhLomULVayQ@mail.gmail.com>
In-Reply-To: <CAFEAcA_VWko1zNvbdGNBgHJ3TiC1duiQ0wZLJUnDhLomULVayQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemi500008.china.huawei.com (7.221.188.139)
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=ruanjinjie@huawei.com; helo=szxga01-in.huawei.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.36,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: N2Qj6wxR9HU4



On 2024/3/21 21:17, Peter Maydell wrote:
> On Mon, 18 Mar 2024 at 09:38, Jinjie Ruan <ruanjinjie@huawei.com> wrote:
>>
>> A SPI, PPI or SGI interrupt can have a superpriority property. So
>> maintain superpriority information in PendingIrq and GICR/GICD.
>>
>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>> Acked-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>> v3:
>> - Place this ahead of implement GICR_INMIR.
>> - Add Acked-by.
>> ---
>>  include/hw/intc/arm_gicv3_common.h | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/include/hw/intc/arm_gicv3_common.h b/include/hw/intc/arm_gicv3_common.h
>> index 7324c7d983..df4380141d 100644
>> --- a/include/hw/intc/arm_gicv3_common.h
>> +++ b/include/hw/intc/arm_gicv3_common.h
>> @@ -146,6 +146,7 @@ typedef struct {
>>      int irq;
>>      uint8_t prio;
>>      int grp;
>> +    bool superprio;
>>  } PendingIrq;
>>
>>  struct GICv3CPUState {
>> @@ -172,6 +173,7 @@ struct GICv3CPUState {
>>      uint32_t gicr_ienabler0;
>>      uint32_t gicr_ipendr0;
>>      uint32_t gicr_iactiver0;
>> +    uint32_t gicr_isuperprio;
> 
> This field stores the state that is in the GICR_INMIR0
> register, so please name it that way: gicr_inmir0.
> 
>>      uint32_t edge_trigger; /* ICFGR0 and ICFGR1 even bits */
>>      uint32_t gicr_igrpmodr0;
>>      uint32_t gicr_nsacr;
>> @@ -274,6 +276,7 @@ struct GICv3State {
>>      GIC_DECLARE_BITMAP(active);       /* GICD_ISACTIVER */
>>      GIC_DECLARE_BITMAP(level);        /* Current level */
>>      GIC_DECLARE_BITMAP(edge_trigger); /* GICD_ICFGR even bits */
>> +    GIC_DECLARE_BITMAP(superprio);    /* GICD_INMIR */
>>      uint8_t gicd_ipriority[GICV3_MAXIRQ];
>>      uint64_t gicd_irouter[GICV3_MAXIRQ];
>>      /* Cached information: pointer to the cpu i/f for the CPUs specified
>> @@ -313,6 +316,7 @@ GICV3_BITMAP_ACCESSORS(pending)
>>  GICV3_BITMAP_ACCESSORS(active)
>>  GICV3_BITMAP_ACCESSORS(level)
>>  GICV3_BITMAP_ACCESSORS(edge_trigger)
>> +GICV3_BITMAP_ACCESSORS(superprio)
> 
> This is the state behind the GICD_INMIR<n> registers, and
> the GIC spec calls the bits in those registers NMI<x>,
> so I would call this bitmap nmi, not superprio.
> 
> This commit adds new device state, so it also needs to be migrated.
> You'll want to add a new subsection to vmstate_gicv3_cpu which
> is present if the GIC implements NMIs, and which has an entry
> for the gicr_inmir0 field. Similarly, you want a new subsection
> in vmstate_gicv3 which is present if NMIs are implemented and which
> has a field for the nmi array.

OK, I'll add it.

> 
> thanks
> -- PMM
