Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp196712lfq;
        Thu, 14 Jan 2021 03:22:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxN6NX1P48VN/AhIrOjoz/dE3ceOV3LeyjQBarVTwMtvJGDtOgF1tFk6V+2BVcaSH5YzQwM
X-Received: by 2002:a25:738d:: with SMTP id o135mr9752282ybc.233.1610623349547;
        Thu, 14 Jan 2021 03:22:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610623349; cv=none;
        d=google.com; s=arc-20160816;
        b=J3EXsFmJM2MKAN568MiAgLABJH0RNtHtjh24Tn1SdcPpoPtv/52zEWK87A6Mthw+WQ
         slQomfcopILePxpGQuafGmFGEddVpWJCi3GVpZVNaOufTlQXS7RLclDDwOL8R4sE2oX4
         vdOGBZEXsdDNmK+tr2Z4CW3H/H0Oy1rQk5CTQD+NZNfc6BEQPskdzb15OD5RoNqch35T
         7vmObf8/diuTKJkngcpdQKtmcgBp70cBcgvcoeGsn+1w5O99YZipLWpM3ao1WWdf12+o
         JcuAm9dS9o6L6XCq0iiTiSNYhT83KluuyPrK7Oa7aywjXeVEn9rnfLbR0K96NOKje250
         0zxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bqSs6bnwUDFbPW03XDcbH3y2U5MUEU7ogRQ0wBGoRas=;
        b=acJ5Sdxxhx4UTeAwHfpNzXCbAlXKA1uC7yHr0lWxiq7TFidGGebNdDHKAbFFXz9QgI
         JvFFw+iZrYw4S9wSpgnYL1Eyg+mBMbdboYgLxynm/3bY1r3ZzHz1dvUuuJEwfHcsnIvT
         4IZwScS+WOJOyf/JoR2zR7I1JqcrP1gM96diZMDJloa1M4YnGV2jtKjdHBIAKf87Z+Jv
         gEWRzLoV2RIoUzn2+Qi0EPyEN+QZBGTTWt6We9qO9yv/M2x2jZadpQ2ba4pIoKhGbcFW
         k9zFEKvVKbkZ0vudffcMOOLcZtUH0tsmUEppN4feXU68LUJpVDvMDhPMJ5Pg6fgjPr4J
         7+Cg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JHkEy4y1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x4si4836339ybl.257.2021.01.14.03.22.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Jan 2021 03:22:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JHkEy4y1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l00hw-0002Lr-S8
	for alex.bennee@linaro.org; Thu, 14 Jan 2021 06:22:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maxim.uvarov@linaro.org>)
 id 1l00hn-0002Kw-Jh
 for qemu-arm@nongnu.org; Thu, 14 Jan 2021 06:22:19 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:46519)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <maxim.uvarov@linaro.org>)
 id 1l00hj-0004T2-0H
 for qemu-arm@nongnu.org; Thu, 14 Jan 2021 06:22:18 -0500
Received: by mail-pl1-x630.google.com with SMTP id v3so2735235plz.13
 for <qemu-arm@nongnu.org>; Thu, 14 Jan 2021 03:22:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bqSs6bnwUDFbPW03XDcbH3y2U5MUEU7ogRQ0wBGoRas=;
 b=JHkEy4y1YLdbGI+T8Szc3wHwKBYQNpye/EUdCRvHDp2nIktvm8eFVJKLTwbhKReQwh
 ldcRyGeIjIctyQ0Q1kRiHjvf7MW6lDAprhjdTL4+JTHA1GSx5tQ0CMj08EfQClykw3Bu
 /L/roXyesVO/qGgjcM5oeJ35GmnloqzS+QLpydQyaGQVF1r1hyVrZD8LA0URmCsATAli
 WHxXl1gT9OJh/wPkPKdq0G5HbaV6t5MyLAVOABfdYku8g4xv46Mo6AP5Ey9gfbpSoQj6
 XwW4XluCOjYkx8bd5HSEEs8YFMsI6zCvWMjbUCoLJxjl09+ATRS4FwxgNhFLu8t+HG3D
 wyHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bqSs6bnwUDFbPW03XDcbH3y2U5MUEU7ogRQ0wBGoRas=;
 b=t1/xTVfmfrOwo1U+EvvNuUwSy6Zp8jpaOiMrVwmmbf1Tig2SsAAMAEmksC2awGsIa3
 0kGynMGDiKttwmIHDvwW7CK7UVGJtsD0pbVvbDuF83xiqLICfBTy5WPw/MNH9MmmssKv
 hXAYfg18iQID1Nhzg65S0apDDDrHmVUdBxGDL48A4fx1b6xHMleDzWujV/uwx53K2vd6
 ecubhQM98ilQDXDl+npi2nPl10azMiOtF+pUceO4c3HOwmNS3pZi4hBccd/rLuvsHlkD
 LC/0O8RpXE4Zabw2ZtlysJdOlJkP55hS+upc9TMkHHkEZe5YO93sjC0SH9ghAjaiPMPw
 eDPw==
