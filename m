Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp53725lfo;
        Fri, 4 Mar 2022 13:44:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxGXNzKYJE7Em/w6lz0R0uJUlDzur06Nk4aqhOTmg5Rd6xg8ey+nv9pAYvxnwIcW4NLYtMl
X-Received: by 2002:a81:5791:0:b0:2dc:4a64:56f4 with SMTP id l139-20020a815791000000b002dc4a6456f4mr637164ywb.286.1646430248202;
        Fri, 04 Mar 2022 13:44:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646430248; cv=none;
        d=google.com; s=arc-20160816;
        b=NAthslM3N+cz4z80KMu+XoG/pEGbSjqtbBLDJaALgePuBg4SOYxIWOdbvxmKmFpGVx
         2HWNksOuPQ1Bwr7gqYrzZrAyuoyGgU9iRKSab5KzA2nOfhDRXjfnMxt2v9cet/1pEs0B
         N+/mtnsdjwPaGITC+Q0oAIKs2hj55BJuWi0HZPjOsK1LuT8lbFN6OOWwKEbLuu13q8PC
         PdC/eRU4PFq3zqDL3s3PCeTtDirVMIfnRiHXRU8GZl9fC49yKmf/bHQzSRZLgmj9KODI
         fZH0VYhVNSENt6K74OJcLDlTkGr4+okSg1VXe3hzRM1j51GLZsXiMMZUkvJMB0lskuxm
         rbmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:to
         :from:date:dkim-signature;
        bh=1dMTL7nN7GMeEabiGO39uS91zAVDg8Qu6RSyIna1DaY=;
        b=IG/2TQ5VaGTMoQgXut9lyioxZSL9LNmMwD/7NaoW6VVe+9xeFST+rYvmKDogDnCSPc
         8tjeMtfUExc3BKiEunUAU3bZuww0f5U4QLO5nCcrJ9enU/xT8BmQQakIGVlwIRrJE9WX
         BaeDW18LG6Mx3ttc+PfKKWS2Hoq2e8HgjGqCDjfDtSgROboUY9qq1+sjESr2FIOcS20N
         lnTEr+YplOgEweyVTesgNib0qJP4SP4W6hmMNSmFz3xppC2DNU8i6PgMg3xOvSkvBauc
         R38fsWylCoTbSf0Zo0bqLlvrSTe+X/gYa8oojE1tdLXx7bC5jVE+IKqi9tH+YnmuCmL/
         JyZA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=JIXRml3P;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bc22-20020a05690c001600b002d035ccf960si8300353ywb.4.2022.03.04.13.44.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Mar 2022 13:44:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=JIXRml3P;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:47000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nQFiZ-000514-KU
	for alex.bennee@linaro.org; Fri, 04 Mar 2022 16:44:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1nQFiS-00050O-Dt; Fri, 04 Mar 2022 16:44:00 -0500
