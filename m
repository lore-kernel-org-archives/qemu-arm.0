Received: by 10.28.173.206 with SMTP id w197csp3865288wme;
        Tue, 9 Jan 2018 08:12:37 -0800 (PST)
X-Google-Smtp-Source: ACJfBosaUxnUHqWGfhXZTiFVGdAl5HhCrcu81FWRgkqw5tJkGsZ8NlaaQmViAuXirGxVCRG86z2r
X-Received: by 10.129.182.76 with SMTP id h12mr7973529ywk.207.1515514357054;
        Tue, 09 Jan 2018 08:12:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515514357; cv=none;
        d=google.com; s=arc-20160816;
        b=NONP/csOQh4PDOffSGrDQC0CS6yXoIpXH5e+NvcSHG++XiFKQ8YzOSzCrngdvbYdwV
         QHSTsipmMs5wjUHXtsY4WfOqs9PNt7TAAtpiPGXphuV1P2XN0BPdcRiy8leIZ7DtDyCN
         RWbVDwS930BdRggP8MkESxWbOn6O9mW4s+OOeeify23MsOl3MVoobYaBrqbRIr9HCLTr
         D9lPvx1zMZ1JmH/M58A51VXtgi5FT01BoqvF5KhUX3wUtkEPTMPTdV6cbw6s+b3sas8a
         N9evlTpyxmp85IQWSjGWRAPxNcUJ6t824EnHs5i/vo/7CxP6kBuKnzwCgN/bVrnEF+bW
         kglw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=vZE7zC9IROs5YSC3jPDdKAQY+Au8dbSxGUxJB31+reI=;
        b=hBXkt5OcQ5MazqnoSkEwB7wxhWNC8+VXm1063zkb87q3I1YFjErqPnRu/zlEaF18bq
         38eHDqrw3n/Ztmt3WgCZwxASV8NFZIFQlPrC3TjyZd+SGsaRqJI+qhrtM8Xr9+JmLV9m
         NHedEouZH+CuevGnWpZmbA6uXi8xx4pRZ073mzNO1bH7bD0Q5a8Da4S5/OTjH10OJchP
         9C8cLK0ayYRuH5arLrLtNss4k3+XX6kaF/SDst9I9+ECiAKgDmwqBsZJjddaEOL8QspV
         eX9bJ8TYO/ihTVJs+qH9zBX70GvX29muHHIv9KxeGtYLtNL95LyJ2U8GuJeDI9n36Imz
         zPMw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ie0Qnr2M;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j2si1245917ywc.55.2018.01.09.08.12.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 09 Jan 2018 08:12:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ie0Qnr2M;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60282 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eYwVw-0007zI-HJ
	for alex.bennee@linaro.org; Tue, 09 Jan 2018 11:12:36 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54217)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eYwVp-0007z5-GW
	for qemu-arm@nongnu.org; Tue, 09 Jan 2018 11:12:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eYwVo-0004mr-EQ
	for qemu-arm@nongnu.org; Tue, 09 Jan 2018 11:12:29 -0500
Received: from mail-ot0-x22c.google.com ([2607:f8b0:4003:c0f::22c]:45387)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eYwVo-0004mE-9H
	for qemu-arm@nongnu.org; Tue, 09 Jan 2018 11:12:28 -0500
Received: by mail-ot0-x22c.google.com with SMTP id o1so11745515oti.12
	for <qemu-arm@nongnu.org>; Tue, 09 Jan 2018 08:12:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=vZE7zC9IROs5YSC3jPDdKAQY+Au8dbSxGUxJB31+reI=;
	b=ie0Qnr2MpCY32+lVz5cAD1uZQPucOhC4PGurq11zXrGxsvDY3ykSEG1o6tAXQ1VeHF
	gPDxWm0EZLVbq0yR6Du5bKa4hrlsxPv6+J2ntBifk3RITbaHjVOvcY6E56tSP49D2XhO
	UcA34M/ciDMsSOlOVIoCxFDXCAb/l6Xf3WcyM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=vZE7zC9IROs5YSC3jPDdKAQY+Au8dbSxGUxJB31+reI=;
	b=gSvajNdJQWqUewhWbEmO/3phrMSuPrMIOB9sgizQeEpZXCgxxjspGOQgS8nq0Szpb1
	y3Ave6/tyB8wHk2m5JbUlGzsMbX86Y3IzivJ2T14kxgd2Qv3FqN8ojoqBiduVGi/m81M
	H6nWEHEAIJgrTy5wN2g6Wms2RRj9xliv8c0A+EBCK3lK57NGTUHrOqZpo4Ojc5nMTiQ9
	X7qm/FFakg7bDO9EGCJa5FU5yyT4U1VRNpbAj18BtNnesdRbCBP1Z2ZRsG2d2XA4HmRx
	Od0+yYtskTLOx3Zjq+PpD4wBcMHwB8WkxIbifGOjAvQrmY9JN5Z0Hn5G/YrSLbBJhcD9
	jM2Q==
X-Gm-Message-State: AKwxytfmCvQyeDDqF9TVznw8twcidLoi9nxEGOOLkHHlgG2Kggg8oOkq
	/lI1KoIbPDLUix2+Rog8dheMDxfUJl626IakeQGeQg==
X-Received: by 10.157.29.233 with SMTP id w38mr7932844otw.24.1515514347452;
	Tue, 09 Jan 2018 08:12:27 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.15.71 with HTTP; Tue, 9 Jan 2018 08:12:06 -0800 (PST)
In-Reply-To: <6d20557d-5722-706f-ca4f-489ab85358c0@redhat.com>
References: <1513183941-24300-1-git-send-email-peter.maydell@linaro.org>
	<CAFEAcA8NbL7ROZs99hWhpAF2Rdi2qEiWLNo3hr_9W7gmgXyw4A@mail.gmail.com>
	<6d20557d-5722-706f-ca4f-489ab85358c0@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 Jan 2018 16:12:06 +0000
Message-ID: <CAFEAcA-Nn4VmSnxT7Of8Nh+p5QgF9cMzkqZ-VBCC=2zRgk-Xdw@mail.gmail.com>
To: Laszlo Ersek <lersek@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::22c
Subject: Re: [Qemu-arm] [PATCH 0/2] GICv2 & GICv3: RAZ/WI reserved addresses
 rather than aborting
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
Cc: Drew Jones <drjones@redhat.com>, "patches@linaro.org" <patches@linaro.org>,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Auger Eric <eric.auger@redhat.com>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dYoWCyxbj8mY

On 9 January 2018 at 15:58, Laszlo Ersek <lersek@redhat.com> wrote:
> Sorry, no clue about any of this -- where should I read up?

I cc'd you mostly as a heads-up since the QEMU bug is UEFI affecting,
not because I wanted to make you read the GIC specs :-)

> Ard did ask a question though:
>
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg500055.html

Sounds plausible (my UEFI binary I hit this with is pretty ancient)
but I don't know for certain. It's one of those things that seems
like it's a bug in UEFI (perhaps now fixed) but which is also
definitely a bug in QEMU, and if it is a UEFI bug it's pretty
harmless.

thanks
-- PMM
