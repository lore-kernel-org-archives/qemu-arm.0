Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BEC9606A31C
	for <qemu-arm@archiver.kernel.org>; Fri, 27 Nov 2026 16:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=jnmP5mg8
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xWzIE-0005oU-Of; Fri, 27 Nov 2026 11:59:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xWzIC-0005oE-VF
 for qemu-arm@nongnu.org; Fri, 27 Nov 2026 11:59:24 -0500
Received: from mail-yx1-xb134.google.com ([2607:f8b0:4864:20::b134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xWzIA-0001p8-EB
 for qemu-arm@nongnu.org; Fri, 27 Nov 2026 11:59:23 -0500
Received: by mail-yx1-xb134.google.com with SMTP id
 956f58d0204a3-67be1e468a8so7930433d50.0
 for <qemu-arm@nongnu.org>; Fri, 27 Nov 2026 08:59:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795798761; cv=none;
 d=google.com; s=arc-20260327;
 b=Kf+KGxzP7Ft3y7RQvtKRcDaRuuGcI7fSnCasVn8nChHjIBjHgLIKKPw3eSsyIW7/KT
 ZKksDMwKeMEb6fRXBQf9AHh5PTxp3l5YJ9rQK4kzgVh/BzaV1vMo+6+CfBXSMnbNvz9m
 CwI6gipoC1ceRwkBnpH/+JcOu/O+zBUXTfIE/hno0X2HfF+OqMyPSp8+GXduQj9+Lqyn
 H1MZghSijMBXkPPuND2zXQZwmin+gFLaCUXLMP48n93bsycXsblfvxkzeAEp/dY0ouxw
 Vwq3tazeQiuRyhFWnuReZHrVwhTRVjTjVnWh47LVCVQHTL312+YOKvDI4h7sDMTKkvyS
 VR3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=GeFLhbqwzoVWy/zuAQkq6ufr7qnIgWRpiaAOFkp4eqs=;
 fh=2GI/aZAADYkUgYy7nSlsWPcKP+ZC7NmUn/5uq6SV6ew=;
 b=hrD8DgCAOFlJ6SYAE+SoqlWcBa9i6sUyu/Va/02Bh34POl4gk6i1fzupcHlZiNhHgd
 UREite+pq8Ev9QFI4qFK7oeBKTofEbjtIfb04OBg5+s6Uf2/rrY9HzaElskLjF4RP3JN
 ES2dI7jutZEo5pipG2Xw6ssA7wggxOK40vmiVrJVajgQ/MYI75dnJVJeNkya4qjq+lZj
 wTbwMGiWYiThaGH5egeE2WjIeXMASbMqZu1JYiJCBVq58sXZnk/TetlCja5L6Rs2U7JM
 tlUJ3qdLRitLHOcHDngrt8hdcJ8bVr3+Q21Z9eKya8ZoaRWjBFhecoXq4VJXkQJr9ATs
 a2EA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1795798761; x=1796403561; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=GeFLhbqwzoVWy/zuAQkq6ufr7qnIgWRpiaAOFkp4eqs=;
 b=jnmP5mg8tdDeGhnMj1br2J0IAtPAg/bwQUmrELIR+fzRZ1FvA8iN8NYdIWqqQwKZ5o
 G/6m0mUwfEr/Cn8SetCrzGmcdvHyORgDMMZVK0zRb1Pj3EAMMyiShMXids9V28Ibe4r4
 LzUJdcjGQPDAY+SdMVVnSKya3tD7M0D/Nz6PVZ2H6Mkk/ABFwlBlft0KAA85CupVu5YD
 KM1n7/SKXLwNMMlgt3XTfr3xhkOp8PsdWYs/6pSPqWu+iU1ZcBtYpBk4QdJyha9NYzdl
 WhvXv+3TVR2NB7E6zL+FQ1dX/q76H9D2sXz9xaWodM+Avr4unwQJZjB6wXsl6H0TixT9
 sxpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795798761; x=1796403561;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=GeFLhbqwzoVWy/zuAQkq6ufr7qnIgWRpiaAOFkp4eqs=;
 b=sFh5MOPWa+AC7lBmHQjIFW4Pk/MN6Hdt4F7m3OshhT/yds6Exgtm22zSOtD45gcPXK
 fB5iXBHQ2KCb6pIU0JxkgkXRwbXFociUIQRjiGnlEB3YLWwzBxy0ZCtgZ2J0QBXfUCLA
 MKYKq+IooeSPv9JaGkIZFnDWpkxwr5fbP07q8g9aO6tS3mxKw6TiPMMX+c5WXZxtAtuw
 ZDiKhSXSCe2WhUd40/OJsj0k9UhOjus/4uLULeH+6TUY2/WShPkb4AZuiJYZTyCfBy3M
 XbU24Tr4v5UNnlQdwNOCNh0jtUHAkkZbFuJoD6dMLiZmM/SNA3YscLoxvXM+uGMOOb61
 fcpA==
X-Forwarded-Encrypted: i=1;
 AL+hErFb5dsHYkeo6deWPlzmvsS0OLk3L/JCojPtmhLyUHP3Kessuq//E0fKeQQWqPrdWdLe7OheCuY71w==@nongnu.org
X-Gm-Message-State: APuU4Z+2k9v0lyp9PV9msebfAXNHi8O4R3UxWho5VPXhsZJqiqU3uwCf
 Et9xTIO8GiLC2Qbb4TmIvRM+KdjblC37nR+FJVdMbO//EK5vnqKn0P/5LuHE6E1+Hh9Pe0NUNBv
 bi46FhtkmmAhen0ap/RSt895lTIZu1GdvcigevD7V3xTSkDvuz5LL
X-Gm-Gg: AZFdTZc36wiH9fSRKECurNqyyGokOAB1t8D8+GbtE59YhsHJo4s+PBg1EGlha3f2tvW
 c+UbSTeO3F99dkfUEWqhZXFRpU21mCHyEafBF2/yxzghSD8yoBzzkb5fGQofZlCDyuco0tn9oVG
 kflHySrwlw0KCWLbSgZwJFzdzWUiV3gu/Y/iyptOP3h7nsa/XOUisaIZc0VUyx+teKGG6BCrdbS
 clZuSJBcqEumzGxap/ekFOko0GDtlkVub2rw/WHffQPGcynfcgGASpcotZ5VsE1M1aymm7FZZIi
 miY4O5zHAEpJHBpDV+FasI52DJK1vkXceJzDInytvvWHzWnof55EEr4btO8X09hqhKx6SEhu09P
 qrOKz+V1r2W4x4cybB0M/Ra5vnhmoZBtdFuHLVZiBlO5Rko8RsZ9/lRB+8JldA1BIbVcZcMuXFb
 K/O7AQkmRMvlSredjN8W7H
X-Received: by 2002:a05:690e:bca:b0:67c:2b1:dd40 with SMTP id
 956f58d0204a3-67df4464afcmr9958304d50.85.1795798760874; Fri, 27 Nov 2026
 08:59:20 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261030194318.319310-1-richard.henderson@linaro.org>
 <20261030194318.319310-9-richard.henderson@linaro.org>
In-Reply-To: <20261030194318.319310-9-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 27 Nov 2026 16:59:09 +0000
X-Gm-Features: Aa3M54o2Aeodkzqcb9opwOqCo4DeMdZ_tkg1aQvdSp6N8FPLdjUI1G5nw63PLOA
Message-ID: <CAFEAcA8FjMNokA_9dKeR=qKR7YFOrsrEPmjL7368tfjyTzhMGQ@mail.gmail.com>
Subject: Re: [PATCH 8/9] target/arm: Rework gen_goto_tb to gen_direct_branch
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb134.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, 30 Oct 2026 at 19:45, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The only remaining uses are true direct branches, or
> simple chaining from one TB to the next via fallthru.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

