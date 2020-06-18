Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1633783lfm;
        Thu, 18 Jun 2020 06:17:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwBJVKrH3SCSnvw+XbFA2NP/cLzBJrPlBgvxWhE3Sek2CYFpMliVM7m2hb/U2dZN+RzMQuA
X-Received: by 2002:a25:4d44:: with SMTP id a65mr6641345ybb.422.1592486276763;
        Thu, 18 Jun 2020 06:17:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592486276; cv=none;
        d=google.com; s=arc-20160816;
        b=x4lGm1FXEERfuPEkNDnphFrQ2uVrETfg014Yxo26s3vhQNrcy3zVRDnJtYJFzQHKKY
         E3E7yQ6cc43x7HWcaeu/4r+yUr51IROYwu03ewiFO/KlC1hSGoeMLQYzKi7Gfy557qqA
         KBXGbwbN7XTZS2VwdnVG4nljetemTDFa9RhO+dXGHz8P17Kotz/FqcP2TRNdK+c1crNO
         CHyRk1I3zdQkNwweg5wW1BtUfGum+LyAW8uRlIfNWrMNkC+nEtszVybyImJVosOBIpbT
         o5i0Lo6RZZkUURHPDCqfqU3Nf7EEA5U88ojBrWdfdKaUsmHFdj9AR+HRG83pLNUaSpst
         yt3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=newU3v53ZM90+fgWgn75vARkrf41mvienMtSYmaaQqk=;
        b=ltmXbAA0ZScsVWrMD27Ql9BAjCg8y/UNsIlSR1L5wGrpLJaQtIuiKDNzmKE0JKZmIO
         rLepu+XNAi+Y70fuye1zos7AEwSLzMMOvtcCmU0jY/ccwWcCwSsZUk55Giffj2okg8Th
         CNkrRUs92nsJ1L4ZLEDF0iNiUFxKW3uJxR1X7m/R+IE3bP3GDvNLuHrSEODW9nD6jG6U
         4wrZTqoNIk6Cc8f/WK6ZuSD5wDIeGn1sFyg2QflioGih+ljrW+zWpUsspshNZPwG5G5v
         9Z3xvys7SLhYsYtrPin7DVQ4dddDHX1oEB5h9P4WKbCqpMHdu136sdcRz+hB21nSlqya
         F9gw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=IjiFSns7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f63si2365343ybf.175.2020.06.18.06.17.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 18 Jun 2020 06:17:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=IjiFSns7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jluQW-00008r-51
	for alex.bennee@linaro.org; Thu, 18 Jun 2020 09:17:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jluQG-00006z-Sx
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 09:17:45 -0400
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:46291)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jluQC-0004ka-AJ
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 09:17:39 -0400
Received: by mail-oi1-x244.google.com with SMTP id 25so4983496oiy.13
 for <qemu-arm@nongnu.org>; Thu, 18 Jun 2020 06:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=newU3v53ZM90+fgWgn75vARkrf41mvienMtSYmaaQqk=;
 b=IjiFSns7jacOqmZ5amJOmH+ugaw0+qXgPo9Y35MNnRtJ85s524UYnQs3Pt63gKX4k3
 N/ba1NfOO2EyKaB2Go8je/3WRHCpoLTFCDbo2UrlI+9uH61Egy/s5aIaTBoq/TOuDTOM
 jUPP474ak//bvtYKHauAvG6Mfq+VW/RX4tiZ8InjiElvfKY3D+ySYV27RiTZ0LbsaV1n
 G4EMiilLvmsjtwZc3ePL4nHWec74+j2EpBl9u81iW8/QcyhDaVhlhkj9Um77xtloh9Uy
 km4Dy/xqRD4sMd6zbCisv+NkjuxQ7E5OUYV88GRCaJBtZdZCMFTukysPPJc+5a7VmfWZ
 z9bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=newU3v53ZM90+fgWgn75vARkrf41mvienMtSYmaaQqk=;
 b=U5IzjX4y20SGrulLXBY6HgyG61Ob9EhiSFFnNhfCfS+quyI+OzUZBpU5abSAJS8xfK
 ub5R2a6XB4whjNulQoz1pt7pB3Yh1msZG3jgnZ4QOBRrTqjR5FTFvoNttKOO+TOQxDV/
 bsXy54lkmTd3uz1Twq+0rCQEUSefcQskupAVGjerQza7udPiaVRORHUReYF+VjUbtEX3
 NZwpF0aFEB4QbaZ8h5qD+XsSoGP2HYzJBQKW6HTmLivx1U4we4Q25fqunaDcv2dEE1zz
 FtLsm/rnAFr50CXvBPsdlVj//PRjndx0nAzUWatz4RUaWPyp6THRCccyAHUcmva7n9te
 aJYw==
