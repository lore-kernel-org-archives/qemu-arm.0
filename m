Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA74B606A31A
	for <qemu-arm@archiver.kernel.org>; Sun, 25 Oct 2026 09:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=RYLw719D
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xKuyJ-000320-87; Sun, 25 Oct 2026 05:56:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xKuxt-000307-Qi
 for qemu-arm@nongnu.org; Sun, 25 Oct 2026 05:56:38 -0400
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xKuxq-0000yD-NU
 for qemu-arm@nongnu.org; Sun, 25 Oct 2026 05:56:33 -0400
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-8ab43af5e97so20253917b3.1
 for <qemu-arm@nongnu.org>; Sun, 25 Oct 2026 02:56:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792922189; cv=none;
 d=google.com; s=arc-20260327;
 b=eqANF9x4E5GqpByk6cLzHC3oMwNO5B23CvqftAyNSVdJJiuW8k5s50a6dcPnljcH7Y
 OaxuzpPS3X25GGZucbhq7qlKJVJnRk2gC8riMKgh/ThPsprioVpCbzXUlB81xD+r9gUe
 LwkXs/HrSm83663g3CGoUnYGuLLrzwYP3gkGnVkE2mC7mHgVF3uACB562sbWDN8g4pyF
 jjgRBOGorOaj9UEllKNWzS82Pkc0uQ4O2I2F6TJi0tYDMYurC11b1kTefvyDv+eFFfL+
 /aUujd8h75s0hk2KZTkDeMSMZA/Pma0XDsMGrnZcNURW4uTo6ktOf9DImJ2JJhRircGL
 XMMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=h0l+ojj5sB1J/f1DDKsR0fDF26ZMQzeqNQMEOYiQMT8=;
 fh=tCVFCArEQY+ULpo1bdWjFt17xT8MUe2kwfezlF0tHNc=;
 b=ihMhyQdbgucWNlveXgbJOfwE5pCg840v7WRZc4a3A8wQYPGIANz+Ofr1ZyU+7R4d6f
 gOaR1FzYCzbQubDGV8RjCH/RbZR+DzooB7e+1b5UCnwjE2jkIJ6ivGizE3d6aV5L1/gn
 mHJN81Fupv+523EOGPvKHVzI22xeI/DGacD+9ZEzBpogbCrwDdM6YVb9obqTNnrzimG4
 xt53NZsxRRnc2ZVSLtupn7NrhcQgpHWbJ6CeV/Pg0Y6/UTodm6jvKG0ccIMe+DPDqjta
 D9bOjZyrpPOGW2Gxnm99BbOIFWvCNaeP6ka+hKKzMSTNtiIdtDe3ySLx8eTX8ju6jJe1
 0otw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1792922189; x=1793526989; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=h0l+ojj5sB1J/f1DDKsR0fDF26ZMQzeqNQMEOYiQMT8=;
 b=RYLw719DpzL+9Hu9NFU5LY1neySe2fPd9nYnuolM6v8ZY9Jm1MQCidRnvAtqtmLDRx
 3/pctZrLlQHOMd1mXJj0M9+tlbobnahsd2qTVEIgUMz9YCnN0AuSaqS2ylRRaMhxYulU
 VZPGY3ehXbACTEdiYaqmEryCEJKzhx8wQBLtYjveez+bhEGlETSA+kDnU8MOth6sDrql
 Qhaa9UjgrTrEaoIUCHLXonHUT8nIaiR+eCmyTBskFNp+oWUyLgq8ZUTOE3Yz+7R2jfnZ
 Bsh56qGFbopP315ryNW8JM5cpN98dm9yxz1s5IIOCL8IjOWeUzj5z75riZlJGqs+LOg8
 c2wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792922189; x=1793526989;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=h0l+ojj5sB1J/f1DDKsR0fDF26ZMQzeqNQMEOYiQMT8=;
 b=gpBuT2cWdF3sazf/BzDj1TLYL5sJOJKhUm/k5fB++PXmrbwjRvT7ulhMHZO7UdhweG
 v2mS5Yw8UbyTagzH99Jjo+RQNxeRf1JzmlzgbvLb5vcNs1k4d1P6zEHUJPNPnYOOzMny
 9mt+EL6sAfAF9kGWF5QsJkF8Bn6+hYmUouAaQWgud+oNYbTQYhMiTSpICzXQSlP7+XEL
 oWPGWJgqM6VVKpo+Wy9zXKaCxKERSGT9uqaAQncvvedrwlmp4gIToSRCLkAEUTzl9aSC
 JRpgb4AKjKLWnt8SgEyyONqvQBwvdScfCd857IosT7Tctun6fj79LwOFRiO/VlQZdTjV
 a8FA==
X-Forwarded-Encrypted: i=1;
 AKwUvBwQlYjlWZa47vowrj9ipWFTnjv5cquQa+CNCD6wTEYi+3Lj3hYh7bM9w4q5n9G5VQOHf/+S4NfHpA==@nongnu.org
X-Gm-Message-State: AFq9FYILONgOVdwd+9m/zxMd2murcTnfarGGgF2HQW2CQIn8hwAam/JV
 wUwQl/881cq2Ul/0i80ATa9GUndHnbRgUnYolJjrMy+hlpJtuSGag1cy1n8Y60h7tzCjoS6KlFk
 UEBjFHrgNrmZgK4Jk5ujrIQW52+5SYs3VOUN/D+nSXg==
