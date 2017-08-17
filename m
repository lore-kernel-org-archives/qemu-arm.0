Received: by 10.223.183.22 with SMTP id l22csp116485wre;
        Thu, 17 Aug 2017 16:44:51 -0700 (PDT)
X-Received: by 10.55.95.194 with SMTP id t185mr8911487qkb.61.1503013491727;
        Thu, 17 Aug 2017 16:44:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1503013491; cv=none;
        d=google.com; s=arc-20160816;
        b=Lqt5kMhZkcMDXip66WQmuCpLDiRfGB+AqEHO0Iz0zkZ3Gd+Ekg78ecToiESJN037Wt
         NAG9CZJAxeAyeh4W8Vi2NU/GeCQz8jLKDoOpjMhuNM6vQ6f6TXLeOq6JiS1fXqK2sb9j
         Wb9wx8ARanuFNR6NGo3PfYOE6wA2HJOwZjdlB1ubNin+gkI7TAu6XYp5h4nF6m22TfBV
         lUmE/kmz1uv0k61IQl/QZykVW4zl3TGJKR3GBTtM7QobadWS2tqylcOb651fDicNAF9x
         8GEFtQ90pdY6H6sJvm85K3fwdAVZVsqgYm34gQis2GHoMcmf6Alu4/TFUHbruu/bqKvD
         OMxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:sender
         :dkim-signature:arc-authentication-results;
        bh=xNa4EerVTWDuAyvQIz8hlRRM2YxRlZfMJGg6Pk42lD0=;
        b=xZGAYMkkVyAfLyQHYvQxvQGkxIoJcWpKLW3FTnULufbIIxIA3Hct1psgYK1Q0jL0mL
         Hc4l8LfxTkU/LCIOcZkDAGjDEFQaAVI6sE9KqGoI/NU2nrvxIMFwHd9L+63McitFY3gK
         WZrW1VDI+wH7VhwH4N1eiJRQrKCymFTBFO/430iTReeUj3U/hZ4WCJQsyvy5N4XibHfj
         KTBrQAzzvIC/6KxhHj5YeyFP0Vm2+wZMwINstC8uZGqt5+Pz6AzFcX1Pywx7x0yfbcEg
         VPFEEa3+Ua/h8MIo7+z4y9WywidhGO6iLVbb3b34dlTQvks2nEkzipErlF2RYorJMgY9
         3loA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=FmmLdj7k;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 2607:f8b0:400d:c0d::243 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-qt0-x243.google.com (mail-qt0-x243.google.com. [2607:f8b0:400d:c0d::243])
        by mx.google.com with ESMTPS id p128si3918340qkf.479.2017.08.17.16.44.51
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 Aug 2017 16:44:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 2607:f8b0:400d:c0d::243 as permitted sender) client-ip=2607:f8b0:400d:c0d::243;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=FmmLdj7k;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 2607:f8b0:400d:c0d::243 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com
Received: by mail-qt0-x243.google.com with SMTP id t37so7624638qtg.2;
        Thu, 17 Aug 2017 16:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=xNa4EerVTWDuAyvQIz8hlRRM2YxRlZfMJGg6Pk42lD0=;
        b=FmmLdj7kpi6z0XTIEGqEEVmei56l6HGIhRorqjqIFn8Wy4mxykpt435aCBFDFhcKC8
         aa3FYCL8WxqvXlsMYVUzZwO3ma7sEveTULoozGO0nud2dnbEj6PGV0W+fABjPrWn0HRb
         hJ2eke1FTj+sSeF9tkv3lrmRLZos7T4Ec+aKXbY0Tb/lPircX7GHu48CdMU17T+biE81
         qV/VPMgkTcSJswe/bMxcFuTi1zzFX5A0GZpYuTS72OwKRIMvI4ocnbziMA8OHSvdhSw/
         v+4mxZqC+MRMNk/mnSwxe9nAvQb4K2+Jwj7lojnaTbJ7oqFsZVwrvu0LFJQu4I5PJXUT
         aTtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=xNa4EerVTWDuAyvQIz8hlRRM2YxRlZfMJGg6Pk42lD0=;
        b=MHGegABdCyiajAOwARKH9t8UjP0U5BhP7LegRaQCsebtHb/vySPq+GqH73QjEGoevF
         c/42mvwWxJ4X6cz/FbWxNZILFkzkoeaQUW461RAX66L2WVPOL8AeCX4IignceSEOhKRB
         Cvrmh389y5Pv6kM+1KjdNC8QC2svmM+HCnkc2cKijvbNxBJKIcxEVmzWs7p5LDRIPoDa
         ylCTR9E166KbfOCs+RauLrI6oGKvRnmz9ERvbaPxImkVzpmkq7Wz19GUFwyditUjbMWM
         yqxuqX9dWm9t4TctjKbHWEJ1VQYVdZyEKpWvxIB3V6zH9y73dQLojtzHLtWJGqhhMA/y
         iegg==
