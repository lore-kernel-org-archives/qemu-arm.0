Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp3622564wre;
        Tue, 29 May 2018 07:17:27 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKKgo+KR4PB+/1uYJ0c6Qsf/5Gr4oAM+zS1hGCOtdrg40MFGvx3PYP36jGqeIsKKhPfzohXR
X-Received: by 2002:a0c:8ec6:: with SMTP id y6-v6mr16000461qvb.154.1527603447730;
        Tue, 29 May 2018 07:17:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527603447; cv=none;
        d=google.com; s=arc-20160816;
        b=EvYZ/5poXwvQUTYxzeJK1FQ91suvAaGBUxWzZdfwflnYY4TZZ5NmKZykYu6w8vDMQE
         MhaUvNyoJyvHFv23qQKcmw8PYxPNB9tAXImqYFt9coAHsYCNj7GLpBsQRPIZBAN+Wu9N
         VRnEkAzWlvIdPWZc2js9RJMOfgetwABxTMM6f6I6i4OB/RuJLTnYzhE5NqQFpjH9e4Bj
         gQeZzfLJSQWABSU/AfzJrLz1HRBLTUz0cS1YQ2pRUFLwBgqAb5KRugbCPw17yAY6eWAn
         APX//P+RYIgGy4x0PueSKQFqcEclQ3oEgU1raHtaTB/SGAnbDXfgxl4kJOZI/v+/72h7
         On+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=20xysm6kTraKDGjCcX97FF3TC4EPiVaJW/r6kdNmfms=;
        b=tevvKaOjY8DAtJZIzTdRknOAsXnd3B0BiGWCmXjzDZmoLqmeQpMbshi3YQrsnkp0Or
         zeYW1TSetvOdfXvEOsB5rz+xuXVkBIhv2AN46FksuK7aHoSzpyEQExaw4pXbajj2HBgE
         xTwstLfgnCF2LOqU3POK6BIQCOPK6sn7VFE2wu1sD9xGSripC6ZQmzFLRgwhpSMpuHKg
         QGqTq1Nx1BWkzcBbmRktLQ9DAeQfKf3WPZIqmC9DPNvqDhtzCWhLREP1BLY058hpSSXK
         FaaREMTs1+RpbxuyuP1MLpUuCjG8uX9KPNR/4ExSkzw0RCeDKW9tyVG5/UBPMYFwvR2F
         Wh4A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DAk3TQKo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m8-v6si5956002qvi.69.2018.05.29.07.17.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 May 2018 07:17:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DAk3TQKo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33233 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fNfRH-0006j1-7G
	for alex.bennee@linaro.org; Tue, 29 May 2018 10:17:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33856)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fNfQy-0006dV-Rv
	for qemu-arm@nongnu.org; Tue, 29 May 2018 10:17:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fNfQx-0005AC-OI
	for qemu-arm@nongnu.org; Tue, 29 May 2018 10:17:08 -0400
Received: from mail-oi0-x22d.google.com ([2607:f8b0:4003:c06::22d]:33185)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fNfQx-00059T-4b
	for qemu-arm@nongnu.org; Tue, 29 May 2018 10:17:07 -0400
Received: by mail-oi0-x22d.google.com with SMTP id k5-v6so13182688oiw.0
	for <qemu-arm@nongnu.org>; Tue, 29 May 2018 07:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=20xysm6kTraKDGjCcX97FF3TC4EPiVaJW/r6kdNmfms=;
	b=DAk3TQKonIEeZkAjDmNChDSYZcrQYzzRm4+ui19AVsKXXWeceHuoeSCvNV1Gr3q8zP
	ULh69u7AqKIuyy+hsvNsSMNYG/5HiNLZaAtAMOcZvp9fS9GFgY4O9dzkoHGXe6sDvoTG
	wQHk3kNEfwu0t8nGbBLN8NrXJn6UtOr6BU0P4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=20xysm6kTraKDGjCcX97FF3TC4EPiVaJW/r6kdNmfms=;
	b=OTaLGfEMpXcNviv4CpaeSXNUlrJCLtVNQdxuIJBPMK0VccOGjvVFopPtZMVMTNS/uO
	BT/5cD9WylDpT7og/OVjzkYT5BSEtJhADOS9PwinMXNg/3zXbCAMKuDhqtUCuZbWTnmp
	vNyugXB1/aZtGfwJ0eumq3ZT7bBYeUzBM2qTsGXNhjnsSWcbt1+tH1I78ctZWTPbIbAG
	DLhNhY/GeX5XbEnv/l/sddXeoGeB+qjTdH0lswppAllGIo4J+kYwoWwwhK6d63oN8LSw
	SixAtv0KZXDGBh3FHV+QOobA9QuPqOqj0HOsjGG3ckiD6C+zp/Cld8tA0CoVHMh7IJzd
	lWDA==
X-Gm-Message-State: ALKqPwdNe0T2iRDnO4GwQQ2fMr4k7eqqhhWDn/irbv8YsduYFkkiFDub
	95GTpIqY0C47dOdXyfFQu0mzGhaAxfhofXTihl8eSA==
X-Received: by 2002:aca:d447:: with SMTP id
	l68-v6mr10420251oig.102.1527603426459; 
	Tue, 29 May 2018 07:17:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40d3:0:0:0:0:0 with HTTP; Tue, 29 May 2018 07:16:46
	-0700 (PDT)
In-Reply-To: <9f0bcfee-31ee-1f2d-1949-6cf986f22ac6@redhat.com>
References: <1526222114-5324-1-git-send-email-eric.auger@redhat.com>
	<1526222114-5324-8-git-send-email-eric.auger@redhat.com>
	<CAFEAcA9772Q3OG-YfzLwGWcZ_L5evC7qP_PXqSi8bVr-p-PhJA@mail.gmail.com>
	<9f0bcfee-31ee-1f2d-1949-6cf986f22ac6@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 29 May 2018 15:16:46 +0100
Message-ID: <CAFEAcA9eimPuvBP8fo7sPDTMtV4p0thnPfPce3PyyLmoO0RGXQ@mail.gmail.com>
To: Auger Eric <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::22d
Subject: Re: [Qemu-arm] [RFC v2 7/7] hw/arm/virt: Register two redistributor
 regions when necessary
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
Cc: Andrew Jones <drjones@redhat.com>, Marc Zyngier <marc.zyngier@arm.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CbIs5nX2Gtr1

On 29 May 2018 at 14:43, Auger Eric <eric.auger@redhat.com> wrote:
> I just noticed virt_machine_class_init still clamps the max_cpus to 255.
> This is checked in vl.c
>
> Do we want the 3.0 machine expose more than 255 vcpus, 512 for instance?
> I understand this mc->max_cpus is something rather static, that is
> refined afterwards.

Mmm. It's mostly used by the option checking code in vl.c, which
runs before the board init function. So really what we're doing by
setting it to some high number is disabling those checks; we then
have to mess around with checking manually later. Unfortunately
I don't think we have enough info to set the real maximum early
enough to avoid this.

We should probably set max_cpus here to whatever is the maximum the
board can handle in any configuration.

> Note the comment in virt_machine_class_init suggest 255 is the max QEMU
> supports but I can see that pc_q35.c sets the max_cpus to 288 already.

I think that's out of date, yes -- probably when the code was written
255 was the maximum.

thanks
-- PMM
