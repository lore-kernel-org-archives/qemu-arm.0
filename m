Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp613370wrq;
        Fri, 15 Jun 2018 02:17:26 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKJ0MHPx7FHtN0PrmAuiNetXJJRxp32yUv5wmiGtdccZGwocVhxiPUKbrjja7qFqfLS2Bb9i
X-Received: by 2002:ac8:4712:: with SMTP id f18-v6mr635374qtp.397.1529054246890;
        Fri, 15 Jun 2018 02:17:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529054246; cv=none;
        d=google.com; s=arc-20160816;
        b=dNPz0JjTD0r86lRULjQaRHH7ksl/KzWN6/+xpeHhxlr8bICUsCaDdWh9lEaMZW/NTB
         ey36viNx4VuZaxpgqiDjbaz8oXICXuy6AIHTGqUsqgOkXcvsleXmkRPgXBulFpaBXOt8
         0Y16DtFJnN3rSPw74d1PL88k7KJfXwMDUfCX6F8tAOKFaadVSrX5ooXsQ58Y9mAtmD3E
         QRWXwsOM2nbvcOhV3qgBqgLjXa27VTy9pYGcDwvd3hLvIau1lKLcsM+Le+ERTgOiUUtA
         MTCBtS4kcFvUULoo+8uUCg4eabs++QYxq1kgeqTn1QZ0xC3YdxUEOa+/JfMoCZvMtt0y
         DxaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=nRLWfjuaMEOwhmWvomZfWDjHWbP+hHHsqZ8lb5r28ps=;
        b=IATa+iO2hMk1h5Ps3cjTwjfSi++iFFUA/YY9JaRd/4lcelG1kjtLIZhYYi2mQmzZBK
         lAsO74x2Xcyqxgbx9+Vk4gVntXRbeOdj4R2IzmyiRkbBPJaY7ttVUfhK7uestuSFLxpB
         OaPEj7n188vpz7CWhgPjjV4N4DTefLhR1JoMGWKqeAz0BkDouCfy3MT0rSESawTxBTAS
         /EFzIYgX0DIWhoMu6i7z521PnamT5bxi921rwjgL2NplzU5yKVW7ltNeYtXnOn61v+8k
         qBsLd0jifh1l5yQ94S7Pm+fI9loEdRSYwS+AXwUvtUd9Im2np3CBUfaZVZl+wl3ZUPIY
         1wHg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="kFEk9/2b";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j5-v6si7198057qkm.342.2018.06.15.02.17.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 15 Jun 2018 02:17:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="kFEk9/2b";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45341 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fTkrG-0004Ul-F4
	for alex.bennee@linaro.org; Fri, 15 Jun 2018 05:17:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44125)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fTkr2-0004T7-SG
	for qemu-arm@nongnu.org; Fri, 15 Jun 2018 05:17:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fTkr1-0006o9-QX
	for qemu-arm@nongnu.org; Fri, 15 Jun 2018 05:17:12 -0400
Received: from mail-ot0-x243.google.com ([2607:f8b0:4003:c0f::243]:42088)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fTkr1-0006mr-KV
	for qemu-arm@nongnu.org; Fri, 15 Jun 2018 05:17:11 -0400
Received: by mail-ot0-x243.google.com with SMTP id 92-v6so10248459otw.9
	for <qemu-arm@nongnu.org>; Fri, 15 Jun 2018 02:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=nRLWfjuaMEOwhmWvomZfWDjHWbP+hHHsqZ8lb5r28ps=;
	b=kFEk9/2bJbcVq+mz9guSsJpyZ6Q20PwP2hEudid8hq2SReehPz+RQZsT7afaOl2g8G
	SVtikz7EoqE2O4H0FHfM/U8Yg653qDYPRDujr0wDOZfEACZgyCcJVwnNRKzRVB9gOpeB
	IEO+JU6HROzNw4bt9jivslR9oVTf1G8wCBQXo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=nRLWfjuaMEOwhmWvomZfWDjHWbP+hHHsqZ8lb5r28ps=;
	b=jolKGFwX5Y/oFETPZV+G/vZ45TPLxgoqXROioZBiA2TO1x+Mnu02YanCkW5vM1pN3H
	0r9lx4PflxZnZjW3WU48bfv/hK3a3YnT1CjND3hkz1MJwtSDba4bhdub99Fw471YmZO7
	0xd9UUjFmqm85gGjNqwWwmyPrqVfLlADksqaiD3Ue739oy/11bsUyNacRXxP04m46iJg
	rGhxALyxOOQ0dwpYOsgXRph0V3rqf2UFrEVUcWZHNVzKjNHCyyUzMTAQsdKZNd7xJw3r
	hwwzCPRNRgzTFsiikHOZmqZnMNpohMHn90hMxUZrTMaFG+i1LyFKntTKSakodcXW85R4
	Mf/w==
X-Gm-Message-State: APt69E2GhkEHz9jkg511bdKSDyvbEEPVZ2XavZ2q0I0lLxp7tbSIMy/G
	gW51Vwi2JlNOQ8GNpH3Jq1LoC/5G7gBMxrxdN4IVr8nX
X-Received: by 2002:a9d:34db:: with SMTP id
	t27-v6mr521647otd.316.1529054230887; 
	Fri, 15 Jun 2018 02:17:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40d3:0:0:0:0:0 with HTTP; Fri, 15 Jun 2018 02:16:50
	-0700 (PDT)
In-Reply-To: <20180614215422.GA29690@roeck-us.net>
References: <20180614215422.GA29690@roeck-us.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 15 Jun 2018 10:16:50 +0100
Message-ID: <CAFEAcA-t9G=HAPH2325rduAKFNUEXNE-Jp_m9fMhfdTCbtm28g@mail.gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::243
Subject: Re: [Qemu-arm] Booting Cortex-M3 Linux kernels in qemu
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
Cc: qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CVYKzu2FLqL+

On 14 June 2018 at 22:54, Guenter Roeck <linux@roeck-us.net> wrote:
> qemu supports a number of boards with Cortex-M3 CPU. One board supported
> by both qemu and Linux is an385.
>
> As part of my kernel testing effort, it would be great to be able to boot
> a non-MMU kernel. However, nothing I tried works.
>
> Is it possible to boot a Cortex-M3 Linux kernel with qemu ? If yes, does
> anyone happen to know how to do it ?

I've never tried to boot Linux, only a few RTOS-ish things.
mps2-an385 is probably a reasonably good choice to start with.
Note that it is missing quite a lot of devices, so you might
need to configure Linux not to try to use them (and also
let us know which ones would be useful for us to implement...)
If you pass QEMU the command line -d unimp option it should log
accesses to ranges and devices we don't implement, which may
throw up some useful hints.

Also for M-profile I'd suggest always trying with the most
recent QEMU if you aren't already, since we've been working
actively on it recently.

thanks
-- PMM
