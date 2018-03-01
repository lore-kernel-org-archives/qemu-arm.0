Received: by 10.28.91.67 with SMTP id p64csp1962715wmb;
        Thu, 1 Mar 2018 07:29:05 -0800 (PST)
X-Google-Smtp-Source: AG47ELtvGrJlL4cNpVsSOXsasbT2VzokpvTcqHQTIcgZX3pk+kbEvvzBTAT5aT41URL49elfDUtD
X-Received: by 2002:a25:c693:: with SMTP id k141-v6mr1402434ybf.72.1519918145526;
        Thu, 01 Mar 2018 07:29:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519918145; cv=none;
        d=google.com; s=arc-20160816;
        b=nbSoXyifKU/W79/+PsJaKxVMdgmzqAecaX+mvejfwXEhUEECIG/T4cMoo5Ybb7zrl8
         BGfaC94wmlOPOLKMGRzrvb/gPLPA9FC7ESnrK+LMT/oFI0Iiz4sPDMhUOY40k/5yT7tL
         Bbp/VjgQKKiwEsc4eu1QRO2K5Hp8I4jFMIF8j9QMDPgkzMIgPpm19eJzmG8FCJal1oN9
         Thmq778Jg0fMQ+EIIW+zlZEQg9FVSUkY35JitDm9aht1IoUpyJFVGkeBS+ZGD2VT5/Hr
         SjzNBT4Y1KHcOiW9RUNLyE+ygnVTSd5nnmq4TSlm/wfhOSpK4NYJeH5IRt/wAqMkZ0vn
         Il5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=Vg/EliaITrrT5SjFI4JZSydZ9YMYC5C9K6bOYiF2iFU=;
        b=kxSgyzSMGCMEVO7ev/36triG4/xZjHG0gOj8Q7ITP2kxGYIqEn9masoez+wrVqLOTc
         oz6t5UNTfjzgyaNs4qBWuofyRqP/X7wsx1WfOtWiPneos2P2tJBu004NeXXlIGB0pPW7
         jSpFYl6fy19ulHPCM1ha5L8lt+7q1WA51+msx+3wyWTsHGi+pPuut4F9JF2Maah1JkFI
         50Nj/VDeZFsKF+pXOhdzNpxohEnLz58z6OKNgoFLprVZtSa1aXrHPeiLYwy1inzCoBev
         cpVIpzxoAR767aZZPUFgXoNNDJXfAOaiFUAxU+j1jrKaOVMjUvD+tlDPY7s0cFug7u84
         bsmA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=IsyljuEf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a185si673520ywf.569.2018.03.01.07.29.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 01 Mar 2018 07:29:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=IsyljuEf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57580 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1erQ8m-0004wq-Ti
	for alex.bennee@linaro.org; Thu, 01 Mar 2018 10:29:04 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49555)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1erQ8Y-0004vi-OZ
	for qemu-arm@nongnu.org; Thu, 01 Mar 2018 10:28:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1erQ8X-00021f-IE
	for qemu-arm@nongnu.org; Thu, 01 Mar 2018 10:28:50 -0500
Received: from mail-oi0-x243.google.com ([2607:f8b0:4003:c06::243]:44913)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1erQ8X-00021M-B5
	for qemu-arm@nongnu.org; Thu, 01 Mar 2018 10:28:49 -0500
Received: by mail-oi0-x243.google.com with SMTP id b8so4726963oib.11
	for <qemu-arm@nongnu.org>; Thu, 01 Mar 2018 07:28:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Vg/EliaITrrT5SjFI4JZSydZ9YMYC5C9K6bOYiF2iFU=;
	b=IsyljuEfh+YPzeObOsz77tJAxYVJC3c0XcuXkiXVIT/l6nAg0q/6hX0OXszxhV8e8d
	inFyGVFrB8FlBNlx4N8qIap3zUwb1hafUZ2RKKN2n/ZRHWGuOpwvR7+rxFXwasPPl+MC
	7KCNHJ+9BndadjvEOCuxLe2jofVxIZOQf/jZ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Vg/EliaITrrT5SjFI4JZSydZ9YMYC5C9K6bOYiF2iFU=;
	b=qx20B+b9k6zNB+MVmIQBDr9LkXSTzYJ14KS6Q1YdqwwBZ2iyl9nLKcqriIdwwt5IQZ
	Ln7w7mnY1FjykRgbFcFAyqqjlwF7MkYbQGNhgIdfM2Hs8iDLiKmgLqWVnh/6LnzYXYOB
	WSyBp/2Jb5hDg4/6WW29PLyYl+oOxyvQBlrhVvG3aX5Tgjlvk42rQLVmx5qOi1YhcMcC
	w1C6hLyCgV1uEGXX8cUZT215xJgTU7pNYbCeFFdy6xs3VKiAio3K92wDTPLrTRlZx9GL
	ONrdZOuDEcFwnjiynlvQWs4uKuqDchOP2qs7dJMjUwI4c5QnoSAcXZ2j0PdbpAeD+fWT
	mIqw==