X-Gm-Message-State: AOAM532xQivvBdIjgNeXABRrmhY9RgIXqlGJpgpeKxxP7snu8g0QnClI
 jrWCNOOzbgWUfKFqGi9l4lvGKj2FhaF3yhhNDtCd1g==
X-Received: by 2002:a17:902:6b45:b029:de:2db8:fd34 with SMTP id
 g5-20020a1709026b45b02900de2db8fd34mr7104600plt.71.1610623330688; Thu, 14 Jan
 2021 03:22:10 -0800 (PST)
MIME-Version: 1.0
References: <20210112143058.12159-1-maxim.uvarov@linaro.org>
 <20210112143058.12159-3-maxim.uvarov@linaro.org>
 <20210112153542.oqahdubzeoipyvun@kamzik.brq.redhat.com>
 <CAFEAcA9O2kHpcvoofo0v3ahXNOQtw8cxaVC2hn+AjpH6A9RciA@mail.gmail.com>
 <20210112162526.ob7eroamrdlowfyr@kamzik.brq.redhat.com>
 <20210112162847.wik3h24isg4cmgyq@kamzik.brq.redhat.com>
 <CAD8XO3Y3sgZ3VXh7FhfcvvTckE2EUebivQ1nUnqTud2ApGUh=Q@mail.gmail.com>
 <20210114000445.mg3xq2nq7kccbvjy@kamzik.brq.redhat.com>
 <CAFEAcA96=ZjZyhMcpTSDvrHKXZY-uOUoQSi-jTbOLpFZdnkMuQ@mail.gmail.com>
In-Reply-To: <CAFEAcA96=ZjZyhMcpTSDvrHKXZY-uOUoQSi-jTbOLpFZdnkMuQ@mail.gmail.com>
From: Maxim Uvarov <maxim.uvarov@linaro.org>
Date: Thu, 14 Jan 2021 14:22:00 +0300
Message-ID: <CAD8XO3Yxp6rcNgNRJ3+d8zEsYyS0myYs=rSNKtw849fEmdT+RQ@mail.gmail.com>
Subject: Re: [PATCHv4 2/2] arm-virt: add secure pl061 for reset/power down
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=maxim.uvarov@linaro.org; helo=mail-pl1-x630.google.com
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
Cc: Andrew Jones <drjones@redhat.com>, Jose Marinho <Jose.Marinho@arm.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 tf-a@lists.trustedfirmware.org, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LZhD4k9ys63m

On Thu, 14 Jan 2021 at 12:50, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Thu, 14 Jan 2021 at 00:04, Andrew Jones <drjones@redhat.com> wrote:
> >
> > On Wed, Jan 13, 2021 at 10:30:47AM +0300, Maxim Uvarov wrote:
> > > - the same size for secure and non secure gpio. Arm doc says that
> > > secure memory is also split on 4k pages. So one page here has to be
> > > ok.
> >
> > To be clear, does that means 4k pages must be used? I'm not concerned
> > with the size, but the alignment. If it's possible to use larger page
> > sizes with secure memory, then we need to align to the maximum page
> > size that may be used.
>
> I think we should just align on 64K, to be more future-proof.
> Even if secure software today uses 4K pages, it doesn't hurt
> to align the device such that some hypothetical future 64K
> page using secure software can use it.
>
> thanks
> -- PMM

Does that mean that in that case you need all regions to be 64k
aligned? I mean secure and non-secure.
Has anybody tested 64k pages under qemu?
    [VIRT_GIC_V2M] =            { 0x08020000, 0x00001000 }
    [VIRT_UART] =               { 0x09000000, 0x00001000 },
    [VIRT_RTC] =                { 0x09010000, 0x00001000 },
    [VIRT_GPIO] =               { 0x09030000, 0x00001000 },
    [VIRT_SECURE_GPIO] =        { 0x09031000, 0x00001000 },
    [VIRT_SECURE_UART] =        { 0x09040000, 0x00001000 },
   [VIRT_MMIO] =               { 0x0a000000, 0x00000200 },

Maxim.
