Received: by 10.223.172.38 with SMTP id v35csp1142812wrc;
        Wed, 20 Sep 2017 13:59:27 -0700 (PDT)
X-Received: by 10.237.56.137 with SMTP id k9mr9332685qte.189.1505941167246;
        Wed, 20 Sep 2017 13:59:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505941167; cv=none;
        d=google.com; s=arc-20160816;
        b=WcblNeCO9jYKzDGVO/1aNEbiczigz3AqodljmcCpgX1e167+fDadhDh9ohpLjNmERQ
         SO/SS39JrGXZC3FBfSKF0YslTsV8VT4vnTgc28ug5JfE9AQ+yNkJxR3YSzC4oIkABGxg
         r2hQiDrP314uWCZZozhrVKIBem5+S1G4OQkZYAogL5o34Dc0Uq3LBHJ5TiChSB/qjyqr
         YmEqMWbWWug8Ot5MYOjieXjF7UX5/vqsUdMqX0P25dha627vQVn3DYtCoFOq9RE8cqhH
         la9FSxYT4CdA8RLib09OljRlXD8aWChQs0SJFKkgm4vgg0mlag0fn4AGtNqqOyBjGoBD
         ZqPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=eucO2KCI05C+4hS15M1slkBXO4G08hyYhz7Vao87KrI=;
        b=bEwCRyHp+iC0O8ZxN0sBwRYm25Of0lhc79Akh8kfvjKLDBf22DJ6PWjNcBT4uP49uT
         d7lQNHENmK4wzGyke4XU4yEnzcRk+1XRAM/NCIqpESBGwiLVQM6UyKHafhDSTSCO07P8
         l6evY0tZjBOA+yRWav+S4HPc7EGT18xsUdYICQJ8DBXCIyyF75gAT9/RrgrP3cpcbw9h
         HNGVJ6Sn3tV1dLGP2+VcchH9XiUly6qfK0CV1tKnymOHr8WNDV1nQLnbh6mo6eK98+UC
         a/N9XxE8doHqHIzY2r2MzhY8luMyRCePiZm7Yj2g7M7WotguAYUkDKus+3McZODVwuT1
         vm3w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=aPTbLhv+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 6si2567402qkk.104.2017.09.20.13.59.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 20 Sep 2017 13:59:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=aPTbLhv+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50646 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dum5d-0007eJ-24
	for alex.bennee@linaro.org; Wed, 20 Sep 2017 16:59:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45525)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1dum5S-0007e0-SC
	for qemu-arm@nongnu.org; Wed, 20 Sep 2017 16:59:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1dum5P-0006W2-Ok
	for qemu-arm@nongnu.org; Wed, 20 Sep 2017 16:59:14 -0400
Received: from mail-io0-x235.google.com ([2607:f8b0:4001:c06::235]:44978)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1dum5P-0006Vd-JX
	for qemu-arm@nongnu.org; Wed, 20 Sep 2017 16:59:11 -0400
Received: by mail-io0-x235.google.com with SMTP id v36so6595153ioi.1
	for <qemu-arm@nongnu.org>; Wed, 20 Sep 2017 13:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=eucO2KCI05C+4hS15M1slkBXO4G08hyYhz7Vao87KrI=;
	b=aPTbLhv+2Qh9eYeJL0/45J9iVNE/NRpDJd8DM4va01if9xSNi1+jnwwc6n4ULePxHz
	ottvlfJ3xw7K4DuB0zM5dgU7A+/x3lTRz6FGMSY32gJbicl/JaKI/tQW7yIG9goEAHJt
	vUM9PG624ed5M5Az1/3G8u5ShyGd2zRrIbX9I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=eucO2KCI05C+4hS15M1slkBXO4G08hyYhz7Vao87KrI=;
	b=oVnwB2PtlfGL2yfSpo1M7MhZkxpuUU/8gDiW/77L3CFoneBdwEaLvzeSNh2NfdK6jy
	dTu2t+rBQcvE6gQesVZXP4gogIicpyNksGkAnz9Yr3/PD061NdxywC/naZ33JCCTJ9sC
	UMgfjiQF58c5ChsRJTzpFCeIWgQ1Ds3SJ7dYMwvZSL7IlrJ40gbxIWBgVGwz3TjR7Qjp
	yl4HHrldIHhEwn8rNxe4uG/16Vq5Jf5Oyfnp90QX3ARmKfw6vWtjDpNrMyNrtr93UfwL
	IYyx0n06FiNCFcbSAU/29O7ypNNRJBDpWbb/FAYa8eD+BQHGO8Mw/mFRavvP0kc/QfA5
	CA+g==
X-Gm-Message-State: AHPjjUhHdx1BPYGPT0G4b34jYf2P4QkCDyobN+iF7a2TLxmojCKz0YGO
	R+C/FCBqRo3LpYhIoQo4KjwtoA==
X-Google-Smtp-Source: AOwi7QDQT8vd5i71pPpBFivDr+06Bh31OWRM8/t8+xHSr/FbuVpTO+KH5eyRLSrGC3qped6CIUCneQ==
X-Received: by 10.202.218.69 with SMTP id r66mr11866oig.250.1505941150615;
	Wed, 20 Sep 2017 13:59:10 -0700 (PDT)
Received: from bigtime.twiddle.net (162.189-204-159.bestel.com.mx.
	[189.204.159.162]) by smtp.gmail.com with ESMTPSA id
	h196sm2584105oic.51.2017.09.20.13.59.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 20 Sep 2017 13:59:09 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1505580378-9044-1-git-send-email-peter.maydell@linaro.org>
	<1505580378-9044-2-git-send-email-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <fe0bb57c-6e1a-000f-e838-ec141ff3c063@linaro.org>
Date: Wed, 20 Sep 2017 15:59:07 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1505580378-9044-2-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4001:c06::235
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 1/6] hw/arm/palm.c: Don't use
 old_mmio for static_ops
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7p7P9F8GOYrm

On 09/16/2017 11:46 AM, Peter Maydell wrote:
> Update the static_ops functions to use new-style mmio
> rather than the legacy old_mmio functions.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/arm/palm.c | 30 ++++++++++--------------------
>  1 file changed, 10 insertions(+), 20 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
