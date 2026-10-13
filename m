Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92B93CA9ED2
	for <qemu-arm@archiver.kernel.org>; Tue, 13 Oct 2026 11:41:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xGasn-0005Lo-Lb; Tue, 13 Oct 2026 07:41:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xGasl-0005L0-RM
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 07:41:23 -0400
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xGask-0006bB-5s
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 07:41:23 -0400
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-8a83d2706fdso19773157b3.0
 for <qemu-arm@nongnu.org>; Tue, 13 Oct 2026 04:41:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791891680; cv=none;
 d=google.com; s=arc-20260327;
 b=BlVBEDeI/0UbckiAq8zaLWDyQeUJJO/ISTAzaLn7HoJYrd1jkVHWYyZKsnmLo1MsIj
 i5W3Ks0aH0fRNcJ1cMcc8K7rndBgMCKJlGQUTeGggc86c0QM/wWdOXkG5+uoRas5ISB0
 sAlr4oy7GN3Koip/z3L9mdYMI9rrmSD/zBzXIzWvNOa/lZ6yM8cKZYqwvjQ08B6/zFbe
 Zz4yu3VZB2Fenjo3noVvNsWQ4dRn6Wz8SUxA225jUMasNoc90nu3J1xT2M7a6fFG9DAD
 Cbr4fTX9KYRbC8K3naYQJ1/5Qt5idOe1aQ1FOKFu4fE1ijrtMh5nH4lGKsVbIw6CKpPn
 6vYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=9McWWCAOIBxuGBkuBTOr3Tp86N9anlMxSYYZCGam1ns=;
 fh=OGc8nIC6QJ8tbIooPF34P0V293Bm/Mb0yOkGvyFS2Rs=;
 b=fk43uBs/EQpiVajZINVT7hXEbNiZw1SRikbIo9z9CKZhCwyNgFQ7yrbFL+5CHpFtsJ
 v3oHBXJsQVfBJSLpaDzjLWo4aRdOCgXqiQvugZ0LAmsmlOZF4FeRCofa4y3+ap/UIpN3
 6ha9jWsrrnocJMcRppcj/50KxvTxEP//9vgCLM8tUDLaLLrVTwRr7jTChmgeYMyi/8I9
 rIerTZqrTxGiUG9EAPyvzqvkdgza9O/HZkqiWxVWFZyl8U1AGdL7hv3YcGhIi3GVBZsd
 AnbpOK1n4Q1BHYlJXF7zyxCX/FGMppAOQNemPJZoOWToNM/LoF9LKAb4tXfcdAUwD+9G
 wKeQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1791891680; x=1792496480; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=9McWWCAOIBxuGBkuBTOr3Tp86N9anlMxSYYZCGam1ns=;
 b=dZecJ01UL3gMSh3ZE9qNN5zjUQWs/xVTkLVo5fcyGFSjT5tFPMwqphZpoDUh39zSft
 CG6dgYZV6+QKMXP40o+GtIoeDT+209MTweyddgwu9XiiIn2ZLjKSWQhUT5Dl++MytD8V
 vIndoVzflFypd9TXadLCpd0tkABKHP3O/RrpICXTxC379pYqbYcVco3Xaqjd9c8c+m+3
 zDloEuiw2UTUWZyI23o//xOIZRpSZ+Lan9qYGOazmaeAeYF1a4/0UYdwFeMNM/6GNl0U
 3aLEyXlOZeo6GWnVy21jIkU33oSY5xIVyeMmsfLPiU5cfaHbj/zt7ADHOtKzpwZ2OHlU
 crAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791891680; x=1792496480;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=9McWWCAOIBxuGBkuBTOr3Tp86N9anlMxSYYZCGam1ns=;
 b=zCsh4qpCoiDSKsFI+VyaU7Xmx6Ui55j8279OXKAZh0K2Y5HcK61m9kzRiaYdGoUW96
 SMmO46NMfRp8W6BPN4/msECif1h5PQ3zTpi2xjA3LupT0adTxHYFInnP4jzyN12ZeBbN
 nAuLXJExkCB0aQbq45HoFK08fEw1XC8AK0KBb3r2I5S6CkA1d5fjwcKfRayR2hffopub
 FQ15XRMNAHTz42bEcENz5ZEOvyB7Fx9Wp0YkQU7ExTzPj9aC9s3waf3f3PFNZEdiGX5b
 xvIctrYDknn88v0Uf/k59dQDKvB3ua8W8I1g5Zv7/6ZNM7dy87MWkOoVRvAFPJJOaR6m
 7KzA==
