Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp5171449lfp;
        Tue, 4 Feb 2020 02:22:55 -0800 (PST)
X-Google-Smtp-Source: APXvYqzau+nqvHgpFZKFgEDPTWQholWjXiDX/tdVxx9nJC6rx5MZXyIhKejhkGXbsK8nWg7+F9xs
X-Received: by 2002:ac8:3673:: with SMTP id n48mr28129378qtb.288.1580811775302;
        Tue, 04 Feb 2020 02:22:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580811775; cv=none;
        d=google.com; s=arc-20160816;
        b=vDhAs14rFLJDFstFDMUSYN5iWmf8dXQh8yYTC1r932i7ys2/nSE/C90NqFcAZy2BKJ
         qKBGUuCfjuDQgUM+m7EmqsFVVKF/Mqb+3MQqGw1EQTCgk5iyPN5eWNdiKBnl3lYzBXoS
         NqJiR9QUBSCnLJWdaXYsfzYd+JDU4IYs3ODnHVtQbUbhpWomz0xWxVFchPztmFuEFK8Y
         ZYaFwRxz0QdBeo8uryJmqHgUUF/X3psNxQNVrLrqKMl2mhqQsLo+PRfw7Oo7IThBUiTP
         T18TAxlcPdSrKTCogD61t2eHXShs6HYOh0sNXQs1QTAdsl0OjdHBwejN1/rA1vqehJo3
         GaWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Vib72RK1mz4kVITADDK2FtUXi807Li9E+4tBGQjWb7A=;
        b=GNSQeHTrMdofFI1WDAM4yrzLllr1bfu5sJ3wDdyTtdguLP5nWC15jeywb9MmE/tekz
         xT9XwJFCcKFcpPP3ZG4ZYd+no8wXOcRbDIzufhRN+yVJt8lWzIpLHWWwlCzxs6ErUiz6
         IhIkgNl/g+IXE6JoZD1KQqyRmOztRFXBjuEbC8eHr30JMSerCO4JxkGCEcG58wOFUPaR
         /QBn8DkYWJvEIudsD64sRjXJCgj0JzHqDnBzbejwUoG7HQRd8LLR6HyikzesthTAKO4K
         6TTHn+XYbRKKVFZxPYWh0a5t86ICEKxU8iqZda9s64ceN/AixheFhk2PvQ7Jb7iOos17
         JSPg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DNefLlAW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f26si11082961qtq.59.2020.02.04.02.22.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Feb 2020 02:22:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DNefLlAW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iyvM6-0004D0-IG
	for alex.bennee@linaro.org; Tue, 04 Feb 2020 05:22:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49330)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iyvLy-0004C4-Mc
 for qemu-arm@nongnu.org; Tue, 04 Feb 2020 05:22:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iyvLx-0005vo-OO
 for qemu-arm@nongnu.org; Tue, 04 Feb 2020 05:22:46 -0500
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:33453)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iyvLx-0005uM-Ig
 for qemu-arm@nongnu.org; Tue, 04 Feb 2020 05:22:45 -0500
Received: by mail-oi1-x244.google.com with SMTP id q81so17968311oig.0
 for <qemu-arm@nongnu.org>; Tue, 04 Feb 2020 02:22:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Vib72RK1mz4kVITADDK2FtUXi807Li9E+4tBGQjWb7A=;
 b=DNefLlAWwhN19RdzfL8iKSltIh/MPRMexpZtus9Eh2id9neJUq97bZHGBEvIYDrMxU
 2F0dPW8LGEyFPmzlsnPgWjtZ00JVgGB2gOfslw3JmOH3zZlw9w4xcgwfd8HAKo8oMGKR
 de46S2gvKHljzqLpsMrVahaZhAwpZO7jn+ZMEhFpkCKGK+DTh2W8/QuRfcVqTHJbqiX3
 w5yUrsrWd3EmWNtocXaHhv91AcsrK7wXqmtY5gA+Ae8Y/v08XyIPBMigUBC6ek1zDC8Q
 3Z5/vmYk4nhJSDdUDPmOczUbd/Km20zcOYvumsmX8jgH6JtJO3nREXvg6+0wXFJzk3wC
 p2gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Vib72RK1mz4kVITADDK2FtUXi807Li9E+4tBGQjWb7A=;
 b=tms72avWQihA47DpqZNLvDDksHOlOiO+kt03x943Np6VjDhb6KBdklw/F/RXJkynXo
 +1Iq8fJgUf+pj96uu4grnjUhVgeDRnqG3m1P9smTziv17ihLPH0NWmdBma21ab/Btulu
 bUp4/kNDPpMFN2kIbY0oV4mQ8GY1vp1IL8yostc2Nd8Bip/0iuXLLMo2iCPe9r//mpBA
 wpW3nnkcWlkk7zRBKzhL7VLSmgu7lB7XHsnpyilW5KmMo/Yg/LHwK8qE03YIMNb8Br0b
 jafwi87wIUDxvFePcEl52szIxDXhXcH6SI0/+/bBu/IOMh/KdO8EGr6J5MD6SETX6kkk
 BWbw==
X-Gm-Message-State: APjAAAXg84WnZpnZvDhXvUm7hOTIPmQJlmwpTA0wsbNqggqgeODcfij/
 0kZn3sBbwiq7EJBb6hj2TLMVpSlf/VVdENnez6+1lA==
X-Received: by 2002:aca:b2c5:: with SMTP id b188mr2989706oif.163.1580811764753; 
 Tue, 04 Feb 2020 02:22:44 -0800 (PST)
MIME-Version: 1.0
References: <20191219040612.28431-1-gshan@redhat.com>
 <d972631d-7db7-b6d5-61b8-244ae2c85882@redhat.com>
 <7f6e29e6-1df9-4513-79ba-b53873b0735e@ozlabs.ru>
 <544f261e4b9c97f1d3a5fb64cef42ba5@kernel.org>
 <ff584722-1b51-e538-7c45-c71cdc40105f@redhat.com>
 <c61c95c434dbcf97a0c946f0993d4843@kernel.org>
 <8a286e1c-c3f3-3052-e497-d44a90667451@redhat.com>
In-Reply-To: <8a286e1c-c3f3-3052-e497-d44a90667451@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 4 Feb 2020 10:22:33 +0000
Message-ID: <CAFEAcA-wKbF7mYToaAsxDxahuJ_X3_i3Z+8DqXmj8mKySmTW7Q@mail.gmail.com>
Subject: Re: [RFC PATCH] hw/arm/virt: Support NMI injection
To: Gavin Shan <gshan@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::244
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
Cc: Andrew Jones <drjones@redhat.com>, jthierry@redhat.com,
 Alexey Kardashevskiy <aik@ozlabs.ru>, Marc Zyngier <maz@kernel.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Eric Auger <eric.auger@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, Shan Gavin <shan.gavin@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Qcu2zA8ay6NK

On Tue, 4 Feb 2020 at 03:51, Gavin Shan <gshan@redhat.com> wrote:
> Note: I'm still investigating the code to see how SError can be injected when TCG
> is used. I think we need same function when TCG is enabled, or it's something for
> future.

TCG doesn't currently implement SError -- it could be added, but
there's a bit of plumbing you'd need to do to get it to work and to
ensure the exception is taken, routed and masked correctly.

thanks
-- PMM
