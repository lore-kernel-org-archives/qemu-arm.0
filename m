Received: by 2002:a17:505:3501:b0:1be9:327d:8ee3 with SMTP id mc1csp1970632njb;
        Mon, 14 Oct 2024 09:42:13 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVUypP3PQI5Yz6DJoAH7D9shqSiYHSKEt9wugzfTDR3YVVaV0VynyCbhRgG9Jr68mYep4i6FDfFgT+koQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHFzVlZAYl1YqMiH6oHVKF6SrKBH/hzjjn+6naG8m/1y+2E0EllKQeoMfEVQ0T2RXkb8UqW
X-Received: by 2002:a05:6102:2ac9:b0:4a4:9541:e38c with SMTP id ada2fe7eead31-4a49541e4bbmr2157264137.0.1728924133169;
        Mon, 14 Oct 2024 09:42:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728924133; cv=none;
        d=google.com; s=arc-20240605;
        b=ezPnU9tAC4VPQA26T3fKXqFY7DUAgvyjQ2Ysxes2o/umO6Ar4stL1kEftV3A38Zk56
         7qsCejP7yWagviFpjkAS9/1kU7ygXztsfB1P8AQ8QCSOJMvdPHrjkWOMkyt4tKN/11VG
         AvZsQb611uoVru0DD47ZG1qDHikLO1l5d398jZal+eSv2LTFdq2mmuzOmIbpkksa+W34
         SNw2HRCtMTX5kl9Brrn9pHKFXKa+ATw3Ixcz0IteG+mlOxzbku4cK1NCfpo1/+L8LgX+
         blnP9Ys6F6Nd4UROmKpTV/Vzp/QE4CXw53U0vgTXeKzCfTfpO9Y9raRINcduzIKjLeeB
         t4eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=YLnPlc8Wk82BERYeTM5I4JDtZk08l5fkN3/0TnAiXD4=;
        fh=4RF4muGld08CODtB0Qhet9C799EHcc/NeDNA2R/UUKc=;
        b=TFzphEb64PR7d/5uF+frFd6EILlQiJU3o6ZD/5e8jIF5uoT91FJbVsDonqolizrhnw
         7xR3aPVgeryn4YmMocD3XP/q5rvFznespzEF3pXqAYrWGBelNa7XLur4tA2bhOCBgoWQ
         S0DmNc/QE1Cooyj13FOYgJkKuEuAvcIl2gAgHQ1m7NoHUVF0rlFL0q48Al0Og7kQ5YQY
         LgL/H+U3znpL4rMVlOXJlcGOyia1Xu721WPzkqJAUxEZJ4Ud3kBE7xHNkalV/vC+/Fcz
         QddeOUg4xHSMh1x9cPOhTEW4SGCI7dDCgsTtYtBRPCFwQoAGyiIgPVZdbjL3f5AcdofU
         AhhA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XC4MFCkr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46042883cb3si106057661cf.311.2024.10.14.09.42.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Oct 2024 09:42:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XC4MFCkr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t0O8l-0006is-7Z; Mon, 14 Oct 2024 12:41:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1t0O8i-0006ib-Ua
 for qemu-arm@nongnu.org; Mon, 14 Oct 2024 12:41:49 -0400
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1t0O8h-0001gx-4F
 for qemu-arm@nongnu.org; Mon, 14 Oct 2024 12:41:48 -0400
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-539f7606199so1216599e87.0
 for <qemu-arm@nongnu.org>; Mon, 14 Oct 2024 09:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728924105; x=1729528905; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=YLnPlc8Wk82BERYeTM5I4JDtZk08l5fkN3/0TnAiXD4=;
 b=XC4MFCkrBDPAasjoLWDpGd2jXaPqTwAA3Crrl9/mWLR7COgUi+HaiTS4FTeOw/zUDS
 qMis008yuGDDJy9P6W1PxIvmkyo3OY6bQqJIbM66r3t+iXgE39zJ/aeF8EHHeAdPp89+
 EePiTUKnRD+6CIgyTyvjIxDRGJWECw98vsy6fCiMYOthAHbLOS1O6OXEJJ3cLPhSmhXd
 5dyoSUGTETslMcIlYvYLEBCzq6usSr8NJhqtklX7OKpUeSYz9WmvfFnn7IXFe4xflmwG
 NL+zC5oplGQO4KFg3TBvnhHClqaPUcSb/jPYZVyloeQwDJVEfvuZlMVTZKTxiZKY6eby
 NTuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728924105; x=1729528905;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YLnPlc8Wk82BERYeTM5I4JDtZk08l5fkN3/0TnAiXD4=;
 b=IH7HuvChPRHpy4vxzaT4RSlF4BO0SWFlDZvBrWrjAERqC7gOOFCNBEV4xe/OixbnE2
 kejibjm3dGYlKenIM0Jft32azwNDoKM+zQvQ+SflVnJpIUWiRsmQdSFLGFgTQ9YjjX7z
 rbnuZ7sOzDG9bHSs59cQGkAL5YNXTpEWe7E2QYBthq3WZsp8P/I9lxe13CsvVyQPrNL7
 vkrSLSkGKMsGVb3oLzG6a2pNL0swr4JYKmcP3j1bTpQngxQbSaUt6o/bgmGAXk2hkYbQ
 wLyjceW12x7ddDydu3O7B38qUj+pX6fdg2cN5BcBObB8+xluynccgdrz3tGTkMjBxRO1
 TOQw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUaN4TamahSFyWxT6P8aZmHJ9Iw7LGKx9s/mpJ5Munc+f6vwzLcvKPUivXj2lLbFTPyAXkYeiB4mw==@nongnu.org
