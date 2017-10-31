Received: by 10.223.161.27 with SMTP id o27csp3610190wro;
        Tue, 31 Oct 2017 04:47:41 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+T/7w5d/dYvEe2NAffUKjGQD9c8T+QoBi3hP7MM4uqVabx4aoWzE8oeUnIZcGEgkvQoAYPP
X-Received: by 10.129.108.5 with SMTP id h5mr933575ywc.365.1509450461829;
        Tue, 31 Oct 2017 04:47:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1509450461; cv=none;
        d=google.com; s=arc-20160816;
        b=FA+f7k1rFZH/830jbg12o8b35nht1WIfeXJKzjBWC+DxLh20qBzHzaXLu6Qm7CIJy1
         8Q5MGOY8SnxZiLv+tnMYylMxKmlCp4zgBIc5Wk78GtIbh7sOfS/K7YqE/C6Xcq4DRBXH
         AGe6Ep3bSbiHm6bmOEMCaS4SqKiTyXdBwp1aqMqgwueObhCv9OSX+7+d1bCVESkXnRuN
         ksBCQsecUvA5yMiBh0Dje2FcHKJpBMGyjwYEOXibwQfZMlsZYszh9rQa5EbzkjA7/M4u
         kHaXedpxOjD3CqqYhGcp1JXb342XbxERtvyqnFVB+wXHiWLQQocqao21gsnvnBadcoAY
         F32g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=a0B0aX7EUtusfktLMPqsOXQtpeCkCgNgXgrP0bl6wGk=;
        b=B3QCnilbKLSm8rOggrSjSTZi7hodJP42i27kgLMgXhBs8f9k6Vh7zCb5tlv1VTWRvV
         hzsP8SuzbGS1ovHa85H6EZMVwbV2OxzmFcTX+cb9qE+hsAyyxc/2WyUIHz+u2CxDzuLi
         LCakptG5cVEs/dW7WQIShtHSIxkv/ZJvStglYLcgztFHl87pNt8daXlBSwutHLGfc1tO
         FPnpBM7Xs6qDCOX94zM6iaePVvAoWlsBpPNGdy4rSluwgoukEp+BTfLycRLFdZ3nT0Cv
         +DfXP+k8VoweJxewgTEONTJUYB58uZaxPl+a/xMlXpn2AjU7nAcS4SmtEwOURkQDHkGQ
         DYcA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=haLAzfIS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z16si406886ybi.825.2017.10.31.04.47.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 31 Oct 2017 04:47:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=haLAzfIS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44978 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e9V1B-00058g-73
	for alex.bennee@linaro.org; Tue, 31 Oct 2017 07:47:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33861)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e9V0y-00057J-2M
	for qemu-arm@nongnu.org; Tue, 31 Oct 2017 07:47:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e9V0x-0004Lp-7w
	for qemu-arm@nongnu.org; Tue, 31 Oct 2017 07:47:28 -0400
Received: from mail-wr0-x243.google.com ([2a00:1450:400c:c0c::243]:48086)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1e9V0x-0004Ko-1b
	for qemu-arm@nongnu.org; Tue, 31 Oct 2017 07:47:27 -0400
Received: by mail-wr0-x243.google.com with SMTP id y39so15663113wrd.4
	for <qemu-arm@nongnu.org>; Tue, 31 Oct 2017 04:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=a0B0aX7EUtusfktLMPqsOXQtpeCkCgNgXgrP0bl6wGk=;
	b=haLAzfISrYuniadXOIqWCsgByegO3T59ZL2a3Rx7dxZMCqExZUbSyMBGYbsloAxhQs
	YYMEp7b2o9Z9HZiEx6rjtadtUpgvnQJS+oLwLL7fknCbCu8wXUTLwck/330xtGEZUPoK
	Y735PMl09/q/QgXHJwNUEaXnOWQzSSbJsW2CY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=a0B0aX7EUtusfktLMPqsOXQtpeCkCgNgXgrP0bl6wGk=;
	b=eQtQ7sqO2YxLZWV0qKSCSrG2u2l1TKJ2KxsV77jU4JHhIQJXrojEdRvmLHwmQzZc2D
	dDcuh+IrcfBVLl/Bj0z2roIQza11RY+bgNk41JJUG0i75i3E+UyU6ElghNHM0Nwi2pbU
	KL8n0eNQu5o4QI6ICciCbmL7fvhpHxg7xyOLgHcZRJufUuiKTbLzhkB5zuQ8evW2QZa/
	zlxpCjMVU8kn2XmDw5ORsrOYeyPgd3CEy2f5cW2dsX3m6X4plZkD3PkRR9BF9LPUaeDV
	/yJ4hHsqSZtOkzt1qsRrcJwx8eRnB7Im0i5k/zUjGG5xHXesyrxs0FRMCsOgHyT3YuET
	XEXg==
