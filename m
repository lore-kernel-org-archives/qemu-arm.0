Received: by 2002:a19:ca48:0:0:0:0:0 with SMTP id h8csp120402lfj;
        Fri, 14 Jan 2022 05:23:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyVw6aeRlWh6auOkiL0oOgSsodHpfjBaiMv9MbEu5y0JuNHCuJy2rL9zjxzXinn5eMYOfTM
X-Received: by 2002:a25:a086:: with SMTP id y6mr12800002ybh.724.1642166613653;
        Fri, 14 Jan 2022 05:23:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1642166613; cv=none;
        d=google.com; s=arc-20160816;
        b=aIUr5PFxX2Hs5MY9fr8jfftdk2tzoumy2CzTYBuYdC8imtUd8bw9QpD8trvyNP7NIZ
         xiyx9kmks3t+bYkcXSG+OTV5NXwKBFpl9wYtyGfkfIw/3plDmEjOG2s6PE/B3jlxiOWV
         dBKrpOghFdyHtRhzNNnqUwajScK2NLHl9F7MX6MUbf0pMsYaq1iVc4VAARLZXglOQfm3
         qCbw3iAmz+lU0u/wqfbPRWuZIAwpGZmqtp24Besg3R/gn9z9Ro9YSNvCVM2396Dxm7s1
         0lXbIPedI8YIXNvJVNRpGz5bW/APYQfAeUJRZ2TN4ysP3xzZ3iEozfwvrRO/Ox+X93H1
         l05w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3S3a7VZSa5E/IeRCSnQQDKJDEvgVGD/GAjWb0Gpgr2I=;
        b=tePcgPiFQKAy1Tu8ax61U9dJ+w33LF+bMYxjfqpWhlUDjKZTryk4/pMBVjCeEre/13
         Nbs7QDvN8+7smsn8AzkiJTCv5wlyaxyXw/T0GbV/9o+a7i9YX2GDiVIPaMRPFGJAda2p
         QkEW3+AlOTKeOeMVH8elndmNvt/I1dTTacVGRP09bvsZeNBwtT8JxX44GxUiLhgIae7e
         kIuVUvhTpZwHEplJYXG5Bg80ZEGD0Vpq7q4Z4vKoCSn7yYgReX771cApPoQ8S3hL14kA
         AqGQPnHuTpJwHz/JdbhQtkyJZPt9rifUISXHuRcrj9NEgas0XylsW1uIQt52SQGpXecS
         nWCA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XpWoT2f1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v190si4027435ybg.795.2022.01.14.05.23.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Jan 2022 05:23:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XpWoT2f1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1n8MYH-0008IU-0n
	for alex.bennee@linaro.org; Fri, 14 Jan 2022 08:23:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n8MVo-0005xR-Og
 for qemu-arm@nongnu.org; Fri, 14 Jan 2022 08:21:00 -0500
Received: from [2a00:1450:4864:20::336] (port=35716
 helo=mail-wm1-x336.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n8MVn-0002fV-CV
 for qemu-arm@nongnu.org; Fri, 14 Jan 2022 08:21:00 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 q9-20020a7bce89000000b00349e697f2fbso6704601wmj.0
 for <qemu-arm@nongnu.org>; Fri, 14 Jan 2022 05:20:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3S3a7VZSa5E/IeRCSnQQDKJDEvgVGD/GAjWb0Gpgr2I=;
 b=XpWoT2f1KNwpRq+L+5zaaa5cWDOdMN06n9XRQC6JLFtxC18Eqr2AUWpXMILKsw6inc
 yAhx3oS/xJHJJVQiI1sCSr49s5Fg7Pf0ag4cVTuo2gsQUzsB313HTAK4HscRqlDSPHYH
 2ut3+H/5IiOn3PjXGK6Kx3+tgL5MaEJwU3Wr9K6pwf2GTUdODtQ5SnrdKx1sxvE3l43j
 kOR0daaBt0a/GNDJzIto9f9tr7jRnkcPggjoBWyXO64eWyLE7XZ26xa0Gin2CVV+evSW
 xiRxY4Fmjjzb6/29EjnErg4yIwS1xEHLZ6Ram32EDIzIt544g0rAUnBgJ92pMw0KBk/L
 MzkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3S3a7VZSa5E/IeRCSnQQDKJDEvgVGD/GAjWb0Gpgr2I=;
 b=i4uE7CLVLqabs7FXVJkxaAw6BenhH9nRlDS8roqOoRUtouYRV51i0IVfl27i+DijCh
 DpVxs+NVprAcIFhgqAMr9LZ8QzMwaegMxS7VTWJtE80c06pVwyZBMbkFi/Imkd0dk+e9
 5i99d2VerIM2lwLAtLHownZhprEGwI36Ru5L3+FllK4+OMN8xq0gt7jnAQdw4DZKIfI6
 iPo9bBDdfc7AIStQXqhpR+MFW6BKMV2vExVznL4i6anRm1Mf3uqoQBYMTGxoKhcsgxlM
 i+PWK2OuaYDPpPAe31AVjmT6uS86Fcg2wtsXFqwIkWQ2uIxzZ5xi9IOS4ftT1XWNl4Ij
 MrFQ==
X-Gm-Message-State: AOAM532daMOlt4ys3y3EUaXWCzUr50O/0BSMYeauVye5fwwLAx203Mw7
 27tQXz7hdndacGzEHlkhqe+OZD2Ix0ZuzYKDtRDNmA==
X-Received: by 2002:a05:600c:154c:: with SMTP id
 f12mr11899500wmg.126.1642166457779; 
 Fri, 14 Jan 2022 05:20:57 -0800 (PST)
MIME-Version: 1.0
References: <20220113151916.17978-1-ppavlu@suse.cz>
In-Reply-To: <20220113151916.17978-1-ppavlu@suse.cz>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 14 Jan 2022 13:20:47 +0000
Message-ID: <CAFEAcA8KwD6q0sv2WMCXCpiSXTSB0U_=AyeDCGW0h=y6d9iK2Q@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] hw/intc/arm_gic: Allow reset of the running
 priority
To: Petr Pavlu <ppavlu@suse.cz>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::336
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, petr.pavlu@suse.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YtFG2ztquQqW

On Thu, 13 Jan 2022 at 15:19, Petr Pavlu <ppavlu@suse.cz> wrote:
>
> Thank you Peter for review of the first version of the patch. v2 splits
> the changes into two commits and updates the code as suggested.
>


Applied to target-arm.next, thanks.

-- PMM
