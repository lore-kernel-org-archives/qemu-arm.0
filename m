Received: by 2002:a17:907:1751:b0:a52:4db9:938b with SMTP id lf17csp182952ejc;
        Sat, 13 Apr 2024 02:51:13 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXss8v4eQf/0USmLdJeZ20bcoU0hD4feEqIB08jQpu5Go7/LJiIBU6Hxsu4ZsrCCPwGjnF9KfdadxjJeHwDXMENLZjmsncJ
X-Google-Smtp-Source: AGHT+IEQ0sMxaH8T/wVF+IkG/VnTBjaQc/xJko7ONNatEx9KrO53OE/KVnF3YTR1mK70m8uDAiYZ
X-Received: by 2002:a05:620a:5a6f:b0:789:ffd3:fcd8 with SMTP id wx47-20020a05620a5a6f00b00789ffd3fcd8mr5267063qkn.23.1713001873488;
        Sat, 13 Apr 2024 02:51:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713001873; cv=none;
        d=google.com; s=arc-20160816;
        b=jFbvvrjTINJNAwWzpfvnx5T3oPVGGnTowaIj10Fn6EXeIohnx4gI4Dq1OoHLHEaYeN
         MteuL0/vBr9Iv+QP0eYzMwNjRHFL7qZfoom8wdpR/8hAzF4c4sBamAszcWA4O0UrPxyU
         RoX/Q6PH4gwJ7ZyTnn+7jFBg+DCf+ea0xcAMIqNGf9VxVNC1FDOxbMQa2a0HlzNvUnPf
         kUDeU3TGDPjhHjuwoG985dkMnok4DMMwkk8FQaFRGbxEC2NFNSZVtD5QtJYKlM6ziDrN
         hu/dMJ//4rbbL0BFtdJFTZ8aD8byQad2oCNVsq+y0EEdZIUAjJ5WiUWSb53pyrWJ9qqR
         AZOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=bJOu7SmLQ4SK5G8Ze27aM5i/v4HGQsYscYUNFejLy3o=;
        fh=Kg0/Me3tpVJtH9/d0rYnDSoW4orhjxoGURIkdNPqa+k=;
        b=kBJ5cAY91BZnVbx7HsgSGMTBw2UXqLjD7uLCy7zh5wpLviFhz74btcW4Cimwakq/s1
         jUTk9jTHLUmGm5psOFP9IYP02WJYtggoxx/ZB6k19sXPsG7ZvXGzHJ+cwMbfarwhoPi+
         Al+ZoqJfemXe5PMh/6RHzV5sQlzy5rzQpvKkr6NbzUoGIZLweYXuTy37BpeNwaJb0Emy
         kF63bxvbU2gHbPkpCeLoQImb3yNSpmdHDudkBl2YZNJgDARAkIhymO3DX2flPqxW5PQV
         R0aIP62jiACI2vV2ZOKkw79bSCiFewEJxeU3dTsRLCnz8rZEYljlp/zchuYbloyC4t0G
         26yA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=o7UjCJzA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h20-20020a05620a245400b0078ec5d50191si5539543qkn.341.2024.04.13.02.51.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 13 Apr 2024 02:51:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=o7UjCJzA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rva2E-0003zE-QJ; Sat, 13 Apr 2024 05:50:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rva2C-0003yo-Kl
 for qemu-arm@nongnu.org; Sat, 13 Apr 2024 05:50:56 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rva2A-0003J7-7r
 for qemu-arm@nongnu.org; Sat, 13 Apr 2024 05:50:56 -0400
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-34641b7c49aso1184471f8f.2
 for <qemu-arm@nongnu.org>; Sat, 13 Apr 2024 02:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713001853; x=1713606653; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bJOu7SmLQ4SK5G8Ze27aM5i/v4HGQsYscYUNFejLy3o=;
 b=o7UjCJzAdN7pqFFGNqU71c4edggRqD2f2jNBCoXR8zJJpLPQ7tbaNZqYm710byKxAB
 JvQQfrk52fuAeIau+2deTwakhCu7vezT4nWjpC37mM2M2W+wUFPDFi5IBlGmYEuo9L9C
 z7cMmoQYMbS27pUvAHg0HZu2ZNhPk7dZBKkWyPztYdYqs4PyuSNI9q450uI1MuGQb2TM
 zVAJbNHPfmwfdy1ct55fJvGJeOqbvnPbrtSFn+gs58p3UVHBg8ac++t+7wDK37HOcPRz
 GHnxTj/MZn+RoO2vTJ9Vo407cFE2V2hX6vsoQ3kLK+liHvXVURxp2m1Ua7hGW+QHxMWy
 AXcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713001853; x=1713606653;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bJOu7SmLQ4SK5G8Ze27aM5i/v4HGQsYscYUNFejLy3o=;
 b=Tnf2w4fa4+2dKtQoftakL27IrBbWc6mDSp19mowDWOcMw74L3cVZiBfR/mUGNobPGD
 ke5peIj9kp2MYs5SlnQYawg4ku+VD9cWPB9OGZZ54Ay9MJxsbPIB5TGVMNUgJGlpPRpu
 IPjI7KhpN7MaRtEKNPPEul/k1idHi0Rei6qOCievPceShLZriCCrNKfZ/fzW3W79tdaR
 EPZkHt3yRvjoh7zGkpCKTnS63F8pfhHzLBCN0T+qwCZBLy93X5i9xB4cEjWaUbg8wcJp
 VxUbPBKWQFn4iFi3S87gmtyhDgoOdaufRyJOii/kpmOFYXRYLrVGZWu6ARmHs1mAbLTv
 e5EA==
