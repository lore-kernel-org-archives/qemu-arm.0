Received: by 2002:a17:907:10c8:b0:98d:b2f5:1316 with SMTP id rv8csp543835ejb;
        Wed, 2 Aug 2023 11:15:35 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGnCOFMlzDoTB0wLYp1v/lrq0KxyWjKvcS3YJPVtYcGQ7WDW5r4Fg1ij4UH1wXpEBbwjLR8
X-Received: by 2002:adf:ed08:0:b0:314:3611:3e54 with SMTP id a8-20020adfed08000000b0031436113e54mr6276045wro.9.1691000135734;
        Wed, 02 Aug 2023 11:15:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691000135; cv=none;
        d=google.com; s=arc-20160816;
        b=d0CsCrU0BJ7f35dPuDIJ1Rr7T6n972vJsZEG74ZyGczj2FNlqTtNv7eckr9MEXNejI
         fnDaVFaGHHxX442mwtL7Hr2fi57ncQjgqyth9ODI2VJfg/pGyTXA8QbQA25ZjOUAJuVv
         VVtC74MeWoeIGOB3w8xyNux7lMrpN/s0iXqu5BH65hLjkaFgc6twZy7KJchEOqlkupVb
         vD6e7F67haSSxnrrwmQozMSERQHERRvthS8y+SUBk8K5WfDrwhxH32LX5MmQRDh/PXNh
         X4e89FQ8/YkfXVVGnxaePq9CkzWBg4TS+gqWvU2aHMXWcEzvgNHVfrvXNpiDGvg4LkXW
         5R3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=3wOR0kQWOcIzlKyOpLj9KPr1CfNwBQ3Dgeld4x3FsTs=;
        fh=RelA4w5CC32CEJ0z5Jhvf7/yVwHiO7RQQqXlJjLB5D8=;
        b=BHIA3WjuLXbXHu1JwHzBmLYtqP6IBpqE1FNRgvDN6RgU8Ia32IPV64ER1pTkM2WXGy
         PQ2v4OASVa7Ej8YYpoL4YAnSxVA9A1/6mYTT0z7pwGwM3Dcp/lRiQVf/lZZ81IJpW3gC
         ZkfT1oLJSYAC6kbwpfQfOWKhZgS3X7LnCw2F3OvOAdeZLx8rqrqxdEiV5b6rEEum/hzD
         pq910kAByVnHkmkAl1HtqvFg3QKxHohxCZWixFiE709NhSyYOKvBPdg2hmMB4m8fTNZs
         OexHlpv6etNX9b8Mm2nnA6J/z5GKD08A0y4Jo6S6eKx0jb5pUsrNNnoAp1f2kQ6JErb1
         i2oA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=boMO9HO2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k3-20020a056000004300b00317bdce7de4si423608wrx.934.2023.08.02.11.15.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Aug 2023 11:15:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=boMO9HO2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qRGNX-0002cw-I4; Wed, 02 Aug 2023 14:15:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qRGNU-0002cF-Dm
 for qemu-arm@nongnu.org; Wed, 02 Aug 2023 14:15:20 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qRGNS-00028a-RB
 for qemu-arm@nongnu.org; Wed, 02 Aug 2023 14:15:20 -0400
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-1bba48b0bd2so1108805ad.3
 for <qemu-arm@nongnu.org>; Wed, 02 Aug 2023 11:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691000116; x=1691604916;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3wOR0kQWOcIzlKyOpLj9KPr1CfNwBQ3Dgeld4x3FsTs=;
 b=boMO9HO2gilTBhniKMQjkj5snZIWQI+5o3am7qjbuRRQkuyPKCn9KqD+XC1qQqtm3P
 GBEr9jwfZFa8WNMrAeFUT5q9jnI4rF7xY5LdDJhwykw/SwPzRRhW4GXXX3O1Io7+7xKN
 WA9yAHw7SOaCsDjNx56v9rOAyhowwWxm5+SK7VAlqGWB1XrdWDL2hTaarFErJjbNWq0D
 rTvE/Bqlv0/jObj58XaCg1MXyFvXX4LEwIQb9HBcwLZYBbV2dfxQv1YOonPQccSoZeFs
 cTJDgkOvyMwRr13LMHKbxbok9XSS7e0GQOp+96dO2fxnJ02GPUfjPt3kkefeguvUeFHT
 ANtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691000116; x=1691604916;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3wOR0kQWOcIzlKyOpLj9KPr1CfNwBQ3Dgeld4x3FsTs=;
 b=ZaLwDigNu6ERNZyaA8TL9y7owwu0/LqkI8SrYPlQ4LGFMvUeFigUPim/703tQHbyYq
 jDJE/xS0SgPyJ4TJIPsAmRSFaOHtFKJ1wQvehVHo8Ar5ahvPU1gmaXPCmRRzSgc1ntqO
 EdqzRzFpJNEy4jBQV1MLhob5U4c8VPkbMZEuZS0Qjm5MXgMQNi8TNYnYJkVwHGHcu2A7
 E5tCgRrsiOTS5WykKRO80YCK7BtYvEDLOsbDHU7P+JDAgmbWYXkhquaDOLttSBFTBMSZ
 pe3VQ4AAEvCJ/YfcOlcAYIf6UwM71O1ix6Zf1ChhIoAH69oo+epE4hUo9ewMqfAzoSgQ
 oPaA==
