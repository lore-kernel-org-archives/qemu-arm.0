Received: by 10.28.71.27 with SMTP id u27csp4357065wma;
        Tue, 23 Jan 2018 10:14:37 -0800 (PST)
X-Google-Smtp-Source: AH8x226GKP/RBVYv4vXvEb86p+BgC5uqF0hJc7mVzrpVXeX4Y9nWUOY1sWEhPCXK3fRRTpmNZTz7
X-Received: by 10.129.61.7 with SMTP id k7mr3284232ywa.457.1516731277128;
        Tue, 23 Jan 2018 10:14:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516731277; cv=none;
        d=google.com; s=arc-20160816;
        b=gxxZYru7gyfoHNyA2fEHzpG+9yjK8f9ztC1jiUgJ1qKEXyBCKOFlwYeDR6jGVGS9fM
         AjZkPWMzUI4UNSPCVsxDuy1prpNqXspwK/cP2vkQKxrauzCrK3LzD6/G+1yVMPxQofgi
         HSxncNvxH5t2/kZVh/wdKUk5RA0Xg+ctZNhH4+ircSA7kTSXn7DYaIhnG5m+GE6A8UBG
         +j7TIF7TEeM/umEs0GrpP49dgKztEvVGFd5D2l3R0NHuzHGQA+efNJaLuc7fnyYCDTZb
         X3I9MRbUF/qsfQqePkAhsSnm8YjXhSvpuTdHgvgr1MkVwuG4UuwDq89vbnWli3qF+yhF
         wYRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=Vsyj+QDGds3U/lgkIDblPTIi/n/DiCpEoJc2nLZsE7E=;
        b=Tp1z5A0QrO7R0VfISkEGBpEyLo8yMQdKdAT8hbhatfV58yCRgibnzsWULQYjP6G2EJ
         8eRZINKt1e7jETz0/IinTLzzx3ESCN91KkhcD37bmVG/sIZwP6SAki+rAth5ojZb/GCD
         xT8+15T8TqEm/xuoA9Tz3ESc2SFkt63ACcOPSLMNlgKV7RH/jqUNt9mvdF9Pw4liMkFu
         SN6UK/HMTQdDmIqAZJJdbgDn8upOSzYDCK0Exf42KSfIWp7peXz+22IMVLdD7LPz9oFu
         QHzLCI7igdZPVaNOMr320cxaP+HO0OV6Brlt7pHtXGQ04HU2BdZuYSKDIohcMm6+DlvI
         6y2A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Jold7xM9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w128si4118368ywf.353.2018.01.23.10.14.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 Jan 2018 10:14:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Jold7xM9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44192 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ee35g-0007lX-In
	for alex.bennee@linaro.org; Tue, 23 Jan 2018 13:14:36 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50910)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ee35Y-0007l7-Gb
	for qemu-arm@nongnu.org; Tue, 23 Jan 2018 13:14:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ee35X-00082x-KB
	for qemu-arm@nongnu.org; Tue, 23 Jan 2018 13:14:28 -0500
Received: from mail-ot0-x244.google.com ([2607:f8b0:4003:c0f::244]:46917)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ee35X-00082d-F0
	for qemu-arm@nongnu.org; Tue, 23 Jan 2018 13:14:27 -0500
Received: by mail-ot0-x244.google.com with SMTP id t35so1227992otd.13
	for <qemu-arm@nongnu.org>; Tue, 23 Jan 2018 10:14:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Vsyj+QDGds3U/lgkIDblPTIi/n/DiCpEoJc2nLZsE7E=;
	b=Jold7xM9Er4lTZtLbecH8LsyIBRZYdedjR+wSyOBUFYo4bkXRrgmVmtp0V4Zviuhi8
	XcUpPiRwWfmMqMKh+AHcx4JWGROXIqrMpzKZby1Z1AGkwBpmoxhgu0bamGKzQfQw/Rao
	WFcNTpZj3dlmvfNOfrc9UcueyfQ4y650xMtJo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Vsyj+QDGds3U/lgkIDblPTIi/n/DiCpEoJc2nLZsE7E=;
	b=XSVjlCI1KlaUBwfKCJnzcuQj/uZo3rO1rhMIQoDzsjHcnMV1G7u6XobBRZJtX+DkgD
	MoVIEnFZv6634N8t1a4GLc8SbrWo8cmKuYXwGiXBZdibD3ZqMCGAyrHEKwiS+F8xyWl3
	53bJGaGdpBc35n5ailN3bRpLOOm+CtVtc02Adyn7T2AKlmPkWxG6mrjxrQ+RgHL6glzH
	UtDjlA7SaQmWwqdCjciKt4p4g+NibhH/Zt1/1MDewNJh9Qyamgl9BambgWmbJ7+QRLOA
	XRx3b79ig6anp3PZkMz/Q60H+JPiXDdyF34BpritV2/87Ar/JT8MrgqObnqqaHOXEGxy
	3STQ==
