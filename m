Received: by 2002:a17:906:489:b0:a44:3ba0:e9d1 with SMTP id f9csp2582914eja;
        Mon, 4 Mar 2024 05:22:08 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVwmboNnTDlh3j4Y7bQhyALBMntgYQ47flremRjHL+0BKJT2mjepFsg6GkRwWjoy1+zG8PTUk/UvdBUmvbDH96jK6RaDlgl
X-Google-Smtp-Source: AGHT+IFjXPe9xOf5x1r0w/Imkze45fxQWgPRZ/537BynnfMcbBb0d7Jyc/iRptocBrmQbxncKpN7
X-Received: by 2002:ac8:4e47:0:b0:42e:f56b:9298 with SMTP id e7-20020ac84e47000000b0042ef56b9298mr1674014qtw.25.1709558528376;
        Mon, 04 Mar 2024 05:22:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709558528; cv=none;
        d=google.com; s=arc-20160816;
        b=Qwr7XtU2/+e6iQDg8xMZ+CKG8C2Wr5lVOzDgFQAXGrlP4CeEU1M15EAcQE9Radz9D+
         dlC2b4NgBVxV+9PhchURxhILa49pOy7m7x+EdvO/QgkFd2AqcdgKLzGqioyG+zh0u314
         MjMZi0drIWtwijGWt50gi/O9/x+N2he25qi5SDNlZ4B+bYbDsXW0dpBi0TxbHbG6FrHt
         5nxQV74AHT34ctmcHocXgA2XzlgEz1wslGxIgDlMCSIUbylwzFCQRuYo6s+F/qzv6Xpp
         wibY9O5y4S/GAod9pPE3nuThdW19SYHDKCWGI8TcwRVTuhp94y2An3LawdmDgrWCo8Iv
         a9Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=NpXEnaMYtF6jKBwYo4yAsZHIAGy3RRfL09a4at74QvQ=;
        fh=uYDMNQ/tDfFpaMGUdHeeg4NIi3yEkHKQXv0eLhe259U=;
        b=FnB6rD8C+7tZUf2cxETBEbKcNBvyhAQWUOCUYrbqND+xvfILoG7eXRtpqWJoO7Re00
         GbEikQvxLKuJZKcTK1mmkvMzoryZ4Jr9hi3HACnHEsLE4Nm5T6XTMcLNQJvuW5oidymK
         2xmCZJtVRD4TnT87jwPVtjY+DR63DT7NGscRwIP6rIOYpOEHCDbm22PquekQGLKR7l0I
         RTD1i+9QD7cqkJVTXTLdJ9+Wptdldb0ZY3kum6fXDwikty8jYLH8whoeEnl6/90waGQT
         984QiO1om5iC+s5WPflfIAC5o2LsbLmhhf/DBYw11THaO332/vqNejo2IB/DIHCXB24c
         8TSw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="xsr/AdEc";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6-20020ac85906000000b0042ef1ad84e4si2259695qty.652.2024.03.04.05.22.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Mar 2024 05:22:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="xsr/AdEc";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rh8GF-0002xy-Im; Mon, 04 Mar 2024 08:21:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rh8G9-0002wl-Hz
 for qemu-arm@nongnu.org; Mon, 04 Mar 2024 08:21:40 -0500
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rh8G5-0005NH-PE
 for qemu-arm@nongnu.org; Mon, 04 Mar 2024 08:21:37 -0500
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-564647bcdbfso5165815a12.2
 for <qemu-arm@nongnu.org>; Mon, 04 Mar 2024 05:21:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709558490; x=1710163290; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=NpXEnaMYtF6jKBwYo4yAsZHIAGy3RRfL09a4at74QvQ=;
 b=xsr/AdEcYIaGrVD60p+dG/2kMu9OObAiIhW1s9bCr4QND5m8igubvfZSW6yiM03mt7
 Y40Y2BO+vzVRYmGYTa30sttbHnmOjF46zjrMeB7GWbd3OXPtQfQIDhOeOxRBb45zJd66
 2gIKT2C++W42lnSOcOWgswcEE7taP9Cice61Tq6guou0sx/AZcQmRa+4RzyaiCwGnf2x
 wCeiUp9Ibz2vRCipxV8ZapZN2p0oAUg/TNMRaqdN7HEmK7nyxxul+8hqHbDL9nplqnVN
 2h9VumVGi0ILIgdMsIPqM2Fs2jG1ypNqiC6UQ6KQcG2udN++RgYof/7nCqrGN++xdUjJ
 Wnsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709558490; x=1710163290;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NpXEnaMYtF6jKBwYo4yAsZHIAGy3RRfL09a4at74QvQ=;
 b=Ir24Qy9wpXbvK+iTsn9cXO9MR/TkszcwKawdNJp6XxoK6BwE01xKBCm+Wp1WySF1KV
 oGi7qrcJYl0j7GFl8lFArYe8/8uhnMmZ7DBfSdFhdY2C+mrukgNRXh6IqeCgyecvigCb
 7H2+IWF/scRAyWL1nB7gkE75ShYCjp5624e4r3Ji+Cwgy8I31nS33wLZQuJY558RbsHV
 GGTFI39zwlym1bTxC8IWkqIAinX44k8DoXAzIxIjY7u2Lp39FOXbtMSywWd7idwoo8B7
 t0JySNBg9W5DhNLlyiNvna3nbwpL9J21Q6AJ3db4gFNnvq77i1x5yrwF4Me2iSWemdnJ
 asmw==
