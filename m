Received: by 2002:ac2:5ccb:0:0:0:0:0 with SMTP id f11csp1823050lfq;
        Mon, 11 Apr 2022 11:31:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx7LavTCPNmh9psDXhHtYuS0HE/rRoXoF/QH6CqzbznR7EcM10zjSfM43Nh3O7T54xAjtfa
X-Received: by 2002:a81:6641:0:b0:2ec:392d:534c with SMTP id a62-20020a816641000000b002ec392d534cmr3757926ywc.280.1649701915463;
        Mon, 11 Apr 2022 11:31:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649701915; cv=none;
        d=google.com; s=arc-20160816;
        b=ELeKV3LhGe5mq+Tv6PmkkbUiq6TQpwIuWOYfCxcBEsh6/oZcLRi/i7SXw2UXL25LCF
         6KQx9ZWhoav+wtND1f+dmfQw8QebJvRwLm+QAPs/3a9TxNit/+HPv4YNhgP+tLW9+pc3
         xelWAA5SBLh2p5Pq1hoGTRtHPzRxKffIfzXpRd6hUOUt3RHA69lthe+j70/gmqRuCbV5
         IJadC8LRvYq2t9d/RVlzMfgfRfFm4YgpBdAIoLK9i9kMPiTKiR0QxrdIElJJm3Mqkj/7
         mO3BJH+uCsGGVK4+WGeHyv5OibrmVrZKIfxpiM9CY1l9LPWZz4eHdSTbaBOdWOrs+pFf
         wQTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=8KqR+wJoyDIpnPBc9cCQg8EyOH0SzXZ/VZjiz/N2330=;
        b=RUGvHKg3hAOVydsTFVrWWK0bFJ8WvC3oqp70TKwgHDbEvZTA0WMIAURYu+SFm6bRDh
         F/9hTXWsMDBxAVa2sc5mrIeW1qdgUgqPb936LfaVP+DNic13QxnhgeshjE4TE00QE2pg
         aAjHi+mO6vFPE7qtgl9BvQFv/mA8wiScX5VTfE8s+AHMNiAoxvhUzk6oArESlFcMJQOt
         9Z/uBGHCdhbDDT0R+JT/6zt+LsmfVg51JuaYnvHo5EJG/TeZf8k6vd3EXY4h0znmA6OH
         F6V1JAdLExMKzjfFilF8wPRqZSK5vcR+Lif3Nay9UkqxAPSdY7bALQbxyN7uHR5BWVh3
         kRKw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=rTklHopX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 189-20020a250cc6000000b0063d095472c1si4196260ybm.469.2022.04.11.11.31.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Apr 2022 11:31:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=rTklHopX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ndypO-000290-T3
	for alex.bennee@linaro.org; Mon, 11 Apr 2022 14:31:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndyoe-00020g-IY
 for qemu-arm@nongnu.org; Mon, 11 Apr 2022 14:31:08 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:51063)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndyoY-00030A-KB
 for qemu-arm@nongnu.org; Mon, 11 Apr 2022 14:31:08 -0400
