Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp5662490wre;
        Thu, 31 May 2018 01:33:24 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKLM7X9p72XQAgYEnrLoizKfUxZ3gbBaYKrbZ59OzhCjvhYhWIf2CAhG7wB56Oo0Ul7zNYiM
X-Received: by 2002:a37:6e43:: with SMTP id j64-v6mr5443362qkc.216.1527755604253;
        Thu, 31 May 2018 01:33:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527755604; cv=none;
        d=google.com; s=arc-20160816;
        b=qjNXHA0roqUgqzEgaKU2GzuwsR1ZcsD8ui4TgsrZLv2aeqcCkWTl40c6bUj0z8OVEZ
         ggSp+aVWJZL7JmDbXvjAgynS13f9zNjYryK8DovM2xQNy/Kva/Omb1Xic1qz7ag1vw3w
         LqgTnU33zU3FD/K+aOywR92k8OJRj3iTXILKrBg4HFSfQTmDciOCiXwrpp1C/z8LtlDH
         WLXGmvHCe6TJyEfieltZ/2Kod0tb8I+lAWISPZEHU9EdxR5jV4vl80upqQ6HlN6TdfFr
         WIPWXFeNRiuqNNEdWT1miK561rAazoPDCTzYty84XbtIYh2mxrlEW3gwHZP8CpOwnMRG
         o9Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=rNIWm3eGmvEjFUH5pi7dLPXIFqiFyXhhi6R8eM5mTIY=;
        b=hfpNrub48s6n2Bi9RypYH69f1AeJ/kI4gKRe73QxehAphmUPvlptj4uPURm0IdOoyx
         ueFaQpHrfqc4h1+I6wSps0aXSySgipDJ9EmUqx+jzsilvxcmFN+qQEHz1tQRwBazi69U
         WXPMvJM1YKm+HrsqpGNF9k4nXtdX1a8e1EEc4jggnlUat9vTQ6iDpd5M5xOOVuFW5D84
         0ese2w9kjlPgHCeqtzRGhK6ZaoiBbOfh6rajuSucvlje6OsBcMgSjkMCK4cs0zv+j0H1
         PtZJ/+JEyK7s6nbQq6fTCqZHHxio1U9Yfe9JQddLWg4qrzBPWS4LOehe8/6G1oqbLXwK
         91kQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Qcx/0n98;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 22-v6si1279457qkz.388.2018.05.31.01.33.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 31 May 2018 01:33:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Qcx/0n98;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42610 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fOJ1P-0000ZA-OJ
	for alex.bennee@linaro.org; Thu, 31 May 2018 04:33:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42409)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fOJ1G-0000Ya-D3
	for qemu-arm@nongnu.org; Thu, 31 May 2018 04:33:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fOJ1F-0000ZV-Hp
	for qemu-arm@nongnu.org; Thu, 31 May 2018 04:33:14 -0400
Received: from mail-ot0-x244.google.com ([2607:f8b0:4003:c0f::244]:33971)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fOJ1F-0000Z4-53
	for qemu-arm@nongnu.org; Thu, 31 May 2018 04:33:13 -0400
Received: by mail-ot0-x244.google.com with SMTP id i5-v6so24415627otf.1
	for <qemu-arm@nongnu.org>; Thu, 31 May 2018 01:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=rNIWm3eGmvEjFUH5pi7dLPXIFqiFyXhhi6R8eM5mTIY=;
	b=Qcx/0n982YG0X/rfpjqtGcP6ZJbqxVYQorHB+mgv6juAtpc5JgEg8FmOWujT33YwrP
	uwJ7QuOXowNhC0UFS9SR1ljQUSR3dmp7ZcdVh9RbVtwuA8/7KRygAeV4EuxrmNc214Sj
	bAivKBfQzpif7QYnH0UFsJ1PwURYdBhTUDGh8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=rNIWm3eGmvEjFUH5pi7dLPXIFqiFyXhhi6R8eM5mTIY=;
	b=PQExpGaWGYckePfyOmVx8f2SI0Aox2R+bQgSyDL5iJkzv5u0bjHZZWZNFyn44iX7zA
	rB+W3WAnHV22fh8VXn3ne4a/tHZGQ8LsimVtjWaffvk5LVxk6c86qGTtf43h0Ic06bm/
	CUIzSktxPVeo/XJ5Xh/QkuTL99IxIVSn+VirzCUDUX6qTpLfV6rNze6tEwXEgGemvbIZ
	V6yNAMcRN2IKfmZtWsbsn8OnoWKYyljoDzMsQdZbCYFUxJeVemORm2VDM8H6l2LfSEsM
	YZ2GCaKy2QYd6mgo0oH4mBaiOKADljYWNTweWwSp/GhjqW/7c4AZKB/tH4GiQ2FgmRma
	iV6g==
X-Gm-Message-State: ALKqPwcIxZeGf+5Oie3RVok2u8AlwJFqsulUFdK9CgfelYChPrsP8UCE
	c2pVHbgEThnt4PBxmOf9PwYL6BchW1b23W1RoBgw5w==
X-Received: by 2002:a9d:2371:: with SMTP id
	k46-v6mr4278469otd.210.1527755592363; 
	Thu, 31 May 2018 01:33:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40d3:0:0:0:0:0 with HTTP; Thu, 31 May 2018 01:32:51
	-0700 (PDT)
In-Reply-To: <CAHmME9oda=T6C53BYi-Op3cWbG2auBjVDoUWuiJoCyxxR298fQ@mail.gmail.com>
References: <1512745328-5109-1-git-send-email-peter.maydell@linaro.org>
	<1512745328-5109-3-git-send-email-peter.maydell@linaro.org>
	<20171212144513.sutjfenbjh33fm5n@kamzik.brq.redhat.com>
	<CAFEAcA-DyuObZjx-g2k9SkofLZ_akadfGYZCMum=3hQQLEdN_w@mail.gmail.com>
	<20171212151605.v2eoestysaogzymm@kamzik.brq.redhat.com>
	<CAFEAcA-t7XFxizUQMdo_JYTLet_a8ZL-Omg54gLOQC-=o+vjuA@mail.gmail.com>
	<CAHmME9oda=T6C53BYi-Op3cWbG2auBjVDoUWuiJoCyxxR298fQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 31 May 2018 09:32:51 +0100
Message-ID: <CAFEAcA_Ut0hjQ=25anhHtGgyY92++eTgyBwY1KbqRbLUeje0Hg@mail.gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::244
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 2/3] hw/arm/virt: Add another
 UART to the virt board
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
Cc: Andrew Jones <drjones@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Shannon Zhao <shannon.zhao@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mE4Uv3LKRkCn

On 31 May 2018 at 03:12, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> Hi Peter,
>
> What ever became of this? I still really could use a second UART in
> the standard configuration. I'm still building with this cludge --
> https://=D7=90.cc/RXI3ssWV -- in order to run the test suite on
> build.wireguard.com.

It stalled on the fact that adding the second UART breaks
UEFI images (annoyingly, UEFI iterates through UARTs in
the DTB in the opposite direction to Linux, so if you add
a second UART then it picks that one to use rather than
the first one, IIRC). So it would have to be an awkward
thing with a new machine option to request the extra UART.

thanks
-- PMM
