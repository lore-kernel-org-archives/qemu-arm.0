Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8D9ACD98F2
	for <qemu-arm@archiver.kernel.org>; Fri, 19 Jun 2026 13:03:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1waYrq-0001wT-Ej; Fri, 19 Jun 2026 09:02:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1waYro-0001vk-MM
 for qemu-arm@nongnu.org; Fri, 19 Jun 2026 09:02:40 -0400
Received: from mail-yx1-xb134.google.com ([2607:f8b0:4864:20::b134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1waYrn-0002R6-7K
 for qemu-arm@nongnu.org; Fri, 19 Jun 2026 09:02:40 -0400
Received: by mail-yx1-xb134.google.com with SMTP id
 956f58d0204a3-662c360aa73so2296162d50.3
 for <qemu-arm@nongnu.org>; Fri, 19 Jun 2026 06:02:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781874157; cv=none;
 d=google.com; s=arc-20240605;
 b=ToWbO9uVmeitWE8n02HvUdKBmt0EUU7eOosHN8yqdBp+DVpWf9Y61KnnWf2j+JCIYU
 Ap6o6qPwM0aLKrOSRqZRD8nrickqxr35Ko9miyANSEJ6jIZETwf02xrWq3mpfReOHVh2
 MUTaEKF0XAgJsEzZkmaMVBCZNu3xtenVEDDC8oyJJ3J5c19Wi8PqFonQDPVYXNvHD+DD
 sxwKQ615k0Tn5ym7isljCN/3S2NmmW9A+PsaRMhRvvmpeM47WPIK2e1HXAJWwufZlymt
 gfI7XHWfX2eqbGQmMNQuqVEAQAqaDSiFaqgnv3x15Q5aw80Amh05gJ8qla4H5yxSHgmc
 O9CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=vj7lhyCU6w875fOWKpCllsDIfr4MMDDo3fFJTeXo2Wk=;
 fh=3uz+QheXXp9Yu81mA6YwgYPllEgI6xMGmmpO8mbuGnI=;
 b=ZltUibLR8yoJTaywV4BEFcdCVuHf3T5Qe9X2YKVSm0TlesiAnhbDIizvC0jAb70LeF
 aHtpApvErIb7kWo8cX82R/dbT/NazS4uzkevco8ACZo+Ljy+RzDPfW2PniBPHGbcGvJA
 M3bYEOvoKlBrZCC81ikDSaGGf0NOPYQwxLb/1Xe4ro+qePzE4hTvI81oEEe3+KRxQ7mB
 aiI9n2I7v8gT25gER6Vq2FK9IiBqrjRYmrox+54qgnEjJOUOI+0+nQW1OvQeunce9qmB
 5cAn2qTRRJGl6PwTm5L2mkbcGT/KfTOTLAmwXurx+/SqZ1u+3trAisdYnf4JCr050GRp
 NJ0g==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781874157; x=1782478957; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=vj7lhyCU6w875fOWKpCllsDIfr4MMDDo3fFJTeXo2Wk=;
 b=JcbFhlweLn27rJfw3+B1+v/G6RAV6E1vKk10xJpBtC7VypbFR1DCU76CdASFUcBzHQ
 g3si55VbcfeX+a1+cVzPHlWAHGsAx2qXTDtqKN8k3QhODewWYcMekHvlFqNr1J0aTqjh
 iEOsGGl8jU65YtTj+7kqfNcg7/gUjttBXmW7FVGn3HSC0udEsDMk4nAuNmxRRkf3CBR4
 3xyRw70I5juQO9F/br4rz+KAweZbu0/4QPDcMVqP7UbAvPvQ2OnYFjbMQJTZv9RZcfX8
 AXfMq/aryX1RY/vRqDzrU9dCYfMwo5CPPjP9X913T9YO/YfKry98inv/NYo0kOn4iKvV
 RsEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781874157; x=1782478957;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vj7lhyCU6w875fOWKpCllsDIfr4MMDDo3fFJTeXo2Wk=;
 b=Jd8dzdKwaGwrz5x792zJ6SdF8TjN2pYQeg2sXdX412jVy2BepmyV1447/UplZdVyPi
 kcIPA6kx2v2iCEJ9YcJBfOXar/P+iblDLKBMLlzC15n9WSeuS7q/BiGQOXh7zLz5lFY5
 lD+ReMF9++aZqMcp0RDNunlHQAajdlnCGL22AVoQQ7ac/BboJu0FfHC8zURZ5T2j1UHJ
 A5wcWJrZOxzyEdRqkM3UH3PVl2Eh9BPyaUtQp2WDz+UcF42Mvph0Q1XFdt2pMXO2zCGG
 iY4vKoDQz874v0nJzM5CQSqvkZ2NKo9Zd+o42Y5nP/0WXAvU+egFswT77nWid6l+KUyF
 ILMg==
X-Forwarded-Encrypted: i=1;
 AFNElJ+mP4/PDz9OVLQytegpipp9YlVs/LhOa8PGB2Z7J12JDm7oLSF46vAdJijK/dJfyMIxj+NYD59bEQ==@nongnu.org
X-Gm-Message-State: AOJu0YxEjP7+QVE67Ox3JABYmpboTpaqwftEuMzY5uvChXQm/4CIoV6r
 csNmE+70d83VaaOgm1EC1Uo0x8b4AmX/F9Y9DV4pIUOAA7OT0Y+NN9qLY6LnQKumHS8BwT8+WkX
 ssIQjXzJwk0QA5igSgAQ/YPyWqPAbN2AzJzywiaTz3g==
X-Gm-Gg: AfdE7cmguW4SqglVeou+MagMetySejjdGumxhZvIj7AYWH3RSTOl6ah8iQcjCN5aacD
 9IPJ/G1H/M5y1Cgv8gWkuQ7UdD5eGOgui1AAeDanQ/iO/uCRpRYbePQWQ39A7/zx3jxG0ueRyG3
 Z6qlJcbtQxNehJb69429skoXoAc+Dof+I47lv6m0yWltXbPW3urd7ZbZA/aRRYHJRhEO4zETYNn
 xmGBbE4VMCkZXhudgl42zJQdW1C3zIxFUqHB8PvNcfeVyMey5l2sGrUlB2LFIyCRBfYJEREVw0V
 PHt4y0Z6TwnDfVjzHj+hu6iiw22Y2P0MDHHe6kXO4MCdyzBBliykNXsm
X-Received: by 2002:a05:690e:168d:b0:660:7ced:55cb with SMTP id
 956f58d0204a3-662ffba0dc6mr2583630d50.1.1781874156853; Fri, 19 Jun 2026
 06:02:36 -0700 (PDT)
MIME-Version: 1.0
References: <20260618040718.572950-1-richard.henderson@linaro.org>
 <20260618040718.572950-2-richard.henderson@linaro.org>
In-Reply-To: <20260618040718.572950-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 19 Jun 2026 14:02:24 +0100
X-Gm-Features: AVVi8Cf5XGNFcNu4bipr0r32xk9Ctm9dttyGvCs05BYjC9twR26ERl3I79OA7b8
Message-ID: <CAFEAcA8pJz1X2bCsDKSp0+mEPba-V4Aq_90pqZc=Axyqqz+GiA@mail.gmail.com>
Subject: Re: [PATCH v2 1/8] target/arm: Enable SCTLR_EL1.EnFPM for user-only
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Dillon Sharlet <dsharlet@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb134.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Thu, 18 Jun 2026 at 05:08, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We advertised linux-user support for FPMR without actually
> enabling access to the register as the kernel must do.
>
> Fixes: 2430d49a17c9 ("target/arm: Enable FEAT_FPMR for -cpu max")
> Reported-by: Dillon Sharlet <dsharlet@google.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu.c | 4 ++++

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

