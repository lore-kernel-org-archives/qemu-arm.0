Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp1450960ejm;
        Fri, 21 Apr 2023 15:39:09 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZMtMhHiyQnIFG8bJku0rVdfAm0lWTp1JGYCBpW6uKggHVfu4TxYV1JMiO+gqJ32uazJydq
X-Received: by 2002:ac8:5dd2:0:b0:3ef:3ff5:ce28 with SMTP id e18-20020ac85dd2000000b003ef3ff5ce28mr12326443qtx.39.1682116749292;
        Fri, 21 Apr 2023 15:39:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682116749; cv=none;
        d=google.com; s=arc-20160816;
        b=GLKC9eb+lMPrFYpoUy/c0tdbVxG7c4eBtDR6JSst0eImAu+PpusyXTXhcRPgVO+2Cm
         bBbuKBiApRtdp5kbJLXasneVsFlwQf8gAt2wh0OTBpIbMsgH8lnEDjzpmmxNytAJ/YIA
         SH35wpPY15yKATKzihaXLV58rWZ8YO8m/C3Ocg66GgWt9bSY9I7QvPGiXJ9eZXbry6K6
         vH/SIsPRRm0rzXIXthkfIf4kAsQtZhnYPVIA5OdV65U8OfuKGjm7Xq2x9IcBCjqTYa+E
         dsQnsE3W/NysHf/RcFS/rnOV/9PKKdcCbEWF6MFxZZOg+aL0PvUdoG4cXSjbq4szd2ak
         54ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=fDWUzdwWSTcrIpv4Eyp45VwaJpiY4jXRlSByEyJLVcU=;
        b=Ovzk8mPaMo3yRBh1Nqrao416h566BtIHRaKAyroI4Pr1uYZJfo6Cc/RporCC2U7cel
         R2n8+MO7s7ZOLR1hvo/sto02JMUdmVjpNxcCzsBhDh/7C6ndRqbTh5vbed0v6RGD9YLo
         rBts/5ySPvR+gUBXGG7fEVaLYnAHOVOz4kmE1adaK4JLPZW54QP/ubED5HMZOCn2LptV
         Q+ay4SGx1r0b3nBTP3LTwa6ir/Hj9d1u9/MdeSYtPcGDMEQxhlfllg10wyf4jIvU6ijp
         HWemKUsxtgZPNDWwlUuR65p2cq6zkc70+9+5kX/+5tuiTEmvZyfLbN11LYS/hboffqjH
         EPQQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BDjQk0zx;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r72-20020a37a84b000000b0071ada51ab52si3568746qke.413.2023.04.21.15.39.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Apr 2023 15:39:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BDjQk0zx;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppzOk-0000zJ-N1; Fri, 21 Apr 2023 18:38:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppzOg-0000yS-4M
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 18:38:31 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppzOd-00006w-6a
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 18:38:29 -0400
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-2fe3fb8e2f7so1415015f8f.0
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 15:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682116705; x=1684708705;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fDWUzdwWSTcrIpv4Eyp45VwaJpiY4jXRlSByEyJLVcU=;
 b=BDjQk0zxIT/8f4/OyS4ZJAUe+dQMzRwFKzJMCC7xi7VsSNl8RluDfwAAg78VVvulXQ
 LDJjaloEZ2CiTFYpfkaCJKYGjML/eNg0jHG54LihNLUQa4QAuZF2tOmUKErLjieMYeqR
 qPx9vLE5MPHEH0GvIQNX0tYSwqJ8zHl7uQ7BaL8kd3NCFcbnDYZyY7RyamfLEa95fBIL
 K9hDP3iQtY/kVtIkbpkb7JUuQu0O/tlU3qMOwHd6zUqYb5LHqfekJFsMAVvZrZNDxNs1
 lvP1jD2sYn/RRAxfu2LTkle5qOsPtESkWJfdu4doGf0tgcJbXRw110UbyQdtWHyvuIFC
 pqDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682116705; x=1684708705;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fDWUzdwWSTcrIpv4Eyp45VwaJpiY4jXRlSByEyJLVcU=;
 b=Q+jMnowOwxTJKWaUn1N9Imj59wzPAfOhi6cOgxaGSBKaWLivB0wRd+Gn78769JhgHS
 2LAMHLkAHYrVSDSji5I3ec0WWphfCmgj1FqkyekkvtFX7iUbayLbdcAOjcaobKkwFjvZ
 n/LS+K6IaYwCWZKfJQyaRbCCzddgCN7uLitXdUeV5EZ5IU/iuD1y4Scb6OQim+8SgUFl
 dap933WBEDVUMJMVmsgU74gdT6rGVegxuVPNSdRE2gGYu6whxdqhjpNBEr1b2qcfjiZQ
 d/7RbLa3MjMyvegqH+QDLHYbCf2RVy9/xqPNiyj3fbIqP4kn5iuUq8FyyTXIAa7ycsjx
 5ekg==
