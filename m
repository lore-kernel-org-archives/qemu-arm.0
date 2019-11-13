Received: by 2002:adf:fb8f:0:0:0:0:0 with SMTP id a15csp3424023wrr;
        Tue, 12 Nov 2019 16:49:21 -0800 (PST)
X-Google-Smtp-Source: APXvYqxJPUEvz7D4zD5KXZvW/tw7s832ySXT9YdmSO8zmrukhhb/szT1tewyxlMCgI2F7Gra9Ki3
X-Received: by 2002:aed:3222:: with SMTP id y31mr156296qtd.369.1573606161756;
        Tue, 12 Nov 2019 16:49:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1573606161; cv=none;
        d=google.com; s=arc-20160816;
        b=0vli8HYKdrIJwsDpRrO9uJvGsVkxxxStdmTgBEeyTNf3c2pIRMdpUYBf2Ia6Kij1lP
         gSjI2Tm8Ja2NGSE6xi2MBpbCzlnptFx/lXLqx6AqwYhbq+9fxg/SRpkS6rQvLaxBPtbf
         NHLft+dOqSWu3QqRrDBsbvJsBQs4gJ1YotrmatckrqakjUtB2SjLM2iqjzffJmTIW7Eq
         gHxsSkyQ6bygFex0ZeAY0b8LXxlHFcZnp/aQrMxNFBOsrkKiq9J1x6Gr59+EEZn1eBoO
         6CyrQaar/0Q5QPpFX1o25qWXwbCfHRGdxGWt9U0+L8HUdn1CzxSY9masuzB8o7KadfeL
         KSlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=AOkVMHRyugJ4RgUmDDq2Lvil/V/zcbkz/Fl3Cm26CY8=;
        b=zNeq7U2U7SBoiBflVrU2/TumiC0gOA/1WWlUAqtTu/S0Q3iyVosjGv8k//fy2uDv+/
         T1kyAqglLB2KZ5yzCwBYkYuI7tJSFW1zhoNL/uoIlAvyJamXjMtUro8x2DyxyXcQar+G
         R6rNv7AImGv/p1rjgIfl5Xle5PkcCUtZESAi+/YlSGpOQsJhq06VYonYoVywJmlUF0X7
         oCvxTcbt8RvQYC12bR5potd1mGofcSUr6JXmtKCAGgk9U1dc+ZrcOI9MTu6whAkVcPfS
         dfz4Ni4kMf+ts/plh+ra3hb7pSsxEU5GOwppB3xtAQrPtaGp8DGIi6ir9+UD7GXdVATt
         RBJA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=iC2rhEIO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k184si256766qkb.367.2019.11.12.16.49.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Nov 2019 16:49:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=iC2rhEIO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iUgqX-0000D6-5G
	for alex.bennee@linaro.org; Tue, 12 Nov 2019 19:49:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53941)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <joel.stan@gmail.com>) id 1iUgq7-0000Ct-5A
 for qemu-arm@nongnu.org; Tue, 12 Nov 2019 19:48:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <joel.stan@gmail.com>) id 1iUgq6-0004Hz-2L
 for qemu-arm@nongnu.org; Tue, 12 Nov 2019 19:48:55 -0500
Received: from mail-qt1-x842.google.com ([2607:f8b0:4864:20::842]:41427)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <joel.stan@gmail.com>)
 id 1iUgq5-0004Hm-I2; Tue, 12 Nov 2019 19:48:54 -0500
Received: by mail-qt1-x842.google.com with SMTP id o3so625519qtj.8;
 Tue, 12 Nov 2019 16:48:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=AOkVMHRyugJ4RgUmDDq2Lvil/V/zcbkz/Fl3Cm26CY8=;
 b=iC2rhEIOJNWHa6nElIEZvMtgjV0d4zk+7O1A+Dp5qtpvHAFUopr5WijaEfV6RM1HM9
 L8jCMn6ywg6PKSJRYo/X3NUUkG/jIssKlO6uG4QwGfSg3/BgU895RuI2Jm+10BffmwRw
 MnoZPNnLUgx0Hk1BmZ74RMJ8RcsqAbV9xznJY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=AOkVMHRyugJ4RgUmDDq2Lvil/V/zcbkz/Fl3Cm26CY8=;
 b=dSOoPcwf13cfn2xUVOvkZgvkQSA1iSqOO5G6xJiykbLzOqQgOL18FOzSr29C9BLY/0
 PEKGljSzJYt7PBaIvNufXCEsy0f6wITVzX3qSP29fKmBgYAPUSmYun8ljspSumCye8We
 IqrfAFWMrA+fiXqQkMr1yFrIQmI3xqjxy2sS/PlL1VHKvtukcMOr6+t9MewpMKSnmVbK
 PvcX8JYaYj4QAELETjQ1rejiRET3hS7/SxsZWWdOH2WrSirFUwiorvjwtxtHAs0hpDzq
 6GgVLlcuzCWHS5OZpDZZTWwnzNX5gpJl+FKSb+dYFuUi4/6MUwYAxGy/nHDBaQVZJqSY
 Dzhg==
X-Gm-Message-State: APjAAAVCc8hRmZFZsroFABhm6kkhmXT7xZWlKyXM7bLNM14o0Y81rhUZ
 Jfqy2KJz/nJ425XJX0bjXg8RDZxg7Wf6D2GjTAQ=
X-Received: by 2002:aed:3baf:: with SMTP id r44mr161628qte.255.1573606132783; 
 Tue, 12 Nov 2019 16:48:52 -0800 (PST)
MIME-Version: 1.0
References: <20191112064058.13275-1-joel@jms.id.au>
 <20191112064058.13275-5-joel@jms.id.au>
 <87e0a727-bfd5-a485-e986-e26fd4cccfef@kaod.org>
In-Reply-To: <87e0a727-bfd5-a485-e986-e26fd4cccfef@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 13 Nov 2019 00:48:41 +0000
Message-ID: <CACPK8Xd4wePHdeAVstq=JsrfV33QtBXVdhEAZDrQPcQRs=PAHQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] watchdog/aspeed: Fix AST2600 frequency behaviour
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::842
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
X-TUID: 3anKJlF6e87g

On Tue, 12 Nov 2019 at 07:56, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> On 12/11/2019 07:40, Joel Stanley wrote:
> > The AST2600 control register sneakily changed the meaning of bit 4
> > without anyone noticing. It no longer controls the 1MHz vs APB clock
> > select, and instead always runs at 1MHz.
> >
> > The AST2500 was always 1MHz too, but it retained bit 4, making it read
> > only. We can model both using the same fixed 1MHz calculation.
> >
> > Fixes: ea29711f467f ("watchdog/aspeed: Fix AST2600 control reg behaviou=
r")
>
> which commit is that ^ ? Did you mean :
>
> Fixes: 6b2b2a703cad ("hw: wdt_aspeed: Add AST2600 support")

Yes. Thanks for catching that.
