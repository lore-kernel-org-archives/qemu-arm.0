Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7808CCD18D
	for <qemu-arm@archiver.kernel.org>; Mon, 13 Oct 2025 13:36:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v8IiD-0004v7-12; Mon, 13 Oct 2025 09:35:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v8IiB-0004uI-Kh
 for qemu-arm@nongnu.org; Mon, 13 Oct 2025 09:35:39 -0400
Received: from mail-yx1-xb12e.google.com ([2607:f8b0:4864:20::b12e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v8Ii9-0006LA-Af
 for qemu-arm@nongnu.org; Mon, 13 Oct 2025 09:35:39 -0400
Received: by mail-yx1-xb12e.google.com with SMTP id
 956f58d0204a3-6353e91a04aso4495369d50.2
 for <qemu-arm@nongnu.org>; Mon, 13 Oct 2025 06:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760362534; x=1760967334; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=BbGPzHO4D2+JbEkVm+sHzPDR4Z5KWXP3eIew5Y6DeQI=;
 b=t1b+Iq7P2X4a/ImQhpxv0ni1j8e/ffqD7qqzTu1CIIxzloANVrO/ar/AWiWBLpdbsb
 7UwRMnz0trXNi/Mzo3cxutzTD312YfKeyOaJSpUgDA0jqDr/I2rKiiYmumthDyVyJWXW
 Z3bMtNinMCAzFoemACWhGEUFR/Re+1vg6ZS3hLEqovcNA8p+tw1x+6OO5AsLLZqtzx/Q
 DohkimgQVXJ8TtVpyZ5AOG/OYs586TO6Z2hOz2npAzmF34YLqvY1kf2BEXTepreXbHgN
 /QYjdHBLrL2gm4sTi925cc2Z3UE+qKyOA1SG8fblEv71g62qbHf7v1Ta/izHZNJjixrk
 W8Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760362534; x=1760967334;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BbGPzHO4D2+JbEkVm+sHzPDR4Z5KWXP3eIew5Y6DeQI=;
 b=WnPZpTH0Z9LANA1jTf/bXnO9xELoyLDTc0ypZRpedmnE/lAMuKEGoLu5RY7QwP3Q4Z
 yx7AxSCP6/v3t047SaSzl4EF2YnwsCvAbyz7ZRidWnX2CX8utyl+v0Lx32JPG5JdqJCR
 uK/artp5ZtZr2w75Brj7gICWLkisAytZO+fxwc05K1a5b+5udaUjvZbNO14N8CPXLbsr
 YzDNXClTuBz093mm+4QpuG03Verh/r0Wb+QF8UrYV+06xhO/HEe9qOk0PgZCAoJQU52r
 +iK0a6bxitAs0e/w2/dITkz9g0Dszf6WJ0xXp919PgoaFhTK4f5PGsyP98fckxM8BHYo
 J5UQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX1BOQbW9WaR/Y060a4N7sb7tC/ML8EA9ayI4BskgtIwixR3mnNuORPyOKIOCt064QbjOS3vtMhbg==@nongnu.org
X-Gm-Message-State: AOJu0YxUX+plbN2DEYjcAMUkxbHZ5i2w6LBBSjq4Bk+BmXZO2Oo+Ef6B
 2H8FJkZysBt/h/uurfx2BVAlssiUQTM5vfDjEd0/PTy68n+aMN7KV3mHqQTSNaws/KNVIoUcFYA
 xSI58hfUW0JRPwxpq6DlqF+3j42ueEFx8uKfqsdJS4Q==
X-Gm-Gg: ASbGncuSOPB1feYMsF8mvK11Ks9RLLstWPcZ18W1RzKb2X33JLLYYSR4vVfEEuCAanY
 ltACbMJSmhBqr0x54JNFD8OFcfK9B/zprsYk7tgezu2V7N8TZRCM1cNsqswjtu/h8xQ17/SYRy5
 XPPLsq2ATmQHYywP9/YE4puVxpV3aZzlvmsexz4Q+GUtZMndJL644t8a7TF1e+Jvei303Y+1d+j
 Qzu7kH3PLq8vN+SngYKxYKtHghdaF8=
X-Google-Smtp-Source: AGHT+IHTOsARVZqb37VE0phudY4MW1lSyw3KxCAjhJvK4vggJm6E5BXrxTG7UZQyM+vOnKPVJWaoMDejNOEUjwpfZi4=
X-Received: by 2002:a05:690c:316:b0:721:6b2e:a08a with SMTP id
 00721157ae682-780e16d29f5mr347191427b3.37.1760362533826; Mon, 13 Oct 2025
 06:35:33 -0700 (PDT)
MIME-Version: 1.0
References: <20251010201917.685716-1-richard.henderson@linaro.org>
 <20251010201917.685716-2-richard.henderson@linaro.org>
In-Reply-To: <20251010201917.685716-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Oct 2025 14:35:22 +0100
X-Gm-Features: AS18NWC8mj_KiNvpg0_UFwT8VB_z802EXIg5h-ZtywS2vElYbowxv29q16aPwqs
Message-ID: <CAFEAcA_CmQ2w0Waa6K_vOPjibGhcE5oUG3GrhaC5r1t2-QXgYg@mail.gmail.com>
Subject: Re: [PATCH 1/7] target/arm: Add isar feature test for FEAT_AIE
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12e.google.com
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

On Fri, 10 Oct 2025 at 21:19, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu-features.h | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
> index 37f1eca3af..579fa8f8f4 100644
> --- a/target/arm/cpu-features.h
> +++ b/target/arm/cpu-features.h
> @@ -1364,6 +1364,11 @@ static inline bool isar_feature_aa64_s2pie(const ARMISARegisters *id)
>      return FIELD_EX64_IDREG(id, ID_AA64MMFR3, S2PIE) != 0;
>  }
>
> +static inline bool isar_feature_aa64_aie(const ARMISARegisters *id)
> +{
> +    return FIELD_EX64_IDREG(id, ID_AA64MMFR3, AIE) != 0;
> +}
> +
>  static inline bool isar_feature_aa64_mec(const ARMISARegisters *id)
>  {
>      return FIELD_EX64_IDREG(id, ID_AA64MMFR3, MEC) != 0;
> --
> 2.43.0
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

