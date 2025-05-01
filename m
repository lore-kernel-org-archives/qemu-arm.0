Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp428097njj;
        Thu, 1 May 2025 12:39:43 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVXZHTlnF2imztV0c77FPXyhzvAovrBC+lU0h5Cj6og5+zwFmzxf0kEVsfnErvQQfUVUv+NDu7z1Xi+bQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGZHuBldF0ZnnfyplNjRRV96IO2OUjOaLdRtU+BZ1TWbg/qDSqUxDU3eyUfx9wyizyqZkLE
X-Received: by 2002:a05:6214:d46:b0:6d8:a1fe:7293 with SMTP id 6a1803df08f44-6f5155ec996mr8495396d6.42.1746128382959;
        Thu, 01 May 2025 12:39:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746128382; cv=none;
        d=google.com; s=arc-20240605;
        b=lD1V+TO9d97YXIrYv25nXl0hpjUKOhnfgdA2QrlGFNVegsqqYYjeU1SaWcqbJAgZi+
         uWHN8mKufhzEO2Oq7oQxFGIh/hZpieZSlly4yC0zosdRSUrqixkQhUMiizTmXwQ5XIae
         yGVMkaRFpZnDMnLb1H5FgZSe3Cw6sRtl75t3PIj4c4KOvTs6Ag9vRarLkvLsQAVYV6Ca
         hSDWPs0Si8dJvmA5TnW0I/XTZMrwUuz9Te+ADyGzJ7KGnkXfi6R51P+PQv9oQM+DKWMA
         wCJ+A6qjFgllm58QVnRL0+djM6o/0bFIQL5cWRp0GgzPicfsMh/uC27wvTzXhJ/7VmMs
         9Suw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=nlq6iTf63SDAgmQyoUr4eQXZVo5JWhey+WvZC0D4jEM=;
        fh=0J0cvZyBpGInUz4uoPM4svLYNamqAdTbLQXRpkA3ZAo=;
        b=WkOj5u5RhYmrzzjV3WS1h11L0HWbeBoUTWQFXZ6qDhyhtfcHtN10O9kcftq7F5jWcu
         Grge0pantGdu/xYzdkWPLApecKoHCHhAAtlHcgQDeib7Uk9ct7ICNRf2YMKe+l6N3Q79
         oHFtqqvMlCSuJarBr6PST6vITrSEzJdQ5D6L4PoudYoVNMXNX8yMw4wLPGcl3w7Qid64
         PLGHHZkMJ9FVugagzOzHW/BHBXH+Q32/+67ckbBX3EdGUveAGn5cx+9yPAToDZyFNb8e
         opH6a0/wvjdMo/V+wewfXK0RX2FTISJ8/BeAy7EDuVH3+spGyK44L/cyvuuQfcbCgcv4
         Bxtw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vQRT8NC0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f50f477938si13759516d6.231.2025.05.01.12.39.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 01 May 2025 12:39:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vQRT8NC0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uAZks-0008RT-KS; Thu, 01 May 2025 15:39:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uAZkm-0008QZ-8o
 for qemu-arm@nongnu.org; Thu, 01 May 2025 15:39:29 -0400
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uAZkk-00021s-Bs
 for qemu-arm@nongnu.org; Thu, 01 May 2025 15:39:27 -0400
Received: by mail-io1-xd2c.google.com with SMTP id
 ca18e2360f4ac-85b3f92c8dfso43893939f.2
 for <qemu-arm@nongnu.org>; Thu, 01 May 2025 12:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746128365; x=1746733165; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nlq6iTf63SDAgmQyoUr4eQXZVo5JWhey+WvZC0D4jEM=;
 b=vQRT8NC0agTxaA3R7mUtOsAlmvUmX3jLlNXVWteSH9NWRwUTxQAO7mSTYV+uGraeOm
 YUApoOtcYD8A/9HIfBrDkYdmCICl2x9wXYzqJ6kXI93l47oR2uXkWEeINVDJAn9uSuTv
 BwVJUC9uIUfTCPUrehkMWtK/g17nVDRDBqbaRoJa8MbZmoYqtJfvkWZ+f0XXv10+RGHt
 X5kLSL+exRd4WPH1UyWexfwt4sSOudIkxEUagSueyKPaSyGBoAjdAia86j0/eSeKaY7F
 qAK1e0J3iUn4snIUv+AmvPRJyVCwu2JnIhjhQcod/nwmBE/ED/vGgkCOsTwpt90QEhEq
 lbtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746128365; x=1746733165;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nlq6iTf63SDAgmQyoUr4eQXZVo5JWhey+WvZC0D4jEM=;
 b=Th/hvVcCKzkH2t1PFBWFR5XhL4Gks16j0IxThmMTg7BuS9GKbx7WWi2EU+L7TIM4dO
 JekDBc+TMJDebFnm0ujUtM6Fkc8jpLMoi8mGAwj42wcFdZiCMB3UyJYKVZ57KSffb4/L
 w5aIFULbXdv7CJHNGWMt0WMFwMbWawagxJ4MNPm9JjyELpluNVblNxXTlx6JQ4UidrYH
 Bv8KjeSK2c0eKGYFy+kwXnaIPpJs3NsVUHvw6663yiPEWC8KaVWqnEg9tgf0kkx2BTFX
 kpcrEMIeksHiMSyP16c4EXno2mCUo4qlSJCH4FG9qZevRTgcA4uKUuPmt6ho+XQN1qYJ
 dwMQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXynqXYhkmZnufBuq5+Xt9T+I1/4vS/Ac5SmmsZjmjuBV0uTgjrU+Rem+CAAF0aEetQ+d1VAfI1Bg==@nongnu.org
