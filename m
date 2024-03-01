Received: by 2002:a17:906:489:b0:a44:3ba0:e9d1 with SMTP id f9csp1217269eja;
        Fri, 1 Mar 2024 09:45:28 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVjVddEnQbE81Yq8AuuNjpViKYKbe7LoYWNhvmQ/sMlUopebzy4LbY7RYTjWwPvrK6Yay/YyJjkNZ5+FhSRwAKBz+CpdlQJ
X-Google-Smtp-Source: AGHT+IF3nnb5loZEf7c3RxYiZA+0FtJjS3RBbGxMABacY0iUc1T66FIdZomE7FVbNFGeSZcczVHV
X-Received: by 2002:a05:6358:185:b0:17a:ec6c:4234 with SMTP id d5-20020a056358018500b0017aec6c4234mr3158517rwa.10.1709315128417;
        Fri, 01 Mar 2024 09:45:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709315128; cv=none;
        d=google.com; s=arc-20160816;
        b=0v23Sbky4CzL7UMttP4I3H6zPhDU8jCBH3tqy7D+kTKwXDuiCGwYvN8fFbeTuwEmOM
         vpei5kPl7CgqsJeTr7LRAQYuU8hfFagzzp6OjinMPMlCayG1G0mtPqLGlqnpCDeIF1rS
         T+6yBB12lZFn+D6CktOS4uuoXPnEwazfZnQUBymmN6FikwcEpiUZIqIndVP1dB67DNrr
         B5VSXVCuB8pgVoAxHSP4xjyiyVIpHSyT35xKEml/zyDkF/hTSlMf0J342h1VPBF8JSf6
         pb4gqKORrDaBGsxAz+eiSAeHNoHut5qwWGTWqViHzUivAS/WR268bpvpRc/q4DPoeVy3
         zaRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=VnZmTKzygX56ppgLY7ShI3HckZ75xFz/UpH6ipSd57w=;
        fh=9ZrX+TPMT2N/uq8priGS972Uu4DTINvz/HyxZWUtt9c=;
        b=PO14tmLdboSnnJTYKUVNAUVrfbbZST9DjKTJIBFOu5I1WUBKPn0xlSgbS1XT5mZRzp
         WPau0pcIYeKSO1Pvuucyqkr7U6c/iBkMHZLSp2Hml+uI+sLusxE6faZ8lRTPJ4749Bjb
         g8g8KimesmbLwx3awAccn5V2ZUN6VKxR5+/SFgZAKhQMlf3TL911s9jjr5ZouqK1XPFI
         6yxrGpJXVY4O80JMUHy5oElUWybMvzlURMFkemfRT89xeH1GqU7eOktFAaCI85F1hijV
         d4XQuT37tjTnBz1Kpfds+KjgXOu2hmoABHFT5Hb/dTLgF82vSpP4Iw/53xZn/J+iW6gW
         stRQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=y5ZNZgry;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id kk12-20020a056214508c00b0068cbf441156si3970703qvb.106.2024.03.01.09.45.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Mar 2024 09:45:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=y5ZNZgry;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rg6wQ-00049Q-9k; Fri, 01 Mar 2024 12:45:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rg6wO-00048C-1k
 for qemu-arm@nongnu.org; Fri, 01 Mar 2024 12:45:00 -0500
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rg6wM-00009l-Dq
 for qemu-arm@nongnu.org; Fri, 01 Mar 2024 12:44:59 -0500
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-6da9c834646so2015365b3a.3
 for <qemu-arm@nongnu.org>; Fri, 01 Mar 2024 09:44:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709315097; x=1709919897; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VnZmTKzygX56ppgLY7ShI3HckZ75xFz/UpH6ipSd57w=;
 b=y5ZNZgrymeiy6TZenDKN2uFe7oF90D8OaLj0xvZ6nhCq7wNKPlpATRpzGyr+ECmLhL
 2Lh+hoMG8S9i0szmxcRGBw8PuqmG5ENOYLqafqPi6AVLpg2KA80P/DupRhmSKx6+fBkW
 OYAUARG0XfifBjqDwRo3SBDWvy5yqQf9vhGqIk8KO7PlxHULPKRrk9+USHOklQ+uoNbr
 dzql9ZZqxvH3+osbaFQzrJdTKtTxMygm/eXaUzEyTywUkJSUcgvYeFYAsUx0BTHNPbbw
 qesFMXK2vZyAMxemDgzoPdlANZ4R9CBCWcRlKNCENnkuZxtW8TP8MeUIXuPayRERrThA
 f53g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709315097; x=1709919897;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VnZmTKzygX56ppgLY7ShI3HckZ75xFz/UpH6ipSd57w=;
 b=cb5vJrcRX5pHYBiAkOtGHxuaHzGCmrC5OiEF+ZGu5BVUNcBwJMLmDiuokF23tafYEu
 uVn8QAAkoQnvmjq4t+W9HBw5zNxI3ibKtUFH5lU0Eop/ikIa/1H/dpCuD+1/iyq/zHuK
 tZkKCYa/XJGug91VoG0cQJSE8Tflxi/OG3mdD71jDfUxXWM5DFjH8EnTCIPprCyr1/ZS
 azLEqe9MiHjKHf5JfsTN35QCmmY2Uld4Fx/MGgE7pFeLfayHFPZH55WYPG69AePQF+kJ
 dB9GyY0sy9cQgG9Fc2pkCBt/N1XtPOrOL4Qm4IJq6oiWH6W7ikLqT4spWa7OKPA5IUlg
 1/vg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVaP2KSF19mNcBA6X+8wwYU4DKInkSYDurStqAlxtSdrmPD2d9GMx91K1DJMMTbqkNYv8weHheP3aP6JJA1lTVdjXbI
