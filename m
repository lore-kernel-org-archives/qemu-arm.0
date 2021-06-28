Received: by 2002:a19:ca1d:0:0:0:0:0 with SMTP id a29csp4149508lfg;
        Mon, 28 Jun 2021 09:27:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwp2w3s2WuDItDBLXs5HFG5oywE+OzKONiSljLkw8HRBhbf2EYzJejYPfz5shwDEmu/YhWB
X-Received: by 2002:a05:6902:1245:: with SMTP id t5mr33613913ybu.448.1624897621726;
        Mon, 28 Jun 2021 09:27:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1624897621; cv=none;
        d=google.com; s=arc-20160816;
        b=hlTKh4HrAE8QsM+fIAMAiec8mDR7obOAB42hZCTpRG/zZGSTbcgNaDVBuRykY9w97+
         aarQgUf4KydWdffLy73wZg8GDu84EKicYAEVMEVwi4xcaVpP2K2uu0xAXppvWpfynqCA
         ivp19voMfZTBg4/fZZJ4q9a86nXg1xS/LN8QKkQLk/DvptYS4UyHhAhYInKHxnGrrHZ5
         x+2b3jIAV+8dS3ZCq2/zxI9rPJ/DQKijWT3dJkk1xgosWmX4nEETb6W7ORitxs8Rh4oY
         KFUTpneH3YM9uqZRukGn4QqloKBw8hdbzd+8/yk2XD3iHT+j++yZbzyS0UTnrT8XBTsK
         GhxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5n590fBEpRMrKH6fJYWHH9IGuY38gH9hzq+B+1RgJFs=;
        b=TyeReTDUP8du8vMMUca2yYQm9F+iXfXcB5rzH+9DaFqBNVfJNwWu4ZC7E/4Kb8ATD4
         QCJsxLAr31wdq9jIoJQusjEo9jjLPx+TVfGHS4ifecsoZ48jAue31VMGGtdS0knOaMaR
         xcHHyU1Glgg9JgbUHdrY7nGmunq52pqn2HkyByLhsTI8SzZp7YDjc2NrWlFwF/qirPty
         lrZWQ+CQ/6vtfY14GPxuuHZuGzKvm3io97I47PNWmeAb3AeIKcjK5byUwVlTEmZY81y6
         6q0ioC2U0oobzK2pmNCk6OJVIGMOGpa578MWb6N5qvOEJ6bN6A27AUgFvutBh79KVdKX
         29WQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=v47LuQ+3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c4si13817323ybq.62.2021.06.28.09.27.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 28 Jun 2021 09:27:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=v47LuQ+3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lxu69-0006QO-2y
	for alex.bennee@linaro.org; Mon, 28 Jun 2021 12:27:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lxu5d-0006Kc-Ll
 for qemu-arm@nongnu.org; Mon, 28 Jun 2021 12:26:29 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:44702)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lxu5Z-00045D-P7
 for qemu-arm@nongnu.org; Mon, 28 Jun 2021 12:26:29 -0400
Received: by mail-ed1-x532.google.com with SMTP id h17so26732858edw.11
 for <qemu-arm@nongnu.org>; Mon, 28 Jun 2021 09:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5n590fBEpRMrKH6fJYWHH9IGuY38gH9hzq+B+1RgJFs=;
 b=v47LuQ+3FnGJ7P9XSyiAZbnmhOUDRBmahCZeQflYIFSdNIqLZ4J7B/dipF4VOHuAWX
 Z0jhCTIY6LHQsjRyRUxLX7XF2JEtJDqW6NYfYWj3ewezcXtIcesyJQ9dipPINz99r2O0
 AJBjFC1KAM7uK4EGeTCrCAt7FtxO7K4TKw8y8qU9Pv2wrbzbDUQkHwcd3WP0hLkzGILF
 jsANOXOpiBj1Gp2YNN8PH2wUIzRep/BQ/KcVuf5OgUwS4VEP51q9+iTNmEsAG0Ifdw1R
 GQga5qkb/eDvBPGmb32SKIR9eFnI9HL6QSOidxI8JYKouASkwQIZpaa+9fPdHBlRlyQQ
 J2HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5n590fBEpRMrKH6fJYWHH9IGuY38gH9hzq+B+1RgJFs=;
 b=BMl7jaVgT0ycRsW9/W0Zswn0vUPc7GWY3CqsvyaQkdca5g7mq2Tq/IzcbMwN9iDVYM
 xn/01Fp57AlPsPRfsN+DgUdMZSfLdlSLuoO1UCBlf+G6Oec/0xqdjYO5E+RJPAy7LQej
 8CI/mJay0jrNlmesCqK16M50ChpNgdRqtKSueVjysN4imy6Y8PI+z/e7pnnJKemeso2N
 ZyS/W2rVcIdvwkzwL7e+IQbPA8qkRqUlK0rRkVUIsRPLMpLDCwFqCRUttAkhyWAd+Mcq
 o9nRNLrqfhiGDVLhGWKoXqClHfxY10H1Jmxzo9a3k3+7wckCOQM5S0tXOynuPiejhewz
 XCJg==
X-Gm-Message-State: AOAM531EtnvzYVaZXMdHpAG+9pS0FR5Rn90OjmJ92thRkxsK+DP//E63
 eSwpBG7/FpJu44r+q9SEwuXEIG0vxDmqKq42w/md+w==
X-Received: by 2002:aa7:c857:: with SMTP id g23mr33257178edt.100.1624897583833; 
 Mon, 28 Jun 2021 09:26:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210615192848.1065297-1-venture@google.com>
 <CAFEAcA9mqyn6J-W_qiZ_T=JbsBuahZuLAXXc8c9ASarVASbg7g@mail.gmail.com>
In-Reply-To: <CAFEAcA9mqyn6J-W_qiZ_T=JbsBuahZuLAXXc8c9ASarVASbg7g@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 28 Jun 2021 17:25:46 +0100
Message-ID: <CAFEAcA8V9TegQbisBufg0CHooV-eDzE6Arvh-7H2wc2F_cRBXA@mail.gmail.com>
Subject: Re: [PATCH 0/2] Updates docs/system/arm to include new bmc machines
To: Patrick Venture <venture@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 QEMU Developers <qemu-devel@nongnu.org>, CS20 KFTing <kfting@nuvoton.com>,
 qemu-arm <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 33GOjE0u1pcC

On Mon, 28 Jun 2021 at 15:07, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Tue, 15 Jun 2021 at 20:28, Patrick Venture <venture@google.com> wrote:
> >
> >
> > Patrick Venture (2):
> >   docs/system/arm: Add quanta-q7l1-bmc reference
> >   docs/system/arm: Add quanta-gbs-bmc reference
> >
> >  docs/system/arm/aspeed.rst  | 1 +
> >  docs/system/arm/nuvoton.rst | 3 ++-
> >  2 files changed, 3 insertions(+), 1 deletion(-)
>
>
>
> Applied to target-arm.next, thanks.

Just noticed the docs don't actually build:

Warning, treated as error:
/home/petmay01/linaro/qemu-from-laptop/qemu/docs/system/arm/nuvoton.rst:2:Title
underline too short.

Nuvoton iBMC boards (``*-bmc``, ``npcm750-evb``, ``quanta-gsj``)
=====================================================


But the fix is trivial, so I will make it locally.

Passing configure '--enable-docs' will enforce that it complains if you
don't have enough prerequisites to build the docs, rather than silently
skipping them.

thanks
-- PMM
