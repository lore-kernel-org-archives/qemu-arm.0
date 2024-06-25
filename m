Received: by 2002:a17:505:2d08:b0:1be7:c013:c773 with SMTP id xy8csp647129njc;
        Tue, 25 Jun 2024 04:44:11 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWjgygAk8T8SlRigLGv1rLaW72mkYPymzJ28zbSP9C/LaM73fPCs1yCxwfXvkWxv8emMyKLRU83pTbvhbZE36JqCCa+AWLi
X-Google-Smtp-Source: AGHT+IE8uA1SGkzQTgIWrYp/c3cKAmclZz96rsLjWDEEk9gct2TcesIpRSiQ5Heks+KeN4hy3xfZ
X-Received: by 2002:a05:6870:7014:b0:254:6eb5:ab2f with SMTP id 586e51a60fabf-25d06b73f7dmr7944565fac.6.1719315850761;
        Tue, 25 Jun 2024 04:44:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719315850; cv=none;
        d=google.com; s=arc-20160816;
        b=JMh8seLnCeT0LOor0qwrrDSRQ0F1MQn5zEmghhw5x3/Ts6kMCHbegW3Rf7kVc/2sG3
         kGQmX+i9gXviGx8/TSkizOoujw5PESYQgh7tXAJURkubFkNz5lfgElthGp6kGZQbVV1f
         04Wig7cAkL89I+EdFmoGSZNaGHsfeZLC+seJebaxlF/UrFvUKewvfXvZ1ClMHulpzjHN
         q1AprL2dWalNy1c3BkbgPxcr71xNVeveMOAhLKSG1WuEKvl77iOn28+UEQTxj4CbUD7F
         qF8A8vNqdGBLScb8gNbVOyEGAInpg7MfIB7fwmTR1zBD4CywEwlVQdauDT28yGA0iQP5
         I/tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=IzPejyNd1pyHPkzFyhh+MwUutBdjG7tTHlq8LFJ5u4U=;
        fh=JSihololR2/876RRQnnlzOxvRQRaxhtgenxgbFgNZ2w=;
        b=CBJBuYzuFZqe8CzsOVyviOMRQl5w0aNeT8Jropg986UE85pE7lDisFESpPhPcuZkta
         j0Q5HVkf2hH9yn+nf0DkVChwx6AkTGbPQcv6Gfw1w3gN4MezHG19bJSSBTZ46OUsio5a
         7HU20w/VEzjKq+z/n9n/aRvA+2UauqZjOg8KW+pfyrs9LONQ/YXHLBXkUyhPYJCTNgS2
         pm7HIThA2rPQBxMDBtvfjQ64j9RVhEIUvA8JZtevw9kpzts3rsm9fOk/pDU7bsr9m/34
         sxjhxnCKuqmXjlUoQ1o9liZ/1jRu1Ue5f6sCEH21HjAmXKYDTbqWgFzshpn9EutJAWJM
         72WA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=adb1GTo1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-79bce95c9f8si1025902385a.702.2024.06.25.04.44.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Jun 2024 04:44:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=adb1GTo1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sM4ak-0006oe-Uv; Tue, 25 Jun 2024 07:44:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sM4aU-0006iz-BZ
 for qemu-arm@nongnu.org; Tue, 25 Jun 2024 07:43:54 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sM4aR-0008RA-PZ
 for qemu-arm@nongnu.org; Tue, 25 Jun 2024 07:43:50 -0400
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-57cbc2a2496so6214749a12.0
 for <qemu-arm@nongnu.org>; Tue, 25 Jun 2024 04:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719315825; x=1719920625; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=IzPejyNd1pyHPkzFyhh+MwUutBdjG7tTHlq8LFJ5u4U=;
 b=adb1GTo1G5U9rjYWOJx4D6BDIU4zsiz30LTMYfAvQY+4hVTG5Elry5WeOkXLaYpNbR
 OkBvGNmUDt2EokQYNp+/vKjbDBbFOYe4nRQ9ncZlYJjkMcX/ibnlXgIHFzto2U570DI9
 wYGPokT10iTROBxVhg1zuEAsPHZ08N7xq+x8IJ+tc7kk+s+S9RcdkZWqLaFmgzyei08A
 ttnKbhTrMfN3gIAxK01DEcHTJKCZtRX+OflUppyRr4Nm6ggtGg110uzFkNwBW0Q435ll
 WwD96NIIdVdANzXy9DS5viIFLklwogmrrYh2iCwPN33nt2g7eYvZIDf1oHxGFn7sTbIR
 J+ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719315825; x=1719920625;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IzPejyNd1pyHPkzFyhh+MwUutBdjG7tTHlq8LFJ5u4U=;
 b=GDy9oP/02LeFwxPGDuaUGADTq61TW3FfMVGY0uq3+hqk3J2mFOryOK/RxdCim0jDO7
 To218+1eLaHc4HmgsJmjacTOayE1U5p9SvCA2/yTXkGkNiFceYycEmLyBam9x3hz7QZq
 WG99SvNNx4FzvDTMMGOqIojIDZ9riytiDp4LulFqTUc1drcHobQtsoVi2Y9SzcMtLxED
 1lFQ+1CAoQNc/cxiVN/foym0nbBIUu3WE9uYAH+9NupkaNS6OroeByck82lqo5QWfgBJ
 lpXndUHdUkdUY7uzVLOwAxAHWDnTMs8F0WvqxAXKQvzIwAJ2l/x7fpNthoPgwmFUFtEM
 rK4w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXy6AYckd60FS31UrpAlpxOXHX89YlMcWQc1hUBgVCH9VaMUeYOfed8RPWKuCe7VoT2IFQEc9ZxcoDjn2BXlVmpkmlT
X-Gm-Message-State: AOJu0YyVXzc44CF2tmad511IOswzE4JJ+CJh0S5SBUzDPBIK9JpeHHa6
 ITxKFyxTEZN94uUX7T4U5+YMqXP0qkAacYrevFmX8rm7bD0N2ke6RGaNlPCBlWOT8it0YyVRRv0
 v8AIDD76EJj6DlN9kqrFaktne9BL/48XF3yCJdg==
X-Received: by 2002:a50:bb44:0:b0:578:6410:1d50 with SMTP id
 4fb4d7f45d1cf-57d4bdbe9c6mr6866851a12.34.1719315824807; Tue, 25 Jun 2024
 04:43:44 -0700 (PDT)
MIME-Version: 1.0
References: <20240625050810.1475643-1-richard.henderson@linaro.org>
 <20240625050810.1475643-3-richard.henderson@linaro.org>
In-Reply-To: <20240625050810.1475643-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 Jun 2024 12:43:34 +0100
Message-ID: <CAFEAcA-nmCQwkhb+DMfx6MBak7VQXCYAYkdj4T+mFuVH5xoS7Q@mail.gmail.com>
Subject: Re: [PATCH 02/13] target/arm: Fix SQDMULH (by element) with Q=0
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-stable@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: 0tnWJ46l5n4H

On Tue, 25 Jun 2024 at 06:09, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The inner loop, bounded by eltspersegment, must not be
> larger than the outer loop, bounded by elements.
>
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
