Received: by 2002:a19:6a18:0:0:0:0:0 with SMTP id u24csp811763lfu;
        Tue, 5 Apr 2022 01:38:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxfgEkqUHBM5iFtdqvDnNKCMPxWCQ5gV03PYWXutkVFLOD8e7TM0uoKAKSa9zjWPgp+CStY
X-Received: by 2002:ac8:5754:0:b0:2e1:eee8:be0b with SMTP id 20-20020ac85754000000b002e1eee8be0bmr1905532qtx.349.1649147937120;
        Tue, 05 Apr 2022 01:38:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649147937; cv=none;
        d=google.com; s=arc-20160816;
        b=mJjTl9Qe20+MiKc8dbCEc3up08lLIyIcg5ZUcMrUtvFO08DcaMJbzlsRy5cFM2CaX5
         YnSTXoioUDeaqV2tSmqQZ1yS3zVi+7oBSJ1rOxlAnrJoNZ5NgOEXMYNkGuBLJhY56w0X
         xZV5IbKpeSdQFOR0CmcIimVc82iwrcr6ShhdZTHgUBwbb8Mn4/rtPlUaDEus1aQcvMn9
         b+qfNgLPpN15Q/8Dzk2sLiDtzgxBzgzTGSprkpncJRIb1d8hi724lM650Lhysb0rqkoR
         d80MYmYnlrJ+uQ5Asta1kOFuVT8Qnjz9la+KhJ2hxCBY78zw79aYNIONsvAyY/BZNBvc
         qPEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wA/ZuN3EU0UYhSe+i3o3je6PJ2QX1jsULT2XR4axYiI=;
        b=qPJ0jb5w4wTO1LWgdk/MjJWfvEqM4MwImtSLneB9967oSrfettGZg39QIYbcn88sK3
         h14TkPmyoEFZAwyjVtc7P8WAy0GIs6jGmKFcrT9a5ZZkDbsX8sBWnpg2NWc+rJ21BJJu
         jmy1MP6tRO2pcPei305hIsgFFg5t0C/NYD6L+FOg0YOTQmvPgcjU6RnqsZBe3Fs8eT3b
         pLzygkm1v6s18luYXujHSFRZgfTRm6eWstFoeJu5O1Btqbxx1NrNrRirh601TUkx3KOR
         u9jOeD04MaMO06OT9Qe1vg2p3qwnistJGDuyUmOlioNfBowkoHqdf2VoDoSfQfsP6ZkY
         2NsQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=tGT90+1Y;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i17-20020ac84f51000000b002e1fbf3bf64si4138105qtw.341.2022.04.05.01.38.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Apr 2022 01:38:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=tGT90+1Y;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nbeiG-0005UW-Ip
	for alex.bennee@linaro.org; Tue, 05 Apr 2022 04:38:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nbeYI-0003O9-2C
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 04:28:41 -0400
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134]:46135)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nbeYG-0007nW-D9
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 04:28:37 -0400
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-2eb888cf7e7so39363467b3.13
 for <qemu-devel@nongnu.org>; Tue, 05 Apr 2022 01:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wA/ZuN3EU0UYhSe+i3o3je6PJ2QX1jsULT2XR4axYiI=;
 b=tGT90+1YUVWNnVo4SLPMipwu299OPKyJg+xE9X2fx1IaXxUldPXF9UQk8ufek41aW4
 rJsJKqb3jFEwRn0TjxaqyJkW8ukRAsXAue9oVf704/ZV4sDCiCA7Ttqtfnf7Qhr8xnuT
 NSM9LVvamZIrzOIzckb9b/n4IVvbJ3wNylfJv+BDBIxE6aPN1It5S+/+21bmXG6ReVzl
 7pYkt2jd5Ch9ssbPI4xrJDYhviB7b6uIS2fKnwMseSR8gZzt02Oi96XPy71aXDDGStlh
 QB+ioRm3CcOWqePt+FXj74ev/5eaAoNubEA7tTiqMu8NY6lp/z1OLejDJLB9i22+UXCD
 oTZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wA/ZuN3EU0UYhSe+i3o3je6PJ2QX1jsULT2XR4axYiI=;
 b=ZKaVEu4/T1TgL0dDfblqMqbC5e2feADXDjMWLZqhQjBLQ84+rAp9jYCqoAN3z83UO6
 UwG4zBtfv1XfgeTLjte3f3cwTdKUtCgoTl1hiQBbGq8ZBpnj41X6IZmj9RLNvhX9xphH
 gTMdEWWFlOK0pu6akfQEpZ6qpZeKumrMfiUWg8jE5DG1QHJ+/844G5X0dbeNsq+vUMtJ
 lKNs7oLbtmbrUh4c/ZECrmqg0vnZpMMSaCzBcB0AJNdiFQIfbfRdNjoR4d95xyGgkA2x
 L7HvatVuZKwAW2/2gcwQQdeY+qTW+x5iwaHTyKy7Pobet0uxx+L+dm98FKDfT3mcMr01
 hmMg==
X-Gm-Message-State: AOAM531mEu7psLowHj/MevXOWY5nMv1mZoZjSYM6oN42FnwNjoH1YPgV
 MrzleXQNC9/BVQYLKqjhZJziygv2tb027YGVae231w==
X-Received: by 2002:a81:106:0:b0:2d0:e682:8a7a with SMTP id
 6-20020a810106000000b002d0e6828a7amr1740155ywb.257.1649147314719; Tue, 05 Apr
 2022 01:28:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220401190631.1697408-1-tong.ho@xilinx.com>
In-Reply-To: <20220401190631.1697408-1-tong.ho@xilinx.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 5 Apr 2022 09:28:23 +0100
Message-ID: <CAFEAcA-JYZ0ZfB6Lv3i5pBC7TjVS2V6PPYwUoCLZR-XhY9BK0g@mail.gmail.com>
Subject: Re: [PATCH 0/1] xlnx-bbram: hw/nvram: Fix Coverity CID 1487233
To: Tong Ho <tong.ho@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1134.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: edgar.iglesias@gmail.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 alistair@alistair23.me
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ihZcak49cyq5

On Fri, 1 Apr 2022 at 20:06, Tong Ho <tong.ho@xilinx.com> wrote:
>
> This patch addresses Coverity CID 1487233 by adding the required
> initialiation of a local variable of type Error *.
>
> Tong Ho (1):
>   xlnx-bbram: hw/nvram: Fix uninitialized Error *
>
>  hw/nvram/xlnx-bbram.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to target-arm.next for 7.0, thanks.

-- PMM
