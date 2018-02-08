Received: by 10.28.71.27 with SMTP id u27csp2076151wma;
        Thu, 8 Feb 2018 05:51:56 -0800 (PST)
X-Google-Smtp-Source: AH8x2278sCSlOaSJqchf86+wmYJKhnZ9cusl+Hdfb6ZoAwjF07RIjbj2a9PQ9ndyRp6WYmtm7iew
X-Received: by 10.129.166.135 with SMTP id d129mr472536ywh.339.1518097916137;
        Thu, 08 Feb 2018 05:51:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518097916; cv=none;
        d=google.com; s=arc-20160816;
        b=Cokmh2rDmhv5gcVm4oKAOdEtqkogRfPhaENWCHYI/YBOdO+SuNpzIdNJbwaBtnWkGc
         Zoeby0rFut+LhCSRqiXz8psQjJOLBoB4mgzIx/ULEr1HLzWgfuLpCtxyeOyKPpguJ4Dm
         Onw/qIfU7gddnIaLOY71X0RgkHKMIfw20FA1xQBk5Z6A86Gim0KoZT5UC8ixSSqHi2CT
         GxoKj9ByvWLAdodTDJWc4qOrMVMN9R7cOqw4QppugoVeAS0zBeUJkElKGwFlh9H9Inr3
         AXdUc59dCWUBQalCd1iYwHToHCfNGZft54XJHCp+7zkbPOnX1idCl0OnkUAn7xAXi3Jx
         cLJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=U+sm9HqISG6Hymm/PQNoi6ymYeb5M1WMWs52v0p+058=;
        b=eM7LaD0Dbg1I1bwFXl481Cr0cW8vVpt3FwW18+PlxQXHiwUn/5sQ8rnawVaFaNWVkV
         PoZP7ixwC1Npaeg/52ajItgRFo9CpkVFJO8mYhlr/y7S09k42pC03mWQTUMqoyiMwakf
         e6u3P9jdmjKQL3H0PG8ahoOTYo3yMtlcJ8oetLIx2HTndsNqTSsYmfi3vxMayP/61pW5
         R7738QvR0D6D/PgJ/3WzuKlWBQWKiMTh9M2NtZStj28y8iHPSVt3NcY+TghMZH/l6iwv
         7o6Jr6ziptAfJv6k8KR9c/5Ea8fwq8szHqBz2FN0JvwJiEYHkEbKYmAcfTL9xpWwU57G
         TSqQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=GZpe6p8R;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y2si3349ywe.341.2018.02.08.05.51.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 08 Feb 2018 05:51:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=GZpe6p8R;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34389 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ejmcF-0001cI-Jr
	for alex.bennee@linaro.org; Thu, 08 Feb 2018 08:51:55 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54278)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ejma6-0000Ut-LX
	for qemu-devel@nongnu.org; Thu, 08 Feb 2018 08:49:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ejma5-0003SG-H9
	for qemu-devel@nongnu.org; Thu, 08 Feb 2018 08:49:42 -0500
Received: from mail-ot0-x229.google.com ([2607:f8b0:4003:c0f::229]:38642)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ejma5-0003Rv-Bw
	for qemu-devel@nongnu.org; Thu, 08 Feb 2018 08:49:41 -0500
Received: by mail-ot0-x229.google.com with SMTP id h14so4359065otj.5
	for <qemu-devel@nongnu.org>; Thu, 08 Feb 2018 05:49:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=U+sm9HqISG6Hymm/PQNoi6ymYeb5M1WMWs52v0p+058=;
	b=GZpe6p8R7pe47F6CkrDbPpMmJbeJfi7zx7FUhb5dltpTwRvfyI8gmTykg0XMMJnbpS
	bBrY1IrLafMcrMV1hXErBp+yGgoMS8OMbruh25zf90CL+Mor0XKIUvu2ovQ96tdXRqEO
	kDWqd+kl7p0jnfRM7b9QlczhMzQj7I9u70gpQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=U+sm9HqISG6Hymm/PQNoi6ymYeb5M1WMWs52v0p+058=;
	b=pleJ7l2YDMFqKmZ4TpLXcs/lnq2dqP5qYuTzNdCgH8cyBLCkaXBFRc9sBG11sdVCx6
	LDl6Gts/VmbS/uB39+QXOF7lAyx11FncaAHzKKD//cKqXDKvD/2X52QIORvAaK/yhv4X
	eh7GZtnfRti7pMXNJdhgYXi8VgyMNbmtVsBGAVrtt9jnJXREbddscDq4le0JaJu2TTvi
	bYTk/BwdTABbylRTFflfH4be2atL+9dHrzY/BWgK8+zZowdr0d17wuZ/rBmwAqo/2QXM
	U7jEqNfbtbRC2Q48iP74+jG7UPIpcJDLdBeDege0NZ8NHRpZxW1kGby+HTWa5wVBQCxb
	4vhA==
X-Gm-Message-State: APf1xPC7+71TuPe1wSrFkWRaX/uq2WlyKjsTJK+hyGIKo6FPlFgQi/mL
	/jzH45ubwWvb3k+PHk+TCckg8p6QMpJokrZ8gQ87PA==
X-Received: by 10.157.29.211 with SMTP id w19mr557645otw.24.1518097780402;
	Thu, 08 Feb 2018 05:49:40 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.34.163 with HTTP; Thu, 8 Feb 2018 05:49:20 -0800 (PST)
In-Reply-To: <20180207042438.15422-1-andrew.smirnov@gmail.com>
References: <20180207042438.15422-1-andrew.smirnov@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 8 Feb 2018 13:49:20 +0000
Message-ID: <CAFEAcA8ERQQadvAdqhWbK+6hbLtvFMrA=X8R7UBcQpAKifDpOA@mail.gmail.com>
To: Andrey Smirnov <andrew.smirnov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::229
Subject: Re: [Qemu-devel] [PATCH v5 00/14] Initial i.MX7 support
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
Cc: "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@zoho.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	qemu-arm <qemu-arm@nongnu.org>, Andrey Yurovsky <yurovsky@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: eYIGV9J8fDR+

On 7 February 2018 at 04:24, Andrey Smirnov <andrew.smirnov@gmail.com> wrote:
> Hi everyone,
>
> This v5 of the patch series containing the work that I've done in
> order to enable support for i.MX7 emulation in QEMU.

Thanks; I'm applying this to target-arm.next. There are a few minor
tweaks I'm going to make in the process, but I think that's better
than making you do yet another respin. Those changes are:
 * dropped stray blank-line-at-end-of-file from a few patches
 * fixed a couple of over-80-columnns lines
 * added a ESDHC_UNDOCUMENTED_REG27 define as suggested by Philippe
   (I didn't reorder the switches to put 'default' last though, as
   that didn't seem necessary to me)

If you get back to me today about the GPL-2-vs-2-or-later question
for patch 13 I'll make that change too. Otherwise I'll drop 13
and 14 for the moment.

thanks
-- PMM
