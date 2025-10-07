Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11B12CCA476
	for <qemu-arm@archiver.kernel.org>; Tue,  7 Oct 2025 14:33:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v68jx-00031h-6j; Tue, 07 Oct 2025 10:32:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v68jp-0002s0-MN
 for qemu-arm@nongnu.org; Tue, 07 Oct 2025 10:32:27 -0400
Received: from mail-yx1-xb12c.google.com ([2607:f8b0:4864:20::b12c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v68ji-0005Qu-8R
 for qemu-arm@nongnu.org; Tue, 07 Oct 2025 10:32:25 -0400
Received: by mail-yx1-xb12c.google.com with SMTP id
 956f58d0204a3-63605f6f926so5382690d50.0
 for <qemu-arm@nongnu.org>; Tue, 07 Oct 2025 07:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759847529; x=1760452329; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=sKOA9E9hfsHXu+quxVOiSehpvkuENVfLjD63D2OSoOc=;
 b=SLebCTzO3gP/ntA3Abkwy2DSa+XjlxtQbSNRnfOzJLhOuvWQne85it+Ackw021VT9l
 ZaGGaGybXDORib08rJMBaFMraZxoSJnVwH4+/Un9sxwjuIU8BLycXuojWFEL8FebiqMb
 I3QeAt4JEW+FdFNEC2Zi9jw4gIdGYwIaPxzhSIcnuP39A6LkIjRZNhpQYQqwVBwaNUHm
 YsrH1PkOMBYc05ZxIIeIpGRr3Z/ViLVKXpPj5ubX2fwd7yeCnz+UElq2jwZIvSN0atpa
 mYtoEhCxUXdonFzyrUJVD4ehY424NS2m6yAOZH3/fBu5QmjGt9lK3FyGJUacWnCBuV+W
 eeNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759847529; x=1760452329;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sKOA9E9hfsHXu+quxVOiSehpvkuENVfLjD63D2OSoOc=;
 b=tede/DkNqoP59gOlKbRKaKIKnpHgO8k89U6+H+LqQQBgOGoDTpjbHZcZr/+JcMxYop
 WBTDqU1V7NqNxIgjwzglPbv3l7ImId8iV2ql+DL4+8c4PzSeWXPOlanKaUI4wTg9E1yl
 uhAHorniF+0UH0Debn0fEXo7NIwOK2YjcF0bMW3ibYgjr1Zmf/yFMNIvZhaJFZ/O9BpG
 YTHiYM/GBlb1GaQVMQB7U0Mftr92EGH/qhQo4jjlr6V5NSimkpk3rKC1mceJzN2b0LRN
 3Hc2R2Nh0jcsMb0YYvw4R+gcsTK3KiHbzD6rEXLR/xwcb+r54wf+gSicsMPsCxbQtl5T
 suwg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXmhK4Whc00mZUaZe7JRC8R9h0j5uE/R3eJytH+OYYNo7/Y+h7erlV8C1KVEKulqCvCnU0NTuIOWw==@nongnu.org
X-Gm-Message-State: AOJu0YyBhmdcuz1HxfASRKSHo8iG01MuC9XeYjOQxT3YEQDZMG7PqPht
 9feYDSaKVrP12tQmtxNkgnJzZW6fsn4kEORxL0efPADenEGwtzAgMdG8FFH7yTthmRD5R8EJ+8F
 pezquc6hHdl5Jkqt2/UAs2i3qDm4amt7jks2F8SwrvA==
X-Gm-Gg: ASbGncusVqh6enHCvZMJPF+cxRtZw7CeukzCG1YkFw/JbRCHKCr8DD0si4n9ebb/KYn
 xTCSTTUHk+HC/8+OBx/plXekP2gfIL5Jhg0M4ipBoHiBdolX030dPHWYMydPs0gwEGHVq16Tzoj
 uolXRaoba4H3ytzm5KUeQNcvuITB1KP3Y7/bza/NfzxZXXksZrgOwWkFVom4Ua20l/DFxHcDynN
 CFuih+1cl5lSjmwHZX/ZqzFziRUDw1GNU4K
X-Google-Smtp-Source: AGHT+IF8d+SIM/kQ/TIW3zZsRUsKDEZ99kI4w91DmjgsNbZXSq3LbOK+2QxCcVWETpWY4xSS7wt2fIOJiVYejmVQyRM=
X-Received: by 2002:a05:690e:441:b0:635:4ece:240c with SMTP id
 956f58d0204a3-63b9a0f33a9mr14036083d50.44.1759847528613; Tue, 07 Oct 2025
 07:32:08 -0700 (PDT)
MIME-Version: 1.0
References: <20251006001018.219756-1-gustavo.romero@linaro.org>
 <20251006001018.219756-2-gustavo.romero@linaro.org>
In-Reply-To: <20251006001018.219756-2-gustavo.romero@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Oct 2025 15:31:57 +0100
X-Gm-Features: AS18NWDBgJ0OoOhhuY0ttbt-awJv4OFLDnAztx3cvUk8zvtt8DvQkpPbPrnO7EQ
Message-ID: <CAFEAcA9Z4sw382fV9iKLMBpCF4O02q5=OiJtUKJtpkcy5GvMbw@mail.gmail.com>
Subject: Re: [PATCH v10 1/3] target/arm: Add a cpreg flag to indicate no trap
 in NV
To: Gustavo Romero <gustavo.romero@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, richard.henderson@linaro.org, 
 alex.bennee@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12c.google.com
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

On Mon, 6 Oct 2025 at 01:10, Gustavo Romero <gustavo.romero@linaro.org> wrote:
>
> Add a new flag, ARM_CP_NV_NO_TRAP, to indicate that a CP register, even
> though it has opc1 == 4 or 5, does not trap when nested virtualization
> is enabled (FEAT_NV/FEAT_NV2).
>
> Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
> ---
>  target/arm/cpregs.h | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
>
> diff --git a/target/arm/cpregs.h b/target/arm/cpregs.h
> index 57fde5f57a..abee72c9bf 100644
> --- a/target/arm/cpregs.h
> +++ b/target/arm/cpregs.h
> @@ -136,6 +136,7 @@ enum {
>       * identically to the normal one, other than FGT trapping handling.)
>       */
>      ARM_CP_ADD_TLBI_NXS          = 1 << 21,

We should have a comment here documenting the flag:

/*
 * Flag: even though this sysreg has opc1 == 4 or 5, it
 * should not trap to EL2 when HCR_EL2.NV is set.
 */

> +    ARM_CP_NV_NO_TRAP            = 1 << 22,
>  };
>
>  /*
> @@ -1158,10 +1159,14 @@ static inline bool arm_cpreg_traps_in_nv(const ARMCPRegInfo *ri)
>       *
>       * In particular, note that the released sysreg XML defines that
>       * the FEAT_MEC sysregs and instructions do not follow this FEAT_NV
> -     * trapping rule, so we will need to add an ARM_CP_* flag to indicate
> -     * "register does not trap on NV" to handle those if/when we implement
> -     * FEAT_MEC.
> +     * trapping rule, so a register flagged as ARM_CP_NV_NO_TRAP indicates
> +     * the register does not trap on NV even if opc1 == 4 or 5.

FEAT_MEC is in the Arm ARM now, so we can drop the reference
to the sysreg XML while we're touching this comment:

    In particular, note that the FEAT_MEC sysregs and instructions
    are exceptions to this trapping rule, so they are marked as
    ARM_CP_NV_NO_TRAP to indicate that they should not be trapped
    to EL2.

>       */
> +
> +    if (ri->type & ARM_CP_NV_NO_TRAP) {
> +        return false;
> +    }
> +
>      return ri->opc1 == 4 || ri->opc1 == 5;
>  }

Code changes look good.

thanks
-- PMM

