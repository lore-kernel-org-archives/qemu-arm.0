Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 379AB606A31D
	for <qemu-arm@archiver.kernel.org>; Mon, 19 Oct 2026 18:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=sU2ptv8H
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xIsZd-00017h-Fn; Mon, 19 Oct 2026 14:59:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <samanyu.goel16@gmail.com>)
 id 1xIqAz-0001aC-IF
 for qemu-arm@nongnu.org; Mon, 19 Oct 2026 12:25:29 -0400
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <samanyu.goel16@gmail.com>)
 id 1xIqAx-0001PJ-R8
 for qemu-arm@nongnu.org; Mon, 19 Oct 2026 12:25:29 -0400
Received: by mail-qv1-xf35.google.com with SMTP id
 6a1803df08f44-91b83459526so29671066d6.2
 for <qemu-arm@nongnu.org>; Mon, 19 Oct 2026 09:25:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792427127; cv=none;
 d=google.com; s=arc-20260327;
 b=il3WeKv3hrdSNmMorxF+BuN/a404hjX+/xeIcmvqHd2KBl2x1KaVezQWyNHeWk9LQt
 SewUDnAOZZNsk5TOW3tqJYzxvBG+ZswGaGkS53XlBRJpsHc+P/frha4SgqQsKt7Z64yl
 3JoiumfSuWH77UxwNZGilHPwvxlXpTIrMisekBXoLy5DpxgmPrLqCaVQAa2SJflzTYM0
 zeydVPFzX7jDsJzAv8T0lcDtkDLPluU6ntIVHI1ElmYX/BluWGEOvPSe4X6Xx0ft7joC
 el1hIp8uA4MqeuvPPjbVn2Glq233PghTb25Kx0tYwc2gtkToA7UMdq3wKfnMUdn8cM8W
 1jBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=Kl9iXwi4LOXMFWUH/bOEVH1gGOQOhUX9QNpEdl9gE5s=;
 fh=k1bgjbt5LrbswjVL1W4AwAdHoogIDY/vxBHHqYHVqug=;
 b=l7UrTW4NLvPwO3I2a7JFo1y/KavWOnMZKsSkj16Q9EMJaM3NFgu7PYfEdbwKcSmQJE
 hOLTdzg570+s8Izil4wWiXOO9qeM1cDvOOA2tugJimq7AjiuaNq9eHvjcVjtj9gatp+t
 dz5IlVgiqBWE02F8IM1Y41UBwOvy9aYFPwOeOE19Ds8UMTmFljfqV9rpIFQSnixfJMx/
 VH8dHfnKJbaKVGRXqSL4+rtqw5Px5/K9IMprYCTVgxQUplBO8lrUFzMigm1Y2HHSiKjo
 8miZYCYnIa3ihtAmauY5ypur/hVkbt5sgKZIS0jMLm8HvgPQKxjxQrRScDa/lItgJ0QK
 bXsA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792427127; x=1793031927; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=Kl9iXwi4LOXMFWUH/bOEVH1gGOQOhUX9QNpEdl9gE5s=;
 b=sU2ptv8HVHkWLiemf0lv0Wg2yrbwMr7gqIDK+gobyw4Kj5F8TFTtCowR6M+67xqSvw
 d15/CuH/rKMu7k0jI1omNLOvfaVp/HETmpbreEudsONwTALMJtCgKOf1qnLVk/mFblhI
 gCy3s2WkQ+fSaS/A1Wt9kV4BG6khx1XR6IogoRGQt16/t6n+CdWFSFyKUIFWGXMpctqg
 ZtuV+ATetaSPdrByrG/j0qXKV6gnSbBi0+aTP+H+jR4ifegSjv5HwtZ6bBBalsJwN8qk
 iz5lyE5lG/TR5DR28HvMI1srBq3xpcFoYA6vrlJagZV5tPFiGGz8TJoybzQ+dKRdeKnW
 W4Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792427127; x=1793031927;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=Kl9iXwi4LOXMFWUH/bOEVH1gGOQOhUX9QNpEdl9gE5s=;
 b=ru2bYKv55dAh4WV0x6PXsVkpOE6Q/8RQuiEyBIRujNWctCPme0WaF2yypG4dMfHXJ8
 2IKcXAJfZ9rymnxk6NdyTS38a5YQkAkD35QuFwh6YdptBojchw0MJTAp63JuCzuyQg7n
 kwTphEqUpjSO27buP7+7Csb1uPR9zZNYdJ8khfemA5ipVFMgM5GWQIeP7ZVinfzn608R
 9oFoOdNDXrzy8nmwyp5T8qot9CvMgncHwTCdL/f9QdmKkxLNgSfbyq1uv0mGrgdQra/W
 P7+7J8AR4UOjt49JtKopimXVdeXFEaw+GNeZIW5Q5qa+DaPV0kPXr2V6A1I4AI8Z0yJH
 eemg==
