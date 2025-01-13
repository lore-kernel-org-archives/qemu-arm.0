Received: by 2002:a17:504:998a:b0:1be9:327d:8ee3 with SMTP id i10csp1724651njn;
        Mon, 13 Jan 2025 04:34:21 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWwGgvO52IirsHn6GwWc66jKHjPvKDqYAKeLEfMxOGYBwmnPC/6fgznQHEX5Juqv2wG/LtOdFcYswk44Q==@linaro.org
X-Received: by 2002:a05:690c:c1b:b0:6ef:6eba:1d4f with SMTP id 00721157ae682-6f5311e35a5mr155422867b3.1.1736771661512;
        Mon, 13 Jan 2025 04:34:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736771661; cv=none;
        d=google.com; s=arc-20240605;
        b=N7XdwhaL/iUNIGPgX290Sw93xp1K3Q+krtzg5beHb5vd7GPuBZy2GgFQBKrfx87Bv6
         TvCgCtPlVVBdrRGgpFonCjb6raPHDhgQ+JyQRCdmAK9m6sIBlf+NQNdWYs9Yon6NLnvt
         xPneozxV0m6UAieEOuFC8FCmi0uRFbViMhlKy0mgUwJFksRSP5vWW9xHzy24jm8HPcw1
         VyqkxHcqg4S/ZNUq84srpbnvQRqtjBGww/3XnLzZJTw3hG6gdyD7QLH9jrNjbVRq2GAO
         rzeNDEO40pZARbQWNdDC71ipx1ccBa/pb1aqf9/E6/dGtF00p049IOvyBYVBlEOGB3WC
         +27A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=sWygGX54bUS6Xr9BP9hLEUCT7We4y0UtGm5Lh6nvwXA=;
        fh=E+zg/giygY6lH2SWc7PwgtegkpRUum2cvktwAYi5P6U=;
        b=DoWYVGs8C77ucT1Dc28a3JbL55Jv2NqtYKVrAFmSK2GAwGV3605Do5HA9jGaL55nrI
         kNJ/qsrWdRfOuv2rA3+2BLefQ+WIKE9FkQGHrHybifdUb9kIwzhlHqXuQ3NOYMZyORii
         8Wq+qzUFb7551pgUm45xu4VaFEpFbsUpt7Yh349gp5aXzotrSZgKNpkSmOiSJAWJ67EW
         ezsgu0lHJcyExcr/T4DV7mcm/4NIpXKZkqvTcdzwi1mty+7KkMwYyz0ErhzRxa/eU2oD
         d4GuSCA/X6B4zLWc0EqLjOatxQQ/pDVXZWJUzhro0je5wDvMDUcxK5qKtOskb3Pn0Tzy
         Et3w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="e/5Y/5XP";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 00721157ae682-6f546c50df6sor51701247b3.10.2025.01.13.04.34.21
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 13 Jan 2025 04:34:21 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="e/5Y/5XP";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736771661; x=1737376461; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sWygGX54bUS6Xr9BP9hLEUCT7We4y0UtGm5Lh6nvwXA=;
        b=e/5Y/5XPMK/HHBT9oa1TBReIeqWQc1Cw03X7MuqO+EaZdaFJHfdsDhBw/+NYMDb7LX
         o6X5PpUAwf0KAv4g8gTbu3ekNuimLFNq/LQ2G3JyPDS53kPVpZf6U+qBQznP8+DE2hQf
         BhTFBQTCbx9mbK8mco0K3FF+cAr0mE4fL3/aerQlNptTOdz1Ug3CpuoayjDeXD82N9a6
         Lpk2ShHc1irAZWt0ksubZM+njHY+W/oODb9LXeiSahjRL1O/Tz6AtS8a6HWe3FbdCh3D
         +YNKiOX8wrPe8uAG6/joEDwUzp66xgKWI0NwcYnjQtMrEkm6silpATTeyCxhnbUUl+dK
         LiMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736771661; x=1737376461;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sWygGX54bUS6Xr9BP9hLEUCT7We4y0UtGm5Lh6nvwXA=;
        b=tnH5zabD9Fe22TLBVqeYseOsX2nR8vT+XmwbjCKVAEM3gStPozM7RllZdTqg5IqmwF
         F/pbX2h1BQRN1gfzx6r79+C3E9womwO6Q3KPjAeTMlYA59xWmSJIgaA/3YkoJwtcVWB0
         4lor1pBZqaMUUDzh7uIPqvC540yTO03NDRTpgRNtiU3eeMjxm00Cqa8YiFpMlwWPbw0s
         ksLUTnGjuEe50FG2lEY3ZrvjsJpnMdpRRcoQ9csvPlDFdVJv4jTMRihvyB/ZYWz33ATW
         cdTqTMbSkrTB3lHC72WeBE/oJciebvumS3EXiDRGbngybkM/GZ1gEdjDgNOLlYDpT9zC
         jm4Q==
