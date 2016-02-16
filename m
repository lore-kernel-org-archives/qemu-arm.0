Received: by 10.25.208.211 with SMTP id h202csp1528156lfg;
        Tue, 16 Feb 2016 13:11:53 -0800 (PST)
X-Received: by 10.25.15.226 with SMTP id 95mr11255573lfp.85.1455657113832;
        Tue, 16 Feb 2016 13:11:53 -0800 (PST)
Return-Path: <serge.fdrv@gmail.com>
Received: from mail-lb0-x235.google.com (mail-lb0-x235.google.com. [2a00:1450:4010:c04::235])
        by mx.google.com with ESMTPS id j132si19219236lfd.10.2016.02.16.13.11.53
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 16 Feb 2016 13:11:53 -0800 (PST)
Received-SPF: pass (google.com: domain of serge.fdrv@gmail.com designates 2a00:1450:4010:c04::235 as permitted sender) client-ip=2a00:1450:4010:c04::235;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of serge.fdrv@gmail.com designates 2a00:1450:4010:c04::235 as permitted sender) smtp.mailfrom=serge.fdrv@gmail.com;
       dkim=pass header.i=@gmail.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: by mail-lb0-x235.google.com with SMTP id x1so26489931lbj.3;
        Tue, 16 Feb 2016 13:11:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-type:content-transfer-encoding;
        bh=a3BoLOEZrlFPWe4bV5PN9f4VbvWpDwKm+ag+C8GYsTs=;
        b=OUefBM4NesHrgfEnTKdPRS6JNXEAlNNZW393RcwfWFXihrUq9f84TSsYLQkliBFyNH
         czE8m/uFQV07BJ2yim+CpOiLG//1XwEM8ibyPukTKhE92IyUMkwth4BDZGBACBwCQdFH
         xvvctJwKEQtMJVaHDbmAAlOgMNuRPqj58Y+x16iz2iL3lRDlR3tgITMR0weQwFiGhrMQ
         Nlx6awDVsqdT6EMZ9Gn9sEr/SptIHidx34Zgvf/RPzNn4Dmca887kKQ3Unw/nJg2iamW
         oac1GCKeSG8HL/VbzFzlbgJBZoZzgE9YviAvbKsidfIQIMWxe+ofgQopFrJvCMTbhlTw
         2e1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-type
         :content-transfer-encoding;
        bh=a3BoLOEZrlFPWe4bV5PN9f4VbvWpDwKm+ag+C8GYsTs=;
        b=WzMtfKH0rk59e01xc2i49Jv/suqyC0y8rXZ8zVgqqG/hLYF5FhGQO41w3cIp5Z04px
         QQzmW4Z/4yfwszSTd5llpuPzPUfdi8Ci8YhCo4vicB0sA/Iw0cDG7QZ4I1iMuS+DQ9iO
         Bp8JEB/dyBpIgH8XP0Sc/JnTLAR7jhIffWvMzVn1Uq34mpxkpqCjQMhgdZUSCUauJ32t
         ggrhjFen0WiYCCMh3k+w7PNeKrPGpvCaZMoJlAmuZlyHxuPABT+dJoPEodQoIVt88Vsa
         06QnWyWVbY3Szo+Lb+WOQrCVCKsUEzKYhSOYh0zG/NRhGZEwbz37IyIR2MivzqDIzQ0W
         Gokw==
X-Gm-Message-State: AG10YOSx9fIYqs+BYKDIqEnOyeLLTGVX8+qKIK5m3ESqbNAh9OgM4GweAVhTUuWv62R8KA==
X-Received: by 10.112.130.41 with SMTP id ob9mr10453504lbb.81.1455657113564;
        Tue, 16 Feb 2016 13:11:53 -0800 (PST)
Return-Path: <serge.fdrv@gmail.com>
Received: from [192.168.0.71] (broadband-46-188-121-154.2com.net. [46.188.121.154])
        by smtp.googlemail.com with ESMTPSA id rh2sm1267681lbb.36.2016.02.16.13.11.52
        (version=TLSv1/SSLv3 cipher=OTHER);
        Tue, 16 Feb 2016 13:11:52 -0800 (PST)
Subject: Re: [PATCH v1 6/9] target-arm/translate-a64.c: Unify some of the
 ldst_reg decoding
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-devel@nongnu.org,
 peter.maydell@linaro.org
References: <1455287642-28166-1-git-send-email-edgar.iglesias@gmail.com>
 <1455287642-28166-7-git-send-email-edgar.iglesias@gmail.com>
Cc: alex.bennee@linaro.org, rth@twiddle.net, qemu-arm@nongnu.org,
 edgar.iglesias@xilinx.com
From: Sergey Fedorov <serge.fdrv@gmail.com>
Message-ID: <56C39098.3070502@gmail.com>
Date: Wed, 17 Feb 2016 00:11:52 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <1455287642-28166-7-git-send-email-edgar.iglesias@gmail.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-TUID: 47ZzXOcm1TgN

On 12.02.2016 17:33, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
>
> The various load/store variants under disas_ldst_reg can all reuse the
> same decoding for opc, size, rt and is_vector.
>
> This patch unifies the decoding in preparation for generating
> instruction syndromes for data aborts.
> This will allow us to reduce the number of places to hook in updates
> to the load/store state needed to generate the insn syndromes.
>
> No functional change.
>
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

