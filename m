Received: by 2002:a17:906:aa04:b0:a46:bbde:2c08 with SMTP id ko4csp1490799ejb;
        Tue, 19 Mar 2024 11:40:55 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWMX/pu5LTsHaWe8sMTQoR/0YIzgrN6F0io/6q36izF+k5xcHGzY1JT28S+3oH63vbaWgMn/FuWPt9t15wT2CWf2m3wzZiC
X-Google-Smtp-Source: AGHT+IHDppInHhOmIO7Qktxxssp65lxgxKBJie52hRVmX0ST23ucZUSyjM6UZ/wJh+C2PhJ0AunV
X-Received: by 2002:a05:6214:2f0f:b0:691:859c:95bf with SMTP id od15-20020a0562142f0f00b00691859c95bfmr14643925qvb.60.1710873655660;
        Tue, 19 Mar 2024 11:40:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710873655; cv=none;
        d=google.com; s=arc-20160816;
        b=gabXf9hwChoQZHBO78I+lu9eIoV702L3p5fcXlkyHDmGeac49GbsXw9yNJiHtNL9h+
         kYZO/y2L1S1WtlBIAgesslFi3lpSAOobvl7a/V2JTKFGYKaXJdCQqRImQOFDbqAxMu/N
         q4NaGqZL2uCnUxcmKixHm8iMgGBN+Od9A7iY9ld3pPG3Fx+d72c7Jipc0qPu1sKCt3v2
         peNP/4qWCAhl+Ms/gsqjVqvj2TR6iubcNsCeHor1VG029QNtVEdr09xH9qcgkZaUhgB2
         Pc9UDk6XDLdXfxuTWB+Ko70Uh9Rd07IBcJBnrVtjDtrArBHlYfhj3eIjkoAo45FyfxRe
         IWCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=cxA7qF4mgrEANZPhHQUVl/tVPzqjuidaffO6pTsMZnk=;
        fh=dVGGeAc4usxRxVdLAtV6KbsxZxPnKFrHQzcQVWL8Cio=;
        b=o1hm5pRhSVHExYLMAnTtNycagGa6IrJSO4pWKkBiu6pz+1uq/L7no8ANJ3o/aoT3JE
         OUSxMAUEAdOYlw9bo+HnAZ6IZKVgATAceGDNyPUR7vrOZhBcrvWf5Lem9LJmK7xyjtbN
         lFOVxfPuJVhZlrDmrqZBpX+CIhXhrhslt/OQVp7VR3dAt9JntV7vVTl9/smwilkTbLQE
         7jXcneni5DUasTYmQzZeZb08N2KkjVFCm+7gfWydKL4SZVFk/ctfafHuXcXXYzTGb+HE
         6A3Sl8coJghxpoJ/J1ElYAe1tWFdm+lz60Lnu0yGbN9WV4K/dgq/cb2eCKuHj75CkvoO
         Ewvw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BqaqB2yn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q7-20020a05621419e700b00691886b125bsi8234283qvc.243.2024.03.19.11.40.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Mar 2024 11:40:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BqaqB2yn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rmeNp-0000AA-Gy; Tue, 19 Mar 2024 14:40:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rmeNn-00009N-TQ
 for qemu-arm@nongnu.org; Tue, 19 Mar 2024 14:40:19 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rmeNi-0005ml-Jy
 for qemu-arm@nongnu.org; Tue, 19 Mar 2024 14:40:19 -0400
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-6e6afb754fcso5615127b3a.3
 for <qemu-arm@nongnu.org>; Tue, 19 Mar 2024 11:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710873613; x=1711478413; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cxA7qF4mgrEANZPhHQUVl/tVPzqjuidaffO6pTsMZnk=;
 b=BqaqB2ynQQ9vCu4MISNLgAdk3CsnJYIy1gb5MEeVyPMQ5pWH/conk1PoD3hNHKtErV
 sqqay36DdwApYgKUZBTidHfHq2jjdUsp6ip00afal6kDfSnZuJ7HWRZjCp00SELSxerh
 Pm/CT98RP4IPEKIU/iNENp4Amc47HbdcwA86apXH8ywwhh/I2n1ErZY40gIqBpSMcpfF
 FSICj74OFj4051z8O34GWQFpJozf6NkODgob2kv7PE3FDQ2O9mRi3yiRddMLygCiY3RY
 YlkWECbm0Zu+8Am92ygcu5hLSY7QTjn2j5+hcVIkW20gCelV3zC7Iwx9aaupMYwE1aa0
 ykyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710873613; x=1711478413;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cxA7qF4mgrEANZPhHQUVl/tVPzqjuidaffO6pTsMZnk=;
 b=G99M4Gn2xO5riXvbUOX46KitVPzCPbLrFSR7GeyqmEZjl9zkUqoLNJEMr9M8Hu3cGh
 eOr8R/Q0wDB+VgPa6z8YWYlJfKU8yGKogL69XmA+gRAzXfnOcOAZ1JfoP7EfAcwNe6J7
 mNSP2yVtK4eh1QKQfPP5nED7CLfxLZljjrG0wNAckGg0i6E/wrfWPs8TF0Je1JdHlrqW
 +OEtkKYe2ERfCZbXzB8gxEDWMYRgdu+Y5nW5uJRMH+TPWkroKFLkE9xEoYfJUtgAL9hU
 yxjghR0xgB2sOr5ek6wPZ8AvxvoptPayTCLSn3WCnWzwCTiAst2gTbuwERbf/kGYWaUu
 n7ZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVRHWlPohwGxudRCPXkzRxIQQdMJ6EIxaFB4iYPdei+kgHLX9SuzPrEtLMHNq/u7QmFUXhlaB2JurJX5JsjfuC9RnxX
