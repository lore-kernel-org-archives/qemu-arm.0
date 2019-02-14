Received: by 2002:adf:efc1:0:0:0:0:0 with SMTP id i1csp1094355wrp;
        Thu, 14 Feb 2019 07:14:22 -0800 (PST)
X-Google-Smtp-Source: AHgI3IazwfBqkMmHq7DkMIRpPUN8i85rfwtC5G3c3o6Xqxu5XB0F3lGio4ouf3Jks2MPEfTxNYv2
X-Received: by 2002:a81:b185:: with SMTP id p127mr3597221ywh.158.1550157262574;
        Thu, 14 Feb 2019 07:14:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550157262; cv=none;
        d=google.com; s=arc-20160816;
        b=SalSI4vT9ATMRRdhrp7w9FVK7gMqsg3Z54um2Ore1iehPk64I21Z04fukSVuX+oX8W
         xA3RbyPKvLnUFR8MwVvQVrw0DhqbRloZAs6nA7DcKy6k1avD3Ei+to3SWYVDZXhq5Cmx
         LDLTPtbF5V5RyvPBiEADlYoFWovqnbovH95Ptcjr4cBzSbxgQfdKrB7hiSm3gqUPGzA/
         oU2aDH8yTUtXg23CxsKWSQXQGUygg9HL60kN332pWw+zhiaC0K52+LVDLbjVVLc3WAbX
         DkLOxl9/vpbrpvIzt54vT9Ddi7YA9Rxx8TRYO80P4UyTy8QzWjVF7mVwFn+sygiUwLcM
         eZWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FW2O5d8eT9sWNU87pQcFeyggC89v8ZYSAGxGYc7O9RI=;
        b=jRH7Ncbi1HVvJh/Eh6odlqaUd1lWxzNB0Xr6WMp8MBbXTlIaozVmP9scrc/+5+2JE+
         usUzujoIOoGv2Rr9KdVhZakVHhV8mX+Zgr40zDhz0Y39QO4awmowpToQW/jqdRWWVUXA
         PaQU1PsFO69uytFsR0nu1Ke1xOiYfwVhLWz5xW2T3GO0TE9IhN8+O6xfMxSpe063vZX0
         IEP980QFOfSridW5pDQGK/EYSS5wzYRVLHeVeB1fOrll24ZO314SLAe0P+8DB3JZaqJE
         B2pNhLF/GDJekPYfZ31/7tMsmwhPUVgXakCdLI+HTBN+dDpLBXzz0+VMNF12AQRNKTEE
         y7Bg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Shx49VdF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 81si1458970ywl.462.2019.02.14.07.14.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Feb 2019 07:14:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Shx49VdF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([127.0.0.1]:49979 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1guIiU-0003ae-1B
	for alex.bennee@linaro.org; Thu, 14 Feb 2019 10:14:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51653)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent.desnogues@gmail.com>) id 1guIhI-0002W2-56
	for qemu-arm@nongnu.org; Thu, 14 Feb 2019 10:13:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent.desnogues@gmail.com>) id 1guITX-0000Zo-Kk
	for qemu-arm@nongnu.org; Thu, 14 Feb 2019 09:58:57 -0500
Received: from mail-it1-x144.google.com ([2607:f8b0:4864:20::144]:53364)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent.desnogues@gmail.com>)
	id 1guITD-0008Lh-1b; Thu, 14 Feb 2019 09:58:35 -0500
