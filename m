Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DF62606A31A
	for <qemu-arm@archiver.kernel.org>; Mon, 23 Nov 2026 12:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=KIfMsJNp
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xVT3S-0005fv-3K; Mon, 23 Nov 2026 07:21:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xVT3Q-0005dC-Dp
 for qemu-arm@nongnu.org; Mon, 23 Nov 2026 07:21:52 -0500
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xVT3O-0002vw-TR
 for qemu-arm@nongnu.org; Mon, 23 Nov 2026 07:21:52 -0500
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-8b360828905so26682757b3.2
 for <qemu-arm@nongnu.org>; Mon, 23 Nov 2026 04:21:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795436509; cv=none;
 d=google.com; s=arc-20260327;
 b=lkqNLA+DXfzHEEBedYJbLZNNHfQe0586RJd9a23/x9J9+iJDjf7c6hYb8z7hAqHx0B
 gYe1XV9oxqnjlrvNFrO5BKSCjviyPvlDMl9tyKGU4tScKskRtz2WS8wbkNJuhnjRAzZs
 B/rYjui44Th+64E3PDVGzhmjmqWkKt9rUOjxXtyeHFltjaq1m6IwjhmsvDCwRZn1ezOS
 Lac6jDRU43O4W3Mu0owh6qTZROXtEHPVYvb6QLAeVei9t6I9h+OGNuZU2SPi7+lJmBJ0
 39izOQtrBizhbNveM2PJnULlidZKlAvARPzXm6bN98w+nbFkYUMrp6DCSkBjvOtiqFR0
 g2RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=b0DtdAGH9rbHxFLixlQfAqIFfg9ZWvxzVJYbFSuaic4=;
 fh=LbhAc9rXJwE0Zkuv/9MDTjcdzh+eODhEHhPyeqdAaR4=;
 b=cumCvir0nyABXWtSNoz9WMyQYWO/MgU4xjUNTFsPCUF4HS1rzam3A9OF8Pm6bPwA6h
 3PVa5GY2krW96y+NO9ccY6Y57kkkED2BEFbpXp9hH9b9vguXthLXHIj/hlGeOM2q+YbF
 /KhePTv7XZBhSuLDVWvtAuNQSqGKCKohykTqGyMORJvx9qHm7osa2X7Zi0Ktp8MRtS6X
 XiPpJUo/4kSM9Ty01bfYMPasXRbG+5mP3JSyP20wR64Z0UOA+uzE++a7dEVPojLYmqyu
 lvC8hbMFMBB1TfdMCM1n5DYCaWFkeS4jIBkYFprZTTygnslEWxFM8fS6MZXDi0wS3r7h
 I8tw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1795436509; x=1796041309; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=b0DtdAGH9rbHxFLixlQfAqIFfg9ZWvxzVJYbFSuaic4=;
 b=KIfMsJNpsOoj/fVNN96UyJ8Gyi0XUrM/gIQAsP+Om1/0vuQ18eol539JRpshNLjHgT
 eFwhmeQtjqEDj65aKvXX6yOUhyrTvEYj9A/IRoWjBxORGNLBWZwMnDYQdhA06xMa4QyI
 5gawj6b3tdOwSmAhhyGGF9pJOdJdQK6WRDQCf01lxCV3WLgt9O1D8nRN9/9N6S0HK/kG
 wiERMLU09IY7FHexkzSr1DPeHo87LwjkzvalINlNuHFvlhx4qFRR0M6hlNyn3knmjEVV
 55uVr9fl8tN9YfkE8OmFL/dXXZkKpQN2hae9c4WwPxkd6OToEqRBRgkwCMlMOyekRuYH
 jhuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795436509; x=1796041309;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=b0DtdAGH9rbHxFLixlQfAqIFfg9ZWvxzVJYbFSuaic4=;
 b=ky29Pq+cQ2vvmxoh7ZyQzXwCv7dpDe5CGQh8THqZrFKlyhQZvAA+QXmL+A747pUr2i
 JW5/6Vq4hEpWIJoZRIPAr+16u8/fnD2chnv7VTwrD558VKkjE3+8nGSFG8Bse6Kzf4/o
 rbRcAxTWXNBhcrNdDWd9Kr/mdFt6ETEAuXjCHWwHYmYrcxU4Guv0zg9oo20zR8YA1EjE
 j8hjnCJfaecXLUvbdVTNvgWababaqE16hbyx48JOLQfKrRT9wG1Th3D6BbtQyGXyZ3Ft
 9BxPwPMPsOttyurSfsbjvKiKYX2l90svbDQRXlf1Inb9YCBNkr9D1P+8uOpVBMR3Waj3
 GZHA==