X-Forwarded-Encrypted: i=1;
 AKwUvBzgI9i66FfSTORhH+3Vt60oZwx1Tw5x5ign0cxAXD1J3Ah0Na2tfmDpbCaeIa3wPLUa8rn9S5rqjQ==@nongnu.org
X-Gm-Message-State: AFq9FYKmJyR2CBPbEJxhuFEjgELSRv09KQ3qNspimRGaK+T4dkwMsXUO
 A/2f2aZ+xfA+Ns9WV20bvnN2so5xXqEFDQ4jDjBuiq4kn8WsPV0EL5AgolxyKGI51CTmLzgFnFz
 rakSqicGZVlYIUQydqzMD802/K3cPPdYoY0Wms+t1fA==
X-Gm-Gg: AYBFou1hJX51iVKI6XeIW+OOmnWhNRjfzVwi0WnVaKJWkVoPeIK8fXcMajdMf63XIyH
 Zb3kyb1p2HEoftSWkD6vnQnTGYhTqYYODumzcGqUvpZGpCMd2+jvFFQBhRhcuXlXC/w+bJ4F/bw
 +3V1dr+7tEWPJFbbU/uKKuvcmI4a06Oz91iQcXQX1SrEfniCLihqOqaUetIDXUhZORofkZDaXkZ
 zmA6vgdB7hkLLIn3M5LhH9kbeJq0Aeck2QHfshuTTs/vwJRr750I9+nQtLPFPsM6cSo5OEaCKzb
 ne2zChiMfehYaziUE7OH+X0nxwdQu9BbsllnI7wk9x4XGhDuy2fuOmPL+2yZVa158DTOU7QZO1z
 84fz0AGjMhXA+sJrzgIet3z6RtAUNuUbXHpnkjSpL694icoC8rQ==
X-Received: by 2002:a05:690c:f08:b0:8a8:e0c7:dc3f with SMTP id
 00721157ae682-8b07edb5995mr42242067b3.18.1791891680293; Tue, 13 Oct 2026
 04:41:20 -0700 (PDT)
MIME-Version: 1.0
References: <20261012134840.1051969-1-alex.bennee@linaro.org>
In-Reply-To: <20261012134840.1051969-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 13 Oct 2026 12:41:07 +0100
X-Gm-Features: AclHuK-_TRFTWfTRNb6_FhuCtZhq8iwthH6pC-l_0gF9LKp9RuHZlndyg60fWdE
Message-ID: <CAFEAcA-9+y_DQ2Pc5WZGQR_8Q3Qo_xCxaXhKPq5tor1sRFG2ZQ@mail.gmail.com>
Subject: Re: [RFC PATCH] target/arm: hold bql when SEV sets the event_register
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1136.google.com
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

On Mon, 12 Oct 2026 at 14:48, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> There is a race in qemu_process_cpu_events and sleeping on halt_cond
> where we can miss the setting of the event_register which would cause
> arm_cpu_has_work to report we shouldn't sleep. As by definition the
> bql has to be held when we go to sleep against halt_cond guard the
> kicking of the cpus by the SEV helper with the BQL to ensure things
> are properly serialised.
>
> The other places that set event_register are fine as they are either
> in the same vCPU context or are already serialised by the BQL.
>
> Also use qemu_cond_wait_bql like the other halt_cond users.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/4660
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  system/cpus.c              | 2 +-
>  target/arm/tcg/op_helper.c | 3 +++
>  2 files changed, 4 insertions(+), 1 deletion(-)

This should be

Cc: qemu-stable@nongnu.org
Fixes: d238858bff6 ("target/arm: Implement WFE, SEV and SEVONPEND for Corte=
x-M")

right?

thanks
-- PMM

