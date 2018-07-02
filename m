Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp86816wrq;
        Mon, 2 Jul 2018 09:59:54 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpcx8Qw4U6AC2dDthTHfWeKzWaEZ5y8DENMcERrej60poUdrkPKWrq9IK9MqRTWKL2WDJrwl
X-Received: by 2002:ac8:302e:: with SMTP id f43-v6mr7465839qte.217.1530550794702;
        Mon, 02 Jul 2018 09:59:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530550794; cv=none;
        d=google.com; s=arc-20160816;
        b=GKYjkz96b/DTWAT5LqzoXR4umPBe0djNfr9dKnC0Q7DvAy9nARKRBXShZDIlhQfVvk
         RqADH8Pu+YwUHoBR5SmD4NIwBI/0sy+/hKSn1tnxhbV5/ZcQ3dDkzPPLSw3agwuZEhMO
         yPffs3F6T1ZvHtCD0mRIgHpbu+c2bcVSyfRuJut3QHF2Ua6lDxhnkR60YVpfjm1BZEMY
         YDYHDHbVtFH3jRRSD1OTc7U+G0rBBziFr7RufbDy/1/FUFWndrWSlfmPMGdElBgaId2P
         EbnaQcJbeYGT/y3HJraMBc85INXANtwmIz36vgjq6nF17BhVmS1oS9wmnZmZcKQ8Suis
         bDyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=6XbHOa9eEljSCxEnUf+iVbDV/EqLImDxmjyeQrI5/e8=;
        b=wqWWhLcG1CrZIl90cBjURCqqqsZ6AoUeNl1jKNTdOyd1+WL4rsCohVDhNSPP1PaTBe
         m9jS+ZxvTt/75yXQzYNQjhykAyeLM2KkL4z1rw6SfIJEQAY5w9Ya5AngyhewkBTfx0qT
         eJD2SHPKRDgY61LN+uia1ad87X8cOQD7R+zsLkeud4/3cYMAw+iyGXKUMZQ+JeClQAfP
         wG+WHchMVtNBxfhvXuLAkOCE1GgfkSTGrvPyBd9FTZXoO2RZ2hNZ7ihvcgewbr+mzItG
         9ATNiO7GyVS8GDaytiHrVmiehNDbK8n5UxYehpz3Vcws7BrFVAwgE9shKHsdmquUjNn2
         oY/w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=iF1m8+nM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w15-v6si4838349qtj.276.2018.07.02.09.59.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 02 Jul 2018 09:59:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=iF1m8+nM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34311 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fa2B8-0008PU-0k
	for alex.bennee@linaro.org; Mon, 02 Jul 2018 12:59:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51806)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fa1yg-0006ef-7l
	for qemu-arm@nongnu.org; Mon, 02 Jul 2018 12:47:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fa1yf-0002sN-BG
	for qemu-arm@nongnu.org; Mon, 02 Jul 2018 12:47:02 -0400
Received: from mail-oi0-x244.google.com ([2607:f8b0:4003:c06::244]:46688)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fa1yf-0002s1-4m
	for qemu-arm@nongnu.org; Mon, 02 Jul 2018 12:47:01 -0400
Received: by mail-oi0-x244.google.com with SMTP id y207-v6so17566499oie.13
	for <qemu-arm@nongnu.org>; Mon, 02 Jul 2018 09:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=6XbHOa9eEljSCxEnUf+iVbDV/EqLImDxmjyeQrI5/e8=;
	b=iF1m8+nMTKaHp6zKk9ivQRCJOJKnocJKOa1CuzZE4QnpLeUeuzyiKvN5PTLyC4hhis
	qKtI5dOPRGQdaUJezv2MOLW3+gR6gnwfqmPQG0b27m9FFI2PoLsFi8nha1CGL74p6dYy
	zJZ3d0tzhBho9lpnld7S/sMhYCJMIbqBcilMQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=6XbHOa9eEljSCxEnUf+iVbDV/EqLImDxmjyeQrI5/e8=;
	b=inwummlciiTXEXTwkKbxaG0EU784q8OGlvB9vzaNXfLwJ66uhmoXgePwwrVqmvheCk
	fysA1JciUhUkK4+aEUb2mybPCMG0SjGVmIZ5qhvavE8g6GuxAYnLFLmQT4T0yHGwqqn8
	fpbV0XHBSwvq2Ni0bhpWkHZcb+MDeDEDXWDX+Rgyi5+CIFhTV701B5QiyrF1uxEJGE2B
	gDarq9bblteT5TtOcho49rjs0nZVubxQEZroH68TutBNRTP7wHmWsipv1kMsxnis+M0A
	x0et9TNjmRxEcJJWKmXKW3FZnx8VNPLpy5L1CjAWHTdAzT+7MVy1AD75+24ZMTxoawKY
	4+rQ==
X-Gm-Message-State: APt69E07FSrLZR3sKGFSIWQOH3PZP1JLkCVjjQLb+sTqmsQZH82ebWDf
	lgnnkwbUr+XEYkKSPQC0bqR+UlBnDkkYsDyzLC932IW5
X-Received: by 2002:aca:4a49:: with SMTP id
	x70-v6mr8859572oia.11.1530550020402; 
	Mon, 02 Jul 2018 09:47:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:902:0:0:0:0:0 with HTTP;
	Mon, 2 Jul 2018 09:46:39 -0700 (PDT)
In-Reply-To: <20180702162733.GB32333@roeck-us.net>
References: <1529374119-27015-1-git-send-email-linux@roeck-us.net>
	<CAFEAcA_8TAWdkgTzPPE7eggP4UAHjVPmcXiEa_-RCxDBphJ4HA@mail.gmail.com>
	<20180626175900.GA4307@roeck-us.net>
	<CAFEAcA8PPF1mDWMGSm0r6NtYijwQQG7QnNEJ3iwaaEZU8GTu7g@mail.gmail.com>
	<20180626200008.GA680@roeck-us.net>
	<CAFEAcA_non89OR_-W3Fhr6gG0v0kkgg-ffJx-9K_h=U-Hz_wbg@mail.gmail.com>
	<20180702162733.GB32333@roeck-us.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 2 Jul 2018 17:46:39 +0100
Message-ID: <CAFEAcA8+ZxcRLBgonZaqpAfumKFvhk7yDhX=Fe0KjoeTxWsczg@mail.gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::244
Subject: Re: [Qemu-arm] [PATCH] hw/char/cmsdk-apb-timer: Correctly identify
 and set one-shot mode
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /6dL370CZdg5

On 2 July 2018 at 17:27, Guenter Roeck <linux@roeck-us.net> wrote:
> Again, in my observation the boot sometimes stalls without my
> patch. Maybe there is a better fix, but the code as-is doesn't
> work for me. All I can say is that the current code does not set
> one-shot mode when it should, and that seems wrong.
>
> You could of course take out the zero delta warning. Personally
> I would caution against that - whenever I have seen that warning,
> it suggested that something is wrong with the emulation, and it
> helped me track down the problem. Your call, of course. Also,
> I don't think taking out the warning would fix my stall problem.

Can you provide me with something I can reproduce with, then,
please? My kernel + buildroot don't repro the problem: it always
seems to boot fine. I had a look at your testbuild git repo
but couldn't manage to figure out how to build a binary
from it. I'm ok with building a QEMU from your branch for
testing this, but I'd rather not try to figure out how to
reproduce your kernel and root filesystem setup.

thanks
-- PMM
