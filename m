Received: by 2002:ac2:5ccb:0:0:0:0:0 with SMTP id f11csp1916925lfq;
        Mon, 11 Apr 2022 14:26:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwgocgZeV8TlQmV2WtEOQHGQoUTViMj/fmoYQh082zNkaRENbHw5Mgr54SVqRgMHZXtcoak
X-Received: by 2002:a81:16cb:0:b0:2eb:f4c2:fadd with SMTP id 194-20020a8116cb000000b002ebf4c2faddmr11658994yww.475.1649712370081;
        Mon, 11 Apr 2022 14:26:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649712370; cv=none;
        d=google.com; s=arc-20160816;
        b=mknaI72zv4QCheiB6ioptqSjuyDKXuFO6tsmzvQcxXQeKDp9rTCtUMKET1H/oOF1eU
         Ktcc6cEgBdIYuerq2voxdUR7MuvZCRjiIw8+QTV9fr7+u9StufG1A3zn7GoyT6WeuAk4
         ug/n1dH5N4eco+0E4V8RDPW9Va9m2bIOmYAScq9IXXv++L5oMVUEgVTbI+3dww1/o0t/
         kdUHLSNtSCwWqtIU1QiGCMnbB6jwTu/sKIUKAmFWijDx6tOuvhJT/OOgJdb6RDXorn3I
         jbrBQXkHsQUZnqmH0cOlCrUyF6wY4sgmGeCyi/3ZTKXXcrQbonMh51xtUod5UFCyNbp+
         h37w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=sRby2bOaPDKAxFkQPioOKnuwq3Xk8NfKxaMchTyO4eI=;
        b=O5KcXKk8eplE5U7Y4uYLKgMM2MS1xubk80139SP9G/kN7qx2XnyO9qN2XJp9O/7asn
         sPYZFQH28AZTfFW3W+jjw56OAaCYipDWkIrfxE6Kj2UflvAmNABfge9GJPcEjR4ygOdw
         kK2ZLW7ofjM4xb5BbWbmAl9xAg+RJfx3SfDDHKBFmxia1bGQyZfNbivrlJnO49IYPjIu
         qFWdcZp0GyjcKma5gtQUmo7cmN/zaVUVTspmXu5Erst/h5S9qC//pueVg0O4LL4yOJ7T
         FMnLYcQ/4j5jcsfOjyZrpwi4CzIQDdqPwXl5Izsnx6BzPidFg1fpK5qkjFLURngrBKRR
         j4zw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JUwVThg1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h128-20020a252186000000b00633c36b0c70si5028373ybh.257.2022.04.11.14.26.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Apr 2022 14:26:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JUwVThg1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ne1Y1-0006wL-Hd
	for alex.bennee@linaro.org; Mon, 11 Apr 2022 17:26:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ne1Xq-0006v7-NY
 for qemu-arm@nongnu.org; Mon, 11 Apr 2022 17:25:58 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:35597)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ne1Xp-0007h7-7g
 for qemu-arm@nongnu.org; Mon, 11 Apr 2022 17:25:58 -0400
Received: by mail-pf1-x42a.google.com with SMTP id f3so15717493pfe.2
 for <qemu-arm@nongnu.org>; Mon, 11 Apr 2022 14:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=sRby2bOaPDKAxFkQPioOKnuwq3Xk8NfKxaMchTyO4eI=;
 b=JUwVThg10oorycix0bk0c7pr48HQSA7+1kgE8y3BXBiUj1h8SlKF5GZIBfMhqawgvB
 rJZ+cxHG3Nm73lWPRpKuZ1OMBN2SpqsdmRZ+yjbtVeaqU1aDH6XIIRyZpAW5LyHjpjte
 xZy1TwTODnU/69XUz2fk9gRCiK9ojwwtMhB2VGhAUgRychzTJulLjwB4wGEqhG6hRCbb
 OAsdRXS0XEwFpxVo5vTseSKJV2CXaPcnsJD4dW2ktAweJtlkQLMGlUEUicm1zriuSXKc
 dglI23IUmfCpgAnDcXNnNhTGW3HONGYS5F2tUcVf3BAazOpGAm+0/j7wwU5Odk3Mk6A3
 t/ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=sRby2bOaPDKAxFkQPioOKnuwq3Xk8NfKxaMchTyO4eI=;
 b=sPmySWz3OBoaijtTuVhQaGAF/y44ESVmQGpfGT9W58c13Frk2sZXUk5H+IAGfFhso0
 16jUAXUVwVRkEX4KN8bPpsfpm9sNiuXhfV7cBqthdrXEz8BMOhrGQlb4HbJqRay+dkRj
 BdcFjngUInBp4tALekvB6xTjVd9J91O6yxQ7W8BAvYMiMK8lqcNtetFmJBAuQ4RXX47v
 JEda9Op4g6eAbAgbM+HTohTkQExAaS4XJab8beSPYNTmlz+fyMGQ2ithlSvCUuX+Y0xp
 YwZufM0NqeyfmLjmVQ3hHsTxvpQkSBXdCiQU4ONwQQZeWF9ciqmrJ1m+N6LQaAzI3aaq
 Wz1w==
X-Gm-Message-State: AOAM533awwM+sHLEgY90AKcY5qsiEmRA5ImTsgG1qRD9CyGR4OEH3aqh
 8LJaOB691FnzNUVdBdos729bFg==
X-Received: by 2002:a63:5c43:0:b0:39d:5e18:9d98 with SMTP id
 n3-20020a635c43000000b0039d5e189d98mr5492293pgm.145.1649712355184; 
 Mon, 11 Apr 2022 14:25:55 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 c74-20020a621c4d000000b00505be1ae39bsm4967889pfc.9.2022.04.11.14.25.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Apr 2022 14:25:54 -0700 (PDT)
Message-ID: <2dc12f93-9e47-f4c9-f4ed-0cc3ae8f5b51@linaro.org>
Date: Mon, 11 Apr 2022 14:25:52 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 11/16] target/arm: Add minimal RAS registers
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
References: <20220409000742.293691-1-richard.henderson@linaro.org>
 <20220409000742.293691-12-richard.henderson@linaro.org>
 <CAFEAcA_ASQ7Dwm5YMsXvPa6SS721HNuUkD7JPSCpuNOyDikJtw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA_ASQ7Dwm5YMsXvPa6SS721HNuUkD7JPSCpuNOyDikJtw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pCDKc3Mak7PD

On 4/11/22 08:49, Peter Maydell wrote:
>> +    { .name = "ERRSELR_EL1", .state = ARM_CP_STATE_BOTH,
>> +      .opc0 = 3, .opc1 = 0, .crn = 5, .crm = 3, .opc2 = 1,
>> +      .access = PL1_RW, .accessfn = access_terr,
>> +      .fieldoffset = offsetof(CPUARMState, cp15.errselr_el1) },
> 
> By my reading of the spec we could make ERRSELR_EL1 RAZ/WI, because
> writing an over-large number has a number of behaviours including
> that the value the guest can read back is UNKNOWN. That would save
> having the CPU state struct field.

Good point, I should have read the fine print myself:

If ERRIDR_EL1 indicates that zero error records are implemented, then it is IMPLEMENTATION 
DEFINED whether ERRSELR_EL1 is UNDEFINED or RES 0.

so perhaps it's better to leave it UNDEFINED.


r~
