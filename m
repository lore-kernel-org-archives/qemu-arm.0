Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05D62E9A048
	for <qemu-arm@archiver.kernel.org>; Thu, 19 Feb 2026 14:14:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vt4nT-0000cu-Jc; Thu, 19 Feb 2026 09:14:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vt4n0-0000Zb-Up
 for qemu-arm@nongnu.org; Thu, 19 Feb 2026 09:14:08 -0500
Received: from mail-yx1-xb12a.google.com ([2607:f8b0:4864:20::b12a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vt4mx-0002b1-Lp
 for qemu-arm@nongnu.org; Thu, 19 Feb 2026 09:13:57 -0500
Received: by mail-yx1-xb12a.google.com with SMTP id
 956f58d0204a3-649e456e8a2so855915d50.0
 for <qemu-arm@nongnu.org>; Thu, 19 Feb 2026 06:13:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771510434; cv=none;
 d=google.com; s=arc-20240605;
 b=Mafs685NU+2gVdNOGphyIk8ZPf3GuooH1fXOLVkaoG5b72irN2HoY++R8Xbsusuphy
 UN9/HN+BLkqz4YWXAuUAN38JjfwRyr0SAgZw851WnMNuG2WYmanJUVXd4DJS9KXQTf8X
 KpKbEqxsN2G8vZ+xu5xiO4b3uLBJ8hiUqVMhEbuLLn3gDqEzD51/dGBQuB22zMsCMgXy
 B2k9dj6lFK3N8MUUupbMzMRQFXasxim5uVGPQDewz36bgMozzLdY03PN+d83C8sU93iO
 Akz3kk6kqXEnjH8EeB8WrrMGjzZeFWcPJMRQHNFrCB0ki34tfauj9N0WGQdsEJGD17SN
 K7NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=bgZ/TOT60vVArHneLQAX4i6WfPGeu3gy/NUr8DkNhIA=;
 fh=87HpbgWqvzdwLVr3dKWJp7aZndbDneWV2TOtPoQRU9g=;
 b=Gu6qviTi4TbJ00R77yeX3hkprK6YXutx8sExJzdajpdwj+9p6NIzLYA85w7Tfx+zYN
 nQifNrbe1sP/o+pI4Yg/JgtD0SsuDX7ZuQUbVpeuheEkTvO2shBpfciPdMY6XN9UHHtK
 KJr3sHwP9A5RT3JKgq1IvlNIDZ7ZEM0lTyt6NsvHo/+kGjpnWnzdXv3Veq1KszigO0Lg
 Bl/vHe8HUEULv7adtEfd0u3dXH5Pvq7c7HKNdrYplQ1Srp6q4EdK20f0+dHmYte8YVcD
 WeibU0QfyJwkYbN9kf7H8KduciiIqKY06f8dH4nq0fsPYidwO8L1nBgM/yYGRps/ei68
 hmQQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1771510434; x=1772115234; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=bgZ/TOT60vVArHneLQAX4i6WfPGeu3gy/NUr8DkNhIA=;
 b=GMaMa5B5AtvAa6k8N1ULwkUnsmpQIlnhcEYuFsqVwAnYwxFd7Z+YOCNvxNkZ4IRGRp
 ogjiTe3b8W5XbjBZAUgRe6ljSXnHwHQ7rtngpf07Ot+rirBl53smCPj/qw3Xcdv0WWxR
 vqf96JNvwJfYU06q/NzPVIaqDg+7WArml9ZP8m+c9bIaVPwCRZwt3mHYSi4xwUJ4aq8c
 4lTokDfEKgc9RKv6/3nAOJrK1l75SAo3uM3vfRua56wvs6ds1N3iJdG6e3aIYY3lkfpv
 h+s1PpQEG0n+G+kuBKIvWSo6fPvTvPCUcoIo8QTVs0TGCZ/BvrpQMXkCv8Th29wqQpCZ
 Lgwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771510434; x=1772115234;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bgZ/TOT60vVArHneLQAX4i6WfPGeu3gy/NUr8DkNhIA=;
 b=YK9HfKC5eXkwMaPPYWyEtB6p2IFH0hU3mSaaNZSgEjsgjU8gqpRq1JmruFm5kikTwO
 sObOhXweaWknQ9ci4FsBbJhdRc2y+Q1QJGlS97WojwnFcpPXfqvx586gQIjUuDawabau
 WlZXRWbTJSPuPo/jOApLtGdTymJKnyH7HvDWOk+zRQdy+Tks2bGDFGAjv1AtM3LX+BhJ
 eI+5wXWRnDcZjbb3qYdMY27B8NMD09ahuxBUITyTLF1eNMm5AiHaj4Ri8LgoD2pgaajf
 tz5uFKyCFdPztwl8FFwYfCsaHXrkWyWZQt5FKAJyYN1JJaOKgvhGKNIyDDFYi1eXfGSQ
 lxSA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8XNLLuBz9UTLX5ubsvkXEAGfYVA7OBVy5ZWcFHCdz5cZQRLI65gizLX7Jp3hemKHCLF+qRMX7Mw==@nongnu.org
X-Gm-Message-State: AOJu0YwtVQ7MSYc3HH/ZaZo8aDuNhlADz5DZ90bSFXZ3QXUICchCvroh
 XFJNHiLm2tX73H71VZH6/3svkuf4yw4uqxD5ONZZHVNwt/EPUSbyoj5sKh6f11EGjLIt41D+qZZ
 AcS8yPIBCcZOqNxe+UIHVblvjJa2ovBT980UJTHg/kQ==
X-Gm-Gg: AZuq6aJhXpMOU781Lrm44OM1X0OKEipLc3tzyv6I6HwmupUSC50T6VWD3KgyqET2IXy
 fP1ooPz4/wS8Jei5094w4DSZKQ9hBG6JwHDPzCYhoLfPvlThbAYa7/yM6B1aW8q6wwxRx2Brbyh
 gDWyrN8q4h49QLGVmSn4HX7RflDUEmm42lAHD0oZ8Sc7Nj9tugObjDdieN/99Ctb5ZNcwjQZl6P
 KNR4BNN15FbJ1naHjgMKsING43LKwV/eekPgEgPCdZc/fgFGp9QDtvssl3Is6St5XN2TD81EIb/
 VdIRxo+ZIdlBedzK5aumxZcOQ3p67MIWFKjmP9hM/qfRAYBHHYBn4nerslGHGAP95edhGiPYcdy
 +XA==
X-Received: by 2002:a05:690e:e8a:b0:64a:fea4:fe6 with SMTP id
 956f58d0204a3-64c556e39e0mr3483068d50.92.1771510434335; Thu, 19 Feb 2026
 06:13:54 -0800 (PST)
MIME-Version: 1.0
References: <20260219140228.407513-1-gustavo.romero@linaro.org>
In-Reply-To: <20260219140228.407513-1-gustavo.romero@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Feb 2026 14:13:42 +0000
X-Gm-Features: AZwV_Qh6--QkokSaxBx2TwmZCgcqeQN3hwhjeC85q4T-C3wRfsZtTbKLFktjGOA
Message-ID: <CAFEAcA_GdkVJbgGm2j8v15PM2ijKF2hYBAUKZ2_W=g6XasFvCA@mail.gmail.com>
Subject: Re: [PATCH] target/arm/ptw: Clean up unused ARMMMUIdx
To: Gustavo Romero <gustavo.romero@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, richard.henderson@linaro.org, 
 alex.bennee@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12a.google.com
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

On Thu, 19 Feb 2026 at 14:02, Gustavo Romero <gustavo.romero@linaro.org> wrote:
>
> get_phys_addr_disabled() is called from only one function,
> get_phys_addr_nogpc(), and from two locations within it.
>
> The first call to get_phys_addr_disabled() occurs when mmu_idx is one of
> the following: ARMMMUIdx_Phys_S, ARMMMUIdx_Phys_NS, ARMMMUIdx_Phys_Root,
> or ARMMMUIdx_Phys_Realm. So, handling ARMMMUIdx_Stage2 or
> ARMMMUIdx_Stage2_S is not required in get_phys_addr_disabled() for this
> case.
>
> The second call to get_phys_addr_disabled(), with mmu_idx ==
> ARMMMUIdx_Stage2 (or ARMMMUIdx_Stage2_S), only would occur if
> regime_translation_disabled() returns
> true for these mmu indexes. However, mmu_idx == ARMMMUIdx_Stage2 (or
> ARMMMUIdx_Stage2_S) can only occur if get_phys_addr_twostage() was
> called, since it's the only place where ptw->in_mmu_idx is set to
> ARMMMUIdx_Stage2 (or ARMMMUIdx_Stage2_S) and that only happens if
> regime_translation_disabled() returns false.

This is true, but only because we never call get_phys_addr_for_at()
with an mmu_idx argument of Stage2, right?

-- PMM

