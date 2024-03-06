Received: by 2002:a17:906:3588:b0:a45:b507:d90a with SMTP id o8csp280277ejb;
        Tue, 5 Mar 2024 20:22:23 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVO55MiPdWghOlmZAL4lAUzn2Avv5PLfk4rEf8nXkeKrSDF6OK3uUMS9UsIsHSBkNihuwzP/lJZnCpQ5aWVrNItqMAtPQEO
X-Google-Smtp-Source: AGHT+IHgk0iLzee2WW0K8h7hkVBFLEb7rVxOHIcbQWXo/RiL1yMgfe0/y1UkIDLDyh0XHkKFKCM1
X-Received: by 2002:a0c:c20a:0:b0:690:7123:6590 with SMTP id l10-20020a0cc20a000000b0069071236590mr4018361qvh.33.1709698943736;
        Tue, 05 Mar 2024 20:22:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709698943; cv=none;
        d=google.com; s=arc-20160816;
        b=rUdtY/ssEvyXACQgALfMzwv2SfG0GxflDQoxUgTeQPYmghBDfgqbbCk6xiKpS3XmxR
         dWC3eosWP4gAvYIi2jgLpF9SBF7BJQO6BFbkBsxX34RJVO5DxKuMEo2zn54sUeZvcbbU
         w2Oo15Zo8xqMbE8R16YyPUJv6DQ8LUXywDv78HayjoS22ghHzIEis0sSggEMHGlipG0k
         wTnRofXq2uVKwJCGVlxWgyBCGVVzBgYnSvcrJuhVNMmbKiYpS1gNLDem0jWpC+LC2BQD
         6Lp9BsYzdtd/6K9H8ZnIYt0lQ5GaakvXJYXmdJRlXGZFNUh2H971S5Gy9+J7UEyYZC2/
         tdjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=t3WFj/NxX7PbGY8RQmPQs/URWPmD9tQBuwxIK9h/vSs=;
        fh=xa9SXJVabKgp9wmwh+EBwBo82J25entFq2Vf7VyS6M0=;
        b=ufKA15lzojIJVBAydnHVD8S5U4GOiXvVXVy2+6HslhZ5mXCWsxZm3IjnwBNAKIBv0i
         B7Z2gz9eTpidp7dehBHXOc0lM0l+d93DabVAEqZYv0OILbNaAbVvRYZnXcF3zdACZWCw
         lgF53AkV5jH9vTUYX0LtxYMeGf+oZXO0kBra2eQTYA3dmRtOQeXm27DLNkGbk4Oc/KA0
         +QJsebyBFXKPKihjO2B0nKU9g3A1CZEFv14KOryPxiy1ZHWIUd3XGbMMfz4vflBwU7yf
         0wbv0Tr9WODsrstg8ARrco42TU4Mr1EbUyVFS1Yv4bOczT/1UTSfv3IpQrNKm6tfOOsA
         hcUA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=g5kPZkYL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jl11-20020ad45e8b000000b0068d0e9eb1c4si13656567qvb.534.2024.03.05.20.22.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Mar 2024 20:22:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=g5kPZkYL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rhinH-0003pn-D8; Tue, 05 Mar 2024 23:22:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rhinG-0003pW-AH
 for qemu-arm@nongnu.org; Tue, 05 Mar 2024 23:22:14 -0500
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rhinE-0007hW-Eu
 for qemu-arm@nongnu.org; Tue, 05 Mar 2024 23:22:14 -0500
