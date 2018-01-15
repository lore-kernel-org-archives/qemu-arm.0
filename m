Received: by 10.28.173.206 with SMTP id w197csp2993128wme;
        Mon, 15 Jan 2018 09:47:51 -0800 (PST)
X-Google-Smtp-Source: ACJfBoui7D8S3tgC9PTawTjpCXbYR2Pht6U088qGefkFMJ1Bf2nk1NP3ZYgF8FIYAKBkAnPhXS5p
X-Received: by 10.37.160.212 with SMTP id i20mr15076028ybm.353.1516038471578;
        Mon, 15 Jan 2018 09:47:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516038471; cv=none;
        d=google.com; s=arc-20160816;
        b=U7/+DQlSQ3/t+Tol8nh01NTZg0CamnkLxzLeWEo6hnmvNyMNgm/LCFUQ7gDEkkQKGX
         O6riWJl6OuIOkh5PXi/do3aAPGs/qaLhFglssd5hv37i0kSAMHAUAYPy55aC87nQ9fKG
         +Azp1wJGSVjZt+GGkvNtkkb87dhE8IcMDKt0b12xWM0x+anNDCes876lWbRvQHDA0L6L
         9gbKFtCXGpf0o4irFzkM04KqFvG1ShS2Lv2sVy83ArGUi0wST8RCk7UxWW4V99P7CAqr
         ObKZWPWPuwoqqSbjHxT99zol8okKJrUGs9+5OqjbEJnv4dcNfG1dmrNGW6hVLn3C9Qzc
         xQhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=HizYeJLm0FT9ZiUAy+lNlzku1aPYCD6/yez5g7t14BI=;
        b=nQHEn6JPqmDyHHSQfCjY6aiplajxYK6XCYnSEZ7d3NtE/WcgMaTamZRSPGpINH/Vw2
         cycwUyeUwJH2dz8kI7MXdmckKTS0yB1RqccCIc6VGAa8MTxgKm/VDXRt7v2lHHCnUwne
         XjKN/DdbClQDXUcoOYujzRbIy1kbNyp+guM1LW8l/yH1eS9CvqUVt7M+lrMfzxvktta3
         GFHLzvuKOnZE4P8F1C16TIAgUVChhC0IAoKCkVO+F15XraN9zT1xw/9H86g+RFk3bR51
         F4WdvHNA3W8yC47X1i1Q68QxH4BdscOPx2Kc1fZhGrPJ2Hj2hhUu6FnTX74aGIEmEJFv
         TxRg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=AgSwEnzI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k65si32769ybk.611.2018.01.15.09.47.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 15 Jan 2018 09:47:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=AgSwEnzI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50783 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eb8rP-0004TD-1u
	for alex.bennee@linaro.org; Mon, 15 Jan 2018 12:47:51 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47809)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eb8rG-0004Sj-FN
	for qemu-arm@nongnu.org; Mon, 15 Jan 2018 12:47:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eb8rF-0002ae-ET
	for qemu-arm@nongnu.org; Mon, 15 Jan 2018 12:47:42 -0500
Received: from mail-oi0-x243.google.com ([2607:f8b0:4003:c06::243]:34201)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eb8rF-0002aO-8o
	for qemu-arm@nongnu.org; Mon, 15 Jan 2018 12:47:41 -0500
Received: by mail-oi0-x243.google.com with SMTP id a70so8825957oib.1
	for <qemu-arm@nongnu.org>; Mon, 15 Jan 2018 09:47:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=HizYeJLm0FT9ZiUAy+lNlzku1aPYCD6/yez5g7t14BI=;
	b=AgSwEnzIfKSJsHLvkpWr/pww61J9Ah5MSKz0hD7/Rs6ixMaB2kMaiwCn4VAJh8LRHJ
	MEsjDY940Iu7sVW5jwP5VSpC1NKEPZbtekOTVwN7ZVPnd+Frg7i815BM4XWkBGw1D81j
	wqg+ffiRuIhUizYYIVqWjE4PevgDqwG6s2OkA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=HizYeJLm0FT9ZiUAy+lNlzku1aPYCD6/yez5g7t14BI=;
	b=BDpVia04gLIwV1ckhtHLqF+v8vUE3kv9SJ04rzb2LhuiXoplDq50g9O7JWwVuE9/bN
	O/2LFF7TYCUF1hV5K7evGhkupFr/6Uiye1yga5k/nEkUSyw86uU/KSvG+lLYxItLi80d
	+rGmoqMyyfniuAoO4ox3q8Oh3wt1dRbs98ygUW8KYJ1YhUhblVNE9W+AVIZyKmOJWMNR
	MdIvtNWzhPLhnOivwvZMdivdmxC/ELejBqYLirp5alXRqUOTRwtmsX6PR+waZoIeIeMl
	gFEOOxzobPQ0ym80+lCEFrrij4Pfb2W46gAabh14IrEp4YTGcEboT650f2ocbW20+7ez
	ISyw==
