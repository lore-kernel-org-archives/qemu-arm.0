Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp7417435wrv;
        Wed, 7 Aug 2019 22:43:35 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxTdw7FcfqT253iSygHpMGfoSL1RCZXqSNyF9d0YfW5CGeB13LvhcrZTBsQT0SjRoFnqfNc
X-Received: by 2002:a0c:e8c7:: with SMTP id m7mr11831272qvo.134.1565243015654;
        Wed, 07 Aug 2019 22:43:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565243015; cv=none;
        d=google.com; s=arc-20160816;
        b=uBksy4b2ur9+7AYF6j+vx5VZyhKov26+3UoeImS9e3AgZjGx7ZsH/5JMIM9Y+1OBt5
         LmdOzBjRXbOM+qaIemfdPTin8AWZmKi7DMLWjZkcTBwCFBt5T9bU5lYs2pxrwxhrt57W
         TYf78CXu56L8NIFOGpnnrvjdxSrAbmEvNop4l3ykT2TNcVdTQGaf/SmdMO3+CQGjbMi4
         3V5Gk0aWrJ/rVuj3PqYMHVC+P4drONgp5KawKVOPebzi4IR7zMX0Uu/dDfmWUwxIcks3
         ncWOet/KqHrcGV/UmaWsvJJHrvH2iscm4oDGfTdkinXb1Y0zBT2DePlDJs93HBkbmGtD
         cqTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=4ktMNMcifd96VH/C+Jk6LLfAiaM0PA0RVtXSt27cfhc=;
        b=fT6b08NYrK7Zfn6jtX6Lyqrumi7eXkMqBkCcC7Db162oETi2m39s7Ja9430spziqnN
         pdCUu8OJpG2b7wHWgT0baBUAFUwu22DQrfbxwU7NqMyoYUtwd/+uP+3Q3UbF3KbUZfpM
         GjjJIYLQbEMmxBMCrCkypY9fFzjCC8titPkUe0DYSY3Epsni3vD1aX8mfQB4n/zWHCHv
         5YlZExDI89dDR4pZlJr+W9I3usRTQBkkTTCMndczFaQSHXfhcq/y11WRgj8PQ9eTbbuD
         dXVnmt+vLNHy2a7rfZttX1+5TmCdLEajZJ3JB6Lg/yI9rTCOxhUmHfFPh8hFddeBl+h8
         p6PA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g18si50160438qkl.112.2019.08.07.22.43.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Aug 2019 22:43:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hvbD5-0000kE-7c
	for alex.bennee@linaro.org; Thu, 08 Aug 2019 01:43:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60705)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hvbCy-0000jq-Jc
 for qemu-arm@nongnu.org; Thu, 08 Aug 2019 01:43:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hvbCw-0000dJ-V3
 for qemu-arm@nongnu.org; Thu, 08 Aug 2019 01:43:28 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:43039)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hvbCw-0000cy-O8
 for qemu-arm@nongnu.org; Thu, 08 Aug 2019 01:43:26 -0400
Received: by mail-wr1-f68.google.com with SMTP id p13so19000980wru.10
 for <qemu-arm@nongnu.org>; Wed, 07 Aug 2019 22:43:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4ktMNMcifd96VH/C+Jk6LLfAiaM0PA0RVtXSt27cfhc=;
 b=Jlr1YPUbOXEKQVkFyHl5lX+c9k3TnQpUzVatR7LraFr0rpcPzFIsF5rGPRUKwvUES5
 Shq1u7AIlnlcRpa4LZnLWWbkwIhIek4zHdZFwDyLEuAH0wKiBFpr4vsW7da37CmLVPYP
 5qiTPJI2prWCXY6p2yeKk2C9Q/+BWfIJXSkgLLe4KUaSbTlDKr3zGNzIAcEpitZlNjHz
 j5FPh0B24c5M3SaKcxY9DDAjRvciifm9e0Ff5j7z5f7lQqfyndDepRtXf6jB27tqP2ip
 XsxY/9Jw0nFWbdA5wkonHOGT66mFmOLc8nYjYvvcT+HgN/alXf4peiWZv7K+F11nZ5X6
 OI5w==
X-Gm-Message-State: APjAAAVexq88NQ24kRBFNcBtt+lx5JvjDddTqeyhrTFHzv7YwaIDDzcW
 hS6tuGWxFM8d9bvuiuiEQgJt5YO2Qi8=
X-Received: by 2002:adf:e8d0:: with SMTP id k16mr14641086wrn.31.1565243005567; 
 Wed, 07 Aug 2019 22:43:25 -0700 (PDT)
