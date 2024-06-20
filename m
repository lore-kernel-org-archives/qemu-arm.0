Received: by 2002:a17:907:60c:b0:a6f:8e2c:4d9d with SMTP id wp12csp2043989ejb;
        Thu, 20 Jun 2024 08:32:25 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX9wKxDBsqDJLfj+iiZGNNqVmIGxlWw+DFyvajhlD3eC72rYbBAPYPaEqlnOWjioqOlQ+ZBy2WvIj2sKMnViyKkDHNr/e0V
X-Google-Smtp-Source: AGHT+IHqZ2xBr2lp355DggS8IzFY7po/FZdEaxODZdoaafOORzi6+IEFIuSH0SFCJuK+tbGGtrfe
X-Received: by 2002:a05:620a:1a9e:b0:795:5ca2:3742 with SMTP id af79cd13be357-79bb3e55929mr546215385a.34.1718897545606;
        Thu, 20 Jun 2024 08:32:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718897545; cv=none;
        d=google.com; s=arc-20160816;
        b=kvcmte8Ze9kwSRFv1XQ0Iorkj6BNm5RCEI4vUuS4lipz0ZK4i5Zl87vuvEdPi8GIxN
         joHZBD1DlAjdn/rI5Nu6kQbIppwnXP9UqmHlwS7Y0CKLjQiN/4WiWZzefAw8FN9RePjR
         YCZwHLm86nPB049ZKhNEBdbkBiqKgOIhka5kPd4pRTkRUFBQmOGBmvjfs57cHK3pZ09s
         jX11zEJI1caobK7puzTuFlANI7aV02hwKKmD8cynjHAYfoNyh5Vt2Q9pYEy1nWrflLLI
         lEZuGxtCRGvX3J10r+Q/ZTSA8d8pDW/f4wCruLHm1y7JDUBYUVby0FQuyAv305o8dBu9
         rXpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:content-language:references:cc:to:from:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=wSAA01ELNxgIGxuLWBbFGxIiTlI22d605+ok6En+1yo=;
        fh=xEkqWc1LPeWdYd8kTmAjrOsAlWFBIfM1C+lkKJIBcJ4=;
        b=PQVuGS6qJi5UxWdINfTiGee+ZvL28890yNxdA7G+pDClye8G961je/chydGctwPmhM
         hGdj01HJX78iTGCf7RGv6ITeQXhuGdZ92VfU8E5gMblu/jw7KOf5zwnGv+nSUn43Z3Wz
         gQ3+45CjYKGjjB29/WrGKZSbrlbh0QKE0nCyhbZEoj+vFCH+Tt7qC5RG43yA1MXkV59X
         DQlh2Olq01XSkOGpkNCW7hctT8ktLFYnf7C/ImaPfcRvx1KHH/itigdH2035cQUbVxBn
         bnp5qB0p7s3IWs1IKDvMyPZe6ac231x0UjESoXtQA6HdciQ9ChlAFJPhMhpI4jUMdJAY
         P7SQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Aqb+xOen;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-798abe57e70si1465840685a.579.2024.06.20.08.32.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Jun 2024 08:32:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Aqb+xOen;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sKJld-0003Em-Li; Thu, 20 Jun 2024 11:32:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sKJlb-0003EG-Vh
 for qemu-arm@nongnu.org; Thu, 20 Jun 2024 11:32:04 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sKJla-0001Uu-73
 for qemu-arm@nongnu.org; Thu, 20 Jun 2024 11:32:03 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4218314a6c7so9061825e9.0
 for <qemu-arm@nongnu.org>; Thu, 20 Jun 2024 08:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718897520; x=1719502320; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=wSAA01ELNxgIGxuLWBbFGxIiTlI22d605+ok6En+1yo=;
 b=Aqb+xOenD+Ml0mxFledae7BV9DU5dI2QN09Fc3erM07Eer1c+PuuzlTQGmqJ3DYFyY
 jAkWUFnC5kFPNKmMVIq6z1th3aitVcSgKAgRnJ1udmtY3MLCdkJqBQPaupJZcH9pTXtt
 kc0tmqAnQU4ljrftoGfkRC9A7Mt+XlPN0l7tM8CNwz+sE2ELt+vJGwVa3No+bW6zPx0K
 o3oNCVJ0kOoqB84yGmi2ABcMb3ZNG49KWYx9ix9hvnGa06KMACJoHIOmNx0D72bplX2C
 4e0fIU+YFBxiY7bxM34LXn/gtVMnvW2kzniBazNS0resINc/lDFreBRjs2Y3J8g6eIST
 2JIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718897520; x=1719502320;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wSAA01ELNxgIGxuLWBbFGxIiTlI22d605+ok6En+1yo=;
 b=JpxJJS1wF18SULNJYI0mrIzPtTd7XlRniIbBRvLmsLI7Gzng5GUDtlUD3r2BH7LDgq
 wPEyoqXTei+5PO8vmds7vgSL1s4NZ5Ev42oEjsnIlMQuY0Q4ylkITg6tDyNWv6J+ZuVi
 9sKDAVN/85/RP3MUkXkiUu5vt1TUL5g9EVZnVOHpBxxKgCu14Fio0SY5R6kd6yegGEDD
 HNWiDFJErmYqhu+uol3rIOGFKnWpbun3JKv2oKRFXAazg8MDp3ipbBSc0Jre5Bb/bMUc
 pFUh+6vuhT+jzGjoNJqdwV9qhmx9DiB9Cazz+JDxWMLcPhSZBvZhIv7ZAo3Adtqw3kVx
 cIXw==
