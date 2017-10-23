Received: by 10.223.197.9 with SMTP id q9csp10603171wrf;
        Mon, 23 Oct 2017 07:14:38 -0700 (PDT)
X-Received: by 10.37.160.5 with SMTP id x5mr8310674ybh.129.1508768078000;
        Mon, 23 Oct 2017 07:14:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508768077; cv=none;
        d=google.com; s=arc-20160816;
        b=1KnapF7NbtOh4KEe7CjKaQNJO8g366QFFmPSTFfX9piqcz0u2i24HlJPEUfSck2/i+
         FBUto4Dr5mJYUEBXm+ww1f23Lxw8eMbSokhHXolBNB9+il47HM3G6B2fe1yjSQNSp7XP
         d035JR1PPJnrSgqk55KX/RCbpnFCL0o3/QRkeeyMqKMeelGFf4Y+LGxRb8ndas3siLWF
         Fy3F/4DhI6ghCnjCXGC2idGfRxNsLYIGLlTtD09xRwargu6hJZwzCdWj6KL7nCgDKjOC
         aYMxlp9nAIe5QKLzbJtw5EMOIw87Ou6JjCS2S05F0p9PbhmvrVp2uQDBoVydJmylQtZb
         IoyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=ThoSSvk1q561VPHjauyw8+W8HxEhTsWQCx9u7hF5ISo=;
        b=b7IT1Zy9c1o7l6G6DW+7yuF/lonNB7PRNHHLduh+ntHGWeNWiamk5hJREKN2WJ7EUd
         +xlINyJpgTyHQXUB8007fUsmvosxp/F8NUGLertzcWrUxDitL+QfIK5cSzmCA+U/Fnuq
         c6M0dO5DcxHYDoRf1JHJvdwABq/IYBOPE1wGk9NQnicAIB9a4yOzuR3uPkZa8Hl8hf5E
         gWKhgV4l313kC3lCc6LtTtUc80+Q1slCz+NYd4YKuAfolGA2CnCpeMFIN06/NoLtr6WI
         33uxCfnuFCNPmtIJn9pTJ4Qw+4oFXIx5M8SyW7wUv84mz2cK9jLX1HsPJrqx54oVA6J3
         UD3g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@zx2c4.com header.s=mail header.b=l44rHMw0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=zx2c4.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c142si1309398ywh.641.2017.10.23.07.14.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 23 Oct 2017 07:14:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@zx2c4.com header.s=mail header.b=l44rHMw0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=zx2c4.com
Received: from localhost ([::1]:38990 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e6dUz-00082o-Dv
	for alex.bennee@linaro.org; Mon, 23 Oct 2017 10:14:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39485)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Jason@zx2c4.com>) id 1e6dUk-00082O-DO
	for qemu-arm@nongnu.org; Mon, 23 Oct 2017 10:14:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Jason@zx2c4.com>) id 1e6dUf-0006XY-MM
	for qemu-arm@nongnu.org; Mon, 23 Oct 2017 10:14:22 -0400
Received: from frisell.zx2c4.com ([192.95.5.64]:34545)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <Jason@zx2c4.com>)
	id 1e6dUf-0006X5-HC; Mon, 23 Oct 2017 10:14:17 -0400
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9458a592;
	Mon, 23 Oct 2017 14:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
	:in-reply-to:references:from:date:message-id:subject:to:cc
	:content-type; s=mail; bh=ABjAIV+qCLCFCVk6Xv5CqAGBfXU=; b=l44rHM
	w00VzKPSv4VrT4Hfs5lZrWVN0e3t+WnZrQGNtayRU8IbYtSFb2E9qGE1kfrqyEWo
	YJQwcjbVVB2gvMz/Uq3fIW8sD8RRJNbnV0IRkNw3G8Naicu3dUY6NWgYH+gO1JC8
	OHD7cFh0W3GcTP0ClnaGBy4QmvGvCucXWEleAH7rxrSyZ9pFoUXLORn6VX9pRMFn
	2dcMKrr8AR21r0itafttMCA6u6oHD5wm5XPBNWV/m+vi1r/6OZQvlTAH4FCX+AAr
	tLYxISlPDTJS8fCtVv2+B4YkyZAfrin83mQtlS5qAkvb+qsZ7l4uqSo7fLmkHouQ
	wZD6VTZ0B7r4PZ9g==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id ae8dccd2
	(TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO); 
	Mon, 23 Oct 2017 14:12:54 +0000 (UTC)
Received: by mail-oi0-f46.google.com with SMTP id m198so30909069oig.5;
	Mon, 23 Oct 2017 07:14:15 -0700 (PDT)
X-Gm-Message-State: AMCzsaWXm+KVNadH1XDBcbNea/K6TkwkZAqkTlI1G27bZhby7eNQz7C3
	4jKtHIMAR4lzX2DIGHSK4Nra0nRDtbQqjVg1eFg=
X-Google-Smtp-Source: ABhQp+TXKOXmyh61xloDH/rw9uSf/LMx9TXbfa3iS4TYfBJK7vqBGSbFUYzqTTTymly8n2JHqxoVvHkyCXJYtQbAysY=
X-Received: by 10.157.26.107 with SMTP id u40mr7422964otu.182.1508768054811;
	Mon, 23 Oct 2017 07:14:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.74.41.205 with HTTP; Mon, 23 Oct 2017 07:14:14 -0700 (PDT)
In-Reply-To: <CAFEAcA_PM5Fjx2Pk58h75p9vaZwFcusQdXuwy9tbDtc=EaoOJg@mail.gmail.com>
References: <20171023122719.17199-1-Jason@zx2c4.com>
	<CAFEAcA_PM5Fjx2Pk58h75p9vaZwFcusQdXuwy9tbDtc=EaoOJg@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 23 Oct 2017 16:14:14 +0200
X-Gmail-Original-Message-ID: <CAHmME9oMPg1LS6tB6RDUPxrXzTxdp+ZsVsbT9pLSd9QvX5S0vQ@mail.gmail.com>
Message-ID: <CAHmME9oMPg1LS6tB6RDUPxrXzTxdp+ZsVsbT9pLSd9QvX5S0vQ@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 192.95.5.64
Subject: Re: [Qemu-arm] [PATCH] hw/arm/virt: support 4 serial ports
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3fjH+yy1gpjW

Hey Peter,

I really do need more serial ports. Two, actually. I'm using qemu on
build.wireguard.com for CI. I have normal output come on ttyS0
(ttyAMA0) and then if it's successful, the final step is writing
"success" into ttyS1 (ttyAMA1), so that I can confirm with certainty
that the tests succeeded. In other words, one channel for text output
and one channel for control messages. (And I really really don't want
to use virtio or PCI-based stuff for this.)

So I'm extending the CI on build.wireguard.com now to support ARM and
MIPS, and things are not very smooth in the ARM world.

Jason
