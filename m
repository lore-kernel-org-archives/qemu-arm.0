Received: by 2002:a4f:9ad8:0:0:0:0:0 with SMTP id b85-v6csp1416631ivh;
        Tue, 3 Jul 2018 10:08:16 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdvUJp/RgSuug7aZpmgfbwBkrqUR217Ow9vWZ2LfcwfZ4VNBwJG+9S8AeOj2pMKmDQKxG7z
X-Received: by 2002:ac8:252b:: with SMTP id 40-v6mr26700569qtm.395.1530637696896;
        Tue, 03 Jul 2018 10:08:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530637696; cv=none;
        d=google.com; s=arc-20160816;
        b=Ku+ficHK0SXpbWa3+9ZoGawYjylQT2cGQCXHJqSZumjF+nqNW/DSC+Lk/BBqKlymLm
         kZZj5D71UbNBYnLsouhF6YJ3DeZOnU+mJuGOF/MghXjsVRNBhCe5KEE39/yiRUgd+YeV
         QLo8ZT9cFqLtsrmuAZj57j6gA/CITeItNLZXzoH6XMW5nsRY7dPviBhd8zoA2X+rHLRh
         YjaBHVwLBAKpfD43t7ciRJB4yqiUVxLk3v4yXA+2K2IeIu6TV0C7cQzpyreh88ZfcNLU
         XM5YeyvWkP9pE/nj3b9OE0kKDSdzde9sgc1/dwXVRQyQVij82lsmNyfLjwUH9Tvd5ctA
         kSHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=usGYB6aKz4udDFQhVyQ6MWK0hr2K7eWz3dw2twozokc=;
        b=Z4ZN1trKjpK5jydDpHbyHYd/CKsI1AEqRbCxFOJBEHj0DK36J83c6UzPz7PnRty+Eu
         OuuIJ1u4edgPHlMk0T8tYEryCQTSDbXJf7RmcCdhY7GtJUo6BPjNxtb8yYzCVE0rBBn8
         GRXB3vKQm93T3azh2h/rRkdoF/63t7EUYQ0jXSlCzjsGSjhYHuPj9bRZCdITkbYFydp7
         O7uV15D39XxDyj+f4lZmxi3PO54ghGM4mkmndHZAnVArxJiw2/sknR8GqhoKJlPt0ONC
         SL4bWMstr5dkHyYbbgLsESjnG+qzVouZ4uL8LpCansIZWoFjVxx0mk8c1OgwQ0/b4FGN
         l1oQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Ua441Bko;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n89-v6si1529520qva.105.2018.07.03.10.08.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 03 Jul 2018 10:08:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Ua441Bko;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41823 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1faOmm-0001aV-C8
	for alex.bennee@linaro.org; Tue, 03 Jul 2018 13:08:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57873)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1faOlK-0000zG-LY
	for qemu-devel@nongnu.org; Tue, 03 Jul 2018 13:06:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1faOlJ-00081n-Ga
	for qemu-devel@nongnu.org; Tue, 03 Jul 2018 13:06:46 -0400
Received: from mail-oi0-x243.google.com ([2607:f8b0:4003:c06::243]:40251)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1faOlJ-00080l-AT
	for qemu-devel@nongnu.org; Tue, 03 Jul 2018 13:06:45 -0400
Received: by mail-oi0-x243.google.com with SMTP id w126-v6so5263188oie.7
	for <qemu-devel@nongnu.org>; Tue, 03 Jul 2018 10:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=usGYB6aKz4udDFQhVyQ6MWK0hr2K7eWz3dw2twozokc=;
	b=Ua441Bko9gwvaL4U2WXKbduNbP+y07CqLcN+pF7N4GF+51/TGV0AYQPAxzSNtyRGce
	sBpU4yDNjzcZBJUaKZbZ63gsUSta3T1/5Soz4asr7so0cCNCxr/af9rOiq7OEsCKibiq
	aZbY2R4Qyr63YXDjZ536uLmIAVF1JvRPy3A+I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=usGYB6aKz4udDFQhVyQ6MWK0hr2K7eWz3dw2twozokc=;
	b=ErlluzFJRWC95uGsUXYYpgEy0uAJodsqi6G7IV78RqJbphkU5DFglHNIpA/d/i+is6
	o3x4owWLUpuSXfsQOidCTFVHllRhdoS1bulqHtNMSjyFYoZ2RFllBosLBxpqxnvRjz6j
	3HfuN18EhMefZlxNRWrTrJvZa/P+PCUSPZKznGUWubJiyKAysKiXhLbkUdrShf/QZvw6
	uspOUL/9myvHBwnCnbCwEccthXeAsruOx1Y61j5xjudsho6DqXPWBW2NzBRrHuIckaYC
	rOCsXgDOVE3RTFOrB3vCZ4hrrH3EqdyeiPDg3HerbArKgaFplo45DVBZarSZviRb3u2R
	kSwQ==
