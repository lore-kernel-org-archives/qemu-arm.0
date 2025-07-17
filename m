Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27769C83F34
	for <qemu-arm@archiver.kernel.org>; Thu, 17 Jul 2025 19:51:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ucUdX-0007yU-FC; Thu, 17 Jul 2025 15:51:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ucSAP-0002V5-VI
 for qemu-arm@nongnu.org; Thu, 17 Jul 2025 13:13:10 -0400
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ucSAO-0002ly-7h
 for qemu-arm@nongnu.org; Thu, 17 Jul 2025 13:13:09 -0400
Received: by mail-yb1-xb2f.google.com with SMTP id
 3f1490d57ef6-e8c475ed007so898814276.1
 for <qemu-arm@nongnu.org>; Thu, 17 Jul 2025 10:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752772387; x=1753377187; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=T3MpbtOB9CdTJlW/zaKeHzicXS4O4reClbzSl9pDGK8=;
 b=LG98znylxOUJS24zZOpigeO5K8EbE60zV5jKEyT88aD+QVb9xtVFCi1A//Afaozib3
 uBxyNFJTzTMHcbyq9hHdRePQWqrYgC0TSY6aMsPoSsMjPRTeBjHMwX6KLS92JASGrgwx
 GnUuXjYEoRJ78attLt/xJyFJ+wLSmSdUDi9B93JgX0isn9jnfzr25gbgbIhEfMoEiFLc
 +yD/M4zfU6ChUsOxCxZIIVTJxNll+Um58g/Ul5eGkEIK3NHWZOC1A5mtunxdDbi+D7tf
 ao+4zbIP5VEa+grFMwcBTyyfgbQV5E9/OXmIr+04GBIzx1QPW48OvCz5GDQ2vl4oT3T0
 fJZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752772387; x=1753377187;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=T3MpbtOB9CdTJlW/zaKeHzicXS4O4reClbzSl9pDGK8=;
 b=dPQA1+aRTBWP389VVYYQqJfm36W/5m8QIE+msUAoyah1N1+ADZMuUodMLESXnRhaYg
 1OijWfHdck6WpoZlPaGzO4Q+ejzJp2swv+YHWmUC+p9I3E4M6t6wtw2Qpe4HjEzC1NqK
 64891byY/9HWbWfk25gYsznxzvwUhT+vDL1iNfIs4kuAbSCHGtPxnTRcy9p3M7Mfi5LA
 zt2/qPLAmZKHWiV0+TEld9kIeXPnOAbvdClgeLNbkF9L06w8MAwhKF1JjhNRuP0mQrYS
 49xLvYfs2ZaGm9GnTUKsYjh+Oxt9GvbQYQMv6A3TH/VEOSsH0AvJMqmsvcjtMxg13cZx
 Tg/g==
X-Gm-Message-State: AOJu0YwHMHQfRzlrawiOLqJGFi108YAK0/+vcyTSy2zm0LhonxFWnh3V
 jtgthNU9UYI1ZYVNQBXsTlGRtuyiHEOBVXKHwG5xKFMeLfmMg4BV0d0bLqKL5r24LiJa26aiSKI
 gQc2GQ25VtiaSPT4asEwAyUx9D8QxpoY+AKLBryLxchSsonirgTHj
X-Gm-Gg: ASbGncs4HopJ23xqsCZ6CPuIIVk9GhTDpKmF0ptZzJekNWSABd9mDjNh3xbxESw8QSP
 4qDlelLM7oHLSpp5WhzRZpYvfmwphJbpSrOQbK6kpc59oxDQhk01VTXscRG4vGYWeVwqmZHYoKe
 tMao+Z/sZp3YolctXnANKBmQUKxCR51TaoQLTT8SPnCdGtAGLwC0GXrYIllmyv2bZKc7uwgdgcZ
 y1+heZX
X-Google-Smtp-Source: AGHT+IGO48RetpUEdi8NM87MVXD9gh2Zv62bK8pCo8sDO9ivIVeQ6RaY+mv5U1z6P17J8iE3UHDL1p2tHd8MEBmml4g=
X-Received: by 2002:a05:690c:9b0b:b0:719:4cde:84f with SMTP id
 00721157ae682-7194cde0b72mr9454687b3.10.1752772385249; Thu, 17 Jul 2025
 10:13:05 -0700 (PDT)
MIME-Version: 1.0
References: <20250714135152.1896214-1-peter.maydell@linaro.org>
 <0b438773-01b9-42e1-8edf-2330e50387f8@linaro.org>
 <95b00393-bdd2-4db3-ac39-02a09f83b4d7@linaro.org>
 <CAFEAcA_Hbpg0wkQ9frt+MUj7x7uR+p7+8o4SLLx=GwhWvfCzaQ@mail.gmail.com>
 <3ca15207-c4af-4cf8-8502-b78bf95bd5f8@linaro.org>
In-Reply-To: <3ca15207-c4af-4cf8-8502-b78bf95bd5f8@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 17 Jul 2025 18:12:53 +0100
X-Gm-Features: Ac12FXxjGgmQz7jbhlPmCFI3MzhA3QxRNCAyyf1Ub97kEo5amlnFKXOqfg_Ssa8
Message-ID: <CAFEAcA_VSkK18twpmgQQHu+bQy2KPPzb4Ca0baoxBJ4KPiy=iA@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Provide always-false kvm_arm_*_supported()
 stubs for usermode
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2f.google.com
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

On Thu, 17 Jul 2025 at 18:05, Pierrick Bouvier
<pierrick.bouvier@linaro.org> wrote:
> On 7/17/25 9:56 AM, Peter Maydell wrote:
> > I'm not really a fan of relying on the compiler to fold stuff
> > away -- it's fragile and there's no guarantee the compiler
> > will actually do it. In this example it would be really easy
> > for somebody coming along to tidy this up later to put the
> > nested if()s back into a single if() condition and reintroduce
> > the problem, for instance.
> >
>
> There are various places where we already relied on that, including
> before the single-binary work ({accel}_allowed).
>
> For the fragile aspect of it, that's why CI exists. Building all
> binaries with clang --enable-debug should ensure no regression can be
> introduced.

But our CI can't check all versions of gcc and clang at
all optimisation levels. The reason it's fragile is because
there's never a guarantee that the compiler does it or what
situations it will work vs not work. It's not a feature
provided by the language or the compiler that you can fold
away references to functions that don't exist; it just
happens to work.

I know we already rely on constant-folding in various
places: I'm not super enthusiastic about those either.

-- PMM

