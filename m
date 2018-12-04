Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp8027309wrt;
        Tue, 4 Dec 2018 04:50:09 -0800 (PST)
X-Google-Smtp-Source: AFSGD/X+50+eKmHhnu7fLhPcAxw6Lo9gckXkLiiE5jqJO5+I0vMze2Bd7tLoRQ8KiIJqLmO+sYkk
X-Received: by 2002:a37:9584:: with SMTP id x126mr18391671qkd.36.1543927809081;
        Tue, 04 Dec 2018 04:50:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543927809; cv=none;
        d=google.com; s=arc-20160816;
        b=ltMbTii++wkb6myYeVab9HdN8OfzL2r2+ZXVVyMchrywNr2AHigD32/xvMOeu1z16n
         cKJAtLp88Sp7h5dBL1aD7M4u1MZWKBASpoRucA9Fe/T5FAJuxjtBp8kcJjmjiXWrr2/R
         qObelguDHNLJJYvLiz/al20DQq4l8MH8aSGU6vqWmrU770jnqpc4RFFrDapnbaU1LgBn
         XiZjfYQU5D9z14GAqqgXPDnqqfVzMWz6HPtpfXc0YgxTlD3UFLdJ1xX4AxmvH9Bt939V
         ASrfZfwip7BwRuwKAh8Gm2DBJdZUZ9+olFv0a/Tq2kgOCJoREEmKxd+tupI2dNuKnt6P
         d/yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HR6rph7KiKkYsAzqjwzf6HSX2uxFv8Z/FYJMos7bSok=;
        b=qmwW1WQQUo7xZSGVudyzgumnnvaK4mxexV/EGTMo3Lk0Cb09wIoYlD/BmgHdJioMBV
         2tiC13UK6kM88MJx69Vg3GfBPjboQFnYIanmBZvq7IqdeS99EeurNBw3mL0QMFwHudAo
         NvZqlP6HvfNJ+eaYij6wrLS674xTbNaqmJMuz/3j3VJnCMieXVawqro+/Wfb5ESSNhyx
         5wGln0Muzu0eh9lg4kx0E5KFiNwaAZuQczxGOUTImpHJ/FQ1MNL65wt5+Nv6ErnC632a
         iahb3zE43WQLXQlsaEjzzeALWGfMwc3BdXbk0yg3JZYVXqr3Dtz6zgsbxIL/OLVAB8Zx
         9W1Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=UqkoDOJm;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o3si7759817qvl.30.2018.12.04.04.50.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 04 Dec 2018 04:50:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=UqkoDOJm;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56397 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gUA9Q-00088z-Gp
	for alex.bennee@linaro.org; Tue, 04 Dec 2018 07:50:08 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45998)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gUA7x-0007Xl-3H
	for qemu-devel@nongnu.org; Tue, 04 Dec 2018 07:48:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gUA7w-0003yk-C0
	for qemu-devel@nongnu.org; Tue, 04 Dec 2018 07:48:37 -0500
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:40173)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gUA7w-0003y7-0B
	for qemu-devel@nongnu.org; Tue, 04 Dec 2018 07:48:36 -0500
Received: by mail-ot1-x344.google.com with SMTP id s5so15003593oth.7
	for <qemu-devel@nongnu.org>; Tue, 04 Dec 2018 04:48:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=HR6rph7KiKkYsAzqjwzf6HSX2uxFv8Z/FYJMos7bSok=;
	b=UqkoDOJmbXs3nKUG7HkYK4O7h0tfoPJBllMBWg4knC32OrteRrAlDYPslP5OE0CPJJ
	/yVUlq+BOMuznySrVoavbYavZGVpj3HSkyGVZZYiel6AuaRjPUSprXkeOiyiWrZ+vi+5
	X0XdeGYU3OS3dl5rmV5b6Um65OkvSUXcwtahs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=HR6rph7KiKkYsAzqjwzf6HSX2uxFv8Z/FYJMos7bSok=;
	b=OQ7+1GiEHrGYnuWw0B362Oj8feLz4WacGwYzbqR6cYP0qjkJFrqlto57u0oV4VOXXz
	OKCNxPI+0NTHbx6jJo9g5X9LtnGgEQjMUmf0wehlMZsShB/1ledabCmd6VFY94BxUiUT
	bmTxLSKaT8ugjwzEvWLT78DVQoYXCPJe7ozesJdlcMs7wF2IvecIscP8DT/C5WKWn5wO
	oC0d64yhHcP0IY1/qg0RVhxPIilPFHXL5yTeEsuMvrrBtYEZWAPKOZ2LUKDSleCNOcyj
	KHc9dtE8QndQUNMJVCIyHavz6fCTWfMa7fFXT0q8Vqw4bE6I90HdlC//eiR/DYwQTueO
	aopQ==
X-Gm-Message-State: AA+aEWaN8sC3iyuqwXp4O66AUitbfeCaIttEUNPJtcQF/RMwVCm9KVVr
	8cmsgTNPzwlxhgLIXOjImwHUSel/dlcOkdR7SxCmsg==
X-Received: by 2002:a9d:5617:: with SMTP id e23mr11726798oti.151.1543927715333;
	Tue, 04 Dec 2018 04:48:35 -0800 (PST)
MIME-Version: 1.0
References: <CAFEAcA-oFFz-NtfwHmORxQd4rHsfKa1=tV1kyvPuGQoOZwDB3A@mail.gmail.com>
	<201812040841510784684@zte.com.cn>
	<CAFEAcA8hw_PHrBTC+v9rr8VoeU5uiV3Z6nMRknDM7WWdG1Ti5g@mail.gmail.com>
	<20181204120547.x5qa7q6usq6bfgkw@kamzik.brq.redhat.com>
In-Reply-To: <20181204120547.x5qa7q6usq6bfgkw@kamzik.brq.redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 4 Dec 2018 12:48:23 +0000
Message-ID: <CAFEAcA-JCAvgGCLVPRHGRM47Mw_G_9utG3NUn-FRaT+txJSfXQ@mail.gmail.com>
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::344
Subject: Re: [Qemu-devel] [PATCH V11 0/8] add pvpanic mmio support
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
Cc: Peng Hao <peng.hao2@zte.com.cn>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gSVC83ecoDNy

On Tue, 4 Dec 2018 at 12:05, Andrew Jones <drjones@redhat.com> wrote:
> To muddy the waters a bit more, while I'm not opposed to this device
> being a PCI device, there is a chance that someone will still want a
> platform-mmio version as well. I'm not sure how everything will
> eventually fall into place, but I've seen some super minimal guest
> configs proposed for the VMs-used-like-containers use cases, even
> configs that choose to use virtio-mmio over virtio-pci, and then not
> provide a PCI bus at all to the vm.
>
> Maybe this series and the current kernel series can be allowed to
> continue as they are, and if later there's a demand for a pci version,
> it could just be yet another variant added later?

I like the PCI device idea because it avoids adding yet
another complication to the virt board. Adding the MMIO
variant now and the PCI device later doesn't let us avoid
the complication or even remove it in the future.

The last I heard we were still thinking about deprecating
virtio-mmio entirely.

thanks
-- PMM