X-Gm-Message-State: AHYfb5icEHA/CB58iJ3WOrr7wkEsu/yJOOigZgOF3e23AOsbHxPq6ELJ
	cepoobLFMgsO5Bmmdm4=
X-Received: by 10.200.40.131 with SMTP id i3mr9710091qti.63.1503013491148;
        Thu, 17 Aug 2017 16:44:51 -0700 (PDT)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from [192.168.1.10] ([181.93.89.178])
        by smtp.gmail.com with ESMTPSA id i32sm3277979qkh.17.2017.08.17.16.44.48
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 Aug 2017 16:44:50 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
Subject: Re: [Qemu-devel] [PATCH 5/8] tcg: Add tcg_op_supported
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, alex.bennee@linaro.org
References: <20170817230114.3655-1-richard.henderson@linaro.org>
 <20170817230114.3655-6-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <2664c81f-6243-d633-7c8c-2d0116bd2a87@amsat.org>
Date: Thu, 17 Aug 2017 20:44:47 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170817230114.3655-6-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: R5pU5mpzjE2W

On 08/17/2017 08:01 PM, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>   tcg/tcg.h |   2 +
>   tcg/tcg.c | 310 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>   2 files changed, 312 insertions(+)
> 
> diff --git a/tcg/tcg.h b/tcg/tcg.h
> index b9e15da13b..b443143b21 100644
> --- a/tcg/tcg.h
> +++ b/tcg/tcg.h
> @@ -962,6 +962,8 @@ do {\
>   #define tcg_temp_free_ptr(T) tcg_temp_free_i64(TCGV_PTR_TO_NAT(T))
>   #endif
>   
> +bool tcg_op_supported(TCGOpcode op);
> +
>   void tcg_gen_callN(TCGContext *s, void *func,
>                      TCGArg ret, int nargs, TCGArg *args);
>   
> diff --git a/tcg/tcg.c b/tcg/tcg.c
> index ea78d47fad..3c3cdda938 100644
> --- a/tcg/tcg.c
> +++ b/tcg/tcg.c
> @@ -751,6 +751,316 @@ int tcg_check_temp_count(void)
>   }
>   #endif
>   
> +/* Return true if OP may appear in the opcode stream.
> +   Test the runtime variable that controls each opcode.  */
> +bool tcg_op_supported(TCGOpcode op)
> +{
> +    switch (op) {
> +    case INDEX_op_discard:
> +    case INDEX_op_set_label:
> +    case INDEX_op_call:
> +    case INDEX_op_br:
> +    case INDEX_op_mb:
> +    case INDEX_op_insn_start:
> +    case INDEX_op_exit_tb:
> +    case INDEX_op_goto_tb:
> +    case INDEX_op_qemu_ld_i32:
> +    case INDEX_op_qemu_st_i32:
> +    case INDEX_op_qemu_ld_i64:
> +    case INDEX_op_qemu_st_i64:
> +        return true;
> +
> +    case INDEX_op_goto_ptr:
> +        return TCG_TARGET_HAS_goto_ptr;
> +
> +    case INDEX_op_mov_i32:
> +    case INDEX_op_movi_i32:
> +    case INDEX_op_setcond_i32:
> +    case INDEX_op_brcond_i32:
> +    case INDEX_op_ld8u_i32:
> +    case INDEX_op_ld8s_i32:
> +    case INDEX_op_ld16u_i32:
> +    case INDEX_op_ld16s_i32:
> +    case INDEX_op_ld_i32:
> +    case INDEX_op_st8_i32:
> +    case INDEX_op_st16_i32:
> +    case INDEX_op_st_i32:
> +    case INDEX_op_add_i32:
> +    case INDEX_op_sub_i32:
> +    case INDEX_op_mul_i32:
> +    case INDEX_op_and_i32:
> +    case INDEX_op_or_i32:
> +    case INDEX_op_xor_i32:
> +    case INDEX_op_shl_i32:
> +    case INDEX_op_shr_i32:
> +    case INDEX_op_sar_i32:
> +        return true;
> +
> +    case INDEX_op_movcond_i32:
> +        return TCG_TARGET_HAS_movcond_i32;
> +    case INDEX_op_div_i32:
> +    case INDEX_op_divu_i32:
> +        return TCG_TARGET_HAS_div_i32;
> +    case INDEX_op_rem_i32:
> +    case INDEX_op_remu_i32:
> +        return TCG_TARGET_HAS_rem_i32;
> +    case INDEX_op_div2_i32:
> +    case INDEX_op_divu2_i32:
> +        return TCG_TARGET_HAS_div2_i32;
> +    case INDEX_op_rotl_i32:
> +    case INDEX_op_rotr_i32:
> +        return TCG_TARGET_HAS_rot_i32;
> +    case INDEX_op_deposit_i32:
> +        return TCG_TARGET_HAS_deposit_i32;
> +    case INDEX_op_extract_i32:
> +        return TCG_TARGET_HAS_extract_i32;
> +    case INDEX_op_sextract_i32:
> +        return TCG_TARGET_HAS_sextract_i32;
> +    case INDEX_op_add2_i32:
> +        return TCG_TARGET_HAS_add2_i32;
> +    case INDEX_op_sub2_i32:
> +        return TCG_TARGET_HAS_sub2_i32;
> +    case INDEX_op_mulu2_i32:
> +        return TCG_TARGET_HAS_mulu2_i32;
> +    case INDEX_op_muls2_i32:
> +        return TCG_TARGET_HAS_muls2_i32;
> +    case INDEX_op_muluh_i32:
> +        return TCG_TARGET_HAS_muluh_i32;
> +    case INDEX_op_mulsh_i32:
> +        return TCG_TARGET_HAS_mulsh_i32;
> +    case INDEX_op_ext8s_i32:
> +        return TCG_TARGET_HAS_ext8s_i32;
> +    case INDEX_op_ext16s_i32:
> +        return TCG_TARGET_HAS_ext16s_i32;
> +    case INDEX_op_ext8u_i32:
> +        return TCG_TARGET_HAS_ext8u_i32;
> +    case INDEX_op_ext16u_i32:
> +        return TCG_TARGET_HAS_ext16u_i32;
> +    case INDEX_op_bswap16_i32:
> +        return TCG_TARGET_HAS_bswap16_i32;
> +    case INDEX_op_bswap32_i32:
> +        return TCG_TARGET_HAS_bswap32_i32;
> +    case INDEX_op_not_i32:
> +        return TCG_TARGET_HAS_not_i32;
> +    case INDEX_op_neg_i32:
> +        return TCG_TARGET_HAS_neg_i32;
> +    case INDEX_op_andc_i32:
> +        return TCG_TARGET_HAS_andc_i32;
> +    case INDEX_op_orc_i32:
> +        return TCG_TARGET_HAS_orc_i32;
> +    case INDEX_op_eqv_i32:
> +        return TCG_TARGET_HAS_eqv_i32;
> +    case INDEX_op_nand_i32:
> +        return TCG_TARGET_HAS_nand_i32;
> +    case INDEX_op_nor_i32:
> +        return TCG_TARGET_HAS_nor_i32;
> +    case INDEX_op_clz_i32:
> +        return TCG_TARGET_HAS_clz_i32;
> +    case INDEX_op_ctz_i32:
> +        return TCG_TARGET_HAS_ctz_i32;
> +    case INDEX_op_ctpop_i32:
> +        return TCG_TARGET_HAS_ctpop_i32;
> +
> +    case INDEX_op_brcond2_i32:
> +    case INDEX_op_setcond2_i32:
> +        return TCG_TARGET_REG_BITS == 32;
> +
> +    case INDEX_op_mov_i64:
> +    case INDEX_op_movi_i64:
> +    case INDEX_op_setcond_i64:
> +    case INDEX_op_brcond_i64:
> +    case INDEX_op_ld8u_i64:
> +    case INDEX_op_ld8s_i64:
> +    case INDEX_op_ld16u_i64:
> +    case INDEX_op_ld16s_i64:
> +    case INDEX_op_ld32u_i64:
> +    case INDEX_op_ld32s_i64:
> +    case INDEX_op_ld_i64:
> +    case INDEX_op_st8_i64:
> +    case INDEX_op_st16_i64:
> +    case INDEX_op_st32_i64:
> +    case INDEX_op_st_i64:
> +    case INDEX_op_add_i64:
> +    case INDEX_op_sub_i64:
> +    case INDEX_op_mul_i64:
> +    case INDEX_op_and_i64:
> +    case INDEX_op_or_i64:
> +    case INDEX_op_xor_i64:
> +    case INDEX_op_shl_i64:
> +    case INDEX_op_shr_i64:
> +    case INDEX_op_sar_i64:
> +    case INDEX_op_ext_i32_i64:
> +    case INDEX_op_extu_i32_i64:
> +        return TCG_TARGET_REG_BITS == 64;
> +
> +    case INDEX_op_movcond_i64:
> +        return TCG_TARGET_HAS_movcond_i64;
> +    case INDEX_op_div_i64:
> +    case INDEX_op_divu_i64:
> +        return TCG_TARGET_HAS_div_i64;
> +    case INDEX_op_rem_i64:
> +    case INDEX_op_remu_i64:
> +        return TCG_TARGET_HAS_rem_i64;
> +    case INDEX_op_div2_i64:
> +    case INDEX_op_divu2_i64:
> +        return TCG_TARGET_HAS_div2_i64;
> +    case INDEX_op_rotl_i64:
> +    case INDEX_op_rotr_i64:
> +        return TCG_TARGET_HAS_rot_i64;
> +    case INDEX_op_deposit_i64:
> +        return TCG_TARGET_HAS_deposit_i64;
> +    case INDEX_op_extract_i64:
> +        return TCG_TARGET_HAS_extract_i64;
> +    case INDEX_op_sextract_i64:
> +        return TCG_TARGET_HAS_sextract_i64;
> +    case INDEX_op_extrl_i64_i32:
> +        return TCG_TARGET_HAS_extrl_i64_i32;
> +    case INDEX_op_extrh_i64_i32:
> +        return TCG_TARGET_HAS_extrh_i64_i32;
> +    case INDEX_op_ext8s_i64:
> +        return TCG_TARGET_HAS_ext8s_i64;
> +    case INDEX_op_ext16s_i64:
> +        return TCG_TARGET_HAS_ext16s_i64;
> +    case INDEX_op_ext32s_i64:
> +        return TCG_TARGET_HAS_ext32s_i64;
> +    case INDEX_op_ext8u_i64:
> +        return TCG_TARGET_HAS_ext8u_i64;
> +    case INDEX_op_ext16u_i64:
> +        return TCG_TARGET_HAS_ext16u_i64;
> +    case INDEX_op_ext32u_i64:
> +        return TCG_TARGET_HAS_ext32u_i64;
> +    case INDEX_op_bswap16_i64:
> +        return TCG_TARGET_HAS_bswap16_i64;
> +    case INDEX_op_bswap32_i64:
> +        return TCG_TARGET_HAS_bswap32_i64;
> +    case INDEX_op_bswap64_i64:
> +        return TCG_TARGET_HAS_bswap64_i64;
> +    case INDEX_op_not_i64:
> +        return TCG_TARGET_HAS_not_i64;
> +    case INDEX_op_neg_i64:
> +        return TCG_TARGET_HAS_neg_i64;
> +    case INDEX_op_andc_i64:
> +        return TCG_TARGET_HAS_andc_i64;
> +    case INDEX_op_orc_i64:
> +        return TCG_TARGET_HAS_orc_i64;
> +    case INDEX_op_eqv_i64:
> +        return TCG_TARGET_HAS_eqv_i64;
> +    case INDEX_op_nand_i64:
> +        return TCG_TARGET_HAS_nand_i64;
> +    case INDEX_op_nor_i64:
> +        return TCG_TARGET_HAS_nor_i64;
> +    case INDEX_op_clz_i64:
> +        return TCG_TARGET_HAS_clz_i64;
> +    case INDEX_op_ctz_i64:
> +        return TCG_TARGET_HAS_ctz_i64;
> +    case INDEX_op_ctpop_i64:
> +        return TCG_TARGET_HAS_ctpop_i64;
> +    case INDEX_op_add2_i64:
> +        return TCG_TARGET_HAS_add2_i64;
> +    case INDEX_op_sub2_i64:
> +        return TCG_TARGET_HAS_sub2_i64;
> +    case INDEX_op_mulu2_i64:
> +        return TCG_TARGET_HAS_mulu2_i64;
> +    case INDEX_op_muls2_i64:
> +        return TCG_TARGET_HAS_muls2_i64;
> +    case INDEX_op_muluh_i64:
> +        return TCG_TARGET_HAS_muluh_i64;
> +    case INDEX_op_mulsh_i64:
> +        return TCG_TARGET_HAS_mulsh_i64;
> +
> +    case INDEX_op_mov_v64:
> +    case INDEX_op_movi_v64:
> +    case INDEX_op_ld_v64:
> +    case INDEX_op_st_v64:
> +    case INDEX_op_and_v64:
> +    case INDEX_op_or_v64:
> +    case INDEX_op_xor_v64:
> +    case INDEX_op_add8_v64:
> +    case INDEX_op_add16_v64:
> +    case INDEX_op_add32_v64:
> +    case INDEX_op_sub8_v64:
> +    case INDEX_op_sub16_v64:
> +    case INDEX_op_sub32_v64:
> +        return TCG_TARGET_HAS_v64;
> +
> +    case INDEX_op_mov_v128:
> +    case INDEX_op_movi_v128:
> +    case INDEX_op_ld_v128:
> +    case INDEX_op_st_v128:
> +    case INDEX_op_and_v128:
> +    case INDEX_op_or_v128:
> +    case INDEX_op_xor_v128:
> +    case INDEX_op_add8_v128:
> +    case INDEX_op_add16_v128:
> +    case INDEX_op_add32_v128:
> +    case INDEX_op_add64_v128:
> +    case INDEX_op_sub8_v128:
> +    case INDEX_op_sub16_v128:
> +    case INDEX_op_sub32_v128:
> +    case INDEX_op_sub64_v128:
> +        return TCG_TARGET_HAS_v128;
> +
> +    case INDEX_op_mov_v256:
> +    case INDEX_op_movi_v256:
> +    case INDEX_op_ld_v256:
> +    case INDEX_op_st_v256:
> +    case INDEX_op_and_v256:
> +    case INDEX_op_or_v256:
> +    case INDEX_op_xor_v256:
> +    case INDEX_op_add8_v256:
> +    case INDEX_op_add16_v256:
> +    case INDEX_op_add32_v256:
> +    case INDEX_op_add64_v256:
> +    case INDEX_op_sub8_v256:
> +    case INDEX_op_sub16_v256:
> +    case INDEX_op_sub32_v256:
> +    case INDEX_op_sub64_v256:
> +        return TCG_TARGET_HAS_v256;
> +
> +    case INDEX_op_not_v64:
> +        return TCG_TARGET_HAS_not_v64;
> +    case INDEX_op_not_v128:
> +        return TCG_TARGET_HAS_not_v128;
> +    case INDEX_op_not_v256:
> +        return TCG_TARGET_HAS_not_v256;
> +
> +    case INDEX_op_andc_v64:
> +        return TCG_TARGET_HAS_andc_v64;
> +    case INDEX_op_andc_v128:
> +        return TCG_TARGET_HAS_andc_v128;
> +    case INDEX_op_andc_v256:
> +        return TCG_TARGET_HAS_andc_v256;
> +
> +    case INDEX_op_orc_v64:
> +        return TCG_TARGET_HAS_orc_v64;
> +    case INDEX_op_orc_v128:
> +        return TCG_TARGET_HAS_orc_v128;
> +    case INDEX_op_orc_v256:
> +        return TCG_TARGET_HAS_orc_v256;
> +
> +    case INDEX_op_neg8_v64:
> +    case INDEX_op_neg16_v64:
> +    case INDEX_op_neg32_v64:
> +        return TCG_TARGET_HAS_neg_v64;
> +
> +    case INDEX_op_neg8_v128:
> +    case INDEX_op_neg16_v128:
> +    case INDEX_op_neg32_v128:
> +    case INDEX_op_neg64_v128:
> +        return TCG_TARGET_HAS_neg_v128;
> +
> +    case INDEX_op_neg8_v256:
> +    case INDEX_op_neg16_v256:
> +    case INDEX_op_neg32_v256:
> +    case INDEX_op_neg64_v256:
> +        return TCG_TARGET_HAS_neg_v256;
> +
> +    case NB_OPS:
> +        break;
> +    }
> +    g_assert_not_reached();
> +}
> +
>   /* Note: we convert the 64 bit args to 32 bit and do some alignment
>      and endian swap. Maybe it would be better to do the alignment
>      and endian swap in tcg_reg_alloc_call(). */
> 