X-Gm-Message-State: AOJu0YwpmQ+9yIgx5KFuI5s+rfXNbKjm1hzLvqaqOCx6lKbpd94nOB8b
 K7ydmV3V3pgDFPpUn7EQTPwf9HmobPBMncwJ7qwfHd21wIyBP8n4b+4EmwIpySvG1tpZCR7KgUg
 6ttWEOjWVAr40DyFU2xRQ2heJn4HZECv3PzzSVA==
X-Received: by 2002:a05:6512:3f02:b0:536:5625:511a with SMTP id
 2adb3069b0e04-539da59516cmr6020488e87.47.1728924105049; Mon, 14 Oct 2024
 09:41:45 -0700 (PDT)
MIME-Version: 1.0
References: <20241014-arm-feat-xs-v1-0-42bb714d6b11@linaro.org>
In-Reply-To: <20241014-arm-feat-xs-v1-0-42bb714d6b11@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 14 Oct 2024 17:41:33 +0100
Message-ID: <CAFEAcA_SYtVHjf2LmOkHZPHET=8r9BSCsir1R=PWLM55L3O4aQ@mail.gmail.com>
Subject: Re: [RFC PATCH 0/4] No-op support for Arm FEAT_XS, feedback needed
To: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::132;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x132.google.com
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
X-TUID: J3GOzMO8WhnI

On Mon, 14 Oct 2024 at 11:50, Manos Pitsidianakis
<manos.pitsidianakis@linaro.org> wrote:
>
> This series is an initial incomplete attempt at adding support for the
> FEAT_XS feature in aarch64 TCG. This feature was introduced in ARMv8.7:
> it adds a new memory attribute XS which indicates that a memory access
> could take longer than usual to complete and also adds instruction
> variants for TLBI maintenance and DSB.
>
> These variants are implemented as no-ops, since QEMU TCG doesn't
> implement caching.
>
> This is my first foray into TCG and certain things weren't clear to me:
>
> 1. How to make sure the feature is implemented properly. Since we model
>    cache maintenance as no-ops my understanding is the only
>    functionality we need to provide is to expose the FEAT_XS feature bit
>    and also make sure the nXS variants trap properly if configured with
>    fine-grained traps.

We also need to make HCRX_EL2 writes allow read and write of the
new FGTnXS and FnXS bits. (hcrx_write() constructs a valid_mask
and only allows those bits to be written, so the mask needs updating.)

> 2. Is there a point in adding a TCG test? If I read the manual
>    correctly, the nXS variants should trap to the undefined instruction
>    vector if unimplemented.
>
> These patches lack support for FGT for now.

We will need the FGT support, but I think it should be
straightforward to add:
 * add a new entry NXS to the FIELD() definitions of FGT in cpregs.h
   with the meaning "honour HCR_EL2.FGTnXS to suppress FGT",
   and in access_check_cp_reg skip the trap-check if NXS is
   set and arm_hcrx_el2_eff() has the FGTnXS bit set
 * when we add the new ARMCPRegInfo stanzas for the new NXS,
   make the .fgt fields be
     .fgt = FGT_TLBIwhatever | FGT_NXS
   so we apply the NXS logic to those ones
   (or if you like use macro magic in cpreg.h to define
   FGT_TLBIVAE1OSNXS as being FGT_TLBIVAE1OS | FGT_NXS,
   like what we do for including FGT_REV in the FGT_ constants)

-- PMM
