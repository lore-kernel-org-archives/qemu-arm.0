Received: by 10.25.21.96 with SMTP id l93csp2420478lfi;
        Wed, 22 Jun 2016 04:38:57 -0700 (PDT)
X-Received: by 10.55.31.140 with SMTP id n12mr37830505qkh.4.1466595537097;
        Wed, 22 Jun 2016 04:38:57 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e89si60116881qtd.48.2016.06.22.04.38.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 22 Jun 2016 04:38:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57368 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bFgUi-00033k-Il
	for alex.bennee@linaro.org; Wed, 22 Jun 2016 07:38:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38239)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bFgUc-0002wE-FL
	for qemu-arm@nongnu.org; Wed, 22 Jun 2016 07:38:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bFgUb-0007zS-Jo
	for qemu-arm@nongnu.org; Wed, 22 Jun 2016 07:38:50 -0400
Received: from mail-vk0-x22e.google.com ([2607:f8b0:400c:c05::22e]:36673)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bFgUb-0007z3-0W
	for qemu-arm@nongnu.org; Wed, 22 Jun 2016 07:38:49 -0400
Received: by mail-vk0-x22e.google.com with SMTP id u64so58041928vkf.3
	for <qemu-arm@nongnu.org>; Wed, 22 Jun 2016 04:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=GwELv82syIjXxY54/BbcRuWqs3EonvMx8mn20WDkR4U=;
	b=XcYHwrYup6edq+mhQvuuBQj/Dg2EJBSIwwUChdMRlfXw5Vn8wDd45RwZ0RqADPFJHK
	H8WooJxpp3uJWK1XOgLgD8tsWpmhqL6RB3YQIIHK9bQmzOsPL5UiwRmK2PR0y5jJatjh
	lRroV70WOo1QFADQsGtt5NwDqVbwZd+1z2tKk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=GwELv82syIjXxY54/BbcRuWqs3EonvMx8mn20WDkR4U=;
	b=lovQUQbnykntdIp0gnckolhWi2xa1Hw/uWs342KNxk41j58fN7Pqolahoge/2v7RRU
	zOKhl/zxcBrgfNVLn5udfb5yoXj9k+OZhuT5TZTliM9OjOsd8kpJBmMcDnMcV+ai2N8H
	AInOI6zksONurQw8SfBsvq4GcOIKHdexvsJMAc+7VjZp24vi4GYFuAM8LUy9Z1Xd6IK8
	hBxIlVYbNpMokJYZofzJ8tMJml+g/B8IbkvaQHJtODs9AVMq9QiqWuSGHzi+et0Ku6VF
	BrkFGbxClma1+9vwcOkWkDsZLcE5bqIAY8LQjfh0yg6PPRl5DRDONB66QeHGNZpEIQiG
	zMpg==
X-Gm-Message-State: ALyK8tICQMtLcCazxpCS4Sjc9Ci4nbe6fNR822Q6Ch7rsHHKCLAxJYMsYeILn+O7hO3Jg6THC9krmfmukaH+rGbI
X-Received: by 10.176.0.145 with SMTP id 17mr11822675uaj.103.1466595527145;
	Wed, 22 Jun 2016 04:38:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.157.141 with HTTP; Wed, 22 Jun 2016 04:38:27 -0700 (PDT)
In-Reply-To: <20160622113558.GF2274@work-vm>
References: <1466528974-12183-1-git-send-email-peter.maydell@linaro.org>
	<1466528974-12183-7-git-send-email-peter.maydell@linaro.org>
	<20160621184552.p7trf4zpqnrmwruu@hawk.localdomain>
	<CAFEAcA_AnYGV0jy9HAUevHPB=FY3NP25-7BUpdbySZS-QPeGrg@mail.gmail.com>
	<20160622080234.f57jjn43tcwmvmcd@hawk.localdomain>
	<20160622113558.GF2274@work-vm>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 22 Jun 2016 12:38:27 +0100
Message-ID: <CAFEAcA9tRnKuc4Dqj4_7vKwmg2Y00ifNQHA1rUirEy5viWsG3A@mail.gmail.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22e
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 6/6] hw/arm/virt: Set
 minimum_page_bits to 12
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
Cc: Andrew Jones <drjones@redhat.com>, Patch Tracking <patches@linaro.org>,
	Vijaya Kumar K <Vijaya.Kumar@caviumnetworks.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +N6B2gA1+EDm

On 22 June 2016 at 12:35, Dr. David Alan Gilbert <dgilbert@redhat.com> wrote:
> Yes, my hope is that any versioned machine type should migrate to
> a newer qemu with the same machine type set.
>
> There are really two separate things that we state with the machine
> versioning:
>   a) that the guest view is the same
>   b) that the migration format is the same

Well, this is true for PC. But my impression when we started
applying versioned machine types to ARM virt was that it was
signing up to (a) but not (yet) (b)...

thanks
-- PMM
