Received: by 2002:a17:906:c945:b0:a38:6d10:c5dd with SMTP id fw5csp268941ejb;
        Thu, 8 Feb 2024 09:46:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFarV2FPrtVQmlt2ckQXpEexeO5qKFhWdSIlny5w6DdV+lJuhAZMrltmZ+pNNNbTr3XNcV+
X-Received: by 2002:a05:6214:518c:b0:68c:86b4:bc67 with SMTP id kl12-20020a056214518c00b0068c86b4bc67mr10898591qvb.7.1707414384254;
        Thu, 08 Feb 2024 09:46:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707414384; cv=none;
        d=google.com; s=arc-20160816;
        b=Vg4a0Xllo2+QDrqMiwDgHKCcPMCu1jQfwko8omJ0D7/8LO6DaOH1r38quiu9rUvrPY
         JDYlxIPNZ0m1fum5e/j9yNQ1W9HKUp7Omq1JMySVkanpflVqvkUfGaGCscWrgkhtJD0M
         1Ggy8b7GsLaafNiGYyw6XreDSnWkn9GncwXMDmUCzBdNi1mctktu1kwJOu16Tbw6oXvO
         N6pwY3sO5MFWwOlR7LC7MTXVezCYRiO0fpzEbznbl4utGkDr6TshazUAh1Vi7LtDL79S
         D8xHeqh9rp19SH76ZiegUo7xQDgAvfdDSeeYqRhYh4EUb8gZ1KWPMRhaIaau+9ii0OPy
         9gsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=QZNCdbIwMf2GQUxuMLl7ZcruXaQTeuHyf7IcBEF+7pc=;
        fh=UxBoHkMqLsiFM6i4Pw/TUW27E85kuVphq8Q005aooQs=;
        b=wahpKf7pZlvd+iuwNVRs/W7R7mdGZAai4QJYZg4xuSI7FFCpn1EKckErUGoX2zBy7d
         sMFBOgH1F8vU56jTruwG2KmXGxRhjZiI+wO2P1IxzGClWEaPs0/WWQRRwnq5c8y2Hq8q
         Ar2mqSrWNhN83JsXhG+19+hkgsx15yd+BRVFmpclJiZsV6nbMU68h7BYroa+ETMkUOEF
         dghljL7b/z+fFM0VHLBXcJ2fGDhx5HNNzimV9D6HcoURUOsrpc2TU6md6QOxrkolCsIg
         Ccnyter/6z+nsA3GVyaj76N5IUuWESEDROEGOwHkK2hkqULplZp5wCZbdPvnyfHC0xfi
         RD3Q==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=I6zpYlf7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
X-Forwarded-Encrypted: i=1; AJvYcCUG57WRnKpVBDUU9A1zuz82neBgmHkiYfgbCIHL9q+i79c+IIBd6vI+j1kRj4rD8pkUwoQQ+7NhexttgbSa1iU8puSiVmtO
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id kl21-20020a056214519500b0068c83d17f3csi8229qvb.305.2024.02.08.09.46.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Feb 2024 09:46:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=I6zpYlf7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rY8TO-0003ys-Jy; Thu, 08 Feb 2024 12:46:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rY8TM-0003xe-0B
 for qemu-arm@nongnu.org; Thu, 08 Feb 2024 12:46:04 -0500
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rY8TI-0001Hf-SA
 for qemu-arm@nongnu.org; Thu, 08 Feb 2024 12:46:02 -0500
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a3122b70439so4067766b.3
 for <qemu-arm@nongnu.org>; Thu, 08 Feb 2024 09:46:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707414359; x=1708019159; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QZNCdbIwMf2GQUxuMLl7ZcruXaQTeuHyf7IcBEF+7pc=;
 b=I6zpYlf7XCPRlD7ZqCoeV0bvJ06otuPgDDkwxO3tf9K7ILH1jE//jlh2LglSX/DaMo
 aP1unO1kvr4aawliFMBTmsfEl3ci7aUC1Q0cp+Eisc8Z84OTSCt6/mUcPIn4WrY/wR8h
 0r6hh4F2OMhF2oAapMq5dPduH1OjbXE6QjQz+Je7bGrtsghWcA9qFj4m84QKlK+SOAI8
 /PkWo5EGahC8SZeU/rIxTxjhd7vpSN3qkAEIxK8qBOCpoGwa/THuxjmWOh69MQbvT0Mg
 RHJPLKqWf27sZPfZt3nciD/k2jUhF2heZqh0CshEqQiIuPgeS4Cxs5RjsvTpNfKi34oT
 +asg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707414359; x=1708019159;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QZNCdbIwMf2GQUxuMLl7ZcruXaQTeuHyf7IcBEF+7pc=;
 b=ZuuI/Z8yqIH7cPU+StGxQUPiG5OGEEbnaIESSCHCHN8kUSE1mVsb8G5sZ051A9zN/S
 dEGjfri/fZveFTtPRJ64ypEkOI7JgPRLPjLnQ6+3ytAFyt+4x/7vMqES0jt8C6k+5MTS
 CqN7DRQcLHSL65VZIUXSdpnW+L85TGGDGcVEITXHCXKopgFeKDhq5FaKIWEBqt1Vtnyr
 VVouOZUU2PP3G3gpK9nketKECcrk5sQf1CJ1ort6fI3MA5oCOcFMO/kVxoSBlLpdLts/
 gCQRKiz0o9Kh14j5EBbwwta0ebtJFwNy5D9JaLfpCC6u+sMYr7Pag/ZDNcPJ+15pXMla
 GtNA==