X-Gm-Message-State: AOJu0YzNRBA3j40SWPlEOLirWGQDHcdbSrCmpUDIwLAHkVhMixZvjuZx
 0wJwgy8lBRkRkb/vGgfawfFJEPKGPgbq+44f4ltIPEPKcqpuuu3V6OOuvKs8Mkg=
X-Received: by 2002:a05:600c:5c4:b0:421:5ada:c137 with SMTP id
 5b1f17b1804b1-4247529b439mr45318865e9.33.1718897519600; 
 Thu, 20 Jun 2024 08:31:59 -0700 (PDT)
Received: from [192.168.69.100] ([176.176.151.40])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4247d212254sm29391105e9.45.2024.06.20.08.31.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Jun 2024 08:31:59 -0700 (PDT)
Message-ID: <86fe9f27-6289-4918-a30e-c9577495a21c@linaro.org>
Date: Thu, 20 Jun 2024 17:31:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] hw/gpio/aspeed: Add reg_table_count to AspeedGPIOClass
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Zheyu Ma <zheyuma97@gmail.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20240620140239.375338-1-zheyuma97@gmail.com>
 <6a817f44-27fe-432a-8118-bbcec790535f@linaro.org>
Content-Language: en-US
In-Reply-To: <6a817f44-27fe-432a-8118-bbcec790535f@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
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
X-TUID: kAYYvF4iODKK

On 20/6/24 16:20, Philippe Mathieu-Daudé wrote:
> On 20/6/24 16:02, Zheyu Ma wrote:
>> ASan detected a global-buffer-overflow error in the aspeed_gpio_read()
>> function. This issue occurred when reading beyond the bounds of the
>> reg_table.
>>
>> To enhance the safety and maintainability of the Aspeed GPIO code, 
>> this commit
>> introduces a reg_table_count member to the AspeedGPIOClass structure. 
>> This
>> change ensures that the size of the GPIO register table is explicitly 
>> tracked
>> and initialized, reducing the risk of errors if new register tables are
>> introduced in the future.
>>
>> Reproducer:
>> cat << EOF | qemu-system-aarch64 -display none \
>> -machine accel=qtest, -m 512M -machine ast1030-evb -qtest stdio
>> readq 0x7e780272
>> EOF
>>
>> ASAN log indicating the issue:
>> ==2602930==ERROR: AddressSanitizer: global-buffer-overflow on address 
>> 0x55a5da29e128 at pc 0x55a5d700dc62 bp 0x7fff096c4e90 sp 0x7fff096c4e88
>> READ of size 2 at 0x55a5da29e128 thread T0
>>      #0 0x55a5d700dc61 in aspeed_gpio_read hw/gpio/aspeed_gpio.c:564:14
>>      #1 0x55a5d933f3ab in memory_region_read_accessor 
>> system/memory.c:445:11
>>      #2 0x55a5d92fba40 in access_with_adjusted_size 
>> system/memory.c:573:18
>>      #3 0x55a5d92f842c in memory_region_dispatch_read1 
>> system/memory.c:1426:16
>>      #4 0x55a5d92f7b68 in memory_region_dispatch_read 
>> system/memory.c:1459:9
>>      #5 0x55a5d9376ad1 in flatview_read_continue_step 
>> system/physmem.c:2836:18
>>      #6 0x55a5d9376399 in flatview_read_continue system/physmem.c:2877:19
>>      #7 0x55a5d93775b8 in flatview_read system/physmem.c:2907:12
>>

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2355

>> Signed-off-by: Zheyu Ma <zheyuma97@gmail.com>
>> ---
>> Changes in v4:
>> - Change the variable name to 'reg_table_count'
>> - Change the 'reg_table_count' type to unsigned
> 
> Thanks,
> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> 
>> Changes in v3:
>> - Add the reproducer
>> ---
>>   hw/gpio/aspeed_gpio.c         | 17 +++++++++++++++++
>>   include/hw/gpio/aspeed_gpio.h |  1 +
>>   2 files changed, 18 insertions(+)
> 

