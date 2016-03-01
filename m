Received: by 10.25.208.211 with SMTP id h202csp1794686lfg;
        Tue, 1 Mar 2016 11:26:35 -0800 (PST)
X-Received: by 10.140.92.23 with SMTP id a23mr3018937qge.92.1456860395750;
        Tue, 01 Mar 2016 11:26:35 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v82si32267369qkv.63.2016.03.01.11.26.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 01 Mar 2016 11:26:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:51915 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aapwJ-000628-96
	for alex.bennee@linaro.org; Tue, 01 Mar 2016 14:26:35 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32888)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aapwG-000620-Kw
	for qemu-arm@nongnu.org; Tue, 01 Mar 2016 14:26:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aapwF-0006wk-Rw
	for qemu-arm@nongnu.org; Tue, 01 Mar 2016 14:26:32 -0500
Received: from mail-vk0-x234.google.com ([2607:f8b0:400c:c05::234]:33673)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aapwF-0006wZ-Nc
	for qemu-arm@nongnu.org; Tue, 01 Mar 2016 14:26:31 -0500
Received: by mail-vk0-x234.google.com with SMTP id k196so179573009vka.0
	for <qemu-arm@nongnu.org>; Tue, 01 Mar 2016 11:26:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=reHY9fFxofLEL3rxUujIlgE087vReVS3Tcx1f8eCerM=;
	b=EbNNu1rxGkCDXRq9L8bGUVuU5QthDOjjkakjy1RnfHjh24T5wlT2+bmF9e6vTy7U+e
	T059Hos/+hXvJXwquHxY/a9andznhSUXn+80nK+phQb7R6V6yvqWRr1FjEpu+noIOvDu
	+Q7SJBx/ITcR+4o9OEzjzTvcznU37ZBEA9uLE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=reHY9fFxofLEL3rxUujIlgE087vReVS3Tcx1f8eCerM=;
	b=KNGW7tyCeIxingGCip/nT/PnLxtI5fAmEEbHWDDUISIcqiRhrkkZkuLb73uV85QlPf
	nvIjOGKFh/2Sm0iB7HgB3sCzYiNRFJFXKiH5WDfHTX/vqR22r8Flvr+p9a4nu3KiDTHF
	Oj56DmO3Gu4eBPqJhvDZmOtL7I6p0VBq0vLMz32ttuvInDDOohESU9ckw/bqU9kiw+N5
	y5AfDTWfS0LkyDMIjqIqFdWzmDGyOLRFbq3wb/iRlqxV7XLCdK4y7YwvTZcyy+F85aor
	VPb6FqQ9U7pRJDIe8ufFnf5mrqycWOvlBtXe6nFaZOsp0N+z0NDKRELlsjSQNYwPasSP
	Mr+g==
X-Gm-Message-State: AD7BkJIYOPksUHXFVbW7fFQsL6kzn0tqiAZPwdZhT3wnlQIlVWYjTvPN2UFC2P6XloFAseTeF1C/lGkHoXFX87bg
X-Received: by 10.31.8.210 with SMTP id 201mr360095vki.90.1456860391387; Tue,
	01 Mar 2016 11:26:31 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.56.216 with HTTP; Tue, 1 Mar 2016 11:26:11 -0800 (PST)
In-Reply-To: <1456532174-17432-5-git-send-email-Andrew.Baumann@microsoft.com>
References: <1456532174-17432-1-git-send-email-Andrew.Baumann@microsoft.com>
	<1456532174-17432-5-git-send-email-Andrew.Baumann@microsoft.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 1 Mar 2016 19:26:11 +0000
Message-ID: <CAFEAcA8CkEoPOdnrFrvaY34COnM357rm6+hiP=z1EO-haJvoMg@mail.gmail.com>
To: Andrew Baumann <Andrew.Baumann@microsoft.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::234
Cc: =?UTF-8?Q?Gr=C3=A9gory_ESTRADE?= <gregory.estrade@gmail.com>,
	Stefan Weil <sw@weilnetz.de>, QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-arm] [PATCH 4/4] bcm2835_property: implement framebuffer
 control/configuration properties
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Cap/Y+/lQQDW

On 27 February 2016 at 00:16, Andrew Baumann
<Andrew.Baumann@microsoft.com> wrote:
> The property channel driver now interfaces with the framebuffer device
> to query and set framebuffer parameters. As a result of this, the "get
> ARM RAM size" query now correctly returns the video RAM base address
> (not total RAM size), and the ram-size property is no longer relevant
> here.
>
> Signed-off-by: Andrew Baumann <Andrew.Baumann@microsoft.com>

This should all be specifying endianness of loads explicitly too,
but otherwise looks OK.

thanks
-- PMM
