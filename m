Received: by 10.223.161.27 with SMTP id o27csp2296431wro;
        Mon, 30 Oct 2017 03:03:47 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+QQ6w/+W8lAOM8Y1DMPuD1yHWaSTvj9VkqNET2NbsrDabn7vWix5ZtYJvztKjLrjNZgqiST
X-Received: by 10.13.197.199 with SMTP id h190mr5837292ywd.335.1509357827357;
        Mon, 30 Oct 2017 03:03:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1509357827; cv=none;
        d=google.com; s=arc-20160816;
        b=RQSF9E2cyOHd8vIGhymJGU4t3ouOloywG+ufY3quFw0bO83xLmez6BfasWyXqhYj/Q
         l75ZD8jHJCfPBcMrjtNUNzQWcltS7S7NP2n5mHMwx3sBq3GF6EuFIO4HwPD3OdWxMDxB
         wcAiSAepYZLaT1UyzIheVjUEckGWnNb5ZRGA1ywyymgiGNC5uuArHOX1z7V5D8zQZ9x6
         c6AYOclcpgOF8PazojITASE+R/W8z0uaLsRnKthzv8BF1iSioDuZikhB7RXDdl0MenTg
         GwOeMoVX9/ZJlbZu/TAgMusLrKa+od2Ox5lPiOSArAdrfJi79p2DE2vKgFroD5qHrcjy
         AL9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=3Fatnj7cSewhc7Q+0cRRHG4D5cXLCyyIERnglt8sVeU=;
        b=HSL0C+kChOEZnnOhjhWjxHGvLaVcg5NJ+sG5AU8bg0R6tfOWg2Y1E99DSHtDOUywlt
         VYscelLwi/UkjlqQ+uGIcOgN3nqPzTjbEnYkEHBPDTBK1BCJjRfNDq8D5XV4XzIAnXiZ
         jc5uqFADyt9DjaQZR8xD4zGOAL8e2dSnRIzqr9SdLD4MT0Z3+t0HlBxC+inn1layD3Cy
         ZHtV7WYnrLQYA6xzWcujnx6HGemZuouEGZeHU976H2mY/6tUVFRKXkul4Dcn/8KiYSMD
         tbAEdghCyEPFaN6bmzVl2UZ3VfxR9BwympoaTDmEWMEAL8LO0ohGuGu/uupDcWeAdqbg
         22tQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=I4MJQwSd;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d128si2351887ybf.117.2017.10.30.03.03.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 30 Oct 2017 03:03:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=I4MJQwSd;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39591 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e96v4-0000mY-Ru
	for alex.bennee@linaro.org; Mon, 30 Oct 2017 06:03:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36403)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e96ti-0000Bm-T8
	for qemu-devel@nongnu.org; Mon, 30 Oct 2017 06:02:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e96ti-0005ik-4i
	for qemu-devel@nongnu.org; Mon, 30 Oct 2017 06:02:22 -0400
Received: from mail-wr0-x22d.google.com ([2a00:1450:400c:c0c::22d]:55895)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1e96th-0005hY-T3
	for qemu-devel@nongnu.org; Mon, 30 Oct 2017 06:02:22 -0400
Received: by mail-wr0-x22d.google.com with SMTP id l8so11892779wre.12
	for <qemu-devel@nongnu.org>; Mon, 30 Oct 2017 03:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=3Fatnj7cSewhc7Q+0cRRHG4D5cXLCyyIERnglt8sVeU=;
	b=I4MJQwSdC2rS/1H5wtxEvGCj/6kPd5Id11Q0TQfgbW9iEy6i5vW2AoOLGBpRyNvulO
	MNR2ZlwgD+o4Fd8Avnhnhp0IR7tYWm7kRNJXCrm61hYNzsKpS3CyrRryeV0HIVoAgbkr
	XiEz0O/ve6vbiodRx1Zo0hsyyvSNsJ1dSUH0s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=3Fatnj7cSewhc7Q+0cRRHG4D5cXLCyyIERnglt8sVeU=;
	b=SUQJTEjC/khunjle2X2H2slLMtToXE2+BwRYOzclzJGlJ5ilZD4rlUawD6EU/uj+Hp
	7D6j6Xok/tUUWLO7+CXB8/kUnq2Dqr0ATshVjeAZ/M/ofZgTZUe0ANvCtSQO8vl42XZD
	ivcTmzasu8zaOOsnNDI7t/GzgWS52PvugG4NgFIGc6VkFf2e6SufRmomkwJyEHbJkcu0
	6BPG9vZPZ7Zbw0aq+E9C6Y1Oub+8m1tCi1mdGbueJwL/lKRieJPorJColmM2wws+qThd
	GV31ZEE4Ju2bIXEMkqAcF5fjybVphh2MxIdnoK1nWg9Qe13Q2DdBGO7+4cLoGXZjLK0d
	RM1A==
X-Gm-Message-State: AMCzsaXKhgGzhz2HatGCC/As8SgutXmpxsXvxOuFlUkHdQBeWQo0Mz+C
	xmfWHEWmoQfwyoEfbG5t1seNhkbq7FuoYkOTKE19kQ==
X-Received: by 10.223.169.80 with SMTP id u74mr6630974wrc.178.1509357740791;
	Mon, 30 Oct 2017 03:02:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.161.5 with HTTP; Mon, 30 Oct 2017 03:02:00 -0700 (PDT)
In-Reply-To: <1508776211-22175-1-git-send-email-eric.auger@redhat.com>
References: <1508776211-22175-1-git-send-email-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 30 Oct 2017 10:02:00 +0000
Message-ID: <CAFEAcA-5uwj+VBp1qvojyMpgDyM5=HenNzdO4TWeRv+knUruEw@mail.gmail.com>
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::22d
Subject: Re: [Qemu-devel] [PATCH] hw/pci-host/gpex: Improve INTX to gsi
 routing error checking
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
Cc: Alex Williamson <alex.williamson@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, Andrew Jones <drjones@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>, eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aIb/Pn4XrtGK

On 23 October 2017 at 17:30, Eric Auger <eric.auger@redhat.com> wrote:
> We exposed gpex_set_irq_num() for machines to set the INTx to
> GSI routing. However if the machine forgets to call that
> function we currently do not check the association was properly
> done. Let's initialize gsi values to -1 and if this value is
> found in gpex_route_intx_pin_to_irq, set the routing mode as
> disabled.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---



Applied to target-arm.next, thanks.

-- PMM
