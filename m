Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp2845909njk;
        Mon, 2 Dec 2024 06:02:33 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUdVYNo+HxM/1GoSHZ5eh/3yD1ebRkeBoPE1bKIOTIy91OuXDl/9sQhqZJk/0WsZ4glC/Kju8O95TreZw==@linaro.org
X-Google-Smtp-Source: AGHT+IFXPWr1TJ2JC2ZqJbp8DYrTxlOuM41jRw6hztp1G03JfvOrPDH+wAyKUR/VZ5HU2iRXlxuB
X-Received: by 2002:a05:6122:a16:b0:507:9096:423a with SMTP id 71dfb90a1353d-515569e3f58mr26356188e0c.12.1733148153004;
        Mon, 02 Dec 2024 06:02:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733148152; cv=none;
        d=google.com; s=arc-20240605;
        b=MwU+BefFsngivekC61cM8zjh46vx5ho/TPRfk1yH09Txza76xGj/2TdODbXzladlfy
         ZqEcY+s5WMrIl8XWv+TAEoyNF/arhJ2A2bo76dXYreF+7+IWl+MoUv8jCZytDj3GU3YI
         7unPMQPiexrsk41mU5IIuPIhMZlnA0M5yOlxMACICd4ANoB6D+1/24GYLJdh2lUmY4oJ
         oAs0+m21Lpgdz1jogwUC+8w5ZTfLQxZZ7rREpvWAUQvrGHbE0t5RvzlSTe3yvVUIu1sF
         hMTV4GINpBJAZPXJo3cggCTRpAQohicOQ4Gg38x5m4DMJkaliRmByQU6VmGofgMyfR5c
         UWCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=/kB1IHMxp8iRwo+CK0qNdpbRDF2EAisKa/YauKytlNs=;
        fh=UMlouvVl3Ph4Ne7UvGTvosqVcNxKyKMHDiGsZppDwks=;
        b=DzTl93HdlhIlIRlI+xkt//WXkyQ6vhcjSjv3MIaynM26aeKQivy9AN1YYsTPAHqQ9e
         dOb4MD73Nt/LqPJbeKxM2Gj3Dm+jqzNQ7N1eYJ7dpTxsxk79p5uyklrlcYXaepoSBV4g
         IGGbHPNQjRHpqeAAtd7jc0W+QcLbIpVBdT95T0jig6C3/vseXUEwrgQXQ9MRws9ztia5
         NjLcwUx+RZq5fLDTFqUZ9Ou5lk3cMJZWFGW8CrgpclO00gc3+WSOyMQLjsPz4LFfuObD
         52Jox0ZciIA7TXIMPAviSKSu386kpLYfSb5H5qlJZNO/MuaF1glNHkX8pkp22H3gSnve
         5myg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hf+vGkox;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 71dfb90a1353d-5156d1289easi4970651e0c.225.2024.12.02.06.02.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Dec 2024 06:02:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hf+vGkox;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tI70L-0003Yh-9S; Mon, 02 Dec 2024 09:02:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tI6zg-0003WX-7D
 for qemu-arm@nongnu.org; Mon, 02 Dec 2024 09:01:58 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tI6zc-0002nB-Bb
 for qemu-arm@nongnu.org; Mon, 02 Dec 2024 09:01:43 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-434a044dce2so54091395e9.2
 for <qemu-arm@nongnu.org>; Mon, 02 Dec 2024 06:01:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733148098; x=1733752898; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/kB1IHMxp8iRwo+CK0qNdpbRDF2EAisKa/YauKytlNs=;
 b=hf+vGkoxsrc/giAMHnSossRL5mrlVMm2MpbQ7mf4fV1pLHN5GlGs5Ts3Z847pjaRBC
 kmGvvtnEXTKr0WQhHgd1BcUPeKHxmzDEwJYaCJ67eHDaNGdUQ/SX4LoU4i0sCcmvPjK3
 1BL7vA/q0V38f2Fk/Qv3fnQhdCwko8mu7zsqlhQIqOoNuhLTJZuzkwWPGMmoU+trXoSN
 Ji6NBrf1jWkPvvRjb2ZWMMY0srRjJhe8oiCmYv/22JRhuWRBKV2kZ0fCpUBXr9OtaPDZ
 rKYgZaA1iI/kGs9DyFRl44IkvCGZfN/pl/EnKV1a0FC+bvDWwkBKA9vnna8kSv3ePZsH
 OzNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733148098; x=1733752898;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/kB1IHMxp8iRwo+CK0qNdpbRDF2EAisKa/YauKytlNs=;
 b=nGLFWbt3os8RNfiyjDDKgpu3bPq26ucK1q9MbOXLAqucQXnirksD0JihWiiEw9V074
 tqWDB7zPP3LsqoawAR4OCXLlPFkjhUoaosIw/g6RFABRPqmqgdTef3z5YgI6jelKEWIw
 tBRPPooIHqCSQksN/mRELARwYnzES7V3uzfSmRlC/IQ9MLs8fr458Y6SVtyt/FUXd7zg
 eAn+Mpozy06/fDrRtVXa1C/6vJYGPBAVDt/YTyx2oH5B55Qefp4kypTmiCDoK/+pCrC4
 7Mvb6rPb2IbP81Riz6wEYnGUIUYgfp/5sGEox9mJIxHEFcHZIRNZHqHbLjh/FPSn+3Tb
 RP/Q==
