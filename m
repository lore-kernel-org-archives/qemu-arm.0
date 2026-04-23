Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E509FDEE45
	for <qemu-arm@archiver.kernel.org>; Thu, 23 Apr 2026 19:03:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wFzKg-0005c9-OC; Thu, 23 Apr 2026 15:03:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wFzKA-0005T0-91
 for qemu-arm@nongnu.org; Thu, 23 Apr 2026 15:02:55 -0400
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wFzK8-0003Xl-Iu
 for qemu-arm@nongnu.org; Thu, 23 Apr 2026 15:02:53 -0400
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-79827d28fc4so71504497b3.1
 for <qemu-arm@nongnu.org>; Thu, 23 Apr 2026 12:02:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776970971; cv=none;
 d=google.com; s=arc-20240605;
 b=FGpeUwVvd6OjczhBLUn7oV0XHtHU1orTuLabYB9XBNk399t87BdNJB/Po977xFDXKH
 JV0KwzXWFJ6yOleIWDlvF+e9Mb0ubhwxu/jCzQf7C0lV5szo4X408nkM956EkCcaA/zG
 Q/xvANa3hXoxP2iSqLah8dsrD3+JsFbWg0bz1O8E9GR/vYXT6L15No47xfGF02C8d8EZ
 F4wq4wvy6spQylvu0rmGTlZhZKF9G3rhY+pkboAgdD/cK7NCfW2VPAjpk5N1GAKleMHG
 jGHe350+qzBST6egKhQtQB04scmPxZMRtB1WNdcBG0B2cs2cu2VrxsucOx7HSl17b3Or
 0K1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=CZp4zRIVLXMleEdRu4MXSsWwj+dE7/TBoBP8GARImKQ=;
 fh=Dqsp8qVTX/MUWCKmt2VKqqowYLC02g3mlQjUmj6Xc6s=;
 b=HtMNV1nTrivXeCGt+fM940s6XR5zegalsmvafqCBV3R1wWcjD/vfTjdN6QjJpM7kS4
 Y+Y++qMlGsc3xhpX7/Ig+cEIl8QLp40MuiyQ45PbleQ7Me1nolgKRHIdWFD2UrJy9Yl1
 cI/378iI+POtmEGsRFS+RFozR8C6CZoyEw6C0mc7kfVBhOsIDY02wnBXLsWexkGVlLPb
 r9X3m4RnHthWJ7auYWM66SPm7/xrDp5QJXma9F+7cFNUvXXjEqsAsYwQr0XC3n5H5MbH
 3WMAD869vr3d+Ox1VY465Sskk9r8QEWFGRCAtED6UnoMMTnswgzWeuFnfqQCPwqaJ65u
 LWrw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776970971; x=1777575771; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=CZp4zRIVLXMleEdRu4MXSsWwj+dE7/TBoBP8GARImKQ=;
 b=k2owe53v85vu2yruJjrF7UGGHU0WKhXJiZxWzlE8leMMJ1M3RqIbQzlmtiVGodaj2s
 l2NDX7JBibbLPPB4zfLnfgf/2OPgGJJBBKqUh3FiKzxVjv9eXkj2aTb3clhbk5ZSFcYM
 azbhRNOvqi6HngappYn1EG20cEupR/izEk435LCOiCbHum5xzxnhAt9hjzdslFiKYRKc
 yrJ3rajoTOyBVBoLCvBP5UaA5MG924HfE6GjlVS82ig5W94sPNoBhx30HICcm452ogo0
 61LPatH3/g4tHT2cnbh9MXaCwhGibpElV6o5AAM7CCCXb/qEPTvvwL9tcIBOpedoZKWE
 MsyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776970971; x=1777575771;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CZp4zRIVLXMleEdRu4MXSsWwj+dE7/TBoBP8GARImKQ=;
 b=NvR9u3XhCbOWE2W10SobPQVq0q+wTvKNUuw5mV3llwqjKEmw0MTXCwCmmPoYlSETbb
 6Dx5qBoPXSva+IkjDLT3gPr/Qymj2wd6lIz8YqAmYMXH3emrjlX8KkzGHivG0n/Nn9fX
 RH3prPQLhqLjF1Zeuv3PEa4CbhA+/FdN2qNQS+cwR9n6dH0DP8opQ/T6pS+r0i68YF8Z
 vY7GahCZlebrv/XSMdzw0qEKY6IQf8SDSCJWFavm+QO/z5gs7ZadNxcakwmPB6I/dWcS
 NaJcrO5mSFzX5Z57yTrcNP0G5ElhP8xHatavioXr1UZHy33g0iGVLtLmIMfXMJ6tKTRz
 us2Q==
