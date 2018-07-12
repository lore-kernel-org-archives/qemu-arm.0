Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp1557183wrq;
        Thu, 12 Jul 2018 09:21:28 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpcsZBj+PpE4T5FXj+KL89QBRZZ4Rs6FSoISOYRFs/DK9u2Gc78sMAsXHy7KUltaDYD1hkV2
X-Received: by 2002:aed:3f1d:: with SMTP id p29-v6mr2410487qtf.320.1531412488163;
        Thu, 12 Jul 2018 09:21:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531412488; cv=none;
        d=google.com; s=arc-20160816;
        b=QxnXXPOdxsmpWSbK7aJc0UFbekWipUB6jcW7Fg22kMJffZoCRcVg5HQeJZcYFc3Vw+
         rB/oecdmjHtM17F9y1oYQ3KbOV61BErriwVO59NJfrmN4I+2DSKA3avuj68vkal1zX+o
         VDPZWrxVGwROR/UFuGGpll7OFlsdK86kO7ir91pAMXiV/T8wy6YDM+dS+KiqjH1mFjRN
         VwlQXxj88JN7eMCLXFaL8abWWe4r5jaNBIdTBCTD3v7Vs6AP7mrjL2qSAaRIiBVIk04b
         MJFk/X1nmMU6EvlWpO4b0xif/6n6kmkYWZ0atSMsLD7z4T2Z3+/M5DeZRn+5lL4isrH6
         1Qfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=4xpRK9vUfvVfinjgiqVxJ9D7PGneHr4aCDPSSoLVXZs=;
        b=rF20PIbfjxEDC/RxsHctjM1o8wFPulOtYLnUs/jGKlbCxpgWAOGW/vM6zv1RW3X4Vd
         ZrW37grgUkGJAoVrbBL28k6C7hQR5cRMUC5lcPwVjJ7T+7ZkfmIqtgQfh8r10TNYm9EU
         TAXaSqsdBuuB3da3qdGIDHrwc+NOcTxlbX/qOVOFDXv6TvF2nB6b0911qViaPbIze3WO
         3JTa78C9Tqj9MMgG+B2tRbH8GCRFqAU6G2F8S05KzjQHrkUcvb0pKzfUyL+AuzSxhPil
         Kx5gh1u/I8hxlidIedKUuhL/UydDnJu/Kj+I7VmCmF5DbKmQfvMQfUTXTsmHY7Nf3v07
         36pw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=KtG9dxPY;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t25-v6si232767qkl.362.2018.07.12.09.21.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 12 Jul 2018 09:21:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=KtG9dxPY;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:32920 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fdeLP-0006sp-Lq
	for alex.bennee@linaro.org; Thu, 12 Jul 2018 12:21:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52428)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fdeJ1-0005c2-Nf
	for qemu-devel@nongnu.org; Thu, 12 Jul 2018 12:19:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fdeJ0-00049c-PS
	for qemu-devel@nongnu.org; Thu, 12 Jul 2018 12:18:59 -0400
Received: from mail-oi0-x244.google.com ([2607:f8b0:4003:c06::244]:35334)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fdeJ0-00048r-Ie
	for qemu-devel@nongnu.org; Thu, 12 Jul 2018 12:18:58 -0400
Received: by mail-oi0-x244.google.com with SMTP id i12-v6so56862163oik.2
	for <qemu-devel@nongnu.org>; Thu, 12 Jul 2018 09:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=4xpRK9vUfvVfinjgiqVxJ9D7PGneHr4aCDPSSoLVXZs=;
	b=KtG9dxPY2JwZNj93VGIb+ZiXv/HcxwEEj1sz1059/j2ZtgXwnGj7tKtrzi7BdK9y61
	Wvit8OxQNANMD+YCULPcM0wPRqx+20opX6zlKN6QyEkvYMITD7Dr5elrv3p2vVXuqX4Y
	nId3ds6bT6I9a/jAhMeCSluH7L88CY5oZ22LA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=4xpRK9vUfvVfinjgiqVxJ9D7PGneHr4aCDPSSoLVXZs=;
	b=ZHXZXwwXUVmLOZR2y6nOzhlZYGgDkYT2jvoJY0ojh5B0epXEIJMe7GGlFJtiM236p8
	wP6vvXvy0eYbsDhihK2MiNUdfxlP9gDlHso6oIMbdQTEdIjRc2aMDmgBhXgT0EWwoDG4
	TzoHiZ7qLkpZo9wuHacSr3j35MBuEjH9XNjA9YZsBBCJwx3v/33iWz9Saa/gGlBL3faF
	RAO2WDxIBs/FVKcUVFTsv0SphWtcXpGV5HTThoSY0JOz3mo2hz4/rror4oP0WcJ/VkT3
	IRs/2ocnOwXaczNltgB4DuCnQSD0HP+NSMJ5lZO34+8SnyKque3KmohMwaCQdgwB03Du
	vUQA==
X-Gm-Message-State: AOUpUlER+km2Oo696Zk/BeAkG8hOxl7+e3Fny8uXpSFq6KRma5zV9cPO
	TYv53UhWo6gEJda0vJHSYgtlQmDkzrCT0XFx7AQuMA==
X-Received: by 2002:aca:a982:: with SMTP id
	s124-v6mr3200300oie.80.1531412337871; 
	Thu, 12 Jul 2018 09:18:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Thu, 12 Jul 2018 09:18:37
	-0700 (PDT)
In-Reply-To: <1531411830.3639858.1438698880.654F54F0@webmail.messagingengine.com>
References: <20180709143524.17480-1-andrew@aj.id.au>
	<CAFEAcA9GHFwscBzRGRbqAN+nWWYYbSZB-M0Kt+r=fFFG3xfm8w@mail.gmail.com>
	<1531411830.3639858.1438698880.654F54F0@webmail.messagingengine.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Jul 2018 17:18:37 +0100
Message-ID: <CAFEAcA9Ri8DANtFHtC=H83Vr2zotGRSWOY=QK37MN-TParmETQ@mail.gmail.com>
To: Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::244
Subject: Re: [Qemu-devel] [PATCH] aspeed: Implement write-1-{set,
 clear} for AST2500 strapping
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
	=?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: r+rQTVLVNTrl

On 12 July 2018 at 17:10, Andrew Jeffery <andrew@aj.id.au> wrote:
> On Fri, 13 Jul 2018, at 01:28, Peter Maydell wrote:
>> On 9 July 2018 at 15:35, Andrew Jeffery <andrew@aj.id.au> wrote:
>> > The AST2500 SoC family changes the runtime behaviour of the hardware
>> > strapping register (SCU70) to write-1-set/write-1-clear, with
>> > write-1-clear implemented on the "read-only" SoC revision register
>> > (SCU7C). For the the AST2400, the hardware strapping is
>> > runtime-configured with read-modify-write semantics.
>> >
>> > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
>> > ---
>>
>> Hi -- is this a bugfix suitable for 3.0, or something you'd
>> like to wait until 3.1 ? The commit message sounds like a bugfix...
>
> If we could get it into 3.0 that would be great. I ran into a case where the distinction was important so it would be good to have it resolved sooner rather than later.

No problem -- applied to target-arm.next for 3.0 (should go
in before rc1).

thanks
-- PMM
