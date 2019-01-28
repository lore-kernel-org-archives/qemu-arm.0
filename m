Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3158193wrt;
        Mon, 28 Jan 2019 03:19:56 -0800 (PST)
X-Google-Smtp-Source: ALg8bN6G3J6ssoG54geCL+WLUkTiKyAsp3nc7dXYsqP2c47VGt4nSdZflM+6tEfGxDF4jnFn3xBz
X-Received: by 2002:a1c:3c06:: with SMTP id j6mr15353816wma.27.1548674396809;
        Mon, 28 Jan 2019 03:19:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548674396; cv=none;
        d=google.com; s=arc-20160816;
        b=JGP7M/0gnpPTq1KDhoBPW4ZDt9/XtJSKsDeVIPIjMahJg/zzwarCrSQwF/Mh82Ri/U
         o4rl4WIeRS5UEKvaH+ih/t17JxPYdO+i86oUWEVTZFt8y+PtyTS/9QN0WrnZRRDxR8vd
         nmXOxh77PL1xQxYhT8hYtEZQXL93OnCrzwwiWcDF1n0WnzOyu8il2rhk8Gvk604RyOyB
         22uYudiWI3Db7w7p8b6MHHYxP3jTss4mnxJ+JopyOrFCa4A619Ca/dw8EosxAHST8jmg
         0GhrRa16ceknJEBzsR6dSJ6zqyQGleAsSzS1GG/QAzzNWMqG7VljK2KNa2nYA/qFZHfU
         g7BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/415SGDtT0w6ViyG55LcEVLT5/71dVeBoGehvgHHRd8=;
        b=CY1F75hB+qTYcAG9ULx8q9Yd4UaMxjNiscJkYglvk95ELAFmivrvxeMvq8nd5IN9xc
         C6pc+bt+iUJDPLIDjVVC383+dkv85KoF2mDLIzqJPuhhND2PaSAMVPxV4p0vGk3K4Nf8
         Yu5wf1oreUQwN8rcXAtRBQ8Pyu9VmbNiBx5ZzlBqiP2kcWSaXp52uvQlbZiqEJU8hOxi
         MkvJtUu0tLB93A8iAyMFajl1k1UlYpcDXBKrIUahtxdbFiIimEDVF1S661Mp6gNdX1/O
         f6BxbhSFTsB2pz3GrdyPsITXqMs6ECv8EVR8yvzs6X0ov/lEjMa/Hi7tX5HZLyJWU2cE
         F9fw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=mXiyjliT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t63si46244950wma.109.2019.01.28.03.19.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 28 Jan 2019 03:19:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=mXiyjliT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([127.0.0.1]:58120 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1go4xH-00053x-Pq
	for alex.bennee@linaro.org; Mon, 28 Jan 2019 06:19:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58801)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent.desnogues@gmail.com>) id 1go4x6-00052o-O3
	for qemu-arm@nongnu.org; Mon, 28 Jan 2019 06:19:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent.desnogues@gmail.com>) id 1go4wz-00012c-9b
	for qemu-arm@nongnu.org; Mon, 28 Jan 2019 06:19:40 -0500
Received: from mail-it1-x144.google.com ([2607:f8b0:4864:20::144]:34956)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent.desnogues@gmail.com>)
	id 1go4wo-00010M-1S; Mon, 28 Jan 2019 06:19:28 -0500
Received: by mail-it1-x144.google.com with SMTP id p197so18839335itp.0;
	Mon, 28 Jan 2019 03:19:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=/415SGDtT0w6ViyG55LcEVLT5/71dVeBoGehvgHHRd8=;
	b=mXiyjliTX/iUY8sfBfPDwNehJP7QmK1w3qfF9eNndZCbIwdguL+fjEveVXYYQcHrb3
	bupg+JLfBdSuhK65s719fpBY6+Dpk+nVE/kZiFdkyBkaqNcmrnJM+HZy+s8P7V0a+laU
	hHRfmm0/4dImauvoClnvS7I+XoOVUBBB19Jw9nzKgn02Zyu3AuaxnUVS+hQanSP/5tVX
	ncceAbEHJoFUAomK6LSWxQo4zkSEgVhaRp3lxJR5FoAc4DteCaEozjxbci8ikQ14Bjx1
	CoaC4wDvgEPeVAKsEbfl0YuSHR93q+WfvCF6vpTblowZfPXn+dRn5kfqcuQhG7ZOr3ZK
	GvIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=/415SGDtT0w6ViyG55LcEVLT5/71dVeBoGehvgHHRd8=;
	b=O83fQYjUJ/CB9VVz/2UQe72998N6BPP+6KR4QnpZNduqiuiDueqms4ThcBUj0E3ViO
	zOknM0DA1Z5srxYdWSr5Y/FRrr+y8RuMalwyOvbpctXmark8IpF/GlzgEmPw0qElPRB+
	g4uDsx1XpdKVdzKhaUsiHWhDKVg+tRNtKTRXIAHHljXXa4WO/21JCW0v9rxNmRG7g2MW
	iIk3Qp5Mt3+VO8qcKMzStN2HwuLDvVFBXE0ru2F2a9V+xOQ5QLwgKZ8rQD7uivJ52G61
	bVWWoVkWrooOdeoxNMsC/0gk+HbePP1f85rVau8lebx98gERdMwCsLv5VDh1RImf6mpx
	eeiA==
