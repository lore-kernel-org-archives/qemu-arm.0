Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8D81FF885D
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Apr 2026 10:57:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wHg83-0006WE-H9; Tue, 28 Apr 2026 06:57:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wHg81-0006Vy-SX
 for qemu-arm@nongnu.org; Tue, 28 Apr 2026 06:57:21 -0400
Received: from mail-yx1-xb134.google.com ([2607:f8b0:4864:20::b134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wHg80-0004Bs-1M
 for qemu-arm@nongnu.org; Tue, 28 Apr 2026 06:57:21 -0400
Received: by mail-yx1-xb134.google.com with SMTP id
 956f58d0204a3-651bc8f864fso6166378d50.1
 for <qemu-arm@nongnu.org>; Tue, 28 Apr 2026 03:57:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777373838; cv=none;
 d=google.com; s=arc-20240605;
 b=S3M/RfksAppnjIp38nf4y1viEv/Yq0EA3p2TN2MFYu8CGlAf5kTAcjT+ySQ634YAzj
 xw8aOl6Zv8Rstyuu464Qz0bU5RkvcJ8CJ9FDNgn2zcuQe5zFsSwzmyW+g4TtTxkY+2ew
 zhGiTDtiLu5JXA5efWrhZ2DW/UGIZcRfapHnzqhqBOj7ZoEwpGf3HIF4dSpix9dwJ22V
 +pMYVGmfLPYqBAdH09f3c1LEDI3QeOlTBZJCvZiAhLSmTKJ0pGT81nDL0Gtw4cSQLAkO
 9um+Cul3bbFQgSlMTjMr0BH+3Q87TZAyN4985kzSDSd9yBLGMi8EeWZ9kVaU7u/KQD/f
 RpKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=OBAvmJZzvIkI3Xlg3xS7iYIU6kQ01BvEEeAFoUTxU+w=;
 fh=tmGos/+Y/lTWdub9lPkWPo77uQaU1cu32nJKaoNez7Q=;
 b=dBVoWgv/P/4TJenINmvuyQdTIAkRc19Q3+00W7tewOmLR/2k0wJ0H7kq6WTRkFr2Yh
 ChMdG9Y+FSdiZP/tvRUxH1Hbb39HBYUMfpvl6LGbc7wfqkeR68hE6CwFKYWaQS130WoY
 q/p6OhlXxxNhd2QEtqxFsKGe/QJYhH9Fa2Nz56X6zS6t6fNiPBkj6CwP1qmoeYSQZuBK
 KcyIO7zcpY/Q9p0X/gLc+ovYxeM09avDaGNpRqHhhnkzcUfNhJyOLbHDHdebJItX+nps
 tTZCo/Q1l7bETmcAZvuVKlt4n8Ho7OqYdg32F9QJjb0L8mLNVShCinoJ7yDwL+VQFI5b
 b0Zw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777373838; x=1777978638; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=OBAvmJZzvIkI3Xlg3xS7iYIU6kQ01BvEEeAFoUTxU+w=;
 b=aLwCteCHggpCBl5y1sy+5ixw29ttjkM1n5uW9VM38nnrdPX1X0gg4Kyn7JHoiwjVND
 r0kWPerFbGdcl/cHStdKtCSJNsiXw0+54NJLW9cG7nm2aWdTklL9LOtDl8/wD17YBwbE
 lwzWeYV7wTJmjlMTifAgh8pKvoMKGdW85rLyhO/tEPbpTcZ85qc+LEcMX9XBraEXGHVu
 xKit/WIVlUC8VERFc5hyBt+Ar6vZNnZdZ06TmYEOOl+UL1NSZENgIZH9iiYYi3gXsPSw
 rV40vrcrJ3dobekXU4kr/VTmh3pe7qF4liNqI1o0zWbUl2BlYIuWZTa7/21Ouu0OXMyJ
 bFAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777373838; x=1777978638;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OBAvmJZzvIkI3Xlg3xS7iYIU6kQ01BvEEeAFoUTxU+w=;
 b=oRKabvg5KBiI5qSYwz6vEu7zmP+RbSuPebmIkru0UGT2hAQciw+VO+R4XDjb31upF7
 8Au1mOk3Phf0uzwE89dXknmVbzhjRrzZsVHwheb6CPMXNWUiTAr2MEAh6xtBQO2jXfBB
 BbTxUDysZIWZZO341I1IRBhe74wEueSUeiicRnC6LbBy1P9iJTs34+StQt0P9dK79Vds
 bIUwSHWnXY4FmrZyvPVlu1exL0uutr/a2ABS21zW1zQcIubCGWeAZQmU2+X2Bheg3Coo
 YT64lKsh7FvtPP35GDXwWydbIoszmNKb9LXQqE+CpodmU2tmyPMgqdU7xjKvQ056Pirn
 gnQA==
X-Forwarded-Encrypted: i=1;
 AFNElJ+2wlayYXJoa8qNy+b1Woqfv0trSbD+cSokHtqQwIhKxrJ6y8IiwIKm+8uNFI2EPh4z0DMhhnJ0YQ==@nongnu.org
X-Gm-Message-State: AOJu0YwhfmTEjKtKHgUZDdoSL6C+wXEbjN2/hMxmHv4wl5SjAV6/IX0u
 Wr2BS2+Y1+EVyZP+SEgLu4XEaka9wXfeduUIzxrzOqM00DBcu2xAe7RNi5HF0rcdph6lIEBYeAO
 4OC6W23VhrkKmO2NAvUeIZ9zgPY5IlUNiZhT4br8kEw==
X-Gm-Gg: AeBDievpvAs1sKa7wkYp5Xj7Os1nb6S2GzyrYx1UoKWX2U/ZJHxrNLWE53vyrHvzT2z
 Dr7xJAZTEw9g0uESuH3udExDhsITLMUEEJ65YoqUgeooGLoe7u1/Vz1wMD8/2FSQmJFJKIOUix+
 9sz/Wcs0nnsdmqdVDjndHlX5Hqt6QtlGloKGJMNQv8icJOoe0ZgsXyiUlbU+p4QqV191LaEPzFi
 zVpN0DnX727MIM21OcfoWwVJcwnZQ76+aGVEOZhu/rYB7XpkcrgxvvBwlgGSWg5odUnR9KBAN7c
 wLNYCFWBUSqg784ltbwOdPvIsYi9JBPmE79Dw5ZXOTndnYsu5qK7PgN6zbeLrXg//DGdvqn/H0e
 P/7/yywXYgGmm
X-Received: by 2002:a05:690e:1482:b0:649:e6de:8f4a with SMTP id
 956f58d0204a3-65beee55532mr2113624d50.42.1777373838377; Tue, 28 Apr 2026
 03:57:18 -0700 (PDT)
MIME-Version: 1.0
References: <20260409035015.132370-1-richard.henderson@linaro.org>
In-Reply-To: <20260409035015.132370-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 Apr 2026 11:57:07 +0100
X-Gm-Features: AVHnY4IAs_L7jY7gvXtX6WYx0bSTSZKudbd0tYKZwesq7MzoA-dFzrprx2Zz-k4
Message-ID: <CAFEAcA-fht7aCnsScrhAvuP0=pnPAnNOJMwCTo5wqhHaU-eeaQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] target/arm: Remove bswap_code
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, pierrick.bouvier@linaro.org, 
 philmd@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb134.google.com
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

On Thu, 9 Apr 2026 at 04:50, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Based-on: 20260407222208.271838-1-pierrick.bouvier@linaro.org
> ("[PATCH v11 00/21] target/arm: single-binary")
>
> Version 2 here should probably be RFC.  This time around, all
> instruction loading, and more decode, is done by translate.
> A new CPUARMState field is added for passing data to EXCP_SWI
> and EXCP_NWFPE.
>
>
> r~
>
>
> Richard Henderson (7):
>   linux-user/arm: Restrict regpairs_aligned
>   target/arm: Only define aarch64_untagged_addr for aarch64
>   target/arm: Segregate target-specific user-only fields
>   target/arm: Store SVC immediate for user-only
>   target/arm: Recognize linux faux BPKT
>   target/arm: Introduce EXCP_NWFPE
>   target/arm: Remove bswap_code

I'm not sure about the SVC part, but I'm definitely
not very enthusiastic about the BKPT and NWFPE pieces
moving into target/arm. I prefer the existing split
where (as far as reasonably feasible) target/arm is
architectural stuff, and things that are matching behaviour
of the Linux kernel for user-mode (nwfpe, odd bpkt insn,
user-page helpers, etc) stay in linux-user.

thanks
-- PMM