Received: from [2607:f8b0:4864:20::830] (port=46624
 helo=mail-qt1-x830.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1nQFiQ-0005LF-MO; Fri, 04 Mar 2022 16:44:00 -0500
Received: by mail-qt1-x830.google.com with SMTP id a1so8534682qta.13;
 Fri, 04 Mar 2022 13:43:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:date:from:to:cc:subject:message-id:reply-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=1dMTL7nN7GMeEabiGO39uS91zAVDg8Qu6RSyIna1DaY=;
 b=JIXRml3P1nQGrYll8JnbY/9ejJp2ueDhes+CiOUWEWLNCP4uaZWUtOMgL6VCLszX1s
 pV3dBYx8vyTrC0EqQt3cKPdJ+DjHRJ8S78uxN2ZZmntxRMasWOCnXXH+JJcVIsDLWsNJ
 EnTos742ij0RsHMANuVWeCx+VbrpI87xjEy23BhEHMsp0BE49pTMO68HE6Ehw0j4Z/lz
 /06GgZQoO4upJvOJbfCE5v9HM/TWoKv3lc3oVzA9R3B3KUw3LqqOC4xPkBFjdIimCm/w
 bokHx9ASLOciLCkZt9Ui7JCSeyCx2DnKOjiKQulfI2owFXmGfL1lViiULqJDQpuDYADx
 bRgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :reply-to:references:mime-version:content-disposition:in-reply-to;
 bh=1dMTL7nN7GMeEabiGO39uS91zAVDg8Qu6RSyIna1DaY=;
 b=soxjDahNhRpi187a0uXQ48fRbLFjfIXjFWhDYNNhuZCMzAAIFV3OYvhkVbfoIpKwz+
 /n4R70wfff5KTDbk1sXSXKHa46RBWspi+GJ1s8B0MXw7IJWGxvwOFJSWun1UcRpRWFz9
 6anT6xInvyRPcyeiQFBdkuVac3x4DRTh3KslRK98BTlwkkyhfuJ2bAZYq3t7B4jnZAS0
 I2nZc8jGtVg23h3oH11e6rnk5goqmMx/RCLmxI/K0tKk7uV7XUFxCAwPCK+YQ1u6FHBQ
 U98r8LsOXZ1uUXFZnpio3U1v9icNKIDQUCEXc6deYaH8eEwOokAQh+XV+iRAWcLCY75c
 6lpw==
X-Gm-Message-State: AOAM531hS30eHwo4e4H/GjwHgaIUH2kh1MoyNaBa0xzZR5q7UcLFchKk
 TDP6vzWwatUK7z7cZ/4w8g==
X-Received: by 2002:a05:622a:18a9:b0:2e0:2ecd:a6fc with SMTP id
 v41-20020a05622a18a900b002e02ecda6fcmr733944qtc.1.1646430236935; 
 Fri, 04 Mar 2022 13:43:56 -0800 (PST)
Received: from serve.minyard.net ([47.184.144.75])
 by smtp.gmail.com with ESMTPSA id
 w9-20020ac87e89000000b002e039503dc7sm4093373qtj.18.2022.03.04.13.43.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Mar 2022 13:43:56 -0800 (PST)
Received: from minyard.net (unknown
 [IPv6:2001:470:b8f6:1b:d039:aa0a:5985:f3f6])
 by serve.minyard.net (Postfix) with ESMTPSA id 395F81800B7;
 Fri,  4 Mar 2022 21:43:55 +0000 (UTC)
Date: Fri, 4 Mar 2022 15:43:54 -0600
From: Corey Minyard <minyard@acm.org>
To: Titus Rwantare <titusr@google.com>
Subject: Re: [PATCH v3 0/9] This patch series contains updates to PMBus in
 QEMU along with some PMBus device models for Renesas regulators. I have also
 added myself to MAINTAINERS as this code is in use daily, where I am
 responsible for it.
Message-ID: <20220304214354.GL3457@minyard.net>
References: <20220302015053.1984165-1-titusr@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220302015053.1984165-1-titusr@google.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::830
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::830;
 envelope-from=tcminyard@gmail.com; helo=mail-qt1-x830.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-To: minyard@acm.org
Cc: peter.maydell@linaro.org, venture@google.com, qemu-devel@nongnu.org,
 f4bug@amsat.org, wuhaotsh@google.com, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9durct8IFGby

On Tue, Mar 01, 2022 at 05:50:44PM -0800, Titus Rwantare wrote:
> v2:
>   - split PMBus commit with updates into individual fixes
>   - renamed isl_pmbus[.ch] adding _vr for voltage regulators
> 
> v3:
>   - split uint refactor commit and removed commit renaming files
>   - rename rolled into preceding commits
>   - update commit description for uint refactoring change

This all looks good to me:

Acked-by: Corey Minyard <cminyard@mvista.com>

Do you have a plan for getting this in to qemu?  Like through the ARM
tree?  I could take it into an I2C tree, but there's really not much
activity or work there.

-corey

> 
> Shengtan Mao (1):
>   hw/i2c: Added linear mode translation for pmbus devices
> 
> Titus Rwantare (8):
>   hw/i2c: pmbus: add registers
>   hw/i2c: pmbus: guard against out of range accesses
>   hw/i2c: pmbus: add PEC unsupported warning
>   hw/i2c: pmbus: refactor uint handling
>   hw/i2c: pmbus: update MAINTAINERS
>   hw/sensor: add Intersil ISL69260 device model
>   hw/sensor: add Renesas raa229004 PMBus device
>   hw/sensor: add Renesas raa228000 device
> 
>  MAINTAINERS                      |  13 +
>  hw/arm/Kconfig                   |   1 +
>  hw/i2c/pmbus_device.c            | 106 ++++++-
>  hw/sensor/Kconfig                |   5 +
>  hw/sensor/isl_pmbus_vr.c         | 279 ++++++++++++++++++
>  hw/sensor/meson.build            |   1 +
>  include/hw/i2c/pmbus_device.h    |  23 +-
>  include/hw/sensor/isl_pmbus_vr.h |  52 ++++
>  tests/qtest/isl_pmbus_vr-test.c  | 474 +++++++++++++++++++++++++++++++
>  tests/qtest/meson.build          |   1 +
>  10 files changed, 944 insertions(+), 11 deletions(-)
>  create mode 100644 hw/sensor/isl_pmbus_vr.c
>  create mode 100644 include/hw/sensor/isl_pmbus_vr.h
>  create mode 100644 tests/qtest/isl_pmbus_vr-test.c
> 
> -- 
> 2.35.1.616.g0bdcbb4464-goog
> 