X-Forwarded-Encrypted: i=1; AJvYcCUjXXsaXrBCUt7Bldp4pNkh5TRC2BU057zSU4BAYbdreIkYsRmJwoMRnyVjZpZthfmfX7wXQthkE9CNrA==@linaro.org
X-Gm-Message-State: AOJu0YwaI7e8Ecf8lsT1Lb9pZ342ABNNiC4mbChzDx1pH/24eiThMktK
	4jHA6y6D5gLmR3jMzo4xsFCAcm3kfFRFQBMNWOZrM0JkPgXjSr2tfbgAtrL1Z9UOT6hrS5ZJoPN
	nOQnLsjvVUVVT12GiIaxBnpxaORXifBcpnR9fLR2a
X-Gm-Gg: ASbGncvZjUwfwCAATNeqreV2aElriHbsPWtll2+d/DMPiPb/qPDDNVt+FqLaKe9kUxg
	8k9GyBX9XybT3XfdlMcFAqIKyTEYN1YfAc7fX9W8=
X-Google-Smtp-Source: AGHT+IFrKpYd5kb50Opt5hUL7c74+3nb/MFsBxR0JS61r8IH5jEbPuDeh/NkZ4GebwSaz5zhAQVT+AVBi0SuosgyV6w=
X-Received: by 2002:a05:690c:6b85:b0:6f0:237e:fc4c with SMTP id
 00721157ae682-6f531216d81mr154664387b3.12.1736771661080; Mon, 13 Jan 2025
 04:34:21 -0800 (PST)
MIME-Version: 1.0
References: <20241219183211.3493974-1-pierrick.bouvier@linaro.org> <CAFEAcA_ChARwKyvRXsEk1U3q1T2528753Eu7LgDSsDbF1s5tNQ@mail.gmail.com>
In-Reply-To: <CAFEAcA_ChARwKyvRXsEk1U3q1T2528753Eu7LgDSsDbF1s5tNQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Jan 2025 12:34:09 +0000
X-Gm-Features: AbW1kvagXbO9F7jszKQ8n4Mp2TUE4_UDJZM71lyOoAUghuZkBzmh7LOOclHyXc0
Message-ID: <CAFEAcA_SHz2a0ZU=3e9AmZyJ_qn3e7nNhNm-hR9MdiTRjOyqWg@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] Change default pointer authentication algorithm on
 aarch64 to impdef
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Cc: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>, 
	Fabiano Rosas <farosas@suse.de>, Yanan Wang <wangyanan55@huawei.com>, Zhao Liu <zhao1.liu@intel.com>, 
	qemu-arm@nongnu.org, Laurent Vivier <lvivier@redhat.com>, alex.bennee@linaro.org, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: yGpu0F0sKjFa

On Fri, 10 Jan 2025 at 16:28, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Thu, 19 Dec 2024 at 18:32, Pierrick Bouvier
> <pierrick.bouvier@linaro.org> wrote:
> >
> > qemu-system-aarch64 default pointer authentication (QARMA5) is expensive, we
> > spent up to 50% of the emulation time running it (when using TCG).
> >
> > Switching to pauth-impdef=on is often given as a solution to speed up execution.
> > Thus we talked about making it the new default.
> >
> > The first patch introduce a new property (pauth-qarma5) to allow to select
> > current default algorithm.
> > The second one change the default.
> > The third one updates documentation.
> >
> > v2:
> > - ensure we don't break migration compatibility, by using a specific backward
> >   compatible property.
> > - added some documentation about migration for arm virt machine model.
>
> Other than a minor change to the 3rd docs patch which I'll note there:
> applied to target-arm.next, thanks.

I just noticed that this series breaks 'make check-tcg', because
the pauth-3 test is explicitly checking the output of the
pointer-auth operation. I'm going to add in this patch, which
goes between patches 1 and 2 of this series:

Author: Peter Maydell <peter.maydell@linaro.org>
Date:   Mon Jan 13 11:42:57 2025 +0000

    tests/tcg/aarch64: force qarma5 for pauth-3 test

    The pauth-3 test explicitly tests that a computation of the
    pointer-authentication produces the expected result.  This means that
    it must be run with the QARMA5 algorithm.

    Explicitly set the pauth algorithm when running this test, so that it
    doesn't break when we change the default algorithm the 'max' CPU
    uses.

    Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

diff --git a/tests/tcg/aarch64/Makefile.softmmu-target
b/tests/tcg/aarch64/Makefile.softmmu-target
index d08d9b01ded..9c52475b7ae 100644
--- a/tests/tcg/aarch64/Makefile.softmmu-target
+++ b/tests/tcg/aarch64/Makefile.softmmu-target
@@ -91,6 +91,9 @@ EXTRA_RUNS+=run-memory-replay

 ifneq ($(CROSS_CC_HAS_ARMV8_3),)
 pauth-3: CFLAGS += $(CROSS_CC_HAS_ARMV8_3)
+# This test explicitly checks the output of the pauth operation so we
+# must force the use of the QARMA5 algorithm for it.
+run-pauth-3: QEMU_BASE_MACHINE=-M virt -cpu max,pauth-qarma5=on -display none
 else
 pauth-3:
        $(call skip-test, "BUILD of $@", "missing compiler support")


thanks
-- PMM
