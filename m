Received: by 2002:a17:906:5814:b0:a6f:8e2c:4d9d with SMTP id m20csp265016ejq;
        Thu, 20 Jun 2024 22:26:00 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXvAAZNjQFDYv4k4KCDounxrMCwqAyk6BsWGbPlnZyBv7pTDkWQ9+e/KbohqW1vlO4glt3qsf8iMcU2p4AB1SYp7W86hQxn
X-Google-Smtp-Source: AGHT+IH7pFCwWhK1WW89J03j5NV4qd6cFijgAoYU2QN/XTjUUKK5/sNdeDiOYR+t6VfPP1LtsOql
X-Received: by 2002:a05:622a:d3:b0:441:57b3:2d6f with SMTP id d75a77b69052e-444a79a9e3emr77291071cf.13.1718947559775;
        Thu, 20 Jun 2024 22:25:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718947559; cv=none;
        d=google.com; s=arc-20160816;
        b=d4d8W7u7m3uovQjGgf/ZtoeSN/PW1xCS9auKv6fwuKYE4hmBQaN66C2ODeTUjNkipH
         8TIAJyStFDH6+LP/8oxDFgmpYGRPyqv76bAdzmsS6CRIbCMrawfgFGTSkyAG5M67sCXl
         tF7MXFeqWhEjL/5lHrPoInYFk+6RV16uB1E6NQI9GATR9xB3PhEtZIkIsWIE61ZK2F4x
         75m+FITSct9CbhaBxzbOeHWboI+vgYxKCakU/EXs8R17n+OFm6/grMAuUv4zYYCWFwMN
         zMldO1+nARkw8UGFYI+cclhki+m8CJ+tckAThR55rMHRoLaWGMUYtm8TkDNqYug3i4FJ
         MDTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id;
        bh=O58388iXlJJdx2wNLaNer6ZKUK1R0tk4VCrRVfx+Jy0=;
        fh=L8M9OuGVmbNJrDIPS4yoODPWkaGwVPKOMzYqjU69lMA=;
        b=w/BAVSgm8Htcc7Bb3Os37mouNvVLoYXBex++9CWNNSMWRBYxrMSxAQd4SYDISrNcOG
         d1QEksqe37/NAi6NoVuUwnwdV/qGtAje/NT1Y+84sLJK+CKst04ZkLyar9s8cakjHjOX
         coPzZjp06Iuh1+om1g+DoC0oeKs4EQyBGoOUOhQzJX64khoc07p4SWC7koHaRmnzlnNA
         vjmd6AOleJ+MOnBV/EpYyxtipMdTXGP3RSTr7Xer0k21KFrszJAQdsJZvWcowy3eyeAp
         BLFVonhlgP0IOiBeJ3GNi+gIxA93ewLolL5cq0XfFDa/qhfGPYhXea5eQZhXOYeSYhxb
         o5CA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-444c2c3e3d6si10758041cf.513.2024.06.20.22.25.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Jun 2024 22:25:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sKWmS-0004XL-VK; Fri, 21 Jun 2024 01:25:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=9ak7=NX=kaod.org=clg@ozlabs.org>)
 id 1sKWmR-0004Tk-59; Fri, 21 Jun 2024 01:25:47 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=9ak7=NX=kaod.org=clg@ozlabs.org>)
 id 1sKWmO-0004Uq-Px; Fri, 21 Jun 2024 01:25:46 -0400
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4W55RJ0JDqz4wyg;
 Fri, 21 Jun 2024 15:25:32 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4W55RF0xgQz4wc1;
 Fri, 21 Jun 2024 15:25:28 +1000 (AEST)
Message-ID: <5a2d0a4f-8ff8-4fc1-9c15-4c1e533143f1@kaod.org>
Date: Fri, 21 Jun 2024 07:25:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] hw/gpio/aspeed: Add reg_table_count to AspeedGPIOClass
To: Zheyu Ma <zheyuma97@gmail.com>, Peter Maydell <peter.maydell@linaro.org>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20240620140239.375338-1-zheyuma97@gmail.com>
Content-Language: en-US, fr
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20240620140239.375338-1-zheyuma97@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=9ak7=NX=kaod.org=clg@ozlabs.org; helo=mail.ozlabs.org
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
X-TUID: 3E8VSFzETlja

On 6/20/24 4:02 PM, Zheyu Ma wrote:
> ASan detected a global-buffer-overflow error in the aspeed_gpio_read()
> function. This issue occurred when reading beyond the bounds of the
> reg_table.
> 
> To enhance the safety and maintainability of the Aspeed GPIO code, this commit
> introduces a reg_table_count member to the AspeedGPIOClass structure. This
> change ensures that the size of the GPIO register table is explicitly tracked
> and initialized, reducing the risk of errors if new register tables are
> introduced in the future.
> 
> Reproducer:
> cat << EOF | qemu-system-aarch64 -display none \
> -machine accel=qtest, -m 512M -machine ast1030-evb -qtest stdio
> readq 0x7e780272
> EOF
> 
> ASAN log indicating the issue:
> ==2602930==ERROR: AddressSanitizer: global-buffer-overflow on address 0x55a5da29e128 at pc 0x55a5d700dc62 bp 0x7fff096c4e90 sp 0x7fff096c4e88
> READ of size 2 at 0x55a5da29e128 thread T0
>      #0 0x55a5d700dc61 in aspeed_gpio_read hw/gpio/aspeed_gpio.c:564:14
>      #1 0x55a5d933f3ab in memory_region_read_accessor system/memory.c:445:11
>      #2 0x55a5d92fba40 in access_with_adjusted_size system/memory.c:573:18
>      #3 0x55a5d92f842c in memory_region_dispatch_read1 system/memory.c:1426:16
>      #4 0x55a5d92f7b68 in memory_region_dispatch_read system/memory.c:1459:9
>      #5 0x55a5d9376ad1 in flatview_read_continue_step system/physmem.c:2836:18
>      #6 0x55a5d9376399 in flatview_read_continue system/physmem.c:2877:19
>      #7 0x55a5d93775b8 in flatview_read system/physmem.c:2907:12
> 
> Signed-off-by: Zheyu Ma <zheyuma97@gmail.com>

