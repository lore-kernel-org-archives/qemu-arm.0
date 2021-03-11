Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp229343lfg;
        Thu, 11 Mar 2021 04:09:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxVvGgsKFDuzjkEans5m1EjDEJma0QkUF62POTZkIdkjBTNdLlsjOq+GSgY4ghp7hHtMZCc
X-Received: by 2002:a05:6e02:2149:: with SMTP id d9mr6316021ilv.75.1615464584139;
        Thu, 11 Mar 2021 04:09:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615464584; cv=none;
        d=google.com; s=arc-20160816;
        b=n0fVIlhKLZeRwGGVY0VCtgZt/QJExY3i4beSeMsmj0pbL37ec2G5yR+tuXPcEseijN
         3yWu7OeAj7bvp4VaMgGPdYAP43YYkXF7hG0sj2UJw6taXpjIyTPRrsIqThByXFv5rlCC
         20bN68NDpo0xUk6DtGVgCX4t/1FYOQGfefXSAOSmxFm1SU2foZJfHTz+ZaibeB0ed/12
         bulBqjNfo3kGelrhTkzVkCZVbwXhdwFCIUki8jcn4a/7f/+aZKLA0O6xeqwxnljxidPP
         LbxdVIOekAZFzQ3OVxsY5t7dLU2Qsws1BF9+DqaTtDmtOc5A5d6NbPpKhMY55jwEOlXi
         TQyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=InM5Ul8/R5Z3x3QWyfQ7yVu/DSyjbnIlDrDBDgt6Qrk=;
        b=N2wnbenX1LkidhqT6pfPZBY0jPgDJyjV++N64y4EgKYIYlEi0U488Ut7rpJS+ubJbC
         NL+zYdFrrZoIiRyg/PicB4Fgkec/SOhMjcSir1c5ebkXAdu5Spm2nD075RJPp3cGQk/+
         CEjkKFip5Jf5hwgMznXPJfoyIjOueNeC1yE9AL1wXiPX1o0brPLjVrAzYTQfs6e4C9/P
         E9b8fVUhD7hZONiaHp0wHItu+LjNpM0oSGpd7EZnoNfK4sNR8L8vyHd/xsjl5GZ7oFNU
         MQ8Bu+PfMd0TimAodhzJH0p56yYiMuXzY2xebK5dRt7QcB96KWsUem3inziQgGNK8XHM
         MLCg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QE3lZUHB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k4si2695323jad.114.2021.03.11.04.09.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Mar 2021 04:09:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QE3lZUHB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lKK8N-0006Tq-Dk
	for alex.bennee@linaro.org; Thu, 11 Mar 2021 07:09:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKK8A-0006S8-FU
 for qemu-arm@nongnu.org; Thu, 11 Mar 2021 07:09:31 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:44378)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKK89-0007Wu-3x
 for qemu-arm@nongnu.org; Thu, 11 Mar 2021 07:09:30 -0500
Received: by mail-ej1-x62b.google.com with SMTP id ox4so30108510ejb.11
 for <qemu-arm@nongnu.org>; Thu, 11 Mar 2021 04:09:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=InM5Ul8/R5Z3x3QWyfQ7yVu/DSyjbnIlDrDBDgt6Qrk=;
 b=QE3lZUHB5xRAiYbfsE4Zz0qOXrM2fPBp4fzTcPXU39C/H8eGHHcZ6JVCjvKp9v+Y+C
 OmOOwWv19My+qa8AXSCq6Xec2E4lZFDj0MyjOoGFe7TD5UBP/T9uVA8VHoLSYG3WCNsA
 k7z0zOM/a5eCsuZVBen63S/szsYwsG/mH14/PXYAoczfidTTJA2ziRS/xOA2Cznvh+6k
 a8UvKVHLq2VI28cSg85ZCyg22Z4px6mDGoKnK8hLhNsvROMAekQQCezRV+dfPRPkyi1A
 iHwlsAZ07JKYlIRGKYMg3JLc8C9oess+/RAKpIj4/znEkCQM1QDmv61nChO9VRpddPvJ
 8Kvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=InM5Ul8/R5Z3x3QWyfQ7yVu/DSyjbnIlDrDBDgt6Qrk=;
 b=P6PAGB7+i/r7VyqEM4tLD6PXtvaorItsdePlr2B0h+QogwmOdcTFCIFMEGLKqnJIBt
 KTj3Q3Ulycf4otYUTwlTlqll1PpOH4ugXN5Oe8mP6poNY1PBmqhYmZFsFVbJGX5v7hnk
 xOrBTop3oJiN8WwnM8R5MNwLzG9YVPySPmhGJhNG58iIXMOCl1Oi8pn9W+pCR9IfHkdK
 0cTPqbN8W3TNymvjBCTnG11OfqXXE/B6R6Ptv1XpniIzuE5JtQmeNfNK0Dlu4PnuxPIw
 jWGlackM6r0DBv+cIcMwruqLNEKKpcM5OXkTk/KYHLd7f/xHOGtCIkNBO9ZrZhF4FLFV
 rtbg==
X-Gm-Message-State: AOAM531t+mWBUXp8yhbFExP9ScsiUXCwbjA536BPgR34fA9botWn7FBg
 WdG+1eaP44csPkYWCpqxr/uFeK1tnAMK1U4QGf11Og==
X-Received: by 2002:a17:906:b14d:: with SMTP id
 bt13mr2743410ejb.407.1615464567635; 
 Thu, 11 Mar 2021 04:09:27 -0800 (PST)
MIME-Version: 1.0
References: <20210305183857.3120188-1-wuhaotsh@google.com>
 <20210305183857.3120188-5-wuhaotsh@google.com>
In-Reply-To: <20210305183857.3120188-5-wuhaotsh@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 11 Mar 2021 12:09:09 +0000
Message-ID: <CAFEAcA_Pe9NG4oDD+bp7=-TonBqH51GcnEF8gCkfGxHQBLFc8w@mail.gmail.com>
Subject: Re: [PATCH 4/4] tests/qtest: Test PWM fan RPM using MFT in PWM test
To: Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Patrick Venture <venture@google.com>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 QEMU Developers <qemu-devel@nongnu.org>, CS20 KFTing <kfting@nuvoton.com>,
 qemu-arm <qemu-arm@nongnu.org>, IS20 Avi Fishman <Avi.Fishman@nuvoton.com>,
 Doug Evans <dje@google.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9V6Uiy0W/IlA

On Fri, 5 Mar 2021 at 18:40, Hao Wu <wuhaotsh@google.com> wrote:
>
> This patch adds testing of PWM fan RPMs in the existing npcm7xx pwm
> test. It tests whether the MFT module can measure correct fan values
> for a PWM fan in NPCM7XX boards.
>
> Reviewed-by: Doug Evans <dje@google.com>
> Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
> Signed-off-by: Hao Wu <wuhaotsh@google.com>
> ---
>  tests/qtest/npcm7xx_pwm-test.c | 205 ++++++++++++++++++++++++++++++++-
>  1 file changed, 199 insertions(+), 6 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
