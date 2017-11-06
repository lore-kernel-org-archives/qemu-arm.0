Received: by 10.223.150.237 with SMTP id u100csp2504066wrb;
        Mon, 6 Nov 2017 02:38:57 -0800 (PST)
X-Google-Smtp-Source: ABhQp+T5M8xQruqKkfoOdJ3L3k+r42sevOlpmGPN/oKA9rQ3PpE1AwlW+xZGGc/Hz6padmq6YW+r
X-Received: by 10.129.141.5 with SMTP id d5mr9043111ywg.184.1509964737251;
        Mon, 06 Nov 2017 02:38:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1509964737; cv=none;
        d=google.com; s=arc-20160816;
        b=G7h8wUSIhxFAGbi0MIqmhkH/BJpFUK8gep832DZTgQ9wQD4f6gl6AfpHVI/w2XBED5
         F5t/Onz1Qqz4UxZmAqCZ8RZX37aycb89hYAfbG+0RJQdYbDRp7R3iY873QYoHNkqmnzL
         tPN/Ny1HFGN7arbIpxrlA2/mdWkQzB/x+r/ioiLsrc8FFl7Wly3qVpvkJYhhPFlAdOwF
         Dtz1C3mj4N3DGQLRCaOp3khB7iqzyVWIgD1yUdLTWwp3DoA1K5Sa3vnq7n/XzWkFHlWI
         6CT+PiSsyzP9EsGNS0dUJ+Pu0xugoCVu4F2hm4GRqbClowpNt+byyf29yv3Na4Xd8diZ
         pjdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=tad3G3IQritrzUUuEdFMpulxx3avARk3zFWJIIS/M/A=;
        b=xOrqbnrPb+4HSY8CRprG6tEXSG2KAbadgJEiqbJ4QLpsnyZad5SK7i8JtbVm6THOAw
         8Sen8oURL/z+gyZViaOqAdwGORtXlcGsXVTzYrWLViNRYQs7qdPWVU12tO6KBkBqMKyR
         Bn+CIYbX+iEzqzakVN6jdjn4Qs2eLhTqPgDsIN47U+qDYZrq7F6GgfFFCa1kN3psls2H
         tYNNA0G+4H9vO2dIuXziJdJCjbM8QCSIlIMJ5j/MjH39gc6yOSS52ckz+M+AtsY72+NS
         4a5xnOXLX50FcY2FXUtA5r4y2GmD6Snn4SjPN70muzSl3i0wkheoCz/A+ir6qWrQe329
         bP0Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=F2FPK5EE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x141si2761009ywg.536.2017.11.06.02.38.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 06 Nov 2017 02:38:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=F2FPK5EE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47395 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eBenw-0000wH-Li
	for alex.bennee@linaro.org; Mon, 06 Nov 2017 05:38:56 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43747)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eBenn-0000w4-Qd
	for qemu-arm@nongnu.org; Mon, 06 Nov 2017 05:38:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eBenn-0005QG-2C
	for qemu-arm@nongnu.org; Mon, 06 Nov 2017 05:38:47 -0500
Received: from mail-wm0-x241.google.com ([2a00:1450:400c:c09::241]:51683)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eBenm-0005PM-RU
	for qemu-arm@nongnu.org; Mon, 06 Nov 2017 05:38:46 -0500
Received: by mail-wm0-x241.google.com with SMTP id b9so13187207wmh.0
	for <qemu-arm@nongnu.org>; Mon, 06 Nov 2017 02:38:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=tad3G3IQritrzUUuEdFMpulxx3avARk3zFWJIIS/M/A=;
	b=F2FPK5EEKQWMoX0Mb3Gnp0qTe20liwEDuKzOqzWQ90LbKyG1eFPAgfJNStG9smRN1D
	uCynRFWW57GTK3P0ZUM0zP4QDS4tmJFirKqS2yYH2BYZhbrAkgnx7VNeYVew7Ya8Mg8M
	KvLCJJEMOdKIIAltUeTtRREH9bpopfseuyyyA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=tad3G3IQritrzUUuEdFMpulxx3avARk3zFWJIIS/M/A=;
	b=lTXVobpZfjFu38aci0QUgggpqJuVV4qLybWFVMD9LSZ3b/3vhQXIjr25PsXDPFWNLQ
	3aAPmFv6/4rbP5OM5ode6RNcSlQdQTRP8p/nNtgxA4xtcu3kw1Spri6foieTmw+guwc5
	kME5d+iymq5NnV9r4FjWjphfWqwPM8GqyOYBfDW+JdYGN/hmJqHnsdH2vl/r+hHz920I
	RlgxDKvIyUYbkTZdoKLqyKQn8DoKi2qUZF7YINcI2weSNWkaJxgzFfN9Xkn7SEAoEvf0
	dKq/wRnOqqQC0KQ1a+ZoIG5cpqT+Sp7zEK2eQ1GbuU3jujt9n8eahsitexKQKRR5qqJr
	M8CQ==
X-Gm-Message-State: AJaThX4imScygEG8lY5J5hjNJM4clFgvdxYCXUOeaNMVTIBTDHxSByKh
	Ep12lVioy8HTE1GP94Nk0dgV2SPmRsVmW2qHM1IeEw==
X-Received: by 10.28.14.195 with SMTP id 186mr4769540wmo.56.1509964725357;
	Mon, 06 Nov 2017 02:38:45 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.161.5 with HTTP; Mon, 6 Nov 2017 02:38:24 -0800 (PST)
In-Reply-To: <a381c1f7-b695-8126-982f-610f60a1b992@redhat.com>
References: <1509712671-16299-1-git-send-email-shankerd@codeaurora.org>
	<a381c1f7-b695-8126-982f-610f60a1b992@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 Nov 2017 10:38:24 +0000
Message-ID: <CAFEAcA_Jc6YiNyZuAcBtMSfWaw5-o6oSem908xEh5ZhFb8Zr_A@mail.gmail.com>
To: Auger Eric <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::241
Subject: Re: [Qemu-arm] [PATCH] hw/intc/arm_gicv3_its: Fix the VM
 termination in vm_change_state_handler()
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
Cc: qemu-arm <qemu-arm@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>,
	Shanker Donthineni <shankerd@codeaurora.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UewFpBdgfVKv

On 6 November 2017 at 07:30, Auger Eric <eric.auger@redhat.com> wrote:
> Hi Shanker,
>
> On 03/11/2017 13:37, Shanker Donthineni wrote:
>> The commit cddafd8f353d ("hw/intc/arm_gicv3_its: Implement state save
>> /restore") breaks the backward compatibility with the older kernels
>> where vITS save/restore support is not available. The vmstate function
>> vm_change_state_handler() should not be registered if the running kernel
>> doesn't support ITS save/restore feature. Otherwise VM instance will be
>> killed whenever vmstate callback function is invoked.
>>
>> Observed a virtual machine shutdown with QEMU-2.10+linux-4.11 when testing
>> the reboot command "virsh reboot <domain> --mode acpi" instead of reboot.
>>
>> KVM Error: 'KVM_SET_DEVICE_ATTR failed: Group 4 attr 0x00000000000001'
>>
>> Signed-off-by: Shanker Donthineni <shankerd@codeaurora.org>
> Reviewed-by: Eric Auger <eric.auger@redhat.com>



Applied to target-arm.next, thanks.

-- PMM
