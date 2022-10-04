Received: by 2002:a8a:1930:0:0:0:0:0 with SMTP id be48csp272122ocb;
        Tue, 4 Oct 2022 08:47:05 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7xkBM2xVAdfthcV4Wxj8lvzgTcJ5PMT4PY3bPwN/GIxlNzJvOBQj+D5gTXmPJSuNF/n6QA
X-Received: by 2002:a05:622a:1990:b0:35c:d95c:1c17 with SMTP id u16-20020a05622a199000b0035cd95c1c17mr19827729qtc.34.1664898425656;
        Tue, 04 Oct 2022 08:47:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664898425; cv=none;
        d=google.com; s=arc-20160816;
        b=mUSDVwStq8o6birixRSXxXUgtzUheilKQJSnm911xLKALDrS/0Vnyl4UsabNFFBjxN
         EPMUwyR5dk1b3GsjBgNSxgmWQpDXyblvUCjXcyothv/TdiwSaudXBmSZtkv4RbZ2kPBV
         JgsTn9u9Ph8ZJjmZp1OpPpy2XbHmUC+ezNuGlPayvj0w8rRJRfdlgXPpIoFKaXKIxEuD
         pOc24buLXLvTMuI4KPDqU9NTEmY5FzaGc/ujhExcWixt4bkv6jrpJVJA9zBs/TbduT2d
         MDIl1SveNzu1biy3im8BgRPGd+lVM0VgVmO14hL72Yaw9NCycC/jrh2wdRWEwab4wcAL
         dzZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=+g5J5L2AiW3syJ9AlvX2CVgtK2KjHYvPzZRI84R/46k=;
        b=YWg766pkTixyeugg7LFNbqPSEELdH/lVBWX4eIJ4SvVAysTfuYmMj8/sisXO6gr7XF
         wg3WAL3sHPF8ITxiCoEz9+hPRkmAyh1pZwQxlrWdc0Jceh+RhLlaxEDHv5zvr/ZeOF9I
         elgTg9TPklk0Fog0KlLGg9oWzZGu8/qq1WlxpYYFRZ8pL64lWW5Tb5WXetxpHyvathQ4
         fpy7xhV/+qj4j7szG/exqc2zHDMCjbDBAKhDBbD0qA4+DjGc++k4sRb/WoH6kx9RTYUM
         1PFg6ckWUYxQjhvi+ShUHBMYJsoifbH4Y8zApT0C12zvvkST1Ld4YLCGL8QhwExLsJR7
         1AdA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eO9nE2Ep;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r20-20020a05620a299400b006cf74c1933dsi5935240qkp.528.2022.10.04.08.47.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Oct 2022 08:47:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eO9nE2Ep;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ofk8P-0008Df-8I
	for alex.bennee@linaro.org; Tue, 04 Oct 2022 11:47:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ofjgB-0007Tq-4V
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 11:18:00 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:34321)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ofjg9-0001gV-4d
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 11:17:54 -0400
Received: by mail-ed1-x529.google.com with SMTP id s30so15593476eds.1
 for <qemu-devel@nongnu.org>; Tue, 04 Oct 2022 08:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=+g5J5L2AiW3syJ9AlvX2CVgtK2KjHYvPzZRI84R/46k=;
 b=eO9nE2EprqN7dWVNQStTfpWNY06oN0lkHUOHM2i0aq/RljL31AQKPmszfozlJDcast
 VSjQujwq2oOOiGIR0w/9HEXG1DtiXqzAqszZ41MrxbwL6VvU6itw5Qg/3uUQrArAD5Cu
 r6y7ZdyixgyCCBDAgCZ3cRTMepmpEq+t+mExJ9toJNreeM3KJeIZa0zD42sAqiUfnBrv
 3l0mo8ccX+WP3kqafBdaJelJ9hM+DVLpQNcqHuWzKxkkzE3JsUJrlrnuXHMxnkBXFRrc
 dhNw6stBoLYIKT5uz7O0zSDCu400E5YrZ28gpy8IswvJTYe5fXIvedXaPiIvCV0os3El
 /Omg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=+g5J5L2AiW3syJ9AlvX2CVgtK2KjHYvPzZRI84R/46k=;
 b=hAzhX2eWH63H7qu1Zq2i8tEoxvEpBxAmDrXq/DnNhO3TEraqUCk9auMOwqykHKzsQh
 nxyJtH1c6BUMRr36H9ZEXlLmKbbKBm68XaS9/XClUwJL7YgPexQPWANHsTMSkB+zsS8B
 OQKka+pkijFv27TcsYr9d/w1CVQAx3rQ9EXYV7eeBws3pSYtuQNVvlqZucHStefcUc83
 fJs83cNQroCaDGFskx+tvoFeTCAf+t0bPhXatGFmZCxqlHjLcr1jDQKP56VuM8VouS2+
 UODD2y3pTklPUZCGwW/4KlccN1Txpdzpaa9+ZiIGDdLQwyuvpzw8T+52zSQIpJ5KLTcb
 Ol3A==
X-Gm-Message-State: ACrzQf1FFba/UN0aseh+xDBkk5iXJVGV75a/0xgSAEB4BekJOB/cewMw
 ORWCMPZgQlzGL0Kf9U09gIDxZKfPbeLBuZCXR2vdSw==
X-Received: by 2002:a05:6402:11d4:b0:452:a97c:cd36 with SMTP id
 j20-20020a05640211d400b00452a97ccd36mr24013178edw.53.1664896669749; Tue, 04
 Oct 2022 08:17:49 -0700 (PDT)
MIME-Version: 1.0
References: <20221004072354.27037-1-jerome.forissier@linaro.org>
In-Reply-To: <20221004072354.27037-1-jerome.forissier@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 4 Oct 2022 16:17:38 +0100
Message-ID: <CAFEAcA_hi9Dp-eKRBWZ+yg4Ufp25Q3p3K2+=UKifgka9gz6vzA@mail.gmail.com>
Subject: Re: [PATCH] target/arm: allow setting SCR_EL3.EnTP2 when FEAT_SME is
 implemented
To: Jerome Forissier <jerome.forissier@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Richard Henderson <richard.henderson@linaro.org>, qemu-stable@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lVRCuZz1Y2ct

On Tue, 4 Oct 2022 at 08:24, Jerome Forissier
<jerome.forissier@linaro.org> wrote:
>
> Updates write_scr() to allow setting SCR_EL3.EnTP2 when FEAT_SME is
> implemented. SCR_EL3 being a 64-bit register, valid_mask is changed
> to uint64_t and the SCR_* constants in target/arm/cpu.h are extended
> to 64-bit so that masking and bitwise not (~) behave as expected.
>
> This enables booting Linux with Trusted Firmware-A at EL3 with
> "-M virt,secure=on -cpu max".
>
> Cc: qemu-stable@nongnu.org
> Fixes: 78cb9776662a ("target/arm: Enable SME for -cpu max")
> Signed-off-by: Jerome Forissier <jerome.forissier@linaro.org>



Applied to target-arm.next, thanks.

-- PMM
