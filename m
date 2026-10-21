Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD441606A319
	for <qemu-arm@archiver.kernel.org>; Wed, 21 Oct 2026 14:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=IRumJaxs
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xJXaX-00046N-0r; Wed, 21 Oct 2026 10:46:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xJXaA-0003wg-AK
 for qemu-arm@nongnu.org; Wed, 21 Oct 2026 10:46:28 -0400
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xJXa8-0004Qd-4k
 for qemu-arm@nongnu.org; Wed, 21 Oct 2026 10:46:21 -0400
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-8b0db268bd8so5160257b3.1
 for <qemu-arm@nongnu.org>; Wed, 21 Oct 2026 07:46:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792593977; cv=none;
 d=google.com; s=arc-20260327;
 b=oqrAoq/2zx4Y50YxcriWq2dyFT1m5VrwJiYz1J0Z7oq00bg+6lJL0oTz9LcOXxvlwg
 g9bcdTKLz2xac0vKjca2MBxTqiVeLIa0y2whPXp2Bx+cAzfYEF+SrYVOtfza2RZvbGG8
 5274dlqtbFmlEiPA9SuTG76mpe5Go/xnEgJXmQlZBxDoY86/GiXI1ZRvA5oLc2KW7J5l
 w6O+2EcOHMv5xLuxT6gQxApS+GVrfouDvIz5VWiG6SguplH5rMJtV1pxo2GOIdSkgxBj
 AELtekOLozzSc9b6oK/SaW6DdgH4d9YO/aySZv2Peu+Ps5p8PdXR8/Vb0Ye6rZIH3z/l
 Ftew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=sSLtenY6QRNVBOJIpklEsN2/mmmmH+YqHZH3OdYMJCI=;
 fh=PKodlsZ4sLOulf3vcyB9a9UvxkkwctzJ7UL5PZ8dNXQ=;
 b=mAUmouL1WanRi0tXQWNTY7YDhOEBFf/BL3QtIhufRS8OoNWcsEWm5CwauNpuE1YR0/
 Gk/8f4xEKwo4ATHxSCFUMZHnnys6XMSFDqkp18tojV64ZKi2RwNM883eQOXputh2gG0e
 7gICSezuwlnBMqdwQ9wYKsDC67xLWeWgrqBZx3wCMl0DQmVvNnlAiy3r3Fk6i3tEJNkh
 43lxDC9Aonz3+US8I8Qd+WnvSjPWpWc0bD8k6JX2PykVM9b0CS2KI3fbbKQbXNHwKZc1
 /ebvsV0QivXGJMsR7gU1ffh1gBAeQCBH2Q8Zag21EGBtO8duuULXSEhHQ1LS6mPJ43pv
 VHkQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1792593977; x=1793198777; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=sSLtenY6QRNVBOJIpklEsN2/mmmmH+YqHZH3OdYMJCI=;
 b=IRumJaxs9FEHXZQezPHSZdhKRHhZnpXs8EVgrUz3U13mE6ntl5Hp7uudLkb2VNHrrt
 RF5aJUwIiHRDxrHAEgtcSz84Aypr92I8zWSZRJ+qZVGr4UUXHZT+cF9nVEhfIB/Iz7+c
 sRM8nuz2Ns4AJypmqU7wCeKHwZHE/b2vu5r2r/iABJ2U3eZ8BDiMIulHYsMkSXfO10T4
 OrKtUdbc/xwvlqcC8AAnZE03pYqq4Zxvfk82KX4EnEzB/qj/D/VIRG96sTBIxp0aUti/
 sq7GHfc5iVfSrDgrl2G8jFGTlmI/o9cAK2NAop+KBFpB3foN2zT/anHpR0NPdOsucoyr
 g0bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792593977; x=1793198777;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=sSLtenY6QRNVBOJIpklEsN2/mmmmH+YqHZH3OdYMJCI=;
 b=cVe95OlKGFFWQq1mXCFjIYRHD6xWapTW1uEDLKH+jxhSMvU00QqUjZvl8dMTtUMNcq
 BvLttVToiRG5SGyDKM6OhVapvDMfKwBcZSFYseq8Z4uQJOJKe4onenl8UdyujqSVVHDp
 OMyy/EInhNgck+RQctpWDeclE5w+nV7MXsqDS3Y9k9VqU+rV7KxP4E3DYN8fnU+HW4KQ
 r10aanA/pxo9vWososZKp71DVjKHhE50p4iBcwnH0uCbdaSg6gx6SJWbTmOI9ZdLRh1b
 2zD0UHEpwKcgG227MRko3jNe0oPLFe7uQiIXF+ZJWaStv4lhoEFfOBlk367H6bOBpmle
 o4YQ==