X-Gm-Message-State: AOJu0YwaeZAqMpGp9gvTG+HniTfKMXFnXyurarvTA7h/X6mMoFVGf6HI
 gVONWcCFo0+YJjfz7iuc71Zp2FntgAfULF6yliPiL/jXSOVM4tCgDYYHpHXl71U=
X-Received: by 2002:a17:906:af0f:b0:a35:103e:3614 with SMTP id
 lx15-20020a170906af0f00b00a35103e3614mr28029ejb.52.1707414358867; 
 Thu, 08 Feb 2024 09:45:58 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCV7ZBdlC1RCM4s9MqLSKQLQp1ufv/PsuUn2o6NRFjkeX8S/M8uPNV42n7uv24ftq6u7QV/qpOgQLAGJTq35UieECkQf9BnJeTc23zLRWgEXoQ1uYs2lqJDZG0U=
Received: from [192.168.69.100] ([176.187.218.105])
 by smtp.gmail.com with ESMTPSA id
 g17-20020a1709067c5100b00a38c2d4eedbsm270504ejp.110.2024.02.08.09.45.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Feb 2024 09:45:58 -0800 (PST)
Message-ID: <648db436-1adb-41ae-9a8e-8f94dbbe4350@linaro.org>
Date: Thu, 8 Feb 2024 18:45:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/arm: Don't get MDCR_EL2 in pmu_counter_enabled()
 before checking ARM_FEATURE_PMU
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org
References: <20240208153346.970021-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240208153346.970021-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x629.google.com
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
X-TUID: 5a4mY9lDwWNi

On 8/2/24 16:33, Peter Maydell wrote:
> It doesn't make sense to read the value of MDCR_EL2 on a non-A-profile
> CPU, and in fact if you try to do it we will assert:
> 
> #6  0x00007ffff4b95e96 in __GI___assert_fail
>      (assertion=0x5555565a8c70 "!arm_feature(env, ARM_FEATURE_M)", file=0x5555565a6e5c "../../target/arm/helper.c", line=12600, function=0x5555565a9560 <__PRETTY_FUNCTION__.0> "arm_security_space_below_el3") at ./assert/assert.c:101
> #7  0x0000555555ebf412 in arm_security_space_below_el3 (env=0x555557bc8190) at ../../target/arm/helper.c:12600
> #8  0x0000555555ea6f89 in arm_is_el2_enabled (env=0x555557bc8190) at ../../target/arm/cpu.h:2595
> #9  0x0000555555ea942f in arm_mdcr_el2_eff (env=0x555557bc8190) at ../../target/arm/internals.h:1512
> 
> We might call pmu_counter_enabled() on an M-profile CPU (for example
> from the migration pre/post hooks in machine.c); this should always
> return false because these CPUs don't set ARM_FEATURE_PMU.
> 
> Avoid the assertion by not calling arm_mdcr_el2_eff() before we
> have done the early return for "PMU not present".
> 
> This fixes an assertion failure if you try to do a loadvm or
> savevm for an M-profile board.
> 
> Cc: qemu-stable@nongnu.org
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2155
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/arm/helper.c | 12 ++++++++++--
>   1 file changed, 10 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

