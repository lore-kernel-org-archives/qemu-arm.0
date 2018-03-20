Received: by 10.28.91.67 with SMTP id p64csp3729618wmb;
        Tue, 20 Mar 2018 04:55:22 -0700 (PDT)
X-Google-Smtp-Source: AG47ELuBhuGkJ7LIgjAmSWvhVBstjFWO69lktQPDD0kUQ1hgLVHR97NHu03H0r0GuNrT5VB5mH5q
X-Received: by 10.55.119.1 with SMTP id s1mr23186306qkc.3.1521546922806;
        Tue, 20 Mar 2018 04:55:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521546922; cv=none;
        d=google.com; s=arc-20160816;
        b=I3sgcIq6qUUuqbq8l00IPVQQOZChe/iYdAUQR8JF1/a++yN9vur3tzj59TwJs6hKWy
         /0N5JxNVDuSDfyrIhH3tntViU8EWdFL3mbLKSmin1pkzz7SAYrmJAXkJGqtPm8r4kwPy
         4XYXiKa+p3rY6YNCpSwE9BuBKUODz6mN9ek806yO1Pyi5wSWHvKRHaz09PfD7AfZtYe9
         sfw+htAF0wkDoQCk1skEto2/J6OeTNp3/3+2B1h/QoDtGSD9jeZeoqtT5wQCxPryFJ4t
         fjf7EiG7YyuIlNITOCd9+pzp2SasVsXTKUJmDziJLt79SAob77OkwiPip62nZgqkTRdw
         7bEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=+DlCn0ffo7k7ST7k3+jbPtw37CqPueOgQY+oxzRZwQQ=;
        b=wTdBVQY9loGA8Q8J+T8j7vqyEAZ97rdBP25ASbEPyCnV8PljKmAF9AusbZQq31O1zh
         0sSUZMf0nEQmXqMz+oIzRM43DCeq86BuPlRkCVypVxeQw5kA+Ow4IynjTMuJV2Yp17An
         TRpY9ltuok1j30MzXBLFiUmY/sstusQu1vGIkE2BuX6IIhLYpNRjXPHudn+15jY74OYJ
         Gfm3ivw+0nA5zk0Mm26VLjwXc+brUR/YTvfmAXc/EqoSZqleQ6bImcJA/Nlju/ZXslxA
         nxUcdGUavanmCjKowZ61rL5NS7ahA/cd5virkV6QlUduN/TceG2nTZd6tAqrq8g9gIQ1
         kHJg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NDGbbYp8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q43si1882266qte.289.2018.03.20.04.55.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 20 Mar 2018 04:55:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NDGbbYp8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47616 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eyFrO-0002ti-Bq
	for alex.bennee@linaro.org; Tue, 20 Mar 2018 07:55:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59271)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eyFrC-0002oL-7W
	for qemu-arm@nongnu.org; Tue, 20 Mar 2018 07:55:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eyFr7-0003vR-S4
	for qemu-arm@nongnu.org; Tue, 20 Mar 2018 07:55:10 -0400
Received: from mail-ot0-x241.google.com ([2607:f8b0:4003:c0f::241]:43883)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eyFr7-0003v2-N0
	for qemu-arm@nongnu.org; Tue, 20 Mar 2018 07:55:05 -0400
Received: by mail-ot0-x241.google.com with SMTP id m22-v6so1352748otf.10
	for <qemu-arm@nongnu.org>; Tue, 20 Mar 2018 04:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=+DlCn0ffo7k7ST7k3+jbPtw37CqPueOgQY+oxzRZwQQ=;
	b=NDGbbYp8o1KVCD9XiPLfNR9LO1LSxECOWa3gEyt+8pISgdBh5ntaHGwIChuHJ32/Kh
	xjs8OKY1BnHUyCVDHm/JE7PpfaGpCfh9and52ZDR0go3pSNWf7zfIUirnpbZhNX0zM3f
	63k2mJW+0WH/QAQRQKmoazFygL//1ddJVBOy8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=+DlCn0ffo7k7ST7k3+jbPtw37CqPueOgQY+oxzRZwQQ=;
	b=k7gYmdd4P9/isT7/SPt8YiIOsFBSbh5q4W1nqootGYEXbqPfy9wjS3y996UwtoH0II
	KUnpNE/JNFvg62BaQTfgu86Wk1IrdxIUdhBNSk9hAoxwtLLWnUcZ9PeNP04NLX7losYV
	NcuWu0lMQV7cbZ2ReUhgRgXVM2wBF7Y0bLJIikk6/1eBxFOoALFNIChKoGzPFz6268q/
	QIh6LPgOYFWg39UVzR1PcgZBuOJLM6pEab2BeHRsNsBCRsjg0M2qyVMaBe5r6BQTS3Dr
	3n+jVLiej0YzpM/rhaNMINTPyXsc3wvTezBPkcsgNjN+gNe9r53a+KHCnhbd8uYks7+2
	5wWg==