X-Gm-Message-State: AKwxyteXb/O8ioBJc0UlMGliRvaQ277B933rbLkILhiV5aXwHPwqHkf/
	TMBTLTV2eHfYGg+8DcLpjfoW5bT7Vsq5HdKX8+bSMQ==
X-Received: by 10.157.29.229 with SMTP id w34mr7097591otw.24.1516731266647;
	Tue, 23 Jan 2018 10:14:26 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.61.133 with HTTP; Tue, 23 Jan 2018 10:14:06 -0800 (PST)
In-Reply-To: <CADYoBw36gPOyiK36WaS0v_2R=iuWYL-sQAtffrZZJU2DpMv5Bw@mail.gmail.com>
References: <CADYoBw2dogvU6-3vChG4js0BNdyTPG8eDvMSRoU50eTX_9DdEQ@mail.gmail.com>
	<MWHPR21MB01590CD596A992C93E01B5079E460@MWHPR21MB0159.namprd21.prod.outlook.com>
	<CADYoBw1ksGDo26-PC4eMnyqxZQoZkXNLDeGoWfcRHs-SfTCJkw@mail.gmail.com>
	<MWHPR21MB01591543E188B048145985709E470@MWHPR21MB0159.namprd21.prod.outlook.com>
	<CADYoBw0RjiW2as9jGtPg92E8XK3KR+gM9C5vjC7HHsBauFn4ug@mail.gmail.com>
	<CADYoBw19GifmUR=Rztkzzc-v3-zWR6frjiNb_wjzsevreAqPDQ@mail.gmail.com>
	<CAFEAcA9_+wZJa7Ht6EHCCZYm+hrfdbjd9gUmVJPGgZ0yvbZOPA@mail.gmail.com>
	<MWHPR21MB0480DE1F826056BC8377EE289E250@MWHPR21MB0480.namprd21.prod.outlook.com>
	<CADYoBw31C0Z2vp0S0ZFBOC6A3146wxtZWvzJabACkGh44ZwC0w@mail.gmail.com>
	<MWHPR21MB0480A1F01D2CEF51E7CE21B09E3A0@MWHPR21MB0480.namprd21.prod.outlook.com>
	<CADYoBw1Ro5gxROvhCVXGv0=-Y8zXmGbKR3D6xOqhkb0zp__LkA@mail.gmail.com>
	<CADYoBw27wU3CsYPeP7ONFWt4aj+6tvzwU5roDSOKz8qq1n8GSg@mail.gmail.com>
	<CAFEAcA--i8RVKaBw5yXn4xRXBy5S+Yk=WDNKbuqzfDxn6jjtOA@mail.gmail.com>
	<CADYoBw36gPOyiK36WaS0v_2R=iuWYL-sQAtffrZZJU2DpMv5Bw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 23 Jan 2018 18:14:06 +0000
Message-ID: <CAFEAcA-1xLL1e=tyLg0d3V_PJBKjwEWNxnajTd-8trbGaR=4iw@mail.gmail.com>
To: bzt bzt <bztemail@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::244
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] BCM2837 and machine raspi3
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
Cc: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WyW1Ywfqo0hg

On 23 January 2018 at 11:49, bzt bzt <bztemail@gmail.com> wrote:
> Hi,
>
> On Mon, Jan 22, 2018 at 1:12 PM, Peter Maydell <peter.maydell@linaro.org>
> wrote:
>> Can you send this as a proper patch email, not as a reply to
>> an existing email thread, please? (This makes our automated tooling
>> much happier.)
>
>
> Only if you're not demanding any further nonsense modifications.

I think that patch review will be much more pleasant for
both of us if you tone down the combativeness here.
Yes, sometimes code review comments aren't right because
the reviewer has missed or misunderstood a detail -- but
there's no need to throw insults around as a result.

If you don't have the time or don't want to engage with the
community's review processes, that's fine. But this hostility
is not pleasant to interact with and off-putting to other
people reading it. Please stop it.

(Sometimes a submitter doesn't have the time to work with our
review process, and that's fine. It just means that the patches
will sit on the mailing list and perhaps in future somebody
who does have the time as well as the interest in the feature
will come along and pick up the work.)

thanks
-- PMM