X-Gm-Message-State: ABy/qLY0WpM5CO4YimBb0x++jiQI3aRpZHoFt8/qn1820LpgD+MKTqbw
 FyDkshU94GWvAaMg2pue2v5SCQ==
X-Received: by 2002:a17:903:32ce:b0:1b6:79e3:636d with SMTP id
 i14-20020a17090332ce00b001b679e3636dmr19458885plr.58.1691000116511; 
 Wed, 02 Aug 2023 11:15:16 -0700 (PDT)
Received: from ?IPV6:2602:47:d490:6901:b659:bbad:1a22:7ef9?
 ([2602:47:d490:6901:b659:bbad:1a22:7ef9])
 by smtp.gmail.com with ESMTPSA id
 y23-20020a17090264d700b001a6d4ea7301sm12896145pli.251.2023.08.02.11.15.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Aug 2023 11:15:16 -0700 (PDT)
Message-ID: <52cb992d-90b5-e28c-8184-6f3637f2459e@linaro.org>
Date: Wed, 2 Aug 2023 11:15:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 2/3] linux-user: Emulate /proc/cpuinfo on aarch64 and
 arm
Content-Language: en-US
To: Helge Deller <deller@gmx.de>, qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20230801230842.414421-1-deller@gmx.de>
 <20230801230842.414421-3-deller@gmx.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230801230842.414421-3-deller@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.102,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: htYrl/qY61JC

On 8/1/23 16:08, Helge Deller wrote:
> +#if defined(TARGET_AARCH64) || defined(TARGET_ARM)
> +static int open_cpuinfo(CPUArchState *cpu_env, int fd)
> +{
> +    const int is64 = TARGET_ABI_BITS == 64;
> +    ARMCPU *cpu = ARM_CPU(thread_cpu);
> +    uint64_t midr = cpu->midr;
> +    const int rev  = (midr & 0xf);
> +    const int arch = is64 ? 8 : 7;

The 32-bit arch is not automatically v7: -cpu max is v8 and -cpu ti925t is v4.

You need an if ladder for this:

     if (arm_feature(&cpu->env, ARM_FEATURE_V8)) {
         arch = 8;
     } else if (arm_feature(&cpu->env, ARM_FEATURE_V7)) {
         arch = 7;
     } else if (arm_feature(&cpu->env, ARM_FEATURE_V6)) {
         arch = 6;
     } else if (arm_feature(&cpu->env, ARM_FEATURE_V5)) {
         arch = 5;
     } else {
         arch = 4;
     }

Also,

     ref = FIELD_EX64(cpu->midr, MIDR_EL1, REVISION);

etc, instead of masking by hand.

> +        dprintf(fd, "model name\t: ARMv%d Processor rev %d (%s%c)\n",
> +            arch, rev, is64 ? "v8" : "armv7",

Will need adjustment.

> +#if TARGET_BIG_ENDIAN
> +            'b'
> +#else
> +            'l'
> +#endif

Don't need an ifdef: (TARGET_BIG_ENDIAN ? 'b' : 'l').

> +        dprintf(fd, "CPU implementer\t: %#02x\n", (int)(midr >> 24) & 0xff);
> +        dprintf(fd, "CPU architecture: %d\n",     arch);
> +        dprintf(fd, "CPU variant\t: %#x\n",       (int)(midr >> 20) & 0xf );
> +        dprintf(fd, "CPU part\t: %#03x\n",        (int)(midr >> 4) & 0xfff);
> +        dprintf(fd, "CPU revision\t: %d\n\n",     rev);
> +    }

FIELD_EX64(midr, MIDR_EL1, ...)

Though I have some memory of these fields changing across arch versions.
You might need to extract them earlier, within the if ladder.


r~
