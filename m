Received: by 2002:a05:7022:d82:b0:85:21:bd5b with SMTP id ec2csp180313dlb;
        Wed, 7 Aug 2024 02:04:18 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWYKC3BYZqzpk++j/wRc/GZ1X+z+mcokPZdj+JL/b9G40Q+IcqfUeFHM+kJxbQrxr+6NlOj7fx5cnxscGsHPdbmSt1AmipE
X-Google-Smtp-Source: AGHT+IHgEm9zL6AKRLaJ8XCa5fpFtFMTO8oODLz3Z/Ek0TBIpxijOErt0deihFlN4gfsY2MW904B
X-Received: by 2002:a05:6830:618b:b0:70a:988a:b5fd with SMTP id 46e09a7af769-70a988abd5cmr20869194a34.24.1723021457958;
        Wed, 07 Aug 2024 02:04:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723021457; cv=none;
        d=google.com; s=arc-20160816;
        b=lQTOKqE7rZDlxHkJZrbrKc9nOQXVEO65Cj4izLUIDw170DixLX5gqQmeiUYJ4vT0yL
         PZDEusgotO9vOy233zZcSMMhXxOJik8UgOjNpZZjUqwelA9Ep0DfacqDYmC6Re1kAShg
         Eo1v0yYfsGLk7uQfnOK2ONG9bVcyDL2g2U/lDQfswt/gofdDLnCSYb347f5QOE+hweTi
         HoysJNc0aqj+tCBk7s+XLPSXanHHhFPNEwHLWR5K82fW96I1iQ+Ir+wjUAPxaJKqBt9K
         IsNSkkO+xG31A6iPOBd/TMKJ3Y79X5wzk9qDyAStbrhhtNcgMl9NQQHTWiEeEjvYQZOz
         d9ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=p1Q94/zg0X3fLzs3pCmUXZzOPeJTeXK+OTu8CaU5ZlI=;
        fh=Nwpju639HQDMCq+Fo0fOFT6SHZN54fUcf3yb9aTEhmM=;
        b=JOp/hByNcV+TKZBgXYH0JyXLLPiIoiiZ5pQyCRMCWjb8BAn3sVZoZuxShVdJySopl9
         gu11+YGQBOl5LHJ1SAVw3iFtW3vbCSrHiHm4jDQEadnJ6d9YmI4BfbTvf/MhPRo7htpQ
         9hrGKLDHpTnFHXONkEXEsA96gETHc4Pkz2RhlpEJkLsSsIDSURbXvhNOw2YKNbV9v14T
         oof804fQqYVvT0fd5bM6/0GR5q/njRAbGOpL/c/F4cy1oH4EwaAGOB27CtIn1J1K/b15
         NJvz3rVeNKHSMplimrSIAKDedx2mue6TQlc2WPgLpUyGQ7TxB8VmcN9JpZ6ztxTW+SJ3
         Otdw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vQWr75mM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6bbbb5f9d9csi13416776d6.118.2024.08.07.02.04.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Aug 2024 02:04:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vQWr75mM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sbcaN-0000fW-O9; Wed, 07 Aug 2024 05:03:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sbcaM-0000eU-Qn
 for qemu-arm@nongnu.org; Wed, 07 Aug 2024 05:03:58 -0400
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sbcaK-0004Ff-Vl
 for qemu-arm@nongnu.org; Wed, 07 Aug 2024 05:03:58 -0400
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2eeb1ba0481so21379131fa.2
 for <qemu-arm@nongnu.org>; Wed, 07 Aug 2024 02:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1723021435; x=1723626235; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=p1Q94/zg0X3fLzs3pCmUXZzOPeJTeXK+OTu8CaU5ZlI=;
 b=vQWr75mMmPJn0QBZNm4fTuMQc5sll6eYKBit4rn8Cu0EeoejsE8BABRDF6O7WEuQRK
 RhedWCBd90SeBwiWqvs+1cyLvorcKkJWkQrct40uKkv6iMmNrEWEOFbrju6trm+xmQA0
 E41X38obPq4steJPV+ZRavuAioCQIK9fiBC31d8+YWlclUsRXSOHUvs0Nci25UlnN43T
 LX/ZJ5vn6v5gbcCjFOHbTrWycXfdan1dDeohbg/Za/eUxnE29yjmmYLIue8/IlIT0qP9
 LdxatI4g9085jNpsf0yVjKPVzuW3Kpsq+7FMWAMzubMymd64skUkOj43iQcefcA5f2QO
 iIhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723021435; x=1723626235;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=p1Q94/zg0X3fLzs3pCmUXZzOPeJTeXK+OTu8CaU5ZlI=;
 b=d9R/4gbL7j7TQJfvl1sY6r18nm3x3+WrB3AEgUz2uWoCgg+6oIyUQAK/7T1Ae0xBNO
 6yEG8XPJhDTtAGjhgILrSsReP4wzsyUaC10CwluGfN1bFK0i5DrXQCXuAMxRmAVOXuz9
 UcM1OAL6FpOKyECsCuGXVsr0fM2UXvZ0mhkaVamrM+edPZPtsgbvTCXkJEmkJ81jqOMd
 cWiJFKbGf+DzzCXk8AxZHybbL7gznDUoXjcAdT/EDivNhL9w2dSps0ZMbEDWK3Sf2MfK
 HHDzlGr/rNZc7iA6kDX3/EaBSfMt4w5mbe7gm9bxwP9h5gTimedlTjXV6QGN3zzZnel0
 F34g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQISOFrBt/duki57a5O5DBOVxGAObp+/zn7mZfEanp5hjJCvD9u7VsyRXOEO8us9uTmrOKQoj0VGrL8oeNOw9NZf50
