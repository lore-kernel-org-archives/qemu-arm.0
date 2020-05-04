Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp678768lfb;
        Mon, 4 May 2020 10:43:52 -0700 (PDT)
X-Google-Smtp-Source: APiQypLLfDe3oud4a1DEjB9ZXRDFvQvIjOx0L7DZEyUvb+b7YkCrz77WEnYhUu5SU1KqreCmQnX9
X-Received: by 2002:ac8:3025:: with SMTP id f34mr223817qte.219.1588614232040;
        Mon, 04 May 2020 10:43:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588614232; cv=none;
        d=google.com; s=arc-20160816;
        b=aC6dtpgl7/AaIF7PMzy/Yom/rhkrRiGv25wTUsK4KPRerXXkJD/T1SWttrzGC180L6
         vY2ORa3IHpsXOhxk2FKp8v/jMUB2Ee/7qrE5okkz6qBJlZLBVuPydx8kShMBjnOfYN3W
         135GnJHbQVfVdCs+v1vNAingwu2U4gNNYk3eFPMbaWx2tqBI2PGEWXde+nNqEmaJSKjr
         THyQxMg6CXyWmPpHSiuva71XmU3C2+OIbgibF9fbYSc3NeC7euWiriaVbljT6AT5DG2l
         m8GpwjWw1eimE6uIcNS/X8HcplkUISTfx5ZoWMmP2vDh9TiqFzeO2d4B6tKaq9hrDF81
         Y0jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=pV1Sll5dVXrrASgn8UjW9JhjiCDmCI+ImHYWblHZ5zM=;
        b=QjnyiHAjoOO9WA7zlGWakE4uRM5chzr8WjXE0EeBkt0CK1xSYkX3OnPa2QkkNebI1Q
         0o40cNk+qla0BDPM0xWuf/7WIVdf/15NBk7mOm7cB/B9OdUo9pMUxsbNC/wXwAu3NZ+h
         z0YIOhflHmLJasAE4EREPv7130cp7SwI36pg/kRcRxN94XE21ezSYoTdwwfDVaptyuIa
         wD66667saAsxGAYJo82xbF/9Kumjc1x9b0j4TEH/q+U/EGQipcsgmRueWkuBkzqwWf2F
         qDa2qWv7/lsz16EqDi15xv/MutjsqFOKGQEdwJ5an5sBWYm5k87EdbyMMiE5AFsfuQp1
         Eh/w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=inkp7xVp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id o67si6958433qke.270.2020.05.04.10.43.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 May 2020 10:43:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=inkp7xVp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:40708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jVf8B-0000t4-Fw
	for alex.bennee@linaro.org; Mon, 04 May 2020 13:43:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jVf81-0000pZ-N7; Mon, 04 May 2020 13:43:41 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:38806)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jVf80-00081M-DU; Mon, 04 May 2020 13:43:41 -0400
Received: by mail-wr1-x443.google.com with SMTP id x17so119179wrt.5;
 Mon, 04 May 2020 10:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=pV1Sll5dVXrrASgn8UjW9JhjiCDmCI+ImHYWblHZ5zM=;
 b=inkp7xVp0hVraICKSkEoc/2VLalFeiZez6VE8I/OIbymrB50lDCZas6rpabsjJdaoq
 Zkm8zMfj5sa+SILSIWDZr4pcLMXpeHcePWL0WJR76UHc3nx5OXWh9P/9ITQDfcOvz47F
 kyO/KxsiVPUgUp5xqq9hQLwoEfkmiwOJ1d/2C4fs4PDbElSUwwDQ50hiXE5uSarTcXEV
 Zwt3ULRtLb/Eys19/IpWgDKwmcYtaeFw0vkJoAVvjnml09WpNVdFK7Yv3pyHBrSyRMBl
 a5C+Ilf905KTnxEpz3KDyGi8iymOMRE2Cq8E6y6FbKZYqy4hRdmeLL/f2aH8xbnx0OnL
 TdmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pV1Sll5dVXrrASgn8UjW9JhjiCDmCI+ImHYWblHZ5zM=;
 b=HcWW6nvnBX38/8vRhpyt3NnFd9Cwe0+ZWqDbT01vjMi0DMJ9sDz+KDK8eDlyiW5UaH
 1ICNJuM/H/GzI+s1xeAzYg6gEffESzK1J6o99QBZFWWCn2ms9pScBM/vDqsgonOeq4SR
 Vx7RSojI0OIixRzA2VRbnijbc0zbQNi8+O6E8nV/bLliivVAdiR4Ghbu0DGlqyRHmTmI
 PZgdpnpELZrvhu47id82NpKrWjprrMjvwZJ8JBKShtnMJhwrmj6nes61rXag7Sm2d/X5
 BZrHG/L7/NpPJs5TIpApBbH72Vrx+Npo9r8YZQuh3CLp/uLuEJ0t5/o86rdA0VyboNbJ
 iDDQ==