X-Gm-Message-State: AOJu0Yz71Ib7ukKGf8qbAR2XMWgevjoFtKVjEis1FejDHsrZj7h6P+GY
 D7Yta+vZlLUOl02/6ArJ9dq6IQJGWJxZ91T91s/kEBdtPfBOoae1O0WNEb0Ok+8d/MM+m3Dshqj
 UGOApz4gGU9XpZIlAQw0W2CSYyOlpomUjFvXSHQ==
X-Received: by 2002:a05:6402:5d85:b0:566:b3f3:d987 with SMTP id
 if5-20020a0564025d8500b00566b3f3d987mr5111075edb.42.1709558490123; Mon, 04
 Mar 2024 05:21:30 -0800 (PST)
MIME-Version: 1.0
References: <20240301183219.2424889-1-peter.maydell@linaro.org>
 <20240301183219.2424889-4-peter.maydell@linaro.org>
 <f0dd2308-6a94-46b5-821f-12ab907d29ea@linaro.org>
In-Reply-To: <f0dd2308-6a94-46b5-821f-12ab907d29ea@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Mar 2024 13:21:18 +0000
Message-ID: <CAFEAcA_JFq9hFoCJDD9BNx-SOumZBtLs64B=yj-jWRrg_WMzfA@mail.gmail.com>
Subject: Re: [PATCH 3/8] target/arm: use FIELD macro for CNTHCTL bit
 definitions
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Jean-Philippe Brucker <jean-philippe@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 2eCVyx3wZ2rS

On Fri, 1 Mar 2024 at 21:19, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 3/1/24 08:32, Peter Maydell wrote:
> > We prefer the FIELD macro over ad-hoc #defines for register bits;
> > switch CNTHCTL to that style before we add any more bits.
> >
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> >   target/arm/internals.h | 19 +++++++++++++++++--
> >   target/arm/helper.c    |  9 ++++-----
> >   2 files changed, 21 insertions(+), 7 deletions(-)
> >
> > diff --git a/target/arm/internals.h b/target/arm/internals.h
> > index c93acb270cc..6553e414934 100644
> > --- a/target/arm/internals.h
> > +++ b/target/arm/internals.h
> > @@ -224,8 +224,23 @@ FIELD(VTCR, SL2, 33, 1)
> >   #define HSTR_TTEE (1 << 16)
> >   #define HSTR_TJDBX (1 << 17)
> >
> > -#define CNTHCTL_CNTVMASK      (1 << 18)
> > -#define CNTHCTL_CNTPMASK      (1 << 19)
> > +FIELD(CNTHCTL, EL0PCTEN, 0, 1)
> > +FIELD(CNTHCTL, EL0VCTEN, 1, 1)
> > +FIELD(CNTHCTL, EVNTEN, 2, 1)
> > +FIELD(CNTHCTL, EVNTDIR, 3, 1)
> ...
> > +FIELD(CNTHCTL, EL0VTEN, 8, 1)
> > +FIELD(CNTHCTL, EL0PTEN, 9, 1)
> > +FIELD(CNTHCTL, EL1PCTEN, 10, 1)
> > +FIELD(CNTHCTL, EL1PTEN, 11, 1)
>
> These bits change definition based on HCR_E2H, which I remembered when I got to patch 5,
> which adds code nearby the existing tests of these bits.
>
> It might be confusing to only provide the E2H versions, without some extra suffix?

Yeah, bits 8..11 are RES0 if E2H is 0; bits 3 and 2 are the same;
bits 0 and 1 change (to EL1PCTEN and EL1PCEN, so bit 0 when E2H is 0
has the same name as bit 10 when E2H is 1).

I don't see the need to suffix the bits that are only relevant in
one context and RES0 in the other, only the ones where the bit has
the same name but a different location, or where the same bit
number has two names. So:

+/*
+ * Depending on the value of HCR_EL2.E2H, bits 0 and 1
+ * have different bit definitions, and EL1PCTEN might be
+ * bit 0 or bit 10. We use _E2H1 and _E2H0 suffixes to
+ * disambiguate if necessary.
+ */
+FIELD(CNTHCTL, EL0PCTEN_E2H1, 0, 1)
+FIELD(CNTHCTL, EL0VCTEN_E2H1, 1, 1)
+FIELD(CNTHCTL, EL1PCTEN_E2H0, 0, 1)
+FIELD(CNTHCTL, EL1PCEN_E2H0, 1, 1)
+FIELD(CNTHCTL, EVNTEN, 2, 1)
+FIELD(CNTHCTL, EVNTDIR, 3, 1)
+FIELD(CNTHCTL, EVNTI, 4, 4)
+FIELD(CNTHCTL, EL0VTEN, 8, 1)
+FIELD(CNTHCTL, EL0PTEN, 9, 1)
+FIELD(CNTHCTL, EL1PCTEN_E2H1, 10, 1)
+FIELD(CNTHCTL, EL1PTEN, 11, 1)
+FIELD(CNTHCTL, ECV, 12, 1)
+FIELD(CNTHCTL, EL1TVT, 13, 1)
+FIELD(CNTHCTL, EL1TVCT, 14, 1)
+FIELD(CNTHCTL, EL1NVPCT, 15, 1)
+FIELD(CNTHCTL, EL1NVVCT, 16, 1)
+FIELD(CNTHCTL, EVNTIS, 17, 1)
+FIELD(CNTHCTL, CNTVMASK, 18, 1)
+FIELD(CNTHCTL, CNTPMASK, 19, 1)

(and updating the uses in following patches as needed) ?

thanks
-- PMM