X-Gm-Message-State: AOJu0YxbCha8IFlTZvPUy4HraH8BQ01rh1HYO31QZmZbeKI7OTsA84+q
 kCksWxMvAjJJ+hd9QDUoutzPSTdsFyaREihp43uBVMSicwBx3F6Gk534J9vP6NQ=
X-Received: by 2002:a2e:91d0:0:b0:2f0:32f1:896d with SMTP id
 38308e7fff4ca-2f15aabce68mr129308041fa.23.1723021434620; 
 Wed, 07 Aug 2024 02:03:54 -0700 (PDT)
Received: from [192.168.69.100] ([176.187.212.120])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36bbd06fbfdsm15137654f8f.106.2024.08.07.02.03.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Aug 2024 02:03:54 -0700 (PDT)
Message-ID: <a8eb43d8-3714-447b-ab1b-c96ff05cf14a@linaro.org>
Date: Wed, 7 Aug 2024 11:03:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH-for-9.1? 2/2] hw/intc/arm_gic: Only provide
 query-gic-capabilities when GIC built-in
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>
References: <20240806141940.22095-1-philmd@linaro.org>
 <20240806141940.22095-3-philmd@linaro.org> <87o764yce3.fsf@pond.sub.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <87o764yce3.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::231;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x231.google.com
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
X-TUID: yq9/Q9JRwkvL

On 7/8/24 10:18, Markus Armbruster wrote:
> Philippe Mathieu-Daudé <philmd@linaro.org> writes:
> 
>> When configuring QEMU with --without-default-devices and
>> not including machines using a GIC, the GIC model is not
>> built in but the 'query-gic-capabilities' command still
>> returns false hopes about GIC:
>>
>>    {"execute": "query-gic-capabilities"}
>>    {"return": [{"emulated": true, "version": 3, "kernel": false}, {"emulated": true, "version": 2, "kernel": false}]}
>>
>> Restrict the command to when the GIC is available. If it
>> isn't we'll get:
>>
>>    { "execute": "query-gic-capabilities" }
>>    {"error": {"class": "CommandNotFound", "desc": "The command query-gic-capabilities has not been found"}}
>>
>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2484
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   qapi/misc-target.json | 4 ++--
>>   hw/intc/arm_gic_qmp.c | 2 ++
>>   hw/intc/meson.build   | 2 +-
>>   3 files changed, 5 insertions(+), 3 deletions(-)
>>
>> diff --git a/qapi/misc-target.json b/qapi/misc-target.json
>> index 8d70bd24d8..b857e44c2e 100644
>> --- a/qapi/misc-target.json
>> +++ b/qapi/misc-target.json
>> @@ -316,7 +316,7 @@
>>     'data': { 'version': 'int',
>>               'emulated': 'bool',
>>               'kernel': 'bool' },
>> -  'if': 'TARGET_ARM' }
>> +  'if': 'CONFIG_ARM_GIC' }
>>   
>>   ##
>>   # @query-gic-capabilities:
>> @@ -335,7 +335,7 @@
>>   #                     { "version": 3, "emulated": false, "kernel": true } ] }
>>   ##
>>   { 'command': 'query-gic-capabilities', 'returns': ['GICCapability'],
>> -  'if': 'TARGET_ARM' }
>> +  'if': 'CONFIG_ARM_GIC' }
>>   
>>   ##
>>   # @SGXEPCSection:
>> diff --git a/hw/intc/arm_gic_qmp.c b/hw/intc/arm_gic_qmp.c
>> index 71056a0c10..1fc79c775b 100644
>> --- a/hw/intc/arm_gic_qmp.c
>> +++ b/hw/intc/arm_gic_qmp.c
>> @@ -6,6 +6,8 @@
>>   
>>   #include "qemu/osdep.h"
>>   #include "qapi/util.h"
>> +
>> +#include CONFIG_DEVICES
> 
> Uh, why do we need this now?

Now qapi-commands-misc-target.h is generated guarded with
'#ifdef CONFIG_ARM_GIC', and CONFIG_ARM_GIC is defined per
target in CONFIG_DEVICES.

I'll update the patch description, but does this makes
sense to you? QAPI headers don't include headers defining
guards, we have to include them manually where we use QAPI
headers.

> 
>>   #include "qapi/qapi-commands-misc-target.h"
>>   #include "kvm_arm.h"
>>   
>> diff --git a/hw/intc/meson.build b/hw/intc/meson.build
>> index 45d3503d49..b9550967e2 100644
>> --- a/hw/intc/meson.build
>> +++ b/hw/intc/meson.build
>> @@ -39,7 +39,7 @@ if config_all_devices.has_key('CONFIG_APIC') or \
>>   endif
>>   
>>   specific_ss.add(when: 'CONFIG_APIC', if_true: files('apic.c', 'apic_common.c'))
>> -specific_ss.add(when: 'CONFIG_ARM', if_true: files('arm_gic_qmp.c'))
>> +specific_ss.add(when: 'CONFIG_ARM_GIC', if_true: files('arm_gic_qmp.c'))
>>   specific_ss.add(when: 'CONFIG_ARM_GIC', if_true: files('arm_gicv3_cpuif_common.c'))
>>   specific_ss.add(when: 'CONFIG_ARM_GICV3_TCG', if_true: files('arm_gicv3_cpuif.c'))
>>   specific_ss.add(when: 'CONFIG_ARM_GIC_KVM', if_true: files('arm_gic_kvm.c'))
> 

