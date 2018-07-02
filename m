Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp96220wrq;
        Mon, 2 Jul 2018 10:07:27 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpcbTMZzlJmBDcmhl5t1K4IboPp2Dm/+pe3fH3OJV8e4gzhbkH4e4UL7z3c+pWEwgtoXLKMu
X-Received: by 2002:a37:9d58:: with SMTP id g85-v6mr22264277qke.230.1530551247166;
        Mon, 02 Jul 2018 10:07:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530551247; cv=none;
        d=google.com; s=arc-20160816;
        b=NZWxYmDA/lVN6xuih7SyyGNqtR1LOjV6elnmLTh0zCsUHUM7AZ/tWzlg3TcZH8rXoY
         h9h+SjpafRWAROydP/VC46OwDtvZ1hpYAoHDM0AYLf0L1qBzUlR91Z/xGbC42WIkci9c
         6sbtWH4lCHB9QfaTSBSEhrnpngP58JraKV3cpH0M5loxpbcUgQG1rf3EpAmTxYUT8xES
         r4dqBkLEvIpYusFDTmNOpYBMiQP1Hz/md/xpKNhsvpQ+EPld6S+S08EhnMPu3oAaMwwa
         yWA1ssHN4SQkjrJYlYD5PSk3cnnN7FHZN8m6Su6iWybxKmN8tJ5btaIOpV2LUNMk53pw
         v9dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature:arc-authentication-results;
        bh=9aQKjqLJlclU/CtXJPCJXObNWHMWuUX+jgx/8N8Ew2M=;
        b=isQeCjuP4XbpfQrca8CFp5FkTl+jjHaMSKFE5XJQ6nWLTYdJb9wIAZ+MVZApbnZnsF
         4YW6PHjdLN8ppYq3X9eKbk05Iqi0Ta4W+Z5Z9zl8WSfH40y4DwkUBcta+GM4Pg9C2GUp
         so1D3JUqxhZGLpzJVhTnSBXvIOgRbMPm5U2lkJxSoDoKe+KfIOpVttsqLJb5ec9Ci9vb
         fTrhl7NQqB8V/sh7C2Te2w4NZ88Ek3NHvRQ84AdBkB7KGJ3q4SArIbF9+qA/yBxCrmOB
         +fn2OdNzsQLOt/95N05dTnlpIj+HWVTnv1AwkOY8+ZhzFLr2KpJ9sCYXjaInkGDGuCg9
         cz2g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@roeck-us.net header.s=default header.b=KIRkyUrL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p15-v6si1344327qvi.256.2018.07.02.10.07.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 02 Jul 2018 10:07:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@roeck-us.net header.s=default header.b=KIRkyUrL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:34370 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fa2IQ-0005YJ-JY
	for alex.bennee@linaro.org; Mon, 02 Jul 2018 13:07:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35384)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <linux@roeck-us.net>) id 1fa2GX-0004Jf-Ad
	for qemu-arm@nongnu.org; Mon, 02 Jul 2018 13:05:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <linux@roeck-us.net>) id 1fa2GS-0000gW-Vy
	for qemu-arm@nongnu.org; Mon, 02 Jul 2018 13:05:29 -0400
Received: from bh-25.webhostbox.net ([208.91.199.152]:46316)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <linux@roeck-us.net>)
	id 1fa2GS-0000fL-Oe; Mon, 02 Jul 2018 13:05:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default;
	h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=9aQKjqLJlclU/CtXJPCJXObNWHMWuUX+jgx/8N8Ew2M=;
	b=KIRkyUrLMlwFRhjFeFbTdaQB5G
	Lwph07b7rXcLl0ZvZ1nYOahDf+/yAs8eqEexsWlYh+1GjQWNCLIMqj77Ua0aeaHBxjEWaNM2ko14L
	VzdkR/TM0KBDiDUalbdy1WlwkudDkbL5zznZVcyL1Bge3RguvMZgO1PQB272EK983+DN+H+8jzJkl
	hytmJoRI/jdtzEWZroxAd7A9F4Uze8aDA9H70/jJVb9yIXtPILkkvz46Y3B313p3KDrijiTDsFpK9
	wUB2ze4aJ11WFXcC90t8Ckz85Pj1ZBSIuTxCvl54WgOJGfdUHaT1Nvs6H6soslqJAWcPHiIhX6+eX
	dTWTBQtQ==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net
	([108.223.40.66]:57464 helo=localhost)
	by bh-25.webhostbox.net with esmtpa (Exim 4.89)
	(envelope-from <linux@roeck-us.net>)
	id 1fa2GR-00AMso-9X; Mon, 02 Jul 2018 17:05:23 +0000
Date: Mon, 2 Jul 2018 10:05:22 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20180702170522.GA9885@roeck-us.net>
References: <1529374119-27015-1-git-send-email-linux@roeck-us.net>
	<CAFEAcA_8TAWdkgTzPPE7eggP4UAHjVPmcXiEa_-RCxDBphJ4HA@mail.gmail.com>
	<20180626175900.GA4307@roeck-us.net>
	<CAFEAcA8PPF1mDWMGSm0r6NtYijwQQG7QnNEJ3iwaaEZU8GTu7g@mail.gmail.com>
	<20180626200008.GA680@roeck-us.net>
	<CAFEAcA_non89OR_-W3Fhr6gG0v0kkgg-ffJx-9K_h=U-Hz_wbg@mail.gmail.com>
	<20180702162733.GB32333@roeck-us.net>
	<CAFEAcA8+ZxcRLBgonZaqpAfumKFvhk7yDhX=Fe0KjoeTxWsczg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA8+ZxcRLBgonZaqpAfumKFvhk7yDhX=Fe0KjoeTxWsczg@mail.gmail.com>
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
X-TUID: 43fgP6RUiWTV

On Mon, Jul 02, 2018 at 05:46:39PM +0100, Peter Maydell wrote:
> On 2 July 2018 at 17:27, Guenter Roeck <linux@roeck-us.net> wrote:
> > Again, in my observation the boot sometimes stalls without my
> > patch. Maybe there is a better fix, but the code as-is doesn't
> > work for me. All I can say is that the current code does not set
> > one-shot mode when it should, and that seems wrong.
> >
> > You could of course take out the zero delta warning. Personally
> > I would caution against that - whenever I have seen that warning,
> > it suggested that something is wrong with the emulation, and it
> > helped me track down the problem. Your call, of course. Also,
> > I don't think taking out the warning would fix my stall problem.
> 
> Can you provide me with something I can reproduce with, then,
> please? My kernel + buildroot don't repro the problem: it always
> seems to boot fine. I had a look at your testbuild git repo
> but couldn't manage to figure out how to build a binary
> from it. I'm ok with building a QEMU from your branch for
> testing this, but I'd rather not try to figure out how to
> reproduce your kernel and root filesystem setup.
> 

I don't think I'll have more time available to spend on this
anytime soon. If it works for you, just drop the patch. I can
keep it local in my branch. My version of qemu is different anyway,
after all.

Thanks,
Guenter
