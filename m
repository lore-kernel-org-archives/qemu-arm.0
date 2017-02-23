Received: by 10.25.0.147 with SMTP id 141csp336888lfa;
        Thu, 23 Feb 2017 10:44:07 -0800 (PST)
X-Received: by 10.55.91.129 with SMTP id p123mr1663387qkb.64.1487875447345;
        Thu, 23 Feb 2017 10:44:07 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g67si3912359qkf.69.2017.02.23.10.44.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 23 Feb 2017 10:44:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60258 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cgyN2-0002EF-Kb
	for alex.bennee@linaro.org; Thu, 23 Feb 2017 13:44:04 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45934)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cgyFR-0002DH-Bx
	for qemu-arm@nongnu.org; Thu, 23 Feb 2017 13:36:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cgyFQ-0000SL-Il
	for qemu-arm@nongnu.org; Thu, 23 Feb 2017 13:36:13 -0500
Received: from mail-wr0-x22d.google.com ([2a00:1450:400c:c0c::22d]:33425)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cgyFQ-0000Rs-Ca
	for qemu-arm@nongnu.org; Thu, 23 Feb 2017 13:36:12 -0500
Received: by mail-wr0-x22d.google.com with SMTP id u47so438629wrb.0
	for <qemu-arm@nongnu.org>; Thu, 23 Feb 2017 10:36:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=qNb6VdHvufgzOJoHv9xc0B2sRMcskNcLIORz5NYJ0iU=;
	b=TT+UHu6SKxPntBi5MPDb1mH10V1sIio/1I+1XJTgaVznLrAJMy135sTSRxHBHpsIWF
	dCob9YnRlmH81/SNwD41iPEX8LCtxlNS+PgFT9cT1g/YKXcqEwQh6yYLNJB114m/UDYf
	G+GqZf/sSq8xOqF/V36VH2s/KAz9L5c/VKCQ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=qNb6VdHvufgzOJoHv9xc0B2sRMcskNcLIORz5NYJ0iU=;
	b=q72GtX4LA+TvQRJqU96lgrU8MxoEXv8ALw34BLDL1uMSGSMJbL/0a85gJBRBYURI9N
	Lm3zfxiC8P/Eh7Bndkbw2XIAlQPcTMO7TLn7npzrZ529Anj1kzNCYxXlry31UI2A4p5A
	jDzyhg4SqndDO13RfgmNqrIpBTlDC+7tQ8/iYAGUDioW4eagriJkNS+xI+qm1LE1XsXf
	YKqdA2Tx53QiFkUWswuKD1gxm2A56ihr1AxECdJFJGHxsbPvn9dG+GSPCewIlHJAyyi5
	zSdDQ5bS9GvH8B7U3kgoNTC27xDS+kQ+y0u0ZK9B/ICc7KpNB8hZaMAaC4lONb+8b2LU
	pNCQ==
X-Gm-Message-State: AMke39m27JPcfQCG48yD123Bhp2C5lJYGkEs+jfJYF9GgOT+nEj9x1cSYKpUN+8lzVC2kC7FhbKxNjzHl7jMgdLh
X-Received: by 10.223.169.76 with SMTP id u70mr19817670wrc.187.1487874971293; 
	Thu, 23 Feb 2017 10:36:11 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.69 with HTTP; Thu, 23 Feb 2017 10:35:50 -0800 (PST)
In-Reply-To: <1487850673-26455-2-git-send-email-vijay.kilari@gmail.com>
References: <1487850673-26455-1-git-send-email-vijay.kilari@gmail.com>
	<1487850673-26455-2-git-send-email-vijay.kilari@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Feb 2017 18:35:50 +0000
Message-ID: <CAFEAcA_rYx2+zGB16O4w=BjOP9e-jn5kSGT8rCosHsgubo-w_Q@mail.gmail.com>
To: Vijay Kilari <vijay.kilari@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c0c::22d
Subject: Re: [Qemu-arm] [PATCH v9 1/5] kernel: Add definitions for GICv3
 attributes
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
Cc: Marc Zyngier <marc.zyngier@arm.com>, Pavel Fedin <p.fedin@samsung.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Vijaya Kumar K <Vijaya.Kumar@cavium.com>,
	Eric Auger <eric.auger@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	Christoffer Dall <christoffer.dall@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rOP1VWrbtlbc

On 23 February 2017 at 11:51,  <vijay.kilari@gmail.com> wrote:
> From: Vijaya Kumar K <Vijaya.Kumar@cavium.com>
>
> This temporary patch adds kernel API definitions.
> Use proper header update procedure after these features
> are released.

I can't put this patchset into QEMU with this temporary patch;
you need to do a proper kernel headers update with
the update-linux-headers.sh script.

thanks
-- PMM
