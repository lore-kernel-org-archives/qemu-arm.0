Received: by 10.25.208.211 with SMTP id h202csp1768891lfg;
        Tue, 1 Mar 2016 10:22:02 -0800 (PST)
X-Received: by 10.140.131.6 with SMTP id 6mr10379290qhd.67.1456856522313;
        Tue, 01 Mar 2016 10:22:02 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p129si9998614qhb.24.2016.03.01.10.22.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 01 Mar 2016 10:22:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:51610 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aaovp-0002E6-Nw
	for alex.bennee@linaro.org; Tue, 01 Mar 2016 13:22:01 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38387)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aaovn-0002Dg-OP
	for qemu-arm@nongnu.org; Tue, 01 Mar 2016 13:22:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aaovm-0003FX-RO
	for qemu-arm@nongnu.org; Tue, 01 Mar 2016 13:21:59 -0500
Received: from mail-vk0-x233.google.com ([2607:f8b0:400c:c05::233]:36590)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aaovm-0003FK-Md
	for qemu-arm@nongnu.org; Tue, 01 Mar 2016 13:21:58 -0500
Received: by mail-vk0-x233.google.com with SMTP id c3so176620869vkb.3
	for <qemu-arm@nongnu.org>; Tue, 01 Mar 2016 10:21:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Ag9XLpixaDkhAQtb87JVIQ6fITfJuLB6uWVaSWq0l2A=;
	b=G6gWE0W/UH9d/KC+tw5WcjA9WFMyW5NXoaksoDJUpIaj2AhX+xefRtQj+BcVqCgi39
	kicFV30RGx5fL3hHQzD6USr//oBKuHz1pPW6PbHJW/MUxGppWp7z4HLGecHDA/F+FDlj
	PHMMa+YgUvhlPKNP2KkfDCjSGtK2Qy8OdBBTk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Ag9XLpixaDkhAQtb87JVIQ6fITfJuLB6uWVaSWq0l2A=;
	b=ivr1lqYeBzLzcF3UHcnNs7xdHiNgws7zfZ5Uz1xqOMA/pdXfyN1GAcG4Uc4lqi3oJk
	UMDfdsepY7rEtXiLH7DMRFSxNlqIllVeV/tu68Wiy9G0v4iKFSdw9vnFlmj8UfrVWf7u
	tCcWuW3tO9p6OAuRhfQrrd0wi3mM8KV/sdZweSkYGGWgyb+z6U8nrxp2pRHoGHG4OLFm
	BB2WVAU9AE2RG1gAeIYJ9t6vShFJFSxVqtMhipxgEDVpUq6xTVnQMaKk/62QmwFQp3jG
	Q1q9CAiMyEVlprnIpIyw2Ucud064c2WND/GnlisVmlViLP/6waZIMS95OCl6H4e0MQjv
	OniA==
X-Gm-Message-State: AD7BkJLZ9Bwn6SMmIEEZ7zQeTa+3zQMtJvJFd8QkT6pI5d2y8lzWkaMViFf6sBdgmaTmq8kCkNLNE3uZoRM6vxbf
X-Received: by 10.31.180.85 with SMTP id d82mr14178869vkf.83.1456856518334;
	Tue, 01 Mar 2016 10:21:58 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.56.216 with HTTP; Tue, 1 Mar 2016 10:21:38 -0800 (PST)
In-Reply-To: <1456532174-17432-2-git-send-email-Andrew.Baumann@microsoft.com>
References: <1456532174-17432-1-git-send-email-Andrew.Baumann@microsoft.com>
	<1456532174-17432-2-git-send-email-Andrew.Baumann@microsoft.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 1 Mar 2016 18:21:38 +0000
Message-ID: <CAFEAcA_tqGexxsqWocfk6RKmUV-2ZRVBGgSEfu-xZ63XhLMFzg@mail.gmail.com>
To: Andrew Baumann <Andrew.Baumann@microsoft.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::233
Cc: =?UTF-8?Q?Gr=C3=A9gory_ESTRADE?= <gregory.estrade@gmail.com>,
	Stefan Weil <sw@weilnetz.de>, QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-arm] [PATCH 1/4] bcm2835_peripherals: enable sdhci
 pending-insert quirk for raspberry pi
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
X-TUID: aHEiz9KnWM1r

On 27 February 2016 at 00:16, Andrew Baumann
<Andrew.Baumann@microsoft.com> wrote:
> Signed-off-by: Andrew Baumann <Andrew.Baumann@microsoft.com>
> ---
>  hw/arm/bcm2835_peripherals.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/hw/arm/bcm2835_peripherals.c b/hw/arm/bcm2835_peripherals.c
> index 6d66fa0..6ce9cd1 100644
> --- a/hw/arm/bcm2835_peripherals.c
> +++ b/hw/arm/bcm2835_peripherals.c
> @@ -171,6 +171,13 @@ static void bcm2835_peripherals_realize(DeviceState *dev, Error **errp)
>          return;
>      }
>
> +    object_property_set_bool(OBJECT(&s->sdhci), true, "pending-insert-quirk",
> +                             &err);
> +    if (err) {
> +        error_propagate(errp, err);
> +        return;
> +    }
> +
>      object_property_set_bool(OBJECT(&s->sdhci), true, "realized", &err);
>      if (err) {
>          error_propagate(errp, err);
> --
> 2.5.3

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
