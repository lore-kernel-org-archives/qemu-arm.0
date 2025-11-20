Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC6D4CF857F
	for <qemu-arm@archiver.kernel.org>; Thu, 20 Nov 2025 10:44:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vM28k-0001T4-98; Thu, 20 Nov 2025 05:43:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vM28i-0001Sk-Jw
 for qemu-arm@nongnu.org; Thu, 20 Nov 2025 05:43:48 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vM28g-0003TM-QL
 for qemu-arm@nongnu.org; Thu, 20 Nov 2025 05:43:48 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4779cb0a33fso7143345e9.0
 for <qemu-arm@nongnu.org>; Thu, 20 Nov 2025 02:43:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1763635424; x=1764240224; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7oHOv6TarlQbLUVDxxSIUN/NgK6M7FvSaHEHJevpMjw=;
 b=n2nu33Ex1CQW8aFAnPBh1w2EZckYOLJLOW4DsyKMSvBv8k0dH9CET2jFuv/Apg0W65
 gGRD/DptzMlKrnrPdiT/Q+//nvvwifOsJiii+i5b7HcTBP+jxXU7GLjbeeEanNsi99SA
 76zvnM6hdtvZLIsSm6m7GE1gBvNDuKtYMfkGqRA5nliXLV70fxEP3m5wu8xJi+2MEizj
 gPIwQFLqDXe+kaO969PTsqxX59NobpAGAYaPbm/a37yyZyTbHpyCnLi4RFCWAt3MUuIX
 Vlhc4YWKm2kUGocgOPNsBVFYBWJ3EnaWSdAfA4BA+scxyHYy/oD/znmwRHLppEyPdKiL
 SLZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763635424; x=1764240224;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7oHOv6TarlQbLUVDxxSIUN/NgK6M7FvSaHEHJevpMjw=;
 b=duDSY4KcipaPNleNxbU/F28Ao55iDBvJyN2ittQGZP9wvu7rPGpAheXUrH5eLSkDhK
 acwsraxHxpJHJuVGlxyUAL8xHD/8waGTe3GTf+ACDo323Z1NZVLsICfAgWcajExoN3jx
 Oy/QxQTcxlsYJ++XtuRJ6XZ/u1gHsyvP2FUMHIoVmwYvRbrgJuq/5jVVkxcPjQ8g6cAo
 fiVtoh2gs6i4VOENVAI3C/JWgulKDc/iAfWMnfuVQAHnNUrUIrf4PGpF4fxPgGnHea5K
 iXLd4elLWsB9feRUdb01lvCIb+ArD7Z7yQ4jZlzKO1ZIbja3ilwxKuMWZAaboMnsRZq/
 EL4g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUTbTZx8LEpJ0+Rt71dTtWOiYrbp9S4r6yCS7BTx5Kf3x4gjiYFQZXRJX3eZmofDz8kEwQIJvWh7w==@nongnu.org
X-Gm-Message-State: AOJu0Yyl7b5tnlWaDCOzyDWrM9IYbxRrWkGGCDpaNLJqkuezmlTLwS1F
 tNwP33eaTLiqs/YhIIpB8oVnSNCrQr5HiTu8N5DzE5qAW3y6MoJinqgh6czjGWQl0eg=
X-Gm-Gg: ASbGncvvey4JjJoL/m/dWU3zza75TVuFqRwc/7HLYGk4Kt+XETRApZSzyZiYLo1yzl5
 aso61keIiDpVdLNgh3xO5vcxecNBtYuCVak8PluJ/odDfXoFui0970H0vXC8R4TTDfXLcsujGez
 duV/75zeclWIlJvrns14+4Jk67nNSq/ZWL2BaU8mfLwh14OgnUwqiCtfRjp6r46ykEw88FoadwE
 I3IcDFGIwm0RBLZ15oKor+2LcdtOv645gQww3mWhjxhADZAhFHRYR43Sr7XJxbyDWMu3f2vj8Wu
 K0+27OYGym6n32Zp1qOxRcmV3XBQhqg/kecDt0cECstkKbm59eral53YkIqTe47N+cfe682QYoG
 DNK1Ar/R0gvj0WusqPyrG73ExTyztXx9PYaNxiy3okBcd8e66GQKS/eZCCzg8LYKVPF7uYUga0t
 Em6JBvYq1LJ2MvK529F8fob4p+eHL38vQ7HCWehtJ9tX0Ny/hFNiYDAw==
X-Google-Smtp-Source: AGHT+IEMgQ5A/ngM4oB7aYVi/VQg/3amHDLzSn7jIdobyyplBkmG3dA8rWbfZr7EIB9azrG7yf2qjA==
X-Received: by 2002:a05:600c:1550:b0:477:a54a:acba with SMTP id
 5b1f17b1804b1-477b9e1cbe5mr23604595e9.17.1763635424278; 
 Thu, 20 Nov 2025 02:43:44 -0800 (PST)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477b831421fsm40121035e9.10.2025.11.20.02.43.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Nov 2025 02:43:43 -0800 (PST)