Received: by mail-it1-x144.google.com with SMTP id x131so14391375itc.3;
	Thu, 14 Feb 2019 06:58:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=FW2O5d8eT9sWNU87pQcFeyggC89v8ZYSAGxGYc7O9RI=;
	b=Shx49VdFxSUgAXp4mWay3BeP6C2z7a7FfnhDq5kucbTUHee+kOOE8vS5j+HJ3oPWGj
	epfkEL/HwNNrzWJw7YBE9ulTR/2FBJ7M1znZQzrXOfLgzTiX7lruHt5D8i+2Bx/3EiEF
	zpBnRht4hb/LvsdoiMZ8wfdf0RpsO6h78YadRX7aJvxd2teW931B5YbuYO/lqWxp6qfO
	Wzx+bzwKKocDAD5haExZDG4QjPo7M3WyEFwfyu12E5+gmhxBXqrdD1xcVkQnF1ODwbcn
	ii34yGY9OixDP4m+3bxS9Y1By2PuUUjFW/VZWjhvwdy6KNQx6Oje3pmv6gYPXImEfGAi
	jJXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=FW2O5d8eT9sWNU87pQcFeyggC89v8ZYSAGxGYc7O9RI=;
	b=kxLOW1ThLG4f2BBzgge0jxFR5IDFrUihZor3Qeylg/5H5fD/HL7Ur8c1CX6v5hKIG+
	8fsU3Ljikc0yRqlGO8SsairxAMT2PPLb6El4USOub6I2cGQKBGxUGmQSIHscgwYejTl0
	sa21cclBeDmCGOWFYAVCmsE3a7OmvuqRsGBUiSU/LjZ8XciGq/XIWyAHI3H2lo0O+oD3
	2zEOfDQi0LCgCTK9oUmFnaNqzrsTwSi30GAGe5aoNCLCrZL7QECxXfdjYI9HGPzRkErr
	7LAhZxKAA8Rb7TWBohPiLE/ic9NxIp74SOpD++B3Ix/O5BEEGqW32Wln/Tj8QQm1Rb5c
	qOXw==
X-Gm-Message-State: AHQUAub16CsmmBU9NwLdk2TgggfD3ImI0wNishf+YubTCnbufw3OUE7y
	58T+qVZbatuE9lrcR4ySfE4n8iaBjSJQ49/Fjx4=
X-Received: by 2002:a6b:d904:: with SMTP id r4mr2373161ioc.98.1550156301246;
	Thu, 14 Feb 2019 06:58:21 -0800 (PST)
MIME-Version: 1.0
References: <20190214034345.24722-1-richard.henderson@linaro.org>
	<20190214034345.24722-2-richard.henderson@linaro.org>
	<CABoDooPZMc8OD7h59B_9Q+Jv+B7cXbJFEqmZPawZJ7b1_Bdp5A@mail.gmail.com>
	<d6cfe7e8-0d5a-00f7-c2ff-5db201d19df7@linaro.org>
In-Reply-To: <d6cfe7e8-0d5a-00f7-c2ff-5db201d19df7@linaro.org>
From: Laurent Desnogues <laurent.desnogues@gmail.com>
Date: Thu, 14 Feb 2019 15:58:10 +0100
Message-ID: <CABoDooP_7fWrWy27JWM9qzgYSKbyG0B7JapTHHqCuJx2MJ9qcw@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::144
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 1/4] target/arm: Add helpers for
 FMLAL and FMLSL
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Hg+yujlOalAR

