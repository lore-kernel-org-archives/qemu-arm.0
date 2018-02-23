Received: by 10.28.71.27 with SMTP id u27csp505003wma;
        Fri, 23 Feb 2018 04:03:47 -0800 (PST)
X-Google-Smtp-Source: AG47ELvbLIUiYpwUoBuHemz7JITieOt3BPcrMUFMtcdNFs3bbUygGmLMWtn3xwFZ+0+Gda2+2vN2
X-Received: by 2002:a25:a54a:: with SMTP id h68-v6mr760493ybi.445.1519387427263;
        Fri, 23 Feb 2018 04:03:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519387427; cv=none;
        d=google.com; s=arc-20160816;
        b=G18QUWXW5s3kmn6tFX8IpYDey+56T59UbVRjxOcp3V8qco6By6eRopSiwG8Hk20vZ+
         BmTaqhtDxPeybfLCD7O4voD9OkYWM45rx/LOW4NmMt39ni16CAAZKxT39G22tUBYqI4C
         e51hEemlHmUxagiVs/e9ZeSBCpjdwVVl8w8OCqSgfV/trQEMcsATl0SHzo7JpDr+XBCb
         O/G6wBAugBRLnP6pJfXGsZq874lICsCwpjOlBelYu79kppNZHGuK65Vu/aeOrx1DdrUc
         IueWFgdWSczWnR5S3BrKQ9dwqwkA0k4lCnmTWLyAYJaVWz5aAj+e5Dnw2Qkis3doh9yZ
         WJVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=8MQ+oeMBOmvx5pYgA2EByO5F5g22W06VxZdJo43zoPY=;
        b=kNpSFVOpiiYKTgUA5ogNx6ByAp1P+aTvi/p6urXeHWP1cj46uy1Jt59CLHPYt1vLki
         F9vPMo/WUbYUXbk/yiBir1jS5KL/zu1AVzyjO9kg/di9S4GsRBoWnY/qqfSeO0+DbIgc
         CRlvaeiPAPi7r7jQ8utKcIJKdMRmZia5Q/pJzHJri0qJhAjTTHmujHi7WROUhObOhtYW
         EYQkhjIQykoaTVZlYZwVTsA3uZ3LpHdrl75Y1jQLW1pdNchDVRov+hVERVXWgaa70iM6
         te6HeHBTJHp/sRUCnJJkDSQbn7PBQPO9aJQ+fgqo2c249iYaVvcQTtKqGYQgRMK49/8K
         7nqg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QkgGh/OW;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t7-v6si373328ybg.48.2018.02.23.04.03.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Feb 2018 04:03:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QkgGh/OW;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43970 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1epC4o-0006Tm-OX
	for alex.bennee@linaro.org; Fri, 23 Feb 2018 07:03:46 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44035)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1epC4Q-0006RX-Q1
	for qemu-devel@nongnu.org; Fri, 23 Feb 2018 07:03:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1epC4P-0003Mv-Ph
	for qemu-devel@nongnu.org; Fri, 23 Feb 2018 07:03:22 -0500
Received: from mail-pf0-x241.google.com ([2607:f8b0:400e:c00::241]:41281)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1epC4P-0003Lo-Ks
	for qemu-devel@nongnu.org; Fri, 23 Feb 2018 07:03:21 -0500
Received: by mail-pf0-x241.google.com with SMTP id a17so3425687pff.8
	for <qemu-devel@nongnu.org>; Fri, 23 Feb 2018 04:03:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=8MQ+oeMBOmvx5pYgA2EByO5F5g22W06VxZdJo43zoPY=;
	b=QkgGh/OWyrKCQ8pu2jEvb4KXFy0+u+Ll1UM/EpuldC+OpVBqMMF99E8eFvaHso20ks
	CD3FM+Yj0HaGJ6NnwmJEY5F7OPORW7GhHFcio0Eaqdllt836LPt7r8tUcihJ0LoMyiAt
	zJ0xgJKFsxXva9JIpHxV+QO/DvSbw9n4VtOBo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=8MQ+oeMBOmvx5pYgA2EByO5F5g22W06VxZdJo43zoPY=;
	b=CTDWvKBdOUMJAQTvhjjdiQCTEfHvsr52lWH61yr/eo+8XfStXhLXvMaY1gB2Lfh3TH
	55y4QIWaMg4gp4gr8tXvcsoSH0uvCVutdK+px/PYffxMUvNtRFqVfC5XYnj2WFkVeETx
	py9cuZHC54VwXsL4mR9khTHpgOJV1zyM9unXP22NPXlMPMRsxcXU+aB9EDgra+NTUtfx
	UCRwbqPU5m75nIqiCV11kBrjcZM3ElrmaLYKoNx8pXWv4h5g5Nj1kqs6rUD3ppJ4HvM3
	RVQJtFJSBjdxGhxXlb6sWirlw09WdLZ0Fs8i90J2oXD3xixS5cPT9kL71xn6QHAnqIFp
	YYzg==
X-Gm-Message-State: APf1xPA5iotauYgWK8FmwiQThQ3WF7iUSSdopLPoSWnXqIVbb+TRpN0p
	SGco34XaG320c3xJGoY35x03UzjZR3CMqcD1W5V6HA==
