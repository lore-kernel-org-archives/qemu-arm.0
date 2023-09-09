Received: by 2002:a17:906:9502:b0:9a1:fa4e:495e with SMTP id u2csp414330ejx;
        Sat, 9 Sep 2023 10:06:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEH9zKsG00wAzpJSri8HaUGPd/bT5wGo8uwD6z4jxaqY+ONXyGDhmZtORzH6+xnE0f7X+X8
X-Received: by 2002:a1f:ec84:0:b0:48f:9778:2b9f with SMTP id k126-20020a1fec84000000b0048f97782b9fmr4407308vkh.11.1694279207252;
        Sat, 09 Sep 2023 10:06:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694279207; cv=none;
        d=google.com; s=arc-20160816;
        b=MfPdOwUDFiUnAy5bkkYrCRDwAh0WWxbhWKgymZKtqpQShgt/2nZ2ikjyUCq+9mJlFA
         GMgEdLyyBYCJE5qz3rsib6hZMYViZNafifgLJhnMQyvpLoiQPXAvDqSQVbzdwe4XPdtF
         yPax3EAdrkNwihnxr1242VRePCtZYRGdZ8ocLDsNPSl70Ymh23FtJX37lvEC7VGxCmEt
         F5XgIyRNciOGGYgEw9X5IipVMJnB0vE8534qDAyUQX7mbgkP909m+I0iBpUHBEl3G1yR
         kMw9FLJ3YR2bD1vqA95X3XRziWZcAxx+4MP/M3NoubCt2hJALOJjUuuh4bBC3YgeZ2vy
         i7rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=DhcxzShv8pTqMAbPNLJcydTvX4DZLbB11NbkviOrefQ=;
        fh=+xj4Yfkfa7hWRbLS+DTrcNY2o0evBrBbm0gAigyTnIw=;
        b=0IBxd1LdYkBReRRLcyAwUPgvx+hl8Syp6zu9DTair1xxxgEfQxnqMr/R3h4k3Kgkow
         Fq7Hojb5Ik7zSqIM2Vd+IWErVywvI48uDWSvBzl+MHoA34mr5bWitmJBU5zqcinPBmC7
         ARjpOrDVoug33anh7NOx55ypDzfTmKasRiSjNxqTRyk/4aEmLx/Om1WvFv8xHUBbrJzL
         6rqk52M8jNmv6lCoR/AZauB/NdwP0pCEeE9RXv/X81a2Y0cfAbaj488thlebIBFn6gan
         dHsr/YHOMMRC8pKlTr0EjRnFeEaAPZNsNYXtV8vD/RRZcAK1aobNVxoSUh8s/fxqOly+
         4QiA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=utTpyIzK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t22-20020a05622a149600b00410883ab45esi2804991qtx.29.2023.09.09.10.06.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 09 Sep 2023 10:06:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=utTpyIzK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qf1Pe-00021b-7K; Sat, 09 Sep 2023 13:06:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qf1Pc-00021K-M1
 for qemu-arm@nongnu.org; Sat, 09 Sep 2023 13:06:25 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qf1PZ-0007Xn-D6
 for qemu-arm@nongnu.org; Sat, 09 Sep 2023 13:06:24 -0400
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-1c1ff5b741cso28097965ad.2
 for <qemu-arm@nongnu.org>; Sat, 09 Sep 2023 10:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694279180; x=1694883980; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DhcxzShv8pTqMAbPNLJcydTvX4DZLbB11NbkviOrefQ=;
 b=utTpyIzK9BOr2QmBCHFjy1Xb7pm/mBPMnhiozgVx25haypne3x/jPTAue7gMjCjae+
 F4t4X+gc1GTM25YyUhiW88lhl0M9aQdL77dGwN3Xy98s/zOhp59J2cqITlLxuczPx64z
 OhdrK+g8KU+muJb9NVTtqc8NKZ8BVb7AteuZUmbOPf7587tdCi3CYa0CK8XCOCCntBZ6
 DGw9ZlKot6SduPTySxLHfIBXu8iODALbTuQEembe+dq4BwdT65WP+YfO1DuUgfyjQC8i
 SxQuK4FMHn0jpFU/AN+wTY/fpZJmopC0w4Ivr+vHhwmNeba9/ws+XE6qIctXy8fUAoCZ
 KFUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694279180; x=1694883980;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DhcxzShv8pTqMAbPNLJcydTvX4DZLbB11NbkviOrefQ=;
 b=fncZAMW92E2QaUmAr4ejHydNMken+NTbtHiUIAw1fqWoeZEUM85Ytyr9Wg9/Wvw86m
 HNrdYWbDQnDqpA1Zckig+jrJt7SQsnVZmfbiN+OKesPJMXYAiNE/6UDmGs5s4DFxWAwt
 1dUEGLEzN6CwfVODny6cSFgZ8pnNn0q15pfE7Rfu/F7z+VIUITOa2HWJJJ2lniphAt6Z
 bXChGfO0i5RmunByyOgzrz2HFqN2f/v45nbk7yZUZSGACmuBAxDYs5ejQ/Sq4+p+wDzw
 HXwMmmM8SfAWn1gUWbuOChIPY1OPxlDhAmPFMt0f37tWqjJkTou1lSq1e7ZKZnF5N3Z+
 6dBQ==