X-Gm-Message-State: AKwxytfmMSk/fZPeVSQIPCRDGJtiy6xMq4s8MzKU65d3qAwbQNZAyQtR
	Qi7geoPfE3MUInp6Bk2BMq69fIyDn+rhxEBOXsXwFQ==
X-Received: by 10.202.180.133 with SMTP id d127mr8101145oif.328.1516038460368; 
	Mon, 15 Jan 2018 09:47:40 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.15.71 with HTTP; Mon, 15 Jan 2018 09:47:20 -0800 (PST)
In-Reply-To: <20171218172425.18200-7-richard.henderson@linaro.org>
References: <20171218172425.18200-1-richard.henderson@linaro.org>
	<20171218172425.18200-7-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 15 Jan 2018 17:47:20 +0000
Message-ID: <CAFEAcA9XeA6Osy90-NH6rzPH5o7DdPvAwz9iHWxVOORy9KRU0w@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::243
Subject: Re: [Qemu-arm] [PATCH v2 06/11] target/arm: Decode aa32 armv8.1 two
 reg and a scalar
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FQP6+s/ndron

On 18 December 2017 at 17:24, Richard Henderson
<richard.henderson@linaro.org> wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.c | 38 +++++++++++++++++++++++++++++++++++---
>  1 file changed, 35 insertions(+), 3 deletions(-)
>
> diff --git a/target/arm/translate.c b/target/arm/translate.c
> index a9587ae242..1a0b0eaced 100644
> --- a/target/arm/translate.c
> +++ b/target/arm/translate.c
> @@ -6973,11 +6973,43 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
>                          }
>                          neon_store_reg64(cpu_V0, rd + pass);
>                      }
> +                    break;
> +                case 14: /* VQRDMLAH scalar */
> +                case 15: /* VQRDMLSH scalar */
> +                    if (!arm_dc_feature(s, ARM_FEATURE_V8_1_SIMD)) {
> +                        return 1;
> +                    }
> +                    if (u && ((rd | rn) & 1)) {
> +                        return 1;
> +                    }

The pseudocode also has UNDEF if Q==1 && Vm<0> == 1 -- have we
already done that test earlier? I can't see it, but our neon decode
code is quite hard to read...

> +                    tmp2 = neon_get_scalar(size, rm);
> +                    for (pass = 0; pass < (u ? 4 : 2); pass++) {
> +                        void (*fn)(TCGv_i32, TCGv_env, TCGv_i32,
> +                                   TCGv_i32, TCGv_i32);

Can we define a typedef for this, please ?

>
> -
> +                        tmp = neon_load_reg(rn, pass);
> +                        tmp3 = neon_load_reg(rd, pass);
> +                        if (op == 14) {
> +                            if (size == 1) {
> +                                fn = gen_helper_neon_qrdmlah_s16;
> +                            } else {
> +                                fn = gen_helper_neon_qrdmlah_s32;
> +                            }
> +                        } else {
> +                            if (size == 1) {
> +                                fn = gen_helper_neon_qrdmlsh_s16;
> +                            } else {
> +                                fn = gen_helper_neon_qrdmlsh_s32;
> +                            }
> +                        }
> +                        fn(tmp, cpu_env, tmp, tmp2, tmp3);
> +                        tcg_temp_free_i32(tmp3);
> +                        neon_store_reg(rd, pass, tmp);
> +                    }
> +                    tcg_temp_free_i32(tmp2);
>                      break;
> -                default: /* 14 and 15 are RESERVED */
> -                    return 1;
> +                default:
> +                    g_assert_not_reached();
>                  }
>              }
>          } else { /* size == 3 */
> --
> 2.14.3

Otherwise

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
