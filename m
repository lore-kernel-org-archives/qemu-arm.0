Received: by 10.223.150.237 with SMTP id u100csp324948wrb;
        Tue, 7 Nov 2017 10:03:22 -0800 (PST)
X-Google-Smtp-Source: ABhQp+RKGImhTPKgTdE4OwoCJrlQZDbSjI+a3PShFSYxFNJ7egF7Bz2UFr8ylz59usU4+iv6Jq4i
X-Received: by 10.129.34.196 with SMTP id i187mr12705700ywi.487.1510077802611;
        Tue, 07 Nov 2017 10:03:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1510077802; cv=none;
        d=google.com; s=arc-20160816;
        b=jviTd2XcpIL0+ehTI7pDwck1s+KYwL4mvsfUub1lcPRTLeXIZSphkfLitz4Gf/Uw3m
         UVW0o/3XLEaB5ofi3Aw1QgzlIKdduh6nFz/F3wvzF5OJ1dm+N64bgTUo+W83/ftJDNo0
         V+AZVX6umofXeMmFhtKP9M5//vQtwENATusn6n0vSNG0WBVd6LKD8fS+yVNKeI/BLZG5
         0E8IgRoDw2GOVZl5yTllgvxD8phSnnwWm/4lKLJPCTr4guNScSHOAkH0zDSOg2RoXE23
         HcUHrTZ/udRYkFryUGZF1GVf+vCTe5wbjN6RSgfl5UeJYNS2kktPu9k2oK0+2B7+tFIS
         1iIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=/LPldSJW2NTs92rrLwMAmtpbzUHFdier1QMiIrm2BXA=;
        b=JwUv06BqkQI0cuCMBa6m9SWGlC6BmjQruvDAxXrzy8rD0wjrSd02SyVYWyoyCbczO5
         c+LP7eI8/bXuuXn7FDcfhQtAxN/llE0nptSthFK4QL6Bfi1pvzs4bbAa/Cf62p0r4jHO
         rT9My6XTK62zsSFj6mFeCYh1+XxY/ZB1vahwMfsxM2v3+j9IGZ5QuxRhv/A88LXFIISo
         R51j7TlBOnJws/zSVO9DJEzx2UkvJoyxWDfDLXmitJQfzSTHYZWFtT+Jv88hMw7ebQI+
         QtSA2tn1a927QKCd/o2DgKfprMqPoLSQlB8qJDmLLRfWebbEL28ch57DxyD78LvUS8IG
         NR2A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LxFSZBSf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t12si412238ybt.71.2017.11.07.10.03.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 07 Nov 2017 10:03:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LxFSZBSf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55204 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eC8Da-000064-2E
	for alex.bennee@linaro.org; Tue, 07 Nov 2017 13:03:22 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43491)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eC8C7-0007ZF-7l
	for qemu-arm@nongnu.org; Tue, 07 Nov 2017 13:01:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eC8C1-0000fe-JJ
	for qemu-arm@nongnu.org; Tue, 07 Nov 2017 13:01:51 -0500
Received: from mail-wr0-x233.google.com ([2a00:1450:400c:c0c::233]:48051)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eC8C1-0000dS-Di
	for qemu-arm@nongnu.org; Tue, 07 Nov 2017 13:01:45 -0500
Received: by mail-wr0-x233.google.com with SMTP id k61so62470wrc.4
	for <qemu-arm@nongnu.org>; Tue, 07 Nov 2017 10:01:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=/LPldSJW2NTs92rrLwMAmtpbzUHFdier1QMiIrm2BXA=;
	b=LxFSZBSftnV9NagnZ6VmB3fUomndNpjMqHs2j6NOGULXIN1k7lw1aRC2A4TAt9EQj9
	NTrrHjghC0Yw/B4vAjlw4il+UUs8thrktZW7Lg8NoyJS2BaqdmdjStraXLESACkAMuBn
	pGzZSGItycYvsO8s89wWJZFbBM3pQ9CWlFFK4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=/LPldSJW2NTs92rrLwMAmtpbzUHFdier1QMiIrm2BXA=;
	b=GCz/Q7UWf3T1zXobjc1P3CFbqf3BfckE/cj2FrdbTur0igPsApLvaB8DafKkJh6zHG
	7IcIP/iXpHOiuuz/I6AbHMdAEv5RrTk1ICNiLMihgOTpE2YQenCbAymqN8a3to4ih4Sq
	pgjTz4WiddqEeJ5Zmg1Cwu37cfDouqCDj4DawenpOmg7AwdY7VCHrkD6zUoZ5JNevk66
	TQNCHkVwCXgAGOQInc0EXQqh/fNjSAPOy9+9Gs8X7N+ksHtK4esBA+piEj7c50HVJ8pn
	wVwGBKYihQo0W3xSh1ZAbbcJCMC3lTYiCjzLbwDXA455STxiz1n+F3xXtCFpiKyaDK0h
	r8zw==
X-Gm-Message-State: AJaThX68uZKLsdk93Pax/+rgbademKE/p9xAkV9HEwCHRuiP+P2s8wqc
	ORvuRvt/dDhGKIuVAFaJxFeqZqnE34NCBr4QYbqFZA==
X-Received: by 10.223.151.212 with SMTP id t20mr2229038wrb.2.1510077704258;
	Tue, 07 Nov 2017 10:01:44 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.161.5 with HTTP; Tue, 7 Nov 2017 10:01:23 -0800 (PST)
In-Reply-To: <alpine.DEB.2.10.1711070957150.30448@sstabellini-ThinkPad-X260>
References: <alpine.DEB.2.10.1711061412330.30448@sstabellini-ThinkPad-X260>
	<CAFEAcA9txp80bxgV5dYCPx7xoxqgutpbLyZ7PDkkL_OfVjSxYA@mail.gmail.com>
	<alpine.DEB.2.10.1711070957150.30448@sstabellini-ThinkPad-X260>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Nov 2017 18:01:23 +0000
Message-ID: <CAFEAcA8=Yrn53odaaSp+fvZ96sdLX4B5ZGZqf8FgYNjpCwYE+w@mail.gmail.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::233
Subject: Re: [Qemu-arm] [PATCH v2] aarch64: advertise the GIC system
 register interface
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
Cc: julien.grall@arm.com, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	"xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: t+dYW8vKoF2P

On 7 November 2017 at 17:57, Stefano Stabellini <sstabellini@kernel.org> wrote:
> On Tue, 7 Nov 2017, Peter Maydell wrote:
>> I thought about this on the cycle into work this morning, and I
>> think that rather than require every board that uses gicv3
>> to set a property on the CPU, we should change the definition
>> of the id_aa64pfr0 register so that rather than being ARM_CP_CONST
>> it has a readfn, and then at runtime we can get that readfn to
>> add in the right bit if env->gicv3state is non-null.
>>
>> I'll put together a patch this afternoon.
>
> Great, please CC me when you do, I'll help you test the patch.

http://patchwork.ozlabs.org/patch/835300/ -- should already be
in your inbox somewhere...

thanks
-- PMM
