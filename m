Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp300416wrd;
        Fri, 17 Aug 2018 07:59:57 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPw7nvGGAtusMChoBcU3UMG5filfu9ZQJOGr0jWOws/TZlpEsr2Hg0afdlY0n92/9ytqJI3V
X-Received: by 2002:ac8:13c7:: with SMTP id i7-v6mr35632636qtj.134.1534517997007;
        Fri, 17 Aug 2018 07:59:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534517997; cv=none;
        d=google.com; s=arc-20160816;
        b=WWTMOJs2hC9XmYYNx1S1IhI10FAgYoNkfD1+U8ZfSsVuZiv6zXGBHb3S2pZGHMNTW2
         7QTUx/36xQZZnHsWxvf9UbqR4VahxFI1hEuvkLkt+azB0L5/KWyU3GKhzd3Xfz9YxYiX
         f588wBY/5ZkH9HDCek77bcZjler2Tk4DzKI6Ojqtk49Y+YoZExL3w+AMq3+Si4sQXFV+
         L9lqDt/A9a7uNSSeg2XxW1FSawIclPHMajLMJyvhcPv8nOqG8T1LcVcrIHkCq5VdJkJx
         I+hz3QXZ2sf8AAT+JT+CT39Y+N2REo8X6BiMlDbbWLnHss+RKj2KPcR1J/BFMgfJMWhC
         1JTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=l4tLi9pOLtMSIr/H+MjspRR9XbbV4eiZwDSwvFTrJag=;
        b=l3uax50n/mOJcZRgEFNOx24F4UP58Pc8M1PXAow170+Du8ZGD6aM26vAIfN7ZKZX6R
         Rz7Qt9FZM4c9BpMAtFEO5k1WXhUD6seR45vxT2clc0zSkgDfbsdhtU3CacR/5QdpqUY2
         PYw4egxnfLDVNpk741pjw07P1Hi0h/hmRr5HBdTKdpTgNuCH3JNKIHADqWHEYDVMDPlh
         BTwUbtQWDqQ6gMb96T1L1w+0vZy6ODP/7m4B/TRtmMiWy1MUEebBdPS81HIxs3Zvq31D
         zAYOMOhZJShgIweVn2JWeBUuI3fPE4FOdalkQLpHVw/voU5uGvnljEdUmvze42oJurKJ
         3Blg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=PxFZv77Z;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d14-v6si2003378qto.282.2018.08.17.07.59.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 17 Aug 2018 07:59:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=PxFZv77Z;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34562 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fqgEG-0004IC-Ff
	for alex.bennee@linaro.org; Fri, 17 Aug 2018 10:59:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41773)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fqgAo-0001nU-7Q
	for qemu-devel@nongnu.org; Fri, 17 Aug 2018 10:56:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fqgAi-0001g7-Bu
	for qemu-devel@nongnu.org; Fri, 17 Aug 2018 10:56:18 -0400
Received: from mail-oi0-x242.google.com ([2607:f8b0:4003:c06::242]:39899)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fqgAe-0001bo-Np
	for qemu-devel@nongnu.org; Fri, 17 Aug 2018 10:56:14 -0400
Received: by mail-oi0-x242.google.com with SMTP id d189-v6so14447561oib.6
	for <qemu-devel@nongnu.org>; Fri, 17 Aug 2018 07:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=l4tLi9pOLtMSIr/H+MjspRR9XbbV4eiZwDSwvFTrJag=;
	b=PxFZv77ZLFO5P7rmBCdJdaJiqqH9wgLevaRYuWkJU1ejK2H/kdGYvsHolm5m06MfKh
	RX4hJL7LxsjAdmIpyEJMuHyKzlQV/aQZA6mTVAlwISawCRa2iwq/jKXK1JrL3oriG+dQ
	ulCMQsCtiDOxTr98x0ma7mJz5IdMgPO3plONI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=l4tLi9pOLtMSIr/H+MjspRR9XbbV4eiZwDSwvFTrJag=;
	b=AnwQwkT6tUSzQUX0JKWCWAshOm85BjH7Q9LrwHGfZt/F9nYppXaBv19CoFLG+F17Lp
	FsW9BWomiGf+eNsvcRsjCFmGu0qRoxiuz2xOh4MmfkQwrCt9KY0LtZ2z+QDkgleVoxLn
	A4v2Sc8GOs0ozu4SNgfkczpihbCbXAQlgBnawJxeX5+AyAhgoq2hAMUuyim0WCSwURQ+
	MZWsl5TTbXzgTzeEz6X65U5jBo52k9GJNo8+JaFALDLKI9EPGtvfau5NBXp0vL6IhJRd
	U9W43FUCC1qI/WGuB8Dsez/NTCJonUMB0JoXIHYKRFJklzNiHQKrN8p63blCr+1K+o69
	9otw==
X-Gm-Message-State: AOUpUlHbgxn3/kzN1X2+TMtskx8uXLi3iP/r0r5OieSIrpIDazXko1Q0
	PKY5WNzVB/3MIUuxVXCInMqmNmpIiQaFXCWUVaCRnQ==
X-Received: by 2002:aca:c351:: with SMTP id
	t78-v6mr2969420oif.338.1534517770237; 
	Fri, 17 Aug 2018 07:56:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Fri, 17 Aug 2018 07:55:49
	-0700 (PDT)
In-Reply-To: <20180723142224.11e912ec@redhat.com>
References: <20180704124923.32483-1-drjones@redhat.com>
	<20180704124923.32483-2-drjones@redhat.com>
	<20180723142224.11e912ec@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 17 Aug 2018 15:55:49 +0100
Message-ID: <CAFEAcA8QoaGLOVJn-JYQKsgfiLrqChXRP5wdAY3BwZHnz8ssZg@mail.gmail.com>
To: Igor Mammedov <imammedo@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::242
Subject: Re: [Qemu-devel] [RFC PATCH 1/6] hw/arm/virt: Add virt-3.1 machine
 type
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
Cc: Wei Huang <wei@redhat.com>, Eric Auger <eric.auger@redhat.com>,
	Andrew Jones <drjones@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: w01HNBjlvLMX

On 23 July 2018 at 13:22, Igor Mammedov <imammedo@redhat.com> wrote:
> On Wed,  4 Jul 2018 14:49:18 +0200
> Andrew Jones <drjones@redhat.com> wrote:
>
>> Signed-off-by: Andrew Jones <drjones@redhat.com>
>
> Reviewed-by: Igor Mammedov <imammedo@redhat.com>

We're going to want a virt-3.1 machine anyway, so I'm
going to take just this patch from this series and apply it
to target-arm.next.

thanks
-- PMM
