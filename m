Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A20BCCD3436
	for <qemu-arm@archiver.kernel.org>; Fri,  8 May 2026 13:56:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wLLgK-0006gd-D2; Fri, 08 May 2026 09:55:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wLLgF-0006fa-ES
 for qemu-arm@nongnu.org; Fri, 08 May 2026 09:55:51 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wLLgB-0004LB-5X
 for qemu-arm@nongnu.org; Fri, 08 May 2026 09:55:49 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-488ba840146so18202295e9.1
 for <qemu-arm@nongnu.org>; Fri, 08 May 2026 06:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778248545; x=1778853345; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RkYiSiXEG8VtBXFSrZkOuCGdCZfTZPWsV+8t5J2QHn8=;
 b=k6c1mSR24nhMUQrF/kLGGvtfBgEiUyeXfBYQITQocMkuN7uNNxI5fmDzz+WD6Oo/1p
 xfiZGe0SL+ad7fqzuOFczIZcROXplIovmaWKk64pvJGYdGac59lnJS1j6m15cytuwqwY
 UmfYMhjHJFrYu1H0LLG77I8/AibnJX2plz6L5biK8za+qUcXWZzj708UTVDtSfJkK+qE
 hrN4VCFq38vhKwfeIwhsrkqpGuQXVidl4AJZCVnqgdrOYstLU6PpO2C2U9ct6xmhIl6c
 fMmmZpZAqMagbFATtcnWYbrqVAemUDQT7uLzNLDby9HtcqqxUX2WL+2+SsnQ+PbsWrlj
 YurA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778248545; x=1778853345;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RkYiSiXEG8VtBXFSrZkOuCGdCZfTZPWsV+8t5J2QHn8=;
 b=do/3/lELL5DK7+bxxYW6jt9e79wRHDcp5t98faLzQeBWzseBb/ZSkVczhV3IHO/R2Y
 iLCiDsdhwEgqh88vDItg8OH18vxsmS85iTO3XTbAyigLx/QJUv/QjPJq04EKJSuJV74T
 txal4PpwI1XFOyigK2c+2xGIzktuBXF7Cm9tUcyup7adP8DYievnDqT9ugHRmRWBmrbl
 ejC5B9sqLWQMu4n+yEc/m6AsFmd5QVz6OvwLZFGk2OiKDlEwtXHZMpBk5wnJ4rpBh8YD
 hoK3GXIAd8hbH+6bfKNHlYzZgTWNpD5pgwbLZhxNehMSOdBmwGqbKDt7ONKFP0NF1CS9
 rGjw==
X-Forwarded-Encrypted: i=1;
 AFNElJ9DooMbTS0p7FbfebBp91gqp4Zq2EL6i2gCX4F/LJCMs/RyEKLpoPJkilGJCwkn4Db01GVZrZxHeg==@nongnu.org
X-Gm-Message-State: AOJu0Yz2SBNmAnHS7N/JVZXCWy7UIurcktv8z84L9GP7dZL7zJ+yjl6x
 wT/IWWVT/byRZ39ozLhdNyTynKJHVacLZlqhgKFhtbAgrfwfY20v4gYGiS1Mqbt6GE8=
X-Gm-Gg: AeBDies1RDKthUZgqPIYpMlYAn4TgsdwSvoiQntRSAuIFYbY0Yg79K+ZPqHeISwQhTG
 VaSUl68UMvjv2Z8U7LdgLQA0PY8VZvxddI7sSFP69ku58MNfS4YhzRvp4c4v9ICxGAYL8061SFT
 AGgQx2/MpnMRpILhAcS86BUSaeNBkMsOusLco+Ai5kznC7jlu18QFLpb7Lqfch0e7QsZESla5r7
 RMNBj3Hv0GJmx5b4RDE8zvHNo6K8in+D7mGZcOQuP3Fz7RF2X5SihN/FQTyRnVXdhcK/LqNeYsw
 JG+gxGlsaFmHXNBincXuKkDfI+GufZVeODF5vwQVTLLug3Ur/+J6/FocgdQRnDZyCc9dGTuDAKx
 p6HQGLv5wOi3RZKRTIk/CJ0JcEXDIxcF2BqENs/ccG2HhZYfjwHkQ39QET0UQlSKCR4xt/o45zQ
 cUMsOYiq3S7y5t/6cxo+NbOBRhLjfnTQU8aQ==
X-Received: by 2002:a05:600c:628e:b0:48e:60a3:220a with SMTP id
 5b1f17b1804b1-48e60a32224mr103071145e9.0.1778248545084; 
 Fri, 08 May 2026 06:55:45 -0700 (PDT)
