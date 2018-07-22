Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp4983347wru;
        Sun, 22 Jul 2018 13:47:30 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfgUdYl1d9IhbhaeeZcdYxLzoGsALlMRSOF4fpdbQkWurXBfRh069dituY3ku7u+4aNMTTO
X-Received: by 2002:a37:a0c8:: with SMTP id j191-v6mr4949142qke.375.1532292449925;
        Sun, 22 Jul 2018 13:47:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532292449; cv=none;
        d=google.com; s=arc-20160816;
        b=ybSKcXJpQWe2jHdmXkiD65Mtr9pZrEuxQM6OLLupehZFmSbJsJe6sd9N+vIAg9nc+w
         lcj7hzQzcJvb9/3B3e9C1QAb6iqpLuOjxo2Qs7I9HDKhvoV9EYYuDDBaU6JZVFob7Pa0
         KAHO6O1m3Fp95d4XERyjHpPVeZuRgY/S2ajl3RCIRdxI5eqJ+Cf8t6FrreOLorlW6XSR
         LFJejNQTQ+nYEHJvF5WknzyDZn+eNYeRum6HqqjZshT655r2oi1YIiTqINtWN7Zb8GI+
         b01JJvpcJYGnpt+ZQfAN8YJrnv51E+FbudXqVOj4m6zHLLRcbaMNyjl6FJWMdxAMEl9F
         dthg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature
         :arc-authentication-results;
        bh=qwI0p6EmsLR8E1XRPl9sMuP34bkPit1lzQk+pZA9xwM=;
        b=VHDNpPRUY7WkATM7FTpA2PeKk09VXABlW9cbpQQwTWJ0aTttBHPV8H0QgjJYKx3C6q
         14x74ecDHaw0lKXydeS+dw5gJPD5E0WHWUArp+1Ge9O31/7qjKmxl/bpYxg3BVMtjIFz
         VSPqINjiah+beSdXHl3v+oAK8fetfhkIOAed3/6q/DW2IhgohC9mVgXfcH0KfAlrAR3Z
         w0Gh6ttQqspgFLE5LyrHLQRq20nY6iRY+kLMMMAB2ONjeKp9cFB/ruFNEFFPMeCFTTjm
         PlnMOn79Z71Gl6hGAuROi+edBf6coYF/xQ/uUDJm981rVUrXqBPzLBuLYqM+XR0dbJ33
         R49Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@zx2c4.com header.s=mail header.b="Hrr5/Q7r";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=zx2c4.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 92-v6si4681238qkt.368.2018.07.22.13.47.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 22 Jul 2018 13:47:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@zx2c4.com header.s=mail header.b="Hrr5/Q7r";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=zx2c4.com
Received: from localhost ([::1]:57443 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fhLGL-0001jf-GV
	for alex.bennee@linaro.org; Sun, 22 Jul 2018 16:47:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46042)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Jason@zx2c4.com>) id 1fhLGE-0001jZ-7q
	for qemu-arm@nongnu.org; Sun, 22 Jul 2018 16:47:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Jason@zx2c4.com>) id 1fhLGB-0003WU-62
	for qemu-arm@nongnu.org; Sun, 22 Jul 2018 16:47:22 -0400
Received: from frisell.zx2c4.com ([192.95.5.64]:48331)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <Jason@zx2c4.com>)
	id 1fhLGB-0003WM-1o; Sun, 22 Jul 2018 16:47:19 -0400
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6897ec91;
	Sun, 22 Jul 2018 20:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
	:references:in-reply-to:from:date:message-id:subject:to
	:content-type; s=mail; bh=gsfTx0cOMOUFRNvp+0f23bRKHOQ=; b=Hrr5/Q
	7rIvZ2UJ8eFzWcT0xI++WjujNV7BiDia4ZQDgvycDcfYB4twE5dHCV4sAmSlVFoA
	MUC14oaMHu6LrsXgIRH05J3tX4EnlLpy4zAsLIGeJ7H2Rj7ne8f6i4L8BR4D+BZv
	J1rMXssmXIOQOHN7O/7pY0LmV2i8QuPWY+ba81GIzY98gf4FTLqHk5fw0jOfgyyr
	BDVOcjUiiWO8EDsmPn16RgXkCC64Q6+/at0kHAStsZFRluefKbLrKd1GcXmrrV/9
	YNIMZCk94nyFaL4JzIIhI40b70y0Ax8Sm7GBmd9AcZYJQDsijQAdGOkYVEUtT598
	cVjxIDvpNy+kgefw==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 91df0e48
	(TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO); 
	Sun, 22 Jul 2018 20:37:07 +0000 (UTC)
Received: by mail-oi0-f41.google.com with SMTP id n21-v6so14399627oig.3;
	Sun, 22 Jul 2018 13:47:17 -0700 (PDT)
X-Gm-Message-State: AOUpUlEbwzYm2b8wKmW+Yvp6toPNdh17PrIPR8g59SlZzSvLsZJVONE7
	KuB+/yb9LjHbUShT9fxiNZs3A7kjlnAFdovidYw=
X-Received: by 2002:aca:bec2:: with SMTP id
	o185-v6mr6789004oif.22.1532292437405; 
	Sun, 22 Jul 2018 13:47:17 -0700 (PDT)
MIME-Version: 1.0
References: <CAHmME9q8b0Nss8b7DEoGgqoCK4dEvasQN64QWx6Hio+N92wuSg@mail.gmail.com>
	<CAHmME9qX22YP9qrHErc43Z+LUi=ichqzG+OdXqjhJv4ZrKDmWQ@mail.gmail.com>
In-Reply-To: <CAHmME9qX22YP9qrHErc43Z+LUi=ichqzG+OdXqjhJv4ZrKDmWQ@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 22 Jul 2018 22:47:06 +0200
X-Gmail-Original-Message-ID: <CAHmME9qMASSt2K4vACJTMiGNTt09upRhNFxL_y2KF1G3N1LB2g@mail.gmail.com>
Message-ID: <CAHmME9qMASSt2K4vACJTMiGNTt09upRhNFxL_y2KF1G3N1LB2g@mail.gmail.com>
To: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 192.95.5.64
Subject: [Qemu-arm] ARM64 STR Instruction Crash Regression in TCG
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: C+D3inW1MeJM

Hello,

Gcc 7.3 compiles bash's array_flush's dual assignment using:

STP             X20, X20, [X20,#0x10]

But gcc 8.1 compiles it as:

STR             Q0, [X20,#0x10]

Real processors seem okay, and qemu 2.11 seems okay. But qemu 2.12
results in a segfaulting process. I'm pretty sure this is a TCG bug.

In the attached tarball, please find kernel and run.sh. Calling
./run.sh will start the kernel with the bad bash executable that tries
to execute `config=({1..100000})` and crashes. Also included in there
is the actual crashing bash binary, in case you'd like to disassemble
a little bit.

This is affecting builds on https://www.wireguard.com/build-status/ --
as you can see, at the moment aarch64 is failing.

Regards,
Jason

[ attachment: https://data.zx2c4.com/bash-qemu-arm64-crash.tar.xz ]
