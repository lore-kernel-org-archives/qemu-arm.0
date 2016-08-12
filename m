Received: by 10.25.21.156 with SMTP id 28csp190140lfv;
        Fri, 12 Aug 2016 07:35:25 -0700 (PDT)
X-Received: by 10.55.141.199 with SMTP id p190mr17305286qkd.185.1471012525041;
        Fri, 12 Aug 2016 07:35:25 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 14si4760187qtn.142.2016.08.12.07.35.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 12 Aug 2016 07:35:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52471 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bYDYS-0008E4-CV
	for alex.bennee@linaro.org; Fri, 12 Aug 2016 10:35:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45145)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bYDPk-0000oE-7x
	for qemu-arm@nongnu.org; Fri, 12 Aug 2016 10:26:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bYDPW-0007V6-D1
	for qemu-arm@nongnu.org; Fri, 12 Aug 2016 10:26:24 -0400
Received: from mail-ua0-x22e.google.com ([2607:f8b0:400c:c08::22e]:34835)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bYDPW-0007Uv-9K
	for qemu-arm@nongnu.org; Fri, 12 Aug 2016 10:26:10 -0400
Received: by mail-ua0-x22e.google.com with SMTP id n59so44201424uan.2
	for <qemu-arm@nongnu.org>; Fri, 12 Aug 2016 07:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=w6+lzg31TAPuJSS+OofexgIMGf2191rIYEEajIPFN/k=;
	b=bxvaLlaOehF+VCoJqlqcwkFWZfye5JYA6HMYSQBKo1OWtM94s7VbqgYZaMOs21JZ16
	N8w4JCvMDFWjM1tuO9uMjJTfeoJ7uVR9NV1Mc7aQWse8p2s+GXL5Ofky4biEP8853dgy
	D+K4m8L8DJp2dA15RXNqEQu4n13sbsXXRVFik=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=w6+lzg31TAPuJSS+OofexgIMGf2191rIYEEajIPFN/k=;
	b=PXydlm/XjWymQj9S1trzw7NDc0DHTlT+X6UYah/VcJ8mClL5zPCaALFeBCODioWub9
	lmLvlOB0WLgcTRcy/lpLHeD5+n1gwUBJ+ulXsEEw4WE3HZ7vMhWmRAbKpdizJFREntL5
	ww5D2LeiWNPveJH8ynkNFKppQxlHYLVCrJ52LNXq/etAqqTLO8N7UfX7pVEE1j9Ov61Y
	1x61Ohseu/wQ20zk0snJh0j2QC/EgoJKlFVRu62hmv6bNg0W8mYr5BWTeIPX8PmOIMvF
	GPQAEObMA0wvhOC4eX8Vc7NxVmvugPvLakPp5qH1hHbhCmVnZjazG8Tqt8JzmvuurXuu
	KAfw==
X-Gm-Message-State: AEkoouvEG9GXfSFU+ePpKAMauXXBFhB27WN7H+sOq6p1WKt6Dhy1QC4VEHfTtGG693Ivm3UcBRFCsPMk9rWfkq3v
X-Received: by 10.176.82.139 with SMTP id v11mr8019669uav.4.1471010494353;
	Fri, 12 Aug 2016 07:01:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.9.149 with HTTP; Fri, 12 Aug 2016 07:01:13 -0700 (PDT)
In-Reply-To: <1470161247-10251-3-git-send-email-eric.auger@redhat.com>
References: <1470161247-10251-1-git-send-email-eric.auger@redhat.com>
	<1470161247-10251-3-git-send-email-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 12 Aug 2016 15:01:13 +0100
Message-ID: <CAFEAcA_EJ0bwZF4vLVt47KUXvZm2x4MCwB5a7PCRkk0WOTJViA@mail.gmail.com>
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::22e
Subject: Re: [Qemu-arm] [RFC v5 2/7] target-arm: move gicv3_class_name from
 machine to kvm_arm.h
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
Cc: Andrew Jones <drjones@redhat.com>, Tomasz Nowicki <tn@semihalf.com>,
	Shlomo Pongratz <shlomopongratz@gmail.com>,
	Pavel Fedin <p.fedin@samsung.com>, QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Shannon Zhao <shannon.zhao@linaro.org>,
	Diana Craciun <diana.craciun@freescale.com>,
	Christoffer Dall <christoffer.dall@linaro.org>, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xXEZ92Mgy2Nf

On 2 August 2016 at 19:07, Eric Auger <eric.auger@redhat.com> wrote:
> Machine.c contains code related to migration. Let's move
> gicv3_class_name to kvm_arm.h instead.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
>
> ---
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