Reviewed-by: Sergey Fedorov <serge.fdrv@gmail.com>

> ---
>  target-arm/translate-a64.c | 41 +++++++++++++++++++++++------------------
>  1 file changed, 23 insertions(+), 18 deletions(-)
>
> diff --git a/target-arm/translate-a64.c b/target-arm/translate-a64.c
> index bf31f8a..9e26d5e 100644
> --- a/target-arm/translate-a64.c
> +++ b/target-arm/translate-a64.c
> @@ -2075,19 +2075,19 @@ static void disas_ldst_pair(DisasContext *s, uint32_t insn)
>   * size: 00 -> 8 bit, 01 -> 16 bit, 10 -> 32 bit, 11 -> 64bit
>   * opc: 00 -> store, 01 -> loadu, 10 -> loads 64, 11 -> loads 32
>   */
> -static void disas_ldst_reg_imm9(DisasContext *s, uint32_t insn)
> +static void disas_ldst_reg_imm9(DisasContext *s, uint32_t insn,
> +                                int opc,
> +                                int size,
> +                                int rt,
> +                                bool is_vector)
>  {
> -    int rt = extract32(insn, 0, 5);
>      int rn = extract32(insn, 5, 5);
>      int imm9 = sextract32(insn, 12, 9);
> -    int opc = extract32(insn, 22, 2);
> -    int size = extract32(insn, 30, 2);
>      int idx = extract32(insn, 10, 2);
>      bool is_signed = false;
>      bool is_store = false;
>      bool is_extended = false;
>      bool is_unpriv = (idx == 2);
> -    bool is_vector = extract32(insn, 26, 1);
>      bool post_index;
>      bool writeback;
>  
> @@ -2194,19 +2194,19 @@ static void disas_ldst_reg_imm9(DisasContext *s, uint32_t insn)
>   * Rn: address register or SP for base
>   * Rm: offset register or ZR for offset
>   */
> -static void disas_ldst_reg_roffset(DisasContext *s, uint32_t insn)
> +static void disas_ldst_reg_roffset(DisasContext *s, uint32_t insn,
> +                                   int opc,
> +                                   int size,
> +                                   int rt,
> +                                   bool is_vector)
>  {
> -    int rt = extract32(insn, 0, 5);
>      int rn = extract32(insn, 5, 5);
>      int shift = extract32(insn, 12, 1);
>      int rm = extract32(insn, 16, 5);
> -    int opc = extract32(insn, 22, 2);
>      int opt = extract32(insn, 13, 3);
> -    int size = extract32(insn, 30, 2);
>      bool is_signed = false;
>      bool is_store = false;
>      bool is_extended = false;
> -    bool is_vector = extract32(insn, 26, 1);
>  
>      TCGv_i64 tcg_rm;
>      TCGv_i64 tcg_addr;
> @@ -2283,14 +2283,14 @@ static void disas_ldst_reg_roffset(DisasContext *s, uint32_t insn)
>   * Rn: base address register (inc SP)
>   * Rt: target register
>   */
> -static void disas_ldst_reg_unsigned_imm(DisasContext *s, uint32_t insn)
> +static void disas_ldst_reg_unsigned_imm(DisasContext *s, uint32_t insn,
> +                                        int opc,
> +                                        int size,
> +                                        int rt,
> +                                        bool is_vector)
>  {
> -    int rt = extract32(insn, 0, 5);
>      int rn = extract32(insn, 5, 5);
>      unsigned int imm12 = extract32(insn, 10, 12);
> -    bool is_vector = extract32(insn, 26, 1);
> -    int size = extract32(insn, 30, 2);
> -    int opc = extract32(insn, 22, 2);
>      unsigned int offset;
>  
>      TCGv_i64 tcg_addr;
> @@ -2349,20 +2349,25 @@ static void disas_ldst_reg_unsigned_imm(DisasContext *s, uint32_t insn)
>  /* Load/store register (all forms) */
>  static void disas_ldst_reg(DisasContext *s, uint32_t insn)
>  {
> +    int rt = extract32(insn, 0, 5);
> +    int opc = extract32(insn, 22, 2);
> +    bool is_vector = extract32(insn, 26, 1);
> +    int size = extract32(insn, 30, 2);
> +
>      switch (extract32(insn, 24, 2)) {
>      case 0:
>          if (extract32(insn, 21, 1) == 1 && extract32(insn, 10, 2) == 2) {
> -            disas_ldst_reg_roffset(s, insn);
> +            disas_ldst_reg_roffset(s, insn, opc, size, rt, is_vector);
>          } else {
>              /* Load/store register (unscaled immediate)
>               * Load/store immediate pre/post-indexed
>               * Load/store register unprivileged
>               */
> -            disas_ldst_reg_imm9(s, insn);
> +            disas_ldst_reg_imm9(s, insn, opc, size, rt, is_vector);
>          }
>          break;
>      case 1:
> -        disas_ldst_reg_unsigned_imm(s, insn);
> +        disas_ldst_reg_unsigned_imm(s, insn, opc, size, rt, is_vector);
>          break;
>      default:
>          unallocated_encoding(s);