X-Gm-Message-State: AOAM533C7Bka6AswLOHkOkjCqyCTjuUDhV+/0ceG0zWt7CinBA07riGD
 uJEYj/k7f6ESs6qpJz0GscPv/tLDmrXr1WMddzStJg==
X-Received: by 2002:aca:1a07:: with SMTP id a7mr2794395oia.163.1592486254943; 
 Thu, 18 Jun 2020 06:17:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200603011317.473934-1-richard.henderson@linaro.org>
 <20200603011317.473934-11-richard.henderson@linaro.org>
In-Reply-To: <20200603011317.473934-11-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 18 Jun 2020 14:17:23 +0100
Message-ID: <CAFEAcA-QZ_D1tQMv785xsxWwcEKmM76dK4Mvgx=y7eyb_mUqEg@mail.gmail.com>
Subject: Re: [PATCH v7 10/42] target/arm: Implement the ADDG, SUBG instructions
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::244;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x244.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Stephen Long <steplong@quicinc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fwTPTrNa0JpT

On Wed, 3 Jun 2020 at 02:13, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v2: Shift offset in translate; use extract32.
> v6: Implement inline for !ATA.

> diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
> index 2481561925..a18d71ad98 100644
> --- a/target/arm/translate-a64.c
> +++ b/target/arm/translate-a64.c
> @@ -3753,17 +3753,20 @@ static void disas_pc_rel_adr(DisasContext *s, uint32_t insn)
>   *    sf: 0 -> 32bit, 1 -> 64bit
>   *    op: 0 -> add  , 1 -> sub
>   *     S: 1 -> set flags
> - * shift: 00 -> LSL imm by 0, 01 -> LSL imm by 12
> + * shift: 00 -> LSL imm by 0,
> + *        01 -> LSL imm by 12
> + *        10 -> ADDG, SUBG
>   */
>  static void disas_add_sub_imm(DisasContext *s, uint32_t insn)
>  {
>      int rd = extract32(insn, 0, 5);
>      int rn = extract32(insn, 5, 5);
> -    uint64_t imm = extract32(insn, 10, 12);
> +    int imm = extract32(insn, 10, 12);
>      int shift = extract32(insn, 22, 2);
>      bool setflags = extract32(insn, 29, 1);
>      bool sub_op = extract32(insn, 30, 1);
>      bool is_64bit = extract32(insn, 31, 1);
> +    bool is_tag = false;
>
>      TCGv_i64 tcg_rn = cpu_reg_sp(s, rn);
>      TCGv_i64 tcg_rd = setflags ? cpu_reg(s, rd) : cpu_reg_sp(s, rd);
> @@ -3775,11 +3778,40 @@ static void disas_add_sub_imm(DisasContext *s, uint32_t insn)
>      case 0x1:
>          imm <<= 12;
>          break;
> +    case 0x2:
> +        /* ADDG, SUBG */
> +        if (!is_64bit || setflags || (imm & 0x30) ||
> +            !dc_isar_feature(aa64_mte_insn_reg, s)) {
> +            goto do_unallocated;
> +        }
> +        is_tag = true;
> +        break;
>      default:
> +    do_unallocated:
>          unallocated_encoding(s);
>          return;
>      }
>
> +    if (is_tag) {
> +        imm = (imm >> 6) << LOG2_TAG_GRANULE;
> +        if (sub_op) {
> +            imm = -imm;
> +        }
> +
> +        if (s->ata) {
> +            TCGv_i32 tag_offset = tcg_const_i32(imm & 15);
> +            TCGv_i32 offset = tcg_const_i32(imm);
> +
> +            gen_helper_addsubg(tcg_rd, cpu_env, tcg_rn, offset, tag_offset);
> +            tcg_temp_free_i32(tag_offset);
> +            tcg_temp_free_i32(offset);
> +        } else {
> +            tcg_gen_addi_i64(tcg_rd, tcg_rn, imm);
> +            gen_address_with_allocation_tag0(tcg_rd, tcg_rd);
> +        }
> +        return;
> +    }

Given that we don't really share any of the codegen with the
existing disas_add_sub_imm() insns, and the insn format isn't
the same (uimm6/op3/uimm4 rather than an imm12), I'm tempted
to suggest we should structure this the same way the Arm ARM
decode tables do, where "Add/subtract (immediate, with tags)"
is a separate subtable from "Add/subtract (immediate)": so
instead of disas_data_proc_imm() sending both case
0x22 and 0x23 to disas_add_sub_imm(), it would send 0x23
to a new disas_add_sub_tag().

But this patch is functionally correct, so if you don't
feel like making that change you can have
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
for this version.

thanks
-- PMM