X-Gm-Message-State: AElRT7Fijo/CIt4O2GfG5vt6w2fLzfOFvHEzJLRv/bDTIj9qv93hbMU+
	bA9uNxDwzhwH8Xk/VwE/d0T9Ns/6Ro5YK71hCe/z1A==
X-Received: by 2002:a9d:56f0:: with SMTP id
	b45-v6mr2234978otj.294.1521546904937; 
	Tue, 20 Mar 2018 04:55:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:2286:0:0:0:0:0 with HTTP; Tue, 20 Mar 2018 04:54:44
	-0700 (PDT)
In-Reply-To: <5AB0F254.3050503@huawei.com>
References: <1521530809-11780-1-git-send-email-zhaoshenglong@huawei.com>
	<1521530809-11780-3-git-send-email-zhaoshenglong@huawei.com>
	<CAFEAcA96qV_f7i_36Yzb-QV7W9SRHKfJpg=rvv3tia2X-Xi7QQ@mail.gmail.com>
	<5AB0F254.3050503@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Mar 2018 11:54:44 +0000
Message-ID: <CAFEAcA-Ct3qa0OFZ4U+9RH68SQJgmkxJKKS5e+if_MuL2pSu3A@mail.gmail.com>
To: Shannon Zhao <zhaoshenglong@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::241
Subject: Re: [Qemu-arm] [PATCH v2 2/2] arm_gicv3_kvm: kvm_dist_get/put: skip
 the registers banked by GICR
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
X-TUID: ZXxjCprYKdow

On 20 March 2018 at 11:36, Shannon Zhao <zhaoshenglong@huawei.com> wrote:
>
>
> On 2018/3/20 19:22, Peter Maydell wrote:
>> On 20 March 2018 at 07:26, Shannon Zhao <zhaoshenglong@huawei.com> wrote:
>>> While we skip the GIC_INTERNAL irqs, we don't change the register offset
>>> accordingly. This will overlap the GICR registers value and leave the
>>> last GIC_INTERNAL irq's registers out of update.
>>>
>>> Fix this by skipping the registers banked by GICR.
>>>
>>
>> I'm still not entirely sure what the underlying problem
>> you're trying to fix is...
>>
>> Do we fail to correctly migrate a VM without this change?
>> Does the code work on some host CPU/GIC implementations but
>> not others? Is this just improving efficiency by avoiding
>> doing some unnecessary work?
>>
> When we reboot a VM and before entering uefi or guest kernel, we expect
> all these registers staying at the initial state. But currently these
> registers of the last 32 irqs are not reset. For example, the PRIORITY
> of irq from 32 to 255 is 0 but the PRIORITY of irq from 256 to 287 is
> 0xa0(Linux kernel set the PRIORITY to 0xa0 by default).
>
> When migrating a VM, since we don't save and restore the registers of
> the last 32 irq, so the PRIORITY is 0 while we expecting 0xa0.
> And also it will overlap the PRIORITY of SGIs and PPIs.
>
> We don't fail to migrate a vm since currently we don't use the last 32
> irqs in virt machine. But the bug is still there.

Oh, I see, the number of registers we transfer is accounting
for the first N registers in the bank not being used, but the
first register offset to transfer wasn't.

Can you still successfully migrate a VM from a QEMU version
without this bugfix to one with the bugfix ?

thanks
-- PMM
