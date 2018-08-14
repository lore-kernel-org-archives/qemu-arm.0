Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp4376297wru;
        Tue, 14 Aug 2018 11:21:34 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPytjXZGinZsHTe+tbYbng6Jeovfrvoc4aQkEkp+BdrxcGKsw1D2scZ43x45LFI9m1RTWNg6
X-Received: by 2002:a37:7882:: with SMTP id t124-v6mr21026639qkc.367.1534270894172;
        Tue, 14 Aug 2018 11:21:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534270894; cv=none;
        d=google.com; s=arc-20160816;
        b=XVf/oV4+tp2f2RZ9CPgi96jlNO8YTiU6TyDdZf5tU9gzaABq0TbnYkFfL052Z/sK9x
         7VAIQu5UrOU1TD5GcLJwq0GN6x4kOFBaaScUza89rlfdXFwzJ7idjbGEqV58qykVEdeH
         ku6uX+Ipp12AFkwNF2Q1fmCg3UhiQ8YB09f9J1EJuM/DSFSBm9G32Go6WV9o9g2w7cOl
         DDYZ1sI9yEzsxbzavbtRELfXIiRXUKItXcK1WtzHRvJE787f5Y2azDwcbsjvyax0iKEq
         lshaiqlFNR/TM0ALdOxIpPiLQW7LAiEp2jwUxQhX4e+odTxt6lC2fQJ5RVg2oMGnu+h3
         qE8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=L+zlfvuZ8UQ+kjU+7OeWlkqNUe9Q8VCtOjg8SEM+IzA=;
        b=tEMi3uka8kmUNJHD6PxDGyUHPypGcbN1wfme3H8kV+5wOBvBMeerDYSWU3iyoeFO/m
         QzadPzq/M5AiVDI3EU2Wl/DdppmFX0SS1wNJxqwzATd18tCyw7AoVDZ7tdQQVuCf+UyI
         4JRNv1/NWGvHQ3QvPckRszAu4+9M2YPdJ7pbVgVGTEQo+sGhArB+AgGK12YsEKv2j0iK
         WXjxchFWwCStnB7g1FhDV6xrUUHSZGrgd1oc1UUDQ4A8dTpQLNXA4GbR8cI/tZ1JfAPt
         Xv1hZNaAx4kgw52mQLflhL9bb0Y5AtYa3KsXdPRaJhw+8Aazgz37JAwWyUAoyEd6Cn7z
         eshQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gx3hO49g;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l3-v6si7775098qvl.84.2018.08.14.11.21.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 14 Aug 2018 11:21:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gx3hO49g;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45585 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fpdwj-0005Ud-JF
	for alex.bennee@linaro.org; Tue, 14 Aug 2018 14:21:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49337)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fpdoo-0007p0-KO
	for qemu-devel@nongnu.org; Tue, 14 Aug 2018 14:13:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fpdoZ-00028t-EG
	for qemu-devel@nongnu.org; Tue, 14 Aug 2018 14:13:22 -0400
Received: from mail-oi0-x243.google.com ([2607:f8b0:4003:c06::243]:34382)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fpdoY-00026o-VZ
	for qemu-devel@nongnu.org; Tue, 14 Aug 2018 14:13:07 -0400
Received: by mail-oi0-x243.google.com with SMTP id 13-v6so35369632ois.1
	for <qemu-devel@nongnu.org>; Tue, 14 Aug 2018 11:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=L+zlfvuZ8UQ+kjU+7OeWlkqNUe9Q8VCtOjg8SEM+IzA=;
	b=gx3hO49g5K/cMvwX9q7SQqRbr7ivTDnt4leaT0v3d5H5XcfDuR5cluynGl+sOP5p1y
	/XEm99X5/vWRwbO/RVYdPUtd8Liwjva6uhBo/XzzbYQmTYcv68DRmfP4sxpKkFdBva6W
	+L8E2irl2iiC/PydMyCWaIWIDv6ir69T798IU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=L+zlfvuZ8UQ+kjU+7OeWlkqNUe9Q8VCtOjg8SEM+IzA=;
	b=VwWPZfFbTvvzi27QNVtLyu2qe5Fx6KAW5xWReSb5oQglVYWgun3Q9afBHXH7qp5pS0
	6h/WGNshUsAy4LDcIVCBPi/ep7j0EoJSi4zN0hrhKqzRL0JwAWt/IYqJDVb8nWZwHqRO
	vxF/751nEMfslX9Mwkg5jcDkH666Nbn4+hw6bRo6KYMXSpEKu7CxKP0Nik2cDahHsW5c
	fK6yknaHuEWpmBolaOqav3HQm9n5winX5HllBCVxDoJPpAu8sbxrwWyxCn9bLbfmC5SD
	hFDRy4WkI/SBMyRhivtuW+VcLfcjvLwOHkiJKak//eUFGXcMP3jBmP4cN41+2X4feg/A
	+h5Q==
X-Gm-Message-State: AOUpUlHgRwFTm7B6g9ENvfj7bvfYcV2O2/zUPuE6PRGt7VmPh61LnKe5
	pOgWTa0QTDSppvon85qjERE/pk+QjjJCGj8YBHB/pQ==
X-Received: by 2002:aca:a982:: with SMTP id
	s124-v6mr24568233oie.80.1534270386148; 
	Tue, 14 Aug 2018 11:13:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Tue, 14 Aug 2018 11:12:45
	-0700 (PDT)
