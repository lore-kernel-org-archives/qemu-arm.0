Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E60B2CD8CB2
	for <qemu-arm@archiver.kernel.org>; Wed, 10 Jun 2026 00:35:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wX6uS-0000Uj-8x; Tue, 09 Jun 2026 20:35:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wX6uR-0000UE-Cv
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 20:35:07 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wX6uP-0006Oe-NU
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 20:35:07 -0400
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-842338c18e0so4308316b3a.1
 for <qemu-arm@nongnu.org>; Tue, 09 Jun 2026 17:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781051704; x=1781656504; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OwyS1Wiic2VNAU1rCFnLe+H3c+LW6I/Om6kCehcZheY=;
 b=FoXwtlvmLB9yoTE1aUF9PySf0aeXk7h2CxiS8ltr0dRpNo7mS+lhNpdV6TvoU7LnkI
 qb0KHnZWzoeHMp+JzLok9Nmo/rpEDPNB50wir/2Xo7/Eh/qIlj3KF8RGBxt0qp0djAgo
 Z2y+BxabGXll9b1AEqZCne/5cutpyfcdT90mgicEnuZ50+pQ+jUaIOqniaoKI/Awi2kv
 ByTd50y/uAJNNHhinaSGvoQa+nmFCjBLKdd2IgG12erx+msL9OcltxFyNjVHfYf/RnFD
 0InjVy0bm25QQcoergzPepvfZumAVMopoHqCFGp/bDMSviSyFDn9kyWGpo6h6pWvls2C
 7Cpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781051704; x=1781656504;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OwyS1Wiic2VNAU1rCFnLe+H3c+LW6I/Om6kCehcZheY=;
 b=n2EdHkOtst0n9++XJ6AzN4SHSlUByu1f8PFQRQTkMD3lH1QNyP7eyx1guJa9Bw+6BI
 oVxB2HuFeUo3ediMyczfNQ4/s9bJcXAjZRYUfPoL8axSD5PqmRJtg532cVaxUKlnRY73
 yAHYmjwap1+vzRhg+5fOJrUmA8Rytl4kOpMFbdBGxMBZGCIR25M7XaJhRltOUvHF1Uco
 0sn1oK9is7oJ9lNhz8tUPhw9HyJVVDrVmaj9pdPeP9PMjaQrCVaB4VCkPupLWQmzoYvN
 2qCeZBoBTdffoVlHJdAv0x8g0wBlzoi4mhaab1okwIb3qP0Wr8mfUK42GjRhUoFXw+gH
 FLJQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ/GA3+NvWUCXDpzuD1+TcQC9+end5nVyKLvqeEh5TmLRz4V9FFeoKvXiVUnWIe8fXInaX+BOmBTOw==@nongnu.org
X-Gm-Message-State: AOJu0Yw5XhPBB7Wd3E79WIdQan89z+BFYAlJ61rggzwGYg0/rwkQEWyQ
 xPwgK5bMb1DVMzQwmRVBHEizLEymnW/lNTZpOEtzwYAXjsbTUsaPZmRv8/bhoyUwo5w=
X-Gm-Gg: Acq92OGQ7OtPAVBlQ2YbKm75exw6C5a2Z4LkLaCFrJ4iyIobW9nTf0x9JWkYFB1GDp0
 z9wBotkkRrdqdElc6H74OYDTc9GmYfjVsVIGP1JlVw16Ktg4b88QUg+rfuG1nh6HOepkxjZMQfw
 L8SVnSsYjsVr/q0Rw8B4M0IZfa4grHntAYEHEBb97zCU4UC3hHKtKuoMQacO1MO5G1fObTl66eB
 w83uy+Ae0cX9cOtId6u7bM5SMU9Vcad4uKOQ8q8qvYP6TQx9sNSlQbf9EnYmmRLv2knkkRf8DWU
 rRKmS6oScxzovN4Fict1cHpMWVb692N2XdW9bqY9zsLT7fmH6zr33VjgA2V/gJlaDzVhJ9DmiVw
 PtezdqfuiG5lS48Ivi7/KWdVsC1pZzca10MZtXqddjfOGsN6ZyvP3oZI4Jgjlr51IOJ8p2b+uHo
 EEsVbP7BOiCHtbQJQnrjdSRHE3qnH11c9GgdmguvqSUxQi6cI=
X-Received: by 2002:a05:6a00:9093:b0:827:3d52:5d1a with SMTP id
 d2e1a72fcca58-842b0a880f2mr22791657b3a.0.1781051703917; 
 Tue, 09 Jun 2026 17:35:03 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.142.33])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-84282883647sm26291191b3a.36.2026.06.09.17.35.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jun 2026 17:35:03 -0700 (PDT)
Message-ID: <bb67f565-e26c-48af-bc0e-121b17464a5d@linaro.org>
Date: Tue, 9 Jun 2026 17:35:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/27] tests/tcg/multiarch/system/memory.c: remove unused
 variable
To: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-arm@nongnu.org, =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>, Peter Maydell
 <peter.maydell@linaro.org>, Gustavo Romero <gustavo.romero@linaro.org>
References: <20260609214745.772536-1-pierrick.bouvier@oss.qualcomm.com>
 <20260609214745.772536-2-pierrick.bouvier@oss.qualcomm.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260609214745.772536-2-pierrick.bouvier@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
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

On 6/9/26 14:47, Pierrick Bouvier wrote:
> Caught this since by compiling this file with -Wall, -Werror.
> 
> ../tests/tcg/aarch64/system/../../multiarch/system/memory.c: In function ‘init_test_data_s8’:
> ../tests/tcg/aarch64/system/../../multiarch/system/memory.c:97:18: error: unused variable ‘bottom’ [-Werror=unused-variable]
>     97 |     uint8_t top, bottom, *ptr = &test_data[0];
>        |                  ^~~~~~
> ../tests/tcg/aarch64/system/../../multiarch/system/memory.c:97:13: error: unused variable ‘top’ [-Werror=unused-variable]
>     97 |     uint8_t top, bottom, *ptr = &test_data[0];
>        |             ^~~
> ../tests/tcg/aarch64/system/../../multiarch/system/memory.c: In function ‘read_test_data_s8’:
> ../tests/tcg/aarch64/system/../../multiarch/system/memory.c:384:14: error: unused variable ‘ok’ [-Werror=unused-variable]
>    384 |         bool ok;
>        |
> 
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>


Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