X-Gm-Message-State: APf1xPCd5gxlWo4NEOAjY7ekrv969aj09LJppGBlQoQk9lub8uiRthN3
	81R6wI4leSe198lk/7++4iV11cmqiTBS5SxEjuwO61Rh
X-Received: by 10.202.95.68 with SMTP id t65mr1526012oib.102.1519918128529;
	Thu, 01 Mar 2018 07:28:48 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.33.100 with HTTP; Thu, 1 Mar 2018 07:28:28 -0800 (PST)
In-Reply-To: <CAFEAcA-pUMgUnR0cWd9j7n0EyTeXkMTzhPQU_fqhyaXy1hMfxw@mail.gmail.com>
References: <20180228193125.20577-1-richard.henderson@linaro.org>
	<20180228193125.20577-13-richard.henderson@linaro.org>
	<CAFEAcA-pUMgUnR0cWd9j7n0EyTeXkMTzhPQU_fqhyaXy1hMfxw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 1 Mar 2018 15:28:28 +0000
Message-ID: <CAFEAcA-FOV6JSaZrhD+FZ-T46n_e--suEDbha5EXAEPyW5YAEw@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::243
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3 12/16] target/arm: Decode
 aa64 armv8.3 fcmla
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
X-TUID: jd+SzIY6sOQv