X-Gm-Message-State: AOJu0Yz5CA5Idxy+NPOibxIxh//18Ytz9BgdGV3phsdanVvGsnFys66+
 OZ9HZuoYOMbx4DOyo6vf7eC05D1J20JJzVIqJkTS7SMLj+rH/2urffH+Y0yjwpo=
X-Gm-Gg: ASbGncuOoTwIELBjl9b/y9K4Crc1AdK6/TBKLnt5n6ltS7WqZKoTfzSbOAFUjmiyHpw
 /UZAoCbiGARw1NDDIm18Rv2uoYljPKqtQU4y+zdUnePS0mc5cR2urLUPmrvNIPdPaVZWkU6f+lY
 ijiV+xPioVRfIXi+LRD4tyjHFMDz/iv/bnwy6+jq8oRlHNx4FojZKCY5sS7DupqQVzEVug8i8eI
 mo6YnSbmaxXDGcRYg91bzQsrmF5NmE7xFY6GK0S8c86aKW5o9qI9nuLr8/Ew7dKpvGWbwFTxjDn
 9AejM+TirtswGF92yWto5DuBVJvYTw==
X-Received: by 2002:a05:6000:4020:b0:382:40ad:44b2 with SMTP id
 ffacd0b85a97d-385c6ebba51mr25523045f8f.34.1733148093134; 
 Mon, 02 Dec 2024 06:01:33 -0800 (PST)
Received: from [192.168.68.213] (72.red-95-127-54.dynamicip.rima-tde.net.
 [95.127.54.72]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-385e230b283sm7813306f8f.106.2024.12.02.06.01.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Dec 2024 06:01:32 -0800 (PST)
Message-ID: <59d6b035-8be3-43bb-849d-5664bcd34795@linaro.org>
Date: Mon, 2 Dec 2024 15:01:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/67] target/arm: Convert CRC32, CRC32C to decodetree
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20241201150607.12812-1-richard.henderson@linaro.org>
 <20241201150607.12812-5-richard.henderson@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241201150607.12812-5-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ttwtSje3eNVL

Hi Richard,

