Received: by 10.28.4.212 with SMTP id 203csp4801056wme;
        Tue, 1 May 2018 05:19:45 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZqCIvpTk57q+QnuCWc5mmhQvvfJCgqoQPpUUqsd4YOxiAjGaie7edRMVGu9ExRXiVn7LMsS
X-Received: by 2002:ac8:41d5:: with SMTP id o21-v6mr13535670qtm.207.1525177185399;
        Tue, 01 May 2018 05:19:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525177185; cv=none;
        d=google.com; s=arc-20160816;
        b=jA8MwV8ffa/T2Lha302BN9PR8dNR9oNPFD8IYY8wIHt6yKHkgiCWLTdo0F2vGjGRCY
         dQZDigSs8dnv5cQEAl66i4bOt7mZiH6wBoBLfsuOyy+exw9ind9SuDrvKqlm+oDRJ1m6
         0VKwYxA4T5TYWThVH7FZSuQuXmCdQrt2D0AeUa/+WfF9dCq2r6WLGZ3poDdM/A3I7gqb
         g6KhywHLVYAJe+3IREY+YUpzlf9B5+je5Mgnf9oPTBbaFIaM4WpneZYjXn28fkXyWMmx
         4WCyGqtZZ+zh2SfU+8UqcK6EN7h00IpmzWUGhYU3bc7M8Pf1GdrvXTcNzrWvHY7FLsNm
         QScA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=IK2gWq3T+0FYTLHoAgn2oI4bc3zdhDyKhkgj5tjxjO4=;
        b=ejyHtqlMa8gGlZ7r0cokWUEfFoWqI131GryT04PQjgrYZuBCD+lik6OWesaWVfagNg
         mw+ygnp3lLIv1XG1asCH4bS9LABvW6CxkQIG+H7dDteOqlSxtxqpOh7KGx5S2NKOIb9Q
         uSiZiTcE8Y4fiXqizBwxg4MSLGMtciEFVHefFCdlgaEIL/TXH7D2JPMex6+TuuCc3Y/V
         5EJTOwg7Jo3ZsBIPSVqlCsNdW/aCgZ5T/Z7++ra56zThdwrCbQ9hoEijc/YMpkvHKZGD
         Aj7ntwx6mTnkL+gK86/ptmFJXlUR2go8jSoLY6CmAVj1elDtwXHWFoXE5vMgbqw5822e
         D4Lg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LFtcb0an;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x142si2515952qka.34.2018.05.01.05.19.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 01 May 2018 05:19:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LFtcb0an;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42292 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fDUG0-0001mg-Kr
	for alex.bennee@linaro.org; Tue, 01 May 2018 08:19:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54376)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fDUFq-0001mL-9B
	for qemu-arm@nongnu.org; Tue, 01 May 2018 08:19:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fDUFp-0007gJ-FV
	for qemu-arm@nongnu.org; Tue, 01 May 2018 08:19:34 -0400
Received: from mail-ot0-x22a.google.com ([2607:f8b0:4003:c0f::22a]:41248)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fDUFp-0007g2-Aa
	for qemu-arm@nongnu.org; Tue, 01 May 2018 08:19:33 -0400
Received: by mail-ot0-x22a.google.com with SMTP id t1-v6so12729832oth.8
	for <qemu-arm@nongnu.org>; Tue, 01 May 2018 05:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=IK2gWq3T+0FYTLHoAgn2oI4bc3zdhDyKhkgj5tjxjO4=;
	b=LFtcb0an1s5MUVHV/iC+e+UhbLoS8Et9EDTGbHSLG75rn8HRPCDq2w/CgwFJi3PX4O
	n+DR551L4jevSJYzw9PWdHykHP0n4XWrGIRcIt6/OYyJ81c5kEWPAeApvF7eBqdSkC6B
	4PZAflnWNjNN1WtPPd7416F+kHzelmHX3p5yI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=IK2gWq3T+0FYTLHoAgn2oI4bc3zdhDyKhkgj5tjxjO4=;
	b=TwdMIuck+zn+Kd/ttMc1XZ1hcBEL6bn9GPvGyctmFP6Yb20SnL71/GLa5Lx9IA7S2R
	qvZCtdNQgY6Cbo967+w4+uICP9rbEHJj1wYmqSyyVbuwfe5XK90qZMamgUtL8+01sPPD
	Av+2y00dU2Jyf7XHAhrYtXri6tV9x+EV0bPPIvrA4mvHwuAdrTUn+tRcT3ATUJatFYxC
	UwkXGb8n8xMjBDq+ab9xMY1N06ip9BE8rvVoRsasJKTnRT+ezP27zz3YulMY8HZOK8Dv
	b6tJCW5ItRAL5adCgIGhXpNOJKY9wLqDViPyU8tNuZ8czcushnDmQ0StTJL0VKL8+wJX
	chkw==
X-Gm-Message-State: ALQs6tCmbuUWu8Gf/A0bd0/25a02DjwgDFXSN3BCM5UJk77l4Jj63la2
	wdfK/OCbPX3oP2xE2HrPYiaSsZZVLUn9qMlmViLohg==
X-Received: by 2002:a9d:3bf5:: with SMTP id
	k108-v6mr11070548otc.308.1525177172672; 
	Tue, 01 May 2018 05:19:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40fb:0:0:0:0:0 with HTTP;
	Tue, 1 May 2018 05:19:12 -0700 (PDT)
In-Reply-To: <1525176522-200354-5-git-send-email-imammedo@redhat.com>
References: <1525176522-200354-1-git-send-email-imammedo@redhat.com>
	<1525176522-200354-5-git-send-email-imammedo@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 1 May 2018 13:19:12 +0100
Message-ID: <CAFEAcA8iq9gJuC=ODK7wY_3m4B66o0LqJi9aK2PEfHha4q68nA@mail.gmail.com>
To: Igor Mammedov <imammedo@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::22a
Subject: Re: [Qemu-arm] [PATCH v3 4/5] arm: boot: set boot_info starting
 from first_cpu
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
Cc: Eric Auger <eric.auger@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xMmN/Dlrm7WX

On 1 May 2018 at 13:08, Igor Mammedov <imammedo@redhat.com> wrote:
> even though nothing is currently broken, make sure that boot_info
> is set on all CPUs.
>
> Ref:
> "Message-ID: <CAFEAcA_NMWuA8WSs3cNeY6xX1kerO_uAcN_3=fK02BEhHJW86g@mail.gmail.com>"

Can you include the rationale in the commit message rather
than just pointing to a message-id, please?

>
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> --

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