X-Forwarded-Encrypted: i=1;
 AKwUvBwxLHs4GZLp870mAoiFqbG0SDLUnT52fR8kvP2kY1OFqou2gUe0+ds+Jj8Smm2t5LlfzII0d9LjEQ==@nongnu.org
X-Gm-Message-State: AFq9FYIsbHLTPjTfrp8o55b535zreqI33fpbIq2rE6xHEOOh1Qho/GbH
 zWgcAadjfywP2VYEzCwIGoNx+rgbjtJpeYoHeDPGb3tp9RbWV7RZW4cD/Xa+VV0cyGH1B8K30PT
 Dkg/t9qLkk8QD9PZgemU516zhc8OtzeM=
X-Gm-Gg: AYBFou06ITAfBKD0IoNeqPegooQrox63uxpflPNeaPxp8CcRRf/09/r9m8IiRjLBqlq
 /GCFrQPhiZ7W9Dk06qR3YEJGr49SKqwrg+3DL411xznH5fXUXas4QLRaT8r82XVvVqVpsKSF4gD
 aon/4eE+1smjkk7ycdkcVo7vxblvotEjgmAbAfDUkxu1xhtw8ByB46o3YqtNvgqkdTnxxSsQnna
 hZR7fnMpPafmBxKS/vC5iXxoy00X+xCW7UpxMgZaNR+/wthDNipH2He5tGqYk6G0M9bhi7yzObi
 eH93AksxxBEqHeCs3Zy3C8DVvqSwLutdtZmzmryABG2kpAk4BNCLbUbKUAgLjBk2ioUTSmnBPM1
 1FzfX0hYU4FVFQ8LlxKcavWojworsLT8A9TnwBrg=
X-Received: by 2002:a05:6214:2e48:b0:914:40fb:8e89 with SMTP id
 6a1803df08f44-91bdefbc857mr130146526d6.16.1792427126643; Mon, 19 Oct 2026
 09:25:26 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261019155519.1302964-1-samanyu.goel16@gmail.com>
 <CAFEAcA_QYXpjXdC8oiTfn2Z3E99hW0j-mcDSqGLhKfKKex8VsA@mail.gmail.com>
In-Reply-To: <CAFEAcA_QYXpjXdC8oiTfn2Z3E99hW0j-mcDSqGLhKfKKex8VsA@mail.gmail.com>
From: Samanyu Goel <samanyu.goel16@gmail.com>
Date: Mon, 19 Oct 2026 21:55:13 +0530
X-Gm-Features: AclHuK9DfyJEFY0MWupTHVEG_JtaPCW-ax_PvkOfeG_WeYxSbGhg25GiD-Awng4
Message-ID: <CAL3-oQiGT2OSxq7casnW7JuwrCM5wa2L4SDpDe_As7+1hyEuww@mail.gmail.com>
Subject: Re: [PATCH] hw/intc/exynos4210_combiner: Fix out of bounds access
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000002b5f11065e33f621"
Received-SPF: pass client-ip=2607:f8b0:4864:20::f35;
 envelope-from=samanyu.goel16@gmail.com; helo=mail-qv1-xf35.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 19 Oct 2026 14:58:53 -0400
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--0000000000002b5f11065e33f621
Content-Type: text/plain; charset="UTF-8"