X-Gm-Message-State: AGi0PuZLaRad0qZiF4c/phrMKWeM11L03843o0zdkXYEENHuUXHggpZA
 Ruy5OFVFWIVlgVvNZsBerN0=
X-Received: by 2002:adf:a1c8:: with SMTP id v8mr408676wrv.79.1588614218583;
 Mon, 04 May 2020 10:43:38 -0700 (PDT)
Received: from [192.168.1.39] (26.red-88-21-207.staticip.rima-tde.net.
 [88.21.207.26])
 by smtp.gmail.com with ESMTPSA id y7sm165914wmb.43.2020.05.04.10.43.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 May 2020 10:43:37 -0700 (PDT)
Subject: Re: [PATCH 2/4] hw/arm/nrf51_soc: Mark some peripherals as
 unimplemented
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20200504072822.18799-1-f4bug@amsat.org>
 <20200504072822.18799-3-f4bug@amsat.org>
 <a5278614-a9b5-f41a-53ea-f89331d6a3ca@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <5eca70cf-a80b-a008-3418-849fa85f7679@amsat.org>
Date: Mon, 4 May 2020 19:43:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <a5278614-a9b5-f41a-53ea-f89331d6a3ca@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::443;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Steffen_G=c3=b6rtz?= <contrib@steffen-goertz.de>,
 qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>,
 Ioannis Glaropoulos <Ioannis.Glaropoulos@nordicsemi.no>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +0u0qaCN5/5j

+Ioannis

On 5/4/20 7:13 PM, Richard Henderson wrote:
> On 5/4/20 12:28 AM, Philippe Mathieu-Daudé wrote:
>> Map some peripherals used by Zephyr Project:
>>
>> https://github.com/zephyrproject-rtos/zephyr/blob/zephyr-v2.2.0/dts/arm/nordic/nrf51822.dtsi
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>   include/hw/arm/nrf51.h |  4 ++++
>>   hw/arm/nrf51_soc.c     | 11 +++++++++++
>>   2 files changed, 15 insertions(+)
> 
> There's a fair few more devices listed in the manual, and not all of the ones
> that you add here are referenced in the dts files.  So what criteria are you
> using to choose?

Fair question :)

The board DTS [1] ends pulling in nrf51822.dtsi.

To be able to use the soft PWM declared in [2] and implemented in [3] 
(with timers and gpios), I added this commit on top:

https://gitlab.com/philmd/zephyr/-/commit/90b081cf79

But I won't send a pullrequest to Zephyr until the PPI is properly 
implemented in QEMU.

[1] 
https://github.com/zephyrproject-rtos/zephyr/blob/zephyr-v2.2.0/boards/arm/qemu_cortex_m0/qemu_cortex_m0.dts
[2] 
https://github.com/zephyrproject-rtos/zephyr/blob/zephyr-v2.2.0/dts/arm/nordic/nrf5_common.dtsi
[3] 
https://github.com/zephyrproject-rtos/zephyr/blob/zephyr-v2.2.0/drivers/pwm/pwm_nrf5_sw.c

> 
> Perhaps it would be easier to add them all?

Or better document this commit ;)

> 
> 
> r~
> 
> 
> 