X-Forwarded-Encrypted: i=1;
 AFNElJ+zHvXgHbsgYebgyAHre66N4Ud3ZLcNQ4Odj7by8Y1THqvVy3YAN0DcyZkb8lst3qRRZsPMo3vkNg==@nongnu.org
X-Gm-Message-State: AOJu0Yxt999KIwXII1O4BgH+kQiOqFaCRiXNVglyviv6PzW4x1+sIy/+
 6hmv0gJS5PzttZuWKswEVK7Ox4st+YtF7pPkaBkE6t1x4ahNtH1X+pvamkVtSyq/nyq7SuLWrVE
 f0XzezArChr9miT265qZMlu/SlI2aZ14r50OiG07w6A==
X-Gm-Gg: AeBDiev33n4j8JPy6JygRv6uCaUKWXDlyGWSM28a/n1teCvOFMh1/yQn3y2pzZu17lO
 X7FX9btkjFDAUqZVw+jQi8e8dQcgSj8H+m48f5Oij4xxpVd0FQpg/liDojVFIJHCBpqu1uMKuMA
 GVtBd23odeU8YSFU/wTDLQ0y13Uo/p9jEWAJmrgoS4PaqwCOT5JkThyE4bnGHQ2TBnpkuuwdbjC
 ZD0o5NAQy5GfQhuy+Rs/QtlHIvSmGySJhpzVwaxxP0aOAl+MW+DxHowJFCgqU8t1zRPp5n90vfb
 O82kiovPJ1QM1TOcVPsLWocc3zSdL5MdtMdjd0EWx1dOu07D00PHlGG+2D4uGpwb6q9aa8reOjR
 P4Q==
X-Received: by 2002:a05:690e:204f:b0:64a:e222:d3fa with SMTP id
 956f58d0204a3-65310b4ff1cmr20149822d50.58.1776970971431; Thu, 23 Apr 2026
 12:02:51 -0700 (PDT)
MIME-Version: 1.0
References: <20260413230251.22537-1-richard.henderson@linaro.org>
 <9136e278-f553-4ebb-aed0-ce2e0a2e2a4f@gmx.de>
In-Reply-To: <9136e278-f553-4ebb-aed0-ce2e0a2e2a4f@gmx.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Apr 2026 20:02:39 +0100
X-Gm-Features: AQROBzDNqkFWLQhiyNX9UP89OABXWLAoXKncRyxB66jSobtM7ckf7eqKY1B4yYs
Message-ID: <CAFEAcA-7PbOLT=SeMeMeUVbBfv3EEbzBuDWiLyOAgCK6jRWUkw@mail.gmail.com>
Subject: Re: [PATCH for-11.0? 0/3] linux-user/arm: Deprecate nwfpe
To: Helge Deller <deller@gmx.de>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1136.google.com
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

On Thu, 23 Apr 2026 at 19:54, Helge Deller <deller@gmx.de> wrote:
>
> On 4/14/26 01:02, Richard Henderson wrote:
> > Deprecate nwfpe emulation.
> > But while it still exists, fix thread safety.
> >
> > r~
> >
> > Richard Henderson (3):
> >    docs: Deprecate linux-user/arm/nwfpe
> >    linux-user/arm/nwfpe: Replace user_registers with current_cpu
> >    linux-user/arm/nwfpe: Use thread-local storage for qemufpa
> >
> >   linux-user/arm/nwfpe/fpa11.h | 25 ++++++++-----------------
> >   linux-user/arm/cpu_loop.c    |  2 +-
> >   linux-user/arm/nwfpe/fpa11.c | 12 ++----------
> >   docs/about/deprecated.rst    | 12 ++++++++++++
> >   4 files changed, 23 insertions(+), 28 deletions(-)
>
> I've applied this series to the linux-user for-next git tree:
> https://gitlab.com/hdeller/qemu/-/commits/linux-user-next?ref_type=heads

Please don't take patch 1 -- we put a different version of
that into git already before 11.0 was released.

thanks
-- PMM