Thanks Peter! Good catch on the read function, I totally missed that part
of it while focusing just on the main issue.

It makes complete sense to clean up both functions together in your fix.
This was a great learning experience for me, so thank you for taking the
time to review and share feedback.

Best,
Samanyu

On Mon, Oct 19, 2026, 21:46 Peter Maydell <peter.maydell@linaro.org> wrote:

> On Mon, 19 Oct 2026 at 16:55, Samanyu Goel <samanyu.goel16@gmail.com>
> wrote:
> >
> > In exynos4210_combiner_write(), the bounds check used req_quad_base_n
> > instead of grp_quad_base_n. Because req_quad_base_n counts 4-group blocks
> > rather than individual groups, invalid offsets were allowed through.
> >
> > For example, writing to offset 0x100 resulted in req_quad_base_n = 16,
> > passing the check (16 < 64). As verified in GDB, this caused
> > grp_quad_base_n to reach 64, leading to an out-of-bounds write at
> > s->group[64].
> >
> > Signed-off-by: Samanyu Goel <samanyu.goel16@gmail.com>
> > ---
>
> This is https://gitlab.com/qemu-project/qemu/-/work_items/4709.
>
> You've missed the equivalent check in the read function.
>
> As it happens I was working on this bug this afternoon; I have
> a patch nearly ready to send which fixes this and also cleans up
> some other oddities about the checks in these functions.
>
> thanks
> -- PMM
>

--0000000000002b5f11065e33f621
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Thanks Peter! Good catch on the read function, I totally =
missed that part of it while focusing just on the main issue.<div dir=3D"au=
to">=C2=A0=C2=A0</div><div dir=3D"auto">It makes complete sense to clean up=
 both functions together in your fix. This was a great learning experience =
for me, so thank you for taking the time to review and share feedback.</div=
><div dir=3D"auto">=C2=A0=C2=A0</div><div dir=3D"auto">Best,</div><div dir=
=3D"auto">Samanyu</div></div><br><div class=3D"gmail_quote gmail_quote_cont=
ainer"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Oct 19, 2026, 21:46 Pe=
ter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@l=
inaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Mon, =
19 Oct 2026 at 16:55, Samanyu Goel &lt;<a href=3D"mailto:samanyu.goel16@gma=
il.com" target=3D"_blank" rel=3D"noreferrer">samanyu.goel16@gmail.com</a>&g=
t; wrote:<br>
&gt;<br>
&gt; In exynos4210_combiner_write(), the bounds check used req_quad_base_n<=
br>
&gt; instead of grp_quad_base_n. Because req_quad_base_n counts 4-group blo=
cks<br>
&gt; rather than individual groups, invalid offsets were allowed through.<b=
r>
&gt;<br>
&gt; For example, writing to offset 0x100 resulted in req_quad_base_n =3D 1=
6,<br>
&gt; passing the check (16 &lt; 64). As verified in GDB, this caused<br>
&gt; grp_quad_base_n to reach 64, leading to an out-of-bounds write at<br>
&gt; s-&gt;group[64].<br>
&gt;<br>
&gt; Signed-off-by: Samanyu Goel &lt;<a href=3D"mailto:samanyu.goel16@gmail=
.com" target=3D"_blank" rel=3D"noreferrer">samanyu.goel16@gmail.com</a>&gt;=
<br>
&gt; ---<br>
<br>
This is <a href=3D"https://gitlab.com/qemu-project/qemu/-/work_items/4709" =
rel=3D"noreferrer noreferrer" target=3D"_blank">https://gitlab.com/qemu-pro=
ject/qemu/-/work_items/4709</a>.<br>
<br>
You&#39;ve missed the equivalent check in the read function.<br>
<br>
As it happens I was working on this bug this afternoon; I have<br>
a patch nearly ready to send which fixes this and also cleans up<br>
some other oddities about the checks in these functions.<br>
<br>
thanks<br>
-- PMM<br>
</blockquote></div>

--0000000000002b5f11065e33f621--