In-Reply-To: <20180814165419.9116-1-rka@sysgo.com>
References: <20180814165419.9116-1-rka@sysgo.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 14 Aug 2018 19:12:45 +0100
Message-ID: <CAFEAcA8RQ2X83AQOcvg3acJhJ6ioJ7KtJ=V2iFiUmQh4bF_fmA@mail.gmail.com>
To: Roman Kapl <rka@sysgo.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::243
Subject: Re: [Qemu-devel] [PATCH] target/arm: crash on conditional instr in
 it block
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: B5qv9oi7uRHi

On 14 August 2018 at 17:54, Roman Kapl <rka@sysgo.com> wrote:
> If an instruction is conditional (like CBZ) and it is executed conditionally
> (using the ITx instruction), a jump to undefined label is generated.
>
> Fix the 'skip on condtion' code to create a new label only if it does not
> already exist. Previously multiple labels were created, but only the last one of
> them was set.

Hi; thanks for the bug report and the patch.

This case (CBZ inside an IT block) is architecturally UNPREDICTABLE,
but we certainly shouldn't crash QEMU.

For ARMv7 we have very wide latitude in what we can do; for ARMv8
the "CONSTRAINED UNPREDICTABLE" part of the Arm ARM limits us a
bit (see section K1.1.7). We can do one of:
 * generate an UNDEFINED exception
 * execute the instruction as if the condition code check had passed
 * execute the instruction as if the condition check failed (ie NOP)
(and we're allowed to behave differently from execution to execution
so "honour the condition code check" is ok too I think).

If we don't UNDEF then we have to be a little careful about the
IT state, but I think we're OK there.

So we could if we like choose to just UNDEF in these cases,
something like:
   if (dc->condexec_mask && thumb_insn_unpredictable_in_it(dc, insn) {
       gen_exception_insn(...)
   }
where we currently check for "always unconditional even in
an IT block" insns.

But I guess that just bringing conditional branches into line
with what we already do for other insns in this category is
a reasonable approach. I have a comment below but otherwise
the patch looks good.

>  target/arm/translate.c | 32 ++++++++++++++++++--------------
>  1 file changed, 18 insertions(+), 14 deletions(-)
>
> diff --git a/target/arm/translate.c b/target/arm/translate.c
> index f845da7c63..f7c03a36e6 100644
> --- a/target/arm/translate.c
> +++ b/target/arm/translate.c
> @@ -8480,6 +8480,16 @@ static void gen_srs(DisasContext *s,
>      s->base.is_jmp = DISAS_UPDATE;
>  }
>
> +/* Skip this instruction if the condition is true */
> +static void arm_conditional_skip(DisasContext *s, uint32_t cond)
> +{
> +    if (!s->condjmp) {
> +        s->condlabel = gen_new_label();
> +        s->condjmp = 1;
> +    }
> +    arm_gen_test_cc(cond, s->condlabel);
> +}

This is a nice piece of refactoring. I think it would make
more sense to have it do "skip if condition is false", though:
currently every callsite has to xor the condition with 1.

(You could call it arm_skip_insn_unless(), maybe.)

> +
>  static void disas_arm_insn(DisasContext *s, unsigned int insn)
>  {
>      unsigned int cond, val, op1, i, shift, rm, rs, rn, rd, sh;
> @@ -8709,9 +8719,7 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
>      if (cond != 0xe) {
>          /* if not always execute, we generate a conditional jump to
>             next instruction */
> -        s->condlabel = gen_new_label();
> -        arm_gen_test_cc(cond ^ 1, s->condlabel);
> -        s->condjmp = 1;
> +        arm_conditional_skip(s, cond ^ 1);
>      }
>      if ((insn & 0x0f900000) == 0x03000000) {
>          if ((insn & (1 << 21)) == 0) {
> @@ -11205,9 +11213,7 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
>                  /* Conditional branch.  */
>                  op = (insn >> 22) & 0xf;
>                  /* Generate a conditional jump to next instruction.  */
> -                s->condlabel = gen_new_label();
> -                arm_gen_test_cc(op ^ 1, s->condlabel);
> -                s->condjmp = 1;
> +                arm_conditional_skip(s, op ^ 1);
>
>                  /* offset[11:1] = insn[10:0] */
>                  offset = (insn & 0x7ff) << 1;
> @@ -12131,8 +12137,10 @@ static void disas_thumb_insn(DisasContext *s, uint32_t insn)
>          case 1: case 3: case 9: case 11: /* czb */
>              rm = insn & 7;
>              tmp = load_reg(s, rm);
> -            s->condlabel = gen_new_label();
> -            s->condjmp = 1;
> +            if (!s->condjmp) {
> +                s->condlabel = gen_new_label();
> +                s->condjmp = 1;
> +            }
>              if (insn & (1 << 11))
>                  tcg_gen_brcondi_i32(TCG_COND_EQ, tmp, 0, s->condlabel);
>              else
> @@ -12295,9 +12303,7 @@ static void disas_thumb_insn(DisasContext *s, uint32_t insn)
>              break;
>          }
>          /* generate a conditional jump to next instruction */
> -        s->condlabel = gen_new_label();
> -        arm_gen_test_cc(cond ^ 1, s->condlabel);
> -        s->condjmp = 1;
> +        arm_conditional_skip(s, cond ^ 1);
>
>          /* jump to the offset */
>          val = (uint32_t)s->pc + 2;
> @@ -12676,9 +12682,7 @@ static void thumb_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
>          uint32_t cond = dc->condexec_cond;
>
>          if (cond != 0x0e) {     /* Skip conditional when condition is AL. */
> -            dc->condlabel = gen_new_label();
> -            arm_gen_test_cc(cond ^ 1, dc->condlabel);
> -            dc->condjmp = 1;
> +            arm_conditional_skip(dc, cond ^ 1);
>          }
>      }
>
> --

thanks
-- PMM
