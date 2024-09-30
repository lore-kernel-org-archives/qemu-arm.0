Received: by 2002:a17:505:70c3:b0:1be9:327d:8ee3 with SMTP id lw3csp1197578njc;
        Mon, 30 Sep 2024 05:29:13 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXa6Xw3mP/E0XqdZ4GJmd5pvTz6K3j+zEbILbyyiM9PuN/7uPJjFFt6c73dfTHK2a9G3AnPv1t5QjVKhw==@linaro.org
X-Google-Smtp-Source: AGHT+IGHhJTgfzdgag7RVjMG95o3qKi+IO2P4BjFIN+HVleoXkiYgzEy5A1/MSbXvNKBwoWya/KB
X-Received: by 2002:a05:620a:40d0:b0:7ac:ddff:3ca8 with SMTP id af79cd13be357-7ae378591d1mr2444268585a.32.1727699353342;
        Mon, 30 Sep 2024 05:29:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1727699353; cv=none;
        d=google.com; s=arc-20240605;
        b=ivHIrkZoAceGF/1zvb4lBVSwQlV2NkW/NjD30Kqqi/kptbqFz7upzt7+ylDaR1KyIX
         l7cY++F6eP05MaQiwnk16k+/PGlz5ap7tzAXQo6XCcK4uC2TzEXqF6IPERaP67GhU7OI
         S3RynfZC1bcDf1seTW9J7XHU9tEHKvKe7lU1EM/gpEbJpmqkZjBiv3OXy7zFlDNvym2y
         EAglEHWoe/gNuIdfAMi+W/3/ix7TWl1tnygaYG3e9M8tBQU4MNBXyDLtzOJKAjzrcvVp
         yyfQ0skocDMMBXwGriGvF8M/Pn96qtk1hoClAvSMua1UXctn8kHToYKqe42muPb5o3Oz
         G2ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=0V2ooaSZDv2XXQbSvVndMiwMWq7csaOW49gY/30mtH4=;
        fh=tLiRB78Rei7PxENeXh9tu7SLCelEf3oBsHAvLXU+UPk=;
        b=RjAd93kZy6LAGHrZEsGK18VgziZUyk3rw7DeRbGTDoY2ZM9H0hmOMXvZX8MWp7+pKI
         gWedjZijpRzUGKIgYVGBY0xzIeUK8VC4UCWonovZZYOletf27sQW7N3//Y3tVs8YsYOM
         eJcovxCENFN1AYhGokB+Ud2QN6sVM5C4J1lT3lmM9r2Hj61YroiPEoknUStIyuECxszH
         FckeHbNLVJTtKzc9ukASZd9KjO0/NtpmpyaVK3vIRt2Ebidci0qT4Gnshq8U5LGL8Hoh
         yXYUddAHeBHV/VkIJCwCu8D1hAN82jSzL0nuEL9vydNYjeDkS1shI/X7TIWdAXFzi1q1
         vRZA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uUkBWpV9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7ae3789e637si807774185a.712.2024.09.30.05.29.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Sep 2024 05:29:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uUkBWpV9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1svFWW-0000fn-RN; Mon, 30 Sep 2024 08:29:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1svFWV-0000el-OV
 for qemu-arm@nongnu.org; Mon, 30 Sep 2024 08:29:07 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1svFWT-00038E-Uc
 for qemu-arm@nongnu.org; Mon, 30 Sep 2024 08:29:07 -0400
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5c89f3f28b6so511960a12.2
 for <qemu-arm@nongnu.org>; Mon, 30 Sep 2024 05:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727699344; x=1728304144; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=0V2ooaSZDv2XXQbSvVndMiwMWq7csaOW49gY/30mtH4=;
 b=uUkBWpV9L7/qnCWhxwIKx77AuuNIjlqSQoBP7UF6s2hwkKdPa+AASmKuVusTWB3Yug
 KPxES7hIryzwm7ngZT4IvTxgA2t5oxl4QTjDgrNYdqZMEL/Crv/w8fEOB/uW6a9rRqde
 HCFjzOX/NtOcacOastqoRqEG5Gtur55pBb1y4lyfnLDQG/CyPt+pleaQ5qlHEZBzAKAK
 LNUz+Sx40GyCxeClQoZiVKyJ77kNrQSjVzSL49o2//E2XjVpOkaD9jKnh1fz7gM+W2DH
 BuHY27NiZEMbvI+J/6+Njsi2iEF76Z4rsGm5Wt3q2O6zw7ci3IG3wIjr1QBGTja6cqVy
 6IzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727699344; x=1728304144;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0V2ooaSZDv2XXQbSvVndMiwMWq7csaOW49gY/30mtH4=;
 b=JkpKrbSzWga3077JKVfbUGK+iO2gSyLhvSn5ViLth9SbcmwQZS+P41w2HlWc+wO4XT
 UBJzROBw/8fcmApFjRrupPA2r5N7fj7vQF4pS4+Y3OdIs5OpkQIkDoh5gy9xWlatCAaU
 k3kj1LKPTWEOrq10b3VsCw5vYI/I1vCeOqQvqZqL3V+uGTvu2TWgo6CqKSm90bVSNON9
 IFsLluBg0+IkKfLAiHDpJVAddMrQdUSI6TUTGd0V0AEydiFL/KvcxY8tk+dmfKo39Ohn
 OglxDzlnfxcv+9uFln+6Vhw2MTDnuuaIbiuIRuRxBGTJMdlRyovfzPAixyDi8gPuiqtp
 SkZg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXTukASGvey3m7rzBh7djwIUcnMedD7dY7wScZsbh0wTcIZMmlmL+o0yA8h+fl+AuG3s7MP8c0Qpw==@nongnu.org