X-Gm-Message-State: APt69E3Ec+BHO2C3gVYenH/TlA/0ybYFUZLArDYMbxH0AMGy60TBRMZR
	Rh+iZv3NV9nUVWFChfLd1MU65Dzw67DQ440ReUKXsA==
X-Received: by 2002:aca:f409:: with SMTP id
	s9-v6mr23020309oih.102.1530637604617; 
	Tue, 03 Jul 2018 10:06:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:554d:0:0:0:0:0 with HTTP;
	Tue, 3 Jul 2018 10:06:24 -0700 (PDT)
In-Reply-To: <20180702183717.GA22482@roeck-us.net>
References: <20180626175900.GA4307@roeck-us.net>
	<CAFEAcA8PPF1mDWMGSm0r6NtYijwQQG7QnNEJ3iwaaEZU8GTu7g@mail.gmail.com>
	<20180626200008.GA680@roeck-us.net>
	<CAFEAcA_non89OR_-W3Fhr6gG0v0kkgg-ffJx-9K_h=U-Hz_wbg@mail.gmail.com>
	<20180702162733.GB32333@roeck-us.net>
	<CAFEAcA8+ZxcRLBgonZaqpAfumKFvhk7yDhX=Fe0KjoeTxWsczg@mail.gmail.com>
	<20180702170522.GA9885@roeck-us.net>
	<CAFEAcA97xX72WabGwn7GAQJxMcpzYzyV9yDBg1qF0zLuSDZwSA@mail.gmail.com>
	<20180702175740.GA14904@roeck-us.net>
	<CAFEAcA8noUOGt_9LpfRTRX52n4Z66XzudYFfW=180c92vzPH-g@mail.gmail.com>
	<20180702183717.GA22482@roeck-us.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 Jul 2018 18:06:24 +0100
Message-ID: <CAFEAcA_p8vOs_1_4sAf1SvvPb44z885doU0821eh=-e0K5B3_A@mail.gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::243
Subject: Re: [Qemu-devel] [PATCH] hw/char/cmsdk-apb-timer: Correctly
 identify and set one-shot mode
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Q4o7/TfaWsSN

On 2 July 2018 at 19:37, Guenter Roeck <linux@roeck-us.net> wrote:
> Please try http://server.roeck-us.net/qemu/an385/
>
> vmlinux is plain v4.18-rc3 compiled with the provided defconfig and
> the provided toolchain (position independent, created with buildroot).
> defconfig is mps2_defconfig+CONFIG_BLK_DEV_INITRD=y. Older kernels work
> as well (I tested as far back as 4.9.y), with the same configuration.
>
> qemu is from the master-local branch in my repository, built with
> https://github.com/groeck/linux-build-test/blob/master/qemu/buildall.sh.
>
> The boot wrapper was generated from
> https://github.com/groeck/linux-build-test/tree/master/rootfs/arm/arm-m3-bootwrapper/.
>
> run.sh should boot the system into a shell (at least it does for me).

Thanks. Unfortunately I tried running that a bunch of times with a
version of your QEMU with the 'set one-shot mode' patch reverted,
and it still booted every time.

However, I think I agree with you that it's better for the timer
device to avoid doing things that result in the ptimer code emitting
warnings rather than just dropping the ptimer warning, so I'm going
to take this patch upstream.

I also sorted through some of the other corner case issues
(eg restarting a stopped one-shot timer by writing to VALUE,
and whether an interrupt should be generated if VALUE is
written as zero). I'm going to send a patchset in a moment that
includes this patch and those fixes. I've tested that set by
applying it to your master-local/ branch and using your testcase
here, as well as by using my buildroot/uclinux image on an
upstream QEMU (and a few other RTOS images I had to hand).

thanks
-- PMM
