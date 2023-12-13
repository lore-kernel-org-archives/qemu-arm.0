Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp1776935ejo;
        Wed, 13 Dec 2023 09:19:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEcBdWwwV9Rvy7386FZlHo5kGCdMylfMc0iIa/ze735bxXXhdCXsD3xcNQzCTiED0aHcB8k
X-Received: by 2002:a05:620a:2185:b0:77f:98d0:fa5e with SMTP id g5-20020a05620a218500b0077f98d0fa5emr834169qka.51.1702487977078;
        Wed, 13 Dec 2023 09:19:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702487977; cv=none;
        d=google.com; s=arc-20160816;
        b=H1rZ87jWO94nsK9EtHhVcM7NN3on2ToOO2crswCridNAb0Y6hZTspLUU1Da0XcxgGl
         oZd+USDJFjdT2n5d6g8AXvJJcowaLbzhLzmapWgjjYuNGQRn2niwPA0fz+8+lmwPPLwK
         aYtyq+ckyP3DijlsQLlVN3CriAJbIlzqqUpko2eoBC1snn7AqwK/EjLdVkMO/GGje0SC
         OD+1p1W5EbyA9eBThtoOp2W9KcU2NPgO11c2/8Bzp+5ZdBKYOXvuMht32FKbTja8ZqRp
         mbmlOGCVmb4bipQGjZTqhpXMj3Or9OxVhPQ6PfoKKYHGLD3dnIjS8XKnLMDSxy3TXDeo
         gylQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=cUXbJdod+qXiv1eefPiwF2Y2tlliZuou7lqWUhtrrU8=;
        fh=U/4k2lVeXqK3riCNYPQYLC2RabqsUmE9xTrsAANKlrQ=;
        b=wIuxbteXc1m51LM4RvmlXCjI75M7cxwrljdsj/4fKlbMCRIBLo/1zC9RpvNeA8QAyB
         hTzQ3QQe8yJG0bFZWi2aXe98eqE6en1bBnbU03kX8aLpYYhucRLuXoR1f0lPaNLkxE/H
         mzwb/lIwSHMzML3E1TKSJDnrN24UijSs3F8tK0mSq6KR9qwfu5PzuPPlnbk0vcHIYLZ+
         hARq9fHU5GcP/DDgsVH30QSJVd5hnyi5DYPl/QZhTVCdL/7XXRzYu/X++scvM04oDo88
         gXsJUuv8rjisCjkroxH6T1+PGCDUdff8AKYWN69RkRZAbpK5tsbQ/9i4P6fGwkJm1mT0
         EGLA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WDbuTEoT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c26-20020a05620a269a00b007788d758a18si13557999qkp.511.2023.12.13.09.19.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Dec 2023 09:19:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WDbuTEoT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rDSt9-0005Ea-H8; Wed, 13 Dec 2023 12:19:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rDSt6-0005ED-24
 for qemu-arm@nongnu.org; Wed, 13 Dec 2023 12:19:12 -0500
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rDSt3-0000ZI-64
 for qemu-arm@nongnu.org; Wed, 13 Dec 2023 12:19:11 -0500
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-50bf2d9b3fdso9673954e87.3
 for <qemu-arm@nongnu.org>; Wed, 13 Dec 2023 09:19:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702487947; x=1703092747; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cUXbJdod+qXiv1eefPiwF2Y2tlliZuou7lqWUhtrrU8=;
 b=WDbuTEoTe76WrM6kYa3gxy9UuygKwSSzWESjlLP214owq5sAUxKItyejelSApGeoUh
 IP52iENeX4hbnp0M1yjGyl+sMyb1CBFEQcxHU0QergN0PKsCsDkD8+KDOas+XwMFkuLA
 4DMnii7DQdJwWCgGIDuTyT1meWgi19qtA9QC8y0bv6506FUKFDwFIrBEJ3h2fCgSDDSF
 S7xVGL3oTf/GQE1kDChYjQr40G1kLWZVUy4XQoZHyUv3RBmLw7MIASApzPv3Sq83bM9Y
 Uif3QZKCTKjSkzhoVsVo1vDYdRlUqJBLEiqRvSc0B6RSTYwZEetxJV5iF5kSuPoOqKf5
 I04A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702487947; x=1703092747;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cUXbJdod+qXiv1eefPiwF2Y2tlliZuou7lqWUhtrrU8=;
 b=ZDNVTttZcPLA0gkAjOqULEkH/fcHPZL9uB4l8EU4MJtEqDXBDpLFwbmk1vxdnt/Eji
 hrSh/B8XujQN/ymQTwdWC/1hl84Lo1lIw5nDZJnsTeSbqJUx/oQoHNfs40HcpZIevq+t
 q8uaahGYZ91f8IpIsiW8puj+ky0H0ASY/BkzdJSW9qxX5x07027+EDRcU9qDOYOnv/R+
 i0XwfnaA9REmhbnUlQ30WnV8OdEK8SihoZS6vxFlA4DciXKwpP91I3thFWoqm2vS1pQ5
 yTR/F4w2QjfP/+12got/j88p78gmUCp4BDU3N1HF/aaFd9RCm86gyRsXSfo1/HcZw9Pf
 uFaA==