Applied to aspeed-next.

Thanks,

C.


> ---
> Changes in v4:
> - Change the variable name to 'reg_table_count'
> - Change the 'reg_table_count' type to unsigned
> Changes in v3:
> - Add the reproducer
> ---
>   hw/gpio/aspeed_gpio.c         | 17 +++++++++++++++++
>   include/hw/gpio/aspeed_gpio.h |  1 +
>   2 files changed, 18 insertions(+)
> 
> diff --git a/hw/gpio/aspeed_gpio.c b/hw/gpio/aspeed_gpio.c
> index c1781e2ba3..6474bb8de5 100644
> --- a/hw/gpio/aspeed_gpio.c
> +++ b/hw/gpio/aspeed_gpio.c
> @@ -559,6 +559,12 @@ static uint64_t aspeed_gpio_read(void *opaque, hwaddr offset, uint32_t size)
>           return debounce_value;
>       }
>   
> +    if (idx >= agc->reg_table_count) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: idx 0x%" PRIx64 " out of bounds\n",
> +                      __func__, idx);
> +        return 0;
> +    }
> +
>       reg = &agc->reg_table[idx];
>       if (reg->set_idx >= agc->nr_gpio_sets) {
>           qemu_log_mask(LOG_GUEST_ERROR, "%s: no getter for offset 0x%"
> @@ -785,6 +791,12 @@ static void aspeed_gpio_write(void *opaque, hwaddr offset, uint64_t data,
>           return;
>       }
>   
> +    if (idx >= agc->reg_table_count) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: idx 0x%" PRIx64 " out of bounds\n",
> +                      __func__, idx);
> +        return;
> +    }
> +
>       reg = &agc->reg_table[idx];
>       if (reg->set_idx >= agc->nr_gpio_sets) {
>           qemu_log_mask(LOG_GUEST_ERROR, "%s: no setter for offset 0x%"
> @@ -1117,6 +1129,7 @@ static void aspeed_gpio_ast2400_class_init(ObjectClass *klass, void *data)
>       agc->nr_gpio_pins = 216;
>       agc->nr_gpio_sets = 7;
>       agc->reg_table = aspeed_3_3v_gpios;
> +    agc->reg_table_count = GPIO_3_3V_REG_ARRAY_SIZE;
>   }
>   
>   static void aspeed_gpio_2500_class_init(ObjectClass *klass, void *data)
> @@ -1127,6 +1140,7 @@ static void aspeed_gpio_2500_class_init(ObjectClass *klass, void *data)
>       agc->nr_gpio_pins = 228;
>       agc->nr_gpio_sets = 8;
>       agc->reg_table = aspeed_3_3v_gpios;
> +    agc->reg_table_count = GPIO_3_3V_REG_ARRAY_SIZE;
>   }
>   
>   static void aspeed_gpio_ast2600_3_3v_class_init(ObjectClass *klass, void *data)
> @@ -1137,6 +1151,7 @@ static void aspeed_gpio_ast2600_3_3v_class_init(ObjectClass *klass, void *data)
>       agc->nr_gpio_pins = 208;
>       agc->nr_gpio_sets = 7;
>       agc->reg_table = aspeed_3_3v_gpios;
> +    agc->reg_table_count = GPIO_3_3V_REG_ARRAY_SIZE;
>   }
>   
>   static void aspeed_gpio_ast2600_1_8v_class_init(ObjectClass *klass, void *data)
> @@ -1147,6 +1162,7 @@ static void aspeed_gpio_ast2600_1_8v_class_init(ObjectClass *klass, void *data)
>       agc->nr_gpio_pins = 36;
>       agc->nr_gpio_sets = 2;
>       agc->reg_table = aspeed_1_8v_gpios;
> +    agc->reg_table_count = GPIO_1_8V_REG_ARRAY_SIZE;
>   }
>   
>   static void aspeed_gpio_1030_class_init(ObjectClass *klass, void *data)
> @@ -1157,6 +1173,7 @@ static void aspeed_gpio_1030_class_init(ObjectClass *klass, void *data)
>       agc->nr_gpio_pins = 151;
>       agc->nr_gpio_sets = 6;
>       agc->reg_table = aspeed_3_3v_gpios;
> +    agc->reg_table_count = GPIO_3_3V_REG_ARRAY_SIZE;
>   }
>   
>   static const TypeInfo aspeed_gpio_info = {
> diff --git a/include/hw/gpio/aspeed_gpio.h b/include/hw/gpio/aspeed_gpio.h
> index 904eecf62c..90a12ae318 100644
> --- a/include/hw/gpio/aspeed_gpio.h
> +++ b/include/hw/gpio/aspeed_gpio.h
> @@ -75,6 +75,7 @@ struct AspeedGPIOClass {
>       uint32_t nr_gpio_pins;
>       uint32_t nr_gpio_sets;
>       const AspeedGPIOReg *reg_table;
> +    unsigned reg_table_count;
>   };
>   
>   struct AspeedGPIOState {

