Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E1B2CA0FF2
	for <qemu-arm@archiver.kernel.org>; Wed,  3 Sep 2025 12:20:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1utmTK-0003H7-Qu; Wed, 03 Sep 2025 08:20:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1utmTI-0003GW-Lx
 for qemu-arm@nongnu.org; Wed, 03 Sep 2025 08:20:16 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1utmTD-0005s9-5U
 for qemu-arm@nongnu.org; Wed, 03 Sep 2025 08:20:14 -0400
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3d2564399a5so1539017f8f.1
 for <qemu-arm@nongnu.org>; Wed, 03 Sep 2025 05:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756902009; x=1757506809; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tYdbM6yd4V3eY5DQAneqQc/YGcbb1DVFfox825Cz89A=;
 b=EI56eHC2I6tj5NwplNSxbZtJqH8wi6j0UiXj3tdtBr4Ug3unRgJAh/C+NV88pSkxse
 QFhoBoEmnzD668ZZyh7pn9+AGckhyCCmSYOgkPNOLB4nUZGJt0W1O0bDyTMnTI5el5IJ
 eax9ucs8/4Q0CRMptKX+dORlz4GA4xLQXP1V/yCfR+uZ8XY64MvjhRVJGX9eijxc2uZx
 ubWtE6VCGuiJXPgTSrCNjC2r/H5gxTJ3p6hkKJ8ygOQnr9yZD5EUddr6AFD7AnnYHqjS
 P+iBhovNSaODTb8FxtIcPBm3KGABr4JMAsCJ4ssWSMsi/xWnzdnRF+iN1IXPcELtTrqw
 m+gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756902009; x=1757506809;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tYdbM6yd4V3eY5DQAneqQc/YGcbb1DVFfox825Cz89A=;
 b=mh7nUAFHVqGOBrtwt80oQg0img2uTa2HOFSoib9yyp6NE2NtaF88w/AgzA4nHAYSgL
 O5oZ7JVEIPhKilKTDH5xM57kv8Sn7tnzGpVUXWK3AWZzDpUIBvW4WueXIe8KqzfeWBLf
 nlMUGyyQYpEKcUPGrkWe12RVp9xO2OoWnm0/OLu+5pt2iIrDcql2mireUXytcJ1/Ksx/
 5tVOZNjBPF4LsuHZn0YpL6FxS+bt48LMABHp6qyPtdBb1gFm73grs8pKwumQJaKUj3Rf
 nlJwG4+fo2faEIENWMVHdsboaC2rs4yKv2uv7pNOXvnXONmwmhqfLRg4ylIUtcCIkYZH
 EG+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCX9osKCF27GR+cI3sP+vg0cwwmLdFHBg34Y1U0Uc6Kr/QTmw2DI+sJlxUnQkjSnKppNN+VfX2R/nw==@nongnu.org
X-Gm-Message-State: AOJu0YzGCEyzbZWzZWAwk3yd/c0qgkBFhqbnPpUkv3cStrWCpmWgFd4R
 dwW9JL+mNR9hQzzfTmaDtcPc8D4oWnq9J1CX1nmL9r0jV4I26wFMaEoOLDE94ob2MFc=
X-Gm-Gg: ASbGncvfbRXOxJi3zkwa4ZHVbO0L7PpV4wgMQCdZgjw2zMzqiCvLOKEXbO5tigJqeY+
 iOOg8A9TBoj1x6cvROaKoR3scNMfYZZYjtSwbX/0QAce6f6fYskovp+ETcw6Es4g3aH9maZOprl
 +/vWOho/YvS1ryFHSvbG6cpxdZtd24b5diomsLaEtNVxp29bgMBfAUknfgt5NdzCW8/JJRVrDwb
 f8USDG0uegJ1sH1DsPb4C4v6iPnhwq1XNlQXZDMmw9FBd3P4lYZsn/Ag0WNCoaBbV6BZHRCG4Th
 pymnQi8EMAYwSv1XRo3PXab6tb0CqEI2rycennoTutZs/qhn51002fqoscnSrlQeCMvrsgDuvOK
 5j9BIChU8WiQ933gpFcU2yQIvcUWuRLlfhWAl1sFIzbclsKAAfNnSlr/5KoEjhcSwNf0TeJS3
X-Google-Smtp-Source: AGHT+IHPTmHkavFC+K5s8PwOvKTcOVKKhO5KK61SSe717xI5XE6+6bqKMDlEYX45tOpOpFlK5TCB5A==
X-Received: by 2002:a05:6000:2283:b0:3c8:e9d3:c392 with SMTP id
 ffacd0b85a97d-3d1de3bc74dmr10668789f8f.19.1756902008603; 
 Wed, 03 Sep 2025 05:20:08 -0700 (PDT)
Received: from [10.223.47.213] (103.163.185.81.rev.sfr.net. [81.185.163.103])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3cf276d5816sm23255601f8f.25.2025.09.03.05.20.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Sep 2025 05:20:07 -0700 (PDT)
Message-ID: <b65e2f61-97ac-4482-bf16-75bf107cf4c6@linaro.org>
Date: Wed, 3 Sep 2025 14:20:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 15/24] target/arm/hvf: switch
 hvf_arm_get_host_cpu_features to not create a vCPU
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: Alexander Graf <agraf@csgraf.de>, qemu-arm@nongnu.org,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Peter Maydell <peter.maydell@linaro.org>, Mads Ynddal <mads@ynddal.dk>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <rbolshakov@ddn.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20250903100702.16726-1-philmd@linaro.org>
 <20250903100702.16726-16-philmd@linaro.org>
 <30d20299-1797-4e49-8dba-5ce3ed00162e@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <30d20299-1797-4e49-8dba-5ce3ed00162e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
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

On 3/9/25 14:03, Richard Henderson wrote:
> On 9/3/25 12:06, Philippe Mathieu-Daudé wrote:
>> diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
>> index 3039c0987dc..fd209d23c1e 100644
>> --- a/target/arm/hvf/hvf.c
>> +++ b/target/arm/hvf/hvf.c
>> @@ -869,24 +869,25 @@ static bool 
>> hvf_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
>>   {
>>       ARMISARegisters host_isar = {};
>>       const struct isar_regs {
>> -        int reg;
>> +        hv_feature_reg_t reg;
>>           uint64_t *val;
>>       } regs[] = {
>> -        { HV_SYS_REG_ID_AA64PFR0_EL1, 
>> &host_isar.idregs[ID_AA64PFR0_EL1_IDX] },
> 
> Versus the original, I suggested that this should be
> 
>      { HV_SYS_REG_ID_AA64PFR0_EL1, ID_AA64PFR0_EL1_IDX },
> 
> etc, so that the data structure could be static const.

Sorry I missed the comment. Good idea!

