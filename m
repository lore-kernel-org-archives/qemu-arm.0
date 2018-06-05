Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp923124wrq;
        Tue, 5 Jun 2018 06:10:12 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKK7OXcAvp6i6Dw9wABH3C8r0yDWGabHUnnIss6ULaBw5K+og4z8tzl2PGRd8WSCSXSaMwjI
X-Received: by 2002:a0c:8c8a:: with SMTP id p10-v6mr1597113qvb.68.1528204212553;
        Tue, 05 Jun 2018 06:10:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528204212; cv=none;
        d=google.com; s=arc-20160816;
        b=PAcoVfTRnJMkOQ/kMh3Y1zFgMmT1NVmwZUYVLUClpr9Jjex+7BRvGz8eYYLFdZnBar
         g4JqNhwXYKLztUvMowOXVi3Hq5EtlQnuO5PQ8GAwvun+1gHObRtu8sLiN++RuXd42IVu
         zqCBZLoen5FfMyd5lSOsypieI6i2HDy3bCrNguvizThYkdw8P2UJtnrvekuPVmsOn7zU
         b+KEL6UzLuwodsUGRYGNor3CV21VDmw8ahqbvijCnjEgblKy4mR5P0k1ALCkH5/N+6m8
         HiV6Xi3nYK+X48dZWhj/O8WsRURC0PykXXNTyeHx0AM5ItlzQcuF155OqjdwJiOsZwiQ
         f1Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=o4FxaWdwT35XmcHtSCIUUahGhPx4sXIOuOwnygnH5ks=;
        b=ELShOFoePfPb2ElXFdZqDOFfLFRMABkOO6ruuuOjCeQ7SFtxKtaJ/t0xB7plUkwNKR
         BqYRSsEg4qUGvNoXVw9UPTPCz9b9PmFjqzYuZPgnjB/r7RtIB2CyA3ODfJ/IgRPhxq3h
         mABBnMAnIRuzfeZgZnt+56qxhUReWestGNgxjmZq1RvJnW8lxGFM8MgGYKgNmr4sBcVF
         pPYMt+t45EU3jzl6KvIMyDVAudPQPsVl9FO3qvlYWVtsBnlbQIICam05oAQpRzPKzPGF
         2kh8bFEOUznyDbhGtz5esO5Lh5X3lRXg+95z5Xcy211ron08dHFb8evN2owTIcJ1jWNr
         ttEg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QfFV6r4O;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y9-v6si1888522qtf.398.2018.06.05.06.10.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 05 Jun 2018 06:10:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QfFV6r4O;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46538 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fQBj1-0001HC-Vc
	for alex.bennee@linaro.org; Tue, 05 Jun 2018 09:10:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50176)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fQBgP-0007SB-No
	for qemu-arm@nongnu.org; Tue, 05 Jun 2018 09:07:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fQBgO-0007pm-9p
	for qemu-arm@nongnu.org; Tue, 05 Jun 2018 09:07:29 -0400
Received: from mail-oi0-x242.google.com ([2607:f8b0:4003:c06::242]:38849)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fQBgO-0007ou-4v
	for qemu-arm@nongnu.org; Tue, 05 Jun 2018 09:07:28 -0400
Received: by mail-oi0-x242.google.com with SMTP id d5-v6so1976605oib.5
	for <qemu-arm@nongnu.org>; Tue, 05 Jun 2018 06:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=o4FxaWdwT35XmcHtSCIUUahGhPx4sXIOuOwnygnH5ks=;
	b=QfFV6r4OL7Xyfq65JCpfz75z5RST3Hby6rCKxKX8gADp3JeGDg+v0iYfpRTrpvHnAg
	s4oUh/KoTHcqddaYoEfaNuth78DtmvLK4tvWGu1tVVjgNd1U6lru0xvpyXW8bQIWxPn1
	EU58wSbTg7bsptu+76YEVZ8truo+ujWyVo+QA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=o4FxaWdwT35XmcHtSCIUUahGhPx4sXIOuOwnygnH5ks=;
	b=cLztq5IHir1PoWbnxAVgIX25bGaVouIKlGxPXvhfgNX8W8YqjbFu1HVp6Zx0EPXVwJ
	3dUo8Mr123TYOZPS/z4Fc8JqXgrkXwnyyjg9+OtgC1wT5cm8fibk7YFeyFghWZnHxUE/
	hh+G7tiPYib5K+VURdqd1cF3IWeq6P/+Pyk+Ln6OqaxM0EQsr7keMGPckRs+JgXl9GMA
	9kXn5iAoAgIxXkX4nOOtde+Uq4ptDV12MrOVk0Qm3fdxLHCaqCDr8O9x6HbuEFENq+Ic
	rc/GrXESfI2lMPTkJ6o0cwnTEKq8S4UQXunda5qqXXekVZ9QSNYBV5XW3lWwn2tW1Xcx
	ukfQ==
X-Gm-Message-State: APt69E3iytnnIZnu/ecyP7PazBnijfREpfZXrco8DJ/bFx+kGaC9kmCU
	mTyWxT6AQjiNMzq9Sf5X9P/JNA58wH2SeG/gjmwztg==
X-Received: by 2002:aca:d4c7:: with SMTP id
	l190-v6mr15115177oig.102.1528204047577; 
	Tue, 05 Jun 2018 06:07:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40d3:0:0:0:0:0 with HTTP;
	Tue, 5 Jun 2018 06:07:07 -0700 (PDT)
In-Reply-To: <1528231969-19584-2-git-send-email-gengdongjiu@huawei.com>
References: <1528231969-19584-1-git-send-email-gengdongjiu@huawei.com>
	<1528231969-19584-2-git-send-email-gengdongjiu@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 5 Jun 2018 14:07:07 +0100
Message-ID: <CAFEAcA9N9J4r44nFkYEof6JfH3rT+y8Z3gnEfOHg4tcoeRoAfw@mail.gmail.com>
To: Dongjiu Geng <gengdongjiu@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::242
Subject: Re: [Qemu-arm] [PATCH v2 1/2] kvm: sync linux headers
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
Cc: qemu-arm <qemu-arm@nongnu.org>, James Morse <james.morse@arm.com>,
	QEMU Developers <qemu-devel@nongnu.org>, Linuxarm <linuxarm@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6obHg+/7M5Ji

On 5 June 2018 at 21:52, Dongjiu Geng <gengdongjiu@huawei.com> wrote:
> Import KVM_CAP_ARM_INJECT_SERROR_ESR and struct kvm_vcpu_events
> for arm64
>
> Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>

Was this produced with the update-headers script? If so,
the commit message should say so and also which upstream
kernel commit/tag the sync is against. (See QEMU commit
65a6d8dd3f32 for an example.) If not then this series should
be tagged as an RFC, since it shouldn't be applied until
the kernel API changes have gone into the kernel upstream.

thanks
-- PMM
