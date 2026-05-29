Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3288CD5BD2
	for <qemu-arm@archiver.kernel.org>; Fri, 29 May 2026 08:45:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wSspw-0008AB-DM; Fri, 29 May 2026 04:45:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wSspu-00089Q-Hn
 for qemu-arm@nongnu.org; Fri, 29 May 2026 04:44:58 -0400
Received: from mail-yx1-xb12f.google.com ([2607:f8b0:4864:20::b12f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wSsps-0001Hz-En
 for qemu-arm@nongnu.org; Fri, 29 May 2026 04:44:58 -0400
Received: by mail-yx1-xb12f.google.com with SMTP id
 956f58d0204a3-65c1ba7eeb6so13510787d50.1
 for <qemu-arm@nongnu.org>; Fri, 29 May 2026 01:44:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780044295; cv=none;
 d=google.com; s=arc-20240605;
 b=P4kq34MByK/VINSFHuCbbakF8IC3mqZ+UeFZVESzlSAq4Dolz4Yy5+35Vno9QCSw1S
 5irY+aJgKDBYvnyl407R30AGSFVHYHR39AqhJMxUSk3FnrOH9D/gUoOI6CSYu5wfKnVV
 0hUbnArWCisYaIWA8ESUn0GcitqqM96Ovd1juj9OYpdYl6uvkhA2Icj27PaB+n+w4W+7
 DZVHwtATfW02ZDTcxEO91LTlnd4kK1h5yD3sNuzdkQqYTsMKWrePZ2LFFR+0786OslyQ
 2mH3yN44csus1vV6HbtWQbVSrxncP5tbyV8laYPdwzyxoFw0/IzJrvN9MURtPr5p388b
 O9Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=ipZEZnY2uFh45UZO5kuYZhzJoHYpiPS/VC9qdhC/puY=;
 fh=s+xhdkpxGcasYv5WHTkLIFHyFtBtMZntESBkY2mx2F8=;
 b=UzU6yOewm9P9WQfGIrUEyTe1j5vBqqqufqYkESlQtxPeipI8AXy2+VUP2BwmOWD822
 SFetsmA/3tzCB6V+PUhizupji3LWm56KLwnZI362n65RalWPZvYn8iEfls6HIO+3j39U
 B5uiU/CtAB3+MysFkaFTf0/H2/zSf/bqHLnjCCxsE3Y3nKIPI4PTxlNCg/aJJPM66qOW
 aNsq20htYKcYHbvmvegyzpo9r/p4rkl3gykFZeoWyp52/iTp63L0+SI03Kc1taQdBy6O
 UJ0mYHoRicS/ChYYKG+k3/wF3HsER3FKE8SHH6jDCpmSm0D6CBMgmUBtphBlCk/YIrK5
 lPiQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780044295; x=1780649095; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ipZEZnY2uFh45UZO5kuYZhzJoHYpiPS/VC9qdhC/puY=;
 b=M+/McFIZEU21xAxy1Uv8tioePl6mANfnyOHnkpnrl3AUQKo4lx4AsW9n3smzeT1mYr
 I3PKpkcUa8twWtLt7MzJsqyAG1IqB/qX/j5iJtxi9dIFTKobLOW0bhMB0h7nJU8VcXyr
 AWN+CHt7yYFnVYwvoIh4z9zk6/wnMIia+4kxalq44b9wf7lYly3kgiKMno162RBXQcy9
 IC1VkEZGqJd7nbBzWeGiEJW9T482KrNBHJ3qVYvWJIX2bv5OT30S2JueivQYN8srw59V
 NqT8dQjyhZITsXRRjdaWu6PFjXI9G93nL+qUwg+Nw1Zeb5aS4YcLAuiWM/sXSK++0aSq
 c1Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780044295; x=1780649095;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ipZEZnY2uFh45UZO5kuYZhzJoHYpiPS/VC9qdhC/puY=;
 b=fFmqG6OK8MJj30rDT3IsmY08KilgC2Ibtzr/bOHiG7w6y2fTRp6PdQqAK3M5/zxK6n
 tImKIHuWrw6PBHT0hKdm1/X8rD9EX7lYQmqhsw2e6W0m5jzOqt6u9ZQUpQKnQsK72goa
 MxnEQuXcDbFAOWPRNCtaowfiNE9ilR/sj+q7bbgfc/BuNQTRwGkqil/mKVWw2K1mcvSy
 chgJ4GsDXtp61WJ+cRu9l55iKWA9LSC9f7AlGFWsybWoPLcmrQ1s2M1HM8PME51dssQ5
 +Pxz7+QmYPT2XkL7J97UF/aVUK1/CYRttWVVB7WFjI152B15I5Lg+yiErxxsrSgauyOy
 ilDg==
X-Gm-Message-State: AOJu0Yx3OeF/4ePDrW4GSkaeTsTX4MPkWHDwcpmRoEgd1dXUynW5Ucds
 FrrjWbCH7ctodlLat2Kip1zFPzX+0L7ce9IIc5GvHZc0HYQUonsiE2YH6I6QLfRwcLt18WDFQWx
 hm0YeQt8sivsNSMZZeM6Tcuql6QpGWec4jF9WS0p0QA==
X-Gm-Gg: Acq92OGiMBAWmgagu0lvbHkQFaDxbnCdDPuTdYGbB9v6q/9TBVrLlb5LqobkE+oyaSZ
 jcWF1Mdp2zKpefHF8HJCSEFsT/X22vqESUE+BES0rRZEvN+FLnXMjLVE+vIVsuunSFwPsohhKjD
 RMAW8e5zAXSwYKQXGUZ93Dp9bTSxqJg9HrNvGy+uU3Khr4nU+9mxx027zdeYotvtTS0Hfulvyrc
 cYDAViu/4UC/4dB5lUTJ4wPb+d1Kj/FhL4M4JDEayl7KTPgMvuJI4oYkHiXUGMQimIwRpz1BQDA
 JCoknFsf5lwjBZsTK+b70CJiZwuBxAKOzWoXepbBpHSs8PfRbsQ4Duj3ECeZJUZSQYPZHRM68bd
 Su69Wg7AY/OuY
X-Received: by 2002:a05:690e:12ca:b0:660:4563:869d with SMTP id
 956f58d0204a3-66052e3f5e5mr1265392d50.28.1780044294725; Fri, 29 May 2026
 01:44:54 -0700 (PDT)
MIME-Version: 1.0
References: <20260519153249.31100-1-wrigjl@proton.me>
 <20260524002617.69593-1-wrigjl@proton.me>
 <20260528181857.92087-1-wrigjl@proton.me>
In-Reply-To: <20260528181857.92087-1-wrigjl@proton.me>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 29 May 2026 09:44:41 +0100
X-Gm-Features: AVHnY4LbDlVkKYAAbHqs8VIeawFzR_t1Wbi7pfbdCrdt8ZBMaYpiFbvxH1AVSUs
Message-ID: <CAFEAcA-qwpS8sMqYfR8WgHxoZvhVW1eMO6C1uXqWvK_5hkL9sw@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] target/arm: implement FEAT_RNG_TRAP
To: Jason Wright <wrigjl@proton.me>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, richard.henderson@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12f.google.com
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

On Thu, 28 May 2026 at 19:19, Jason Wright <wrigjl@proton.me> wrote:
>
> Implement FEAT_RNG_TRAP for RNDR/RNDRRS and enable it on cortex-max.
>
> v3:
>   - helper.c: give ID_AA64ISAR0_EL1 a readfn so that ID_AA64ISAR0_EL1.RNDR
>     reads as 1 whenever SCR_EL3.TRNDR is set, regardless of whether
>     FEAT_RNG is implemented (Peter Maydell)
>   - cpu64.c: keep the ID_AA64PFR1 fields in register bit-field order;
>     RNDR_TRAP now sits after SME and before CSV2_FRAC (Peter Maydell)
>   - docs: list FEAT_RNG_TRAP in docs/system/arm/emulation.rst (Peter
>     Maydell)
>
> v2:
>   - access_rndr: return CP_ACCESS_UNDEFINED when FEAT_RNG_TRAP is
>     present but FEAT_RNG is not and the trap is disabled (Richard
>     Henderson)
>   - Register rndr_reginfo when either FEAT_RNG or FEAT_RNG_TRAP is
>     implemented, not only FEAT_RNG (Richard Henderson)
>   - Fix document number typo in Patch 1 commit message
>
> Jason Wright (2):
>   target/arm: implement FEAT_RNG_TRAP for RNDR/RNDRRS
>   target/arm: advertise FEAT_RNG_TRAP on cortex-max



Applied to target-arm.next, thanks.

-- PMM

