Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp1216387lfp;
        Mon, 18 Jul 2022 03:17:44 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uS6Aewz2mXQTf7pmuW+ZwYBw7DygKPB4KJjtGc2633ypVySxdfRyFUa9YjNxQzfTSmSP+E
X-Received: by 2002:a05:6214:20e6:b0:473:16c6:ffee with SMTP id 6-20020a05621420e600b0047316c6ffeemr20528257qvk.90.1658139464377;
        Mon, 18 Jul 2022 03:17:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1658139464; cv=none;
        d=google.com; s=arc-20160816;
        b=T00O0SiP1FcONW+niPi4nxj2mXdEEOoTShFpLXzLmHGbxPs9NcrOq6I6k+ZH8TqRKR
         frOYWnhV4jCuBWxZ9s2CQzFDommFJnNXDPkaIY5WXaKmUZpzMOBZ2oMfJiwqpNAb/Fhc
         HBG8TeEOUWaDS2pbYy4oA6IRZbx2gtqngsm2DTfiTV6pb6T1E0ixvtaJrmbmNfvaQ3ic
         b1pDw7kKeb4xqkKYYaMtyRJhCgnSE9mb/Xq/XUgTDm43WhgOd1rYobd2taSt9u3XT095
         FgxgwMb2hBxx8z0ue7I50jvK8eyqSSXuPAKB4EmClBBmLwou/guhTmhjwPPmF1tLtNeH
         r/ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=58W0570Jka+/QTu+LKm1ttkum7tKXr80GanuQK2uK1w=;
        b=Cc+A+GW0SHOv9zq5X0gYuVgvMHbasnWsSdR6F+PIFASfhwXPCxUc4Q+Vc8/yBhNiiB
         /u0ZjbYVBkZWhn0k+8cwTvjfuJXBYi1STkcYNB+F7jLJl5NjCUZhy5QM2M4+zugUlwLo
         rGD45cERxnd8Ev06xIdVYw0ecopOeRtnHxnvKQba6MBiByTWBdzki6vbwHH0O7E0P1Hi
         VaPSYD4At+k94apMkbCRE093jAdjKYjFFzTS5kwia2aslJRRa1yPfr3dEWJ3u0vIkuf4
         Vk6afdSjt+ukJHGOVXuW4QzfHebL3ZGozRTafm9jlYJWgfgCBphgXHhDpJXEWUoW0b/m
         GlxA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=T7UPwhkw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gw3-20020a0562140f0300b004702ed40a61si5688020qvb.547.2022.07.18.03.17.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Jul 2022 03:17:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=T7UPwhkw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oDNot-0001Oi-R6
	for alex.bennee@linaro.org; Mon, 18 Jul 2022 06:17:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDNmn-0008Jz-En
 for qemu-arm@nongnu.org; Mon, 18 Jul 2022 06:15:33 -0400
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f]:40912)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDNmh-0007ED-Sp
 for qemu-arm@nongnu.org; Mon, 18 Jul 2022 06:15:33 -0400
Received: by mail-yb1-xb2f.google.com with SMTP id k85so17271212ybk.7
 for <qemu-arm@nongnu.org>; Mon, 18 Jul 2022 03:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=58W0570Jka+/QTu+LKm1ttkum7tKXr80GanuQK2uK1w=;
 b=T7UPwhkwl3W5zjli0U2ynv8Eoi5T6UfeJQbj70yfsXTQalce93HIKEg36MAehfb/UY
 JT7Pisbw/d01mCkXcVSKm0KBZZRIMhOgfvD5pYGMvMKxaPIWJKYXb1Bsae9rLtjB4wkb
 DSalzARC2af53YA2Gf4wpniJnrSu0ZNx87iULzN6Hzy9wTEpyQnty0ifM3tMJNOON0/+
 yR8QGMZP4XPfbN4MDwsWM8mSxhHlw72m2n6vua277b3cWOecRDfuI7ZKcBXs/LLuDr2G
 gEFgHq3iapHN9v5uesfze1Am9lNYHatW4eWDQ507tih+HvYsLeL4qmEcu0qLb2fEPJui
 FjxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=58W0570Jka+/QTu+LKm1ttkum7tKXr80GanuQK2uK1w=;
 b=QGGq4KD6K7QIycCN1qnjwExocqzWTozC8FAkrPXDmzULxvh8/rpyhd1x/GFGPzQU9y
 fuoftIEJf6JXoKArDEFKaYbAnaYGzxstIHA3v3EgQcJT3X7lxCJIZ9DFi22EvGVE7gEL
 zHsnv0dEbMWb1IiS9d9XahL5k6JOHOWBkvm/BGZds7w3gAcsEGHPGNU1B9gy4T35AyH2
 kMunWbh3N2+lkGwddQ6jBew59Z8CIV/L/f29IjYwO/G37Hi3DJ8bkAqSoo4TDJYJ+zk6
 bHtCzpjyFl61foKeKXKKI31usA5zvhpuHl7bakmUVoplOVrWgP2suIvGvxJS6nypnM4l
 hZQQ==
X-Gm-Message-State: AJIora83d6al+9+7Q5Gn/XbjjwfnkC0xTk7wXkk8AtVobrkVOGGwcGvW
 qbwlLLSTztSwfp91CvM2ob+LlNWOeA+F7Kqm/XKYnA==
X-Received: by 2002:a25:d381:0:b0:66e:2943:1c9d with SMTP id
 e123-20020a25d381000000b0066e29431c9dmr25475138ybf.67.1658139317617; Mon, 18
 Jul 2022 03:15:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220713172010.39163-1-ben.dooks@sifive.com>
 <d2b2a868-4e12-35f4-40e9-5e520e07cb3e@sifive.com>
In-Reply-To: <d2b2a868-4e12-35f4-40e9-5e520e07cb3e@sifive.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 18 Jul 2022 11:15:06 +0100
Message-ID: <CAFEAcA9qngx_1BzF+THHqpp4OyiSa+Do7hPKwqZ1v=0psGXrWw@mail.gmail.com>
Subject: Re: [PATCH] gpio: designware gpio driver
To: Ben Dooks <ben.dooks@sifive.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Jude Onyenegecha <jude.onyenegecha@sifive.com>,
 Sudip Mukherjee <sudip.mukherjee@sifive.com>, 
 William Salmon <william.salmon@sifive.com>,
 Adnan Chowdhury <adnan.chowdhury@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uElJWEFuIupP

On Mon, 18 Jul 2022 at 11:05, Ben Dooks <ben.dooks@sifive.com> wrote:
>
> On 13/07/2022 18:20, Ben Dooks wrote:
> > A model for the DesignWare GPIO (v1) block.
>
> Is there anyone else who should be reviewing these that
> was missed off the original list? I'd like to get an idea
> if there is any work to do. I've got a couple more drivers
> to submit and was waiting on feedback from this before
> getting these submitted.


My overall feedback is: this isn't a pluggable device (PCI, etc),
so what's it intended to be used by? Generally we don't take
device models except when there's a board model that's using them.

thanks
-- PMM
