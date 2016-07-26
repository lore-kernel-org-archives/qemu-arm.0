Received: by 10.25.21.156 with SMTP id 28csp1647827lfv;
        Tue, 26 Jul 2016 04:07:21 -0700 (PDT)
X-Received: by 10.200.36.174 with SMTP id s43mr36937964qts.52.1469531241133;
        Tue, 26 Jul 2016 04:07:21 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p22si154074qki.36.2016.07.26.04.07.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Jul 2016 04:07:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38848 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bS0Cm-0003Dg-Eh
	for alex.bennee@linaro.org; Tue, 26 Jul 2016 07:07:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43249)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bS0Cf-0003BD-NP
	for qemu-arm@nongnu.org; Tue, 26 Jul 2016 07:07:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bS0Cd-0004Dg-J4
	for qemu-arm@nongnu.org; Tue, 26 Jul 2016 07:07:12 -0400
Received: from mail-yw0-x236.google.com ([2607:f8b0:4002:c05::236]:33755)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bS0Cd-0004DT-2Q
	for qemu-arm@nongnu.org; Tue, 26 Jul 2016 07:07:11 -0400
Received: by mail-yw0-x236.google.com with SMTP id r9so6122738ywg.0
	for <qemu-arm@nongnu.org>; Tue, 26 Jul 2016 04:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=i4JZxUyO3WtcoLEIQKeUxJS1ifHRP5jRx3UB0TIlNTw=;
	b=QhDJ72yCTkhN3SSTRABBf4zPO0mqVLdIX4oDgzchIc1NdfKh7ZMDt11rwfsI7HX7vN
	OgNEDAk7to+WX1YXFfUks84OerPe4Zb0cwRDJNEd6z+fUEcCSUYabREqlC6vcAL27FkF
	4RguIGXO0i3U6un/aybkNlUjZeaiEKnu/NfX4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=i4JZxUyO3WtcoLEIQKeUxJS1ifHRP5jRx3UB0TIlNTw=;
	b=SVNyd4KZmwd/ov85K2be5Lm5XEy+rDfASlf7G8mPJrsoAg7zPHloosF9qDUHwksy7O
	+cyGDCIonB/azgleJuwDzvmu+/6oBqmAAKXks6fVN5ozH8pFqs+VMHzbffamRd8oc4XN
	lh89kSGfkvOgKeGzyJQT0Bke6yRWET+hTjYmtJoyMMp/fT2hUPMhBjiUpDtBQmTWNb7U
	7+jZeCW/zPp/RcTqvN4d/lNLeOe6eB23sohKCHRgtNtRC0wo90jQf3qmkYz7FK11HrBg
	5HEoq8iVqzAX1gsW6ac3seUOT4N+OR0mK2jx0aIlJc7sVEwEaNxj3eH+CYiYcnamnzGR
	+qQA==
X-Gm-Message-State: AEkoousH+EkRTBRoUrWTzJ20QYW4wdBKjalfX3Yp7B/VvmxHnw/SpI6vMQ7hMAwgIHMLHPGb0t8LWKemWuD4MJSs
X-Received: by 10.31.218.198 with SMTP id r189mr9805815vkg.30.1469531230393;
	Tue, 26 Jul 2016 04:07:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.137.136 with HTTP; Tue, 26 Jul 2016 04:06:51 -0700 (PDT)
In-Reply-To: <1469530917-13842-3-git-send-email-vijay.kilari@gmail.com>
References: <1469530917-13842-1-git-send-email-vijay.kilari@gmail.com>
	<1469530917-13842-3-git-send-email-vijay.kilari@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 26 Jul 2016 12:06:51 +0100
Message-ID: <CAFEAcA9ntTvNp-uthmJ4+jON+SRr6FCfcgooas=akbEA2S+R9A@mail.gmail.com>
To: Vijay Kilari <vijay.kilari@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4002:c05::236
Subject: Re: [Qemu-arm] [RFC PATCH v1 2/2] hw/intc/arm_gicv3_kvm: Implement
 get/put functions
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
Cc: "prasun.kapoor" <Prasun.Kapoor@cavium.com>,
	Pavel Fedin <p.fedin@samsung.com>, QEMU Developers <qemu-devel@nongnu.org>,
	Vijaya Kumar K <Vijaya.Kumar@cavium.com>, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bUzMm3v857kG

On 26 July 2016 at 12:01,  <vijay.kilari@gmail.com> wrote:
> From: Vijaya Kumar K <Vijaya.Kumar@cavium.com>
>
> This actually implements pre_save and post_load methods for in-kernel
> vGICv3.
>
> Signed-off-by: Pavel Fedin <p.fedin@samsung.com>
> Signed-off-by: Vijaya Kumar K <Vijaya.Kumar@cavium.com>
> [Vijay: - Adjusted macros to handle gicr variables
>  - Used gicr_typer for affinity
>  - Made all GICD/GICR registers access as 32-bit.
>  - All ICC register access as 64 bit.
>  ]
> ---
>  hw/intc/arm_gicv3_common.c         |    3 +
>  hw/intc/arm_gicv3_kvm.c            |  496 +++++++++++++++++++++++++++++++++++-
>  hw/intc/gicv3_internal.h           |  113 ++++++++
>  include/hw/intc/arm_gicv3_common.h |    1 +
>  4 files changed, 607 insertions(+), 6 deletions(-)

Please base this on the rearrangement I did in
http://patchwork.ozlabs.org/patch/626746/
not Pavel's first version.

thanks
-- PMM
