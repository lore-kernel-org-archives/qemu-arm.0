Received: by 10.28.71.155 with SMTP id m27csp776995wmi;
        Fri, 13 Apr 2018 06:46:43 -0700 (PDT)
X-Google-Smtp-Source: AIpwx49Iv2Rd3yVfwvii4qKHyx+cgAbZFJIJwKdSGga4oky1sg+B7rvWwLtEHTo/pChmgSlOsq7L
X-Received: by 10.129.31.213 with SMTP id f204mr4800613ywf.197.1523627203627;
        Fri, 13 Apr 2018 06:46:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523627203; cv=none;
        d=google.com; s=arc-20160816;
        b=v90VM7fDT0hqK7g9jjo/vHbb1sPFksvZQaXIGmuHwTUGkKfyxqA0cDbRWKRK9eB6LP
         wzlzcyN1PGioJjZldWV8dgXpJPRArfVpv70mQVLFexz2mljIiIezeh1yeTh6oRvQ39NP
         q7e/vxjrgpCA3Vf5+ws6lE9zaQ0HQbEdbypyT9prjENstUzeskIc1wxDy1P2mi9YJcGs
         mlCnFvTl3GKpIU8kH4XENIP1WTahisCiObV0mMTRhTBhiILT39TJFTWalHfOAm8ti50S
         O0sJVN5P3bUkNYuFTn2sKKCfeI5JPraFD7iWLdu0cErizaeVKZcrjpmUvR0eoE80FwHX
         lC+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=g9XKmtv9BRx6z6A9Tdfr4YWms9QdAyj/bdh9QF/IJ9U=;
        b=eS/+9GKTPkua5OBvaWaWKtMYWmpO+bkJoPhYCXpqklOadgNyKz5zbTp3BUEULMEN6i
         oZgpCR3QL8ax9ygVjijRS7IWhgNO3htQDzcQl56ZsyeFrQatiMg0vukkxhBA0O0srLJy
         Sg3umNcjk2HUzFIJokjvzu9TztOB7gK4JSeoB2wBT0etVwzFX6a5RjTlivt/DckXeTNr
         ku3Repd6Otal+1WHMINVTfX50xkBd4TAl+jQnbmQG7UNiLV8R3xE/KVeIxCTVhR9PnwJ
         VBu5NIKADtDAjk5rvl9vaSLvoc8VJDZM0cITc5SUlR8M3yrwlWpZAiGu5+ZUY/wiemxI
         KHsw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=al5WCSPf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 39si7813183qtn.41.2018.04.13.06.46.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 13 Apr 2018 06:46:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=al5WCSPf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54841 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f6z2H-00084h-N6
	for alex.bennee@linaro.org; Fri, 13 Apr 2018 09:46:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34081)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f6z22-00082W-5p
	for qemu-arm@nongnu.org; Fri, 13 Apr 2018 09:46:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f6z21-00070N-Fl
	for qemu-arm@nongnu.org; Fri, 13 Apr 2018 09:46:26 -0400
Received: from mail-ot0-x233.google.com ([2607:f8b0:4003:c0f::233]:33158)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1f6z21-0006zo-AK
	for qemu-arm@nongnu.org; Fri, 13 Apr 2018 09:46:25 -0400
Received: by mail-ot0-x233.google.com with SMTP id 23-v6so9908402otj.0
	for <qemu-arm@nongnu.org>; Fri, 13 Apr 2018 06:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=g9XKmtv9BRx6z6A9Tdfr4YWms9QdAyj/bdh9QF/IJ9U=;
	b=al5WCSPfr0eBqwa5TYOMNgUvoXTFca3cYsIpZx6Q0tYJ2OsHFKyY/6Kbw4TWmdwQ1H
	yApl2t3fMhXX/Qbrzbbg84C0avz6OfLDMxidwYHaQkLkVyKSySVuJl07Wwzc5WAFk5Bi
	EoTOs6U6oH97VKC7i8FYHg5BEqOqblXNC1fHk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=g9XKmtv9BRx6z6A9Tdfr4YWms9QdAyj/bdh9QF/IJ9U=;
	b=EbRk6zNj/jeg3OdO4r3qkDfbtbfe1O26GbEyGrtWHEj3eGvtheBkyRbkow4f8Mp766
	OS0dT7TA8tM/3l7hADisq9NqfG4akpHGV6LNIiloEMWY57cgQ75gYMRMl5vQROmelXBk
	zdrs9gpy2g0A4OlV+KtMuoAR5EpFJ8RcZw7YdS/gWb0GZ9MLdjT0FSu9oa91Y4wnRafR
	lTqQ1HOHSxAUe5l4mjByJO0tXpOYzjPPSqaUkFXkuK65tSb2lfeYF2sU31X0xOug/3WS
	aBTu5na7K3BWs85Jknalqd2oXgVWTraE3O3bgG9wgYlGJQAPptlgjYt60Fd03geGQ9+H
	DxcA==
X-Gm-Message-State: ALQs6tC5LUdM/l7C5QHM9Gt/SX5vUtzNi3D8cbjv3z8RW31PjIU9fnI0
	ifaMJlzjjXkpfQTfQs0ETfdwN5tFUS5bVKSqpzNXZA==
X-Received: by 2002:a9d:5cc1:: with SMTP id
	r1-v6mr3502939oti.258.1523627184586; 
	Fri, 13 Apr 2018 06:46:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:2286:0:0:0:0:0 with HTTP; Fri, 13 Apr 2018 06:46:04
	-0700 (PDT)
In-Reply-To: <e2fcd39f-f7f9-f8a2-7ef2-68a626e6bd0f@redhat.com>
References: <1522160122-10744-1-git-send-email-eric.auger@redhat.com>
	<1522160122-10744-5-git-send-email-eric.auger@redhat.com>
	<CAFEAcA8sQSuVcYPyE58tjapxxe6FNdD5qcyftYrZeWQ0fbev8w@mail.gmail.com>
	<e2fcd39f-f7f9-f8a2-7ef2-68a626e6bd0f@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 13 Apr 2018 14:46:04 +0100
Message-ID: <CAFEAcA-D083O3EVoF_DXPpXf2ax6Kfad9HOToFjZg8tnRE=g7Q@mail.gmail.com>
To: Auger Eric <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::233
Subject: Re: [Qemu-arm] [RFC 4/8] hw/intc/arm_gicv3: Implement
 register_redist_region API
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
Cc: Andrew Jones <drjones@redhat.com>, Christoffer Dall <cdall@kernel.org>,
	Marc Zyngier <marc.zyngier@arm.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IZ9uVq7NYuYD

On 13 April 2018 at 14:44, Auger Eric <eric.auger@redhat.com> wrote:
> Actually this is an API provided to the machine and not the device
> itself directly playing with the mapping.
>
> If not acceptable, I need to match the existing notifier framework and
> do something similar taking into account the new GROUP/ATTR address
> semantics here.

I think I'd rather that we continue to tell the kernel about
the addresses of device related regions in the same general
way that we do at the moment.

thanks
-- PMM