Message-ID: <43427fac-db73-43af-bbf6-93bc3d978706@linaro.org>
Date: Thu, 20 Nov 2025 11:43:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] target/arm/kvm: add kvm-psci-version vcpu property
Content-Language: en-US
To: eric.auger@redhat.com, Sebastian Ott <sebott@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, kvm@vger.kernel.org, kvmarm@lists.linux.dev
References: <20251112181357.38999-1-sebott@redhat.com>
 <20251112181357.38999-3-sebott@redhat.com>
 <d4f17034-94d9-4fdb-9d9d-c027dbc1e9b3@linaro.org>
 <c082340f-31b1-e690-8c29-c8d39edf8d35@redhat.com>
 <a2d0ddf1-f00c-42dd-851d-53f2ec789986@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <a2d0ddf1-f00c-42dd-851d-53f2ec789986@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 20/11/25 11:10, Eric Auger wrote:
> 
> 
> On 11/13/25 1:05 PM, Sebastian Ott wrote:
>> Hi Philippe,
>>
>> On Wed, 12 Nov 2025, Philippe Mathieu-Daudé wrote:
>>> On 12/11/25 19:13, Sebastian Ott wrote:
>>>>   Provide a kvm specific vcpu property to override the default
>>>>   (as of kernel v6.13 that would be PSCI v1.3) PSCI version emulated
>>>>   by kvm. Current valid values are: 0.1, 0.2, 1.0, 1.1, 1.2, and 1.3
>>>>
>>>>   Note: in order to support PSCI v0.1 we need to drop vcpu
>>>>   initialization with KVM_CAP_ARM_PSCI_0_2 in that case.
>>>>
>>>>   Signed-off-by: Sebastian Ott <sebott@redhat.com>
>>>>   ---
>>>>     docs/system/arm/cpu-features.rst |  5 +++
>>>>     target/arm/cpu.h                 |  6 +++
>>>>     target/arm/kvm.c                 | 64
>>>> +++++++++++++++++++++++++++++++-
>>>>     3 files changed, 74 insertions(+), 1 deletion(-)
>>>
>>>
>>>>   diff --git a/target/arm/kvm.c b/target/arm/kvm.c
>>>>   index 0d57081e69..e91b1abfb8 100644
>>>>   --- a/target/arm/kvm.c
>>>>   +++ b/target/arm/kvm.c
>>>>   @@ -484,6 +484,49 @@ static void kvm_steal_time_set(Object *obj, bool
>>>>   value, Error **errp)
>>>>         ARM_CPU(obj)->kvm_steal_time = value ? ON_OFF_AUTO_ON :
>>>>     ON_OFF_AUTO_OFF;
>>>>     }
>>>>
>>>>   +struct psci_version {
>>>>   +    uint32_t number;
>>>>   +    const char *str;
>>>>   +};
>>>>   +
>>>>   +static const struct psci_version psci_versions[] = {
>>>>   +    { QEMU_PSCI_VERSION_0_1, "0.1" },
>>>>   +    { QEMU_PSCI_VERSION_0_2, "0.2" },
>>>>   +    { QEMU_PSCI_VERSION_1_0, "1.0" },
>>>>   +    { QEMU_PSCI_VERSION_1_1, "1.1" },
>>>>   +    { QEMU_PSCI_VERSION_1_2, "1.2" },
>>>>   +    { QEMU_PSCI_VERSION_1_3, "1.3" },
>>>>   +    { -1, NULL },
>>>>   +};
>>>
>>>
>>>>   @@ -505,6 +548,12 @@ void kvm_arm_add_vcpu_properties(ARMCPU *cpu)
>>>>                                  kvm_steal_time_set);
>>>>         object_property_set_description(obj, "kvm-steal-time",
>>>>                                         "Set off to disable KVM steal
>>>>   time.");
>>>>   +
>>>>   +    object_property_add_str(obj, "kvm-psci-version",
>>>>   kvm_get_psci_version,
>>>>   +                            kvm_set_psci_version);
>>>>   +    object_property_set_description(obj, "kvm-psci-version",
>>>>   +                                    "Set PSCI version. "
>>>>   +                                    "Valid values are 0.1, 0.2,
>>>> 1.0, 1.1,
>>>>   1.2, 1.3");
>>>
>>> Could we enumerate from psci_versions[] here?
>>>
>>
>> Hm, we'd need to concatenate these. Either manually:
>> "Valid values are " psci_versions[0].str ", " psci_versions[1].str ",
>> " ... which is not pretty and still needs to be touched for a new
>> version.
>>
>> Or by a helper function that puts these in a new array and uses smth like
>> g_strjoinv(", ", array);
>> But that's quite a bit of extra code that needs to be maintained without
>> much gain.
>>
>> Or we shy away from the issue and rephrase that to:
>> "Valid values include 1.0, 1.1, 1.2, 1.3"
> Personally I would vote for keeping it as is

OK.

> (by the way why did you
> moit 0.1 and 0.2 above?)
> 
> Eric
>>
>> Since the intended use case is via machine types and I don't expect a
>> lot of users setting the psci version manually - I vote for option 3.
>>
>> Opinions?
>>
>> Sebastian
> 