X-Received: by 10.99.182.12 with SMTP id j12mr1299866pgf.113.1519387400537;
	Fri, 23 Feb 2018 04:03:20 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.241.10 with HTTP; Fri, 23 Feb 2018 04:03:00 -0800 (PST)
In-Reply-To: <20180217182323.25885-12-richard.henderson@linaro.org>
References: <20180217182323.25885-1-richard.henderson@linaro.org>
	<20180217182323.25885-12-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Feb 2018 12:03:00 +0000
Message-ID: <CAFEAcA_5bBJiFKZ7PGW6KW0Em9rGsZU57s97t11674Yify60Hg@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::241
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH v2 11/67] target/arm: Implement
 SVE bitwise shift by immediate (predicated)
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
X-TUID: VX2a2MpLPKUq

On 17 February 2018 at 18:22, Richard Henderson
<richard.henderson@linaro.org> wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper-sve.h    |  25 +++++
>  target/arm/sve_helper.c    | 265 +++++++++++++++++++++++++++++++++++++++++++++
>  target/arm/translate-sve.c | 128 ++++++++++++++++++++++
>  target/arm/sve.decode      |  29 ++++-
>  4 files changed, 445 insertions(+), 2 deletions(-)

>
> +/*
> + * Helpers for extracting complex instruction fields.
> + */
> +
> +/* See e.g. ASL (immediate, predicated).

Typo for "ASR", I guess ?

> + * Returns -1 for unallocated encoding; diagnose later.
> + */
> +static int tszimm_esz(int x)
> +{
> +    x >>= 3;  /* discard imm3 */
> +    return 31 - clz32(x);
> +}
> +
> +static int tszimm_shr(int x)
> +{
> +    return (16 << tszimm_esz(x)) - x;
> +}
> +
> +/* See e.g. LSL (immediate, predicated).  */
> +static int tszimm_shl(int x)
> +{
> +    return x - (8 << tszimm_esz(x));
> +}

> --- a/target/arm/sve.decode
> +++ b/target/arm/sve.decode
> @@ -22,12 +22,20 @@
>  ###########################################################################
>  # Named fields.  These are primarily for disjoint fields.
>
> +%imm6_22_5     22:1 5:5
>  %imm9_16_10    16:s6 10:3
>  %preg4_5       5:4
>
> +# A combination of tsz:imm3 -- extract esize.
> +%tszimm_esz    22:2 5:5 !function=tszimm_esz
> +# A combination of tsz:imm3 -- extract (2 * esize) - (tsz:imm3)
> +%tszimm_shr    22:2 5:5 !function=tszimm_shr
> +# A combination of tsz:imm3 -- extract (tsz:imm3) - esize
> +%tszimm_shl    22:2 5:5 !function=tszimm_shl
> +
>  # Either a copy of rd (at bit 0), or a different source
>  # as propagated via the MOVPRFX instruction.
> -%reg_movprfx           0:5
> +%reg_movprfx   0:5

Squash into relevant previous patch.

>  ###########################################################################
>  # Named attribute sets.  These are used to make nice(er) names
> @@ -40,7 +48,7 @@
>  &rpr_esz       rd pg rn esz
>  &rprr_s                rd pg rn rm s
>  &rprr_esz      rd pg rn rm esz
> -
> +&rpri_esz      rd pg rn imm esz

Should either not delete the blank line, or don't add it in the first place.

>  &ptrue         rd esz pat s
>
>  ###########################################################################
> @@ -68,6 +76,11 @@
>  # One register operand, with governing predicate, vector element size
>  @rd_pg_rn      ........ esz:2 ... ... ... pg:3 rn:5 rd:5       &rpr_esz
>
> +# Two register operand, one immediate operand, with predicate,
> +# element size encoded as TSZHL.  User must fill in imm.
> +@rdn_pg_tszimm ........ .. ... ... ... pg:3 ..... rd:5 \
> +               &rpri_esz rn=%reg_movprfx esz=%tszimm_esz
> +
>  # Basic Load/Store with 9-bit immediate offset
>  @pd_rn_i9      ........ ........ ...... rn:5 . rd:4    \
>                 &rri imm=%imm9_16_10
> @@ -126,6 +139,18 @@ UMAXV              00000100 .. 001 001 001 ... ..... .....         @rd_pg_rn
>  SMINV          00000100 .. 001 010 001 ... ..... .....         @rd_pg_rn
>  UMINV          00000100 .. 001 011 001 ... ..... .....         @rd_pg_rn
>
> +### SVE Shift by Immediate - Predicated Group
> +
> +# SVE bitwise shift by immediate (predicated)
> +ASR_zpzi       00000100 .. 000 000 100 ... .. ... ..... \
> +               @rdn_pg_tszimm imm=%tszimm_shr
> +LSR_zpzi       00000100 .. 000 001 100 ... .. ... ..... \
> +               @rdn_pg_tszimm imm=%tszimm_shr
> +LSL_zpzi       00000100 .. 000 011 100 ... .. ... ..... \
> +               @rdn_pg_tszimm imm=%tszimm_shl
> +ASRD           00000100 .. 000 100 100 ... .. ... ..... \
> +               @rdn_pg_tszimm imm=%tszimm_shr
> +
>  ### SVE Logical - Unpredicated Group
>
>  # SVE bitwise logical operations (unpredicated)
> --
> 2.14.3

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