Received: from [192.168.1.39] (214.red-83-51-160.dynamicip.rima-tde.net.
 [83.51.160.214])
 by smtp.gmail.com with ESMTPSA id v124sm2485574wmf.23.2019.08.07.22.43.24
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Wed, 07 Aug 2019 22:43:25 -0700 (PDT)
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20190807045335.1361-1-richard.henderson@linaro.org>
 <20190807045335.1361-5-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <d1e54ad9-377a-5d57-c804-5bc587f02750@redhat.com>
Date: Thu, 8 Aug 2019 07:43:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190807045335.1361-5-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.68
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 04/11] target/arm: Introduce
 add_reg_for_lit
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2MQVwNBIYWQ1

On 8/7/19 6:53 AM, Richard Henderson wrote:
> Provide a common routine for the places that require ALIGN(PC, 4)
> as the base address as opposed to plain PC.  The two are always
> the same for A32, but the difference is meaningful for thumb mode.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> Note: This patch is easier to read with -b, as there are several
> large-ish indentation changes as the if statements fold together.
> ---
>  target/arm/translate-vfp.inc.c |  38 ++------
>  target/arm/translate.c         | 166 +++++++++++++++------------------
>  2 files changed, 82 insertions(+), 122 deletions(-)
> 
> diff --git a/target/arm/translate-vfp.inc.c b/target/arm/translate-vfp.inc.c
> index 092eb5ec53..262d4177e5 100644
> --- a/target/arm/translate-vfp.inc.c
> +++ b/target/arm/translate-vfp.inc.c
> @@ -941,14 +941,8 @@ static bool trans_VLDR_VSTR_sp(DisasContext *s, arg_VLDR_VSTR_sp *a)
>          offset = -offset;
>      }
>  
> -    if (s->thumb && a->rn == 15) {
> -        /* This is actually UNPREDICTABLE */
> -        addr = tcg_temp_new_i32();
> -        tcg_gen_movi_i32(addr, s->pc & ~2);
> -    } else {
> -        addr = load_reg(s, a->rn);
> -    }
> -    tcg_gen_addi_i32(addr, addr, offset);
> +    /* For thumb, use of PC is UNPREDICTABLE.  */
> +    addr = add_reg_for_lit(s, a->rn, offset);
>      tmp = tcg_temp_new_i32();
>      if (a->l) {
>          gen_aa32_ld32u(s, tmp, addr, get_mem_index(s));
> @@ -983,14 +977,8 @@ static bool trans_VLDR_VSTR_dp(DisasContext *s, arg_VLDR_VSTR_dp *a)
>          offset = -offset;
>      }
>  
> -    if (s->thumb && a->rn == 15) {
> -        /* This is actually UNPREDICTABLE */
> -        addr = tcg_temp_new_i32();
> -        tcg_gen_movi_i32(addr, s->pc & ~2);
> -    } else {
> -        addr = load_reg(s, a->rn);
> -    }
> -    tcg_gen_addi_i32(addr, addr, offset);
> +    /* For thumb, use of PC is UNPREDICTABLE.  */
> +    addr = add_reg_for_lit(s, a->rn, offset);
>      tmp = tcg_temp_new_i64();
>      if (a->l) {
>          gen_aa32_ld64(s, tmp, addr, get_mem_index(s));
> @@ -1029,13 +1017,8 @@ static bool trans_VLDM_VSTM_sp(DisasContext *s, arg_VLDM_VSTM_sp *a)
>          return true;
>      }
>  
> -    if (s->thumb && a->rn == 15) {
> -        /* This is actually UNPREDICTABLE */
> -        addr = tcg_temp_new_i32();
> -        tcg_gen_movi_i32(addr, s->pc & ~2);
> -    } else {
> -        addr = load_reg(s, a->rn);
> -    }
> +    /* For thumb, use of PC is UNPREDICTABLE.  */
> +    addr = add_reg_for_lit(s, a->rn, 0);
>      if (a->p) {
>          /* pre-decrement */
>          tcg_gen_addi_i32(addr, addr, -(a->imm << 2));
> @@ -1112,13 +1095,8 @@ static bool trans_VLDM_VSTM_dp(DisasContext *s, arg_VLDM_VSTM_dp *a)
>          return true;
>      }
>  
> -    if (s->thumb && a->rn == 15) {
> -        /* This is actually UNPREDICTABLE */
> -        addr = tcg_temp_new_i32();
> -        tcg_gen_movi_i32(addr, s->pc & ~2);
> -    } else {
> -        addr = load_reg(s, a->rn);
> -    }
> +    /* For thumb, use of PC is UNPREDICTABLE.  */
> +    addr = add_reg_for_lit(s, a->rn, 0);
>      if (a->p) {
>          /* pre-decrement */
>          tcg_gen_addi_i32(addr, addr, -(a->imm << 2));
> diff --git a/target/arm/translate.c b/target/arm/translate.c
> index 61933865d5..71d94c053b 100644
> --- a/target/arm/translate.c
> +++ b/target/arm/translate.c
> @@ -220,6 +220,23 @@ static inline TCGv_i32 load_reg(DisasContext *s, int reg)
>      return tmp;
>  }
>  
> +/*
> + * Create a new temp, REG + OFS, except PC is ALIGN(PC, 4).
> + * This is used for load/store for which use of PC implies (literal),
> + * or ADD that implies ADR.
> + */
> +static TCGv_i32 add_reg_for_lit(DisasContext *s, int reg, int ofs)
> +{
> +    TCGv_i32 tmp = tcg_temp_new_i32();
> +
> +    if (reg == 15) {
> +        tcg_gen_movi_i32(tmp, (read_pc(s) & ~3) + ofs);
> +    } else {
> +        tcg_gen_addi_i32(tmp, cpu_R[reg], ofs);
> +    }
> +    return tmp;
> +}
> +
>  /* Set a CPU register.  The source must be a temporary and will be
>     marked as dead.  */
>  static void store_reg(DisasContext *s, int reg, TCGv_i32 var)
> @@ -9472,16 +9489,12 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
>                   */
>                  bool wback = extract32(insn, 21, 1);
>  
> -                if (rn == 15) {
> -                    if (insn & (1 << 21)) {
> -                        /* UNPREDICTABLE */
> -                        goto illegal_op;
> -                    }
> -                    addr = tcg_temp_new_i32();
> -                    tcg_gen_movi_i32(addr, s->pc & ~3);
> -                } else {
> -                    addr = load_reg(s, rn);
> +                if (rn == 15 && (insn & (1 << 21))) {
> +                    /* UNPREDICTABLE */
> +                    goto illegal_op;
>                  }
> +
> +                addr = add_reg_for_lit(s, rn, 0);
>                  offset = (insn & 0xff) * 4;
>                  if ((insn & (1 << 23)) == 0) {
>                      offset = -offset;
> @@ -10682,27 +10695,15 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
>                          store_reg(s, rd, tmp);
>                      } else {
>                          /* Add/sub 12-bit immediate.  */
> -                        if (rn == 15) {
> -                            offset = s->pc & ~(uint32_t)3;
> -                            if (insn & (1 << 23))
> -                                offset -= imm;
> -                            else
> -                                offset += imm;
> -                            tmp = tcg_temp_new_i32();
> -                            tcg_gen_movi_i32(tmp, offset);
> -                            store_reg(s, rd, tmp);
> +                        if (insn & (1 << 23)) {
> +                            imm = -imm;

:)

> +                        }
> +                        tmp = add_reg_for_lit(s, rn, imm);
> +                        if (rn == 13 && rd == 13) {
> +                            /* ADD SP, SP, imm or SUB SP, SP, imm */
> +                            store_sp_checked(s, tmp);
>                          } else {
> -                            tmp = load_reg(s, rn);
> -                            if (insn & (1 << 23))
> -                                tcg_gen_subi_i32(tmp, tmp, imm);
> -                            else
> -                                tcg_gen_addi_i32(tmp, tmp, imm);
> -                            if (rn == 13 && rd == 13) {
> -                                /* ADD SP, SP, imm or SUB SP, SP, imm */
> -                                store_sp_checked(s, tmp);
> -                            } else {
> -                                store_reg(s, rd, tmp);
> -                            }
> +                            store_reg(s, rd, tmp);
>                          }
>                      }
>                  }
> @@ -10816,61 +10817,53 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
>              }
>          }
>          memidx = get_mem_index(s);
> -        if (rn == 15) {
> -            addr = tcg_temp_new_i32();
> -            /* PC relative.  */
> -            /* s->pc has already been incremented by 4.  */
> -            imm = s->pc & 0xfffffffc;
> -            if (insn & (1 << 23))
> -                imm += insn & 0xfff;
> -            else
> -                imm -= insn & 0xfff;
> -            tcg_gen_movi_i32(addr, imm);
> +        imm = insn & 0xfff;
> +        if (insn & (1 << 23)) {
> +            /* PC relative or Positive offset.  */
> +            addr = add_reg_for_lit(s, rn, imm);
> +        } else if (rn == 15) {
> +            /* PC relative with negative offset.  */
> +            addr = add_reg_for_lit(s, rn, -imm);
>          } else {
>              addr = load_reg(s, rn);
> -            if (insn & (1 << 23)) {
> -                /* Positive offset.  */
> -                imm = insn & 0xfff;
> -                tcg_gen_addi_i32(addr, addr, imm);
> -            } else {
> -                imm = insn & 0xff;
> -                switch ((insn >> 8) & 0xf) {
> -                case 0x0: /* Shifted Register.  */
> -                    shift = (insn >> 4) & 0xf;
> -                    if (shift > 3) {
> -                        tcg_temp_free_i32(addr);
> -                        goto illegal_op;
> -                    }
> -                    tmp = load_reg(s, rm);
> -                    if (shift)

'diff -b' shows me you removed this 'if (shift)' but ...

> -                        tcg_gen_shli_i32(tmp, tmp, shift);
> -                    tcg_gen_add_i32(addr, addr, tmp);
> -                    tcg_temp_free_i32(tmp);
> -                    break;
> -                case 0xc: /* Negative offset.  */
> -                    tcg_gen_addi_i32(addr, addr, -imm);
> -                    break;
> -                case 0xe: /* User privilege.  */
> -                    tcg_gen_addi_i32(addr, addr, imm);
> -                    memidx = get_a32_user_mem_index(s);
> -                    break;
> -                case 0x9: /* Post-decrement.  */
> -                    imm = -imm;
> -                    /* Fall through.  */
> -                case 0xb: /* Post-increment.  */
> -                    postinc = 1;
> -                    writeback = 1;
> -                    break;
> -                case 0xd: /* Pre-decrement.  */
> -                    imm = -imm;
> -                    /* Fall through.  */
> -                case 0xf: /* Pre-increment.  */
> -                    writeback = 1;
> -                    break;
> -                default:
> +            imm = insn & 0xff;
> +            switch ((insn >> 8) & 0xf) {
> +            case 0x0: /* Shifted Register.  */
> +                shift = (insn >> 4) & 0xf;
> +                if (shift > 3) {
>                      tcg_temp_free_i32(addr);
>                      goto illegal_op;
>                  }
> +                tmp = load_reg(s, rm);
> +                if (shift) {

... I'm seeing it here. Odd.

> +                    tcg_gen_shli_i32(tmp, tmp, shift);
> +                }
> +                tcg_gen_add_i32(addr, addr, tmp);
> +                tcg_temp_free_i32(tmp);
> +                break;
> +            case 0xc: /* Negative offset.  */
> +                tcg_gen_addi_i32(addr, addr, -imm);
> +                break;
> +            case 0xe: /* User privilege.  */
> +                tcg_gen_addi_i32(addr, addr, imm);
> +                memidx = get_a32_user_mem_index(s);
> +                break;
> +            case 0x9: /* Post-decrement.  */
> +                imm = -imm;
> +                /* Fall through.  */
> +            case 0xb: /* Post-increment.  */
> +                postinc = 1;
> +                writeback = 1;
> +                break;
> +            case 0xd: /* Pre-decrement.  */
> +                imm = -imm;
> +                /* Fall through.  */
> +            case 0xf: /* Pre-increment.  */
> +                writeback = 1;
> +                break;
> +            default:
> +                tcg_temp_free_i32(addr);
> +                goto illegal_op;
>              }
>          }
>  
> @@ -11066,10 +11059,7 @@ static void disas_thumb_insn(DisasContext *s, uint32_t insn)
>          if (insn & (1 << 11)) {
>              rd = (insn >> 8) & 7;
>              /* load pc-relative.  Bit 1 of PC is ignored.  */
> -            val = read_pc(s) + ((insn & 0xff) * 4);
> -            val &= ~(uint32_t)2;
> -            addr = tcg_temp_new_i32();
> -            tcg_gen_movi_i32(addr, val);
> +            addr = add_reg_for_lit(s, 15, (insn & 0xff) * 4);
>              tmp = tcg_temp_new_i32();
>              gen_aa32_ld32u_iss(s, tmp, addr, get_mem_index(s),
>                                 rd | ISSIs16Bit);
> @@ -11447,16 +11437,8 @@ static void disas_thumb_insn(DisasContext *s, uint32_t insn)
>           *  - Add PC/SP (immediate)
>           */
>          rd = (insn >> 8) & 7;
> -        if (insn & (1 << 11)) {
> -            /* SP */
> -            tmp = load_reg(s, 13);
> -        } else {
> -            /* PC. bit 1 is ignored.  */
> -            tmp = tcg_temp_new_i32();
> -            tcg_gen_movi_i32(tmp, read_pc(s) & ~(uint32_t)2);
> -        }
>          val = (insn & 0xff) * 4;
> -        tcg_gen_addi_i32(tmp, tmp, val);
> +        tmp = add_reg_for_lit(s, insn & (1 << 11) ? 13 : 15, val);
>          store_reg(s, rd, tmp);
>          break;

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