X-Gm-Gg: AYBFou19L+co3l0TxI9ejUZ8nqyV73qtgsqX/X0tAO+mAb7gOmHFhsHbbyZZ7i8rexl
 X0adzLgtTWIjLrGRx6apuf+OSTdXi8nNwVCVLlBzAWMj28LBI+3rWSGIoUIwFUOJ9WqAE1/RcRc
 N5UhFlWyJm/05sspD6r//JG22dPDDwyhhOFFn0LnuP3gXipZ3lmR2tSvoE1AazuYABgvnRjhDj4
 gqN8LuooZYgWdU6CWX46xKBRxSyN9jvw6E+8NBo0FuSIY2Jmzpytim115Uj3twbpKuXuq/0dK0M
 u9nohuGIhu5hMXURQKVqTWF++jiATGySbneCb3KGF9MkK/X9M3jklEpDvsQJxK2JRsv5BcIZAvB
 eiSS4zlzZQpgjyRRXtMTewezPYETjseqpu5kKSFS3AzBusaPtJ3F+6WDXtdyydVUUNKJEs4LE0q
 Q+HBGHbTEYP0xV6zXamPAT
X-Received: by 2002:a05:690c:28b:b0:8b0:d206:16c1 with SMTP id
 00721157ae682-8b1672b8498mr30220497b3.24.1792922189011; Sun, 25 Oct 2026
 02:56:29 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <DB8PR04MB7177C8ED1A20409414A573EF87622@DB8PR04MB7177.eurprd04.prod.outlook.com>
In-Reply-To: <DB8PR04MB7177C8ED1A20409414A573EF87622@DB8PR04MB7177.eurprd04.prod.outlook.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 25 Oct 2026 09:56:16 +0000
X-Gm-Features: AclHuK-ObOQZb4FNm3SbmMLELXO4FWJlsv3oNzCJC-28TZNxR6bY0K-dU6hWuPM
Message-ID: <CAFEAcA-dpfXTLk9KNJ0OsOEaCYppcZLLgcnOCqhUXmOVE2jfaw@mail.gmail.com>
Subject: Re: [RFC] target/arm: Correct MPIDR.MT handling for i.MX95 Cortex-A55
 Aff1 topology
To: Gaurav Sharma <gaurav.sharma_7@nxp.com>
Cc: QEMU <qemu-devel@nongnu.org>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1131;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1131.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, 25 Oct 2026 at 07:14, Gaurav Sharma <gaurav.sharma_7@nxp.com> wrote:
> I am looking for guidance on the appropriate scope for correcting Cortex-A55 MPIDR topology in QEMU.
> I have enabled and tested i.MX95 machine model that boots the complete NXP firmware/software stack from the emulated boot ROM:
>
>   Boot ROM
>     -> System Manager firmware (SCP) running on Cortex-M33
>     -> A55 SPL
>     -> TF-A / BL31
>     -> U-Boot
>     -> Linux
>
> For testing, I am using the Yocto-generated WIC image from NXP's official i.MX95 Yocto BSP as the emulated SD-card image.
> i.MX95 represents its Cortex-A55 CPUs using Aff1 as the core identifier, with Aff0 fixed at zero.
>
> Current QEMU returns these Aff1-based affinity values through MPIDR_EL1 with MT clear. It is not sufficient for the i.MX95
> firmware and Linux secondary-CPU startup path.

This is https://gitlab.com/qemu-project/qemu/-/work_items/1608

but fixing it is complicated, because it runs into complexity
with how it should interact with user-specified CPU topology
command line arguments.

Some of the discussion on this old thread may be relevant:
https://lore.kernel.org/qemu-devel/20240419183135.12276-1-dorjoychy111@gmail.com/

> With MPIDR_EL1.MT clear:
>
>   - The complete ROM-to-Linux boot chain reaches Linux.
>   - Linux begins bringing up its secondary CPUs.
>   - CPU1 reaches Linux secondary initialization.
>   - CPU2 through CPU4 time out and fail to come online.
>
> With MPIDR_EL1.MT set while retaining the same Aff1 affinity values, the same complete boot chain succeeds and all secondary CPUs presented
> to Linux come online.

This seems a bit odd and maybe worth investigation as to why exactly
the secondaries don't boot. What QEMU presents is architecturally
correct even if it doesn't precisely match the real CPU, so
if it causes some bit of software to not work right that software
is perhaps buggy and perhaps being unnecessarily specific to
the exact CPU behaviour. Or is this perhaps a "DTB encodes
affinity values that don't match what QEMU uses" problem?

> I found QEMU issue #1608 and the previous qemu-devel discussion about Cortex-A55 using MT=1 with the core index in Aff1. The discussion suggests
> that this should eventually be a generic CPU-model correction.
>
> If there is already a planned patch for resolving this, I would prefer to align the i.MX95 work with it.

No, there's no planned patch. Somebody needs to think properly
about the intersection with the user topology stuff, which has
just never seemed to me to be worth the time and effort for a
corner-case of "we don't quite do what the real CPU does".
Since you've found some real-world software that does care,
we should probably look again at it.

> Otherwise, would a generic 'mpidr_core_in_aff1' like property, initially used by the i.MX95 machine and later extended to the other affected CPU
> models, be a reasonable direction?

I don't think this should be machine-specific. We know what the CPUs
which should behave like this are, and how they ought to behave.
We probably need a QOM property for backwards compatibility
for versioned machine types, but that can get set by the usual
back-compat machinery.

thanks
-- PMM

