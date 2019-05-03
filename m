Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp573956wrh;
        Fri, 3 May 2019 06:38:09 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyE4qaXOCmMo54l5Quw5YTaQxNdbYwYY3Fe7bYTMO8b5SlvjTDEmzkMu+ucR2oH7nN5yulM
X-Received: by 2002:a5d:570e:: with SMTP id a14mr7014337wrv.111.1556890689876;
        Fri, 03 May 2019 06:38:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556890689; cv=none;
        d=google.com; s=arc-20160816;
        b=eGnLt7NNRSc2zkKihW10Tm8qJ1E7yJvbuOCUX7cadii5GjkPpIiJ+f/aprxNnrws+W
         u7VQoEPYQHoO83yHCHM3yF8yR16P8PdkI5BE4wEfCrFest8rL8sRzj4G7UtV4yDLxgAg
         wi1qZCD8te8/Tw9ZWa+f7O/96eCjszfqgJUdKp2xAleZNstY2uNuxFU4zxvUYWde1LXV
         chpqp/75vsDyqQLvmalKMKhaUoei3DfEHJw9FPJXiP1AE8AXhu0tR1krN9aaqOPeEdwL
         Pt7+PYJNyT/gz4trDmfb0d1xKqfMaodZpL4EGxlzehIcXjUbKnNJDFVgQZSkPHmnzghf
         U17g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=y0XWIKWuLcmt/ZDnYmL6cnQJDiWz+6GEr3jPPs3mr1I=;
        b=rE18K+msfDr0mnyplZ0gSxl3V5QGrRU3seAbNRHD+yu+mbF7LVy0Dfjm+aGcUjbB3d
         EEGUN57efhDfLMg2TG/T6bdtHSsmbUXGZTU5CiqzoS1ZpmCkBvHzS+hqR2OR83Yym1nP
         ANGMXhwAKBak55dEMwISRh0oHK/nNibI6MZTpnNBlj8l7Shn8l/e8AXjmyefS1uW0w48
         6y8t+wyovgFadgQE/+YNgl62I3tT1uMmY4p4+dYdsw7fj+13aXCwHbtUAS1fSeErYjng
         YhAK5+5s4lwLszXfj9HM5d+Q9wDxbh4p8BJ0bLFJ1l6GXNkYabiXF8o1AN6TyYeRM0VS
         r58A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=r9YYpWRQ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y16si1666082wrs.358.2019.05.03.06.38.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 03 May 2019 06:38:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=r9YYpWRQ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:40873 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hMYO8-0004s3-UB
	for alex.bennee@linaro.org; Fri, 03 May 2019 09:38:08 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34610)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hMYMS-0003f6-RB
	for qemu-devel@nongnu.org; Fri, 03 May 2019 09:36:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hMYMS-0004lu-0s
	for qemu-devel@nongnu.org; Fri, 03 May 2019 09:36:24 -0400
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:34540)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hMYMR-0004l3-Sq
	for qemu-devel@nongnu.org; Fri, 03 May 2019 09:36:23 -0400
Received: by mail-oi1-x241.google.com with SMTP id v10so4441806oib.1
	for <qemu-devel@nongnu.org>; Fri, 03 May 2019 06:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=y0XWIKWuLcmt/ZDnYmL6cnQJDiWz+6GEr3jPPs3mr1I=;
	b=r9YYpWRQGPMOwqGCbSqQPr1G8UcE7nEDBrR0GJt1HUS9q6a00BEsZmYUZFPTcuDJqk
	tF40xUuz/slFqLO1lBF30EfS/8NrU0baKhUBaskX2Whk9et0sHxRbxAOxc/Ejyx77Lyy
	tg4ctskjSPPMrqjd0yrZHtWGEI5mQdKKESEK+YPhC5ETVntcsGKCV5pUb6QCLorL7rf5
	XiZd63lrar3SyZH4eYfNG8mqOQUfnM5MgC/pY8Aw8TVt5kAwfDsnNU3qlU+55M4XTT6M
	r0H4dPHC/mlodqrlmKNK/Vpgp5UXQwu7hDIKns9RwlkQnpF3s9zBVA9KarEW3LQL+GDN
	TGRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=y0XWIKWuLcmt/ZDnYmL6cnQJDiWz+6GEr3jPPs3mr1I=;
	b=Pq4LSAwIxRuAT8I9zA7QzcLUWnyG2R9eAQ1QdEAN/XOgsk83aBiqWPots22Aw/Owqq
	lIqak5sFHo3D3rB9DjmmbOq3XHFkiXa4jkvH0yx9NrBssp8bSnSplHXWO4zO/WKWaAn7
	8gp/IBfN52ndWo5XgybWfJc+Eb1ihPKePc67GKbBUJPT+9rer9MIZd9u5Xgn6CCOnXH6
	UxbaBm34Pc0ElojV47bx2tzjmsxh0zuO47OSJzdalU9ei5Ek1ROAx1VuWXrMocJtLgAv
	ARwpQN3YhXngKyR1l6tySzu6EughY/OpJoaw2D2ApgZw+ZTX4RGQghHVMmFKgS4T0qqV
	kEvQ==
X-Gm-Message-State: APjAAAUINbKD0PyKeMirGhciBv546ReXLaKYGY8T1oy/Go54Lpj6fZTo
	wHnTh5eVmSn8Vx9VSXNkp23OxLcZo0sI7pnVuXLVLA==
X-Received: by 2002:aca:b3c2:: with SMTP id c185mr6238708oif.98.1556890582999; 
	Fri, 03 May 2019 06:36:22 -0700 (PDT)
MIME-Version: 1.0
References: <20190430044036.1144-1-joel@jms.id.au>
In-Reply-To: <20190430044036.1144-1-joel@jms.id.au>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 May 2019 14:36:11 +0100
Message-ID: <CAFEAcA9qyzHiEY-OudwBUDzCia-jSQ7CkY_L7oC0t4Nu_665uA@mail.gmail.com>
To: Joel Stanley <joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::241
Subject: Re: [Qemu-devel] [PATCH v3 0/2] arm: aspeed: Add RTC Model
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: E7mu3V4PFlu1

On Tue, 30 Apr 2019 at 05:40, Joel Stanley <joel@jms.id.au> wrote:
>
> v3: Add some commit messages, resend as v2 didn't send properly
> v2: Minor fixes, added vmstate and reset, and rebased on C=C3=A9dric's se=
ries
>
> Based-on: 20190411161013.4514-4-clg@kaod.org
> [PATCH 3/3] aspeed: use sysbus_init_child_obj() to initialize children
>
> A model for the ASPEED BMC real time clock (RTC). The model is sufficient
> for running the guest Linux kernel driver, and ticks in time with the
> host when programmed.
>
> It does not implement the alarm functionality, which includes the
> interrupt.

Hi -- I've reviewed this series, but can't apply it yet as
it's based on Cedric's patchset which needs a respin. If
I forget to apply this when I apply the respin of that one,
please ping me...

thanks
-- PMM