Received: from draig.lan ([185.124.0.195]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48e68ed0f29sm66993145e9.2.2026.05.08.06.55.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 May 2026 06:55:44 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 55A965F877;
 Fri, 08 May 2026 14:55:43 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Santiago MC <santimonserr@gmail.com>
Cc: Kohei Tokunaga <ktokunaga.mail@gmail.com>,  qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,  Thomas Huth
 <thuth@redhat.com>,  Paolo Bonzini <pbonzini@redhat.com>,  Richard
 Henderson <richard.henderson@linaro.org>,  =?utf-8?Q?Marc-Andr=C3=A9?=
 Lureau <marcandre.lureau@redhat.com>,  Daniel P . =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,
 WANG Xuerui <git@xen0n.name>,  Aurelien Jarno <aurelien@aurel32.net>,
 Huacai Chen <chenhuacai@kernel.org>,  Jiaxun Yang
 <jiaxun.yang@flygoat.com>,  Aleksandar Rikalo <arikalo@gmail.com>,  Palmer
 Dabbelt <palmer@dabbelt.com>,  Alistair Francis
 <Alistair.Francis@wdc.com>,  Stefan Weil <sw@weilnetz.de>,
 qemu-arm@nongnu.org,  qemu-riscv@nongnu.org,  Stefan Hajnoczi
 <stefanha@redhat.com>,  Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: Re: [PATCH v4 01/33] tcg/wasm64: Add tcg-target.h
In-Reply-To: <CABE6Nn2h0z+LPOsh++mqEqMcyA3=LJNUq1WfpU7Fu5PQFEY0Mg@mail.gmail.com>
 (Santiago MC's message of "Fri, 8 May 2026 12:41:28 +0200")
References: <cover.1769407033.git.ktokunaga.mail@gmail.com>
 <1061c734ff63e09ea0544ebecf09abfd6fc25b11.1769407033.git.ktokunaga.mail@gmail.com>
 <CABE6Nn2h0z+LPOsh++mqEqMcyA3=LJNUq1WfpU7Fu5PQFEY0Mg@mail.gmail.com>
User-Agent: mu4e 1.14.1; emacs 30.1
Date: Fri, 08 May 2026 14:55:43 +0100
Message-ID: <87y0huj99c.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
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

Santiago MC <santimonserr@gmail.com> writes:

> Did this get merged somewhere?

No - it needs review before it can be merged.

>
> El lun, 26 ene 2026 a la(s) 8:03=E2=80=AFa.m., Kohei Tokunaga (ktokunaga.=
mail@gmail.com) escribi=C3=B3:
>
>  Since WebAssembly instructions vary in size and can include single-byte
>  instructions, TCG_TARGET_INSN_UNIT_SIZE is set to 1.
>
>  Signed-off-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>
>  ---
>   MAINTAINERS             |  5 ++++
>   tcg/wasm64/tcg-target.h | 61 +++++++++++++++++++++++++++++++++++++++++
>   2 files changed, 66 insertions(+)
>   create mode 100644 tcg/wasm64/tcg-target.h
>
>  V4:
>  - Removed tcg-target-reg-bits.h as the 32bit support has been removed and
>    TCG_TARGET_REG_BITS is no longer needed.
>
>  diff --git a/MAINTAINERS b/MAINTAINERS
>  index c1e586c58f..470b15eeb7 100644
>  --- a/MAINTAINERS
>  +++ b/MAINTAINERS
>  @@ -4107,6 +4107,11 @@ F: tcg/tci/
>   F: tcg/tci.c
>   F: disas/tci.c
>
>  +WebAssembly TCG target
>  +M: Kohei Tokunaga <ktokunaga.mail@gmail.com>
>  +S: Maintained
>  +F: tcg/wasm64/
>  +
>   Block drivers
>   -------------
>   VMDK
>  diff --git a/tcg/wasm64/tcg-target.h b/tcg/wasm64/tcg-target.h
>  new file mode 100644
>  index 0000000000..f00761d19f
>  --- /dev/null
>  +++ b/tcg/wasm64/tcg-target.h
>  @@ -0,0 +1,61 @@
>  +/* SPDX-License-Identifier: MIT */
>  +/*
>  + * Tiny Code Generator for QEMU
>  + *
>  + * Based on tci/tcg-target.h
>  + *
>  + * Copyright (c) 2009, 2011 Stefan Weil
>  + *
>  + * Permission is hereby granted, free of charge, to any person obtainin=
g a copy
>  + * of this software and associated documentation files (the "Software")=
, to deal
>  + * in the Software without restriction, including without limitation th=
e rights
>  + * to use, copy, modify, merge, publish, distribute, sublicense, and/or=
 sell
>  + * copies of the Software, and to permit persons to whom the Software is
>  + * furnished to do so, subject to the following conditions:
>  + *
>  + * The above copyright notice and this permission notice shall be inclu=
ded in
>  + * all copies or substantial portions of the Software.
>  + *
>  + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPR=
ESS OR
>  + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABIL=
ITY,
>  + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SH=
ALL
>  + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR=
 OTHER
>  + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARIS=
ING FROM,
>  + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALIN=
GS IN
>  + * THE SOFTWARE.
>  + */
>  +
>  +#ifndef TCG_TARGET_H
>  +#define TCG_TARGET_H
>  +
>  +#define TCG_TARGET_INSN_UNIT_SIZE 1
>  +#define MAX_CODE_GEN_BUFFER_SIZE  ((size_t)-1)
>  +
>  +/* Number of registers available. */
>  +#define TCG_TARGET_NB_REGS 16
>  +
>  +/* List of registers which are used by TCG. */
>  +typedef enum {
>  +    TCG_REG_R0 =3D 0,
>  +    TCG_REG_R1,
>  +    TCG_REG_R2,
>  +    TCG_REG_R3,
>  +    TCG_REG_R4,
>  +    TCG_REG_R5,
>  +    TCG_REG_R6,
>  +    TCG_REG_R7,
>  +    TCG_REG_R8,
>  +    TCG_REG_R9,
>  +    TCG_REG_R10,
>  +    TCG_REG_R11,
>  +    TCG_REG_R12,
>  +    TCG_REG_R13,
>  +    TCG_REG_R14,
>  +    TCG_REG_R15,
>  +
>  +    TCG_REG_TMP =3D TCG_REG_R13,
>  +    TCG_AREG0 =3D TCG_REG_R14,
>  +    TCG_REG_CALL_STACK =3D TCG_REG_R15,
>  +} TCGReg;
>  +
>  +#endif /* TCG_TARGET_H */
>  --=20
>  2.43.0

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