On 1 March 2018 at 13:33, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 28 February 2018 at 19:31, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>  target/arm/helper.h        |  11 ++++
>>  target/arm/translate-a64.c |  94 +++++++++++++++++++++++++---
>>  target/arm/vec_helper.c    | 149 +++++++++++++++++++++++++++++++++++++++++++++
>>  3 files changed, 246 insertions(+), 8 deletions(-)
>>
>> diff --git a/target/arm/helper.h b/target/arm/helper.h
>> index 1e2d7025de..0d2094f2be 100644
>> --- a/target/arm/helper.h
>> +++ b/target/arm/helper.h
>> @@ -585,6 +585,17 @@ DEF_HELPER_FLAGS_5(gvec_fcadds, TCG_CALL_NO_RWG,
>>  DEF_HELPER_FLAGS_5(gvec_fcaddd, TCG_CALL_NO_RWG,
>>                     void, ptr, ptr, ptr, ptr, i32)
>>
>> +DEF_HELPER_FLAGS_5(gvec_fcmlah, TCG_CALL_NO_RWG,
>> +                   void, ptr, ptr, ptr, ptr, i32)
>> +DEF_HELPER_FLAGS_5(gvec_fcmlah_idx, TCG_CALL_NO_RWG,
>> +                   void, ptr, ptr, ptr, ptr, i32)
>> +DEF_HELPER_FLAGS_5(gvec_fcmlas, TCG_CALL_NO_RWG,
>> +                   void, ptr, ptr, ptr, ptr, i32)
>> +DEF_HELPER_FLAGS_5(gvec_fcmlas_idx, TCG_CALL_NO_RWG,
>> +                   void, ptr, ptr, ptr, ptr, i32)
>> +DEF_HELPER_FLAGS_5(gvec_fcmlad, TCG_CALL_NO_RWG,
>> +                   void, ptr, ptr, ptr, ptr, i32)
>> +
>>  #ifdef TARGET_AARCH64
>>  #include "helper-a64.h"
>>  #endif
>> diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
>> index efed4fd9d2..31ff0479e6 100644
>> --- a/target/arm/translate-a64.c
>> +++ b/target/arm/translate-a64.c
>> @@ -10842,6 +10842,10 @@ static void disas_simd_three_reg_same_extra(DisasContext *s, uint32_t insn)
>>          }
>>          feature = ARM_FEATURE_V8_RDM;
>>          break;
>> +    case 0x8: /* FCMLA, #0 */
>> +    case 0x9: /* FCMLA, #90 */
>> +    case 0xa: /* FCMLA, #180 */
>> +    case 0xb: /* FCMLA, #270 */
>>      case 0xc: /* FCADD, #90 */
>>      case 0xe: /* FCADD, #270 */
>>          if (size == 0
>> @@ -10891,6 +10895,29 @@ static void disas_simd_three_reg_same_extra(DisasContext *s, uint32_t insn)
>>          }
>>          return;
>>
>> +    case 0x8: /* FCMLA, #0 */
>> +    case 0x9: /* FCMLA, #90 */
>> +    case 0xa: /* FCMLA, #180 */
>> +    case 0xb: /* FCMLA, #270 */
>> +        rot = extract32(opcode, 0, 2);
>> +        switch (size) {
>> +        case 1:
>> +            gen_gvec_op3_fpst(s, is_q, rd, rn, rm, true, rot,
>> +                              gen_helper_gvec_fcmlah);
>> +            break;
>> +        case 2:
>> +            gen_gvec_op3_fpst(s, is_q, rd, rn, rm, false, rot,
>> +                              gen_helper_gvec_fcmlas);
>> +            break;
>> +        case 3:
>> +            gen_gvec_op3_fpst(s, is_q, rd, rn, rm, false, rot,
>> +                              gen_helper_gvec_fcmlad);
>> +            break;
>> +        default:
>> +            g_assert_not_reached();
>> +        }
>> +        return;
>> +
>>      case 0xc: /* FCADD, #90 */
>>      case 0xe: /* FCADD, #270 */
>>          rot = extract32(opcode, 1, 1);
>
> Shouldn't there be a feature check on ARM_FEATURE_V8_FCMA somewhere
> in the three_reg_same_extra code path?
>
>
>> diff --git a/target/arm/vec_helper.c b/target/arm/vec_helper.c
>> index a868ca6aac..d81eb7730d 100644
>> --- a/target/arm/vec_helper.c
>> +++ b/target/arm/vec_helper.c
>> @@ -278,3 +278,152 @@ void HELPER(gvec_fcaddd)(void *vd, void *vn, void *vm,
>>      }
>>      clear_tail(d, opr_sz, simd_maxsz(desc));
>>  }
>> +
>> +void HELPER(gvec_fcmlah)(void *vd, void *vn, void *vm,
>> +                         void *vfpst, uint32_t desc)
>> +{
>> +    uintptr_t opr_sz = simd_oprsz(desc);
>> +    float16 *d = vd;
>> +    float16 *n = vn;
>> +    float16 *m = vm;
>> +    float_status *fpst = vfpst;
>> +    intptr_t flip = extract32(desc, SIMD_DATA_SHIFT, 1);
>> +    uint32_t neg_imag = extract32(desc, SIMD_DATA_SHIFT + 1, 1);
>> +    uint32_t neg_real = flip ^ neg_imag;
>> +    uintptr_t i;
>> +
>> +    /* Shift boolean to the sign bit so we can xor to negate.  */
>> +    neg_real <<= 15;
>> +    neg_imag <<= 15;
>> +
>> +    for (i = 0; i < opr_sz / 2; i += 2) {
>> +        float16 e1 = n[H2(i + flip)];
>> +        float16 e2 = m[H2(i + flip)] ^ neg_real;
>> +        float16 e3 = e1;
>> +        float16 e4 = m[H2(i + 1 - flip)] ^ neg_imag;
>
> These don't match up with the element1 ... element4 in the
> Arm ARM pseudocode. It's e2 and e4 that are always the same,
> not e1 and e3. Ditto in the other functions.

Specifically I think:
 this code    pseudocode
   e1          element2
   e2          element1
   e3          element4
   e4          element2

So if we renumber these to match the pseudocode

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