Received: by mail-pj1-x102a.google.com with SMTP id o5so3531992pjr.0
 for <qemu-arm@nongnu.org>; Mon, 11 Apr 2022 11:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=8KqR+wJoyDIpnPBc9cCQg8EyOH0SzXZ/VZjiz/N2330=;
 b=rTklHopX5JZoyLWyzv14NgfgZyvVvAEnTXsIOOlBXy02KDLodfYOTBBl3otLXVpzIu
 IjvuYRZQI+viQcOeMn2XOpOllQgStxwi7lzdE+54pIQgzUvr4bHA7zsBQGOWXgkbocVx
 hMUPygs95k65qIeXeNfKDIhCOIq5soH83X/7YmVbW9ZIfYvQNt+/WEzlXeUng7XMOtFS
 /rGp+qr9Me2f0p14gVceZ5/98wF7bCSFt1/WFuve0g6Qu9L6c/lkG32Jyzdz8Ob6+5m+
 Sbo7Y7gc/NPHaMOowOa+/UL6fw+lbsQOeTWwmUDFkzT9ZE8s4umieDQ7V3XArCDplyT9
 nW2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=8KqR+wJoyDIpnPBc9cCQg8EyOH0SzXZ/VZjiz/N2330=;
 b=hcZbRFBrBuny/AsTOYAUWNb1Ah/+yupBf2vLLj1ZpUIOqLmIQmUBoO+KW0hlRBUcVK
 8cTcTb9+EysRwN+cTZ2Kk2sRiwNyJRtDScOfpU3sgL05QwYapudBybuD7j/CU5jYyNoE
 Cr3RRJbF0kCjmdhkDLBnc1AB3XSikl7dupeSQjmy0TZWl3gUoSObNouRJyqZM4K/hDyO
 SKKDkyi7EsvX20kkzMkZ/8kVBVyPZK3j3YjpWngg0xul/d0KLtYyXKMc9pwkdbgIi4vj
 f86Iz+Z/8WTYmxqGgVgGU+QUPUbQW2IIAoBtZXjH2Hw2wQNjJTec6mWi+30VUBBUmu5C
 Kziw==
X-Gm-Message-State: AOAM532RweBnaxoAk3jSYFK0CXXpadp2Ft1KfEo+/6h24+ynvhd0lS82
 KG8JY6A58YF4+g6elQgE1kqmOg==
X-Received: by 2002:a17:90b:1c8b:b0:1ca:1ff6:607b with SMTP id
 oo11-20020a17090b1c8b00b001ca1ff6607bmr553450pjb.244.1649701860171; 
 Mon, 11 Apr 2022 11:31:00 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 ga1-20020a17090b038100b001cac85761e5sm167477pjb.50.2022.04.11.11.30.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Apr 2022 11:30:59 -0700 (PDT)
Message-ID: <925dd928-47e2-2bec-f97a-7041b6b6e649@linaro.org>
Date: Mon, 11 Apr 2022 11:30:57 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 6/7] target/arm: Define cortex-a76
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
References: <20220410055725.380246-1-richard.henderson@linaro.org>
 <20220410055725.380246-7-richard.henderson@linaro.org>
 <CAFEAcA_2sWO0LtKk+10Ktyhrn5WGV=9eqA+yWd5Mt=nUiJpAYg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA_2sWO0LtKk+10Ktyhrn5WGV=9eqA+yWd5Mt=nUiJpAYg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +osxVdSx4Dry

On 4/11/22 11:09, Peter Maydell wrote:
>> +    cpu->isar.id_aa64pfr0  = 0x1100000010111112ull;
> 
> This has the GIC field clear. On the one hand this is true
> also of all our other CPU implementations. On the other hand
> if we wire up a GICv3 in the board code then we will be
> presenting the GIC CPU interface registers, which is what this
> ID register field is supposed to be telling software.
> I guess we should handle this by having gicv3_init_cpuif()
> arrange for the ID field to be set. Which is mildly painful,
> because that will mean the value for the cpreg isn't constant.

We already handle this via id_aa64pfr0_read().

>> +    cpu->isar.id_pfr1  = 0x10010000;
> 
> Here you have set the GIC field. We should at least be consistent :-)

Oops.  :-)  We have id_pfr1_read() for that as well.

>> +    cpu->midr = 0x413fd0b1;
> 
> This is r3p1; the r4p1 TRM is available so we might as
> well claim to be that.

Ok.

> Missing (just cross-checking what other CPUs are setting):
>    cpu->revidr
>    cpu->reset_fpsid
>    cpu->id_afr0

revidr and id_afr0 are 0 -- explicit zero required?  We certainly assume we begin with 
zero for other registers for other cpus...

FPSID is deprecated, and not mentioned in the a76 or n1 specs.  Presumably this is because 
it is not accessible at all: FPSID is not accessible from EL0 for VFPv3, and the A76 does 
not support aa32 at other than EL0.

>    cpu->isar.dbgdidr

"If EL1 cannot use AArch32 then the implementation of this register is OPTIONAL and 
deprecated."


r~
