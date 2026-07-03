Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6FDCC43458
	for <qemu-arm@archiver.kernel.org>; Fri,  3 Jul 2026 09:31:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wfaEj-0005Wq-2k; Fri, 03 Jul 2026 05:31:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wfaEi-0005WZ-B4
 for qemu-arm@nongnu.org; Fri, 03 Jul 2026 05:31:04 -0400
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wfaEg-0000Lh-Qy
 for qemu-arm@nongnu.org; Fri, 03 Jul 2026 05:31:04 -0400
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-80e4455ba39so2289227b3.1
 for <qemu-arm@nongnu.org>; Fri, 03 Jul 2026 02:31:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783071061; cv=none;
 d=google.com; s=arc-20260327;
 b=EOLj1Z1EZdzCL+2hseCEtwIdKREqZemQqyuN9dnh9s7liK+1uB9R5Xx12JWCPG4lGQ
 apIr1HMjGaWs6m4xrTu7b2bA1xUUeeJxwVkx9GHYLtxr5aYy5OmLMK7aXxReY0rvjK1A
 GbV/123I6TukjC9Ht8OknUXK1A8qdOEwAkUZNmFkeAc81fP7k9DZmwxR5XJ+QJ3elseK
 b+K85v0KxapwWbQycgHcuXXhq9L39o1yFHW+XV2QGWP4zNJmxGZJpZ31BqIKwPNcUbHC
 NnvmHBGMel1PLcgpsv4E+6BmScMeJlXD3zrqoLuoifXUhyXVEG0LBqtGiYdfuUazWjZg
 RIxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=FdWBZixmBsP+1di166ud9LMtZpPssKVltwTPsHp1lng=;
 fh=HHHz/BVXaUzGzW3x64tCvn/MHAjdtnS252Junw1X1o4=;
 b=jvcGevLG6QssSyycA84IiWnNs4Vd/+mTQ2aRfUeQYa8VXiBMw4V18cmg+xxRVgaAR6
 vaVox9O4smacMicqucGzHRCtYIfNuUQZwjLs5M9Di0jan6Kx70djATd3Uc37/WCNYh3n
 gWLsM7iIuJkTR4sosdU8Qzjb+q94w2bJSxudI7eSk4yXCrqgXFCbNomECmzDI2E+CP36
 sfI9UF7IMV7f1Hzc68zegf026jLOEC6azuhrzgzcKL2dL7z3C4l9BzKpicgwv+EBWvfW
 kJN2Ft2K4KSS57TAmRyzBbmYDraNszTKD3g8wPZ7rZI8jKbPCesFw19xSkIOPSe807pF
 z5fA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783071061; x=1783675861; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=FdWBZixmBsP+1di166ud9LMtZpPssKVltwTPsHp1lng=;
 b=PU4f+YZ8/Iyyj9mwrEW94Q00hUsSHZ3PU8Tj/SnfqEUHv2hAD1/a0xxKytXGbhpzIN
 3qSGp1p0J1YUN4Hp47fqSONQjCWScDGimjcrHUroIT1TUEUtm2bcd55TuC497sXajBrT
 Js4svWyRXrUjikWs6ITjsQwgT0mCQ7pvvlH5sQi5BjMdCMhD93sGs589+pseAnUsDazL
 YohNVrblycOKQhhh2Y4Ck0GwQyxoIMSAJ+WP3JLTWm/srW4uP9P5JObKmr+mBShQaEy6
 4KICHIRqLIpCUtkSuUjuWVy35uI7/KgCTLe+I7bLTi+B52rZ6wiGuM8Ea0IwcLFpFniA
 E14A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783071061; x=1783675861;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FdWBZixmBsP+1di166ud9LMtZpPssKVltwTPsHp1lng=;
 b=PRbsIZyZP6VWN9SfVHA9Lt3O5lz5waUUv8K1lHnc47Tb/l31fGjsVAVCEAu8htL5y3
 eQ5Kb3MOQh9/qdkpZYqV6LgVNECjWguRCthRsGNTtmAnuD0r+siO0GN5f8XkUJlEQ0nO
 PGoLXiXjGCFMdk3rE17GuHPTvrD3ohttKvENdDuk4R+XjqyINJd6FXgrectyKfcTrPdf
 hz8DC1EzKBbxOmtpdEsHfWgwzKc5oAA7M6ddrLPP1FMM6WoRr4UiiCtOGHXaEIVvYNPt
 P3DTfPOiMwQzpL9Vg79fTBLYVmo9s2mrvXMW9AmyQa0WFcwO96ycAr6ZyC40khmeg/G5
 MrEg==
