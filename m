Received: by 2002:a17:906:489:b0:a44:3ba0:e9d1 with SMTP id f9csp817116eja;
        Thu, 29 Feb 2024 19:43:18 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX4e5ykGf68GwmTu2QgoVPA915bdiRrJK3SrvplILvqLJaazChXIza1OvFI/l7rJgW+1oUCz8KpvGBA1DlgKQGk1Y6hldGU
X-Google-Smtp-Source: AGHT+IEWky/IjUZtWg3AjNnbHiA1Pn6CR4/7ZD+feJFwBLsVRBth5qYxY1XPdYfyIHbWkaXjPeoq
X-Received: by 2002:ad4:42ac:0:b0:68f:f701:e357 with SMTP id e12-20020ad442ac000000b0068ff701e357mr638012qvr.12.1709264597951;
        Thu, 29 Feb 2024 19:43:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709264597; cv=none;
        d=google.com; s=arc-20160816;
        b=Zq9pogsCgt00VhPg18O4hJ6I5QJ4KSXw9gNzxlSD8zgncvIlLQp94QX9PhOciLuPj9
         tg8RJ41eot6iGGxzzffmCnJQTv/jm5Rd0FrW0FGOnfUA9O0ZICxuXFVd2oRknbd24ugf
         PGudUq8gxJqXX3rQbwYRsvHVsrE94+mNjGKC999z6JF37KR3XFIlvNFpKef8UWn4H7Tx
         e1UGZZ8+nZ6l9oXHMHmLbqznuPEdBNIPDma+o/L626Fz9qRl9Unb4KQm+RLS39t82EgM
         9WDQdv42q9AHGlgZMLI+X2cyUo96cWJLbdSHp1H6aMoRB5U0Efc1wPDgudPoZ8nZKuww
         L5zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:in-reply-to:references:to
         :content-language:subject:user-agent:mime-version:date:message-id;
        bh=EmfVvnEzYn8DoQNW1PzbBO7zKuI7neJpRg6B5Yp896c=;
        fh=/TX5S8kgkt7/rBZYZ+crJ/+YKPw+5BFKLYKcqwsm7JU=;
        b=E4P4uXtsq13HCXmBI84EOlgROTsdUtAbBRfbNmFR3YaptnH5Ttgx5/cVi0QfQHChXT
         ZXK1/UtPvVLFb5a5Zi6eCd/hkx40pIdPDxcfK/Pz++CWo2FeEcxuXfuxI4AmdR9IZcoJ
         EMU4vSgfaYUQ+W7Ca6DJ+97bUm7jGiZK0Ty7BGyFD+1WZPlEKcXa7ImZgrSAFAn2CtTm
         U/ltOIhJQuVAGj4xpDdxlyqjdpUDmEaDjRsIVceSqTTewL5CgU2OFiNx841hRAp1D4SE
         vJnA5/wqmFdRRSYN9OouF73MtBKJvqaCAu6gbFCX+8KUku/5jUuDvFWdFZ7C00Gk1918
         NVsw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id kd28-20020a056214401c00b0068fa742692asi2761607qvb.577.2024.02.29.19.43.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Feb 2024 19:43:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rftnU-0003xU-JV; Thu, 29 Feb 2024 22:42:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rftnT-0003x5-FV; Thu, 29 Feb 2024 22:42:55 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rftnQ-0002bY-R4; Thu, 29 Feb 2024 22:42:55 -0500
Received: from mail.maildlp.com (unknown [172.19.163.17])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4TmDPk4sLZz2Bdgx;
 Fri,  1 Mar 2024 11:40:26 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id 2DE191A0172;
 Fri,  1 Mar 2024 11:42:43 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemi500008.china.huawei.com (7.221.188.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 1 Mar 2024 11:42:42 +0800
Message-ID: <10add4f2-68c5-14df-59d7-f6e27457c8b5@huawei.com>
Date: Fri, 1 Mar 2024 11:42:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [RFC PATCH v5 12/22] target/arm: Handle NMI in
 arm_cpu_do_interrupt_aarch64()
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
References: <20240229131039.1868904-1-ruanjinjie@huawei.com>
 <20240229131039.1868904-13-ruanjinjie@huawei.com>
 <e7fd1fba-ee1d-4b78-b743-128fa8217ed8@linaro.org>
In-Reply-To: <e7fd1fba-ee1d-4b78-b743-128fa8217ed8@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemi500008.china.huawei.com (7.221.188.139)
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=ruanjinjie@huawei.com; helo=szxga04-in.huawei.com
X-Spam_score_int: -83
X-Spam_score: -8.4
X-Spam_bar: --------
X-Spam_report: (-8.4 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-4.176,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-TUID: fheaJih9n7P8



On 2024/3/1 7:09, Richard Henderson wrote:
> On 2/29/24 03:10, Jinjie Ruan via wrote:
>> According to Arm GIC section 4.6.3 Interrupt superpriority, the interrupt
>> with superpriority is always IRQ, never FIQ, so the NMI exception trap
>> entry
>> behave like IRQ. However, VNMI can be IRQ or FIQ, FIQ can only come from
>> hcrx_el2.HCRX_VFNMI bit, IRQ can be raised from the GIC or come from the
>> hcrx_el2.HCRX_VINMI bit.
>>
>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>> ---
>> v4:
>> - Also handle VNMI in arm_cpu_do_interrupt_aarch64().
>> v3:
>> - Remove the FIQ NMI handle.
>> ---
>>   target/arm/helper.c | 9 +++++++++
>>   1 file changed, 9 insertions(+)
>>
>> diff --git a/target/arm/helper.c b/target/arm/helper.c
>> index b796dbdf21..bd34b3506a 100644
>> --- a/target/arm/helper.c
>> +++ b/target/arm/helper.c
>> @@ -11459,12 +11459,21 @@ static void
>> arm_cpu_do_interrupt_aarch64(CPUState *cs)
>>           break;
>>       case EXCP_IRQ:
>>       case EXCP_VIRQ:
>> +    case EXCP_NMI:
>>           addr += 0x80;
>>           break;
>>       case EXCP_FIQ:
>>       case EXCP_VFIQ:
>>           addr += 0x100;
>>           break;
>> +    case EXCP_VNMI:
>> +        if (env->irq_line_state & CPU_INTERRUPT_VNMI ||
>> +            env->cp15.hcrx_el2 & HCRX_VINMI) {
>> +            addr += 0x80;
>> +        } else if (env->cp15.hcrx_el2 & HCRX_VFNMI) {
>> +            addr += 0x100;
>> +        }
>> +        break;
> 
> By not combining VFNMI with CPU_INTERRUPT_VNMI, you don't need this
> complication.
> Just
> 
>      case EXCP_IRQ:
>      case EXCP_VIRQ:
> +    case EXCP_NMI:

Not understand it. both VIRQ and VFIQ will set CPU_INTERRUPT_VNMI and
cause EXCP_VNMI if they have Superpriority, the distinction jump here is
necessary.

> 
> 
> r~
