Received: by 2002:a19:ca48:0:0:0:0:0 with SMTP id h8csp2540459lfj;
        Wed, 12 Jan 2022 08:26:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJweraecGOeEB/tUZI2PX6BVgrPdFdoqvt2WLTG6t/CasmEPsrrbuXWV2IURAYdgG6JeIsQE
X-Received: by 2002:a5b:888:: with SMTP id e8mr557315ybq.476.1642004793087;
        Wed, 12 Jan 2022 08:26:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1642004793; cv=none;
        d=google.com; s=arc-20160816;
        b=FdRVa6eGtXgeLjzo9SDMI+YkSAf69UE9trfARQQUiyaXYG/o6QtHdIl/BUGAfrTG4O
         tS3va1Wiz9nC+gyYL6z+olYEXa3lmA61Iyxw2ohkPJPSstz6etbV43iUXuiY+Q+NnHIo
         4LoS8EngTRdIUfRsop66xZpghULUiB0GbMPjNC9VExOq4TzLhtMR9NJVH7mmClyzJ5o0
         tEOTRMozrtWVfByxkwY7ydAlECxbGtb4zGW6eOFOJllxBzdAUaGeToKqa/FagXTFJjXo
         fyM5sGBsZCPpijMTJheAaxk30LnkLEGsR1oq9/jZxuRf7+xmIWcU1yPUd9H4bwuXdBdo
         fsCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=xTP8HHrKOLCu1G1sVRI0TRt6efHotQSonfLk0nlyOqY=;
        b=eYyRxE5EmTcW77uygbMsT8T6rpQFWAErGrDsuDyA2E6nrdquASfq1XtyLX7wxWR+/U
         2DHO2me3XAMmu6Lb0u8jvTwQklf/kiOd0MHyY2/lu+do8FxO7Zu+D3V1PRWSQ/X5JQ/Z
         El7Nzrvd1CzaAFW0VdVD4Lf1wN5oPeg7LyeUukMtwIzwIclJUveG25z+MneictMKe9et
         OrcJa7cpLfWNsOzBFv2beeFWo80QHuKxvlaNwTv6gdiU6EdwDLbXWqQpBTeF6y1TGJGZ
         pPt+rNy2ttw6nYcFB9GE1myEy9SpXiScd1FMYoVoFNJ4uUEbsdxi348Ho3uCGFW35tt5
         oNLg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=L4MjxOQ7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f60si165566ybi.529.2022.01.12.08.26.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Jan 2022 08:26:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=L4MjxOQ7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1n7gSG-0004N3-1v
	for alex.bennee@linaro.org; Wed, 12 Jan 2022 11:26:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n7gDb-0005rP-Fp
 for qemu-arm@nongnu.org; Wed, 12 Jan 2022 11:11:26 -0500
Received: from [2a00:1450:4864:20::435] (port=41807
 helo=mail-wr1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n7gDZ-0002qq-Vs
 for qemu-arm@nongnu.org; Wed, 12 Jan 2022 11:11:23 -0500
Received: by mail-wr1-x435.google.com with SMTP id v6so5115709wra.8
 for <qemu-arm@nongnu.org>; Wed, 12 Jan 2022 08:11:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=xTP8HHrKOLCu1G1sVRI0TRt6efHotQSonfLk0nlyOqY=;
 b=L4MjxOQ7jlwaUG6NSVG7XiQl7PWWNOd1IXtx2oBIAnhaTYPox3/eW933qHjqkqMSZ3
 dfs4g3BJKgJ/ebRjg9YLLiINLpxCE9plVGMnEVX2eClEd2arJSpc/ndYhy2EcyQ9sBM0
 WrnzVT4eqwMDsutbIuRESTZSAqPnzHzhqnMLsxHUHwqHZELv9Ef7zHJCrOMIjs7+IdZt
 t3tPJ6tItgN/iRGNc6+3vbENtXbLYuZ5R/7pr2Hvx0lHXY8i+i9vrdKuUdXc9E/kEfrE
 5pYeR+l4rCtC4Wpph8CkRi06ceOjFw4MIPlCsak42tkHJCx7BvRpcO6isNoQVMDH9LHe
 N9PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=xTP8HHrKOLCu1G1sVRI0TRt6efHotQSonfLk0nlyOqY=;
 b=JA6RXi93qV/6loe1FT+/6dzAGijq+e7D1KgdH33J2x8DMl1mA9IU2kK7EPy19saDKl
 xU5PynrGLtL+y2m+kIxIFEVsKVSiZKDdiDh3pqF/0yD39U9KF9BvciK9UXWyazuSXk5n
 SAPyTJ2goDQMVRbJEpvb0CxUQYSYzBmWTDCc6aLmYWCCw/f1c/q2UuJwwj7d0MvcuIZm
 eCXCh9VsjjT+O69apWmJKgFLvNGopO6hgR/ip9OLffg/fpf7SG+9H8YKWLrsEeDbnV8N
 zXAws1ey3bkYXEGoXnUETMCeMQq8E+tg1ANvDDEhFG3q9pM80KS2SZ/bvblNiVSxLGRa
 WxqQ==
X-Gm-Message-State: AOAM530T6WBYemofi26BrFZ9xYr3YmK3Bi+Sc8wPCl9yn3B8vtOwor65
 7iOfw8p0/s9W1DT5vakItdhrJnKgMpdxKhh5CQkqz9EhXYs=
X-Received: by 2002:adf:e907:: with SMTP id f7mr367284wrm.319.1642003880278;
 Wed, 12 Jan 2022 08:11:20 -0800 (PST)
MIME-Version: 1.0
References: <3e7106d0-7a0d-0482-9dae-42bcbd78aec8@cmf.nrl.navy.mil>
In-Reply-To: <3e7106d0-7a0d-0482-9dae-42bcbd78aec8@cmf.nrl.navy.mil>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 12 Jan 2022 16:11:09 +0000
Message-ID: <CAFEAcA-h+JNTQchUGH6M=JTL17_2_YZw_mE15sdcVePwNcEwKA@mail.gmail.com>
Subject: Re: virt-install on centos 7.9 not seeing qemu-aarch64?
To: Owen LaGarde <olagarde@cmf.nrl.navy.mil>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::435
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Mo94BZQUUHsh

On Wed, 12 Jan 2022 at 14:22, Owen LaGarde <olagarde@cmf.nrl.navy.mil> wrot=
e:
> I'm trying to create a Rocky 8 aarch64 guest on a centos 7.9 host, coming=
 from an ubuntu host.  I have this working on a minimal popos at home just =
to verify I'm not insane.  The "real, at work" host does have to be centos =
7 x86_64 though it will be replaced with rocky 8 x86_64 "soon".  The kicker=
:  I'd very much prefer to use virt-install because there's a large amount =
of pre-existing automation I'd have to rewrite otherwise.  I see the arm an=
d aarch64 support added by the expected qemu-user (2.0.0-1.el7.6.x86_64) bu=
t virt-install won't use it(?).

I can't help with the virt-install side of things but I would note
that QEMU 2.0 is absolutely ancient, especially for aarch64 guests;
if you have a way of using something newer I would recommend that.

-- PMM
