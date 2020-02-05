Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp94375lfp;
        Wed, 5 Feb 2020 05:16:22 -0800 (PST)
X-Google-Smtp-Source: APXvYqyfqVG6+3WEWEP9VCxEah2DqLq7Na79EyuZEThSXkhjtYhtuGoGv8qGcWrohqYL+IeOw5hL
X-Received: by 2002:a37:bf82:: with SMTP id p124mr33637214qkf.337.1580908582530;
        Wed, 05 Feb 2020 05:16:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580908582; cv=none;
        d=google.com; s=arc-20160816;
        b=iAlduxlWdr9j+NNA4CagHlTyrXX9JIWfcf5z13Ipch6R8Zt3jxeFoMfPcjiLsHlBbE
         1XTX593ICgu9uQLcZsCPQUDrkrJ1BT1O77BUNdKEGX+rhIJn/QMxGrjFSU75vy80tN6B
         BN5l+1hmjK4m6R/RnSAruv2kHpY+WRFeG2zwe85rqAC/0hsMeZYujvyprjFozlxtdDMg
         LcWtySKmzyFsBCQfnIm2wAi05Inucv5Vo97QVb6YRfh1Qyd4G+X6hHWCNJ2uUgnjpt5U
         Me5Maoh/Ue5y9R8mY07G3iPhQ73QQj9fzIdiFHECYfI2odZKM+0icjHY9zIhgC+E/9nO
         Reyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:user-agent:message-id
         :references:in-reply-to:subject:to:from:date
         :content-transfer-encoding:mime-version:dkim-signature;
        bh=17zq4TkK8elUQJUUjWWvNe8PDgGXFaJsrFHXdJM1Z1c=;
        b=I/BsQkKRTobv7kCOPwrD8Befuc9M42bR0W6aBeTtJiZmf3bmSasNPgjZ4JH/HzqQ0A
         mS9Q/lAkXl7ZvKLo6qlOA+Ay5lWaQjOaIZagWw/vD54nXkRH211S4lee9v4yjstHridd
         DRU5V4nud2BnqbSSVwgj3vqz8i9xc5pNy0kZFBxUM7YDDEM9vFvkUgLxAdv+nXPDAFOV
         j5ggOzlwWKfvhkUuBju0XI0TZhjp9RD/5jDQjmtHQQjp2/F174b6e4nVnnc1dZ/B+zj+
         XFAHl4kdu3WeXUk9HMEMSWRNCL6iCOKAp9Qa9GITN4e4HL9S3kGKex5MWGdc50JDjT/n
         nnsg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@kernel.org header.s=default header.b="mw/CsqZn";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r23si14564135qtn.80.2020.02.05.05.16.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 Feb 2020 05:16:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@kernel.org header.s=default header.b="mw/CsqZn";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from localhost ([::1]:46808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1izKXV-0007R0-VS
	for alex.bennee@linaro.org; Wed, 05 Feb 2020 08:16:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58902)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <maz@kernel.org>) id 1izKXG-0007Ql-OW
 for qemu-arm@nongnu.org; Wed, 05 Feb 2020 08:16:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <maz@kernel.org>) id 1izKXE-0005oU-Dy
 for qemu-arm@nongnu.org; Wed, 05 Feb 2020 08:16:06 -0500
Received: from mail.kernel.org ([198.145.29.99]:39084)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <maz@kernel.org>)
 id 1izKXC-0005ik-KW; Wed, 05 Feb 2020 08:16:02 -0500
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 32CDC217BA;
 Wed,  5 Feb 2020 13:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1580908561;
 bh=0W0tsAYvuSVfdnkVoYJz9RA72eMKRnWbirCOKy4dgj4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=mw/CsqZn3sB1tInzPuRPCNlNVaQNI8i89I1s/la4HB0tDL4cpBkL4a92BXQeJ8nzO
 TxHYA9t3i+4fL9NewSZN1b0Ir8Vikf24fbQzEzPfBqwN/LTK5MuRM6q7Em4FdXDe7j
 ZczcSmuNI+8jieLnICz0LVC3FCpmqw264fS80C/Q=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
 by disco-boy.misterjones.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <maz@kernel.org>)
 id 1izKX9-0038Qe-GA; Wed, 05 Feb 2020 13:15:59 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Wed, 05 Feb 2020 13:15:59 +0000
From: Marc Zyngier <maz@kernel.org>
To: Heyi Guo <guoheyi@huawei.com>
Subject: Re: [RFC v2 00/14] Add SDEI support for arm64
In-Reply-To: <e8b93460-48e6-43cd-4608-370c07cb45ec@huawei.com>
References: <20191105091056.9541-1-guoheyi@huawei.com>
 <CAFEAcA-+tAbb9h2wZOm56TqUvjQJT0OYFLwTVS-UxKrF5PO3mQ@mail.gmail.com>
 <5aece614-4341-35e5-53a6-2f3d788e6e8d@huawei.com>
 <e8b93460-48e6-43cd-4608-370c07cb45ec@huawei.com>
Message-ID: <350aa4ca1b57a466ed882236caf23051@kernel.org>
X-Sender: maz@kernel.org
User-Agent: Roundcube Webmail/1.3.8
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: guoheyi@huawei.com, peter.maydell@linaro.org,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, wanghaibin.wang@huawei.com,
 Dave.Martin@arm.com, mark.rutland@arm.com, james.morse@arm.com, mst@redhat.com,
 cohuck@redhat.com, pbonzini@redhat.com, shannon.zhaosl@gmail.com,
 imammedo@redhat.com, gshan@redhat.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 198.145.29.99
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Peter Maydell <peter.maydell@linaro.org>, Gavin Shan <gshan@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, Igor Mammedov <imammedo@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, James Morse <james.morse@arm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, wanghaibin.wang@huawei.com,
 Dave Martin <Dave.Martin@arm.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GBRDMIJl/C4k

Hi Heyi,

On 2020-02-04 08:26, Heyi Guo wrote:
> Update Marc's email address.
> 
> +cc Gavin as he is posting a RFC for ARM NMI.
> 
> Hi Marc,
> 
> Really sorry for missing to update your email address, for the initial
> topic was raised long time ago and I forgot to update the Cc list in
> the commit message of the patches.
> 
> Thanks Gavin for forwarding current discussion on ARM NMI to me.
> 
> For you said SDEI is "horrible", does it mean we'd better never
> implement SDEI in virtual world? Or do you have any advice on how to
> implement it?

My concern is that SDEI implies having EL3. EL3 not being virtualizable
with KVM, you end-up baking SDEI in *hardware*. Of course, this hardware
is actually software (it is QEMU), but this isn't the way it was 
intended.

It's not the first time we've done that (PSCI is another example), but 
the
logic behind SDEI looks much more invasive.

         M.
-- 
Jazz is not dead. It just smells funny...
