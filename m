Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp322916wrs;
        Tue, 27 Aug 2019 23:19:33 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwvyrdYpTGmfgjnGFi0E9tSKmKLNudtLlYgZhr3JTnExg6uTuk0VgSH8H3MfZ7aIe7MHWGw
X-Received: by 2002:ae9:e411:: with SMTP id q17mr2229396qkc.465.1566973173070;
        Tue, 27 Aug 2019 23:19:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566973173; cv=none;
        d=google.com; s=arc-20160816;
        b=iEeSHEBs2a29o3A11Q3MQwhJZKycX1tLfqWmGGBC+SZB6oAQ414BaYG7cbxKKxeJDT
         bRJKEuJnS8JgkybkyK85q+T0hxRJAfzhZbzBF2YTsiBr2mQLIYya2xbfMYD1caUsbEen
         +wA3RurLw9UDYwyj0bgsgQ3Mh9AcvDVXVaQch82O7K+Wet1PfgAiVzYHSjC0RMVNAKcD
         deXGp7ydX166i0s+xj1Jc/hr3Z9nbrxBJvQszPOzmEnhl+X+vZ+Dy5vYmEcdtdEgomxD
         3ItqB6piwr3m8xex4qL8ExPx1+Tk2WLA3Z/bnKBL0LUm6m/mljz555n8AnrAI4dcLRLj
         Bppw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=OCjVn3EjnTmEzyRBa3BM5yWtAuf/ld18Km4zhYx4xho=;
        b=J06uzmQqMcY4W3/xg3q/uEW5hwSva3oJzFtiStNTStenRVEJDmFJ8c+xPrO6PYBMra
         medShMmJCj6ky6UZ/YPDPz3r/F/udkZUaRWv3Uqlor87eWew7HmJk25nAsbMWgWpRXjy
         HJaHf8rikK+73vY3TXksqPNGLSsDaLVsm2FD1tUoZ0RdIi+N//iIuaBupxcO38bKlHUD
         dEZUsAWxyASl+A1xlxnQJVvsn+PY5HPNZaH7vkxITVWuPxRif6SJuH+YhW7rpNuuImB0
         PeLs0CECKFcK3GRqvNrEJXGFYD528ecEbLXXVt+4DaZgCbqCdA63fxYeg9Jh+/htS87K
         N6dA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 22si987237qka.225.2019.08.27.23.19.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Aug 2019 23:19:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i2rIq-0007jc-He
	for alex.bennee@linaro.org; Wed, 28 Aug 2019 02:19:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40788)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1i2rIg-0007jS-K0
 for qemu-arm@nongnu.org; Wed, 28 Aug 2019 02:19:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1i2rIf-0008Ge-7I
 for qemu-arm@nongnu.org; Wed, 28 Aug 2019 02:19:22 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48746)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1i2rIf-0008G7-2E; Wed, 28 Aug 2019 02:19:21 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id F288D3DE04;
 Wed, 28 Aug 2019 06:19:19 +0000 (UTC)
Received: from [10.36.116.105] (ovpn-116-105.ams2.redhat.com [10.36.116.105])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E5C056060D;
 Wed, 28 Aug 2019 06:19:17 +0000 (UTC)
To: Richard Henderson <richard.henderson@linaro.org>,
 eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 peter.maydell@linaro.org
References: <20190827160554.30995-1-eric.auger@redhat.com>
 <20190827160554.30995-4-eric.auger@redhat.com>
 <7d012631-1fe3-c040-eaf7-87ba274657c5@linaro.org>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <8779e6f0-b8d8-7ec8-a77a-860d8be97e5f@redhat.com>
Date: Wed, 28 Aug 2019 08:19:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <7d012631-1fe3-c040-eaf7-87ba274657c5@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.29]); Wed, 28 Aug 2019 06:19:20 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC 3/3] virt: Check
 KVM_CAP_ARM_IRQ_LINE_LAYOUT_2 for smp_cpus > 256
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
Cc: yuzenghui@huawei.com, maz@kernel.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9NVcK+XKxcPb

Hi Richard,

On 8/28/19 5:28 AM, Richard Henderson wrote:
> On 8/27/19 9:05 AM, Eric Auger wrote:
>> +++ b/target/arm/kvm_arm.h
>> @@ -233,6 +233,14 @@ bool kvm_arm_pmu_supported(CPUState *cs);
>>   */
>>  int kvm_arm_get_max_vm_ipa_size(MachineState *ms);
>>  
>> +/**
>> + * kvm_arm_irq_line_layout_2 - Returns whether more than 256
>> + * vcpus are supported by KVM_IRQ_LINE
>> + *
>> + * @ms: Machine state handle
>> + */
>> +bool kvm_arm_irq_line_layout_2(MachineState *ms);
>> +
>>  /**
>>   * kvm_arm_sync_mpstate_to_kvm
>>   * @cpu: ARMCPU
>> @@ -280,6 +288,11 @@ static inline int kvm_arm_get_max_vm_ipa_size(MachineState *ms)
>>      return -ENOENT;
>>  }
>>  
>> +static inline int kvm_arm_irq_line_layout_2(MachineState *ms)
>> +{
>> +    return -ENOENT;
>> +}
>> +
> 
> These signatures don't match.
thanks for spotting this. I will fix it.

Best Regards

Eric
> 
> 
> r~
> 