X-Gm-Message-State: AOJu0YymAfll5083PLXVoSey66/Ss2+8wYm2636w0WWNe6RygFEfMOKo
 nxwQJW/k3xbpMVZ3KmPW+wVAS03ynQXDJzamoDCLXZk3JSsvqa0quCcPrMPTwVT1qD2kgUYOW6l
 t
X-Gm-Gg: ASbGncsmRNbMpezDU8dyrcgoLbQ29Xlefe8lzKnGZ24TpKpbAffxSeIOg3n+4HNwPWb
 uy39+xzRSQ7MFiKGiUHefvtFawEUCdbRGI1o5+ScctPyiBcIJUtZ55wm3q/zwFfTdELYPrWWUke
 n9QyQJGh/97QHCjVQnj5daaR+mAbn6oUlWVtLQJE7MKEI8a7Felw26IqCeSPt6wcqBIJ6lL4tIl
 gWkcsIFAdBhHJOzDJmaIdNHIAD0lnIdklh4+pWrEjLkmRS2lS3vpgnxgstZ0XsTXG4tT9VUG49d
 XoQaqumcl53xaA4lGOyQdIk7AV2y6qQ8K98F4tU4H71lEO4qqrXXTgp12sKrTxn9O7msl/XMMZU
 ZH+OtrQSRrzZq0g==
X-Received: by 2002:a05:6e02:1a8f:b0:3d8:1a87:89ce with SMTP id
 e9e14a558f8ab-3d97c147d40mr2231665ab.3.1746128364823; 
 Thu, 01 May 2025 12:39:24 -0700 (PDT)
Received: from [192.168.69.244] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4f88a8cde80sm16481173.5.2025.05.01.12.39.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 May 2025 12:39:24 -0700 (PDT)
Message-ID: <48fcb7b5-0f6c-4efd-b77e-ec86b5adc0cb@linaro.org>
Date: Thu, 1 May 2025 21:39:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/7] hw/core/cpu-common: Don't init gdbstub until
 cpu_exec_realizefn()
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: "Edgar E . Iglesias" <edgar.iglesias@gmail.com>
References: <20250429132200.605611-1-peter.maydell@linaro.org>
 <20250429132200.605611-4-peter.maydell@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250429132200.605611-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2c;
 envelope-from=philmd@linaro.org; helo=mail-io1-xd2c.google.com
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
X-TUID: XU9JHzA4Jf4z

On 29/4/25 15:21, Peter Maydell wrote:
> Currently we call gdb_init_cpu() in cpu_common_initfn(), which is
> very early in the CPU object's init->realize creation sequence.  In
> particular this happens before the architecture-specific subclass's
> init fn has even run.  This means that gdb_init_cpu() can only do
> things that depend strictly on the class, not on the object, because
> the CPUState* that it is passed is currently half-initialized.
> 
> In commit a1f728ecc90cf6c6 we accidentally broke this rule, by adding
> a call to the gdb_get_core_xml_file method which takes the CPUState.

Oops sorry I missed that.

> At the moment we get away with this because the only implementation
> doesn't actually look at the pointer it is passed.  However the whole
> reason we created that method was so that we could make the "which
> XML file?" decision based on a property of the CPU object, and we
> currently can't change the Arm implementation of the method to do
> what we want without causing wrong behaviour or a crash.
> 
> The ordering restrictions here are:
>   * we must call gdb_init_cpu before:
>     - any call to gdb_register_coprocessor()
>     - any use of the gdb_num_regs field (this is only used
>       in code that's about to call gdb_register_coprocessor()
>       and wants to know the first register number of the
>       set of registers it's about to add)
>   * we must call gdb_init_cpu after CPU properties have been
>     set, which is to say somewhere in realize
> 
> The function cpu_exec_realizefn() meets both of these requirements,
> as it is called by the architecture-specific CPU realize function
> early in realize, before any calls ot gdb_register_coprocessor().
> Move the gdb_init_cpu() call to there.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/core/cpu-common.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

