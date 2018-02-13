Received: by 10.28.71.27 with SMTP id u27csp1127356wma;
        Tue, 13 Feb 2018 03:16:32 -0800 (PST)
X-Google-Smtp-Source: AH8x227DzIpsYa/R2s2EEfQWVyatVenfSwiQohwoamwpmu/T7qAvhoGGlVTJzzm8J9IrRo3pAMoZ
X-Received: by 10.129.72.84 with SMTP id v81mr420912ywa.241.1518520592496;
        Tue, 13 Feb 2018 03:16:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518520592; cv=none;
        d=google.com; s=arc-20160816;
        b=agS670pWOQgTlYMrL2bDbUpXNqvaFbtPWviP/7IpJ5vcjcYKEKsGklySbMk8P6XUED
         aSa4mlPg6mWpibC9Eiu8z2D2hHhcEVimu3wOc3ATUYDz1xcEcLvXcesugTPt77veTMY5
         zWhMIVqQyiVPYEDHmKaZv2RrGcCFI/iyGXCa8InDuVqICUGKF48asPy3Dhx+/R18B+8V
         +kQjyWU0GH/9b9f2EvKrOrShmBQFFkA2MYKe9VVokI5iU94fqfpcHtFJ0CaXreNrqrZ3
         SezMrer3G4NDuRyF/dofV+vrho25GjYgobdoTbbmtlSkHseIya+ab6qZcZAv0ZBdng5u
         FxXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=ZaBauah4kxQuEtc8WPzKcu23LNAh1zc5A/3eL1sn8Lo=;
        b=sac6rdVtIYlAo0IGm3EDSFqtm6S4JlYCl5BD5cCFndAO0tHSgtz25dN1pjSQLdoWEH
         PXlPvOZRIMuvpXQkl5JDRcstDwVpb25K9GdRUmDKAV0jdgZAckKjl/8Q5kewx0VjMhDl
         H1IFcqJbpbFkifPLLAf3XKzhcZL8JbCXR2uLc5ha0LRWOuYz7XsHS/QsxmzB49UbBMR+
         +k8Ccy4lIl9nsixZD8J+nKdKBBPf+6y+GUha+mYdWgVtw3z+Ph2jI2/Szon2PC61ChnT
         UwIRWKa0vp0dy5GEYdT2lCZFTnOKl5haV1BH+y8RdLd11mkPt9Yw13+nwq0NFjqIPqeK
         g3mw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=I+DUeZpc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b21si1880706ywe.372.2018.02.13.03.16.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 13 Feb 2018 03:16:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=I+DUeZpc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44217 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1elYZb-0003E9-SZ
	for alex.bennee@linaro.org; Tue, 13 Feb 2018 06:16:31 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45080)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1elYZO-0003CB-3u
	for qemu-arm@nongnu.org; Tue, 13 Feb 2018 06:16:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1elYZN-0000aJ-4L
	for qemu-arm@nongnu.org; Tue, 13 Feb 2018 06:16:18 -0500
Received: from mail-oi0-x22c.google.com ([2607:f8b0:4003:c06::22c]:38691)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1elYZM-0000Zy-Va
	for qemu-arm@nongnu.org; Tue, 13 Feb 2018 06:16:17 -0500
Received: by mail-oi0-x22c.google.com with SMTP id j15so13625732oii.5
	for <qemu-arm@nongnu.org>; Tue, 13 Feb 2018 03:16:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ZaBauah4kxQuEtc8WPzKcu23LNAh1zc5A/3eL1sn8Lo=;
	b=I+DUeZpcudo53s2oUfbZPbiwjLnD6xZxTCt05JSf7lBq5ESn4a6/Yq/yoDtRAFY85x
	3Zmv0K3sdcHCXBu8n7N1O1+EK5fNb59mE+FFqN39AU9g1Jg1jtDxYNDn9NvJ42zyPLfd
	Ls607eaer2+e14kGZKSoCwNsvjJIQsTLHB6QA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ZaBauah4kxQuEtc8WPzKcu23LNAh1zc5A/3eL1sn8Lo=;
	b=YOQmOZuyw4SZMglx7VXwvxp1/Hy72AXDp/9OoaMwUjHzOC+AQzNQlbfLUFNBy4S/QM
	/a2B+2nKajVX9VgmcVciJzQ7CTPTi7Kpde3p3CctyVgZ+kmbj+HXA6T8sPlQV1mWtoRG
	Ir9e9YqLBNC/ODf3A3kzd0nblilO2thUt/0Kan5Eoh5cN51XAHNyGFEDqxGtB0k3N3ph
	g6Lhhxl7q57Irhln1k8EIbYwJMryLgVnI1x2wb7yKxmXAa+9KhyD9GcnKQBM8S5f6ePZ
	Iaad+Ows61MLRrbppwqjxXuMEGIziTTmGL0GCuyrfDQvLJwaF1m+M1PJVThJzFZWu8bb
	wszA==
X-Gm-Message-State: APf1xPBP1hMJ+J+mVuqhGiQ+sQeiSXn5RKrUswFHpV+EnU3Ar3UYMiOa
	/7YX00kP9cst01RosE84of7aqNPa+VJEYCxgZbx6xw==
X-Received: by 10.202.252.68 with SMTP id a65mr527104oii.256.1518520576023;
	Tue, 13 Feb 2018 03:16:16 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.34.163 with HTTP; Tue, 13 Feb 2018 03:15:55 -0800 (PST)
In-Reply-To: <d23a2730-a103-6336-0658-e12fa9b0193f@lauterbach.com>
References: <d23a2730-a103-6336-0658-e12fa9b0193f@lauterbach.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 13 Feb 2018 11:15:55 +0000
Message-ID: <CAFEAcA-tc+-+KLcMPB=BV0zCmO6t7tuKHM4=kyRf_Xx0aCCidA@mail.gmail.com>
To: Abdallah Bouassida <abdallah.bouassida@lauterbach.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::22c
Subject: Re: [Qemu-arm] [PATCH V2] target-arm:Add a dynamic XML-description
 of the cp-registers to GDB
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
Cc: Khaled Jmal <khaled.jmal@lauterbach.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PBoBr4WXHWfZ

On 30 January 2018 at 11:16, Abdallah Bouassida
<abdallah.bouassida@lauterbach.com> wrote:
> [PATCH V2] target-arm:Add a dynamic XML-description of the cp-registers to
> GDB
>
> This patch offers to GDB the ability to read/write all the coprocessor
> registers for ARM and ARM64 by generating dynamically an XML-description for
> these registers.
>
> Signed-off-by: Abdallah Bouassida <abdallah.bouassida@lauterbach.com>
> ---
>

Hi. I tried applying this patch to review it, but unfortunately your
email client has made a complete mess of it. In particular:
 * it is wrapping long lines
 * it is converting all the leading space characters to unicode
   non-breaking space characters

which means that it won't apply. Can you resend using something that
doesn't mangle plaintext, please?

thanks
-- PMM
