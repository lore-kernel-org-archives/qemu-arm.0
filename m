Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp5018457ejb;
        Wed, 21 Dec 2022 01:29:48 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuCNy9IiQ3/7OE4Am5DeiGsUeV2otdLndzdSDavLRyzJ+RixVK4/mWbYoa2JTVCtQCOLY7w
X-Received: by 2002:a05:6214:350d:b0:4c6:90c6:b427 with SMTP id nk13-20020a056214350d00b004c690c6b427mr1570124qvb.39.1671614988711;
        Wed, 21 Dec 2022 01:29:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671614988; cv=none;
        d=google.com; s=arc-20160816;
        b=CjXzpwNpgrUXwdC/QOaPiZua0mBzxacZM6hnDxetLvZ9yCWBJ1WDEiq61jTwXTYtMh
         uPsRaN8g8KqYmtyfzXuLZfuOsRxrME0aa8EafcLNjo3ldgBAnSLtkYjOfG8U1LZ6p0dY
         cKHn8UfcFmKZT43w047yx9iqJsUmm5yYYF20ID3dtaMJKwaVnQO7PHRh7CnEmose1CHL
         P8kGYso7WAZdx8EqhRcoh7QX4+QoS9+iCd1EErWnncUxqOKPPtzIoPp6sU27rkxLA7oz
         CqufZyQrnkYB9KOORnzH6frQURJv7mzawUfChMEno1ackMxbcEvqstkNQZGQEOQT4dzy
         /77Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=/GZIEgrf017t3B5J/cERFEmDNW4PTYPwabnJi7uTGqU=;
        b=Mm4De3T0mhK9QBPlNAoPyj126RGq0HaWaJvSzNYsdSm23nREiHOgxiat/svXNcMM5X
         8W4JGSOUVtUWVoBwSjGWGRKw7TSNRIxtAp2ugT+mflJLIsojePGDchKP1TqvjPbCPYkh
         ZKnKSYytR4QsXbh9FKRVyqysgRqny6Y+fLS3GYgbh9H/FYfz/u80CW1KpDdgboUq/wW3
         zp2MFQzDTPyUyoVJq2lgkrvOsoQFxEijN+Tn40B83MTGA9bR/4xCpmqqkYiYKk7uZQLL
         QSyZSz3BmClHNQBmfEBpT67YX7pV2c6oj/Bm1JgOL/TCIzXBmQKieG9FlV06XAQNQV9w
         l6LA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z16-20020a056214041000b004b18caf88bbsi6306777qvx.360.2022.12.21.01.29.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Dec 2022 01:29:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1p7vP6-0005fO-Pa; Wed, 21 Dec 2022 04:28:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1p7vP4-0005en-B0; Wed, 21 Dec 2022 04:28:46 -0500
Received: from mail.csgraf.de ([85.25.223.15] helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1p7vP1-0004df-Fx; Wed, 21 Dec 2022 04:28:45 -0500
Received: from [192.168.106.127]
 (dynamic-095-117-119-107.95.117.pool.telefonica.de [95.117.119.107])
 by csgraf.de (Postfix) with ESMTPSA id 44B2760802DD;
 Wed, 21 Dec 2022 10:28:40 +0100 (CET)
Message-ID: <50590ff2-3135-62a4-580e-72c53574f8cb@csgraf.de>
Date: Wed, 21 Dec 2022 10:28:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.0
Subject: Re: [PATCH 1/2] hw/arm/virt: Consolidate GIC finalize logic
Content-Language: en-US
To: Zenghui Yu <yuzenghui@huawei.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org
References: <20221220230414.47876-1-agraf@csgraf.de>
 <20221220230414.47876-2-agraf@csgraf.de>
 <2e2a7246-5b79-637d-cbfe-65bc686d523e@huawei.com>
From: Alexander Graf <agraf@csgraf.de>
In-Reply-To: <2e2a7246-5b79-637d-cbfe-65bc686d523e@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=85.25.223.15; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.161,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: jdfQEC4My81x

Hey Zengui,

On 21.12.22 04:35, Zenghui Yu wrote:
> On 2022/12/21 7:04, Alexander Graf wrote:
>> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
>> index c7dd59d7f1..365d19f7a3 100644
>> --- a/include/hw/arm/virt.h
>> +++ b/include/hw/arm/virt.h
>> @@ -109,12 +109,12 @@ typedef enum VirtMSIControllerType {
>>  } VirtMSIControllerType;
>>
>>  typedef enum VirtGICType {
>> -    VIRT_GIC_VERSION_MAX,
>> -    VIRT_GIC_VERSION_HOST,
>> -    VIRT_GIC_VERSION_2,
>> -    VIRT_GIC_VERSION_3,
>> -    VIRT_GIC_VERSION_4,
>> -    VIRT_GIC_VERSION_NOSEL,
>> +    VIRT_GIC_VERSION_MAX = 0,
>> +    VIRT_GIC_VERSION_HOST = 1,
>> +    VIRT_GIC_VERSION_NOSEL = 2,
>> +    VIRT_GIC_VERSION_2 = (1 << 2),
>> +    VIRT_GIC_VERSION_3 = (1 << 3),
>> +    VIRT_GIC_VERSION_4 = (1 << 4),
>
> This would break the ACPI case. When building the MADT, we currently
> write the raw vms->gic_version value into "GIC version" field of the
> GICD structure. This happens to work because VIRT_GIC_VERSION_x == x (by
> luck, I think). We may need to fix build_madt() before this change.


Ouch, thanks a lot for the catch! I don't think it's by luck - the 
versions are put very deliberately at a place where they equal the gic 
number. But I agree that it's missing a comment - I'll add one for 
clarification and make sure the defines looks explicit in v2.


Alex

