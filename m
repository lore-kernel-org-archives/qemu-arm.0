Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86EBECD5BAC
	for <qemu-arm@archiver.kernel.org>; Thu, 21 May 2026 16:37:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wQ6P1-0000Gr-JN; Thu, 21 May 2026 12:37:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wQ6Oi-0000FG-OP
 for qemu-arm@nongnu.org; Thu, 21 May 2026 12:37:26 -0400
Received: from mail-yx1-xb12c.google.com ([2607:f8b0:4864:20::b12c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wQ6Of-0000RH-Of
 for qemu-arm@nongnu.org; Thu, 21 May 2026 12:37:22 -0400
Received: by mail-yx1-xb12c.google.com with SMTP id
 956f58d0204a3-6563f83ae9fso6304821d50.1
 for <qemu-arm@nongnu.org>; Thu, 21 May 2026 09:37:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779381440; cv=none;
 d=google.com; s=arc-20240605;
 b=jqURCF7S6s+2OmCNX1lZ7B5kgrNVUpagsQu6lS8THMNKPTecwqZ1pu2GxNFw+44SZD
 cPjE0YDIn143D4VLTgOlRvDGWe+oil7aFHfAKHHjGkQ0Dwf/N3wUFwLQAAJBjTGqR+OV
 K4o5/gsVZ9JVo8+4pKXhkZqeReC/zU6YlB8QnGlMKltClRl7dQHzYwq4hTQzGvxxwTaD
 CDVyiQRBZ6X5stA+oU3TToq/nVpZky2xfIuoW/WQO9dtEpMMVo5UMF6Y/s8pg9PKfCnU
 dfmx9N7tf5SbXaxrSMDmPLK45ip5G4kBqzvHGrwfEUE6HNAm2qXTNfCwfIYQ5FyX/8bC
 lVsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=lPk63ZgkDrbHPWKn8uD25iZ2a3WZoMh5W6q3ucoaSgI=;
 fh=Fnw9ixBxUOyBlQMXwMoX81zwb81IIqEeD91N7dBxBpw=;
 b=j75SWsO5wf+LGK1K18n+6/T6vJSgyAD1inOH2DetB2V5dVVJ1og049lX2vYY9vyLr9
 NxxqA3bV5m/KmcM2ljZUiWxp7WP3mAHcb/tzPdVaMdvQqPMYzl+Bcy1mBlMVMU+5G7jc
 vZ1wOZy/+LsrtFi6O7RTp6/4OA+fX6yPJyE8OLSd+jrvR1d5nh/KWhwCdP387HXEmkol
 NhCmdGsTMtAbaPI5V9bIf4uvwAIbRPm7x5OIpESjy/CSe5xM1VqNURydzClBs31STSYY
 GSXyWA0xIxOgUEkPHIg5nglofQ6Jby2R3G0jBW1vZc0LV0LBvoGxj/V3nPn3y9nsf3Tn
 chBQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779381440; x=1779986240; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=lPk63ZgkDrbHPWKn8uD25iZ2a3WZoMh5W6q3ucoaSgI=;
 b=KjprvUXl3IPkYVTJZQug7gxqBHW4DHaMbA34axFWN0uzLDQq/dG3Fv8m5os9nxqgeq
 EypR8oG/4on4w9asx1fttdDEk8pz9rgdNxi59lYkyp3tyN2o/HZzxkSHwXBLH7CjjY2G
 sUq8cQJg4yNv7dUJoxxI81RO+sOeyQ2fUFn1iYWGofjZKXbsSSHGMRFcuMzmo+X2GkbC
 UdQA8WecOivPQS8YGbxTXI7KcMX1jSVBBI22r2QiOyJgI31rGmI4lv1iwiC7usxe88c5
 RN1y7Sq1TSrKnGu1mtokFeIAzh1l03MS/nKPipHUDFx9qMCu4Y1gz1TGKHIhHX2karKu
 gsUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779381440; x=1779986240;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lPk63ZgkDrbHPWKn8uD25iZ2a3WZoMh5W6q3ucoaSgI=;
 b=iO80g8CWVi9Bbp/ihCBPNNBCMRLleaJsEURuvwCxhEK7Craj1wzI93t+P5iTGtEwEn
 5JQRh+1znpUm4RmE+toAN9jSWuekfbsy+Kwp10zontoawR7tAzpryrHEm9C04SZtvj8y
 +ISJplZpm2C1Mp/aEjLHFLAHziGCrw1T3/nBkSWvTbSiChrqakxzI4zGeZovj6avU1V0
 f3Fi8/InLbJ/wV9eRG2pBXAWWbEQ3g4Bez73GEcONes/cPbkN+HN/Bs2cNYyFc3OUOHO
 VJtWB8ffR8WA+ZHI8I/Z8XZhG/XPb94gWDCAotYJ4zeXvZukyPUrUpaQL7eWw0BEXw0Y
 PB2Q==
X-Forwarded-Encrypted: i=1;
 AFNElJ+PlxzyBPR99eI5jxv1VePBL0I/76D/DOJAUxrrojKLhIqFfLVGhhiGczo0jS/BYDwBSgAGuxFSjQ==@nongnu.org
X-Gm-Message-State: AOJu0YyBdVZ6+npVbu8nipqqHWqMLy0SSQjTSehHS1DhGxqaqDB4b406
 j/2NbgMerQfJpB/e8H0JJwxVw8uD4f8W17r34YWAj22dShn7jfcx0rbnW4w5wQU2jYkoScB82kU
 hWJx60IDo2cjVADVuxwHbCmpxpuwyHY7QvdmGrdAMcA==
X-Gm-Gg: Acq92OHrrfvhm3Xa/1lXg0uyVS6jjVtqZxrnBZ6FXuyVzmyWIK4R8AOT9dyN4usHN63
 rCThyCy24K7uBBKKk+eryQaijN9VcXPON8BATeNr+T5/dgsNEIAptkXDIn+4f6c86wUPpmXf2YZ
 fxmBHJQarNqKixOWSAGGm87NXyl4+wvu2DQwjbnA2RoItZX8sZw91qNpsu6PY7nAHy6EC+vontK
 UlW1jHKnrqngP/TEJGR+f8UoL3VtZ86f6SPe5x6dJPistovTnjWJEO7eG7KPscbqGm3xCSqsHfo
 kqFCTo+mpmNUfqJL1EE8+1gIjnnNUR40xHj1hy9ANUGoDgHwp89LoVu8K3yZ8j66h04=
X-Received: by 2002:a05:690e:d41:b0:65d:f5e7:72bc with SMTP id
 956f58d0204a3-65eae285998mr2836834d50.22.1779381440283; Thu, 21 May 2026
 09:37:20 -0700 (PDT)
MIME-Version: 1.0
References: <20260520182213.872945-1-richard.henderson@linaro.org>
 <20260520182213.872945-26-richard.henderson@linaro.org>
In-Reply-To: <20260520182213.872945-26-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 May 2026 17:37:07 +0100
X-Gm-Features: AVHnY4KBGBEpBw7mn0glej0bkyHCRQ4UOnweT5rW1LsUY9rlG_ILUPH1JDEz6R4
Message-ID: <CAFEAcA-fwHraHrEuGXeDC93bctG7AAq+gv8Ew39OpR_6wzpdTw@mail.gmail.com>
Subject: Re: [PATCH v6 25/64] target/arm: Implement BF1CVT, BF1CVTLT, BF2CVT, 
 BF2CVTLT for SVE
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12c.google.com
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

On Wed, 20 May 2026 at 19:26, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu-features.h        |  6 ++++++
>  target/arm/tcg/helper-fp8-defs.h |  1 +
>  target/arm/tcg/fp8_helper.c      | 16 ++++++++++++++++
>  target/arm/tcg/translate-sve.c   | 23 +++++++++++++++++++++++
>  target/arm/tcg/sve.decode        |  6 ++++++
>  5 files changed, 52 insertions(+)

> +static bool do_f8cvt(DisasContext *s, arg_rr_esz *a,
> +                     gen_helper_gvec_2_ptr *fn, bool issrc2, bool isodd)
> +{
> +    if (fpmr_access_check(s) && sve_access_check(s)) {
> +        unsigned vsz = vec_full_reg_size(s);
> +        tcg_gen_gvec_2_ptr(vec_full_reg_offset(s, a->rd),
> +                           vec_full_reg_offset(s, a->rn),
> +                           tcg_env, vsz, vsz,
> +                           issrc2 | (isodd << 1) | (FPST_A64 << 2), fn);
> +    }
> +    return true;
> +}
> +
> +TRANS_FEAT(BF1CVT, aa64_sme2_or_sve2_f8cvt, do_f8cvt, a,
> +           gen_helper_sve2_bfcvt, false, false)
> +TRANS_FEAT(BF2CVT, aa64_sme2_or_sve2_f8cvt, do_f8cvt, a,
> +           gen_helper_sve2_bfcvt, true, false)
> +TRANS_FEAT(BF1CVTLT, aa64_sme2_or_sve2_f8cvt, do_f8cvt, a,
> +           gen_helper_sve2_bfcvt, false, true)
> +TRANS_FEAT(BF2CVTLT, aa64_sme2_or_sve2_f8cvt, do_f8cvt, a,
> +           gen_helper_sve2_bfcvt, true, true)

Again, I'm not sure if this gets the "only legal in streaming
mode from SME2" logic right, but otherwise this looks good.

-- PMM

