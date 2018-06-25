Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp3363106wrq;
        Sun, 24 Jun 2018 21:06:17 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfGLKADw8n3tc5gZp6HethGIZ0/aJ42jlR4VVd6SwIuCEMqcmgWaRSUc8/bTTFTqxjSA5vX
X-Received: by 2002:ac8:1b9a:: with SMTP id z26-v6mr9443336qtj.344.1529899577638;
        Sun, 24 Jun 2018 21:06:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529899577; cv=none;
        d=google.com; s=arc-20160816;
        b=i5bpFb85Tb1p2yWwlXCpaVNUeHCXAT4QYuEjn3O+TuXgn68DIhr+uY18j+u3XWSBgV
         u0cpjp+Z//a/vFMHDDamlrJoggc98wlxbKgr38KJi68cvgILuGQfUqLa0QGgOHtfdzj2
         5vD15Mc85g/C6IwUvaZwOYpzhy2ChMAlJcaVy8lxeIYACalVdYf3Xj+bYn/szPNsS2C8
         XX5bwRRALIJJKEb/h7Ekx5pMeiwKhazCe50M5wNe3EkGxRXsweVxNNORv2EqCXLp+5xm
         eaYh/5Lm7rr6N8+qGfMUmY5FrpWz1+WuYxgQzkEaJHLvSq7iA4ucJamfoqrfbImEoQdP
         VSzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=9sQP+ta6o1ZSMdyNB84w5ZX/8rX2N9WD5DZCr+KqOQM=;
        b=vJee9grF9b6e6mabYYxkInO04Ue70+BJdT+/oAeMKQWm8OFinczKNiFpgndEBHkJc7
         jXugf5qoLSAgnSMFMLJqtCqksA92uJ7kCNiQfYzCRjE5FiaUMnMEg9n9CWGC4h2qu+ti
         X06CQG6e+Cs3IkWxodtHO8dIHiVbf3lyg2/a6hJuKiuDAl1svmeBTvVC/UKKNhap+0JU
         BGg/cfWlzlMO3t81uEhai3eRoQw+MPwg1iPvfOW+ngx5P98/Iw/LWy10tRWsKJ8eXB/2
         CZYIyV/DQdmKAO9ltI79lMRIa7lUmOQwrGVQVIYDVkI3Nz9d0guayQ6bWV35Pf4X+6LL
         db5w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dphRC5pA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a20-v6si2161009qtn.216.2018.06.24.21.06.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 24 Jun 2018 21:06:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dphRC5pA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44131 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fXIlc-0005dd-W0
	for alex.bennee@linaro.org; Mon, 25 Jun 2018 00:06:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39354)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <hongbo.zhang@linaro.org>) id 1fXIlX-0005dC-9H
	for qemu-arm@nongnu.org; Mon, 25 Jun 2018 00:06:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <hongbo.zhang@linaro.org>) id 1fXIlW-0007a6-Ea
	for qemu-arm@nongnu.org; Mon, 25 Jun 2018 00:06:11 -0400
Received: from mail-io0-x243.google.com ([2607:f8b0:4001:c06::243]:35196)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <hongbo.zhang@linaro.org>)
	id 1fXIlW-0007Zu-8F
	for qemu-arm@nongnu.org; Mon, 25 Jun 2018 00:06:10 -0400
Received: by mail-io0-x243.google.com with SMTP id q4-v6so11196892iob.2
	for <qemu-arm@nongnu.org>; Sun, 24 Jun 2018 21:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=9sQP+ta6o1ZSMdyNB84w5ZX/8rX2N9WD5DZCr+KqOQM=;
	b=dphRC5pAGKSZEKFvnQSuZDuf65zH1GC+gwBz1DZ+ibcsHEGy4BtiU5JdKoe87Su9+o
	wjKaNX8hJCQjiXrbPZASL/6LHGp4rtfEFZ+n0QLVM1QFFQt1GevVAXSiFfqxPzeeqr8T
	lORDWLTFfwztRu0WTglQnTU74O/8LmBzgjrNs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=9sQP+ta6o1ZSMdyNB84w5ZX/8rX2N9WD5DZCr+KqOQM=;
	b=mx7uypgajl/LwwpUz19vbroGgcS4qVDSJVENE/tu5caDk22eCJgCipgIQGvDyH6xMv
	qP35CB9KzWOv/ITFvyiU17QT+cKeKIMo/QtA824iWpVREktLQ7pmQYk69cXQ72C/rCv9
	PvKcxi67XaG6hubn5pzSmm3W3Qu2J1IPZNRCDg/bAffYD3ISINcNz1BDBPlqxMotkooi
	VxWeeWt94zLGAvoSRcUa80Fd31eu7ITNf/pkgK9N+FYDqCO6jDW5dWnAiZZ7RDqKKnvO
	ObyT/K4D0g2WCo1e0v0WwrirtdvMl4pG8SCa8vrumzIrcwyzh3QHoGyMhIRvwk7hBcM7
	j38w==
