Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B1A0C87FCE
	for <qemu-arm@archiver.kernel.org>; Fri, 25 Jul 2025 17:41:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ufMPw-0000Sf-I4; Fri, 25 Jul 2025 13:41:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ufMPq-0000Pl-OI
 for qemu-arm@nongnu.org; Fri, 25 Jul 2025 13:41:06 -0400
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ufMPm-0005cL-JA
 for qemu-arm@nongnu.org; Fri, 25 Jul 2025 13:41:06 -0400
Received: by mail-yb1-xb35.google.com with SMTP id
 3f1490d57ef6-e8d707b9bc2so1938134276.3
 for <qemu-arm@nongnu.org>; Fri, 25 Jul 2025 10:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753465260; x=1754070060; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=6ptGeKefNfVsGvOWbsC6afkNZAVEXj4XDKjGFCrdbOI=;
 b=mXdeAOt68U4lrpbqzEHWDel/YQ/Oudud9FN87XVngWDuVIk41sRs44SdnqbJ+mgBYi
 9KHFVYFNUb4Pq/5uGsIJKN9usxJFxs/dbJ3Z+tOv5pb+VWtvQSII0aTyfIHkx9bkF82n
 Am0itTrTizDDFlvdmx9bTq4fmjQaNDfQRXPKwax6cLQ/iLKSvAwEHh86cjNXbbU0rg8d
 VX2ME4xrmgV8ROmRBZZVrFfuUTXZc9l0ksvAQFTLXJgq6Ymx6jeHxoO0CEtwc4wIUN32
 jGARXzGi/vTtEjGllfApUkob0SoVEKLMwMnfXEv9h4AQZGqGFwhBjmr3nbUZyi9HFwtX
 hOeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753465260; x=1754070060;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6ptGeKefNfVsGvOWbsC6afkNZAVEXj4XDKjGFCrdbOI=;
 b=EFn2NYhVh5avg01yolehi4GgAIgPtlZGwOs75xsAtqT5PsNlUAWBMWO3l0B5wsJC2D
 qJJ8lZs9YzVA3IHGP3m27J9LGd8v6D6NMm/X6Ly14hQhHpjLGXLT8lXGyi4MHnIxo+JY
 Tmmac+Waq800vTKFD7YviQ/Cq6lvIp/vGhd2Ki/o6MJCkZx3fIFR4G1tRZ0P6C7tx0t3
 YMDWdQve6Gz7rb8QVJh8hb3/WwdHa/jApv9xTHxqMJ+N0LUVerfxRlLdW/0CoUkqufgy
 QzgRZY/0PypYXEsWnKTc2V+GNzwPHWnjHF6JStmtTZnk7eRMMRKJjcvfpXrwci81OvJa
 ltxA==
X-Gm-Message-State: AOJu0Yz5n8sfeMa2KrJhrYrS18CktJOHR+MBIHfyqmwI9Ubu3oIcFAMN
 7PYYops8R/JKyz7VckOloSnd5xoe8na7RFU0fMwLzOd2kEvyMOkoNL5gTMKL89XabRdSi7QC6ml
 zk1cqqLW/tqy75E493eILcRm7TIpo55mac4NkIaH12Q==
X-Gm-Gg: ASbGncsHaQZ1B4lNwrVFWh8kq4R4EqfgNPgsCmYlolE59LteM1Wr1k7X6eFJxFzfI4K
 lvRzqzhZXP9E02SI777k54xbU5NiDRatIJ6QPyAv/pmRf2vP+2m0IQBu7nOR//2apmiD+SiD5dC
 WmBWO+1H1c10hh6V+NWPxy2HeZgEhz+r0kFQ3JXUJPdE0whfJHCYzoiNTlCvBy9qdzrTy4H4p/2
 hS79CLo
X-Google-Smtp-Source: AGHT+IHESCqJn1NoZf6mIydjYRdyvvCbq6mHxkbsJ6RuQt3AbFAtMuX3hjsjmeHAYS8azB/BqiJ0uPalEl3lwwndAls=
X-Received: by 2002:a05:690c:688e:b0:70e:7503:1180 with SMTP id
 00721157ae682-719e329b188mr34111057b3.1.1753465260377; Fri, 25 Jul 2025
 10:41:00 -0700 (PDT)
MIME-Version: 1.0
References: <20250725142240.3760452-1-peter.maydell@linaro.org>
 <20250725142240.3760452-2-peter.maydell@linaro.org>
 <0b0882e6-906e-4a76-98cf-91c9284c4a52@linaro.org>
In-Reply-To: <0b0882e6-906e-4a76-98cf-91c9284c4a52@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 25 Jul 2025 18:40:48 +0100
X-Gm-Features: Ac12FXyVw8GKj3FuuJbg2CNAIghMs0ewFNXOhAsFMRQ9FjKUq8LonAj-_NUMKzM
Message-ID: <CAFEAcA9eH=n+uR2EupfUFNa5TacMHL=8XdSPdQ1nGw5ctuFaQA@mail.gmail.com>
Subject: Re: [PATCH for-10.1 1/3] linux-user/aarch64: Clear TPIDR2_EL0 when
 delivering signals
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb35.google.com
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

On Fri, 25 Jul 2025 at 17:46, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 7/25/25 04:22, Peter Maydell wrote:
> > A recent change to the kernel (Linux commit b376108e1f88
> > "arm64/fpsimd: signal: Clear TPIDR2 when delivering signals") updated
> > the signal-handler entry code to always clear TPIDR2_EL0.
>
> Ah, I missed seeing that.
>
> >       /* Invoke the signal handler with both SM and ZA disabled. */
> >       aarch64_set_svcr(env, 0, R_SVCR_SM_MASK | R_SVCR_ZA_MASK);
> > +    if (cpu_isar_feature(aa64_sme, env_archcpu(env))) {
> > +        env->cp15.tpidr2_el0 = 0;
> > +    }
>
> You can omit the IF and unconditionally clear the memory.
>
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Thanks -- just noticed also that it would be reasonable to
update the comment:

+    /*
+     * Invoke the signal handler with a clean SME state: both SM and ZA
+     * disabled and TPIDR2_EL0 cleared.
+     */

since all three things are SME related.

-- PMM

