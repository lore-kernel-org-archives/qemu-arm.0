Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49FCDC87FCB
	for <qemu-arm@archiver.kernel.org>; Tue, 12 Aug 2025 04:50:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ulgxc-00035a-FK; Tue, 12 Aug 2025 00:50:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ulgxa-00035L-8r
 for qemu-arm@nongnu.org; Tue, 12 Aug 2025 00:50:06 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ulgxV-0004Wg-58
 for qemu-arm@nongnu.org; Tue, 12 Aug 2025 00:50:05 -0400
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3b7823559a5so2354612f8f.0
 for <qemu-arm@nongnu.org>; Mon, 11 Aug 2025 21:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754974191; x=1755578991; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nKO/btB8sgwjdTI9Kz/mOI1judsHVR/Ol8FXze9Q5lQ=;
 b=qJdaOUDl0ELw6B00Rm2nPVjEC+K9lm14uLC9qQ3tBgLTG4YCui++kTa+9Vufmoc9Y/
 z/drFNPVfolLfGpntsOZbzNTVEvM+OeyN5Xh8M+HigEUZdo7w9JERIntzz2fQwWv12hd
 iOKXR3iFt5cRwLiwyFv9qNyC+OnHnSdHIMmee/cti3XItoUWvV0B5ZYwNX6m9ZcdF9B0
 ACKLTyiChkBQjH00XQtHu+fDgKCOF6PlC1Y3XpZ8z9roN3LhkebNh/fxr/InWOSlyHMU
 B1xbJXZ4JLhdO6L5e258TlZvRz1+sJ8j9zB+Zj4diy11OoG74F6kwkqgxm40r64SabvV
 6jgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754974191; x=1755578991;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nKO/btB8sgwjdTI9Kz/mOI1judsHVR/Ol8FXze9Q5lQ=;
 b=gwObJiOqNv960TtG9Avj84Ht3qmOEDsNGSu4hkt1gbWDGuH0gOha38lCWgtFuXZEta
 9Vd2Mgkgdb5givbCj3+Z9nFMc2I7eLGiGmyv8ruAhFbzYOIj496uy+9XegANI9DDYU4M
 kqPYTNfXIrsNVsnWH/uM6e7z4UXGyPWHF0TmrZGWmzmVni4UdJ6q/1KxukFzz3YBaLKC
 ybcevHHwdMb3fnoJ3ZpYvOomay41BB8QSGcT+j91uIPU66QHub1bjxHBdwNTtNRql5aI
 H04eWRQM+kB/aFMLcnkv5ztRMR5lroQWQ46vLxdLclYojhUSqQAmVDSPeJQyS8pHNF9r
 42Zg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUorctzfG5Eo5bsCBR2VGMVPbvZPyevr6UeVSnBfXBtAXuRhyMu59N8hFzzr2Ew2c1tfJkT0JJ5iA==@nongnu.org
X-Gm-Message-State: AOJu0YyWGcDTeNAP3ycI0vkGTnPkzrEqRGEtn0ztypSbqFKeUNNddzHl
 UCeFGoYTIh2kCk+9XMHa2ejnZNl2JTRBk2fw4HobXaN2RcdhoNlv3SEEjm+t7Wa6BRI=
X-Gm-Gg: ASbGnct642+vFYpMlrXB73gVJBRQ/rf4K3nonlhOFhPYdxHkWCrScp278bG3KatC/Dx
 eLWZ+yJd5G/lxVUqxGwhiWkCgq6AF/hOES4EpD8iA6RD72ShkrECzqyRE+JreWHMMbLos2/+SN1
 Y4Bo31c9lxwRBxn8pEJKouTPq8NIwZ+yf1WHTuW2xVjCcG/pXDDZ2BcmCfSFWUrBtm/J5e2AYOI
 DulUBiF031Pk4GduPmWtP7MFD8i+iHd4xue1+vUFnb6ca6cu6/8+4xygwhqPEnk3s6Jaj7aetQG
 h/LqbX9VZiA/GDmhTgrbHTDo+zqeOT1TokOBPRLftwp6Wal7jIuGTsbODwRy3zby6XZ89H2waUJ
 NEfSpuMiqe6we7d6qxKk3hO/l23okqdhTKb87m74EDP8Fkwv9zvRHsJ1fo/6Acp7BZBINPcSN+v
 S/
X-Google-Smtp-Source: AGHT+IFzSLCrFfOChpFZBEIxi3PmTUayS0Ee8wnnNgXG4m8ADogf3URL6YowrkJcbp3tQmtBfLy4LA==
X-Received: by 2002:a05:6000:2010:b0:3b7:95bc:a7ea with SMTP id
 ffacd0b85a97d-3b910fd9b71mr1537054f8f.22.1754974191512; 
 Mon, 11 Aug 2025 21:49:51 -0700 (PDT)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459e58400f5sm274704575e9.2.2025.08.11.21.49.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Aug 2025 21:49:50 -0700 (PDT)
Message-ID: <14d7d948-e840-4ae7-ae93-122755d6a421@linaro.org>
Date: Tue, 12 Aug 2025 06:49:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 07/11] target/arm: Replace kvm_arm_pmu_supported by
 host_cpu_feature_supported
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: Miguel Luis <miguel.luis@oracle.com>, kvm@vger.kernel.org,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Haibo Xu <haibo.xu@linaro.org>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Mark Burton <mburton@qti.qualcomm.com>, Alexander Graf <agraf@csgraf.de>,
 Claudio Fontana <cfontana@suse.de>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Mads Ynddal <mads@ynddal.dk>,
 Eric Auger <eric.auger@redhat.com>, qemu-arm@nongnu.org,
 Cameron Esfahani <dirty@apple.com>
References: <20250811170611.37482-1-philmd@linaro.org>
 <20250811170611.37482-8-philmd@linaro.org>
 <8efcc809-f548-4383-b742-e435d622da73@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <8efcc809-f548-4383-b742-e435d622da73@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 12/8/25 02:48, Richard Henderson wrote:
> On 8/12/25 03:06, Philippe Mathieu-Daudé wrote:
>> +++ b/target/arm/kvm.c
>> @@ -288,7 +288,7 @@ static bool 
>> kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
>>                                1 << KVM_ARM_VCPU_PTRAUTH_GENERIC);
>>       }
>> -    if (kvm_arm_pmu_supported()) {
>> +    if (host_cpu_feature_supported(ARM_FEATURE_PMU, false)) {
> 
> Why is false correct here?  Alternately, in the next patch, why is it 
> correct to pass true for the EL2 test?

I think I copied to KVM the HVF use, adapted on top of:
https://lore.kernel.org/qemu-devel/20250808070137.48716-12-mohamed@unpredictable.fr/

> 
> What is the purpose of the can_emulate parameter at all?

When using split-accel on pre-M3, we might emulate EL2:

        |   feat            |    can_emulate   |    retval
        +   ----            +      -----       +     ----M1/M2  | 
ARM_FEATURE_EL2         false            false
M1/M2  |  ARM_FEATURE_EL2         true             true
M3/M4  |  ARM_FEATURE_EL2         any              true

