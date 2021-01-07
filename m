Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp498215lfq;
        Thu, 7 Jan 2021 10:03:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxOb/Int7HRHOkCnWxa17tkYRy3wT2A+m9BJld6FZtgqT0UfulvIfFTA8g2tEPnb9z+C30k
X-Received: by 2002:a5b:b0f:: with SMTP id z15mr14849465ybp.296.1610042593629;
        Thu, 07 Jan 2021 10:03:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610042593; cv=none;
        d=google.com; s=arc-20160816;
        b=tYpBAzLI7AQoZUe1JBfPDn2lwqOuUcrUSn85e4uvkr7kj9aO8RjyW+3U6GgrcboIvC
         rckqiWG2KI+HONwfVyF+JbiCWmu2BxlSWIxBRDmqDHO9ki6LVGsjgHNT0ejTQEMfJb2u
         HvyRnaOFHHTJN4NO5ni00iQ5T8/KGUIyXfw++ZotTmM+o97VXZyROi0l4KiXFNGO4wbH
         pXsRlcgHDb5RYSIraayG5GTItE/0kD86wB1SwCKNs9EGueIsYUlfA1yYcV+ERg9+Vqgi
         ffpJI23zRsNF1xh0ttwaDwBVdjNjmvs7m3vFp/w26u0eOKE5wLk6XSXKxQPvZBIHwMJS
         ivdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OCGTGUYTbrpYxpy6N+yk8L7761YrfaK62v2oJ5rkRXc=;
        b=v7luZyxx6NZw/fX/jz5OTKLWUttB+d1OPOiDdjnk6YOHvdgwYbcT04SxTvznL5ui2T
         XurfZGvGpfnO3/FWkZCc1R+n2OnW4/y6dJDywJe9mJkJ7Lu8kwBwG8+GxIWTy8CJx3WI
         kPhxF03JSno4NFdJTsCVo+VLmNZQ/0RQlZpXNAsV0ajn36kDbAaI1ADDtcSrsLaHKtu1
         WF0aligXBlMO0BufkTpyfYfPIWJj2z6d4pLeZ3Q/qHAv+M8huTAq7t4wSOlSPbgzPmRP
         WEuDOyvm6csNe+8A9/zId0hU8NITQUHOq+pW4ccTVE1n11cMohS69RRI3s3UAxPYlDK4
         AQ/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=l0HvHX1m;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b1si7716941ybq.405.2021.01.07.10.03.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Jan 2021 10:03:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=l0HvHX1m;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kxZcv-0007y0-2s
	for alex.bennee@linaro.org; Thu, 07 Jan 2021 13:03:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxZcB-0007es-7Y
 for qemu-arm@nongnu.org; Thu, 07 Jan 2021 13:02:27 -0500
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:39003)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxZc6-0004aK-94
 for qemu-arm@nongnu.org; Thu, 07 Jan 2021 13:02:27 -0500
Received: by mail-ed1-x529.google.com with SMTP id c7so8612402edv.6
 for <qemu-arm@nongnu.org>; Thu, 07 Jan 2021 10:02:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OCGTGUYTbrpYxpy6N+yk8L7761YrfaK62v2oJ5rkRXc=;
 b=l0HvHX1mMxpjonD6nAipyV7YSNvjieW517tkRWgqvSMFToSJ0H2C9aWbLcNtpWa/0e
 ienqfKSU7i1TwpWiPmKzLlRPRGqvq7TW1XHL8RGTznxbLBlwUJl7pWrhV5N71k8/yxBM
 LXRjqS1s3Pq7iNfUx3i9wd/Tw+p0D7ohih8MWx4YR/AcP1P7O/n3kOL09kf4n+1OGoGX
 0hSpBU/Maxmup4aQPqxY+NC6bIY8VaaK/FkoICuihOALssTPisDL+mCr0RuTF0zZ0J7J
 BuJ3b3Q5GN0o7suAia3rf3v1tCV8LJDdUvxHdDJn/C2M5aFW1YKxJVIkMZABQeSHyWsc
 vjvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OCGTGUYTbrpYxpy6N+yk8L7761YrfaK62v2oJ5rkRXc=;
 b=LRkerXXrCbhdjRG/1RDeQU1jUILCAyjd3q1ytV7kzm+lFNSGWOBtNsKVG192r/ClE8
 pg2z89Uhp8KfBaXzAGXFGMU0sytGGwW+QWDyMbK9n4ap83gnZ1JZKZ4AbAdUqVj74oXQ
 RHYgQDA3l8tVHg4PICDLZLLeAQy4KWZx0bbw3yxydnL52FhTXETU3YEp82lIwp+YCAVI
 fPGfuDUaXqdCmCPRVKsECo5speM1TJF008dwFioCSvosCYK6HeC4RzrhDnOAK9p/vvR3
 NJtcSbMxDbqcZyAUKa+bWkUiUV4efbXUuVdebi3z16j0newIvooMs8ItR5WWm/ETrPQg
 11Ow==
