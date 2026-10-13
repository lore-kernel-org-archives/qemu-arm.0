Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E641CC6B0E
	for <qemu-arm@archiver.kernel.org>; Tue, 13 Oct 2026 16:40:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xGfYM-0005fW-1g; Tue, 13 Oct 2026 12:40:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xGfYJ-0005e7-LE
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 12:40:35 -0400
Received: from mail-yx1-xb132.google.com ([2607:f8b0:4864:20::b132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xGfYH-0007fW-LN
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 12:40:35 -0400
Received: by mail-yx1-xb132.google.com with SMTP id
 956f58d0204a3-675617e81f9so3428760d50.3
 for <qemu-arm@nongnu.org>; Tue, 13 Oct 2026 09:40:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791909632; cv=none;
 d=google.com; s=arc-20260327;
 b=fP91KWXIe74iTPmgEbfo6nfwdGhKd0fycDGgSRCI4jVufzPvRylDaIpjuEjcYgkqNv
 MMYLKHKZzYk6ENnjvIP/ahwXEBIT06vsqPgP73OMPCu5FNv5i1pCHumge8Gmok8PjEJu
 Mc5jHoG1pLG5GA+vXm9uqFtjYB6grt5U/eFxWnFXXFpSi1/Mx4MzKQ3KjF9Zh4WdGKdh
 hgeTS3tZ+ziMgsv6DqvcGNu/RJl355YWYKUkcu6J+8Ijw+U9YF59JGzk64MdVRdaZvTd
 ySdHA1w1aXdcXBkXP7ME+JuTgjSdRSdTTfOuZN6Ud8QFhHM6D64/FQdbgO+cDjA0HHZH
 EFdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=CZB13SoY7s56TQlUZUubaTBIDi7BmsRBABpk6t2VEiw=;
 fh=dC0wVSZpAallrlMYcVPu0C2E0J6eXgafSQouI8u9EfE=;
 b=LZUMkjJUZd63VGQf2i5Jh1d4wC7eoNqUfXJw9jd3uGoNYXNtPHwfivrSeVMeyK/uaQ
 bXC7qD1D8R8cRtq9zneodTH3SKaVNUDcL9hZcI3JvHgDNQ8SK7F5ji0uI+yE9xbxx9qH
 k4FzFA2oKTLXsr4RS+oEu4N3ImtewAMBI+wyhtuZ+PyvAUvNAKzVecM36ICWC9lL1ZiL
 smjVkrsX+l6o8suk5SrcGbcycbOZYI9oyBlj1vDzkhd/Uq1O+evX0fsw+ltD2wwZYzL5
 Etizb6l27WjM4NCOeDB6mc/zWqoUCgeOIs2Ol9FcXJY2ohsMztolKpSRjh8bFdVz0Qxt
 a4Lg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1791909632; x=1792514432; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=CZB13SoY7s56TQlUZUubaTBIDi7BmsRBABpk6t2VEiw=;
 b=Q5MulU12DTiN8VfISfJZ1mGbPga09zhB6RhCXkAQX7BhpwaTxXbgl2611rWTMM3EiC
 SG4I6+zP9/7eYF7JJBsRGheAREEzfBonrw6pKWXbuH6Ia3jME94LkXg6KhdAmkjkpD4y
 TlBEszkzUV8Bj2/gMsEXFb93Xd1sABWk7w573hs25dcV86qCklooAbEpBmhiB7z3jw5W
 IslJ/5UVje9JCE66PYaOMFcxLlHHlJ2U5gtDoXSVD0QSeT0BaP0s3iuqbMikjYxFKQFf
 JaUjNTLBJSB/tkv8g6/NT5jvimxG2L/ua/jOYCW3binKZzMLMkzcWY/PQdfCuFpS9g0j
 YP0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791909632; x=1792514432;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=CZB13SoY7s56TQlUZUubaTBIDi7BmsRBABpk6t2VEiw=;
 b=F1ng92ehfovXafv/Rhsu2QeGtO0NDBmThtfVze7c0kMU7XuIAvB8a5IdSf3juhpznD
 atrTRhK3vMiFj3oViwfQFJWJdf2ZJnRon1+B+zqGmOJo7fcGtNvL69ApHGf2jgNLMhM6
 P9/EIsH72yxMacoGqHyW/+ANf63/ki4oZVEboyX7LwbxcjwhkVChaTkWAiPxWKV0Rw7R
 24Yb0tS9KmoGDmwR/doio+DWAXwkZmmyHA3ibWMHM0q9G0eelA6kAufYZCSjsl6WYvoe
 +kc+17U9FmnkJNXxLexb+qG+48WCNbDwmP7iL/Bi96XjHtzFsvznDu8ExLQl9uVLhbky
 qtgg==
X-Forwarded-Encrypted: i=1;
 AKwUvBzKZ9zyWPOvyarLplwxj1OgbYrZn738hTz5+zB2iSYtv/wGs7xIpA2NIqdADbPBX9xLKnvfk6+Yeg==@nongnu.org
X-Gm-Message-State: AFq9FYIcx51mJpmD80mGS8KEZK6JccO9CCvpSTvOdhHbHzL65s9ZR0IE
 pARVOsUnsit1OskCaIABAMBbzvb62I7YZNYlPiAIP9HJj8+2QugI2dLwMmUlHjqNRy7gdYX+uU+
 uSM6EGmqD/WBD2SG7i197hEELuP5dPkTCEuQihVF3YQ==
X-Gm-Gg: AYBFou1EuyiVO701YhbCkpWAAbUdXyQyapDD1vLj50gyJQY0jEdAh5/ZUWPfGCwrkHF
 +rFL+2kYNDellPukVYayah1MMDDe7lvAdhby12fhlhKiagMVo/BInP6kd29DvLSR76W7ShQ6WcR
 F0utjW8pCPS7SJ6SdX0gLgRK6aMjfLrcu3KRAt0awRdrElfEhM+QfKh4phgXTSZ78AS7nliaLu7
 2vaYFmK3f7dydQl8XM91sMsVhQMEC99lc5YA/oD0sgr8seN5jWvwR13u+j5woF+2gUWizRxIpSY
 DqrkYvLrBJKvYnwzmHdz1FpIJX8tWmvNE7tX7ZmcdLtLQpIF+QJsDYHKw/m1UCYPQ5y1p51XTPj
 CNrmBx0OyuqcxPxsmZDrU8+aufyh4MM7/jUx2Jg68EEJM+8Gb5A==
X-Received: by 2002:a05:690e:4847:b0:672:a098:bfa4 with SMTP id
 956f58d0204a3-67936ab0daamr2537417d50.90.1791909631857; Tue, 13 Oct 2026
 09:40:31 -0700 (PDT)
MIME-Version: 1.0
References: <20261001-mshv_accel_arm64_supp-v6-0-aefe5e76a0e3@linux.microsoft.com>
 <20261001-mshv_accel_arm64_supp-v6-10-aefe5e76a0e3@linux.microsoft.com>
In-Reply-To: <20261001-mshv_accel_arm64_supp-v6-10-aefe5e76a0e3@linux.microsoft.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 13 Oct 2026 17:40:18 +0100
X-Gm-Features: AclHuK_NjqwOPZWco8Vc2BgSrGfdPxPnad7xzW4EdX6JpcefktIaYrYwQbrC4Ak
Message-ID: <CAFEAcA8g=U+sP8i38Vvv_AA1fXnnXSVjVkfHfHhu77xKhEGLmg@mail.gmail.com>
Subject: Re: [PATCH v6 10/14] target/arm: extract MMIO emulation logic for HVF
 & WHPX
To: Aastha Rawat <aastharawat@linux.microsoft.com>
Cc: qemu-devel@nongnu.org, Magnus Kulke <magnuskulke@linux.microsoft.com>, 
 Wei Liu <wei.liu@kernel.org>,
 =?UTF-8?Q?Doru_Bl=C3=A2nzeanu?= <dblanzeanu@linux.microsoft.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, 
 Anirudh Rayabharam <anirudh@anirudhrb.com>, qemu-arm@nongnu.org, 
 Alexander Graf <agraf@csgraf.de>, Pedro Barbuda <pbarbuda@microsoft.com>, 
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 "Michael S. Tsirkin" <mst@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb132.google.com
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

On Thu, 1 Oct 2026 at 11:52, Aastha Rawat
<aastharawat@linux.microsoft.com> wrote:
>
> - Move common MMIO emulation code from HVF and WHPX backend to
>   arm_emulate_mmio() in helper.c.
> - Update HVF and WHPX to use the new helper and shared types.
>
> Signed-off-by: Aastha Rawat <aastharawat@linux.microsoft.com>
> ---


> +/*
> + * Emulate a data abort syndrome for MMIO/guest memory access
> + */
> +int arm_emulate_mmio(CPUState *cpu, EsrEl2 syndrome, uint64_t gpa,
> +                     const struct arm_emul_ops *ops)

Please don't put more stuff into helper.c. It is big enough
as it is.



> diff --git a/target/arm/helper.h b/target/arm/helper.h
> index b1c26c180ea..503404112d4 100644
> --- a/target/arm/helper.h
> +++ b/target/arm/helper.h
> @@ -3,8 +3,24 @@
>  #ifndef HELPER__H
>  #define HELPER__H
>
> +#include <stdint.h>
> +#include <stdbool.h>

osdep.h includes stdint and stdbool for you, you don't need
to include them manually anywhere.


>  #include "exec/helper-proto-common.h"
>  #include "exec/helper-gen-common.h"
> +#include "target/arm/syndrome.h"
> +
> +/*
> + * Callback ops for per-register access during MMIO emulation.
> + * Each hypervisor backend provides its own implementation to avoid
> + * syncing the full CPU state for a single-register MMIO access.
> + */
> +struct arm_emul_ops {
> +    uint64_t (*get_reg)(CPUState *cpu, int reg);
> +    void (*set_reg)(CPUState *cpu, int reg, uint64_t val);
> +};
> +
> +int arm_emulate_mmio(CPUState *cpu, EsrEl2 syndrome, uint64_t gpa,
> +                     const struct arm_emul_ops *ops);

helper.h is structly for the autogenerated prototypes for TCG
helper functions (hence its name). Put your prototype somewhere else.


> diff --git a/target/arm/syndrome.h b/target/arm/syndrome.h
> index 2a6fa903f27..8b4cc7f7b21 100644
> --- a/target/arm/syndrome.h
> +++ b/target/arm/syndrome.h
> @@ -106,6 +106,53 @@ typedef enum {
>      GCS_IT_GCSPOPX = 9,
>  } GCSInstructionType;
>
> +typedef union {
> +    uint64_t raw;
> +    struct {
> +        uint32_t iss:25;
> +        uint32_t il:1;
> +        uint32_t ec:6;
> +        uint32_t iss2:5;
> +        uint32_t _rsvd:27;
> +    } QEMU_PACKED;
> +} EsrEl2;

Do not use bitfields. They are not portable (notably, they have
endianness issues). syndrome. already sets up FIELD() definitions
that you can use with FIELD_EX32 to extract subfields of the syndrome.

> +typedef enum {
> +    data_abort_lower = 36,
> +    data_abort = 37,
> +} ExceptionClass;

Don't define new versions of what we already have either.
These are EC_DATAABORT and EC_DATAABORT_SAME_EL.

> +
> +#define ARM_EL_EC_LENGTH 6
> +#define ARM_EL_EC_SHIFT 26
> +#define ARM_EL_IL_SHIFT 25
> +#define ARM_EL_ISV_SHIFT 24
> +#define ARM_EL_IL (1 << ARM_EL_IL_SHIFT)
> +#define ARM_EL_ISV (1 << ARM_EL_ISV_SHIFT)

This also is reimplementing what the header already gives you.

-- PMM

