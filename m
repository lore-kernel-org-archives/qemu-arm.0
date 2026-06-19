Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D11C8CD4F26
	for <qemu-arm@archiver.kernel.org>; Fri, 19 Jun 2026 13:26:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1waZEN-0004yy-Ch; Fri, 19 Jun 2026 09:25:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1waZEM-0004yc-Ef
 for qemu-arm@nongnu.org; Fri, 19 Jun 2026 09:25:58 -0400
Received: from mail-yx1-xb129.google.com ([2607:f8b0:4864:20::b129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1waZEK-0001om-0g
 for qemu-arm@nongnu.org; Fri, 19 Jun 2026 09:25:58 -0400
Received: by mail-yx1-xb129.google.com with SMTP id
 956f58d0204a3-662c360aa73so2327217d50.3
 for <qemu-arm@nongnu.org>; Fri, 19 Jun 2026 06:25:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781875555; cv=none;
 d=google.com; s=arc-20240605;
 b=EKmI7y7IvKLTmehle1wheY6whUlyoactHj7xz+TI/nklXVAjvGjEYBUHso4J8fEXCv
 F+OndBSM6VtBIBp2LSiNBlbfsX8NKB0G9GQ+296FyWyDakD9weM+oXvR1cuDfVcHCrNw
 4GEzTebPRUYDHbZ2iLks2UMf4UwSDwXY+WzOu5lnyVm7OEfIhMfImVJA5rNb0+yzabaL
 rBiXqgwnFilIiO0RS98Ib+0S7NvR1Eicto3NmkX3Hh3Yx3ndGQJf0OpHPcoFu+EnX8Nf
 ng3uefy7nw8UoSLZBdrfwOD3YLHh5xi7M80cEV2JjcajH3g0WNalgZHp9ZW+egceWPgI
 Sv1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=MkJ267OZeBdiIwykRhDLF7o/+Qi8Dfh7EeAZvTrZv+I=;
 fh=v9/Wbif8LSbW17CoYfVCyDm81QJFRDHskiM3s0vlZFs=;
 b=Iq0nYmFTDb3zAUbT0vZAuLiaF7xsH//+4wMbRt7DbzSZQYSBjtS2tVzZf8iNZ3uWp9
 1I3LPkT/WzwZYM2CYHFsiKH9PlvhhV50CzpqixkaCVWmEkOup7xh2ITm7wb5UlYVSJ2L
 r/umtFna8RJa3PLwzypayxpW+l9/lzCeSLP3I8LYBGfo5RN4iounnSU/4KYnc5M+nCZZ
 CJr3FKMveygVwfBp5pQjPLPNSpm/It8so4bv0oPz8OW7e8PZP6f8nYbDsU93/v9jLAWv
 dZOSeuZoMOPFi9qTXJAt1Bs7de/A5+6GsJfbsDF00A+leqlboQOTA/CJEEpm5JAV+LsW
 Vrqw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781875555; x=1782480355; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=MkJ267OZeBdiIwykRhDLF7o/+Qi8Dfh7EeAZvTrZv+I=;
 b=yZA+yj32DuOL4+/xGvjh4ANotvtGLdxVFGFfxUFEOKYpDZ63FMNw17081ERMYg6ly/
 JxuoW2gEtGGVN2+/a4EezDnuIC35oVXWibSVvIiiP5SgiqCzpiwCzGan97ejjK8IPbMY
 HUHbvv1wJ6ylAs04+nbGL3c5aaz1kJHzPDP/zuqRULLRwvDinQmE2JeU9HVCkzN+K+7f
 5F40DGDnzTtm6vf0kmlqPyLpw/jt4GNW6VMXyk8Jt0mgYfeuoX58YfMWwYLAVEQ/TMw1
 /Lr1hMPlaj8k+w3jpi6ijTVilIVRF+EAtnhB2OffYkNx9Fuc5HOJndoqVbMftopk4R8V
 W+NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781875555; x=1782480355;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MkJ267OZeBdiIwykRhDLF7o/+Qi8Dfh7EeAZvTrZv+I=;
 b=aZrVPiQAEz/QfVY+2ymL+376psH0ToomYqQNIkp3X/PEHsOw4kbTSo4EGbZw32eijV
 lbO92yARrWpUSoRgAu6roQh0S36yQyPCXjOXb54Muq9vTjJjFod0IfTpYtne55Rn0/nn
 DtDZzOYhLp7v5Yx8HK0C1fnqT9T86ClOpERsu2Bd52ATqNMc7jxikW5ww4FHZgjVhDPu
 jsedBUUH4VWYOhSEWTgK4lwn2LbgTi7g/FlerUfVe/r35F122T7uEV3C8mkxOC+X6dzq
 LYphhNACzmiEMNIlEp7jnMXLRj68wgPrYFIQNgFPOBLT8A+RvXs48+8RrAWrtqh5kgZ0
 V0Eg==
X-Forwarded-Encrypted: i=1;
 AFNElJ89ulZH0mpG6wAMpMxY28kLiz1MR2DVQNAcpj1fDRgAA/hmhZrnwwnnzHimf0ws2bIuggxXPCA7fQ==@nongnu.org
X-Gm-Message-State: AOJu0Ywb149ZoYZPx4j+fopQjLO56giZ5hi5Bs889dUk6DWvpb5XGBGR
 74BZtPSleNQaQ0HS6D4/vh7LAutjAMGlfK05fUyHZwLqAj4p4bTBAfFjnCS3r7YcAy93Mm7juL/
 vDUn6RRVWO2TQr1A4ayvAGFl44tJnqgrzyMUAlqXofw==
X-Gm-Gg: AfdE7cnc+91jfojHfOUjGpbXYmsPnkT64Bus9JkFuoh/KdDr+3oeogtDdou/7WMoC3A
 5qT3h5fd+TDe27IXSbQpM7LUGV9FRadBh8o2lcgLTpcttCGiNpO5WF71fWKahqmG1A2DT7boMMn
 vjA4FL4FZIMKVWMHHU1uJ/o5k3QqW4BXZxJbObAnomylgFQNLUuUs0Y/kULpyTMZxsOMwsOPEp0
 6K+CpaAQYukJgdNW1K7QHi2yLufMyjPbej1jTLeBVwMIgPGkBZhBVJg9yIrfj0WBheJMckC8kcF
 tyM16ufl3o9xXT3hsgrFbuXReyOWG4l75GG7scAAaRC7KJKuSnepTWFJ
X-Received: by 2002:a05:690e:12cd:b0:660:9c4e:a44d with SMTP id
 956f58d0204a3-662ffb9debbmr2806674d50.6.1781875554650; Fri, 19 Jun 2026
 06:25:54 -0700 (PDT)
MIME-Version: 1.0
References: <20260618041517.573469-1-richard.henderson@linaro.org>
 <20260618041517.573469-3-richard.henderson@linaro.org>
In-Reply-To: <20260618041517.573469-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 19 Jun 2026 14:25:42 +0100
X-Gm-Features: AVVi8Cchnmh601OAB8Yq4L0hXPGNl_WpOAT-D5yr8087_3dmWKNZVgZyVVe6vmk
Message-ID: <CAFEAcA-eQ9Wrd=6t_t47AJ2WbW2MNm7dmrycyet-LBFF7zhfZA@mail.gmail.com>
Subject: Re: [PATCH 02/10] target/arm: Implement FMOPA (widening,
 4-way fp8 to fp32)
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb129.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Thu, 18 Jun 2026 at 05:16, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

