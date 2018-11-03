Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp472625wro;
        Sat, 3 Nov 2018 05:33:13 -0700 (PDT)
X-Google-Smtp-Source: AJdET5cAkhPkgh72ZsJL1UMM9V+qaJ8l4ycg9LlVthJlH0jUOMAAl+LZMCzGu/CdmVH3yHRbFr18
X-Received: by 2002:a0c:c11b:: with SMTP id f27mr14518498qvh.225.1541248393109;
        Sat, 03 Nov 2018 05:33:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1541248393; cv=none;
        d=google.com; s=arc-20160816;
        b=BXzmUjCJH8j5Vmc3zs0ou7t7T5UwnXAWFl3A1xp3mS+odHrwZio9W1H76l562oV8AT
         tqtPs4JsitzyNxh0gqVc9mwLeVw48cKNoezM/tj9y6bTpZeKaFRZqCXlMj2Z7g8RhcSW
         7oNTXhu9Hkf6u8qFkeBldpaXpdl3ADMBMfQpk2w38zYr8NE9q+s2TzpbWw6Carm2tPEJ
         8tqoHsMoDt/hTtCLWDqVJ6yTC09nUiZdImNBW6Puh7/gBhl72BudxUIyPuplapVNUMjf
         at4GKzpimgqq6b9Lgrw4rawmCnp8unrHOPFQayv8w/HT0i3wgSwsIfODmH43onEWl/GT
         KKAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:to:from:date;
        bh=zlGeJXksQKc2PkmbeAgJ0b7WWDHlT7/dr6TNEA/Tpe4=;
        b=G6nMEOI5IqWC3OuHl5gdj2CSFNCvxYFkZDjwHGIL0m785mTpcdj9u8QTjYUtwhdhxX
         yRWXatSD6c5aYl9bZr2U6uhGUK7X/oV5mbRl5s4Ueis1DLmdxhuMwIPGwspQjHoVjU8v
         iJ2xPGeBjzsvF9FeosPdA7FNLRmrG57Ku8ipzT45R1dOpSShqGM0+oDs4SyCYTqNZKTM
         Y19Ol+mJYCCTXKJQI6oseupCg693ZB3IyMpYQ/BThhWP3HFrBUDUzDOZtAuyUbVfeway
         kUmWd+Kbpw4GYUjz/t1o3YB6EySRGEGYjVddIQXb3oMwhsVtqYrxb8B99gUOty331uV9
         kBFQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y67-v6si5905227qkc.226.2018.11.03.05.33.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 03 Nov 2018 05:33:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:55487 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gIv72-0007HX-HV
	for alex.bennee@linaro.org; Sat, 03 Nov 2018 08:33:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46592)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marc.zyngier@arm.com>) id 1gIv6s-0007HJ-Kr
	for qemu-arm@nongnu.org; Sat, 03 Nov 2018 08:33:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marc.zyngier@arm.com>) id 1gIv6p-0002gZ-5M
	for qemu-arm@nongnu.org; Sat, 03 Nov 2018 08:33:02 -0400
Received: from foss.arm.com ([217.140.101.70]:59944)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marc.zyngier@arm.com>)
	id 1gIv6o-0002Of-MV; Sat, 03 Nov 2018 08:32:58 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DC2EAA78;
	Sat,  3 Nov 2018 05:32:51 -0700 (PDT)
Received: from why.wild-wind.fr.eu.org (usa-sjc-mx-foss1.foss.arm.com
	[217.140.101.70])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 224423F6A8;
	Sat,  3 Nov 2018 05:32:49 -0700 (PDT)
Date: Sat, 3 Nov 2018 12:32:46 +0000
From: Marc Zyngier <marc.zyngier@arm.com>
To: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <20181103123246.16b5b101@why.wild-wind.fr.eu.org>
In-Reply-To: <effa3839-f0ab-e6ab-e034-a1a6d1d06923@linaro.org>
References: <20181102145433.4553-1-richard.henderson@linaro.org>
	<CAFEAcA_tcR_33Q+2ZFHdzo4_9khXggum=gRfZ8+L49KmP3hHiw@mail.gmail.com>
	<20181102193529.GB12057@e113682-lin.lund.arm.com>
	<effa3839-f0ab-e6ab-e034-a1a6d1d06923@linaro.org>
Organization: ARM Ltd
X-Mailer: Claws Mail 3.14.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 217.140.101.70
Subject: Re: [Qemu-arm] [PATCH v2 0/5] target/arm: KVM vs ARMISARegisters
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Dave Martin <Dave.Martin@arm.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	Christoffer Dall <christoffer.dall@arm.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FwLZIWy/+s00

On Sat, 3 Nov 2018 09:53:44 +0000
Richard Henderson <richard.henderson@linaro.org> wrote:

Hi Richard,

> Although, while I have you, Christopher, is there a way to extract the Limited
> Ordering Region registers without modifying guest state?  Those are multiplexed
> with LORN_EL1.

We actively hide the LORegion feature from the guest since
cc33c4e20185a391766ed5e78e2acc97e17ba511 (in the 4.17 time frame), so
you shouldn't be able to obtain these on a recent host.

I'm not sure this answers your question though...

Thanks,

	M.
-- 
Without deviation from the norm, progress is not possible.