X-Gm-Message-State: AFq9FYJbc2bASo4jdh8TP/BwCsw464WYWejY6Jhledg10toJx8j4TO4d
 TpM55c9/XJ1HcfKzMfJfpE8T7wTG3VVNC3PjCsLdYSw52g4VgU9WYiBY17+A6GIJYg/62SGCW+s
 372BOJdYHaOBwl/WJN0tHfjub07toplyLrDCWGVLVyw==
X-Gm-Gg: AYBFou1z1Ap/0R6DrRrtlUE0K7fyan8Nb/zSqczbyQa3nDCU1IzD8zt7Smtp16hKVmp
 Md4pPI5a7YKWM4SqHYhQzpfDyhuMmCepqCZfoSExuvo8Zb8FcsERv43XKEINml05qTW7o7LfNFt
 hdlB6rSOEhXTytTex2jGQUiusYGKw0Z+ysNE2YdQeM9mjcDCL9FPsDoLAOcLgF69FS/okWAFll8
 48rH8ly9NQs/MkdfSPbsaUuTPZMUm6GD7FVQxC5VIvm5Uh56Hi2rxUtDlTaHBBxyB/iBU/+q8c/
 jZLOELO7Wclcys5OAOjEsMdJ1gBlKDfYxfjRlP2H+XNV/SKxkxHV8kAEixbgGCCAerES5cE45vI
 V8QJWIaek50LCVL3e83/zWpIJYFKd/eYtJLGY17c1YJjv/MJSozkeVGZ8xagyqE00coDuUXMYuK
 eX1VSbWPSihgJDzwEYF+EAq9x83R3Whhyqm6kSu2BuyQ==
X-Received: by 2002:a05:690c:397:b0:8b1:42a1:ad0e with SMTP id
 00721157ae682-8b142a1b144mr1587767b3.50.1792593976471; Wed, 21 Oct 2026
 07:46:16 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261019162217.3272337-1-peter.maydell@linaro.org>
 <20261019162217.3272337-5-peter.maydell@linaro.org>
 <aa95e88d-10f1-4882-a705-b75bbfd9ae8a@linaro.org>
In-Reply-To: <aa95e88d-10f1-4882-a705-b75bbfd9ae8a@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 21 Oct 2026 15:46:04 +0100
X-Gm-Features: AclHuK8E5plf-W5FGuN-LzyFUkYL_WvgIxHp6YZWzAk40r0qgSVhA8PIbxH9zIk
Message-ID: <CAFEAcA9R2M=4GjduBxNDsfncLjLCchLneO=EfCoB1iqDjYnV+w@mail.gmail.com>
Subject: Re: [PATCH 4/4] hw/intc/exynos4210_combiner: write default case is
 unreachable, not guest error
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112f.google.com
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, 21 Oct 2026 at 15:45, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 10/19/26 18:22, Peter Maydell wrote:
> > In exynos4210_combiner_write(), we rule out "reg_n > 1" before we
> > start doing anything as being an invalid guest access.  The default
> > case in the later "switch (reg_n)" is therefore unreachable, because
> > it has explicit cases for 0 and 1.  Use g_assert_not_reached()
> > instead of a LOG_GUEST_ERROR.
> >
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> >   hw/intc/exynos4210_combiner.c | 4 +---
> >   1 file changed, 1 insertion(+), 3 deletions(-)
> >
> > diff --git a/hw/intc/exynos4210_combiner.c b/hw/intc/exynos4210_combiner.c
> > index 2bdb9a0152c..80295ae6402 100644
> > --- a/hw/intc/exynos4210_combiner.c
> > +++ b/hw/intc/exynos4210_combiner.c
> > @@ -242,9 +242,7 @@ static void exynos4210_combiner_write(void *opaque, hwaddr offset,
> >           exynos4210_combiner_update(s, grp_quad_base_n + 3);
> >           break;
> >       default:
> > -        qemu_log_mask(LOG_GUEST_ERROR,
> > -                      "exynos4210.combiner: unallowed write access at offset 0x"
> > -                      HWADDR_FMT_plx "\n", offset);
> > +        g_assert_not_reached();
> >           break;
> >       }
> >   }
>
> You could remove the break as well as unreachable.

Yes, good idea.

-- PMM

