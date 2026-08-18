Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7F72C5DF70
	for <qemu-arm@archiver.kernel.org>; Tue, 18 Aug 2026 09:30:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wwG8k-0006pD-M9; Tue, 18 Aug 2026 05:29:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wwG8j-0006oe-Bf
 for qemu-arm@nongnu.org; Tue, 18 Aug 2026 05:29:49 -0400
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wwG8h-0002r8-T3
 for qemu-arm@nongnu.org; Tue, 18 Aug 2026 05:29:49 -0400
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-80bb41f7f3cso37454397b3.2
 for <qemu-arm@nongnu.org>; Tue, 18 Aug 2026 02:29:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787045386; cv=none;
 d=google.com; s=arc-20260327;
 b=nSYNY+eo4fYn2S3St7RCW6bACXiwGRaLj4qT4YstmxfIXap55cAEOoww3Lp6DaXuMx
 Sbsf0EWkILXaMLkCJpxp8eI82U0Odc0ca8VYj4H84po2UECrJU+2Jc6dULy9xdcuiXSl
 dTnHw0R/4xJ2YYkQS4HezuG2mwv6el4wBetF9H6FEaYR4mLaAIghCoNc9691eV7m/U1m
 6Dh+ObqjHeCSZaS14k/AH+6WicUJQJ9RgG5pnmToUZ8zhh16cFa2JLdRQRkxPXtaYJC9
 K2tEPmKkRw1H3z7ojNodRx2lAU/CosswkSVVo7tADYKHKxB364agsVRKPzwc9td3pR3y
 n3Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=acpsmQo5GOEW/WZX3jGf4E13w1binadjxOjYSct83PI=;
 fh=p8JTCVWdL6Vwu7t8qlP6UIDANyaNNbuZDhsSuSTBXgE=;
 b=qv1rzB1z3M/BdNJNfNROwWOXU9EjLcR118ups9JBcU1pJnxM3lbRXjf1YUclWjPOD/
 iv97ZbHCwqUtn/f/lyXwJl5KxJFpMz2+vx6qUlH54pvxp5b41JPMsbZvLO6HR+pQxWS4
 ECJVIW73bYHDKP0wlfNhKH/ryIL/T14RXERNs75NEWoQAYZZMWOB8YNjWXnbSMukq1o6
 HTcLgT//tTs2SgeKh+IoikYtQQ7WfTccBiLccmS9M6AuBCbByRTn/AV05t6SLHAT/WXx
 V7hvEv6uvIz6yEjNev9fguXS+zfOmDwKEOZKI06KAyyhkCXTOwd4b+ZrIibV0UB5Im3n
 NpxA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787045386; x=1787650186; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=acpsmQo5GOEW/WZX3jGf4E13w1binadjxOjYSct83PI=;
 b=qf29ZRLJla3X1674naviNUF4LVoPcOm7THuXjQbgJsVIk3heZO42aCohkrfPPXeu2l
 n1odSLGMx6exniZdoj9nGADEx2ObDJ35gMVlUN+Cxscy5z6IslsAvTa3X55qZn6n/f2O
 za5nBaOuarmzKctdXTLZHjgBtg06P6XW/gasSIVNjohFMnXEFylBi3tMAy4HXkF6wKri
 FOYStrI0f01SNBNLZG19hsd2LCpv+nPpoGBTG0linObQYV9Sv49yvBDUS1tye0Mm8r6E
 Oo+OP/kcA1CjEKYMmIwiWOXt9/QODIQReJY3tpL9++lug6UBUE41ggkI1KES3VJhSZJN
 FusA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787045386; x=1787650186;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=acpsmQo5GOEW/WZX3jGf4E13w1binadjxOjYSct83PI=;
 b=ia+JZTweKtERMmKfW2jwam3CfORhR4o3VkgvAZ8z2I1Aq8TlLO0OKfNLNT4bZ0UdAv
 FOvHVLY0SmXPsNbiXkBrsp5qGG+d4ujWM6YnYo2sWRPyp3TkKBSZqNudKz903MvkPqbt
 NBEg7tbJLX5SWwA8PgDYe4S66i+lLi/D0YSc2gizjT4GyUMXhicfavXdxmmpRhlmMRXM
 zOEnc/AVhIAXFp7rVNTckHWMUo51Ucz2VyGdxNV2dP/TiZCf0CWT7LHrCN2xDcDojKoO
 8095ZLnhcoVcC7AB3kf+KwAfPiIn7X/FA17w+L5A737M+Ff/OMdNg+K4xhOVyKTE4r9N
 0GQA==