X-Gm-Message-State: APt69E3YVfXtXP0dM8psRRxBI+YsWDZt6C3yuaLyyC7kE2wEeHBMN4Aj
	NJ8nr2jBWz171YdJLWVBgfYCJlw3MW3TtAz3oK6hcg==
X-Received: by 2002:a6b:ba82:: with SMTP id
	k124-v6mr8323365iof.94.1529899569377; 
	Sun, 24 Jun 2018 21:06:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac0:a65a:0:0:0:0:0 with HTTP; Sun, 24 Jun 2018 21:06:08
	-0700 (PDT)
In-Reply-To: <CAFEAcA8Bx7b_0zUxbdxFgtANFycVkUiSiemAwHpr0wpyxuLKmw@mail.gmail.com>
References: <1529663827-28854-1-git-send-email-hongbo.zhang@linaro.org>
	<CAFEAcA8Bx7b_0zUxbdxFgtANFycVkUiSiemAwHpr0wpyxuLKmw@mail.gmail.com>
From: Hongbo Zhang <hongbo.zhang@linaro.org>
Date: Mon, 25 Jun 2018 12:06:08 +0800
Message-ID: <CAHmQWvCczwh0Yto=9s2j7d00ULokZ0=VrxykAyXBvvHzQaUEMA@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4001:c06::243
Subject: Re: [Qemu-arm] [PATCH] hw/arm/virt: fix psci conduit in acpi when
 el3 enabled
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1urFKruQ9awe

Hi Peter,
Yes, your considerations reasonable.
But in practice of hardware platforms, programmer checks that Arm TF
is using SMC for PSCI call conduit, then fix it manually in the ACPI
table, reason may be that Arm TF is lack of ACPI support, if device
tree used, there should be no such thing because Arm TF can support
it.
On QEMU, I just mimic the situation, if a complete reasonable
solution, further efforts are needed to figure it out.

On 22 June 2018 at 18:45, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 22 June 2018 at 11:37, Hongbo Zhang <hongbo.zhang@linaro.org> wrote:
>> When QEMU_PSCI_CONDUIT_DISABLED is set, it doesn't mean all the PSCI
>> conduits are totally disabled, it only mean the QEMU built-in PSCI
>> support is disabled, in such a case, e.g. EL3 is enabled and external
>> firmware (it is usually Arm Trusted Firmware) is loaded, SMC should be
>> used for the guest to trigger PSCI functions.
>>
>> Signed-off-by: Hongbo Zhang <hongbo.zhang@linaro.org>
>> ---
>>  hw/arm/virt-acpi-build.c | 6 +++++-
>>  1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
>> index 74f5744..e5b4947 100644
>> --- a/hw/arm/virt-acpi-build.c
>> +++ b/hw/arm/virt-acpi-build.c
>> @@ -715,7 +715,11 @@ static void build_fadt_rev5(GArray *table_data, BIOSLinker *linker,
>>
>>      switch (vms->psci_conduit) {
>>      case QEMU_PSCI_CONDUIT_DISABLED:
>> -        fadt.arm_boot_arch = 0;
>> +        /* This case means QEMU's internal EL3 implementation is disabled,
>> +         * but when firmware is loaded, the guest can still use SMC as PSCI
>> +         * conduit to call external firmware PSCI services
>> +         */
>> +        fadt.arm_boot_arch = ACPI_FADT_ARM_PSCI_COMPLIANT;
>>          break;
>>      case QEMU_PSCI_CONDUIT_HVC:
>>          fadt.arm_boot_arch = ACPI_FADT_ARM_PSCI_COMPLIANT |
>
> I think this means we end up reporting different things for ACPI
> and DT in this case, doesn't it?
>
> I think that if QEMU isn't providing the PSCI implementation it
> shouldn't advertise it in the ACPI tables. It would seem more
> logical that the firmware itself does that (QEMU can't know if
> it really does provide PSCI, after all...)
>
> thanks
> -- PMM
