Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp2471686lfy;
        Thu, 30 Jul 2020 04:34:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy9puGen9uDV3Di+UuNEYcrgbYowi48/Vs73OGZi95G5X6IURFvskFBYXAX5kwWYbpvyytz
X-Received: by 2002:a0c:83e6:: with SMTP id k93mr2365686qva.112.1596108864877;
        Thu, 30 Jul 2020 04:34:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596108864; cv=none;
        d=google.com; s=arc-20160816;
        b=0o9oj6YJgS0RV7q5u8HD+kBEe+6uRkUMZoWg+lgs5ApF/UBB4wfpcOfAYCN/F1aDoa
         aV3QpiYz0zsUZYs4514p7V1LxELNgBEisYH0SpwCgmbElb1FG7DT0V3aRD6NVGSia92v
         0VybaE1+t1FwaT+3nQjmzavbdPtntIfq4ctk/oETVqwDaz3/73KHu2hEZv2Xogui7ODi
         6SC/aOY6HdKgaZdbTVWpQAY5rX26Uzk70XkHq6qXYwghn2SIpLxbkNplyXGv0EqFOiKF
         M4lSB7mhXxpJ6t2WrAACtolxQ09v/EOfn7E7jd2xpd6JhFNSJ00SihY5xqjYZo23rQZU
         u+/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=a/KbVx1s3ycJ66pUa39DQPUXRctiQhwXA1nHi7J6pvM=;
        b=N5SQy00xSPmYcu5Yz7yB+kNDd4GrID5nfmaqEZrtyRla8C/MT3gFCjiz4lgnh7PZYQ
         gFMC9AgBL1ZX0g5YuFXv0MHmw+vurfmQrT2XSVhWevnT9WeXKww9Bcg+TUv6QkKAQVUh
         E/Tdc8ZzuwdOGYHiLV2spEYRWMI034PV+HOEGPDd8g68XmRUh4bonDXGB0EdWI5cHnfa
         m8W7upKKLhoUhrjhtyiDe9VPvbICi/vwZw5eUfYsQouOqoP3QPwo9h9nFrdarAvJ+zsv
         6jR9TWRb7Rc0ie6ML5C0zROuZUl98Lw+/uTqe8P7n9jQ+AfurxKASLVcFkV9twiNB9c5
         czfQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=GwdUmkF8;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x11si2428059qtq.166.2020.07.30.04.34.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Jul 2020 04:34:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=GwdUmkF8;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k16pM-0005Rf-AJ
	for alex.bennee@linaro.org; Thu, 30 Jul 2020 07:34:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k16oh-0004yD-Ih
 for qemu-devel@nongnu.org; Thu, 30 Jul 2020 07:33:43 -0400
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:45532)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k16of-0006Ar-Qo
 for qemu-devel@nongnu.org; Thu, 30 Jul 2020 07:33:43 -0400
Received: by mail-oi1-x241.google.com with SMTP id o21so2730075oie.12
 for <qemu-devel@nongnu.org>; Thu, 30 Jul 2020 04:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=a/KbVx1s3ycJ66pUa39DQPUXRctiQhwXA1nHi7J6pvM=;
 b=GwdUmkF8k3UVTryLn57Pqrk1LruMghh8A0C5boBOuSo5L1//iCm7UcWALltoY9Tuax
 uLosOo+LZfiHGOzgEjfVc99fKEhlkVyF+reFvtDYzhnJMuXCQym4AbrVSN6KFUopxz7h
 xGENKuIniDoGy1oVDGTBA6P7kMSt3KKFKWBBvFBlaEFE5L8Q5c+V0eDjVfs9T75di4Qk
 4B1VNSNOgzR/d79dLvS/MC3oqJcTbakOYZAAtDL4ho60ujpllxqmca5MOwhWA9WTQLjA
 /KiHGjFxh3kX+Tb1VbYuFTpaO42GdmpvpusPtqpG3CZIq/JIq99PEiRZj7PfcorkU3/a
 DZOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=a/KbVx1s3ycJ66pUa39DQPUXRctiQhwXA1nHi7J6pvM=;
 b=Hzr6du406chxzVZ5zWHtzgJJOaJedNon+19tJPnQ4nHqdxFjhr196gbuIEzmk6Zt1z
 bmT5CoHSEJqy2P94aXuyKqoKBB9zCza37EpO4INJQYTNMUL5kpNreJnKJrbMt1Q4S+58
 ZcY+NgcNHBTT0JZ0BDHXA+cPA5o5Wo1f7wzSJl3RoIXrp9cO7QKct6h+vHIE2bgUwQl+
 a84pBN3fYEnSVcPX3gtHV1pZGqv65CijZetDib9yVWP5ODmTHgPGET8GOBhX8QjUixxv
 p38BSMalfoimxFjr4kJQ+PcdZyke2ThlFAaSDQ9ur24hTa2WOSUX28vnAb7hfKLiL9YK
 NVSw==
X-Gm-Message-State: AOAM531e/1cI+qTgXemhgfX15P+s5cw+WmKJGb9aWS5Lq9KdT1hfAbHG
 k07vevz17orcCkBfWJT1Iy+oxW/4FrkkkcbXG5MYEQ==
X-Received: by 2002:aca:50c4:: with SMTP id
 e187mr10721818oib.146.1596108820417; 
 Thu, 30 Jul 2020 04:33:40 -0700 (PDT)
MIME-Version: 1.0
References: <1596074182-4920-1-git-send-email-likaige@loongson.cn>
 <1596074182-4920-2-git-send-email-likaige@loongson.cn>
 <CAFEAcA_ZgrkcpwYZD-stZGDDjhTgMOSLx--9KHPnxfbKz58s7g@mail.gmail.com>
 <25c0ba1a-088d-c932-1f17-030211af5d4f@loongson.cn>
 <CAFEAcA_uy0dpxQ07S=THCBaMx2R0-xaM_BUn8OxLkOwR9LJdWQ@mail.gmail.com>
 <b52213cb-1caf-75b9-7783-ca531af44e43@loongson.cn>
In-Reply-To: <b52213cb-1caf-75b9-7783-ca531af44e43@loongson.cn>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 30 Jul 2020 12:33:29 +0100
Message-ID: <CAFEAcA_6kfWz0KbPYOj4BwHJKDF=k3tvbSozs4_5wk=SVr+0cA@mail.gmail.com>
Subject: Re: [PATCH 2/2] target/arm: Fix compile error.
To: Kaige Li <likaige@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::241;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x241.google.com
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
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, David Hildenbrand <david@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oz8Uh0UF2+Gd

On Thu, 30 Jul 2020 at 12:28, Kaige Li <likaige@loongson.cn> wrote:
>
> On 07/30/2020 07:21 PM, Peter Maydell wrote:
> > Clang, gcc, OSX clang, something else, and which version number?
> Sorry for that. Gcc version is 4.9.4.

Ah, that makes sense. That's a pretty old version of gcc (it's
almost the oldest we still support), and it had more false-positives
for maybe-used-uninitialized warnings than more recent gcc versions.
Adding in the = NULL initializer should help it.

thanks
-- PMM