X-Forwarded-Encrypted: i=1;
 AHgh+RrqXXbZnl7ZVVb1yow/o8AcaWuvTh201cKqXZ0cdtcpjpsENVLPwwmjpLTK1tWs4jD+xGrnyQTN4g==@nongnu.org
X-Gm-Message-State: AOJu0YwKesl+UqKbF0f+JOzbS3nKHeWUF7luuOJEppjAd1KLIJTBztvA
 ISbva2rXI2BwrZSioISAOz0SAqoLogsj2GQ6X/CHh//lBHSQGrF1lw1Lm9VfNL5ojFQ4iqfwjmO
 DaetjdP6upIqHxnx3++9S6S+OMkp5iX37eANyxduTNA==
X-Gm-Gg: AfdE7cn+HbIog6rfw/gNmMvhbfSIkVqDE39c49+JF1r44XJkKXZGRis9ACfwiKyEM0K
 8CstlsXifSjvUl8HN3uevk19NTVjdxIQ61Qq7GHRlj7JnOm4cZwZiLkrunPqv6gLpw3swpGwTMB
 tsdBKREVt6TGs7Hn2PYNA6//cINYS+rAd2Ag68dY5bIq8if1IX4HDc2gW5OQeeCIT+HFoyDiZFs
 xcirG0N77/M1OwD9K4KFYIterY13lYvWlV7DHo+0OEyoaMg4vmsHNBZgga7e0XrPZJGZsyG7kgj
 FhpKXQmLku9r+Nd8uOaNZp/kDcEn6ISTZaYM9R0LJgVvqhDZYIqGBhFc
X-Received: by 2002:a05:690c:e184:10b0:7bd:9a25:f39f with SMTP id
 00721157ae682-815ba02e8edmr23346737b3.4.1783071061378; Fri, 03 Jul 2026
 02:31:01 -0700 (PDT)
MIME-Version: 1.0
References: <20260630-jmac-fprcvt-v3-0-f4840d5e0a7f@linaro.org>
In-Reply-To: <20260630-jmac-fprcvt-v3-0-f4840d5e0a7f@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Jul 2026 10:30:49 +0100
X-Gm-Features: AVVi8Ccm8X6K1aFq9aJg0bdFYb5jpL4O8FdxN80N3AY33csxKl9lfoI0z3Q95jE
Message-ID: <CAFEAcA86JezGW8ZDD3snWcM=7nRnJPj=vhcBRrxXCa0TRELB8Q@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] Implement FEAT_FPRCVT in cpu_max
To: Jim MacArthur <jim.macarthur@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Richard Henderson <richard.henderson@linaro.org>,
 Alex Bennee <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112e.google.com
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

On Tue, 30 Jun 2026 at 14:17, Jim MacArthur <jim.macarthur@linaro.org> wrote:
>
> This introduces new forms of FCVTXX instructions which convert floating
> point to integer but place the results in SIMD & FP registers, and
> forms of the [SU]CVTF instructions which convert from integer to FP
> with a source in SIMD & FP registers. The logic for conversion and test
> values are otherwise the same as the versions which use general-purpose
> registers.
>
> Signed-off-by: Jim MacArthur <jim.macarthur@linaro.org>



Applied to target-arm.next, thanks.

-- PMM

