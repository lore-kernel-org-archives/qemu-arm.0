Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp5003258wrg;
        Tue, 11 Jun 2019 18:51:10 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz/NfL7JOYQ8fm5iK4M9XyZpIzeJH+nOIP0zOTsgSQ1eABX0Z91mJ4AE/U7WfdkkR7ULIlX
X-Received: by 2002:a0c:92ab:: with SMTP id b40mr18731qvb.129.1560304270511;
        Tue, 11 Jun 2019 18:51:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560304270; cv=none;
        d=google.com; s=arc-20160816;
        b=fuwTQae0hPl6SRZGnhOfrlLjJ8xUpgfNAWpXPhFZskwiLmkrds3zYx87MwOsI0WzkN
         nLbEGKzaajdpCjwsolec1PxxHOITa3eyxTGlRDQwrS3ThMrfxurKvAf4YreerXPl3jQD
         wKGLkxq42RSfhkoUKHo4vQiOu/Z3AlYzYPXrwdI8cWEM9C4zRZD91oNXP9b8SkpGpZoI
         Lgry8VSjc1X9/dZ9Q+EYyuimZFLOmfHLiUXW1YWf6+Je/hNEK1RFm8GWB+EaIVuPEoas
         O3jLAQa1rj3KbjjS+gyNmpZhUUpDHEx9nYBvfmrTNFCH5gzlNiJF1UtYJJ9CxVv6ARBk
         Hjxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=W0+NQ+4OO+2QlPMDsc+O/0jbvTE7j85tz2i3FJAsi3c=;
        b=PKTQu16XD7ojRYrPjwjXwkp+JARW+7XlDoZqPcRTsWz69biOTkCpGd9bn3rwyQ/WnT
         YN0hpODBC9xX8I0qyjQ6LogOtdyW1WMmNq85WIANZ5+to8rqWrp4IIaHC3uTil565mP3
         SsIB3v8abwf2EzVsWKzLxPpoqDgqj80DVtWZzKbJopL3HSqOlUR5uXb2MQ5l9Ps1zcIb
         rlXB+UvWW/2HXYQaau2xLN+S4fvZjzvQtmTQXAeENUGEVvBdJzzEKJBq2dktUoKqaixz
         kdI/l7Et9ddX8mwtP9w+qRbU5AAN9uM1NcJZkv2Zbp8Co5PrXZNBS6HfiStZObOBqlAR
         obyw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=UhAPANXp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g130si890923qkb.213.2019.06.11.18.51.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Jun 2019 18:51:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=UhAPANXp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:56164 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hasPu-00060E-2b
	for alex.bennee@linaro.org; Tue, 11 Jun 2019 21:51:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54293)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <joel.stan@gmail.com>) id 1hasOS-00059B-TX
 for qemu-arm@nongnu.org; Tue, 11 Jun 2019 21:49:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <joel.stan@gmail.com>) id 1hasAV-0000uD-3u
 for qemu-arm@nongnu.org; Tue, 11 Jun 2019 21:35:17 -0400
Received: from mail-qt1-x844.google.com ([2607:f8b0:4864:20::844]:44171)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <joel.stan@gmail.com>)
 id 1hasAQ-0000nF-Dc; Tue, 11 Jun 2019 21:35:12 -0400
Received: by mail-qt1-x844.google.com with SMTP id x47so16925799qtk.11;
 Tue, 11 Jun 2019 18:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=W0+NQ+4OO+2QlPMDsc+O/0jbvTE7j85tz2i3FJAsi3c=;
 b=UhAPANXpXT3N6DqLpRXeljLmnKicY4n84J6va7SS4poBDkKUviKKtDVTYSDQ+caSoL
 cWY2SxdoIKT4UngXjVnV16BhLalBhH0nYHKTxY3nH9PnvLxzqz7tAhjLY9Q0mzgflQGk
 3zGCPiOWP/RYaZfJdyP14sjQXKXj4G4xydmMU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=W0+NQ+4OO+2QlPMDsc+O/0jbvTE7j85tz2i3FJAsi3c=;
 b=qyf3tnUkbsgWv6kCqoUkZP09f7hda61lp2J29VXqS7NUxhhesSeNHnp/toT+GsyQ5R
 PeeGr481ophhyxlGQtPojjOvRiEHJK08uQMFHtdDlyyq2Q2z9uzLTw6JsSKdO6N2DoLU
 qR3C4WrIVm+egjvz4ArDeCI85SfJl+WXvnIknRr7S3qAB6agiysFbCXxMOCTSTAJ71WG
 eXMBXZY6FlVvn8bjIdPU0nPGrt9MfD63se6O7t72iwnzg6FOhPfZFb8zuY2+blki6u4Z
 zwACFROlbPayQmpYad6c576DIay6FbGFa2vwYFHbTOwqicLA6BjgbJszfpv349wzaTEW
 DKfw==
X-Gm-Message-State: APjAAAU4bxHWWe6qfH7D8IIqSqmJ7+/QNqkAhYPXugG9J4vEchzuUofX
 aMG16l4ffZnj0+Mu0hm/dxBpt31CFAo7+n/+jvo=
X-Received: by 2002:ac8:2493:: with SMTP id s19mr47149532qts.220.1560303301344; 
 Tue, 11 Jun 2019 18:35:01 -0700 (PDT)
MIME-Version: 1.0
References: <20190525151241.5017-1-clg@kaod.org>
 <20190525151241.5017-14-clg@kaod.org>
In-Reply-To: <20190525151241.5017-14-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 12 Jun 2019 01:34:50 +0000
Message-ID: <CACPK8Xd3VJALoxsDOmN7Z4aUk8ifj7YCfdm9CXPAPT+UMEaW1A@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::844
Subject: Re: [Qemu-arm] [PATCH 13/19] aspeed/smc: add a 'sdram_base'
 propertie
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BWa0oSjjkfuU

On Sat, 25 May 2019 at 15:14, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> The DRAM address of a DMA transaction depends on the DRAM base address
> of the SoC. Inform the SMC controller model of this value.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>

Nit: s/propertie/property/ in the patch subject.
