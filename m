Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp138779lfb;
        Wed, 4 Nov 2020 10:05:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyq0gn2v6KSYoX6R4D8dQtKNdjbswDF5Mpbw/vOiLd/xbojom7tCre1PZZrjXaEWtUUENM5
X-Received: by 2002:aed:2067:: with SMTP id 94mr20189592qta.93.1604513119166;
        Wed, 04 Nov 2020 10:05:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604513119; cv=none;
        d=google.com; s=arc-20160816;
        b=kOatRJaqMtN/R1XDwD8hZL4tt5Q8X/VFUFs7DdCCnWCuLEZoFj469+jvscA3CaFdH3
         XNVsJno+S9tR6jaHsFTtVa023ZXmiZmuDXbQtw5ODqv3bcFd9iPjVU7jYVjrWY/Doy7q
         OysQ0urAnxBnl8IlmoM+3xJCg2RjMekRitYflaf1ok81QbjwGHlQ1sQ6Z1q6BYNj+ZI1
         celS9pt2aHVQcH+MkeM1m8oglmFcw0md7ZV/uvrfepiED8zXcCEpSwi0NA79Iy5/4Nf7
         EfVpJ9csF6s5GcmmBeWhhthye7dH6b8YXynOTH63TzSOBaWpZG1zQ5Q7tyqnjZ3rse3+
         l+vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sI7TAhW2Sw37Yt5Y0QzVWuDziEmYYPc05s8hLAg4L6E=;
        b=TdWHE6Tnruh6q+pJ8fullKcb2+BbYIIMbZi1dnxbrD4viDOVjD3iDsHP580KWcoBVX
         crr+3tn9EGbvv4ATXrvT9NZO6o2If5nwF2ARewgHkIF9L8c96JSdFJxM8p5BKwIEWNxo
         ++GQxi3OhCKfjLjUbf1DJ/qQBGqrDunn3kPjwHG6yJSrQP0hca5HJVuyGYu2/83ds5A5
         e+b7Wd0bTuZDcVOcyb3XSAE5Mh0NSAajHuzdd4LEhQ2LyvXP3YN3gpyPlGv6WwoZmSMs
         2yjhauDGSOUQ2DSBP8nKiseSMBBHOGjVYtvwN0B1GT+vjCLEDhY49aWdgqWiSdnXPPFL
         TsKA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OyDZ1kE9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f3si1657721qko.203.2020.11.04.10.05.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Nov 2020 10:05:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OyDZ1kE9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kaN9q-0001JH-GL
	for alex.bennee@linaro.org; Wed, 04 Nov 2020 13:05:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kaN9h-0001IP-EA
 for qemu-arm@nongnu.org; Wed, 04 Nov 2020 13:05:09 -0500
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644]:43938)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kaN9e-0004sH-Gb
 for qemu-arm@nongnu.org; Wed, 04 Nov 2020 13:05:09 -0500
Received: by mail-ej1-x644.google.com with SMTP id k3so30972906ejj.10
 for <qemu-arm@nongnu.org>; Wed, 04 Nov 2020 10:05:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sI7TAhW2Sw37Yt5Y0QzVWuDziEmYYPc05s8hLAg4L6E=;
 b=OyDZ1kE9xDzZQacxCdqTEw0dym2WiocLAxmad9kq2nprR1+dqi8QnU/F8deerS4c8B
 aRdynzoPl1jCQwTUbg7aNeUcoeIX45+jMlS/whVXZItJKZvC6SyTIT5iMpE1ytZqH7AG
 e6RDC/zky5oUXcTo6AkjIKw59o0mdScflj1vf6gyEcXkG6TNdPOsWCP2BrjMVwq2OxSS
 mtzN/lhjyzi3ITABOlF7qAnBrT+n022BkXyeDqBBHLqTW+/65jhxVu34KBkQy1F5NFjd
 mqsrLce6ttrXgp0bqPUsZTbsgasvPqwiXkzaYdfoBxxIOSV2ZxxE+p/+3twrEva+/yWo
 MA2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sI7TAhW2Sw37Yt5Y0QzVWuDziEmYYPc05s8hLAg4L6E=;
 b=MfQm1duKON3jhMWBvXw9ljPXsruEAHqX1kKRBH3KOrrzdiOChHxTdvGX+QBiomXqQe
 tk3xjpxawDaETI9qs8Nd0kVQKmgdHUBEwpSsxoWm86qGGSPlOHAAT7nMksjTFwQSVVBs
 OGVAfr3Cgg5yPER0rSTuqZ3/K/jEngJmwQGijrf/VNvRXhDRCKmCo2TrBmeVpak4mVCs
 3l2YzKhDVexPXwpYweQ/Be439MGQ/uBXz7dD+lxRVKEMsqGGatHU8DN0zZMm1dU/2suL
 Th4d8qUInuM9A99QVrrzSTTy3/Sobu5MwhOTyRObkL6TobU7VmFm6M7QVLz3zdVs/92v
 Vsbw==
X-Gm-Message-State: AOAM533oKGoz5fMwq3l6q2cQJ2/J0DUGnikpnyjGxvnZp86iI/lEQZJA
 hDrZs0ovZBA+uc3i//1mSWxZrBLXZ+0mlM6WFOHZPw==
X-Received: by 2002:a17:906:7254:: with SMTP id
 n20mr25016901ejk.382.1604513104937; 
 Wed, 04 Nov 2020 10:05:04 -0800 (PST)
MIME-Version: 1.0
References: <20201103114529.638233-1-zhangxinhao1@huawei.com>
In-Reply-To: <20201103114529.638233-1-zhangxinhao1@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 4 Nov 2020 18:04:53 +0000
Message-ID: <CAFEAcA-EXS2czmGNePYcTPT+qJSp7jjHjECdaVRbwSda-zQOcg@mail.gmail.com>
Subject: Re: [PATCH 1/3] target/arm: add spaces around operator
To: Xinhao Zhang <zhangxinhao1@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::644;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x644.google.com
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
Cc: AlexChen <alex.chen@huawei.com>, QEMU Trivial <qemu-trivial@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 dengkai1@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: t4+fv78Jdtlv

On Tue, 3 Nov 2020 at 11:47, Xinhao Zhang <zhangxinhao1@huawei.com> wrote:
>
> Fix code style. Operator needs spaces both sides.

Thanks; I have applied this series to target-arm.next.

For future patch submissions, please could you include a
cover letter if you're submitting a series with more
than one patch in it? (Single patches don't need a cover
letter). The individual patches should all then be
follow-ups to the cover letter (in the usual way that
git format-patch --cover-letter sets up).

(We document this and other conventions for our code
submission process at:
https://wiki.qemu.org/Contribute/SubmitAPatch )

thanks
-- PMM
