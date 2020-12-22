Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp5297746lfq;
        Mon, 21 Dec 2020 22:25:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzR3toIHpK6xL9ZrpKAObtKyXnJJcIEsL/Wd+IpCvpTEje0mb4Y6Lmhpjj36OE5K5PEvbBj
X-Received: by 2002:a5b:908:: with SMTP id a8mr28346845ybq.11.1608618300752;
        Mon, 21 Dec 2020 22:25:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1608618300; cv=none;
        d=google.com; s=arc-20160816;
        b=t2y6wPfXCX0gYyy98usfrsVsTIsLlodSLla0Vzl/LiCQAURXz5tv9Xvt5D5NmDvn6h
         6p7hxZpmm70Q0MKXjIRs6X8lTGlvWNubk4M0sHlnwTehdcuyHCrLsvP7GR7q3Gr7v5d+
         BP2VeyD2GFq7d2zWVF/80+/Z/tmGPBRBvWK9JjWD70JcgO53OKFhyfFvV1V9BBop4cYa
         DbPJXCErfdx98vMUrDgL32QW+iQ2QVMANGRYEJQ20OHv0CZHDsLfH4c/SH/1275FQz5U
         nsGOrP59qh/3k7acDQpeOyRGMnp46ty6RljIg6gAljNBAqOx+ErTT2/ze1YXbLAA8Y9h
         YVRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bPREnBRgkVmHz+zTQ/EloTbSbySqIEzpLBn+48+d5Yk=;
        b=oThAwzjNR8BpfLMlS0d0v/PVq6YwUbFUfGBr9oZTrRtrgDOVnNKbZvGmNYGOhVB9th
         5f+ZVHHoFZeGburF8c6CfyOjZ5dCXPn7FPdMGETkxw5rdrXn9XBN6xi7S+ZQtNOTPGKk
         ozaFC5KxGWRjaV08lw6ewiNEuS8458/eKHI0aw2QJ/T5lefL1b3mZhLfoaD83414rHKS
         T0PtifvSvnA/iIO45KmSZeGvIqzcX0kWeJoRHvZzYISSo8PS4MpFuHtW8HKc66bcA2w4
         hx9nxj0+Ysm3eRtIWAhDmYxD5zkohq+VPgKvRPyn7PKUfcrf8vANN9VoqTEumqQ4lpE0
         xDTQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=bD7EIqzG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d19si18864755ybm.154.2020.12.21.22.25.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Dec 2020 22:25:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=bD7EIqzG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:38570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1krb6S-0004yx-6R
	for alex.bennee@linaro.org; Tue, 22 Dec 2020 01:25:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1krb66-0004af-6y; Tue, 22 Dec 2020 01:24:38 -0500
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34]:35246)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1krb64-0008S6-Px; Tue, 22 Dec 2020 01:24:38 -0500
Received: by mail-yb1-xb34.google.com with SMTP id u203so10862557ybb.2;
 Mon, 21 Dec 2020 22:24:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bPREnBRgkVmHz+zTQ/EloTbSbySqIEzpLBn+48+d5Yk=;
 b=bD7EIqzGnToXPd3ab/KlNIBtyQ1/2d7kOoUv4yma/jsDV9VacQn2AWse9wf1iIdoD5
 rVfthB+mgJ0aP1VMgBGkFXdA59MubaCv/ZZO4l5NYlUBn64H+pLs/3c42IdT3Kcl92pv
 xdzIG+XL4FWtpsonRRDkMaKPnUVKzR+ICHkMahEH9WM5P09qnak62QNYfrQY6WeGXZeV
 bhREXZSyngdLwFoP5YpOmYC0cONkNOWfS+bYKjwvc8EyP5WziHbRaRDmpP5s8Cdf2hvh
 spog0xrzp2abn4+piJr+RwtX0ctUFjsc+UvqUiuunSs4S7IqpD0VyLYBWOEA1zs+T576
 nhpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bPREnBRgkVmHz+zTQ/EloTbSbySqIEzpLBn+48+d5Yk=;
 b=pmBptsfHyXkOQQE0c8chLV5QJ+6HhY7NwX2BXLsvXDimvGzKJCTnMOIhpS/sBExRVZ
 6KLKSwbvQaY/YOyDJxNvOTNzz6JXOz4u9N5zcfxyLQSCebgjG76+IZsZHBpykb2iYdFa
 uBVjxOVrCV+fh59x667in709LtQZ7FrprWv+rRLHBQeotvdLrpyCQmjh8vHpGIWlfDU4
 8hbCHepcNM5F3yRzd9AVnJNFxNg07+w0q9O0vEMfzcnEETgBRzQeEn1Je5lFV1BVRN9C
 T/7T3rQeijoWFKKJPUM6seRB5QRuRG7RbYIQiZq+M/j7dPWSUlkCdrbiZx79DW9dr6uQ
 3mdw==
X-Gm-Message-State: AOAM532LUVSH8iL5OHn2Xmz4NuA+dPuJhUtOd7xWkCA3cf0Gjm2b69l+
 s1TPtg7Sltpr47DEPOY3bhqVyxwY1DA4TKJTlfE=
X-Received: by 2002:a05:6902:210:: with SMTP id
 j16mr27799126ybs.122.1608618274912; 
 Mon, 21 Dec 2020 22:24:34 -0800 (PST)
MIME-Version: 1.0
References: <20201202144523.24526-1-bmeng.cn@gmail.com>
 <CAEUhbmUtCvXCKoQGU9b6+UX1juChVfHkugODjo2psBnRw+7NTw@mail.gmail.com>
In-Reply-To: <CAEUhbmUtCvXCKoQGU9b6+UX1juChVfHkugODjo2psBnRw+7NTw@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 22 Dec 2020 14:24:23 +0800
Message-ID: <CAEUhbmV8gfgtb=hXwimhPfMHs_nJ24PKHLynydZRVkuM8njV6g@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] hw/ssi: imx_spi: Use a macro for number of chip
 selects supported
To: Alistair Francis <alistair.francis@wdc.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, 
 Peter Chubb <peter.chubb@nicta.com.au>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b34;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb34.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Bin Meng <bin.meng@windriver.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GMX2aRD2S7Jd

On Wed, Dec 16, 2020 at 6:24 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> Hi Alistair, Peter,
>
> On Wed, Dec 2, 2020 at 10:45 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > From: Bin Meng <bin.meng@windriver.com>
> >
> > Avoid using a magic number (4) everywhere for the number of chip
> > selects supported.
> >
> > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> > ---
> >
> > (no changes since v1)
> >
> >  hw/ssi/imx_spi.c         | 4 ++--
> >  include/hw/ssi/imx_spi.h | 5 ++++-
> >  2 files changed, 6 insertions(+), 3 deletions(-)
> >
>
> Ping, not sure who is going to pick up this series?

Ping?
