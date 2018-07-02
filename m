Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp141165wrq;
        Mon, 2 Jul 2018 10:58:18 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdr4T8cPO0jhKWWmF9rPqzxUqYAr070g2W0UMxt+REEU1VnMsXl2UloelH+RHxpXDaQyyd0
X-Received: by 2002:ae9:eb43:: with SMTP id b64-v6mr22799145qkg.71.1530554298311;
        Mon, 02 Jul 2018 10:58:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530554298; cv=none;
        d=google.com; s=arc-20160816;
        b=tEZvK0+owEZF3dzt6KkQo6YGD1x+1moxSEUqaKcfA2EpEs+aQM2hsHQMlCTvyo6zUY
         +AP4zjrz+hm9HCCV7CFzXeIhw1eIjZWPE6Aw9yBoDEsAcC7v7fGsFNaSYXq8VB4qk4i6
         OmqpgYjSfpKU7nvbA09Njp+bKY92vqWIJSn9FOGuzhVQ332P48UAEx3lSN9Evi9FZskr
         m5GZJS5VbEnk7PQwUgAhGv5cWBdiYkoypkKw1N86CbPwFGvctLmIq1E/oAeyi+479WlO
         EewYCY4FAE4/JPfsBFB+9onb7Dq0CRJVef/9Z6yjRanaJ54qQ09rPNaPl9kJVCnP8pRu
         JQuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature:arc-authentication-results;
        bh=1tl4wU+gF53cPJEfI+Co3JUIRb2BSsJi+qAROBf3DXs=;
        b=PhwpxKrFiqmS5tEGm3797vuxHJHqVR159ITaywya7mHVF7WPkSNtWdtZjzdQbfCb0c
         r0PWvZWJiitMuEjw+m8oG4qldZqgi5isDzPTB3sDYC17O3jDOAbUtrybPEddgsFQ+OyD
         zxO9Gi7ITS/9OlYdLnhj5/WDOfaA9P97TX4jPEza4CB1IDi2nxRgMo9fZ4AsMai1ptDg
         KD9go8tpWKxH3zKMuho2xqdz/rUExwv++XfjNc0lq7M6HI30N2zjdSuKiddfIjjvlycJ
         9NXDs3SDm8r952blCyCw0xRB52xBW0RETmYJ9ymzScXv/tKzP9UJbLLFf0BXhtf7teiu
         36hA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@roeck-us.net header.s=default header.b=xMYfeEmn;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o24-v6si8321063qtp.120.2018.07.02.10.58.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 02 Jul 2018 10:58:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@roeck-us.net header.s=default header.b=xMYfeEmn;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:34677 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fa35d-0001fY-Sz
	for alex.bennee@linaro.org; Mon, 02 Jul 2018 13:58:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36011)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <linux@roeck-us.net>) id 1fa35B-0001dO-12
	for qemu-devel@nongnu.org; Mon, 02 Jul 2018 13:57:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <linux@roeck-us.net>) id 1fa35A-0008TZ-1X
	for qemu-devel@nongnu.org; Mon, 02 Jul 2018 13:57:49 -0400
Received: from bh-25.webhostbox.net ([208.91.199.152]:46241)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <linux@roeck-us.net>)
	id 1fa355-0008OR-B1; Mon, 02 Jul 2018 13:57:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default;
	h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=1tl4wU+gF53cPJEfI+Co3JUIRb2BSsJi+qAROBf3DXs=;
	b=xMYfeEmnvAZUzqJvtS1iCJlyM7
	z33lZTFTSOkL60bd2utJAsq+2Exba/p23q0wlviVOuZHFwtBnuOIc2OkiDXjFALZKjayouWWGbN15
	u0ORUwaAR7jKIzP36fO0XI/cfFf/QagsJZNXxuhanibUIscREDwL3mQEAay50jb6wlD9rQvkFVhB/
	WgiUN4VGkvtOaW4ax9M/bu0R9ESI46upfxhxNoPakUxu2pOVRnGBascl2heDwgSEEBkXJO3Y2xqjH
	Flm8uhz/sWzQ5TxJtAgFBjjdj6JDFDjD/xAakLRrigMynNsyRXZpO7KGE+vr6oEALKzRV0PO8orjj
	R3tqGXFA==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net
	([108.223.40.66]:57684 helo=localhost)
	by bh-25.webhostbox.net with esmtpa (Exim 4.89)
	(envelope-from <linux@roeck-us.net>)
	id 1fa353-00BSiY-Ko; Mon, 02 Jul 2018 17:57:42 +0000
Date: Mon, 2 Jul 2018 10:57:40 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20180702175740.GA14904@roeck-us.net>
References: <1529374119-27015-1-git-send-email-linux@roeck-us.net>
	<CAFEAcA_8TAWdkgTzPPE7eggP4UAHjVPmcXiEa_-RCxDBphJ4HA@mail.gmail.com>
	<20180626175900.GA4307@roeck-us.net>
	<CAFEAcA8PPF1mDWMGSm0r6NtYijwQQG7QnNEJ3iwaaEZU8GTu7g@mail.gmail.com>
	<20180626200008.GA680@roeck-us.net>
	<CAFEAcA_non89OR_-W3Fhr6gG0v0kkgg-ffJx-9K_h=U-Hz_wbg@mail.gmail.com>
	<20180702162733.GB32333@roeck-us.net>
	<CAFEAcA8+ZxcRLBgonZaqpAfumKFvhk7yDhX=Fe0KjoeTxWsczg@mail.gmail.com>
	<20180702170522.GA9885@roeck-us.net>
	<CAFEAcA97xX72WabGwn7GAQJxMcpzYzyV9yDBg1qF0zLuSDZwSA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA97xX72WabGwn7GAQJxMcpzYzyV9yDBg1qF0zLuSDZwSA@mail.gmail.com>
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
X-TUID: 64Qc+0CmJ01A

On Mon, Jul 02, 2018 at 06:10:36PM +0100, Peter Maydell wrote:
> On 2 July 2018 at 18:05, Guenter Roeck <linux@roeck-us.net> wrote:
> > I don't think I'll have more time available to spend on this
> > anytime soon. If it works for you, just drop the patch. I can
> > keep it local in my branch. My version of qemu is different anyway,
> > after all.
> 
> I'd kind of like to fix the bug, though. I'd just like you
> to provide the image you're testing with...
> 

Ah, but that won't help. We are dealing with a heisenbug, and me using
a different host than you (or even a different gcc version) may be
sufficient to make the problem disappear on your system.

The mps2 images use high resolution timers, which is likely what is
triggering here. My working assumption is that those timers trigger at
the wrong time because the timer is set up in periodic instead of one-time
mode. With that, behavior is more or less random. On some systems it will
work, on some systems it won't. Since we can not agree that setting the
timer in periodic mode instead of one-shot mode is a problem, I don't
really see how we can proceed. I would somehow have to prove to you that
there is an observable problem in the first place, well beyond of what
I already did. That might take a lot of time - much more than I would
be able to spend on it.

Guenter
