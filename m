Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp116553wrg;
        Tue, 18 Jun 2019 19:08:29 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzs7kDIoZQUGPMVNytiAP4fahlVfJRWtcbYpVCoiIbGatVoPynDSJZ+1leB+8u5AdDxbIbY
X-Received: by 2002:aa7:df93:: with SMTP id b19mr52036976edy.153.1560910109364;
        Tue, 18 Jun 2019 19:08:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560910109; cv=none;
        d=google.com; s=arc-20160816;
        b=LU7MTelZX7E35/ZNyWEMLVPh9029e0LKDBLwd/aJiRE5Mzad3tdYzsIQcopE9vg+3s
         6JGHrbLYarPvymYvycAmdRKaUB/CQewJ/DBaE22ci8LMdYpJFaSUuMubrPO0E+IMu6C5
         TYM2R4FaWJt3R2zvRe9h/LbDUZP1DImy7g1ZV0yJjSrN8Naeq2N6nZa9plT0H30zNsTY
         M+9pSHeiaCXPPbeOncVM7bE+67RInYpcUPBvzAkSIiJtMpv5JlS58F6w37pYO2o958vx
         haDWKcIByRa3NCkMWgO1xnmrwK+K6pPKmrB1/ZfW+vQykaC8imYIPkqXc/1NlBFNSppv
         7dCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=m3czvhaoTG0+MCLm8ymZq4lnfK4Emrrjk2yb8cqFdVk=;
        b=svfrcFo6VVyAEanMMcy0leIPZYcy9hvtx1XEIPxqAklgoSeN/gMF1ONineKWy3KI2h
         fIAQ3gFApeh9h/4StlhXZkFJrpBHTGfffa/rL0syUXICNj1ei2MlI3ghI6sqIpT4aH2r
         ojuWMQx0fvQYejVHRn85qvhmbqm0zJnYX134mH/TC7s7gSQRSKP/V+4dtYS4KdqKQEo8
         qXGEK+30QMwYVSraf5a6khh3TOPrVBdPIbaEcL8pDXQqYSOuh9NPGU9ZidZjPLxvBwen
         khLMINrVWBf7gB0qYa0ZTYAxR4nfn+KY2snddbZvrk28sli8MNfgusAb4Ejjsn67L1Mi
         u9CQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=Mc+8vWXW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m21si10039605ejj.380.2019.06.18.19.08.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Jun 2019 19:08:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=Mc+8vWXW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:34620 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hdQ1U-0005WR-GF
	for alex.bennee@linaro.org; Tue, 18 Jun 2019 22:08:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33124)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <joel.stan@gmail.com>) id 1hdQ1O-0005Tq-Ht
 for qemu-arm@nongnu.org; Tue, 18 Jun 2019 22:08:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <joel.stan@gmail.com>) id 1hdQ1N-0001Kx-HX
 for qemu-arm@nongnu.org; Tue, 18 Jun 2019 22:08:22 -0400
Received: from mail-qt1-x844.google.com ([2607:f8b0:4864:20::844]:45384)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <joel.stan@gmail.com>)
 id 1hdQ1M-0001Js-Oj; Tue, 18 Jun 2019 22:08:21 -0400
Received: by mail-qt1-x844.google.com with SMTP id j19so18006270qtr.12;
 Tue, 18 Jun 2019 19:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=m3czvhaoTG0+MCLm8ymZq4lnfK4Emrrjk2yb8cqFdVk=;
 b=Mc+8vWXWcGXsj6ihIdIlEoXMsbtbcCpJZ6qQ0IrmlPVILqGjxcwc99FNs77q4JcVu+
 pEH7z9ZKXSjAz6JjrbQLDxhZtk7ed81iW4Q3wft+Ot7HVtl0Z3jTF6KDnQW2jt9ZQjMo
 QhrSyzjpFsaeJEyNHCSuueKZip/bDf0wCgLAM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=m3czvhaoTG0+MCLm8ymZq4lnfK4Emrrjk2yb8cqFdVk=;
 b=dfv+C5JhJ5TLgj3vO0jsgq0+7NxJuFhwgEHm9a4DjUbZUPE/6VKsXMBz2Z5mE8tNP3
 jwEi91ZushSV2QLmtatF2/H86Vq16V9QdYkqF0Xt7yiPIDbw9sSEziczAgnFTgIIlaKj
 oIKuySUwtYZTSKINUhpAmoRKem0Fx7nDgvWbuY8X1MlGOJguNkeGMLlKO088XFtKB26n
 XEwuxRD2WpJI9zV6jQ20aG9mQREb1RsdKa/DQ843WKXPLmxg9hzZqQ5cGE0EuZSURx11
 NwKSZaKjt2D5eBZDhetjir1GQ76EVlk+ZvOdXK7Gu4UJMbUbq/SvNqS/yilQcZWmxmGH
 uqbA==
X-Gm-Message-State: APjAAAXD1840BgZxGJOvSVZtDrFm9oYEAqxvoVnrq1g0sXaSaB7h17DW
 fnEtQshvysKSMCwYLnXMGDu7RilzGVOKepxRM4A=
X-Received: by 2002:a0c:ae31:: with SMTP id y46mr31269961qvc.172.1560910099165; 
 Tue, 18 Jun 2019 19:08:19 -0700 (PDT)
MIME-Version: 1.0
References: <20190618165311.27066-1-clg@kaod.org>
 <20190618165311.27066-22-clg@kaod.org>
In-Reply-To: <20190618165311.27066-22-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 19 Jun 2019 02:08:07 +0000
Message-ID: <CACPK8Xdt2GJ5RWVhu-YjOfNVyX8OWAk_kAKNhEpobtTYLw5pZA@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::844
Subject: Re: [Qemu-arm] [PATCH v2 21/21] aspeed: vic: Add support for legacy
 register interface
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yArlZGH8dmFP

On Tue, 18 Jun 2019 at 16:55, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> From: Andrew Jeffery <andrew@aj.id.au>
>
> The legacy interface only supported up to 32 IRQs, which became
> restrictive around the AST2400 generation. QEMU support for the SoCs
> started with the AST2400 along with an effort to reimplement and
> upstream drivers for Linux, so up until this point the consumers of the
> QEMU ASPEED support only required the 64 IRQ register interface.
>
> In an effort to support older BMC firmware, add support for the 32 IRQ
> interface.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>
