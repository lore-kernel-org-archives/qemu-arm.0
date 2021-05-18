Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp868386lfm;
        Tue, 18 May 2021 16:23:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwdZ4EP2K4+oVwByGSG23veFbYFEqzbuxC+hltygwoK+nLp4oUkzAaCtXJqBaY4h1TsHWOo
X-Received: by 2002:a05:6e02:12c5:: with SMTP id i5mr6963888ilm.101.1621380194062;
        Tue, 18 May 2021 16:23:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621380194; cv=none;
        d=google.com; s=arc-20160816;
        b=eHY1Xmgq65toaScZrEy2Rvf1ZA3goGQPPecfcSlNCbwqOCaobfLPF3RjBWR5ADVzGg
         sIBKiSAFAUEgNUGRUzdfkqlLQG+oMtloKY5orWNBUU5snzu/xdQ5oQlk/Y+HvW0a+JyB
         ToANWmB+Xw+aE4JQtrg1Ty8bXwh5TthgwtKKt9T1g3okr3ZluYOrXmXmWssWUgNFD+Cq
         WGpscn+um1953OOM/ekjJEvtJi9IiKeFPr5+bQfkcYCbJBx5ui660XNz1o5ti25hhWL9
         LnwKG5dsSU8sVNtyu3SO6srD2MF5GvIf6H5pKOBXBNpgvTxrk8qUHGtfMgp+sAQcfg9x
         Iekw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yRW11+DfV8i+sTJecDSffPwNpQNpP5szCPax0FOxgTs=;
        b=ElLIfQSCSoXlgYRMPbS+wYZKK24uetoBf804X8hLwjNy6PrGVW10CTqx9pEHb3ufWA
         YF0Iu86EhJaVz2XGCZ/wLdb9pHnJKXYfBkav5llOidedDqw2hnKAbV9qc1pKUhsTKqcA
         WBxUwIyBNKDek/BK1prMGdm+ACExDB3MSb5KLB9D2eYbuVWD/uIlJcBpIfAD3RfAWDW0
         KyIe1mI2lFDcPpn/rxLPCACCidYxQgH2Sak37nIhDDylvuf22zmm11sYp2EA9O+9EQ9Y
         kZzHY5KsigBzWsgPCC3poBIQHxmPG9aCVhsdzaTODKXWQ5jI53QQfNc35JAdoVhnZ24m
         36pg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=k1JGXW6G;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c13si23873299ilq.55.2021.05.18.16.23.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 May 2021 16:23:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=k1JGXW6G;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:50636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lj93R-0004gT-8H
	for alex.bennee@linaro.org; Tue, 18 May 2021 19:23:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1lj92m-0004fX-66; Tue, 18 May 2021 19:22:32 -0400
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a]:41704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1lj92k-00088Q-14; Tue, 18 May 2021 19:22:31 -0400
Received: by mail-qt1-x82a.google.com with SMTP id t20so8853030qtx.8;
 Tue, 18 May 2021 16:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yRW11+DfV8i+sTJecDSffPwNpQNpP5szCPax0FOxgTs=;
 b=k1JGXW6GztIWIgaGcDlFYghG14yITQmVokCYqI5AeRDKf/b36Tz0pgS+A1gxLA66qM
 0xsDfE9Cri6lBoY5cdMx+I8sMYnbDUynjdCPSWcgE69+MJv+sYnsrndGFm/8Bq8Q3Wb3
 bNmlpx5l0g9MmaZ7w7DklCmBK/kS8snuz5Wuo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yRW11+DfV8i+sTJecDSffPwNpQNpP5szCPax0FOxgTs=;
 b=qa7Z5ORf4AYebKZGCaNgvE0OHjyqEyeWqR66+n1+YqDrS+tRQAryP5V1OnAx4DphZk
 O+SC4IyXrX2SRkIJyC8hf/Qa0qmYhTiAmmMTdURmzm8V1uicrh9I3gmvRXFtkTLFT4kr
 nsWg7+3EQedGobXRDERTBa7ipR/3ba5z0iTlNfPQuMtWnngTGh7J6qoUnaZp8aspqDOR
 0ZkZhXVrzngFwTbCnTdy1KVtkRAInk3x0L9HKmVOxHJf9lNPYZTH9aBmD3GQg2/vo8/o
 uUZNNmO6RaBd/h7D9fsBu25qByTdJdtmjCx1l5Fksx7nRh5osS5A0ly099b01IJrDAxf
 3pcQ==
X-Gm-Message-State: AOAM531x2CF+nyCCPEd05aQrrF6zQpQT1zduFteFXKsM5X7QXyMpgMua
 vaCQhxVIXxdyGsTSib24g8VHHWIwyT98Klm4o/U=
X-Received: by 2002:ac8:5e51:: with SMTP id i17mr7922226qtx.263.1621380148140; 
 Tue, 18 May 2021 16:22:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210518194118.755410-1-venture@google.com>
 <20210518194118.755410-2-venture@google.com>
In-Reply-To: <20210518194118.755410-2-venture@google.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 18 May 2021 23:22:15 +0000
Message-ID: <CACPK8XdbWF0CpMyxpw=yoqS4xSUEjMgeA8JHhk5YvaFe8QBXdA@mail.gmail.com>
Subject: Re: [PATCH 1/4] hw/arm: gsj add i2c comments
To: Patrick Venture <venture@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::82a;
 envelope-from=joel.stan@gmail.com; helo=mail-qt1-x82a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Hao Wu <wuhaotsh@google.com>,
 Tyrone Ting <kfting@nuvoton.com>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0f2gHnIVt2z8

On Tue, 18 May 2021 at 19:41, Patrick Venture <venture@google.com> wrote:
>
> Adds comments to the board init to identify missing i2c devices.
>
> Signed-off-by: Patrick Venture <venture@google.com>
> Reviewed-by: Hao Wu <wuhaotsh@google.com>

Reviewed-by: Joel Stanley <joel@jms.id.au>
