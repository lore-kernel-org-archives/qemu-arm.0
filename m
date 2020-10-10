Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp3140782lfq;
        Sat, 10 Oct 2020 05:49:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyKRD28STUKc4o0JnadvlctcsfZKSvYZOGWn9i6MDw6dMTT6tBYbzd+fot4YauhQh0CMRcC
X-Received: by 2002:a25:2d50:: with SMTP id s16mr22130695ybe.85.1602334148124;
        Sat, 10 Oct 2020 05:49:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602334148; cv=none;
        d=google.com; s=arc-20160816;
        b=P5oi2exCvd5m5W4cFGENO6Pw9mGVUjBpTgKCu/H2Iin/n+PN/7NLks7lHmKRqs5J0m
         HsxGfH5bnnGcuS7YTniiKMDw1h3WiawrM8YgFhuPIoe5dJcM/owj/sEPui6NzmeNUywn
         JA3RBGBT6fTVL6/G4MsKvHdkOQ0LT5JQoTbpiVNgQlw/S8+WCYn3ndqaiMjYcRFyl0ir
         nYOIwb2p0nuMlHxauay81h7kJTruBASP5pWnvzzGNiBngKf8gqotbkV11sY5mAZ2nccW
         d4NYCAZHXcqk048Tjh+dAMzhf53M+FL6tExeYtzcrD+vhLj939WwGNsCeQHmrMGhKfza
         y+Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=B76CCZyfub1/rzmJ2i5V3y2lVks3/V4PSnEy43xna2s=;
        b=JxYHcac8zPsS3sT2QDpBVQXaH04FUJ60YTENBToAZe1yGBowMZWWxNKxf3wPHVviDg
         4Wa76YhtXIvjgH6PkXskJsk75T7r7sZHxcYUISuvtWVHa62GKYbd/brM5q92vgjXd1dk
         ZqHsnpFwjWp0Be3MgfESIUv4K477ekaK8GcbJpf+roQ7W6Smiw4KynnrFED3Jky25jii
         6FcdPIiNIjDPp1cCynkdyb9SPN1DAo6Huf3qYezav30didV87bzcR2TvfjXhqLscgeKz
         A9UPEK6W0HAS28aiIdTM42GLcs/p6zX+EZXQdglppvnH6mhElPClyj3GStTeytkE7vYE
         MpQw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Zn9Tn0r7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x131si10722876ybg.9.2020.10.10.05.49.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 10 Oct 2020 05:49:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Zn9Tn0r7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kREJ9-0004UN-Ib
	for alex.bennee@linaro.org; Sat, 10 Oct 2020 08:49:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kREIy-0004TF-MQ
 for qemu-arm@nongnu.org; Sat, 10 Oct 2020 08:48:56 -0400
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542]:36108)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kREIx-00058Q-5D
 for qemu-arm@nongnu.org; Sat, 10 Oct 2020 08:48:56 -0400
Received: by mail-ed1-x542.google.com with SMTP id l16so12218162eds.3
 for <qemu-arm@nongnu.org>; Sat, 10 Oct 2020 05:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=B76CCZyfub1/rzmJ2i5V3y2lVks3/V4PSnEy43xna2s=;
 b=Zn9Tn0r7mrdW+aSa28GAI30iuGnbNVLsmi1jl8ujHexEcv18WT0xlzzOMyPdB9Nzly
 jA/CqFTRQqYFehd7xv7w2BRJVQFInKY7oaqTHTL2O/2X9XlxUNV9hgaLgrhy7J3i5gh+
 t0l6KJqBCAyo3cHZja0T7+IEfia5pnuRC1JvdF1TA5mXM+PREBoDpDKMXZW0I7R4h2bF
 LbMScc/Bb5NdV/OTHFAwspJd4JPms23brCMsFp4doxKkRxWR49/tMmDD9O5JyxMP6NtK
 y82Fd8MxXWx1fAr9aeMLA5HiEIOQmBikbpZhqBp2BSlmJbi0gopDdLz+MjDx+T0hRUkm
 pwdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=B76CCZyfub1/rzmJ2i5V3y2lVks3/V4PSnEy43xna2s=;
 b=kpN5q1+ZQIrnAZkDgKDB95yzawI84WvKmmwtEjYhbrSwEHP7wxlseHYepxQHnoYUMB
 Bd4U2bdoyIKeiLZbeOMokFPOIUh8nJXyKhY/tpE8jU4MsR/RHSHAhyyEtno8bNX2Bxah
 zd3Mnhm7FU0ECx6LqQhN6sfGcjEVASvmQZRbtULPYv2BtB7yPA0E1I0uumsg79rh479u
 PMv1ybC2Se3liCDQOJFQlozRH6wTl6Ng/ZBx5BBnfnKL0IaOVvbIa4FOfRwGp3kdyXH1
 lV3uvTDKUZLp9v1disZP/BP3iA+e5r/G14KCmJMKUOquu5pBOWAhBozGlG2CaDm8PDAs
 M8FQ==
X-Gm-Message-State: AOAM532/8AEIC9KHBiwe6Lj7AvJfOpJxGClVXG5g8zOMh1MVgmVQ9RCz
 gRXcnHn1DRTJyCpT03XXNboXyKBEcmZD0gubipPr4g==
X-Received: by 2002:a05:6402:3133:: with SMTP id
 dd19mr1985123edb.100.1602334132917; 
 Sat, 10 Oct 2020 05:48:52 -0700 (PDT)
MIME-Version: 1.0
References: <20201009144712.11187-1-peter.maydell@linaro.org>
 <CAFEAcA8BiQcJJr3hkzTqnFLpYtXf1xbDf+GpgvYnPjJr_FAEUA@mail.gmail.com>
 <21d142c5-d651-269a-8fbb-d35a743f1945@linaro.org>
In-Reply-To: <21d142c5-d651-269a-8fbb-d35a743f1945@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 10 Oct 2020 13:48:41 +0100
Message-ID: <CAFEAcA-+9UQ4RNU+rjmc=Mx4MecTVJd_FniS4Mr0Q_QL57e7hw@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Fix SMLAD incorrect setting of Q bit
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::542;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x542.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IVBWDzT2wH+B

On Fri, 9 Oct 2020 at 23:36, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 10/9/20 1:48 PM, Peter Maydell wrote:
> > On Fri, 9 Oct 2020 at 15:47, Peter Maydell <peter.maydell@linaro.org> wrote:
> >> +        tcg_gen_extr_i64_i32(t1, t2, p64);
> >
> > Oh, I forgot to mention, but it looks like extr_i64_i32
> > isn't documented in tcg/README. Is that because it isn't
> > really a TCG IR op, or just an omission?
>
> Because it's not an IR op.  It's the combo of extrl and extrh.

We really should figure out somewhere to document the
interface and operations that frontends can use. (Among
other important things, extr_i64_i32 is usable generically,
but extrl/extrh are 64-bit hosts only according to tcg/README,
so if you trusted the README docs then you'd end up
trying to synthesize this out of shifts and trunc.)

thanks
-- PMM
