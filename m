Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp1154395wrq;
        Fri, 15 Jun 2018 11:13:44 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKKbi05tUo81+xOUniEtq419kzJ0KBIeXscb2lwpsHKcdhthGDpyRWidZtx8gK+9/n4RufVN
X-Received: by 2002:a0c:a3c3:: with SMTP id v61-v6mr2318465qvv.99.1529086424907;
        Fri, 15 Jun 2018 11:13:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529086424; cv=none;
        d=google.com; s=arc-20160816;
        b=KO6C//WbEo34xdyScIxQmlY394QDSt6xOQraTHusFUB1kxxR+ogWr8twNMoPyQNHWZ
         xhg9UCwHt3YuoeBoeXBmgQmnhQ093y4Qi385rUVux3WbU5QCUE22SsjvaoTbmsopL20x
         VJv4khIFbnrkFRSTQyl98btyU9hJyR4R4soxCFHunvo+ShAsZBX4SUfASxaeOnc07OjL
         4TzyiCHmdwP3d24iElcG9f6WIzhi6sSbUlpIW8osYmNm69s0mTZLPsFOFYBg3ubNlj5v
         OFmy8ocXAAqJkyCX+3fAaeu5l51a6tisS6jjHoAORdF0wyxzc4tORsdPl8pJk4PRcZqb
         qGpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature:arc-authentication-results;
        bh=hksGn7tM2aB8+qGjF8YmXo7qDDU3nMo3blMCqZx8VZk=;
        b=bMkUzWk30eNuO9PKm9IQzUg+AAidwVOUqdCp8ES9YY3uFm2JXY2cuZtvJ4veGMwJ/G
         L6mOBPxo1egETHUgqIsfxSILbtqA01rmKCmV69GnGTuW08m9VL9gCBj6q6f9LXDX+6o3
         5h6UCVDbO5MHXBN4zDgeOm2UTYCeLqi70ML3DIGp2/hKXgi0XyrfzJCjvhfC8iZV2yo2
         cTINKj9EqzvIQHn/Jo6yMXSsFC3FPFO6Q87Q5wPg6mFwcUBarfrP6jCvKHNGRnbZSw9z
         G8ofdd4ISNyrfR25G0jbLcIfX5evAETjFH0TAjD4YWPoEqT92MSupfDO+XhmbWVDXt++
         velA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@roeck-us.net header.s=default header.b="A/TcW2Al";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j32-v6si8009655qtj.47.2018.06.15.11.13.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 15 Jun 2018 11:13:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@roeck-us.net header.s=default header.b="A/TcW2Al";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:48694 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fTtEG-0004yk-Fr
	for alex.bennee@linaro.org; Fri, 15 Jun 2018 14:13:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37368)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <linux@roeck-us.net>) id 1fTtEA-0004yF-JL
	for qemu-arm@nongnu.org; Fri, 15 Jun 2018 14:13:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <linux@roeck-us.net>) id 1fTtE6-0000WI-KA
	for qemu-arm@nongnu.org; Fri, 15 Jun 2018 14:13:38 -0400
Received: from bh-25.webhostbox.net ([208.91.199.152]:41268)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <linux@roeck-us.net>) id 1fTtE6-0000Vz-Ci
	for qemu-arm@nongnu.org; Fri, 15 Jun 2018 14:13:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default;
	h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=hksGn7tM2aB8+qGjF8YmXo7qDDU3nMo3blMCqZx8VZk=;
	b=A/TcW2Al3rmme9/W7qvEEc0x5o
	tMEZdGr3V3+pTw+tAbzQKOztWHUNwlT9/smo3EzrXQA4pzDwRt/DqY+PUXE7WhOTy9T9iRUV1rgF7
	Ur4r3e71s1iDfoCAlETbXmpArWtCXnnx1xZaizaAuWerr6Q6qLydgrcoBnShbLq/Avu5SU1MrvRzY
	Os+s8eEif8r/54RTOvUVtaxQkSgmKmeFv5ckxl98zMiDIWU8W1p6oGOq/nykG0DdLVUYfiB/W0Np7
	A17Yc9keuLMFhq22XOCldaGBwsAT8ZlVGFzkalu4gvuWyyI6NKtPZkEsQQnWMER+PNKZ47Djp9oBA
	QHSfZD1A==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net
	([108.223.40.66]:48618 helo=localhost)
	by bh-25.webhostbox.net with esmtpa (Exim 4.89)
	(envelope-from <linux@roeck-us.net>)
	id 1fTtE4-004qIv-UT; Fri, 15 Jun 2018 18:13:33 +0000
Date: Fri, 15 Jun 2018 11:13:31 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20180615181331.GA29302@roeck-us.net>
References: <20180614215422.GA29690@roeck-us.net>
	<CAFEAcA-t9G=HAPH2325rduAKFNUEXNE-Jp_m9fMhfdTCbtm28g@mail.gmail.com>
	<4ff384cf-14ad-ef33-5532-4f8dbb8d0ff6@roeck-us.net>
	<CAFEAcA9+nW7nZb0ZaN__xBGGV9WFcBJ0_q=EYTA_DM6=bVfhNg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA9+nW7nZb0ZaN__xBGGV9WFcBJ0_q=EYTA_DM6=bVfhNg@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Authenticated_sender: guenter@roeck-us.net
X-OutGoing-Spam-Status: No, score=-1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - nongnu.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-Get-Message-Sender-Via: bh-25.webhostbox.net: authenticated_id:
	guenter@roeck-us.net
X-Authenticated-Sender: bh-25.webhostbox.net: guenter@roeck-us.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 208.91.199.152
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
X-TUID: EfP+PRMJ0Qn2

Hi Peter,

On Fri, Jun 15, 2018 at 02:54:33PM +0100, Peter Maydell wrote:
> 
> Note that for M profile QEMU, the thing you pass to -kernel
> must be be either (a) a raw image file which starts with a
> vector table and is intended to be loaded at address zero,
> or (b) be an ELF file which we will load at whatever address
> it asks, but which must include a vector table at address
> zero, because we don't honour the ELF entrypoint address
> but instead always load the initial SP and PC from the
> vector table.
> 
That was useful.

After hacking qemu to accept the ELF start address and to set
initial_msp to 0 (a whopping 6-line patch), I get a bit further.
The boot now hangs because the devicetree blob is not recognized.
Does qemu load and pass the provided dtb file ? I didn't
immediately find any code doing it for armv7m/an385.

Thanks,
Guenter
