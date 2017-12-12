Received: by 10.223.159.74 with SMTP id f10csp3883528wrg;
        Tue, 12 Dec 2017 06:27:35 -0800 (PST)
X-Google-Smtp-Source: ACJfBouK/FkOef4gAFlYCGJAiggu2pLuqpd/L5PeooPDt8JDFNc0AN2Wj47mKqspMaWtDlnGmngw
X-Received: by 10.37.171.71 with SMTP id u65mr3090136ybi.240.1513088855559;
        Tue, 12 Dec 2017 06:27:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513088855; cv=none;
        d=google.com; s=arc-20160816;
        b=0wjJeJYiZ+lhi+cCtSUMKa0RZ3uvYLr9cbxvN+8POPMk6O+Bd8D+j8XMoR/L+Inz2u
         AASf5CvdvfY4wgSUibR2mKN83qDErcMBuep6t3oYrAqEtX1Jg2Y8m+8u6z+xhDE0ugwq
         sbuw8JbDYvXl5MrjEoh9go8xtJBZNwwmwDfUvRiP3tmsW0f2IbS5V0Nvka15dwMKIHoi
         QM2Qfy7GufFleJ3h1+6SC7Gh4qO2qj/ob9HvUHdtEbc0jQHzqgNomQrF/3VRA/dEa06R
         HzTfBSYhSPoScwgAWQ+oX69JSqEuC5l6xVbkcnluqhRhLIQnmvOfRKlneQlKzlfWmY60
         XbzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=yTqqAhWnQedNodDiDVwCcnSMMMxb3LQHRi/GK9epdDk=;
        b=K18PpF5QbwGB00zqZqViUUOiCYEvnlvEoY1KeWsg41U3fSBsrk6ZZfwCU8xXvkA7mw
         66K32tAmtor041cb3kmT+5i0v5Nnif3zOMwYxleh8t9y+uMNgg7bZCeugnK8xp4hQaHh
         VuuZb67A7xqJAr0RMchkGPQdOSHeHy5hbMPzh7xhwQ6iL67HQRqEu5AQMMy23rIEM8YW
         IXW1v//JKs3kCMQJ1PR2lqhEzYxheBLMVMygb8brQVtpFpvkyU1FIKIPGCmSp08CDzci
         K/Oy7tMmmHisA9BvYOWNKlsSmY5000lmQVZe0G7lcP89r/rdZaLwGafY4Pnz7cXdOohs
         AasA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@zx2c4.com header.s=mail header.b=NIok3ijz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=zx2c4.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w64si185247ybe.694.2017.12.12.06.27.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Dec 2017 06:27:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@zx2c4.com header.s=mail header.b=NIok3ijz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=zx2c4.com
Received: from localhost ([::1]:58665 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eOlWw-00027o-Tg
	for alex.bennee@linaro.org; Tue, 12 Dec 2017 09:27:34 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47400)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Jason@zx2c4.com>) id 1eOlV7-0000mO-V3
	for qemu-devel@nongnu.org; Tue, 12 Dec 2017 09:25:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Jason@zx2c4.com>) id 1eOlV7-0003iK-2G
	for qemu-devel@nongnu.org; Tue, 12 Dec 2017 09:25:41 -0500
Received: from frisell.zx2c4.com ([192.95.5.64]:58935)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <Jason@zx2c4.com>)
	id 1eOlUx-0003Xf-BK; Tue, 12 Dec 2017 09:25:31 -0500
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2433bdda;
	Tue, 12 Dec 2017 14:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
	:in-reply-to:references:from:date:message-id:subject:to:cc
	:content-type:content-transfer-encoding; s=mail; bh=EFYl0GtOkK0q
	jx+PxLoTNvxcg8M=; b=NIok3ijzjNMbQ0ayMTDs1FMUdyEWO0AEH6kTH0wAznzz
	0UvyBQsBHzH6d/YRcSgNmPpxVDYhQ5zDQf7LzBpOqkYPxbFUduhGN42aKGcwY/Qn
	iYuK48hPIM4xQPxnjbg6zx0ksbfvIao9ePXOCJ5+7eWNgysLYdjdmC3UAGyBcKjY
	TL3OKpbxasRIUAF5WSJs4Rgb5vihT6Q7Jz7o7YEe+tQWvPpAPsRLe9RHeINKzGsR
	zLU/h+vVs2mz2l4YRuKWtmhzFVzwUg2HSGQX0JtGvd6EuhlPX/NG4cu/2DDxDCjA
	iDq56Yzxi9p7jPpsbZyNjNBPzqzvdD+6U1FvCK4uzA==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id d83a79a8
	(TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO); 
	Tue, 12 Dec 2017 14:17:46 +0000 (UTC)
Received: by mail-oi0-f42.google.com with SMTP id s9so14084032oie.5;
	Tue, 12 Dec 2017 06:25:26 -0800 (PST)
X-Gm-Message-State: AKGB3mKe4gEfWZU9U0EY87rOAMCe7C1Hzqxd1DWM1sFdztqxBmGSxsMJ
	UluhrulcMs1P4UTs9bJTya/h5vU23JMEfPzaK2A=
X-Received: by 10.202.91.2 with SMTP id p2mr3128000oib.275.1513088726181; Tue,
	12 Dec 2017 06:25:26 -0800 (PST)
MIME-Version: 1.0
Received: by 10.74.56.78 with HTTP; Tue, 12 Dec 2017 06:25:25 -0800 (PST)
In-Reply-To: <CAFEAcA926yVWg6n+QE0mydU5v1DLBwtkfEM+Hs28H9bMVcgyMA@mail.gmail.com>
References: <1512745328-5109-1-git-send-email-peter.maydell@linaro.org>
	<1512745328-5109-3-git-send-email-peter.maydell@linaro.org>
	<5A2F6F44.8050602@huawei.com>
	<CAFEAcA926yVWg6n+QE0mydU5v1DLBwtkfEM+Hs28H9bMVcgyMA@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 12 Dec 2017 15:25:25 +0100
X-Gmail-Original-Message-ID: <CAHmME9p3qUrX6UNDfTCh6dZ-1ahj4ZsmnqaMyEbRu-+Po=9mNw@mail.gmail.com>
Message-ID: <CAHmME9p3qUrX6UNDfTCh6dZ-1ahj4ZsmnqaMyEbRu-+Po=9mNw@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 192.95.5.64
Subject: Re: [Qemu-devel] [PATCH 2/3] hw/arm/virt: Add another UART to the
 virt board
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
Cc: Shannon Zhao <shannon.zhao@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Shannon Zhao <zhaoshenglong@huawei.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ey1Qvg9efP44

In case it's of direct interest in this thread, the ARM results on
https://www.wireguard.com/build-status/ are running on a QEMU built
with this disgusting cludge: https://=D7=90.cc/roJ0gMw3

The patch of this thread is the actually correct way of accomplishing
what that cludge does.