X-Gm-Message-State: AOJu0YzqeE6XBDSBu0VN5IGjqIBG6MeqCZ9AkdvfDLkKc7KdWxCw54ip
 cs/DoxglqkZHz9ygXawMDbbvu0S9P2J0Jfg9D23PYlAHaT8Y+c6gFCZh0jxkkNc=
X-Received: by 2002:a05:6a00:138b:b0:6e7:4abe:85a0 with SMTP id
 t11-20020a056a00138b00b006e74abe85a0mr2200037pfg.14.1710873612879; 
 Tue, 19 Mar 2024 11:40:12 -0700 (PDT)
Received: from [172.20.1.19] (173-197-098-125.biz.spectrum.com.
 [173.197.98.125]) by smtp.gmail.com with ESMTPSA id
 o8-20020a056a001b4800b006e68bff396csm10022896pfv.215.2024.03.19.11.40.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Mar 2024 11:40:12 -0700 (PDT)
Message-ID: <d2aac7bb-9b97-495d-a203-0244a50a721a@linaro.org>
Date: Tue, 19 Mar 2024 08:40:09 -1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v5 06/22] target/arm: Add support for Non-maskable
 Interrupt
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Jinjie Ruan <ruanjinjie@huawei.com>, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, philmd@linaro.org, wangyanan55@huawei.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20240229131039.1868904-1-ruanjinjie@huawei.com>
 <20240229131039.1868904-7-ruanjinjie@huawei.com>
 <8d494fe8-c0f0-47b3-9f59-ac69f10c1e64@linaro.org>
 <CAFEAcA93HZEvVxFWE8GoCEZwOMjCVX-_EdOoubyGSyoMc+f6LQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA93HZEvVxFWE8GoCEZwOMjCVX-_EdOoubyGSyoMc+f6LQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
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
X-TUID: 8sxZ22R1xcbn

On 3/19/24 07:03, Peter Maydell wrote:
> On Thu, 29 Feb 2024 at 23:02, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> On 2/29/24 03:10, Jinjie Ruan via wrote:
>>> +    bool new_state = ((env->cp15.hcr_el2 & HCR_VI) &&
>>> +                      (env->cp15.hcrx_el2 & HCRX_VINMI)) ||
>>> +                     ((env->cp15.hcr_el2 & HCR_VF) &&
>>> +                      (env->cp15.hcrx_el2 & HCRX_VFNMI)) ||
>>> +        (env->irq_line_state & CPU_INTERRUPT_VNMI);
>>
>> Because the GIC cannot signal an FIQ with superpriority, I think you should not include VF
>> && VFNMI in CPU_INTERRUPT_VNMI.
> 
> The GIC can't, but a hypervisor can -- it just sets the
> VF and VFNMI bits if it wants one. (Architecturally, the CPU
> has a FIQ-with-superpriority, it's only the GIC that doesn't.)

Yes, I know.

The point was not to mix (irq from cpu or gic) with (fiq from cpu) so that we can 
correctly determine superpriority later.

Another way would have been to add an fiq-with-superpriority CPU_INTERRUPT bit, but since 
there's only one way to get that at present, I thought the extra bit was overkill.


r~

