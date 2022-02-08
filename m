Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp399366lfk;
        Mon, 7 Feb 2022 20:57:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyw2Gx0cGVlNpps5QYKrzx3X/NMskNPELFNAwJZNXxKguCSHr+dGJNxb+5WRgpBcVVwFn0U
X-Received: by 2002:a81:7389:: with SMTP id o131mr3269757ywc.169.1644296233117;
        Mon, 07 Feb 2022 20:57:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1644296233; cv=none;
        d=google.com; s=arc-20160816;
        b=SV6KWYNQS6LvPi0IrXNbBqt7jUFDCc9m4bTTtJsOF8DoQ1epP9/tBjhVjUqFh5aL1H
         xP8YX4OE7TkzlReMqVvsWWoVfcHUSCutkaEyenRqk7frsFRB7ijAUMQjI8XFD/0+ahs0
         qulyZPBX6WuB8WfI4mKlaeYuuT8wFGWzDG/Dr3L6cn5Ib4CpiEEIhdhnAKuAydtRSOIu
         iedGkPL99YduJtgJ/YSrrPqFP1XumnX2FWXHT9yatDYpibKla57kuxIfdyn/j0gbqWpq
         pDAtkwGxLa9zdOFsaUY1F4OdOdydRD3T5JWdkNRDw9eol0Nk4LvEwHCebpsYz5uXC3y7
         VTyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=ftPhs3zOU3HDBh+73xl6Q1Kk/fXIXOZw85jAwnCxbyM=;
        b=w3+HUkyiFk+QXQHDZHpAvoSpOC/aQtFkdBH4woM4zts3O3OhOFJoPH3ab0/mQlk0vn
         8RZehp13OmvcpMk7s2EA59ndBubv4BkvqxQPCumsMRm0dr5PVHa/dx9Vkw3cGpLoqWc/
         OiJoVhY2nVWzpToMdnyTFFcB83f7kvYkhR1WPoNEUN1hof7Byygr22X6oAd1mu/tti/8
         gdhMOHG/YjK0XIxicJprSXbvCbDbhD2aNBh2/v8rzVRGWCqX5BEuExCIEzeJrzRVV5DD
         uQBammIMpV+++XC9soEwiYxN+Iso2nY71Zh2tCgZQa/3a0FOG7Bndh6ZKe54huia40cy
         s9vQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ispras.ru
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v125si3425656ybe.710.2022.02.07.20.57.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Feb 2022 20:57:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ispras.ru
Received: from localhost ([::1]:41864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nHIYy-0004IF-6M
	for alex.bennee@linaro.org; Mon, 07 Feb 2022 23:57:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1nHIYd-0004I2-R9; Mon, 07 Feb 2022 23:56:51 -0500
Received: from mail.ispras.ru ([83.149.199.84]:51382)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1nHIYZ-0006Gk-Pq; Mon, 07 Feb 2022 23:56:50 -0500
Received: from [192.168.0.219] (unknown [62.118.138.151])
 by mail.ispras.ru (Postfix) with ESMTPSA id B6B6340D403D;
 Tue,  8 Feb 2022 04:56:37 +0000 (UTC)
Subject: Re: target/arm: cp15.dacr migration
To: Peter Maydell <peter.maydell@linaro.org>
References: <662aca02-da99-524f-d9df-cd61427ca520@ispras.ru>
 <CAFEAcA_U1hgz55mGX7DZp36aOHGriU0wjr9Dvt4Y=f2EGNgF+A@mail.gmail.com>
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Message-ID: <6bf3ba6a-0694-21c6-dbcc-d77f69fda4cb@ispras.ru>
Date: Tue, 8 Feb 2022 07:56:37 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_U1hgz55mGX7DZp36aOHGriU0wjr9Dvt4Y=f2EGNgF+A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=83.149.199.84;
 envelope-from=pavel.dovgalyuk@ispras.ru; helo=mail.ispras.ru
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Gkgkvpez7UO6

On 07.02.2022 16:44, Peter Maydell wrote:
> On Mon, 7 Feb 2022 at 12:13, Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru> wrote:
>>
>> I recently encountered a problem with cp15.dacr register.
>> It has _s and _ns versions. During the migration only dacr_ns is
>> saved/loaded.
>> But both of the values are used in get_phys_addr_v5 and get_phys_addr_v6
>> functions. Therefore VM behavior becomes incorrect after loading the
>> vmstate.
> 
> Yes, we don't correctly save and restore the Secure banked
> registers. This is a long standing bug (eg it is the
> cause of https://gitlab.com/qemu-project/qemu/-/issues/467).
> Almost nobody notices this, because almost nobody both runs
> Secure-world AArch32 code and also tries migration or save/restore.

We actually did it for reverse debugging of custom firmware.

>> I found that kvm_to_cpreg_id is responsible for disabling dacr_s
>> migration, because it always selects ns variant.
> 
>> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
>> index c6a4d50e82..d3ffef3640 100644
>> --- a/target/arm/cpu.h
>> +++ b/target/arm/cpu.h
>> @@ -2510,11 +2510,6 @@ static inline uint32_t kvm_to_cpreg_id(uint64_t
>> kvmid)
>>            if ((kvmid & CP_REG_SIZE_MASK) == CP_REG_SIZE_U64) {
>>                cpregid |= (1 << 15);
>>            }
>> -
>> -        /* KVM is always non-secure so add the NS flag on AArch32 register
>> -         * entries.
>> -         */
>> -         cpregid |= 1 << CP_REG_NS_SHIFT;
>>        }
>>        return cpregid;
>>    }
> 
> This change is wrong, or at least incomplete -- as the comment notes,
> a guest running under KVM is always NonSecure, so when KVM says "this is
> DACR" (or whatever) it always means "this is the NS banked DACR".
> (Though now AArch32 KVM support has been dropped we have some flexibility
> to not necessarily use KVM register ID values that exactly match what
> the kernel uses, if we need to do that.)

Unfortunately, I can't test anything with AArch32 KVM.

> Also, kvm_to_cpreg_id() and cpreg_to_kvm_id() are supposed to be
> inverses of each other -- at the moment they are not, hence
> this bug, but I think your change has probably resulted in both
> the S and the NS banked versions of each register being treated
> as the S banked version, which will have a different set of problems.

I checked the flags coming through write_cpustate_to_list. There were 
both dacr_s and dacr_ns flags. Therefore both values were saved.

> 
> There is also the question of migration compatibility to consider
> in any change in this area.


Pavel Dovgalyuk
