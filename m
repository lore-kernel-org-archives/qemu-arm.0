Received: by 10.80.163.71 with SMTP id 65csp1140066edn;
        Tue, 20 Sep 2016 10:34:57 -0700 (PDT)
X-Received: by 10.55.101.7 with SMTP id z7mr35951633qkb.186.1474392897510;
        Tue, 20 Sep 2016 10:34:57 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c103si22088892qkh.193.2016.09.20.10.34.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 20 Sep 2016 10:34:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36992 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bmOwa-0005dl-Sa
	for alex.bennee@linaro.org; Tue, 20 Sep 2016 13:34:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52593)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bmOwW-0005c4-A4
	for qemu-arm@nongnu.org; Tue, 20 Sep 2016 13:34:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bmOwV-0000Hn-80
	for qemu-arm@nongnu.org; Tue, 20 Sep 2016 13:34:52 -0400
Received: from mail-vk0-x22d.google.com ([2607:f8b0:400c:c05::22d]:34011)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bmOwV-0000HG-1o
	for qemu-arm@nongnu.org; Tue, 20 Sep 2016 13:34:51 -0400
Received: by mail-vk0-x22d.google.com with SMTP id o139so45540737vka.1
	for <qemu-arm@nongnu.org>; Tue, 20 Sep 2016 10:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=ZKjXmbZX5kUL23rYeQadHOuiEgJyxBhqTLQrzw9REvI=;
	b=hD9mBQHvbd2N/CaCtc14iZWV6f7jhS1GkKkGS0VKa2mmCp5uiKk/sP3kpINgm67APz
	Bn3JuFpetWg7H1mR+6w99d1r2PDvpqMAl3yiciMPFMSiW0S5ZR4MRaj22QDmARGAU+bC
	jMRXvnT7mWXEe6uJNIWRgUSsh7+Jlqg6N3M9s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=ZKjXmbZX5kUL23rYeQadHOuiEgJyxBhqTLQrzw9REvI=;
	b=i1Im5eYBcpZJ3YkKpaJxbSYdR4EtFal7p5XqRxxsJ9Bc9Ebe0j0aJbCh/X1IauDEaw
	5IlVCfnv8bkRqVIUUhQkaVtUUp5Wimeryg5Hfo/73JdVcICTP5fmuPDpwvhtgdGT4+5D
	oD1dR2fyud5KoMNWS4nGk8Llc9etSJ5nykNnHkc4qLeB5ChfqF41Qicg0nrwF574+n5Y
	W4yRvaelOc64wMEyEaxAuqLDcG1zVKRTsYknLSFvRnURzykwyYJqTjhu0H55nF0JxR1l
	MQEparDLxjoPGEICmyiN7qEsDYjIQvv23EAqvdWkKDFnPrWf36tGVcP82uaiWl34DWSf
	BlJw==
X-Gm-Message-State: AE9vXwNLW2fWhuuh1e/vT1xk1zd9ypCGdMxlknjfm4aAo1oewOXnE/FkBc1N6QpJQK4ZJDLEuIWZ8RmWXYfE0Gvz
X-Received: by 10.31.96.74 with SMTP id u71mr4342232vkb.51.1474392890381; Tue,
	20 Sep 2016 10:34:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.16.98 with HTTP; Tue, 20 Sep 2016 10:34:29 -0700 (PDT)
In-Reply-To: <1474314852-29465-1-git-send-email-jakub@jermar.eu>
References: <1474314852-29465-1-git-send-email-jakub@jermar.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Sep 2016 18:34:29 +0100
Message-ID: <CAFEAcA-BhgnLYVGq+qND25yfrFArk=QMXg4ubie=kKncpovFSQ@mail.gmail.com>
To: =?UTF-8?B?SmFrdWIgSmVybcOhxZk=?= <jakub@jermar.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22d
Subject: Re: [Qemu-arm] [PATCH] hw/arm: Fix Integrator/CP memsz
 initialization
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
X-TUID: KQzg3Lbmx2fA

On 19 September 2016 at 20:54, Jakub Jerm=C3=A1=C5=99 <jakub@jermar.eu> wro=
te:
>
> * Do not assume memsz is already initialized in integratorcm_init
> * Calculate memsz directly from MachineState
> * Get rid of the now unused memsz property
>
> Signed-off-by: Jakub Jermar <jakub@jermar.eu>

Thanks for this patch; this is definitely a bug but I think
this is not the best way to fix it.

What we should do is add a realize function to the IntegratorCM
device, and move the code that depends on the value of memsz
from the init function to the realize function. That way the
device doesn't have to know anything about the machine.

thanks
-- PMM