Received: by mail-oi1-x22d.google.com with SMTP id
 5614622812f47-3c219604f51so326277b6e.1
 for <qemu-arm@nongnu.org>; Tue, 05 Mar 2024 20:22:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709698931; x=1710303731; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=t3WFj/NxX7PbGY8RQmPQs/URWPmD9tQBuwxIK9h/vSs=;
 b=g5kPZkYLhO/++dGfXTLdkgIkTpJ2VgO+QromU0uwD1y0hD6o0G8irGaVHuelY7+qrQ
 hZaSDJwL/FLlXhiiwQ7ZTa2SDBEVfn3REF7wKVg/ZolJTIPvzIrErNv9uFD3k3Ly2RLp
 /2orOaBw9/S2XC0f0X3mV5xK8q3Qa7Un1bd7c6z5pYmOu5od04RrW21snBNUH9ydMmIf
 cewm4ATBdc4+6dBnHf7mTqeIStSG9049wX0fPctiH8/wCWPNd2uuu4gxR0lEmzjJSF4p
 t4qa0bUIpM8VNlk/oLS5AG4diY7wINW0bvy4cmoiVl4Ne3SYSDoD7p1IKbRiTiCNr0/N
 sYFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709698931; x=1710303731;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=t3WFj/NxX7PbGY8RQmPQs/URWPmD9tQBuwxIK9h/vSs=;
 b=klYPz40DE0JM2LLFo7iYHuqW9UIUpDziCrTBmUbrr7ikpXKreL9thik5bMeX0cluvr
 rKv5ygDoTjR7KMEewhXcqN054BMFg+loC2a/h0L2m/YwgThm/VYmdhiKlexFGmEB98Qy
 UMAofavkuOP1xfNOpHWa6pb4JhBQyv0pfd0eWTA2B/B4BI6+No7EEpK/5lox2P0QFc3n
 LXOkjgiSbqVJKi5wWmyc6k4fFvq1qfs22U7H+901E3ZVx8xl+Qptnf8gmaeacjVWxcfv
 vFjYb4JHVpKmzipPNuvU2Ik3o2Da8WYUF7djEY/heKpcMbMtALt+HG1JCIsj9TKpKxJy
 7qfA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWMMxHmCfUmJ/b7IvisAbA1hXzv0D/lqAoD0UYUERd+JDwABddWolsMw6DpqwtXlHmM09C16DV1SUDsz8hR6S4qJ39N
X-Gm-Message-State: AOJu0Yw2W4fpQFi5AmXA7Ehm0kTM4yyBE79peam29b2x5MwICB2ObwMx
 XQraFgcjwojHwXDY3/6E3ugtmva3Z7GponOigHJNzNPoxXpHn0NIZsTfQbnnsmw=
X-Received: by 2002:a05:6808:2092:b0:3c1:ef08:6976 with SMTP id
 s18-20020a056808209200b003c1ef086976mr4436176oiw.10.1709698931247; 
 Tue, 05 Mar 2024 20:22:11 -0800 (PST)
Received: from [192.168.6.128] (098-147-055-211.res.spectrum.com.
 [98.147.55.211]) by smtp.gmail.com with ESMTPSA id
 o189-20020a62cdc6000000b006e5597994c8sm10198339pfg.5.2024.03.05.20.22.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Mar 2024 20:22:10 -0800 (PST)
Message-ID: <fd515ea4-ca4b-4d54-9d9b-59683ccd683e@linaro.org>
Date: Tue, 5 Mar 2024 18:22:06 -1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v7 00/23] target/arm: Implement FEAT_NMI and
 FEAT_GICv3_NMI
Content-Language: en-US
To: Jinjie Ruan <ruanjinjie@huawei.com>, peter.maydell@linaro.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 wangyanan55@huawei.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20240306035721.2333531-1-ruanjinjie@huawei.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240306035721.2333531-1-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22d;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22d.google.com
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
X-TUID: Iuyv76zjS4VL

On 3/5/24 17:56, Jinjie Ruan via wrote:
> This patch set implements FEAT_NMI and FEAT_GICv3_NMI for armv8. These
> introduce support for a new category of interrupts in the architecture
> which we can use to provide NMI like functionality.
> 
> There are two modes for using this FEAT_NMI. When PSTATE.ALLINT or
> PSTATE.SP & SCTLR_ELx.SCTLR_SPINTMASK is set, any entry to ELx causes all
> interrupts including those with superpriority to be masked on entry to ELn
> until the mask is explicitly removed by software or hardware. PSTATE.ALLINT
> can be managed by software using the new register control ALLINT.ALLINT.
> Independent controls are provided for this feature at each EL, usage at EL1
> should not disrupt EL2 or EL3.
> 
> I have tested it with the following linux patches which try to support
> FEAT_NMI in linux kernel:
> 
> 	https://lore.kernel.org/linux-arm-kernel/Y4sH5qX5bK9xfEBp@lpieralisi/T/#mb4ba4a2c045bf72c10c2202c1dd1b82d3240dc88
> 
> In the test, SGI, PPI and SPI interrupts can all be set to have super priority
> to be converted to a hardware NMI interrupt. The SGI is tested with kernel
> IPI as NMI framework, softlockup, hardlockup and kgdb test cases, and the PPI
> interrupt is tested with "perf top" command with hardware NMI enabled, and
> the SPI interrupt is tested with a custom test module, in which NMI interrupts
> can be received and sent normally.

As far as I can see, this patch set is good to go.  I'm fairly confident of the CPU side 
of the equation, but the GIC could use a second set of eyes.


r~
