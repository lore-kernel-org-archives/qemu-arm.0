Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9EC2CD4F3C
	for <qemu-arm@archiver.kernel.org>; Tue, 19 May 2026 14:40:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wPLby-0005fH-AZ; Tue, 19 May 2026 10:39:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wPLbw-0005en-SC
 for qemu-arm@nongnu.org; Tue, 19 May 2026 10:39:56 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wPLbv-00068u-6S
 for qemu-arm@nongnu.org; Tue, 19 May 2026 10:39:56 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 98e67ed59e1d1-3697421c2a8so1853400a91.1
 for <qemu-arm@nongnu.org>; Tue, 19 May 2026 07:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779201593; x=1779806393; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=202QMYTQ7NJ8jn3M0yRrPJKhAhs/TO9y7qYmFJnvhI0=;
 b=e0W8s8pjV4vxlXzQLssvyEVbpFVKoDt1bcEatxE374x4WsCOkNUbMx3zz9ggXWO+0L
 546fUWpRNXa8n8Zetff4g/N3zlkWSp8aIixnIkx1eEqlTgp/fV/+ct4eczryPcpep83g
 Iw9uiGEMlZukSQ955p9EXNkxLXHLxc7M7YH/7n4zhroxr4b5ZMbG0Qk102SVsmpLOebJ
 no1IxTbaRVaWX++VPvAie9rVPz1qPKvzTrtz8NrvsjF75UbiVYR/g+dyE/5OMGXooZaX
 E82r66P4hjBAiBNj8Pl4ceGzhxTnQ4EspGcffAmt5pXFLjM3B43aBXzVzw9se4CE4I9b
 1sWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779201593; x=1779806393;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=202QMYTQ7NJ8jn3M0yRrPJKhAhs/TO9y7qYmFJnvhI0=;
 b=oBumJu32yrwbUYQQas6xsj8IMXKnf1ZiFsKZq7AK9eT1CfY+Tbpf9En87Nn8Vn/7La
 j3IlccATgWUS9caXlG+JqmMiF8DFtMpKokNr/IGqrLV9DA+7z9JvX1qO83MIOrraZr49
 ES7YhZZG+CMWlhyX7xunL8rqq8K93OIaCE/0Pyplivhaqsy4WrSxriWe56kN8km83xq8
 9Dfjpl6oGZFyqWxwzsxRlzw/5bmHBYFYKM97+kCae2IBxC3PO+qntAKzl9FZkYXYTptV
 5SoYHgUvb1Gp7ki0bz8w6ggew4nZ8dKG6+GGyKCWOOxIL6TxH51a01DML118UQWghm9X
 VPOg==
X-Forwarded-Encrypted: i=1;
 AFNElJ9yoZiGRR4BnP2uqp8AlvSrllOAvrYgO8iMd4WVNykABJEssBHbs/vlsSnpvNxL2axRSLmKMK8sCQ==@nongnu.org
X-Gm-Message-State: AOJu0Yyrfh4F+lnvJQ9C2iLaTDaBL2DxuLpKh56KaC3BZugmO0EkHoha
 3pRdfqc8EswrALr14rk6wGNGHNO1N1YHbsDiTIPLI8uSsMaMcAS4Ei8AWVBUJPjYB7s=
X-Gm-Gg: Acq92OFJ3b0nN9kcBFqXpk7GNWATtt6+xQyj+FUzgv5SqzPb0ckIbdjeh85AKPqtiRm
 HVjN/zCwn0dFiFYiviSuE5iGTWikbzO5W6BD2YDn7dJrPfG6SOQFAERDdOHTd/Md4GKTCLlJznF
 dCbDDvggD5OZZcdshatvU4iDXHWQb+1vcITeQ+0r/b/rQXRkou6Uz6EPguXACiAw58VuXHqSIP8
 V97G2q8xT8g0m7ogzZdxIUlx8AFe0b3VSqr4tEiw0ix8MI3bAnL69No4mlwoCvZ0dBKTUZppmm/
 hqw1+9y/SxgkKdf0GG+e6zXVDEHIaoV66rzwDKTIWmZYbpRs23KzQsKmuRBPNrBiXJNkVnJA6bW
 ceeL04DeU86nkx1MpwnKBj1GWrsiRrkBcfYKsivVrptFmdwBEWfPIfpPqmQ1ZPTIOw+MLMkDS7F
 X7ty7TQcfcZwuk9mrMygcezvR1oexp0Wg3d23W
X-Received: by 2002:a17:90b:568d:b0:368:6ff3:6678 with SMTP id
 98e67ed59e1d1-36951cb832cmr21667448a91.20.1779201592753; 
 Tue, 19 May 2026 07:39:52 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.142.33])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-369514361b6sm14362019a91.12.2026.05.19.07.39.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 May 2026 07:39:52 -0700 (PDT)
Message-ID: <ebd6c0b7-59a0-498b-8dfb-221d31737fd6@linaro.org>
Date: Tue, 19 May 2026 07:39:50 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 27/63] target/arm: Implement F1CVTL, F1CVTL2, F2CVTL,
 F2CVTL2 for AdvSIMD
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20260517003002.321430-1-richard.henderson@linaro.org>
 <20260517003002.321430-28-richard.henderson@linaro.org>
 <CAFEAcA_=zOrSCZF7=HU700+DCeDKwvvKK3DM-d5R7jC9ORErZQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <CAFEAcA_=zOrSCZF7=HU700+DCeDKwvvKK3DM-d5R7jC9ORErZQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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

On 5/19/26 05:06, Peter Maydell wrote:
> This doesn't quite do the right thing for an input SNaN,
> which is supposed to set the Invalid Operation bit. This
> I think is because the parts_canonicalize code in fpu/ isn't
> handling the "only one NaN" case quite right:
> 
>          case float_expmax_e4m3:
>              if (p->frac_hi == 0b111) {
>                  fracN(shl)(p, fmt->frac_shift);
>                  p->cls = (parts_is_snan_frac(p->frac_hi, status)
>                            ? float_class_snan : float_class_qnan);
>                  return;
>              }
> 
> This tries to use parts_is_snan_frac() to determine whether
> the FP8 NaN is an SNaN or a QNaN. But for Arm at least in
> E4M3 the NaN is always an SNaN, and parts_is_snan_frac()
> gives the wrong answer because it's looking at the MSB
> of the fraction and for Arm snan_bit_is_one() is false.
> The upshot is that later on when processing this value we
> don't recognize that it was an SNaN and don't set Invalid.
> 
> Unfortunately the OCP OFP8 specification doesn't say whether
> the E4M3 NaN should be signaling or not, which is thus
> leaving it up to the implementation to decide. If Arm is
> the only user of the E4M3 code at the moment (looks like
> maybe we are?) then we can hard-code "always SNaN":

Sadly not.  There are patches for riscv that haven't been merged, and riscv wants the solo 
nan encoding for e4m3 to be qnan.

I could fix this up locally in fp8_input_fmt[OFP8_E4M3], but perhaps it's clearer for the 
generic code to add another bit to float_status: e4m3_nan_is_snan?


r~

