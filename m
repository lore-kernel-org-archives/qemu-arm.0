Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp365921ejq;
        Fri, 5 May 2023 05:07:37 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6d8J9lLOQMzUUUczHo3BSn1NX71Y+Qp+y6r5sk9b8tDuoZyusIMss3DRdEdFAKsnM/D4BF
X-Received: by 2002:a05:622a:511:b0:3e3:8ee5:1629 with SMTP id l17-20020a05622a051100b003e38ee51629mr2154596qtx.51.1683288457056;
        Fri, 05 May 2023 05:07:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683288457; cv=none;
        d=google.com; s=arc-20160816;
        b=MFKb9LauNzEeXq+7DzeVE9+4eO1B2RZN3y/eAUv5E7dmOIZmaVEf7gM+jnkc073H6P
         8GmpQtrZQMVDiTfyVS0hzFXo9rJQxAr/2RhLGMKDR6HG9OTkC8kqemTpAqCruBf2J1uP
         7g5hl9PX0AUKap7Z/aaScaEljfZXRGo54UorWNUEix2zpBDdz0EAQxGwmNEQjIFLHf3h
         Wy0Y9NR/hlDjS6I7deAVAZh5oLPCEYagnoshHYMLth1AYPiI/FJbBxhk+ADDSmqX1Hrm
         fb8u/qNTmuwQiqNUSprvSc+ejhsGWwiwTddpoM8fr+tKIuaCmbFg9V3mRsbo4b4x7uyU
         jfFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=Q4Q/M6VkiRnc2u13pK8vm0RS70qXwvGYHSr84nhT/9k=;
        b=YStrkd91XF0/nMX0ZxIHDiRTmb1Zwh/tjD8oZ5uZleOn7mP4/RoWQCzIHrkdEVibiu
         0f1AvxuHq1JIWZ1WRN3WHoqWQn198iFMNbYckJHemnI6sWQQ8vKvD/cYBdgJDbPz6wxs
         DXyBk+fbiKlROFJUR/YGS3KGGsB5wV8WWe8CLaMy9FJF8BTAfKx9AK0e0RjItatqviq3
         tdCfPsAIKcK3f1LQnNikmCnvST14ESQT+PFSRpJv4jzAjWhWIzQTfjkqjrjQMlUdh68X
         xCkWShlrH2OddQnqD3fYvyc/O75JHSok/McUl0yb25sqKOBLFOvU8tG8BbAXNCon2ZHq
         VCTQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qCrvOz2y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b19-20020a05620a119300b0074df825732dsi596169qkk.212.2023.05.05.05.07.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 May 2023 05:07:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qCrvOz2y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1puuDL-0001CA-Ie; Fri, 05 May 2023 08:07:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puuDG-0001AX-53
 for qemu-arm@nongnu.org; Fri, 05 May 2023 08:07:02 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puuDC-0003l2-6m
 for qemu-arm@nongnu.org; Fri, 05 May 2023 08:07:01 -0400
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-50bc3a2d333so2560588a12.0
 for <qemu-arm@nongnu.org>; Fri, 05 May 2023 05:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683288416; x=1685880416;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Q4Q/M6VkiRnc2u13pK8vm0RS70qXwvGYHSr84nhT/9k=;
 b=qCrvOz2yM6Yvc/27Ca3lvvqoJtZ8boRbw/nPBLetawCiL+oNC5/xNlxkWpWlzpP2K6
 A61O8wcmjsUET7pC1tWH7fZownT7Yfmh2KHjajpKXP2CYB9+73gzE3dXdAbhxFTjp7Cv
 sUEuY5d+8aiKdKN2L2Ge7rRUUOE2slz18kse0JpQ+BXvYS8iaa5mXWersJHBED6oK8Et
 lkVS0xCNuyq1ECjhf9lPPvDJc1Mo6iZQu5/boBshApoEElOqkyXdJCaDrUSwKKXQF9Tw
 0rpWKx2rVHm6208uwnVMmX7kyTDTBY8d9B1mC9xCW4PHlXpMxZrOqAhJaBR8ABlNHsEN
 g8/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683288416; x=1685880416;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Q4Q/M6VkiRnc2u13pK8vm0RS70qXwvGYHSr84nhT/9k=;
 b=bOjFw7VgGauY51dcDGF3xbnyWcmgS+YVIeE0HI1uIXuadonjpq76WsOhw5MDOe51Ew
 r4q0W3vXUYFUFiaFrJ4BIiJwgIVqSZIq8XVreh2f4Ualgom52iDxRuYAiGyU2jclpSq6
 mzajq9H/CFFSV9LklwywfNoxuDgOw7L1Ee5bidD6yD3QN9UvT8C/Qx+h21IyY7fysNaP
 Bnj6s2iAEqMFh6Ukjs7N0KA0SHUwm8TEaeC2RLwb2/hEk3/OBJA/VmsLW3eK3telNiaq
 lOBbpheqgaoyuXdup4T5KnihNPr1l+EwMvWomfoVLiKfI8og6eDJU4ZxNNKzYx90rAbW
 1J4Q==
X-Gm-Message-State: AC+VfDySIT7dLV4XqiS/Hw3CI7o6bYJlvJGaWpp9JcG7EGUO0eh/wC9+
 x0uELS1FZQzLeuUBCnB0mwgHofeT1YpKw2bEZTN9Xg==
X-Received: by 2002:aa7:d408:0:b0:50c:2215:3193 with SMTP id
 z8-20020aa7d408000000b0050c22153193mr1405048edq.13.1683288416187; Fri, 05 May
 2023 05:06:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-23-richard.henderson@linaro.org>
In-Reply-To: <20230503070656.1746170-23-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 May 2023 13:06:45 +0100
Message-ID: <CAFEAcA9ffNOA9oKV3e7PbecOzu7yyWAs7ecqKbNrTHtiDKsGTQ@mail.gmail.com>
Subject: Re: [PATCH v4 22/57] tcg/aarch64: Use full load/store helpers in
 user-only mode
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn, 
 philmd@linaro.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, 
 qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
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
X-TUID: UDc97xw6Ddoc

On Wed, 3 May 2023 at 08:12, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Instead of using helper_unaligned_{ld,st}, use the full load/store helpers.
> This will allow the fast path to increase alignment to implement atomicity
> while not immediately raising an alignment exception.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> --

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