X-Gm-Message-State: AOJu0YyvpgG5xyRQ6elVg69ZCVdpECx4F3MwJm7n5ALJNyBazi4SNJT9
 ItwkwFlIaa/JQDTgJiPSdzzG/A==
X-Received: by 2002:ac2:5fac:0:b0:50b:efe8:f5e8 with SMTP id
 s12-20020ac25fac000000b0050befe8f5e8mr3562274lfe.88.1702487946985; 
 Wed, 13 Dec 2023 09:19:06 -0800 (PST)
Received: from [192.168.79.175] ([93.23.251.22])
 by smtp.gmail.com with ESMTPSA id
 vw15-20020a170907a70f00b00a22ff4994e9sm1179986ejc.214.2023.12.13.09.19.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Dec 2023 09:19:06 -0800 (PST)
Message-ID: <9acdbf95-492d-4cce-98f5-d774a277d214@linaro.org>
Date: Wed, 13 Dec 2023 18:19:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/sd/pxa2xx_mmci: Disable reentrancy detection
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>,
 Guenter Roeck <linux@roeck-us.net>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20231213014932.1748323-1-linux@roeck-us.net>
 <CAFEAcA9KU855jn8xDQtbf58Byg0NCq-aB3tPcf8sB6YLyLkvWQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA9KU855jn8xDQtbf58Byg0NCq-aB3tPcf8sB6YLyLkvWQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12b;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x12b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: 3g8ufyVVZ9i+

Hi Guenter,

On 13/12/23 18:12, Peter Maydell wrote:
> On Wed, 13 Dec 2023 at 01:49, Guenter Roeck <linux@roeck-us.net> wrote:
>>
>> All tests using pxa2xx_mmc to access mmc cards on pxa2xx platforms
>> such as borzoi fail starting with commit a2e1753b80 ("memory: prevent
>> dma-reentracy issues"). Disable reentrancy guard to fix the problem.
>>
>> Fixes: a2e1753b80 ("memory: prevent dma-reentracy issues")
>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>> ---
>>   hw/sd/pxa2xx_mmci.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/hw/sd/pxa2xx_mmci.c b/hw/sd/pxa2xx_mmci.c
>> index 5e8ea69188..27ae8f2888 100644
>> --- a/hw/sd/pxa2xx_mmci.c
>> +++ b/hw/sd/pxa2xx_mmci.c
>> @@ -555,6 +555,8 @@ static void pxa2xx_mmci_instance_init(Object *obj)
>>       qdev_init_gpio_out_named(dev, &s->rx_dma, "rx-dma", 1);
>>       qdev_init_gpio_out_named(dev, &s->tx_dma, "tx-dma", 1);
>>
>> +    s->iomem.disable_reentrancy_guard = true;
>> +
> 
> All patches that set this flag should include a comment which
> explains what the device access path that triggers the reentrancy
> is, please.

Can we get a reproducer or backtrace please?