X-Gm-Message-State: AMCzsaUAquuOuO6b/zHvscoG+OnIwsrvRNbt3F9s1qX1KnTk+bcuzDYB
	86ayX5pq0cwmVqoydPFYXstwe7pxXzIw4BXlhOhTpQ==
X-Received: by 10.223.157.11 with SMTP id k11mr1625063wre.281.1509450445748;
	Tue, 31 Oct 2017 04:47:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.161.5 with HTTP; Tue, 31 Oct 2017 04:47:04 -0700 (PDT)
In-Reply-To: <CAFEAcA9zXAmNPL8TsLKSPbm8Er_KLK8Ubwth6=nL6WD87OmBQw@mail.gmail.com>
References: <alpine.DEB.2.10.1710171708130.27209@sstabellini-ThinkPad-X260>
	<CAFEAcA9zXAmNPL8TsLKSPbm8Er_KLK8Ubwth6=nL6WD87OmBQw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 31 Oct 2017 11:47:04 +0000
Message-ID: <CAFEAcA8jwN81ZBCLA8HW=q5GAWKmZ=kAZAP9vGNN8RYkzYe=Pw@mail.gmail.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::243
Subject: Re: [Qemu-arm] [PATCH] aarch64: advertise the GIC system register
 interface
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
X-TUID: U6nylmUC9HK4

On 19 October 2017 at 15:46, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 18 October 2017 at 01:10, Stefano Stabellini <sstabellini@kernel.org> wrote:
>> Advertise the presence of the GIC system register interface (1<<24)
>> according to H9.248 of the ARM ARM.
>>
>> This patch allows Xen to boot on QEMU aarch64.
>>
>> Signed-off-by: Stefano Stabellini <sstabellini@kernel.org>
>>
>> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
>> index 670c07a..a451763 100644
>> --- a/target/arm/cpu64.c
>> +++ b/target/arm/cpu64.c
>> @@ -136,7 +136,7 @@ static void aarch64_a57_initfn(Object *obj)
>>      cpu->id_isar3 = 0x01112131;
>>      cpu->id_isar4 = 0x00011142;
>>      cpu->id_isar5 = 0x00011121;
>> -    cpu->id_aa64pfr0 = 0x00002222;
>> +    cpu->id_aa64pfr0 = 0x01002222;
>>      cpu->id_aa64dfr0 = 0x10305106;
>>      cpu->pmceid0 = 0x00000000;
>>      cpu->pmceid1 = 0x00000000;
>> @@ -196,7 +196,7 @@ static void aarch64_a53_initfn(Object *obj)
>>      cpu->id_isar3 = 0x01112131;
>>      cpu->id_isar4 = 0x00011142;
>>      cpu->id_isar5 = 0x00011121;
>> -    cpu->id_aa64pfr0 = 0x00002222;
>> +    cpu->id_aa64pfr0 = 0x01002222;
>>      cpu->id_aa64dfr0 = 0x10305106;
>>      cpu->id_aa64isar0 = 0x00011120;
>>      cpu->id_aa64mmfr0 = 0x00001122; /* 40 bit physical addr */
>
> Whoops -- we missed this when we added the GICv3 support, because
> Linux doesn't check it.
>
> Applied to target-arm.next, thanks.

Unfortunately I've just noticed that this breaks booting Linux
in the "not using gicv3" case. This is because we don't actually
define the GICv3 cpu interface registers unless the board
instantiates a GICv3. We mustn't advertise the GICv3 sysregs
in the ID register unless we actually have them.

Not sure how best to fix this -- it's a consequence of the
design decision we made to have the sysregs implementation
be in the gicv3 code. There's no useful feature bit in the CPU
to hang this off either, it's an effect of whether the board
model happens to wire up a gicv3 or not. So we can only figure
this out fairly late on (probably at CPU reset time), which
is a bit tedious for getting ID reg values right.

In the meantime I've dropped this patch from target-arm.next.

thanks
-- PMM