X-Forwarded-Encrypted: i=1;
 AL+hErF7/mX13OzVLt84zQmfaDtcDYntu6GPapmmewCcVBE8DxcwIkXaCB5yi2fb7I3KqpLQ1tbwUNlqFQ==@nongnu.org
X-Gm-Message-State: APuU4Z9k5HwcAiS83SpckWk8KmtQm+GsmNMb8kiJVGaRsfZK3qGvGJFw
 12/JQ6OuPVXS4kvUct88G7dh7GCItt0tVm1pWlGs67MENkAV5zeUd971PLLHMgOYS4THW6NVHsg
 QJlK42QVBqeACCpoeHfCc61r47i7mACyaW1JF+mIDeL3o1z5AFHmE
X-Gm-Gg: AZFdTZfgDvsCCxUuZHe1ZdNvAvVbfLgaP54iEn8I5rxzQ3kSnIEnxu6H0pWeyT1H+Y+
 FuOaNr23pCQc6Dwx8j8q6KwQrZWT8Xw2KsC1vuIgD1ZHa4p4jrVkuAwXZu5+5HlzwPnwdbJ1VIU
 vAT5zUJw/R0nP5d/7T7thD3PkzSQULrLKyItwN8na5k1HlIrZZ9nxq8aHnUa/6xrUg/vTlOsLz4
 2UWRcb0DxJZ1UU7z4j5DADnp+9ySr1idDW23risNVRPt72tbyZ232xngvTTPkADGzAZuk1jyOWT
 T8tUdIwBHXb/Bqa95bVguUkjmAR9LGmzsZL0E/eA0rLyQtCa8iGj7LKuYJEyXYOKe1F38Ihk8+v
 QX6lherkKjMiOb63oiZ9a+ZNBXoeZP/jwtDMA+WkrbenPD9Ze4Q1rmV4E+k8Mv0daJi/xNAAmRl
 Gxiu7nCtYDeBj1aNQJI29S
X-Received: by 2002:a05:690c:3693:b0:8b3:1324:a74c with SMTP id
 00721157ae682-8b52047d8dcmr34345417b3.53.1795436509404; Mon, 23 Nov 2026
 04:21:49 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261120124923.1656220-1-peterx@redhat.com>
 <20261120124923.1656220-3-peterx@redhat.com>
In-Reply-To: <20261120124923.1656220-3-peterx@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 23 Nov 2026 12:21:37 +0000
X-Gm-Features: Aa3M54o932K2Sox5umNtdFXVNO4i61_ZHXNcpUkAsiHwolUe1oqINX-HGwqwFXU
Message-ID: <CAFEAcA8i1-QX-x+fvcfEMknia1owTAukRxNQ1Rb0H6KnwCKt2w@mail.gmail.com>
Subject: Re: [PATCH for-12.0 2/6] hw/gpio/zaurus: Move VMSTATE_VALIDATE()
 check into post_load_errp()
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, Fabiano Rosas <farosas@suse.de>, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112c.google.com
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
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, 20 Nov 2026 at 12:49, Peter Xu <peterx@redhat.com> wrote:
>
> To pave way for removing VMSTATE_VALIDATE(), remove the use in this file by
> moving it into the post_load_errp().
>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: qemu-arm@nongnu.org
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  hw/gpio/zaurus.c | 29 ++++++++++++++++-------------
>  1 file changed, 16 insertions(+), 13 deletions(-)
>
> diff --git a/hw/gpio/zaurus.c b/hw/gpio/zaurus.c
> index 3cf626a550..a60f4d4393 100644
> --- a/hw/gpio/zaurus.c
> +++ b/hw/gpio/zaurus.c
> @@ -23,6 +23,7 @@
>  #include "qemu/module.h"
>  #include "qemu/log.h"
>  #include "qom/object.h"
> +#include "qapi/error.h"
>
>  /* SCOOP devices */
>
> @@ -188,12 +189,24 @@ static void scoop_init(Object *obj)
>      sysbus_init_mmio(sbd, &s->iomem);
>  }
>
> -static int scoop_post_load(void *opaque, int version_id)
> +static bool vmstate_scoop_validate(ScoopInfo *s)
> +{
> +    return !(s->prev_level & 0xffff0000) &&
> +        !(s->gpio_level & 0xffff0000) &&
> +        !(s->gpio_dir & 0xffff0000);
> +}
> +
> +static bool scoop_post_load(void *opaque, int version_id, Error **errp)
>  {
>      ScoopInfo *s = (ScoopInfo *) opaque;
>      int i;
>      uint32_t level;
>
> +    if (!vmstate_scoop_validate(s)) {
> +        error_setg(errp, "irq levels are not 16-bits");
> +        return false;
> +    }

I would put the condition inline rather than into a function
(especially since the function name is not very informative).
Otherwise this looks good to me.

thanks
-- PMM

