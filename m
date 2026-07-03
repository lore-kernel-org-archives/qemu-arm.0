Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5944DC43458
	for <qemu-arm@archiver.kernel.org>; Fri,  3 Jul 2026 13:35:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wfe3H-0004mm-DV; Fri, 03 Jul 2026 09:35:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wfe3F-0004m1-F3
 for qemu-arm@nongnu.org; Fri, 03 Jul 2026 09:35:29 -0400
Received: from mail-yx1-xb12c.google.com ([2607:f8b0:4864:20::b12c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wfe3D-0001V2-RT
 for qemu-arm@nongnu.org; Fri, 03 Jul 2026 09:35:29 -0400
Received: by mail-yx1-xb12c.google.com with SMTP id
 956f58d0204a3-664d35b4777so672214d50.3
 for <qemu-arm@nongnu.org>; Fri, 03 Jul 2026 06:35:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783085726; cv=none;
 d=google.com; s=arc-20260327;
 b=Z5GHsLYJ4n5lw0+uWmmXKz1BfpDVFOpGYj47H1iyqChq55LHw1/Tc0tQFaHlgEYxII
 owb8ZzSLPMa6eEVO23iBNZeWJV4KY0806GgFNvv6nU1JZ3/63wZYZJDHTuBmvi+OAB6K
 XSWo8sIL9qdBq3zeraK8Jk/dnwpAp16MzCKPtFWe/uBiwJdz70PTuWvzMSnD3u/HAZ1B
 aSKHItkxCj9dwj20XnO9X0J6fbeJlpL3EzIlbCEEniWx1HHVEUg5iS+PyLnX9zto5kw/
 7y9UH5Df/cZwV8o+n/l5DTvuzZUUDy2fmnXjIisSNcHHsDttnjcKmZvAXZ1RNUKiGRy1
 umFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=2ZnG7QzwcOliIhXKPsIJ2MYdHzHVFB/ZwZoqJYHTYrM=;
 fh=PKodlsZ4sLOulf3vcyB9a9UvxkkwctzJ7UL5PZ8dNXQ=;
 b=PfmTx/tObsS599MlEaHOnQYjDQ2UpsD9/qpqAg/SBdeuBcSkCU4OOKzVwxoLganwHo
 g7FHrdEKbXnAbLWUkZrm7r6yZDCFtfofz+7a+T88fHNpbeg7pgf76JOFZ+iC7I4E11g5
 RaIO50hQFxyWsjDRmyNCmWdyBF1ZNQRUi1idH7hALpAgh/kPI47ZIwU90m7YBehFUkic
 uJZ/5mTVcAMThdcWZQ/cQzZ7Q+PHP9ogbWFyccNRz1gkeay4gTUoFcpv8v/PUN+WYnVK
 ETVfePhDZRdES1MD6p3LO0tGBO8hJy9yMd7QiTxUDRuyxXJnAPU0wZak33Obtx/4juht
 YD6Q==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783085726; x=1783690526; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=2ZnG7QzwcOliIhXKPsIJ2MYdHzHVFB/ZwZoqJYHTYrM=;
 b=cJbLaaKWqD3bGuSnN56gvXwdo6mpjFcRYjxdwA5vuiPfr4zHQZx3i9JuJDYwnnV3WK
 3uATdg8yhc6cTL8t9rpQtjQ656cKrBNTFWwfDLUPrumGR1iC3j8r97YeCk20v11KTJHv
 klspsI88HFJpLgoXoORjISVi0jx1bA000uZX+cXI2o3t86X9/fY5K7OtakWUA4diZ4Xc
 Fd2E7gPZOSZ+1foPe8p9FdulJ1+XQg1anH21uU+22Mp4qIYbASlw3q/jkZ2g8DSajyFZ
 3h+pZvopRuWNSSMavXBYLUrpVLLdjjPXbS0GSCucM6durboaHbSNYGhgywDR2AqXmkfm
 DEZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783085726; x=1783690526;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2ZnG7QzwcOliIhXKPsIJ2MYdHzHVFB/ZwZoqJYHTYrM=;
 b=ckUvCOJEZVaj+WwzshuVPIEYxn9KFxDDGQgfl1UE0t0PV3NYW34KjjwuUIq0wU+d95
 uFNC9BGRDycOVIh5xk8diLDMDrPmYJsp38YiWb8M+cz64UA69jNEKlh2F9DQ44A4esEg
 +msf4Kxs0gEt5IHTKQH67n7qdnFY9wU652gsUgHoTuBvhoFZiPcecG92kXMy0BPVsy0A
 TvVflDaET50YbrTstn1KIWxeTpH5or2Uk1ILGndA21HZHOfJ3iVqcSGs4bs9K8a1OcS9
 SniQLIw9WDym/NNzfHdZ9xyx0Yhtr+wNqmWY7U/0SPG1oGQ3JjK81aCItipnMvCSyDeZ
 3EMA==
X-Gm-Message-State: AOJu0Yz8CQJxAFkrPwAFBb4kJnVFi7nefnurp70kdkgf2wAhThP0v3qE
 215Q0L51eihjzzrp9HrvEy6sxhxLhN38W6HM3MR+s+T0pEb9YaeREDVAmJJZocnBoMGp1hoHXrs
 isa1FmoKq8UU9uTsjb5q6Xl+i3mCJa6E560WjP7PH8Q==
X-Gm-Gg: AfdE7clIL1FqiXA1CziZ5nGAuSQg6KJj6a8CGHM+wNsvcRxDTOI8orOEtYeyZ2572KX
 KMlNzEwI4kFLYEiz354vOEUuNT6yTnykuMPF+Yo7x7/hbPzY+X94PRql4j0UWSLoFsWAiHunnD7
 wL7/POVeonWZ6na7H94LajTzwXctRUTEBcTP7fpOqQdIGFR8i2FADllEQ304ce1cyH0hEg5315n
 Z8v+eGgGPTOBc1IqIeJSvfcx5Pq7oOz9jVVYpTMANbAe26kjTikFiFyljGnoGlqdVBEg0MFY72H
 HCtjqDovREzt+N2W4lKIG0PT3KKls6OEEaSlo34M54o2tb12bq8r/GHR
X-Received: by 2002:a05:690e:4503:10b0:664:ae68:ca0e with SMTP id
 956f58d0204a3-66521d1aa8amr7421060d50.84.1783085726219; Fri, 03 Jul 2026
 06:35:26 -0700 (PDT)
MIME-Version: 1.0
References: <20260702184019.3431139-1-peter.maydell@linaro.org>
 <20260702184019.3431139-12-peter.maydell@linaro.org>
 <d0222d0f-ee90-4d4a-bc60-71740a858543@linaro.org>
In-Reply-To: <d0222d0f-ee90-4d4a-bc60-71740a858543@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Jul 2026 14:35:14 +0100
X-Gm-Features: AVVi8CdsTVA3m8eLOvENZMSqYyL3dvVpLl1r66klaFBXvX8hOthURpD7Xtp2zIU
Message-ID: <CAFEAcA9_6Uf4WXc5qoqj63eBrf8sE=C7cMTpgTJDqqpVjHex1A@mail.gmail.com>
Subject: Re: [PATCH 11/11] target/arm: Implement CPACR.D32DIS
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12c.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Fri, 3 Jul 2026 at 00:36, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 7/2/26 11:40, Peter Maydell wrote:
> > On some v7A CPUs, CPACR.D32DIS is a bit allowing the guest to make
> > VFP instructions that touch registers D16..D31 UNDEF.  Whether the
> > CPU implements this or not is IMPDEF, and the only two CPUs we
> > implement which have this are the Cortex-A7 and Cortex-A9.  In v8A
> > the bit is no longer defined at all.
> >
> > Since the only kind of trapping that needs to be done is a simple
> > UNDEF, this is straightforward enough to implement.
> >
> > Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/1499
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> >   target/arm/cpu.h               |  4 ++++
> >   target/arm/helper.c            | 19 ++++++++++++++++---
> >   target/arm/tcg/cpu32-system.c  |  2 ++
> >   target/arm/tcg/hflags.c        | 20 ++++++++++++++++++++
> >   target/arm/tcg/translate-vfp.c |  4 ++--
> >   target/arm/tcg/translate.c     |  1 +
> >   target/arm/tcg/translate.h     |  1 +
> >   7 files changed, 46 insertions(+), 5 deletions(-)
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>
> > @@ -210,12 +210,12 @@ static void gen_update_fp_context(DisasContext *s)
> >   /*
> >    * Return true if a VFP insn is OK to access D16..D31, false if
> >    * it should UNDEF. This checks whether the D16-D31 regs are
> > - * implemented by the CPU. Eventually we will also check CPACR.D32DIS.
> > + * implemented by the CPU, and whether CPACR.D32DIS permits access.
> >    * Note that Neon insns accessing D16..D31 do not need to check D32DIS.
> >    */
> >   static bool vfp_d16_d31_ok(DisasContext *s)
> >   {
> > -    return dc_isar_feature(aa32_simd_r32, s);
> > +    return dc_isar_feature(aa32_simd_r32, s) && !s->d32dis;
> >   }
>
> Not that it matters much, but if we stored
>
>    s->invalid_dreg_mask = (d16_d31_ok ? 0 : 0x10);
>
> and pass in the mask of regs like so:
>
> static bool vfp_dregs_ok(DisasContext *s, int mask)
> {
>      return !(mask & s->invalid_dreg_mask);
> }
>
> -    if (!dc_isar_feature(aa32_simd_r32, s) && ((vd | vm) & 0x10)) {
> +    if (!vfp_dregs_ok(s, vd | vm)) {
>
> then we eliminate a couple of branches and some boilerplate.

Mmm. We'd need to have separate masks for vfp and neon, though,
otherwise somebody is going to be tempted to change all the
uses in translate-neon.c to use this function.

-- PMM