On Thu, Feb 14, 2019 at 3:56 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 2/14/19 1:16 AM, Laurent Desnogues wrote:
> > Hello,
> >
> > On Thu, Feb 14, 2019 at 5:00 AM Richard Henderson
> > <richard.henderson@linaro.org> wrote:
> >>
> >> Note that float16_to_float32 rightly squashes SNaN to QNaN.
> >> But of course pickNaNMulAdd, for ARM, selects SNaNs first.
> >> So we have to preserve SNaN long enough for the correct NaN
> >> to be selected.  Thus float16_to_float32_by_bits.
> >>
> >> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> >> ---
> >>  target/arm/helper.h     |   9 +++
> >>  target/arm/vec_helper.c | 154 ++++++++++++++++++++++++++++++++++++++++
> >>  2 files changed, 163 insertions(+)
> >>
> >> diff --git a/target/arm/helper.h b/target/arm/helper.h
> >> index 53a38188c6..0302e13604 100644
> >> --- a/target/arm/helper.h
> >> +++ b/target/arm/helper.h
> >> @@ -653,6 +653,15 @@ DEF_HELPER_FLAGS_6(gvec_fmla_idx_s, TCG_CALL_NO_RWG,
> >>  DEF_HELPER_FLAGS_6(gvec_fmla_idx_d, TCG_CALL_NO_RWG,
> >>                     void, ptr, ptr, ptr, ptr, ptr, i32)
> >>
> >> +DEF_HELPER_FLAGS_5(gvec_fmlal_h, TCG_CALL_NO_RWG,
> >> +                   void, ptr, ptr, ptr, ptr, i32)
> >> +DEF_HELPER_FLAGS_5(gvec_fmlsl_h, TCG_CALL_NO_RWG,
> >> +                   void, ptr, ptr, ptr, ptr, i32)
> >> +DEF_HELPER_FLAGS_5(gvec_fmlal_idx_h, TCG_CALL_NO_RWG,
> >> +                   void, ptr, ptr, ptr, ptr, i32)
> >> +DEF_HELPER_FLAGS_5(gvec_fmlsl_idx_h, TCG_CALL_NO_RWG,
> >> +                   void, ptr, ptr, ptr, ptr, i32)
> >> +
> >>  #ifdef TARGET_AARCH64
> >>  #include "helper-a64.h"
> >>  #include "helper-sve.h"
> >> diff --git a/target/arm/vec_helper.c b/target/arm/vec_helper.c
> >> index 37f338732e..0c3b3de961 100644
> >> --- a/target/arm/vec_helper.c
> >> +++ b/target/arm/vec_helper.c
> >> @@ -766,3 +766,157 @@ DO_FMLA_IDX(gvec_fmla_idx_s, float32, H4)
> >>  DO_FMLA_IDX(gvec_fmla_idx_d, float64, )
> >>
> >>  #undef DO_FMLA_IDX
> >> +
> >> +/*
> >> + * Convert float16 to float32, raising no exceptions and
> >> + * preserving exceptional values, including SNaN.
> >> + * This is effectively an unpack+repack operation.
> >> + */
> >> +static float32 float16_to_float32_by_bits(uint32_t f16)
> >> +{
> >> +    const int f16_bias = 15;
> >> +    const int f32_bias = 127;
> >> +    uint32_t sign = extract32(f16, 15, 1);
> >> +    uint32_t exp = extract32(f16, 10, 5);
> >> +    uint32_t frac = extract32(f16, 0, 10);
> >> +
> >> +    if (exp == 0x1f) {
> >> +        /* Inf or NaN */
> >> +        exp = 0xff;
> >> +    } else if (exp == 0) {
> >> +        /* Zero or denormal.  */
> >> +        if (frac != 0) {
> >> +            /*
> >> +             * Denormal; these are all normal float32.
> >> +             * Shift the fraction so that the msb is at bit 11,
> >> +             * then remove bit 11 as the implicit bit of the
> >> +             * normalized float32.  Note that we still go through
> >> +             * the shift for normal numbers below, to put the
> >> +             * float32 fraction at the right place.
> >> +             */
> >> +            int shift = clz32(frac) - 21;
> >> +            frac = (frac << shift) & 0x3ff;
> >> +            exp = f32_bias - f16_bias - shift + 1;
> >
> > If FZ16 is set, this should flush to zero.
>
> Ho, hum, yes it should.
>
> > This means you will have to use both fp_status (for the muladd) and
> > fp_status_f16 (for this function) and so you should pass cpu_env to
> > the helpers rather than the fp_status.
>
> It's not quite as simple as that, because aa32 mode would pass
> standard_fp_status.  I'll figure something out...

Ha yes, I only looked at AArch64... as usual :-(

Thanks,

Laurent

>
> r~
