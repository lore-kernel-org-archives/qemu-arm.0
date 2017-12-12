Received: by 10.223.159.74 with SMTP id f10csp3976733wrg;
        Tue, 12 Dec 2017 07:51:52 -0800 (PST)
X-Google-Smtp-Source: ACJfBosSpt8O8xvH+WJysH21pB0KbVFQtW4vI6PcFTzwIMFkhvFQUKhJZ/eq8xq0ORkjREajlVY3
X-Received: by 10.129.174.7 with SMTP id m7mr3035459ywh.248.1513093912065;
        Tue, 12 Dec 2017 07:51:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513093912; cv=none;
        d=google.com; s=arc-20160816;
        b=eqDoWfJL9dj3WYWiUaMAJFNrZQPnZV6RTekjZ4ROnsM9FGRrec2XVU7sqPuB+I4xqG
         Va2uDoYXkTzQSNN6adRhCIFLhs/mvHANwzw7BtGl8aQsCdlk/aYcstQyZJFGTCGwUDLw
         0tP/d3ujVuH6ZPfqEFQNZEAkdX6ylLejLHrnU7Vl7e1jpu8DlR3+xZQ7fR20SyuVlVFy
         9wqGYBaBsLnoIyHJiVXpQGBQGqiHOIQ+EVcPuDGXKmBjiYMC7AfiMIx5EHH1T9WKRAIF
         Ml0+KoJ22Ci+MJH7I6pniiJIgHXHQlMayswcg0udLw8rsm6Nq1NUzT3BvIHGln7yrTNV
         KxCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=lKVK0RmpNBRMhk8ryvac09EA71OU4AOEV/tBWIE63oM=;
        b=plC7Nm84LysI9NHUx3BHTByDknxj+aPGt9jpLrHC0nrwYrXS7fdUiT6Km1PsJZ8pF6
         OfhA6+dfcFoVw7b0r56HBAX/qf45ae2BdKmRkERAXFUYC/0zN96lgW03+cwB2LQvx5UF
         WZhbWGBV7MkapxD8WqdWJcC2LQE3GKRjj0dNfU9PUtkGRiuiaQAf2whfF/bkKATWouDh
         lFcVJs9eM/aVEQ6XfuqGCHdP03d7trTZJzCzWAvGGaNAQfwDvOgySatYJvJ/LAg/Ipvc
         2E5Cds7zqptRWQEKMVZVq2JyjDqMFxELarMQqXHC8Ko7DFoJ2mQSIVCXdGN2H9H6kG7e
         1b8g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=G6872xOC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e59si2920881ybi.223.2017.12.12.07.51.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Dec 2017 07:51:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=G6872xOC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59070 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eOmqV-0001U3-HH
	for alex.bennee@linaro.org; Tue, 12 Dec 2017 10:51:51 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50816)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eOmqM-0001Sy-BZ
	for qemu-arm@nongnu.org; Tue, 12 Dec 2017 10:51:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eOmqL-0005hJ-Jl
	for qemu-arm@nongnu.org; Tue, 12 Dec 2017 10:51:42 -0500
Received: from mail-oi0-x243.google.com ([2607:f8b0:4003:c06::243]:39473)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eOmqL-0005gn-EE
	for qemu-arm@nongnu.org; Tue, 12 Dec 2017 10:51:41 -0500
Received: by mail-oi0-x243.google.com with SMTP id r63so14270617oia.6
	for <qemu-arm@nongnu.org>; Tue, 12 Dec 2017 07:51:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=lKVK0RmpNBRMhk8ryvac09EA71OU4AOEV/tBWIE63oM=;
	b=G6872xOCRa241hPASIDO9/KAo4DE/nR5+pIt7elm2i+RRbJIppuRdzBV/5JZiLHRfy
	dIoKLxPDj0SbuTVrqWxqmzjxJ0DtatJvQkvpCMVvDdV2vLfg8Usj/V9LdVroXVq56x20
	ckRJ6eM9FeXAS8r0bUjxpSr4Dmb8wxzNCXXIw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=lKVK0RmpNBRMhk8ryvac09EA71OU4AOEV/tBWIE63oM=;
	b=dKqBoBAxkfqbzGh2j845MtppHw1HEVpVbUo1l3jsCv4NJIWUIeomDt9UVeE7AjpG+V
	A0NUEHV/0dxkWb/NkkQPnjkaIifIXrC5L6Wd+eesNdCpgiEJPDKxFVt3C4iqBq4oVFX+
	RLjGiaZ6DsgwmxeXPYTa4US8RpfBoDoxW0PT0LKxU+nRQEM2Yy6URj0/U7S8cD/+nSS0
	dajPU1ZRuc2efRfpIzeTcwuv8JgFmz66w5SsSNb2WAAitJjfeU1jbs93SUSjYVg6OsA2
	fguAiAEeNoXiyXJwU3tEYkwmrQXyjuh0sOwMHrJb29hht1j0dVLhJzFfnbF7NQBqggKW
	VdJA==
X-Gm-Message-State: AKGB3mLnCcZnyjBh0N7Fkq2NPI70yUj+O1CyV9wL0OjyzWOYPYm0ssuP
	FsmaQwcRh0IYgwtoZ7Z4XBpT1xCHkkR5WafhV0EYiA==
X-Received: by 10.202.199.134 with SMTP id x128mr3528070oif.63.1513093900583; 
	Tue, 12 Dec 2017 07:51:40 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.63.74 with HTTP; Tue, 12 Dec 2017 07:51:20 -0800 (PST)
In-Reply-To: <20171212151605.v2eoestysaogzymm@kamzik.brq.redhat.com>
References: <1512745328-5109-1-git-send-email-peter.maydell@linaro.org>
	<1512745328-5109-3-git-send-email-peter.maydell@linaro.org>
	<20171212144513.sutjfenbjh33fm5n@kamzik.brq.redhat.com>
	<CAFEAcA-DyuObZjx-g2k9SkofLZ_akadfGYZCMum=3hQQLEdN_w@mail.gmail.com>
	<20171212151605.v2eoestysaogzymm@kamzik.brq.redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 12 Dec 2017 15:51:20 +0000
Message-ID: <CAFEAcA-t7XFxizUQMdo_JYTLet_a8ZL-Omg54gLOQC-=o+vjuA@mail.gmail.com>
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::243
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 2/3] hw/arm/virt: Add another
 UART to the virt board
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
Cc: "Jason A . Donenfeld" <Jason@zx2c4.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Shannon Zhao <shannon.zhao@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: w3hIJvUon40v

On 12 December 2017 at 15:16, Andrew Jones <drjones@redhat.com> wrote:
> OK, so this patch is fine, but it kills my suggestion for AAVMF to
> only output debug messages to a debug port when the debug port is
> actually useful. Now it won't be able to tell the difference unless
> we can inform it some other way.

Yeah, and that might be a nice thing to do. I'm just a little
reluctant to have Arm start doing something that we don't
already do for x86, or plan to do on x86 in the same way
at the same time.

thanks
-- PMM