X-Gm-Message-State: AOJu0YxAVmoczXa3RPMUHRkX2DEbaczC1do1+6XLu5wQLxT1zoIYu8bM
 6lF47/n/NBINqSjoQA8jth26DA==
X-Received: by 2002:a17:903:24c:b0:1a9:b8c3:c2c2 with SMTP id
 j12-20020a170903024c00b001a9b8c3c2c2mr6528446plh.37.1694279179772; 
 Sat, 09 Sep 2023 10:06:19 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.131.115])
 by smtp.gmail.com with ESMTPSA id
 g24-20020a1709029f9800b0019ee045a2b3sm3462919plq.308.2023.09.09.10.06.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Sep 2023 10:06:19 -0700 (PDT)
Message-ID: <28b64da1-6c0f-012e-1af9-ac27a8581f6f@linaro.org>
Date: Sat, 9 Sep 2023 10:06:17 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 13/14] target/arm: Implement the CPY* instructions
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230907160340.260094-1-peter.maydell@linaro.org>
 <20230907160340.260094-14-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230907160340.260094-14-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.473,
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
X-TUID: XBs4MddyzKIp

On 9/7/23 09:03, Peter Maydell wrote:
> +void HELPER(cpyp)(CPUARMState *env, uint32_t syndrome, uint32_t wdesc,
> +                  uint32_t rdesc, uint32_t move)
> +{
> +    int rd = mops_destreg(syndrome);
> +    int rs = mops_srcreg(syndrome);
> +    int rn = mops_sizereg(syndrome);
> +    uint32_t rmemidx = FIELD_EX32(rdesc, MTEDESC, MIDX);
> +    uint32_t wmemidx = FIELD_EX32(wdesc, MTEDESC, MIDX);
> +    bool forwards = true;
> +    uintptr_t ra = GETPC();
> +    uint64_t toaddr = env->xregs[rd];
> +    uint64_t fromaddr = env->xregs[rs];
> +    uint64_t copysize = env->xregs[rn];
> +    uint64_t stagecopysize, step;
> +
> +    check_mops_enabled(env, ra);
> +
> +    if (copysize > 0x007FFFFFFFFFFFFFULL) {
> +        copysize = 0x007FFFFFFFFFFFFFULL;
> +    }

CPYFP does not have the same saturation as CPYP.

Again, you would do better if 'move' was a parameter for an inline, so that the tests can 
be folded away.

> +void HELPER(cpym)(CPUARMState *env, uint32_t syndrome, uint32_t wdesc,
> +                  uint32_t rdesc, uint32_t move)
> +{
> +    /* Main: we choose to copy until less than a page remaining */
> +    CPUState *cs = env_cpu(env);
> +    int rd = mops_destreg(syndrome);
> +    int rs = mops_srcreg(syndrome);
> +    int rn = mops_sizereg(syndrome);
> +    uint32_t rmemidx = FIELD_EX32(rdesc, MTEDESC, MIDX);
> +    uint32_t wmemidx = FIELD_EX32(wdesc, MTEDESC, MIDX);
> +    uintptr_t ra = GETPC();
> +    bool forwards;
> +    uint64_t toaddr, fromaddr, copysize, step;
> +
> +    check_mops_enabled(env, ra);
> +
> +    /* We choose to NOP out "no data to copy" before consistency checks */
> +    if (env->xregs[rn] == 0) {
> +        return;
> +    }
> +
> +    check_mops_wrong_option(env, syndrome, ra);
> +
> +    if ((int64_t)env->xregs[rn] < 0) {
> +        forwards = true;
> +        toaddr = env->xregs[rd] + env->xregs[rn];
> +        fromaddr = env->xregs[rs] + env->xregs[rn];
> +        copysize = -env->xregs[rn];
> +    } else {
> +        forwards = false;
> +        copysize = env->xregs[rn];
> +        /* This toaddr and fromaddr point to the *last* byte to copy */
> +        toaddr = env->xregs[rd] + copysize - 1;
> +        fromaddr = env->xregs[rs] + copysize - 1;
> +    }

You're passing 'move' but not using it.  I would have expected that here.


r~