X-Gm-Message-State: AOAM533ueddbJzLxV6k7sFwd/bwpWr+goZswzYHUjUDD8Mv/6VfO6CvO
 ce5xDzqnHYWAEAEat211haljSh/VFQeI6N3/rhDasw==
X-Received: by 2002:a50:fd18:: with SMTP id i24mr2600174eds.146.1610042538965; 
 Thu, 07 Jan 2021 10:02:18 -0800 (PST)
MIME-Version: 1.0
References: <20201230172522.33629-1-richard.henderson@linaro.org>
In-Reply-To: <20201230172522.33629-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 7 Jan 2021 18:02:07 +0000
Message-ID: <CAFEAcA_0J5UDcPf29y+9SEzfZdo8mG1toHAfHOMvqM6Kx=uChA@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Fix sve pred_desc decoding
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-stable <qemu-stable@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AFH/zbbu4yrv

On Wed, 30 Dec 2020 at 17:25, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> There was an inconsistency between encoding, which uses
> SIMD_DATA_SHIFT, and decoding which used SIMD_OPRSZ_BITS.
> This happened to be ok, until e2e7168a214, which reduced
> the size of SIMD_OPRSZ_BITS, which lead to truncating all
> predicate vector lengths.
>
> Cc: qemu-stable@nongnu.org
> Buglink: https://bugs.launchpad.net/bugs/1908551
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>
> Ouch.  The patch that exposed this, e2e7168a214, went in near
> the start of the 5.2 devel period, and I never noticed.  I've
> been doing most of my testing vs ArmIE of late, which due to
> lack of a proper sve signal frame restricts RISU to sve128,
> which worked fine with this truncation.  I need to spend some
> time getting FVP working again...
>
>
> r~
>
> ---
>  target/arm/sve_helper.c | 46 ++++++++++++++++++++---------------------
>  1 file changed, 23 insertions(+), 23 deletions(-)
>
> diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
> index 5f037c3a8f..99e4b70d2f 100644
> --- a/target/arm/sve_helper.c
> +++ b/target/arm/sve_helper.c
> @@ -914,7 +914,7 @@ uint32_t HELPER(sve_pfirst)(void *vd, void *vg, uint32_t words)
>
>  uint32_t HELPER(sve_pnext)(void *vd, void *vg, uint32_t pred_desc)
>  {
> -    intptr_t words = extract32(pred_desc, 0, SIMD_OPRSZ_BITS);
> +    intptr_t words = extract32(pred_desc, 0, SIMD_DATA_SHIFT);
>      intptr_t esz = extract32(pred_desc, SIMD_DATA_SHIFT, 2);
>      uint32_t flags = PREDTEST_INIT;
>      uint64_t *d = vd, *g = vg, esz_mask;
> @@ -1867,7 +1867,7 @@ static uint64_t compress_bits(uint64_t x, int n)
>
>  void HELPER(sve_zip_p)(void *vd, void *vn, void *vm, uint32_t pred_desc)
>  {
> -    intptr_t oprsz = extract32(pred_desc, 0, SIMD_OPRSZ_BITS) + 2;
> +    intptr_t oprsz = extract32(pred_desc, 0, SIMD_DATA_SHIFT) + 2;

Why do we not get oprsz by extracting SIMD_OPRSZ_BITS starting at
SIMD_OPRSZ_SHIFT ? (or even by calling simd_oprsz(), which
certainly looks like it ought to be a helper function for
extracting the oprsz...)

If the encoding constants in tcg-gvec-desc.h are right then
"SIMD_DATA_SHIFT bits starting at bit 0" is two fields glued
together (MAXSZ and OPRSZ).

thanks
-- PMM
