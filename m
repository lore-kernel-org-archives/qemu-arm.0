Received: by 10.28.71.27 with SMTP id u27csp2103007wma;
        Thu, 22 Feb 2018 07:45:58 -0800 (PST)
X-Google-Smtp-Source: AH8x2258QpBBmidGi2cO36ufDHGbaDPa0VrKvAY+C9mbAkZ/Ia3xaQtZ/jhzkjzp/khEL92RzhFD
X-Received: by 2002:a25:7706:: with SMTP id s6-v6mr5019517ybc.53.1519314358906;
        Thu, 22 Feb 2018 07:45:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519314358; cv=none;
        d=google.com; s=arc-20160816;
        b=wnvPqOlYvP8G81IZcTRDXtiZPmvh3KIDO/8Whtog3qAsX9uDhGl5ILJANKwYf9YFX7
         L2hhlKaM/7jtB9nTNMeDBsoitPAtgQos/91sBtyO/4r/6MNnpLgksr9ErPLpQl2a7Ja4
         5AJCPlENxYF9myL0BzldLKvS68Lji1PEU1kGdI2I2FUy1iDAQrRx2YbJLsfa2DuU8EXu
         a7gc1pQn7drDrkE0MdpxaXxBrUh0adIMfpyy92P/piM7KCqEtxs2cTU0p5F2A3FZFBRZ
         OHPLotu/8CfZ62yj4jXWfv2u20kdTVnWWx9a+AJRp3VXDu/CrgMD2dOyONhha6P97UQo
         oYcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=uWmdimWIsnbw0TC/SP+eCIAS/c85+qigehqCNAi/IcA=;
        b=klTTA1iuyU/czGvw1CaxTYgEhKc9SGoVuO20OaSRIyXVT5GTJdW2rpZW2Ihv/bLZ6z
         MUdULYD0tt/SOJGMGIhpX20Kz1rt+fnlTxxIOWCfi49mJTUgOScVmiOY2Qv0LeTBKU4z
         I0AKjm1guOHWlExtXU/3Bao/fYlxLNci2iXNUlUmwgFuB2CpwQRX3QVVKPB9AfSy2pNl
         05prAD9o7EXFnO5Vpa4HTfpcagQ4i2xQyutB2ma1X/JsxRcBJ2ms+zVUR3ZBILn6cA2H
         4kOl3dM2Rz16fNC3M7h7cl5Pkm3PF/CGkw6Lhwr7XUOU2COF9xMChSuHMsgWyNWSnpwB
         6K5A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cL7I0+dF;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q135si54606ywg.106.2018.02.22.07.45.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 22 Feb 2018 07:45:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cL7I0+dF;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39097 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eot4I-0007yx-8d
	for alex.bennee@linaro.org; Thu, 22 Feb 2018 10:45:58 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41740)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <linus.walleij@linaro.org>) id 1eosvs-0000P9-3J
	for qemu-devel@nongnu.org; Thu, 22 Feb 2018 10:37:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <linus.walleij@linaro.org>) id 1eosvr-0004m3-70
	for qemu-devel@nongnu.org; Thu, 22 Feb 2018 10:37:16 -0500
Received: from mail-it0-x22e.google.com ([2607:f8b0:4001:c0b::22e]:52118)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <linus.walleij@linaro.org>)
	id 1eosvr-0004l1-2c
	for qemu-devel@nongnu.org; Thu, 22 Feb 2018 10:37:15 -0500
Received: by mail-it0-x22e.google.com with SMTP id o9so6675483itc.1
	for <qemu-devel@nongnu.org>; Thu, 22 Feb 2018 07:37:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=uWmdimWIsnbw0TC/SP+eCIAS/c85+qigehqCNAi/IcA=;
	b=cL7I0+dF6WAuvppFbVdawo5rfB9E9oN+0ZIUauk2MGJYo7CWDa3FvBLDLDirQT/v7s
	kJq//+Xyxn5eN16gCx4kbdqkYoL79E5AKmdc8+fCl5qyLJ9Bf9ce5blwWJ+4ljoRJXbj
	2f9ks7Q5vqxkHjAyd0iRYqnCq5GPQXPq2IuIA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=uWmdimWIsnbw0TC/SP+eCIAS/c85+qigehqCNAi/IcA=;
	b=bijyVPNE3a//Dphe91oYxXsFmBfIHIERYSR1jO2suJClUcSS5MkgeYF6bTYvFbZrIB
	N/M9ojBbcMmJTBBKXsKlgO2WsLQuPR5qs+Vz6c0q75FbCGK7SB80N7FLnP4wkCT8Jihn
	O4Oc4vLS05etq1xeK9KiqzvKYOAkjFbqTozoniWL4IAeonyFDYZ/XidJbt14UJHzaSSk
	oI33UAmjE/cOdrR3IuxaR+cJCLhsMXXBpT4GRwY1uQx2WhsdY7fInA6PS6H0Cp1flBU5
	ZAcnKHq6T0r3epu8ty/3VoxA0oAwtodpEJspKxoNTFZ9Xiin7VaqN1cWIRVOIh9Ke0gK
	kFDw==
X-Gm-Message-State: APf1xPDyNE/yFnwgjWqk6+K+8dE03gdItRgemx18UKOFcD2TFgqj1LTA
	2TE64h7I5RjB++M4GGS3nN3OgbUagPHDFrjgoRHhkQ==
X-Received: by 10.36.103.88 with SMTP id u85mr8356121itc.38.1519313834153;
	Thu, 22 Feb 2018 07:37:14 -0800 (PST)
MIME-Version: 1.0
Received: by 10.79.230.25 with HTTP; Thu, 22 Feb 2018 07:37:13 -0800 (PST)
In-Reply-To: <1519053606-9817-2-git-send-email-minyard@acm.org>
References: <CACRpkda9B=frmS0QF429p-q+KoCKG=5NON-kQ0Rt-nba2powRA@mail.gmail.com>
	<1519053606-9817-1-git-send-email-minyard@acm.org>
	<1519053606-9817-2-git-send-email-minyard@acm.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 22 Feb 2018 16:37:13 +0100
Message-ID: <CACRpkdaWKYfBaTj3qGsjk3+e5_pJ=vr=rddNPvOd5GQQ=M4q8g@mail.gmail.com>
To: Corey Minyard <minyard@acm.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4001:c0b::22e
Subject: Re: [Qemu-devel] [PATCH 1/2] i2c: Fix some brace style issues
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
Cc: Corey Minyard <cminyard@mvista.com>, qemu-arm@nongnu.org,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZN2fh/wmu64/

On Mon, Feb 19, 2018 at 4:20 PM,  <minyard@acm.org> wrote:

> From: Corey Minyard <cminyard@mvista.com>
>
> Signed-off-by: Corey Minyard <cminyard@mvista.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
