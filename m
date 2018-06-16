Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp1877243wrq;
        Sat, 16 Jun 2018 04:13:35 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKJwpxJIiUGU6hIhod/lSGe5hXQPSTT/Yxi8cUbjmBKbxFTcOlZh28Kkok9lHz5aApo1IFkq
X-Received: by 2002:a37:8202:: with SMTP id e2-v6mr4346968qkd.443.1529147614932;
        Sat, 16 Jun 2018 04:13:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529147614; cv=none;
        d=google.com; s=arc-20160816;
        b=R2cT6kHQqBCn6rpIdXdQU7nOUfxLrUyBiSYxlMeHpiJZPlejSP5c1umVJk35yuDvTb
         DMKxYUMPG8WaqK+86kHUlEeFRFU5vOhoy5LVp4vStQiUatoItzX2d0Zb9s39RbKkKXLR
         k2qGk7xlmzCCVe1olnmsb9P3db+r4VfvuE+iQ1viJ5IPK27j43ZN7Q7CBG2yfyXCXumQ
         9XOzBxrDHAnHy4AXuG5HmTA38DKsyJyf+RBxnZdqBKSNaG/Rc2bBd0A3KCVfGcfEPgjQ
         Cxh4oiXhnuNZoaUNHbnQphqvL+yaxIRY0MNpebjmikpdLq0o0ZgI72+k2rHRW0xlFiqJ
         d4UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=apUvREevuoWNkbQiFxC9uLq1q5XUZuZIxbgjn91fgOo=;
        b=bOHr0NmPeg4Ol0RYcK6IqMNGSvUYF+oOXeZ85xvsmq2wLiRUT6AwExqhzhLzEXuWql
         0gLwXlp+VNcYZ6HGElNYa/ROnxlSQuqlDpeMIFT22iOQsxOvtHzKYcqLrdAHaARahW9Y
         fCvanl7KWecJhM58Q1pE5mooGMxQ+9oDXzGSHj03I+3TNm9Vj8vr/VF9ezNBDjD8DSw7
         palbljwEdVzbXoV/LPb6DHrPNNbUey1Od37nf8TYuwmVveHYiOLLUeJUc2dKWRwyQyGF
         6ouseg8apCKo/eKp1UmJcQTi3R8deu73j0L/Lj0aRnu1Dp8pAth/3R79Lz2YFg6wdhBU
         Ds8g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Mxz3VUnU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u33-v6si2949189qte.25.2018.06.16.04.13.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 16 Jun 2018 04:13:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Mxz3VUnU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51029 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fU99C-0005GD-Fi
	for alex.bennee@linaro.org; Sat, 16 Jun 2018 07:13:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57769)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fU991-0005Fr-Vs
	for qemu-arm@nongnu.org; Sat, 16 Jun 2018 07:13:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fU990-000575-US
	for qemu-arm@nongnu.org; Sat, 16 Jun 2018 07:13:23 -0400
Received: from mail-ot0-x241.google.com ([2607:f8b0:4003:c0f::241]:45256)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fU990-00055T-Oi
	for qemu-arm@nongnu.org; Sat, 16 Jun 2018 07:13:22 -0400
Received: by mail-ot0-x241.google.com with SMTP id a5-v6so13731795otf.12
	for <qemu-arm@nongnu.org>; Sat, 16 Jun 2018 04:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=apUvREevuoWNkbQiFxC9uLq1q5XUZuZIxbgjn91fgOo=;
	b=Mxz3VUnUfa07rqlej6x4c3Nof0/ukLVjXtv8YPr4zZB8FvVUYK5G4IkldhYLzk9YUZ
	IN4u7pQsnXkDucwhcwVEow0LGbkLQ62EoYDm9sdmxY9rOCOk0D/v6urU37iO2stdLnB/
	5iIYPYpbcArVg55dBWd+cpwEyA0GIzcKiQy+U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=apUvREevuoWNkbQiFxC9uLq1q5XUZuZIxbgjn91fgOo=;
	b=JT+ZxX2t0fkrszLVdVZAvKucJs82Tq9RnDKACL6ozJ3ckJzJ2M5C4v9W+zpPqEGuzl
	BANB3W7F5ZECjKStFVQpqtr+6Ckbesg4zOdSyQMWRuOVGzYIp0ACdJwIUdFyJ9zv8JKE
	WX9Wf2LQjLcUm2w2MGCFGcyBCtWBVITGOvQRLDm+C45JILXDOTdP22DLuD8Ok2Y7EBh1
	uTqr/xmQweebWO4xpkg/pRMELeSFOKSkQY5+HzW20X/VBaOkWjLifJ5b1xV7UtFrNmTq
	Dd7EWmb7IJVtrKr8/8feUmtKYiRWg/6t/gFbacfZocXtOQ0fP2FWlbpGwO13R1WwR7E6
	L5GQ==
X-Gm-Message-State: APt69E29lF+EgTCRKpeGZDptOM6+hmGJUr/DA5MC1jierLnq30PekWTh
	M26/yxOacV+G7fyxGCZjzokerzIvr3bNwoMidEQk1g==
X-Received: by 2002:a9d:2909:: with SMTP id
	d9-v6mr3046837otb.258.1529147601359; 
	Sat, 16 Jun 2018 04:13:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40d3:0:0:0:0:0 with HTTP; Sat, 16 Jun 2018 04:13:00
	-0700 (PDT)
In-Reply-To: <20180615181331.GA29302@roeck-us.net>
References: <20180614215422.GA29690@roeck-us.net>
	<CAFEAcA-t9G=HAPH2325rduAKFNUEXNE-Jp_m9fMhfdTCbtm28g@mail.gmail.com>
	<4ff384cf-14ad-ef33-5532-4f8dbb8d0ff6@roeck-us.net>
	<CAFEAcA9+nW7nZb0ZaN__xBGGV9WFcBJ0_q=EYTA_DM6=bVfhNg@mail.gmail.com>
	<20180615181331.GA29302@roeck-us.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 16 Jun 2018 12:13:00 +0100
Message-ID: <CAFEAcA_ua-FMw_SCYExPNPyFoY_jvokns7R=weoODbfVuP82+g@mail.gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::241
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
X-TUID: 095hHuj9+D9b

On 15 June 2018 at 19:13, Guenter Roeck <linux@roeck-us.net> wrote:
> After hacking qemu to accept the ELF start address and to set
> initial_msp to 0 (a whopping 6-line patch), I get a bit further.
> The boot now hangs because the devicetree blob is not recognized.
> Does qemu load and pass the provided dtb file ? I didn't
> immediately find any code doing it for armv7m/an385.

As you've discovered, we don't. The assumption for M-profile
is that you're just passing us an image file, we don't attempt
to do anything with initrd or dtb. I'm not sure I really want
to get QEMU into the business of being a boot loader for
M-profile (there is enough of a mess with just doing that
for A-profile cores, and most people running code on M-profile
devices aren't running Linux, so there's less justification
for special-casing Linux kernel boots). I would recommend
arranging for the images you want to load to be self-contained
with a vector table (either by having the kernel build process
do that, or with a guest-code wrapper.)

thanks
-- PMM
