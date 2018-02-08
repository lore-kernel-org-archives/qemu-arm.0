Received: by 10.28.71.27 with SMTP id u27csp2395343wma;
        Thu, 8 Feb 2018 10:28:20 -0800 (PST)
X-Google-Smtp-Source: AH8x225mnxS0ku3j4EPrFMvi/A13mjwKvPLOVdc5eFxPi2gI1pxrkS3fEE+B5FG8UL53NwTgpM0H
X-Received: by 10.37.91.68 with SMTP id p65mr70377ybb.4.1518114500756;
        Thu, 08 Feb 2018 10:28:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518114500; cv=none;
        d=google.com; s=arc-20160816;
        b=Af6Vz1WzbtK4TIDlLMj5Sefq7I1FjtgQHKv2r2AW8QtUYHoAhnSBJvb6CBfZKd48ET
         jS6+gqc6YBfB3s2KYjUCMWINaG28g1baaIuoTTtAMyf6y/Hq/rhX8myEMNOZ+xzDBYft
         CcOUpraxHRWUTzvZdFGSRhmOm5D9qiQjgtQoUjom3FnfR8D3lmts9iT2Oh/d9q1UaZhn
         ECnXUpGdtbzgDIchYKte/9wCvANDgkPirMOWfOiE4aS+UutFvQ8FBv2NGm43pjY++2xA
         L/T7XCWqs80rRjJQCi0JpIhxJUw19eO8DtnpnnevBSUyE2vAirWpmFfbYp3KKTl0KwJ0
         CibQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=NEqrOnOOAWDoHgFxrVJbW+MYClI3Y32Ssy6sSzOn7X0=;
        b=SdBAtd5a9Z0LyRgY4R8Dsc1/1iH2gvR1Cz+YFkwYGeWY49U7/5N2uFKgmpRV2Iz122
         Hp6VluHBHui8cPmdnCED4nlPVSlmhb1EBOaJ9F38KTEL6j5hDM4gaP+6gVAf74mnGriF
         RtP9M7oDzfjj3hEhRd+trAVnyE4JZCGsQl1MTkyhLghA6E8iZ81tLGFO6kq4IWsLif0n
         LK/TGGR2a0+dPGd3Y3fBMW3fl/3tXh5fZV7uLM68ZrcnQdTw+G7rodnQgbMi6IQP16c9
         paxLblZZiHsEo8QDlLBwSL9Y0lDORIJq1/uspFPD1BKm/wTeykB/YwGdHfvCE9VH/u6P
         oLbw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Hfa5mO2G;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i184si90176ybc.620.2018.02.08.10.28.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 08 Feb 2018 10:28:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Hfa5mO2G;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60196 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ejqvh-00029B-SV
	for alex.bennee@linaro.org; Thu, 08 Feb 2018 13:28:19 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37805)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ejqcX-0002ev-7a
	for qemu-devel@nongnu.org; Thu, 08 Feb 2018 13:08:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ejqcW-0004h6-5E
	for qemu-devel@nongnu.org; Thu, 08 Feb 2018 13:08:29 -0500
Received: from mail-oi0-x235.google.com ([2607:f8b0:4003:c06::235]:45026)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ejqcV-0004gT-Vy
	for qemu-devel@nongnu.org; Thu, 08 Feb 2018 13:08:28 -0500
Received: by mail-oi0-x235.google.com with SMTP id b3so4145495oib.11
	for <qemu-devel@nongnu.org>; Thu, 08 Feb 2018 10:08:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=NEqrOnOOAWDoHgFxrVJbW+MYClI3Y32Ssy6sSzOn7X0=;
	b=Hfa5mO2Gya2uySV8k/2oegBIMv3cvnyZyO/BiBIU1Z7FDVl/QeTKy3LrLLos98QxCe
	D2GWV3esJ9FODLDAAAXHYrDa5k6SroFGzdvqAnuEsBSurnsb6d43ZDKl7Z9IJLNpHpkk
	T+m8EyZMkPoyZGZlWOaz5X7XfvH9n3SgTefcc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=NEqrOnOOAWDoHgFxrVJbW+MYClI3Y32Ssy6sSzOn7X0=;
	b=MqAq2qLiEXjaR5fPxer1JaLCDejRYWwbqRK3eHCQUgLrIT1PR/Xkix1r/qmARe/3Ie
	o0o6Ky+751z36HoduLfa3jkEh4F5aEg3e5drTBQlkpjfll2F9wYB8M8IOgRsACqeuzj/
	nNx2uXyzz9RX28WiHl/D/llgsDhanWw8bo9q0MPbatIlQ1rJFClQyTgWRE1suhoaPpDk
	I92k+UbQi6ev0SILn+HPutfMeF7rAqWb7cLbhEW/vTx0y2YfiItRSipqk6CKxS/pZoCJ
	jw+1kugMd+GdaNJZSkpfwwwnzl0HKVAfIm7uy51ojezj1sVSG7cvfcuERe3ICq5wAs9S
	fYcg==
X-Gm-Message-State: APf1xPD3IElW5pVwGE+OnL8A251PVOF1dI30GMaMBvpQbQSdw9Fc4KsH
	5nJVpVE6s+QI6D6tOlltNIre/xT+9GYu6bcSjDm0IA==
X-Received: by 10.202.244.137 with SMTP id s131mr21341oih.327.1518113307231;
	Thu, 08 Feb 2018 10:08:27 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.34.163 with HTTP; Thu, 8 Feb 2018 10:08:06 -0800 (PST)
In-Reply-To: <CAHQ1cqGr2e8vjQUUypkoyUc=QGQDNVkjydmOadfsSCzm78nkJQ@mail.gmail.com>
References: <20180207042438.15422-1-andrew.smirnov@gmail.com>
	<20180207042438.15422-10-andrew.smirnov@gmail.com>
	<CAFEAcA-=-+1A6toXM-ddP+iKBgHKh28Xq3VeGXfSLJ08xMRijA@mail.gmail.com>
	<20180208193033-mutt-send-email-mst@kernel.org>
	<CAHQ1cqGr2e8vjQUUypkoyUc=QGQDNVkjydmOadfsSCzm78nkJQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 8 Feb 2018 18:08:06 +0000
Message-ID: <CAFEAcA8VQtdCTQRYF1xMnUoxZC=2q1DUdTyqMiu1mPjZx_Dsiw@mail.gmail.com>
To: Andrey Smirnov <andrew.smirnov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::235
Subject: Re: [Qemu-devel] [PATCH v5 09/14] pci: Use pci_config_size in
 pci_data_* accessors
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@zoho.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	qemu-arm <qemu-arm@nongnu.org>, Andrey Yurovsky <yurovsky@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4qu8a4j7myb4

On 8 February 2018 at 17:43, Andrey Smirnov <andrew.smirnov@gmail.com> wrote:
> My only justification for this change was suggestion from Marcel to
> use pci_data_* functions, instead of calling pci_host_config_*_common
> explicitly in designware.c introduced in next patch in the series. My
> v4 patches incorrectly limited config space size to 256, so such
> replacement didn't require this patch, but switching pci_data_* to use
> pci_config_size() seemed harmless enough. I am more than happy to got
> back to using pci_host_config_*_common in designware.c and dropping
> this patch.

OK. I'll keep patches 1-8, 11 and 13 in target-arm, and drop 9, 10,
12 and 14 for the moment.

thanks
-- PMM
