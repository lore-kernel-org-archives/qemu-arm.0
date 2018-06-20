Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp950598wrq;
        Wed, 20 Jun 2018 09:17:06 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKLAZl00sGW72QlhxiCffTGREGFD4CKzNyygucb07AtALpJak2L+NlWksc9qxM9pdIDwKEbT
X-Received: by 2002:ac8:120d:: with SMTP id x13-v6mr19387642qti.374.1529511426635;
        Wed, 20 Jun 2018 09:17:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529511426; cv=none;
        d=google.com; s=arc-20160816;
        b=MqRKEbrOYJ0fsSeA8cJcQMjBEsmeCQSJ5mtqLLVuJxZ1AwxRJ/3lqIsppLdCB/Sgls
         /n/XMilFQPNcSyy4aiQDOSztiSEDHlSn+R27vTc3Gzs7PCTt9f5Nq3ZTBGfebaUzOVMK
         8QIKjsVZgfDYsEd1PirNZQC87EWZQj8lqqotPs6xJ1+f6kyPX18ADnzW09qg0Lo+su/P
         0oUfOtuaDkt+sdUzmvRma617Qi7kWtOHAIu1EsuYa7Xd9culW4i6EuJgSM0aOHoU9TTy
         3DUEhXWmCl/aQWwkuTZXYZmhJw6P8NRSREEyftuSEbY8/1IwKbcL/K2vAZScLKQKRQZV
         V2tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=ANA054bi6L5Dqmf31zTxaBTIkmONZUNczAp/lWYnQkE=;
        b=AfT9bY7UTjhetdnPypI+YxOiP3wiJuMSttrs7OZOvgGFGYIAJ22xMaGuS3Nl2k9Kep
         eemcWBfU5M2RiZrr0iKdstsrfI2k3KcdfYtaBnTVRc3DZo3d3rzKN9BSO/436rt9Z3wD
         lqD+JTvZETT2eACUISvPOtYcrkV7NgN2FA7/6hjvmjDjBGpKwEsfNmx+LvW8ElmBZUpJ
         mD8awOtmuyd0DzqePdZ+fCy5T1XEz59hOpixUyp702+tyy4tq1o41FbDymxiI8K6zUIe
         sjZiDysyIOytMe6iX3qKKW6G5/G3ewe4KguZldge6bPyx7Op16Luc9WQrU3/HOrpOPf5
         fQJg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XQTw244s;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z4-v6si2671575qtj.265.2018.06.20.09.17.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 20 Jun 2018 09:17:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XQTw244s;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50722 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fVfn8-0001G3-0f
	for alex.bennee@linaro.org; Wed, 20 Jun 2018 12:17:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52474)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fVfm3-0000z4-Ai
	for qemu-devel@nongnu.org; Wed, 20 Jun 2018 12:16:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fVfm2-0004y7-GA
	for qemu-devel@nongnu.org; Wed, 20 Jun 2018 12:15:59 -0400
Received: from mail-oi0-x243.google.com ([2607:f8b0:4003:c06::243]:45204)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fVfm2-0004x1-2w
	for qemu-devel@nongnu.org; Wed, 20 Jun 2018 12:15:58 -0400
Received: by mail-oi0-x243.google.com with SMTP id 188-v6so92509oid.12
	for <qemu-devel@nongnu.org>; Wed, 20 Jun 2018 09:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ANA054bi6L5Dqmf31zTxaBTIkmONZUNczAp/lWYnQkE=;
	b=XQTw244sfQkSqiXIvS3stEc66npzauWqaiIw466NokpWo9qxPN50SoJgwf2UTaQ5TH
	/FsZT7pinURtAx79+dsXpyVvZbXCZz9LaOAWv2YDh/bZU8qdpEulDyJZbfjMKieIWxdm
	Z2DQcbk7WRBsAXIYAAOyAlo/ffHqdNxBvHK5M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ANA054bi6L5Dqmf31zTxaBTIkmONZUNczAp/lWYnQkE=;
	b=MqvVWZDJdZSQNsyvRB6mU7JCYl5SORXvc7ZS2itDVHKe67JO2+OKPUrYy029ruSb4Z
	wVED+IM3bgjSi+szoACip09slcM847KLhOUmFV9CkVRAxgZ1TX/r0QgYgaZ28zogxuds
	s4hNbyaeHfC9XZK7AjUs4lFJhK2KIQgJAFrOZOEUvOqQICOQiTwIKhRfUwdAvx/Lt+J1
	eekjRlQyDu3YZTvhKI2Cpm2PHFURzNK8Qjm/Gxkirr0WLhBNQttTDbe9c3bzVtIvbzJb
	UvaFIOWoHgAM1FuE8LufpFJyVJxyYnP7YT9avvcMgHCXd/GzAUJmTPQa5QJsQcgWk5Tw
	6edA==
X-Gm-Message-State: APt69E2dIFlTocldAJrIWGL4nXWtxKjc/b1arHHQ4TWWgnpF7FfOPsmW
	p1VQS37zgx7cLm/1xEuL0k32W5/Q3LhEvCZs5Z9bUQ==
X-Received: by 2002:aca:5383:: with SMTP id
	h125-v6mr12567761oib.252.1529511357419; 
	Wed, 20 Jun 2018 09:15:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40d3:0:0:0:0:0 with HTTP; Wed, 20 Jun 2018 09:15:37
	-0700 (PDT)
In-Reply-To: <1528790908-23441-5-git-send-email-eric.auger@redhat.com>
References: <1528790908-23441-1-git-send-email-eric.auger@redhat.com>
	<1528790908-23441-5-git-send-email-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 20 Jun 2018 17:15:37 +0100
Message-ID: <CAFEAcA-BjCG4s4ddcdvV+2LO_mVhAz2utNoAG9iP61vUF4v4pA@mail.gmail.com>
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::243
Subject: Re: [Qemu-devel] [PATCH v2 4/4] hw/arm/smmuv3: Add notifications on
 invalidation
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
Cc: jia.he@hxt-semitech.com, Jia He <hejianet@gmail.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pI+XQaviJmxQ

On 12 June 2018 at 09:08, Eric Auger <eric.auger@redhat.com> wrote:
> On TLB invalidation commands, let's call registered
> IOMMU notifiers. Those can only be UNMAP notifiers.
> SMMUv3 does not support notification on MAP (VFIO).
>
> This patch allows vhost use case where IOTLB API is notified
> on each guest IOTLB invalidation.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