X-Gm-Message-State: AOJu0Ywok5iGwt2MslCjcfTC+55WK6z8TXtvzTjOnVGM3J0GZetf8YxX
 uMs/5mfv9KPv8YFFB9BH39jrMUIuf+pxmz/Ux4Mdu4haLqLJj9RXlQEfswE83zc=
X-Received: by 2002:a05:6a20:38a4:b0:1a1:1f7b:9b0f with SMTP id
 n36-20020a056a2038a400b001a11f7b9b0fmr1839312pzf.42.1709315096798; 
 Fri, 01 Mar 2024 09:44:56 -0800 (PST)
Received: from [192.168.6.128] (098-147-055-211.res.spectrum.com.
 [98.147.55.211]) by smtp.gmail.com with ESMTPSA id
 o6-20020a056a001b4600b006e56ff4f0bdsm3217749pfv.29.2024.03.01.09.44.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Mar 2024 09:44:56 -0800 (PST)
Message-ID: <1f5627a4-a96a-4548-90bb-97fe13c6ab4a@linaro.org>
Date: Fri, 1 Mar 2024 07:44:46 -1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v5 12/22] target/arm: Handle NMI in
 arm_cpu_do_interrupt_aarch64()
Content-Language: en-US
To: Jinjie Ruan <ruanjinjie@huawei.com>, peter.maydell@linaro.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 wangyanan55@huawei.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20240229131039.1868904-1-ruanjinjie@huawei.com>
 <20240229131039.1868904-13-ruanjinjie@huawei.com>
 <e7fd1fba-ee1d-4b78-b743-128fa8217ed8@linaro.org>
 <10add4f2-68c5-14df-59d7-f6e27457c8b5@huawei.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <10add4f2-68c5-14df-59d7-f6e27457c8b5@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: sWvJEMZD0+qs

On 2/29/24 17:42, Jinjie Ruan wrote:
> 
> 
> On 2024/3/1 7:09, Richard Henderson wrote:
>> On 2/29/24 03:10, Jinjie Ruan via wrote:
>>> According to Arm GIC section 4.6.3 Interrupt superpriority, the interrupt
>>> with superpriority is always IRQ, never FIQ, so the NMI exception trap
>>> entry
>>> behave like IRQ. However, VNMI can be IRQ or FIQ, FIQ can only come from
>>> hcrx_el2.HCRX_VFNMI bit, IRQ can be raised from the GIC or come from the
>>> hcrx_el2.HCRX_VINMI bit.
>>>
>>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>>> ---
>>> v4:
>>> - Also handle VNMI in arm_cpu_do_interrupt_aarch64().
>>> v3:
>>> - Remove the FIQ NMI handle.
>>> ---
>>>    target/arm/helper.c | 9 +++++++++
>>>    1 file changed, 9 insertions(+)
>>>
>>> diff --git a/target/arm/helper.c b/target/arm/helper.c
>>> index b796dbdf21..bd34b3506a 100644
>>> --- a/target/arm/helper.c
>>> +++ b/target/arm/helper.c
>>> @@ -11459,12 +11459,21 @@ static void
>>> arm_cpu_do_interrupt_aarch64(CPUState *cs)
>>>            break;
>>>        case EXCP_IRQ:
>>>        case EXCP_VIRQ:
>>> +    case EXCP_NMI:
>>>            addr += 0x80;
>>>            break;
>>>        case EXCP_FIQ:
>>>        case EXCP_VFIQ:
>>>            addr += 0x100;
>>>            break;
>>> +    case EXCP_VNMI:
>>> +        if (env->irq_line_state & CPU_INTERRUPT_VNMI ||
>>> +            env->cp15.hcrx_el2 & HCRX_VINMI) {
>>> +            addr += 0x80;
>>> +        } else if (env->cp15.hcrx_el2 & HCRX_VFNMI) {
>>> +            addr += 0x100;
>>> +        }
>>> +        break;
>>
>> By not combining VFNMI with CPU_INTERRUPT_VNMI, you don't need this
>> complication.
>> Just
>>
>>       case EXCP_IRQ:
>>       case EXCP_VIRQ:
>> +    case EXCP_NMI:
> 
> Not understand it. both VIRQ and VFIQ will set CPU_INTERRUPT_VNMI and
> cause EXCP_VNMI if they have Superpriority, the distinction jump here is
> necessary.

In my comment against patch 5, that's exactly what I said *not* to do.


r~