X-Gm-Message-State: AOJu0YxXw/mBOa2KACPJcpJq1/L+rGFfrdZVFtWznnmhneg0I1QVFRq0
 5gbEi/9KGqdpcv5mjVhL34O/MvMbCB+EDE7ab4JXJ9plE40d0fQWYDvLL4DbLu4=
X-Received: by 2002:a05:6000:232:b0:346:e650:61eb with SMTP id
 l18-20020a056000023200b00346e65061ebmr3154664wrz.9.1713001852631; 
 Sat, 13 Apr 2024 02:50:52 -0700 (PDT)
Received: from [192.168.1.28] (lfbn-bay-1-170-196.w83-193.abo.wanadoo.fr.
 [83.193.250.196]) by smtp.gmail.com with ESMTPSA id
 e8-20020adfe388000000b003469b59b2a2sm6183094wrm.106.2024.04.13.02.50.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 Apr 2024 02:50:52 -0700 (PDT)
Message-ID: <a6bb2e1d-ef8e-446e-b898-5ddf13cd66b0@linaro.org>
Date: Sat, 13 Apr 2024 11:50:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] hw: Add a Kconfig switch for the TYPE_CPU_CLUSTER
 device
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liwei1518@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
References: <20240412062042.105174-1-thuth@redhat.com>
 <20240412062042.105174-3-thuth@redhat.com>
 <12d6a650-a0a9-4e25-9ad1-68aa03064794@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <12d6a650-a0a9-4e25-9ad1-68aa03064794@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: J7Qe4X8rFn0D

On 12/4/24 11:15, Thomas Huth wrote:
> On 12/04/2024 08.20, Thomas Huth wrote:
>> The cpu-cluster device is only needed for some few arm and riscv
>> machines. Let's avoid compiling and linking it if it is not really
>> necessary.

I expect clustering become the new default for heterogeneous machines,
but we are not there yet.

>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   hw/arm/Kconfig     | 3 +++
>>   hw/cpu/Kconfig     | 3 +++
>>   hw/cpu/meson.build | 2 +-
>>   hw/riscv/Kconfig   | 2 ++
>>   4 files changed, 9 insertions(+), 1 deletion(-)

>> diff --git a/hw/cpu/meson.build b/hw/cpu/meson.build
>> index 38cdcfbe57..43a34c4c6e 100644
>> --- a/hw/cpu/meson.build
>> +++ b/hw/cpu/meson.build
>> @@ -1,4 +1,4 @@
>> -system_ss.add(files('core.c', 'cluster.c'))
>> +system_ss.add(when: 'CONFIG_CPU_CLUSTER', if_true: files('core.c', 
>> 'cluster.c'))
> 
> Oops, sorry, the switch should only be used for cluster.c, not for 
> core.c. I'll change it in v2 ...

For v2:
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


