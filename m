Received: by 10.28.71.155 with SMTP id m27csp5882524wmi;
        Thu, 5 Apr 2018 03:36:41 -0700 (PDT)
X-Google-Smtp-Source: AIpwx496E65QqBT1BcXubXO+3EcEIlt1SqER/oWyq4V1gU0VbeiWT4fXRERv0bzkOVUvdILxKLcT
X-Received: by 10.200.24.209 with SMTP id o17mr31786911qtk.192.1522924601394;
        Thu, 05 Apr 2018 03:36:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1522924601; cv=none;
        d=google.com; s=arc-20160816;
        b=SM6krXmVPH8ABZg4p+Ozb+BrN7fyri1u3pZNPh8lg+eNENpsk6WFVdxJjaLfhkMlZt
         e7dns4+gKhjw/0OMm5takepP2DnvhfxdU2Di4rblptuavEfjofDUOXMoDJi3O3plz6UL
         7/wUoZRulCrEaPk9LtRNH7wyXFD3ToxSR0cXaAz4mVDOE8yK0DpJN3+c3P79zrwORLVa
         Tgu4MBF8OEiX1MOab7XUs44QfF6QNmg6QDw88js0Bh5K52kyQ7wpwyExYUN5Lba8II1u
         EFuQ0orEMM3HcdWSDsmLGfOoPcrCfbXMHL2HP1T8qTeCNe5YnEKl77abwmnVoicC+7yH
         4fvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=c+UD4fXo6rLjRnNgoY9n/j8OK8oeS5e8fkSER9KDlMg=;
        b=onfDK/HeDukzygT/QOEukZ8QDuDroo6Xti5PCsM8XURDkFyeYl5qaKcVywhb5BbmgD
         T/g1BR5lZE0nOmf2phuAv3ZePjLPy5sAbjfHpPmb1DT9xXMK1uNMnffDDcyQ0hN1X5gT
         eUD7IgATuvYTXtuFsuyXTvvsFyACNhCf8TEmaC4+IM/dvoBfsDISuAOYj1KqcTvP9cbf
         9aSblCPDwwI1ThHbF+T9gvPK2Tsutid0LAuIGpF1N11lMA0mBFMVrdN6gAKcQ/Eu4nY6
         56k97SCxvADy79YljTyIQTKS35YKugoDoQOK07nzTSnBI58BKGiT87CPZKSx0tfWcbXU
         wvzA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dZdrxYnN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a201si3044004qkb.470.2018.04.05.03.36.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 05 Apr 2018 03:36:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dZdrxYnN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47479 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f42G0-0005Iu-Ub
	for alex.bennee@linaro.org; Thu, 05 Apr 2018 06:36:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56038)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f42Fs-0005IS-EG
	for qemu-arm@nongnu.org; Thu, 05 Apr 2018 06:36:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f42Fr-0005gO-BE
	for qemu-arm@nongnu.org; Thu, 05 Apr 2018 06:36:32 -0400
Received: from mail-ot0-x231.google.com ([2607:f8b0:4003:c0f::231]:33940)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1f42Fr-0005gG-5Q
	for qemu-arm@nongnu.org; Thu, 05 Apr 2018 06:36:31 -0400
Received: by mail-ot0-x231.google.com with SMTP id m7-v6so26687171otd.1
	for <qemu-arm@nongnu.org>; Thu, 05 Apr 2018 03:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=c+UD4fXo6rLjRnNgoY9n/j8OK8oeS5e8fkSER9KDlMg=;
	b=dZdrxYnN1d2id96gBL1IRSpe6EJlTcKsAfeNi8ge/7qU7wunNIOtUOlzjVFb2H1vkJ
	morJ2WdHM8pgQFwpQCk3nXbMg5WP9p2obQDR0fRv+ZGE3w+vbuYGKUhD+Z1JBiE29Z1v
	hfyT90pEf+Zaizw3ixsywpjY1OxZsiSBXhsUg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=c+UD4fXo6rLjRnNgoY9n/j8OK8oeS5e8fkSER9KDlMg=;
	b=l+ALyggxMy8LwVe6p33520Z3vTGKOC2z4inXYMoYzC5ke+rUmsEBNjvpGJagMz+YUT
	Lkg/tXig9NTllxyMHX002TfoU2eFzx7Eb8DdCl0s0JJjkCOJ1Zd2i2Xq+T5X1F1Rlj5/
	+hnAYv80Uwqnjl4dH3fV+lHJJzQdyTcT2ACjRm2R5UMpBlqcynYjt+W9AfWSkf0nrWGW
	NPDAtuM0ZRJchBw1dzR3jp1eLiqmCF3EEylZx3bQnejhlNp/BkhX/Nd0IpGWSDxy9XWa
	F27iRDWqWqYyku4At8Yrk0p2zfYjV1u3+M7C0iOq3+MJrfDgPL2mAL/GR4MSHPkdhU0P
	QeQA==
X-Gm-Message-State: ALQs6tBQoNAzuy9nAaDJhz1viJ/WiMXjEDklFV4UGJj1ljAppedmFJsy
	KvrbhEKboXM3Brzlk0vch5AKSIcFD4aqicOrJSZgvA==
X-Received: by 2002:a9d:2ff2:: with SMTP id
	b47-v6mr14007899otd.316.1522924590426; 
	Thu, 05 Apr 2018 03:36:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:2286:0:0:0:0:0 with HTTP;
	Thu, 5 Apr 2018 03:36:10 -0700 (PDT)
In-Reply-To: <20180402205654.14572-1-andrew.smirnov@gmail.com>
References: <20180402205654.14572-1-andrew.smirnov@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 Apr 2018 11:36:10 +0100
Message-ID: <CAFEAcA86ty1ckj6eu0mSJomuzKnYbH6ueF5o3+Jp1B55nGNuUQ@mail.gmail.com>
To: Andrey Smirnov <andrew.smirnov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::231
Subject: Re: [Qemu-arm] [PATCH] hw/arm: Allow manually specified /psci node
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
Cc: Marc Zyngier <marc.zyngier@arm.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AS88nxr9U76s

On 2 April 2018 at 21:56, Andrey Smirnov <andrew.smirnov@gmail.com> wrote:
> Change the code to avoid exiting QEMU if user provided DTB contains
> manually specified /psci node and skip any /psci related fixups
> instead.
>
> Fixes: 4cbca7d9b4 ("hw/arm: Move virt's PSCI DT fixup code to
> arm/boot.c")
>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Marc Zyngier <marc.zyngier@arm.com>
> Cc: qemu-devel@nongnu.org
> Cc: qemu-arm@nongnu.org
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> ---
>
> Mark:
>
> Sorry about the inconvenience, here's the fix (hopefully) to the
> prolem you reported in [1]. Let me know if skipping all PSCI related
> DTB fixup if /psic node is present is not the behaviour you had in
> mind for your suggested fix.
>
> Thanks,
> Andrey Smirnov
>
> [1] http://lists.gnu.org/archive/html/qemu-devel/2018-03/msg06914.html



Applied to target-arm.next, thanks.

-- PMM