X-Gm-Message-State: AAQBX9ffeghKIFfV/zN6BPqEexGyNHts12x7CGlLw/us7S3KEocpPQZ8
 zy0D5e5mgBrAVKcxhLmGC23zbA==
X-Received: by 2002:a5d:6149:0:b0:2fb:9dbb:3407 with SMTP id
 y9-20020a5d6149000000b002fb9dbb3407mr4562202wrt.51.1682116705544; 
 Fri, 21 Apr 2023 15:38:25 -0700 (PDT)
Received: from [192.168.69.115] (uni14-h01-176-184-39-152.dsl.sta.abo.bbox.fr.
 [176.184.39.152]) by smtp.gmail.com with ESMTPSA id
 s8-20020a05600c45c800b003f18992079dsm6363921wmo.42.2023.04.21.15.38.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Apr 2023 15:38:25 -0700 (PDT)
Message-ID: <e5cb9092-23c5-8449-9520-4494ccbc5e3c@linaro.org>
Date: Sat, 22 Apr 2023 00:38:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v2 07/54] tcg: Split out tcg_out_ext32s
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
References: <20230411010512.5375-1-richard.henderson@linaro.org>
 <20230411010512.5375-8-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230411010512.5375-8-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.297,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: tIZjMZuzyY+h

On 11/4/23 03:04, Richard Henderson wrote:
> We will need a backend interface for performing 32-bit sign-extend.
> Use it in tcg_reg_alloc_op in the meantime.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/tcg.c                        |  4 ++++
>   tcg/aarch64/tcg-target.c.inc     |  9 +++++++--
>   tcg/arm/tcg-target.c.inc         |  5 +++++
>   tcg/i386/tcg-target.c.inc        |  5 +++--
>   tcg/loongarch64/tcg-target.c.inc |  2 +-
>   tcg/mips/tcg-target.c.inc        | 12 +++++++++---
>   tcg/ppc/tcg-target.c.inc         |  5 +++--
>   tcg/riscv/tcg-target.c.inc       |  2 +-
>   tcg/s390x/tcg-target.c.inc       | 10 +++++-----
>   tcg/sparc64/tcg-target.c.inc     | 11 ++++++++---
>   tcg/tci/tcg-target.c.inc         |  9 ++++++++-
>   11 files changed, 54 insertions(+), 20 deletions(-)



> diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
> index f55829e9ce..d7964734c3 100644
> --- a/tcg/aarch64/tcg-target.c.inc
> +++ b/tcg/aarch64/tcg-target.c.inc
> @@ -1429,6 +1429,11 @@ static void tcg_out_ext16s(TCGContext *s, TCGType type, TCGReg rd, TCGReg rn)
>       tcg_out_sxt(s, type, MO_16, rd, rn);
>   }
>   
> +static void tcg_out_ext32s(TCGContext *s, TCGReg rd, TCGReg rn)
> +{
> +    tcg_out_sxt(s, TCG_TYPE_I64, MO_32, rd, rn);
> +}
> +
>   static inline void tcg_out_uxt(TCGContext *s, MemOp s_bits,
>                                  TCGReg rd, TCGReg rn)
>   {
> @@ -2232,7 +2237,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
>       case INDEX_op_bswap32_i64:
>           tcg_out_rev(s, TCG_TYPE_I32, MO_32, a0, a1);
>           if (a2 & TCG_BSWAP_OS) {
> -            tcg_out_sxt(s, TCG_TYPE_I64, MO_32, a0, a0);
> +            tcg_out_ext32s(s, a0, a0);
>           }
>           break;
>       case INDEX_op_bswap32_i32:
> @@ -2251,7 +2256,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
>           break;
>   
>       case INDEX_op_ext_i32_i64:
> -    case INDEX_op_ext32s_i64:
>           tcg_out_sxt(s, TCG_TYPE_I64, MO_32, a0, a1);

While here, maybe reuse the new helper (easier to read):

             tcg_out_ext32s(s, a0, a1);

>           break;
>       case INDEX_op_extu_i32_i64:
> @@ -2322,6 +2326,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
>       case INDEX_op_ext16s_i32:
>       case INDEX_op_ext16u_i64:
>       case INDEX_op_ext16u_i32:
> +    case INDEX_op_ext32s_i64:
>       default:
>           g_assert_not_reached();
>       }

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

