Received: by 10.223.161.27 with SMTP id o27csp848661wro;
        Tue, 24 Oct 2017 10:57:54 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+RZ7TWLUuVOXO4z6ngd3TfYbS9EEIfg0lXkR0bQCATZQuwBwHyTfRsLDmN2ewOFVKWwRLoj
X-Received: by 10.37.33.131 with SMTP id h125mr5083976ybh.520.1508867874083;
        Tue, 24 Oct 2017 10:57:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508867874; cv=none;
        d=google.com; s=arc-20160816;
        b=nN4SGObyQIEoCeolLKB3hv9VLdt9pM7/hobp+dzp6VqMdO1/NhGpPWrlxmFwUru+Do
         jNoPVQlOy1MWCqTX7MsfQAcdeTpkR8TkA5xzx2LB9sdn1op0KSXkiIUnF132PX9XcO6q
         e5AA2PVawC0CHFPgzcTMcm6qO7sIAAW8cnXIemKn1ZayswCTfBw2dfuKoH1ObdH2Aywu
         bLTzPohEVqqLiPKAoUQ5R+eZ+tN7WaB3Q/K4w5jCQalViJjatoD0OMp9OyCBWDjad6uU
         MUbUu+GKssYk4dgTm2ebjIrZs4J6E6AzvHuxoGz87ws8aONUdlz0fjRr28w550mx+nrL
         sI8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=scxLXsJoxxVhX7ZWfIROSH8jy67vEYlN7XSbLLpg270=;
        b=BNKAn1ljgWrd4Db8zWSQpqLbzGhKghajnxWW6dGU4uxmKeqNozs/5QcR3rXAaOjhwN
         gICm5j/9nxWTP8rD0aV1gPMayUgLtSfITlAwKEdiEAmqZuHnH7ydgaU5UEkiMuokNKSl
         2rDqqPA4aBGzUBOq5VF0FMSCzhCxrfNeiplGn9QwhY2qw6Pgnfk8glMeAEoVOGmz3fiQ
         u7tw7jDq7yRPV4D1hNsoXiFK7c6RyI6+576qHnwr61aSpv+QSbFpis/8Miu4kClnJWtd
         Nzv+0mU+c8mFnPib3hnyKy3LYHPoIu4IMM5r+umgS+ks6M2xyPGzg/uZDGS9drXqmnIf
         fJAQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@zx2c4.com header.s=mail header.b=iJmTmqGW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=zx2c4.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g16si119735ybc.693.2017.10.24.10.57.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 24 Oct 2017 10:57:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@zx2c4.com header.s=mail header.b=iJmTmqGW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=zx2c4.com
Received: from localhost ([::1]:45011 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e73Sb-00089B-Ik
	for alex.bennee@linaro.org; Tue, 24 Oct 2017 13:57:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44062)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Jason@zx2c4.com>) id 1e73SS-000892-Ph
	for qemu-arm@nongnu.org; Tue, 24 Oct 2017 13:57:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Jason@zx2c4.com>) id 1e73SQ-0004Tn-7z
	for qemu-arm@nongnu.org; Tue, 24 Oct 2017 13:57:44 -0400
Received: from frisell.zx2c4.com ([192.95.5.64]:43191)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <Jason@zx2c4.com>)
	id 1e73SQ-0004TP-3r; Tue, 24 Oct 2017 13:57:42 -0400
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c6704c79;
	Tue, 24 Oct 2017 17:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
	:in-reply-to:references:from:date:message-id:subject:to:cc
	:content-type; s=mail; bh=OcGsuoH1dtq8eG0pq0nFb3yafyQ=; b=iJmTmq
	GWYXYBviHY8lbHgvk/NTAtSPi8X7oL5wZO2tGCj6OFVsbtFqEraWOjQxwf+f2rcI
	L5klHLYPQrtIE/koh/8Lvufe3DQnE+PKIA3unq9tUEp18gq/Z9SsTV2gksiQtGCZ
	8nY/XOs71wMTTKsiQKQQz+Mxo2p0S31uVh4RTAhwKmpvHMoHBfv9XCZy1J+VMyX3
	y2h6E8G6yosG5uQWupK8eh3Hu0itQoXFleaWiGjEsp2npM2Dhsf+ieXPcH0G8PM8
	Cgy/ZWGf+rccRcg1owY7w0D6vjYPEs9ww3ZAqC93E9FNAl38sYmpIHlu5RBgaL2D
	mSurA8Z0rj07O8rw==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id a8498c7a
	(TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO); 
	Tue, 24 Oct 2017 17:56:08 +0000 (UTC)
Received: by mail-oi0-f48.google.com with SMTP id a132so38780138oih.11;
	Tue, 24 Oct 2017 10:57:38 -0700 (PDT)
X-Gm-Message-State: AMCzsaVh02wnI/CVzCp6O+dHf58d7t9kH2zQ51kpVHqUn+Yay8IcsHu5
	V/j3qcJ7pDdxxQk/c8NPjisW+tvsBh0YmPXKd3Q=
X-Received: by 10.157.1.164 with SMTP id e33mr10560055ote.469.1508867857593;
	Tue, 24 Oct 2017 10:57:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.74.41.205 with HTTP; Tue, 24 Oct 2017 10:57:37 -0700 (PDT)
In-Reply-To: <10e16ca3-175b-9f34-65e7-031b883b7201@amsat.org>
References: <20171023122719.17199-1-Jason@zx2c4.com>
	<CAFEAcA_PM5Fjx2Pk58h75p9vaZwFcusQdXuwy9tbDtc=EaoOJg@mail.gmail.com>
	<10e16ca3-175b-9f34-65e7-031b883b7201@amsat.org>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 24 Oct 2017 19:57:37 +0200
X-Gmail-Original-Message-ID: <CAHmME9qtBiuAEnkCeuMd7EdeZveTVa4UOf+AQhMCFye0SYJY=Q@mail.gmail.com>
Message-ID: <CAHmME9qtBiuAEnkCeuMd7EdeZveTVa4UOf+AQhMCFye0SYJY=Q@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OqYfHJsIiF2f

Hey folks,

In case you're curious, this is the kind of hideous workaround
required until this is fixed:

https://git.zx2c4.com/WireGuard/commit/?id=2456a56729f7247bf88476317fed0ac822a31e92

Please let me know if you intend to fix this or if you will accept
working patches from me for it, or if you simply don't care.

Thanks,
Jason
