Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B7F5CD4F25
	for <qemu-arm@archiver.kernel.org>; Thu, 14 May 2026 16:28:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wNYvS-00022x-Gu; Thu, 14 May 2026 12:28:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wNYvQ-00022P-Sn
 for qemu-arm@nongnu.org; Thu, 14 May 2026 12:28:40 -0400
Received: from mail-yx1-xb131.google.com ([2607:f8b0:4864:20::b131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wNYvP-0003SH-Ex
 for qemu-arm@nongnu.org; Thu, 14 May 2026 12:28:40 -0400
Received: by mail-yx1-xb131.google.com with SMTP id
 956f58d0204a3-65c477a3278so9618683d50.3
 for <qemu-arm@nongnu.org>; Thu, 14 May 2026 09:28:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778776118; cv=none;
 d=google.com; s=arc-20240605;
 b=JQ/DB37jIXFdhCeZeXVvwNIK/F6RR49wVGi9JpEyT1GhjKL/4V8Gw0YtVIfF1LBQIp
 W4ZOHyd8jMGROO2JsfkpVjWQuc/0t7IAvxl3SBHbXeTsJchsbQA3iZJEOKOVPoLi5h2O
 LCdipFvJp3L2q33CoSJ7aluU9K572/PCn9Xh7hCHBSfNQEJ25yRWWLcOshAuCURKz39j
 hI86N3TCg5O5iZjePhbgfrSHxkdOqGXg+Futogml83c+umgEjp8pSucv4W6xFTm8Mojk
 FXrssSUboU53rAQb06S/YOwmQcizb11MfxqzsyxwlKK5RhnFV10aIcStjP0Z/vbXZNtz
 IOcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=acR8u1v5gCE88y/9RHxz2KwQiTglC7M/T8tiKVbbbiI=;
 fh=99LCLWDtloXxQOCLAHSnipdHXR9yXzK6AEvIMccf1kc=;
 b=Ght3aLhPMB0pJk+fM0nwS1mbJUF3ycWaKYMV1OOjHgER5EmR9Lj1NkniFNlWeDvY8y
 /5Ge0uSvUjgNl36hPjFwsyXNVtWbe/8DaGi7XuYfd8pzwt78jJyfRjU3U/5wEzrzK6QW
 9am8jFWLU2QgP1tO9AJoAXIKEqBTOV9X65NMbfeQOA4i3qQARF3NQ+nz0H4vCarkBGFC
 gnuSB2u4z8olJvV4aqfyqrd8WQLPQuCNPc0gRxlCCv7WEjv7MNv+u3NmhDi3kZWh6gpU
 4pAV1mWcFZM3azbqXLGrQIgRCrC3fjj9ebtTnhSKMa4uxozZjSAGLWKFQpq+ZgnvN7BD
 Xt6g==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778776118; x=1779380918; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=acR8u1v5gCE88y/9RHxz2KwQiTglC7M/T8tiKVbbbiI=;
 b=Fkj9nmtcsRGxB9iK+ktgjDO+vCRj+za4kucjwvdQEv1O/y46mMZZqWktDz4m5eOe0c
 K8d6/jhQbZcB5HqD010+hids98ULf4lSg8vNrqzMwwbIGL2NXT7eida036/CKvApX7X8
 nW8/vJcUPLve6IjietQWVY3Z6n4ZZIbRxd+Lao50C2lnQ0Hx6K1uHmPqOdyRgX1r41r5
 6eG42WllkcAkgfwwI+OtcCE/AFnn6ryGBqUg61/xQfLYX5JuoW3QcfYEhrrNc63nCBSj
 V7zwPjDxS+lQgzSiUzSbi39U74VmRJ9eHLllsBLxtbq9Nkr8TMSSJWYnR5eynIoZl50t
 xflA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778776118; x=1779380918;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=acR8u1v5gCE88y/9RHxz2KwQiTglC7M/T8tiKVbbbiI=;
 b=sHrPjho1VxNI/zVZ78eJI3tqFZoqGn8MXwypwrT1eC6dBNOBykQUd0qnmidCVxwTul
 rW6Ciatpbn0nqFlMz26cuWXQAiJ8pOXY+fjrb2D/EZ3T9PQDRa+QGMGUVIHa+CF7zGrG
 R0s/wwiZ9Vw+02A+kn2mhbGykeaJRYZTLyfzO2Pe2fNK7IiGxW05Qx+g9joRXFFHXmmp
 qWY6yRb5sN8wE+WwFtoDu5V/E8Janfi6NzI+aprAn1/bC4B0zKNO5vNYGXkeGXZHSGg2
 h6tajbIfcoigQsWn9H+mS6p0HNYbXjXsRBv8nAH2gDOD6GgcT9UVLwdu7LfQKYmei/ON
 uIuw==
X-Forwarded-Encrypted: i=1;
 AFNElJ/A0rYWoyteAYLywEa94X/+2SWNS6OGBmIdLH8pLCUxjJRVP3eTdSbeCzJNETYVqzCM4l2LS6RP9w==@nongnu.org
X-Gm-Message-State: AOJu0YzNJrIvLqV5aIWaHBnTbABxlVBCtz83Pck4GrPOErIlTC2xP63D
 lAjG1Rr+Ug7BweWFGgq8lg/gwjtZa97P4Z1ZwM7IRLAsOKZg/XDSJXlf1QJrIHMICQKSCwUHXNN
 PAhThG1d2AnoyrV7vdBlF6CXLzrm3hZqBnN6+wuMisQ==
X-Gm-Gg: Acq92OHi89JsZ9wplemSIK5cL4BNIpl9WF/nxW++umuUQMf7aXTa9D31Gb3KqEkJWow
 OwGwhviXcDJq7SfJKcT9tkMlQCn2jbMYh8dMvQHbOD2rdofarvqE6EjAe9dmh2Z+o1SNjxYfATD
 DiiaEwZxhFwZgNrU3R8IvvTSV5gR7B3Dox058LbHEEYrcpyvGr/ERoIhogSQQHiIKf9zWJonmTm
 Ni265xNBPR3QeAD52vExKM9Rt3ZkZghAfz+KsELp73jn1gbxqBkF8gJyctXZTQiiq2pQ2icQam1
 ityLnbUBA7J428qXfK3Yag+iL1UGsxr261spCDQaEiU+gNlzktK7pA6eg7U1GOIJVcM=
X-Received: by 2002:a05:690e:13ca:b0:65c:1a0f:d8bf with SMTP id
 956f58d0204a3-65df82bfceemr6895129d50.50.1778776117940; Thu, 14 May 2026
 09:28:37 -0700 (PDT)
MIME-Version: 1.0
References: <20260507234413.643512-1-richard.henderson@linaro.org>
 <20260507234413.643512-37-richard.henderson@linaro.org>
 <CAFEAcA8UpR-Q9oypm8v3CgwDK80+kXFcMkH9JCmUdc4=14HPCA@mail.gmail.com>
In-Reply-To: <CAFEAcA8UpR-Q9oypm8v3CgwDK80+kXFcMkH9JCmUdc4=14HPCA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 14 May 2026 17:28:26 +0100
X-Gm-Features: AVHnY4LLryXnwwrbc57DUWPcoIVxvBIJbLWtM64CXKT4Hl0Ijs6p_Xomovs21Vs
Message-ID: <CAFEAcA-N5e6CAgtCz6qBvLinjWT0sgDKR1bYUFv5SKo-iez38g@mail.gmail.com>
Subject: Re: [PATCH v4 36/60] target/arm: Implement LUTI2, LUTI4 for AdvSIMD
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b131;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb131.google.com
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Thu, 14 May 2026 at 13:03, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Fri, 8 May 2026 at 00:49, Richard Henderson
> <richard.henderson@linaro.org> wrote:
> >
> > Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> > ---
> >  target/arm/tcg/helper-defs.h   |  5 ++++
> >  target/arm/tcg/translate-a64.c | 38 +++++++++++++++++++++++++
> >  target/arm/tcg/vec_helper.c    | 52 ++++++++++++++++++++++++++++++++++
> >  target/arm/tcg/a64.decode      |  6 ++++
> >  4 files changed, 101 insertions(+)
>
> > diff --git a/target/arm/tcg/vec_helper.c b/target/arm/tcg/vec_helper.c
> > index 3231bb2100..f0dc11bc8a 100644
> > --- a/target/arm/tcg/vec_helper.c
> > +++ b/target/arm/tcg/vec_helper.c
> > @@ -3345,3 +3345,55 @@ DO_SME2_LUT(4,4,h, 2)
> >  DO_SME2_LUT(4,4,s, 4)
> >
> >  #undef DO_SME2_LUT
> > +
> > +void HELPER(gvec_luti2_b)(void *vd, void *vn, void *vm, uint32_t desc)
> > +{
> > +    unsigned part = simd_data(desc);
> > +    unsigned vl = simd_oprsz(desc);
> > +    unsigned elements = vl / 8;
>
> Isn't simd_oprsz() the size in bytes? The pseudocode for
> these ASIMD insns calculates the element count using sizes
> in bytes, with "elements = 128 / esize" (esize being 8 or 16),

I meant "in bits" here, of course.

-- PMM

