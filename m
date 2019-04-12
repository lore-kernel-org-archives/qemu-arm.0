Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp12448wrx;
        Thu, 11 Apr 2019 19:20:45 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxcLfCIBEbA4oMUd7UpK+4gQmy8BwxG+1vvG80oBmYJhxZUyVsOkSdkDJci17yEXnjMCz6Y
X-Received: by 2002:a7b:c301:: with SMTP id k1mr9122130wmj.37.1555035644961;
        Thu, 11 Apr 2019 19:20:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555035644; cv=none;
        d=google.com; s=arc-20160816;
        b=yXO2AA4vdElVqAZWfbQERrctQrdOQlnXA2ysINP5bzipnxbISTUIWt6ehuXN9NCmfz
         bIqFlS7jkD1dCMykPS71u3FkP0skmR2mAN+JT18+1or5JAyzpviH0HPQ00joMvJAULsf
         pdc9I/ArVVERoMeIY6/cLSLPLzWhCdFmVLXoNlTOjRTLWCPDr1JTWX+RUqafPu0vJ8bt
         Tj34afhpAC51eClA2r9YcZ77q/1NYEfXbL6EFXsMznXUbQQT7zXTq2UkAXMroG0k52L0
         Kelp4qiwZy70dzDLhyvAdGhM2LI/+2eUqRbkxHEa0yttGInLG7r3vuw8lZd291qNJQsy
         XgpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=h97nWi3+85KRZVmwmBh08erEhytlaUh5C0xoa7AcHhc=;
        b=RF6UUNWCAopkaFAg7eDJ+/hlAYYKLC8m/NlgVIVhDZQ2mQr3DTTwK7RK/rPbKbzC8Q
         edktH5dAsrqHyL5XTcTElQ4Q/cgAX6tCz5yY22EPVHJqV+3UUwKRZVLu0l952K4Cd7qu
         GEvvyoJYtpJQ3/TTHkE1B7R2Hxckk+nTW+UmEIgEUea9/9U2Jr7Kx8rvO8WVxpGbzBXx
         LPflB3kpg6uZouEr2+k9JZPui1slydZpeMcfKo+8tbIfquOHvI+NY+oQXDrdXJAWIqxh
         +CXQu2ct0oVKnm+NQCdRg9hhFsdU6vcL7ddF2efPkdkJL/Gq/FgWDhAgrTEAkosq+9cU
         uAAA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=SDat+BxH;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u9si25228815wrr.310.2019.04.11.19.20.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 11 Apr 2019 19:20:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=SDat+BxH;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:57639 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hElo4-00015X-2n
	for alex.bennee@linaro.org; Thu, 11 Apr 2019 22:20:44 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43383)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1hElmV-0000S8-KM
	for qemu-devel@nongnu.org; Thu, 11 Apr 2019 22:19:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1hElmU-0001qa-RK
	for qemu-devel@nongnu.org; Thu, 11 Apr 2019 22:19:07 -0400
Received: from mail-qk1-x741.google.com ([2607:f8b0:4864:20::741]:40783)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <joel.stan@gmail.com>)
	id 1hElmS-0001pc-VY; Thu, 11 Apr 2019 22:19:05 -0400
Received: by mail-qk1-x741.google.com with SMTP id w20so4769302qka.7;
	Thu, 11 Apr 2019 19:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=h97nWi3+85KRZVmwmBh08erEhytlaUh5C0xoa7AcHhc=;
	b=SDat+BxH+VfxEV2bupoDS4eEqA47FuoDRqaaHYE+K5QdulutALrDIPepb5ZfqpBy4p
	JTxgBQDd1w1CiGzqrgycuDhJ1p4czMiZSjJsfUkkcNm6Ug4bKk/vJy8plnRA/kyc/Xe8
	HAx2WPUQHB/CnqXgCqBnki89M8+nIOdBnxm2s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=h97nWi3+85KRZVmwmBh08erEhytlaUh5C0xoa7AcHhc=;
	b=Evv5g0YUZ3LRjJQ5N80mJLn70yW24L9WTfKwlJ2qvyTxEF0QhhrgRObB1w0OYwP2eV
	Y+3o435Zsh4i6Ig7eRzdLL1GQeOTcqNAK3bspEhNoI+wcZRNAaxfsPRfqdKus8D/5/bx
	2YJODWJVdU/8+TtT10AEhkSGiljGzOb5zJFTkMkTlyZvq/aUx+/GymlIGQReZWUGngcc
	iK6/dP5/kTIUo3VnlKV61qQixb7jYqx21TpOX/DYVvMW7q9c/U+QrJjPEGALlrdSS7VA
	SWvhT2/XK9Qgoy3ExxMy4CNcjTVkOv2QjzXiYLKuavjMZaZ/WDauJ6ZI8hMCIrsWGDof
	o5JA==
X-Gm-Message-State: APjAAAWsaOKSH2GoOSHoC1dtwqvRHP6biEikUZlKG2ZrCPeaRjmEY40F
	U4b+txN5gG6RPlqfEwCz44DPC3nU/iURy3b8Ljc=
X-Received: by 2002:a05:620a:16aa:: with SMTP id
	s10mr40824787qkj.305.1555035544383; 
	Thu, 11 Apr 2019 19:19:04 -0700 (PDT)
MIME-Version: 1.0
References: <20190411161013.4514-1-clg@kaod.org>
	<20190411161013.4514-4-clg@kaod.org>
In-Reply-To: <20190411161013.4514-4-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 12 Apr 2019 02:18:53 +0000
Message-ID: <CACPK8Xfk7KP8SqsWHkBeuoxzDUJTtNAAdKsz79KHHHHtD8jUpg@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::741
Subject: Re: [Qemu-devel] [PATCH 3/3] aspeed: use sysbus_init_child_obj() to
 initialize children
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Fzg9WZshzhha

On Thu, 11 Apr 2019 at 16:10, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>