X-Gm-Message-State: AOJu0Yyv6ADQ242wiPi1FbkqvwOds1G8wDS0CMKX7p8iKUDuWjAPEccp
 dkDqcJYfIL8bXG3RYNPQBzmF59q6XsH1gu4y6nf2KfMNCIwFAeI0p342LNIvmuas7py/1UnVI9v
 15TyoKxIrZk7+ioLHUn9DmaStMFIOUyb5JeqZ3og3b9gzb++5
X-Received: by 2002:a05:6402:2687:b0:5c3:cc7d:c29d with SMTP id
 4fb4d7f45d1cf-5c8824d381cmr9885928a12.6.1727699344179; Mon, 30 Sep 2024
 05:29:04 -0700 (PDT)
MIME-Version: 1.0
References: <20240927071051.1444768-1-ardb+git@google.com>
In-Reply-To: <20240927071051.1444768-1-ardb+git@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 30 Sep 2024 13:28:53 +0100
Message-ID: <CAFEAcA-ba6OaxgmO5HeEOu=kNNwL9sVjzOSJAFbW2X586_+QvA@mail.gmail.com>
Subject: Re: [PATCH v2] target/arm: Avoid target_ulong for physical address
 lookups
To: Ard Biesheuvel <ardb+git@google.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
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
X-TUID: FoHqEjrdU5xq

On Fri, 27 Sept 2024 at 08:11, Ard Biesheuvel <ardb+git@google.com> wrote:
>
> From: Ard Biesheuvel <ardb@kernel.org>
>
> target_ulong is typedef'ed as a 32-bit integer when building the
> qemu-system-arm target, and this is smaller than the size of an
> intermediate physical address when LPAE is being used.
>
> Given that Linux may place leaf level user page tables in high memory
> when built for LPAE, the kernel will crash with an external abort as
> soon as it enters user space when running with more than ~3 GiB of
> system RAM.
>
> So replace target_ulong with vaddr in places where it may carry an
> address value that is not representable in 32 bits.
>
> Fixes: f3639a64f602ea ("target/arm: Use softmmu tlbs for page table walking")
> Reported-by: Arnd Bergmann <arnd@arndb.de>
> Tested-by: Arnd Bergmann <arnd@arndb.de>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>

Applied to target-arm.next, thanks (and tagged as for stable).

-- PMM