On 1/12/24 16:05, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/tcg/translate-a64.c | 101 +++++++++++++--------------------
>   target/arm/tcg/a64.decode      |  12 ++++
>   2 files changed, 53 insertions(+), 60 deletions(-)
> 
> diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
> index 8b7ca2c68a..22594a1149 100644
> --- a/target/arm/tcg/translate-a64.c
> +++ b/target/arm/tcg/translate-a64.c
> @@ -7592,6 +7592,39 @@ TRANS(LSRV, do_shift_reg, a, A64_SHIFT_TYPE_LSR)
>   TRANS(ASRV, do_shift_reg, a, A64_SHIFT_TYPE_ASR)
>   TRANS(RORV, do_shift_reg, a, A64_SHIFT_TYPE_ROR)
>   
> +static bool do_crc32(DisasContext *s, arg_rrr_e *a, bool crc32c)
> +{
> +    TCGv_i64 tcg_acc, tcg_val, tcg_rd;
> +    TCGv_i32 tcg_bytes;
> +
> +    switch (a->esz) {
> +    case MO_8:
> +    case MO_16:
> +    case MO_32:
> +        tcg_val = tcg_temp_new_i64();
> +        tcg_gen_extract_i64(tcg_val, cpu_reg(s, a->rm), 0, 8 << a->esz);
> +        break;
> +    case MO_64:
> +        tcg_val = cpu_reg(s, a->rm);
> +        break;
> +    default:
> +        g_assert_not_reached();
> +    }
> +    tcg_acc = cpu_reg(s, a->rn);
> +    tcg_bytes = tcg_constant_i32(1 << a->esz);
> +    tcg_rd = cpu_reg(s, a->rd);
> +
> +    if (crc32c) {
> +        gen_helper_crc32c_64(tcg_rd, tcg_acc, tcg_val, tcg_bytes);
> +    } else {
> +        gen_helper_crc32_64(tcg_rd, tcg_acc, tcg_val, tcg_bytes);
> +    }
> +    return true;
> +}
> +
> +TRANS_FEAT(CRC32, aa64_crc32, do_crc32, a, false)
> +TRANS_FEAT(CRC32C, aa64_crc32, do_crc32, a, true)
> +
>   /* Logical (shifted register)
>    *   31  30 29 28       24 23   22 21  20  16 15    10 9    5 4    0
>    * +----+-----+-----------+-------+---+------+--------+------+------+
> @@ -8473,52 +8506,6 @@ static void disas_data_proc_1src(DisasContext *s, uint32_t insn)
>   }
>   
>   
> -/* CRC32[BHWX], CRC32C[BHWX] */
> -static void handle_crc32(DisasContext *s,
> -                         unsigned int sf, unsigned int sz, bool crc32c,
> -                         unsigned int rm, unsigned int rn, unsigned int rd)
> -{
> -    TCGv_i64 tcg_acc, tcg_val;
> -    TCGv_i32 tcg_bytes;
> -
> -    if (!dc_isar_feature(aa64_crc32, s)
> -        || (sf == 1 && sz != 3)
> -        || (sf == 0 && sz == 3)) {

We are not checking the sf bit anymore, is that intended?

Should we add the 'rrr_sf_[bhsd]' format?

> -        unallocated_encoding(s);
> -        return;
> -    }
> -
> -    if (sz == 3) {
> -        tcg_val = cpu_reg(s, rm);
> -    } else {
> -        uint64_t mask;
> -        switch (sz) {
> -        case 0:
> -            mask = 0xFF;
> -            break;
> -        case 1:
> -            mask = 0xFFFF;
> -            break;
> -        case 2:
> -            mask = 0xFFFFFFFF;
> -            break;
> -        default:
> -            g_assert_not_reached();
> -        }
> -        tcg_val = tcg_temp_new_i64();
> -        tcg_gen_andi_i64(tcg_val, cpu_reg(s, rm), mask);
> -    }
> -
> -    tcg_acc = cpu_reg(s, rn);
> -    tcg_bytes = tcg_constant_i32(1 << sz);
> -
> -    if (crc32c) {
> -        gen_helper_crc32c_64(cpu_reg(s, rd), tcg_acc, tcg_val, tcg_bytes);
> -    } else {
> -        gen_helper_crc32_64(cpu_reg(s, rd), tcg_acc, tcg_val, tcg_bytes);
> -    }
> -}
> -
>   /* Data-processing (2 source)
>    *   31   30  29 28             21 20  16 15    10 9    5 4    0
>    * +----+---+---+-----------------+------+--------+------+------+
> @@ -8590,20 +8577,6 @@ static void disas_data_proc_2src(DisasContext *s, uint32_t insn)
>           gen_helper_pacga(cpu_reg(s, rd), tcg_env,
>                            cpu_reg(s, rn), cpu_reg_sp(s, rm));
>           break;
> -    case 16:
> -    case 17:
> -    case 18:
> -    case 19:
> -    case 20:
> -    case 21:
> -    case 22:
> -    case 23: /* CRC32 */
> -    {
> -        int sz = extract32(opcode, 0, 2);
> -        bool crc32c = extract32(opcode, 2, 1);
> -        handle_crc32(s, sf, sz, crc32c, rm, rn, rd);
> -        break;
> -    }
>       default:
>       do_unallocated:
>       case 2: /* UDIV */
> @@ -8612,6 +8585,14 @@ static void disas_data_proc_2src(DisasContext *s, uint32_t insn)
>       case 9: /* LSRV */
>       case 10: /* ASRV */
>       case 11: /* RORV */
> +    case 16:
> +    case 17:
> +    case 18:
> +    case 19:
> +    case 20:
> +    case 21:
> +    case 22:
> +    case 23: /* CRC32 */
>           unallocated_encoding(s);
>           break;
>       }
> diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
> index 3db55b78a6..1664f4793c 100644
> --- a/target/arm/tcg/a64.decode
> +++ b/target/arm/tcg/a64.decode
> @@ -45,7 +45,9 @@
>   @rr_d           ........ ... ..... ...... rn:5 rd:5     &rr_e esz=3
>   @rr_sd          ........ ... ..... ...... rn:5 rd:5     &rr_e esz=%esz_sd
>   
> +@rrr_b          ........ ... rm:5 ...... rn:5 rd:5      &rrr_e esz=0
>   @rrr_h          ........ ... rm:5 ...... rn:5 rd:5      &rrr_e esz=1
> +@rrr_s          ........ ... rm:5 ...... rn:5 rd:5      &rrr_e esz=2
>   @rrr_d          ........ ... rm:5 ...... rn:5 rd:5      &rrr_e esz=3
>   @rrr_sd         ........ ... rm:5 ...... rn:5 rd:5      &rrr_e esz=%esz_sd
>   @rrr_hsd        ........ ... rm:5 ...... rn:5 rd:5      &rrr_e esz=%esz_hsd
> @@ -663,6 +665,16 @@ LSRV            . 00 11010110 ..... 00100 1 ..... ..... @rrr_sf
>   ASRV            . 00 11010110 ..... 00101 0 ..... ..... @rrr_sf
>   RORV            . 00 11010110 ..... 00101 1 ..... ..... @rrr_sf
>   
> +CRC32           0 00 11010110 ..... 0100 00 ..... ..... @rrr_b
> +CRC32           0 00 11010110 ..... 0100 01 ..... ..... @rrr_h
> +CRC32           0 00 11010110 ..... 0100 10 ..... ..... @rrr_s
> +CRC32           1 00 11010110 ..... 0100 11 ..... ..... @rrr_d
> +
> +CRC32C          0 00 11010110 ..... 0101 00 ..... ..... @rrr_b
> +CRC32C          0 00 11010110 ..... 0101 01 ..... ..... @rrr_h
> +CRC32C          0 00 11010110 ..... 0101 10 ..... ..... @rrr_s
> +CRC32C          1 00 11010110 ..... 0101 11 ..... ..... @rrr_d
> +
>   # Data Processing (1-source)
>   # Logical (shifted reg)
>   # Add/subtract (shifted reg)

