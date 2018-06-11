Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp4023368wrq;
        Mon, 11 Jun 2018 06:09:29 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKIPuaQxq3nkFbxz3V6Vom7PDCJ6PHfc62JjrXv4gU9Flw0id4actWhcp9W55alQDjWUJvrI
X-Received: by 2002:a0c:c2c2:: with SMTP id c2-v6mr15253186qvi.235.1528722568931;
        Mon, 11 Jun 2018 06:09:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528722568; cv=none;
        d=google.com; s=arc-20160816;
        b=YcetNckqbTkPNyXPh8DkbqjYyihyXAhLRf+8NkxJRhwM/aBo47BTrtrcv7QjBauE/x
         iSfLbpJRBtQvxHl/jjmBUPtwB8TmEfNyV+NRO0DfpEDThaJ2Ho2RLA92t20yiIefYsKk
         vyQ8+fqUq7aVDyDn20QKQGd54J/NNxPlm6vpTdZNpExRO1ZW6hubf1waD1/sgbSt4f/k
         tn8/kxbMfQSPVYvDJXh3p13/gP+tkWMlreAZb8G9aFxWmGPfxtUYxvZyzVzy4TH43oy2
         Pj6S/xEdEzvJn0WLJb0lecUxXcz2p/yLUMrMfZkMtzG+YSwBMjhVlWdIUzGsB1XsAJz0
         wPhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=jiZ3iodHJWSOcLpoqmRfdLqDo6g9yubK7izmqnJJGM8=;
        b=e3EDcCzyrlaO/CMsThB7GpntV9fCs0KJdKHNmjIBHKVSALwyduiDUZHaBcISIp2g6a
         8NpOhQ7JS5MxChYVCqD8flMwLuWV/MLXaG9BBRli//NvSZpoQJtB8XN55XDemy/VroK8
         uqOSIy8TiW3Kgnb1EqS+jRlMI4fODpjoKAkuzaJ5BKN2kMJ1NNavQYH/z3Au+c2yu/dh
         1q8hV7an6KFw60anmTAzK0FXLtPKnuiVPoTkRorxHQd9WRqRxaZFSanIDuoNkG4Pnztp
         6S1ZyVwX3qhMNp4GBN765hXPwnHYisObB1WSVCqe/EAaeRE4pwga6YgNR61PcZvTySK0
         wN7A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=YfwgxFNx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y13-v6si332146qve.161.2018.06.11.06.09.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Jun 2018 06:09:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=YfwgxFNx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48752 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fSMZc-0006Hb-DQ
	for alex.bennee@linaro.org; Mon, 11 Jun 2018 09:09:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35774)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fSMZS-0006GF-Gc
	for qemu-arm@nongnu.org; Mon, 11 Jun 2018 09:09:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fSMZR-00043y-5P
	for qemu-arm@nongnu.org; Mon, 11 Jun 2018 09:09:18 -0400
Received: from mail-ot0-x243.google.com ([2607:f8b0:4003:c0f::243]:45439)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fSMZR-00043Q-08
	for qemu-arm@nongnu.org; Mon, 11 Jun 2018 09:09:17 -0400
Received: by mail-ot0-x243.google.com with SMTP id a5-v6so23652323otf.12
	for <qemu-arm@nongnu.org>; Mon, 11 Jun 2018 06:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=jiZ3iodHJWSOcLpoqmRfdLqDo6g9yubK7izmqnJJGM8=;
	b=YfwgxFNxzpvNELEQG9IqS6+R8N8V1pkHFIJS/GFNGQU1cpgIJFpd0OiV2ShRGyp5uC
	8QMCmVozDgQvwClTgpY5KuzUyu9wMZJe+ZYRcsXNDnATU3wH57sVDN1Ny/Chg/M8DSLk
	hkB87ghJoBitDkNNJfMR7xB++oO3Zn70Ukr/k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=jiZ3iodHJWSOcLpoqmRfdLqDo6g9yubK7izmqnJJGM8=;
	b=NRPyNSbbWrn0EHhNneHxNo/BHdNyKuFa++5z7sQdyA5hS0BLu6+9BKh1kDVSjyEEyx
	CpdzeEUKQ167ON8JNCJ2D7bmgHR8xnbemPzaCtVdIYpFbssnQwFTuHm7JmhzikDjZc6B
	qXFBGNsFtLp4iYRb3CttoAkfQzBCfGYzj8S8jw6sCENnRnE4/6BYLMhuFRSCdVFcFGDB
	+wy1zyFLO0rF4loAMGQEvbZvxMvMfwHE1foEfgmj4s3kO7ib+6LGNKGjjnHyGEzV+KVt
	A5FJJx69hkabu1MRPifAaCpONxzsZATpk8es95HRQtt7UhZqOclVpQGuWw45MlNWEern
	Gv6A==
X-Gm-Message-State: APt69E1WxRxFkFuXXvEwJ/e4IlUpnFlTV4ry7/uYGL5B19qkKtSs5vrH
	QOwpZFW8KyeyzSwMcdGJGhHx5xTsa/O3MNRWHQG2Nw==
X-Received: by 2002:a9d:705d:: with SMTP id
	x29-v6mr10328191otj.308.1528722556408; 
	Mon, 11 Jun 2018 06:09:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40d3:0:0:0:0:0 with HTTP; Mon, 11 Jun 2018 06:08:56
	-0700 (PDT)
In-Reply-To: <5B1E33A4.7070509@huawei.com>
References: <1527736557-11084-1-git-send-email-zhaoshenglong@huawei.com>
	<1527736557-11084-2-git-send-email-zhaoshenglong@huawei.com>
	<e7bb1cbd-7fad-5bd2-641c-885f0f473680@redhat.com>
	<5B1E33A4.7070509@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 11 Jun 2018 14:08:56 +0100
Message-ID: <CAFEAcA_ZuWkEi1e4G8Kaaw4K0ROTwJnBtghCHsMaTJ3LRXJbDA@mail.gmail.com>
To: Shannon Zhao <zhaoshenglong@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::243
Subject: Re: [Qemu-arm] [PATCH v5 1/2] arm_gicv3_kvm:
 kvm_dist_get/put_priority: skip the registers banked by GICR_IPRIORITYR
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
Cc: Auger Eric <eric.auger@redhat.com>, qemu-stable <qemu-stable@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Shannon Zhao <shannon.zhaosl@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Tu1WU4GIl0iK

On 11 June 2018 at 09:32, Shannon Zhao <zhaoshenglong@huawei.com> wrote:
> Hi Peter,
>
> Looks like we missed picking up this patch. I didn't include this in v6
> since you and Eric both reviewed it.
>
> Could you please pick it up?

Oops; added to target-arm.next. (I generally forget entirely about vN
of a patchset as soon as vN+1 appears on the list, so better not to
drop patches from a set unless I've specifically said I've put
them in target-arm.next or they're on the list as their own patchset.)

thanks
-- PMM
