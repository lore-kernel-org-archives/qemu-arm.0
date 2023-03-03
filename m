Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp1096304ejc;
        Fri, 3 Mar 2023 06:06:55 -0800 (PST)
X-Google-Smtp-Source: AK7set+iTQOSpLOFjRIpba3RwukDWrcD/AURkDWE+x+5il0Ja6eRzE9LtLK/0g2xjmnM7KkGScAn
X-Received: by 2002:a05:6214:761:b0:56e:b1c8:381b with SMTP id f1-20020a056214076100b0056eb1c8381bmr3124293qvz.31.1677852415674;
        Fri, 03 Mar 2023 06:06:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677852415; cv=none;
        d=google.com; s=arc-20160816;
        b=dO7DkcmGfNbkJI9V70UQ8uYzKb3ZtUGjS5aYNrX8XyhpCu5LbBcwJOUFMNKgZRoFWo
         wBZ2DmGg+a/6U3YZVMrDkbegvhEgfzFhzGKsuUvlXZ2nCIFdu1Q4fwirI5d3JmqRTngs
         wtx35RWQGvSi4H4xcBIksus/mtsWL06uUOC1cVeeHZSOYanKV6R8PHqFE71D5WFN/EBD
         s5o44sYSWGZiNVM1Y6lF2TyfbPKAf8vCi6W3R/XKHrtXgTz/bexF1bpF4+fTKaK1X16a
         pLqm9xPsWtFLio9r1GX1K4O0bbRX9x4vyvoTJ7IYMni7JafXAR11CVX5YHGxGWM25wZX
         AeIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=FdfEb4YRCyEREZ+0oyMFBEC3j+X9bzIDyBDU7myJYSs=;
        b=Jhlh2X/MJl+ts1wHG7ESrKt976A3FjHi1MTruvhgUA56Ewamfu0m7QYwtBc6suehv+
         s9L7XxY7h3A71boFmK8wLMe3oKGwmIRDfPqyysVFnX1STOxT5vy4mD5BEU27Gl6YuIjV
         Nc4uh2JVwCsMPVbesy1deyR/2YsZNFKy/Opi/nZdop0ODtnmmKxDIAqQpWl7QM7RqBWS
         LzM+gT6nss2nR974YkTzKk5B6UeioXRel9H+jpeRCdqdDiHJMSutWRPVDsOHVCMmCHzC
         f5qXNdq3Muh+caC2WGzKyvljv0SQOuwzX+/6iTKBow2UL8Vlk2e8lYKtx178C2s55LWH
         Iiuw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=u5zWsLYh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id az40-20020a05620a172800b00738dd5f9352si2018422qkb.6.2023.03.03.06.06.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Mar 2023 06:06:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=u5zWsLYh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pY63c-0007CP-R6; Fri, 03 Mar 2023 09:06:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pY63b-0007Bs-5V
 for qemu-arm@nongnu.org; Fri, 03 Mar 2023 09:06:47 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pY63Z-0000X4-N3
 for qemu-arm@nongnu.org; Fri, 03 Mar 2023 09:06:46 -0500
Received: by mail-pj1-x102e.google.com with SMTP id
 me6-20020a17090b17c600b0023816b0c7ceso6251298pjb.2
 for <qemu-arm@nongnu.org>; Fri, 03 Mar 2023 06:06:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677852404;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=FdfEb4YRCyEREZ+0oyMFBEC3j+X9bzIDyBDU7myJYSs=;
 b=u5zWsLYhqLtfXfUsruhS7Rymc15vG5QTirovxVOiKR7YcR7vVdyD5RavMNCPIHzpbl
 Tm+E0rVHYBLrtp7enJlLMsxeRxz1rn/O2vz6LucDzHq/6rbuTUfyZ4WxHPytby196jPo
 yEO9aNxal+3ZKI11h2HvLHFmYsZshxGanCLf/wHgXJ0uEdVyrpYI6PDMm8CdAYHJoBzB
 lTkTgURX9js2BRRnebvrrdG4jjka6RQhlggdAySCL3QzOBLkkY0XyHIkWxvyRgV4h4xn
 79DVMOncnSZGDuwi9vBxVHQObU/iRcevO/TSUut9XcxxZIkU9A8z2sPVxZw1nqRbfs4g
 hsHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677852404;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FdfEb4YRCyEREZ+0oyMFBEC3j+X9bzIDyBDU7myJYSs=;
 b=ghv4dcwqLvYVDKZQ2NNIH03/vw05qGOcj+KWFEiyYRXVlMPOTKbYtwQIZpH8HLtIWS
 PYzcM3aHS0TpQLyTwdJxIan8yog0DiwdebFvy4BqsMj/IxZbzMu6YkuPKyBDjb4Fxmep
 mHqpV7ZIjfbCTh6Zdn4tM/Jdt16/76sRNajMWnFTRBJTy3PDrWA6QdDwEqGXmLocNQqp
 mfnfa4cJiXL/qGsB6rSkfgDy/RHqtM/W/AJCzfZEMxFvU35Dvg+lzVWWSIvnEsNAYgGE
 klw6T21MeYFEOcbRtQzsUgAIzUQi7Xe39ifAaYcLdsOJ7XVROidq9o6GTP2nUFnenW2E
 brEw==
X-Gm-Message-State: AO0yUKWac7Hw7dru/4UZhP8VcSiLbtHGbH7xXnglEa92dqjhBXXwqTJ5
 fL3jfzRaZGLdGKml1kunc0JpEmnsX2xZwgte+pBTPQ==
X-Received: by 2002:a17:90a:d18a:b0:234:c035:7749 with SMTP id
 fu10-20020a17090ad18a00b00234c0357749mr627655pjb.0.1677852404261; Fri, 03 Mar
 2023 06:06:44 -0800 (PST)
MIME-Version: 1.0
References: <20230227225832.816605-1-richard.henderson@linaro.org>
In-Reply-To: <20230227225832.816605-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2023 14:06:33 +0000
Message-ID: <CAFEAcA-PcckkLvL3iyoXopkggxwqr3OJOR0AKk4EV+m2DDDhbw@mail.gmail.com>
Subject: Re: [PATCH for-8.0 v4 0/4] target/arm: pre-FEAT_RME fixes
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102e.google.com
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
X-TUID: hLCREf3nsrR1

On Mon, 27 Feb 2023 at 23:00, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> These were part of the v3 RME patch set, but are bug fixes
> that should not be deferred until all of RME is ready.
>
> r~
>
> Richard Henderson (4):
>   target/arm: Handle m-profile in arm_is_secure
>   target/arm: Stub arm_hcr_el2_eff for m-profile
>   target/arm: Diagnose incorrect usage of arm_is_secure subroutines
>   target/arm: Rewrite check_s2_mmu_setup



Applied to target-arm.next, thanks.

-- PMM