X-Forwarded-Encrypted: i=1;
 AHgh+RqLO/5umlLuXCWlc5+TDaQBrnSRe3C5L7RYpwWCX/orUvH7hIA0/NXDSy5GkTCgyw+FZS+UjBrDbw==@nongnu.org
X-Gm-Message-State: AOJu0YzdSle1QE+YHicLOAUtfsPctoM4ZbpmKUunZctmz52doW2Xwo52
 D/EI1fyWnl3GkT8+M1nEuhJiE4wwXL+EATG4jE990Szd/YlAJCWa04dPvxOauX7qrB50m1TX/X8
 hs9t5/pL8URKqoqkWEPp5FjoM9GlMW/rtGHAQ3ea88Q==
X-Gm-Gg: AR+sD12Kepb/uErQV9ZLLj0uZo0WVvgLUIcij9/tzxfGY/1TdihYbA/uwhW91mmuqqE
 S38vtsA2FfH2JOgoFueQ0HlT72TQv8UtMc+HYRfjAnexDy4JixF3/hyQs03+2stcsDnRjBqrYtc
 qOecxVYYQpPSNxiDAxjpzsRwcAFcX+vi0ByeFVo0u7FrOjbJT9TYwtddNh9JcIdZIYW52en1Mm1
 oCAzWflvKdp312CcaxkcSPqEPDyig+CNZFpfhXSKCQPN8g9qonlTd/Gd8ivgyhgoFxKBmDKKpPj
 06fFcMy8R2Bj/cYaeW4ikpHy2aJmToV5NCxQZD2smDlpgn3C/EnaNvKcX59AULxVSj947Yyk0vS
 W/9IWSQXAYxrQcwkytyXwhu4O9o8J9KhRPAqvWzw=
X-Received: by 2002:a05:690c:a647:b0:821:133e:569c with SMTP id
 00721157ae682-8370ee56bc8mr73341087b3.15.1787045386163; Tue, 18 Aug 2026
 02:29:46 -0700 (PDT)
MIME-Version: 1.0
References: <20260811191540.79882-1-richard.henderson@linaro.org>
 <20260811191540.79882-3-richard.henderson@linaro.org>
 <CAFEAcA98oxLs-w1PNuoM9mArit=toTCTucD5xOmN29Rbk6XBTQ@mail.gmail.com>
 <c931ce6c-1146-4bd7-8769-02e98ede0f82@linaro.org>
In-Reply-To: <c931ce6c-1146-4bd7-8769-02e98ede0f82@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 18 Aug 2026 10:29:34 +0100
X-Gm-Features: AcwNN1V8AyuTKCsIhsj_dmipidSbA9EqxoTRAzihnDxe6PsaJbTM0RBWClP7Wmc
Message-ID: <CAFEAcA91Gc7-n2SBvA-+vF2PemB6gqWFKKsoS9EPZ4Ks+N7awg@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] target/arm: Fix SVE2 WHILEWR/WHILERW zero diff
 boundary case
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, yang.yanjun1@sanechips.com.cn, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112e.google.com
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

On Mon, 17 Aug 2026 at 23:34, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 8/17/26 09:37, Peter Maydell wrote:
> >> +    tcg_gen_addi_i64(diff, diff, -1);
> >> +    tcg_gen_umin_i64(diff, diff, tcg_constant_i64((vsz >> a->esz) - 1));
> >> +
> >> +    /*
> >> +     * Since we're bounded, pass as a 32-bit type.
> >> +     * Sink the diff += 1 from above into the 32-bit type.
> >
> > Is it worth doing that? Hosts are all 64-bits now, and surely there's
> > not going to be a perf or codesize difference between "add 1"
> > on a 32-bit type vs a 64-bit type ?
> Technically one byte difference on x86_64.
> But we could drop the whole truncation thing it you like.

I think mostly my feeling was that since the rearrangement of the
umin() expressions above was already quite complicated, moving
the last part of that down into the truncate-to-32-bits was
adding extra complexity on top. Just doing the subtract-one in
64 bits and keeping the truncate would be fine, as then the
two steps aren't interleaved with each other.

-- PMM