X-Gm-Message-State: AJcUukcwgcCbgTykxEeSMrWXlnWt2496y+3gfELflanCCPVmV4tbH1kL
	yBwhYsedSf/zIBug/dPb1+hhSSibYEBH6OwNlETDxtrcLgc=
X-Received: by 2002:a05:660c:fd2:: with SMTP id
	m18mr10048535itn.1.1548674364712; 
	Mon, 28 Jan 2019 03:19:24 -0800 (PST)
MIME-Version: 1.0
References: <20190125182626.9221-1-peter.maydell@linaro.org>
	<20190125182626.9221-7-peter.maydell@linaro.org>
In-Reply-To: <20190125182626.9221-7-peter.maydell@linaro.org>
From: Laurent Desnogues <laurent.desnogues@gmail.com>
Date: Mon, 28 Jan 2019 12:19:34 +0100
Message-ID: <CABoDooPPwWwdg3yFe-K1U5w2f1gGh991m4D__OJXFcgZh0n4Tg@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::144
Subject: Re: [Qemu-arm] [PATCH 6/7] target/arm/translate-a64: Don't
 underdecode FP insns
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Patch Tracking <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +UoHUZ2Hrq5s

On Fri, Jan 25, 2019 at 7:26 PM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> In the encoding groups
>  * floating-point data-processing (1 source)
>  * floating-point data-processing (2 source)
>  * floating-point data-processing (3 source)
>  * floating-point immediate
>  * floating-point compare
>  * floating-ponit conditional compare
>  * floating-point conditional select
>
>
> bit 31 is M and bit 29 is S (and bit 30 is 0, already checked at
> this point in the decode). None of these groups allocate any
> encoding for M=1 or S=1. We checked this in disas_fp_compare(),
> disas_fp_ccomp() and disas_fp_csel(), but missed it in disas_fp_1src(),
> disas_fp_2src(), disas_fp_3src() and disas_fp_imm().
>
> We also missed that in the fp immediate encoding the imm5 field
> must be all zeroes.
>
> Correctly UNDEF the unallocated encodings here.
>
> Reported-by: Laurent Desnogues <laurent.desnogues@gmail.com>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Laurent Desnogues <laurent.desnogues@gmail.com>

Thanks,

Laurent

> ---
>  target/arm/translate-a64.c | 22 +++++++++++++++++++++-
>  1 file changed, 21 insertions(+), 1 deletion(-)
>
> diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
> index efd2f6490b5..474d9bfb5f0 100644
> --- a/target/arm/translate-a64.c
> +++ b/target/arm/translate-a64.c
> @@ -5636,11 +5636,17 @@ static void handle_fp_fcvt(DisasContext *s, int opcode,
>   */
>  static void disas_fp_1src(DisasContext *s, uint32_t insn)
>  {
> +    int mos = extract32(insn, 29, 3);
>      int type = extract32(insn, 22, 2);
>      int opcode = extract32(insn, 15, 6);
>      int rn = extract32(insn, 5, 5);
>      int rd = extract32(insn, 0, 5);
>
> +    if (mos) {
> +        unallocated_encoding(s);
> +        return;
> +    }
> +
>      switch (opcode) {
>      case 0x4: case 0x5: case 0x7:
>      {
> @@ -5867,13 +5873,14 @@ static void handle_fp_2src_half(DisasContext *s, int opcode,
>   */
>  static void disas_fp_2src(DisasContext *s, uint32_t insn)
>  {
> +    int mos = extract32(insn, 29, 3);
>      int type = extract32(insn, 22, 2);
>      int rd = extract32(insn, 0, 5);
>      int rn = extract32(insn, 5, 5);
>      int rm = extract32(insn, 16, 5);
>      int opcode = extract32(insn, 12, 4);
>
> -    if (opcode > 8) {
> +    if (opcode > 8 || mos) {
>          unallocated_encoding(s);
>          return;
>      }
> @@ -6028,6 +6035,7 @@ static void handle_fp_3src_half(DisasContext *s, bool o0, bool o1,
>   */
>  static void disas_fp_3src(DisasContext *s, uint32_t insn)
>  {
> +    int mos = extract32(insn, 29, 3);
>      int type = extract32(insn, 22, 2);
>      int rd = extract32(insn, 0, 5);
>      int rn = extract32(insn, 5, 5);
> @@ -6036,6 +6044,11 @@ static void disas_fp_3src(DisasContext *s, uint32_t insn)
>      bool o0 = extract32(insn, 15, 1);
>      bool o1 = extract32(insn, 21, 1);
>
> +    if (mos) {
> +        unallocated_encoding(s);
> +        return;
> +    }
> +
>      switch (type) {
>      case 0:
>          if (!fp_access_check(s)) {
> @@ -6105,12 +6118,19 @@ uint64_t vfp_expand_imm(int size, uint8_t imm8)
>  static void disas_fp_imm(DisasContext *s, uint32_t insn)
>  {
>      int rd = extract32(insn, 0, 5);
> +    int imm5 = extract32(insn, 5, 5);
>      int imm8 = extract32(insn, 13, 8);
>      int type = extract32(insn, 22, 2);
> +    int mos = extract32(insn, 29, 3);
>      uint64_t imm;
>      TCGv_i64 tcg_res;
>      TCGMemOp sz;
>
> +    if (mos || imm5) {
> +        unallocated_encoding(s);
> +        return;
> +    }
> +
>      switch (type) {
>      case 0:
>          sz = MO_32;
> --
> 2.20.1
>
