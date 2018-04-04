Received: by 10.28.71.155 with SMTP id m27csp4931322wmi;
        Wed, 4 Apr 2018 07:25:25 -0700 (PDT)
X-Google-Smtp-Source: AIpwx48GPmZ6AsbYMdcuxpVU09gvL20piAAsmLRzW5ep+TuD3oGW/JE/Kco9Tbk+cnCaZomfcsnY
X-Received: by 10.200.54.200 with SMTP id b8mr25893878qtc.191.1522851925742;
        Wed, 04 Apr 2018 07:25:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1522851925; cv=none;
        d=google.com; s=arc-20160816;
        b=i6U8KaLuKT2cYtd0AqjsHA4f7mrdvS88u8m5+o7pKRHUwn+e6Jc7+NGpK9LooSVrSB
         vV9O49/upUBCRoPYAy/EUoC8EdgvW3N3TFp0Zp1Z2bcUiBrybB5mPLYh7jErnASDYcBH
         1ACCfeDyyWXrTn2VgEEq0PEH40UjqIRRDkonZ32dZrn81qP9QFiMU4jc2HPx5PGHgG/k
         y9j1zghPVHmVsP7Gp334SAAjccrI9Wdl5tY3pg64K1xNRdzWAE6Jvtv95qfAQy8OvCbW
         ow14CcS96aWhcexcB9Dkm/lHNPfjc4KfyTrCqSUIDMvqNDrdlEX9x1QeyD3jp3eJQHo1
         /l+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=rmarbfPcxDdeiKNflywfCaB1CZx6fzjNLbA3xlcJRno=;
        b=xfEuEYkqXt0qdDZKB2PVjUB1JG+8kidM2bseugZ3J4nRFpkOngA9yLFrPnOqdw7D3R
         VYryTIhyISkDw87/YLdZlXDEk+a26jUDtxMgbGZWzsTdodishE966TyCMr8Jv3EO0T98
         0ObUvtbpHcdVne8HvrWtBChZx2CC2Sqlz3WkGGQLkeuIx/Nk85q/k/KTB3Jeh4+8lsmC
         btNFjznm5alvRzATSYNBsO3wYXUH/sT610z0+DeCTa/+oEpcexE5N+dyAsFGteyiDB05
         OVZ3hyUYdOuLIxaPyINVxI0cwzxjQ2lc2rJLEZFe0Hfw68Av0AkHICejwVvlejZ5LhNV
         WKBw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s6si5905027qkd.204.2018.04.04.07.25.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 04 Apr 2018 07:25:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33897 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f3jLp-00066d-5j
	for alex.bennee@linaro.org; Wed, 04 Apr 2018 10:25:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52648)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1f3jLe-00065T-Ic
	for qemu-arm@nongnu.org; Wed, 04 Apr 2018 10:25:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1f3jLa-0001P6-AS
	for qemu-arm@nongnu.org; Wed, 04 Apr 2018 10:25:14 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:44734 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>)
	id 1f3jLa-0001Ow-6K; Wed, 04 Apr 2018 10:25:10 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B6A20A27D0;
	Wed,  4 Apr 2018 14:25:09 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-39.ams2.redhat.com
	[10.36.116.39])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BA62E2166BAE;
	Wed,  4 Apr 2018 14:25:06 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id D21C39C3F6; Wed,  4 Apr 2018 16:25:05 +0200 (CEST)
Date: Wed, 4 Apr 2018 16:25:05 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20180404142505.4mpvautvlqemjlpp@sirius.home.kraxel.org>
References: <20180319161556.16446-1-peter.maydell@linaro.org>
	<CAFEAcA8trs8tMKBqbOLaNx4OR9H9+xO4jJQjY2+yeCNdsdCBCA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA8trs8tMKBqbOLaNx4OR9H9+xO4jJQjY2+yeCNdsdCBCA@mail.gmail.com>
User-Agent: NeoMutt/20180323
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Wed, 04 Apr 2018 14:25:09 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Wed, 04 Apr 2018 14:25:09 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'kraxel@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [PATCH for-2.12 0/2] bcm2835_sdhost: fix interrupt
 handling
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
Cc: "patches@linaro.org" <patches@linaro.org>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Pekka Enberg <penberg@iki.fi>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PZmEYcWSIwNS

On Wed, Apr 04, 2018 at 11:18:23AM +0100, Peter Maydell wrote:
> Ping for code review, please? It would be nice if our 'raspi3'
> model for 2.12 was one we could say actually booted a known
> Linux image...

The Fedora 27 image kernel (aarch64, 4.13) boots and mounts the root
filesystem.  This is an improvement, so:

Tested-by: Gerd Hoffmann <kraxel@redhat.com>

It doesn't finish boot though, at some point the kernel starts to
complain about timeouts and xfs throws io errors, so things are not
perfect yet.

raspi2 doesn't boot the fedora 27 armhfp kernel.  Looks unrelated
though, it fails with "Division by zero in kernel" before even loading
the sdhost driver.  I suspect the kernel tries to access some hardware
not emulated by qemu ...

Trying to run u-boot as boot-loader (so I don't have to copy the kernel
from the image) doesn't work too.

cheers,
  Gerd

