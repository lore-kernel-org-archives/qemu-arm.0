Received: by 10.25.208.211 with SMTP id h202csp1725736lfg;
        Mon, 7 Mar 2016 20:33:40 -0800 (PST)
X-Received: by 10.140.93.84 with SMTP id c78mr32640833qge.101.1457411620742;
        Mon, 07 Mar 2016 20:33:40 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h33si1197258qgh.81.2016.03.07.20.33.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 07 Mar 2016 20:33:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:60145 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ad9L2-0002Rc-6c
	for alex.bennee@linaro.org; Mon, 07 Mar 2016 23:33:40 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56900)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ad9Kz-0002PM-Eo
	for qemu-arm@nongnu.org; Mon, 07 Mar 2016 23:33:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ad9Ky-0000B1-MH
	for qemu-arm@nongnu.org; Mon, 07 Mar 2016 23:33:37 -0500
Received: from mail-vk0-x229.google.com ([2607:f8b0:400c:c05::229]:35632)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ad9Ky-0000Ao-IP
	for qemu-arm@nongnu.org; Mon, 07 Mar 2016 23:33:36 -0500
Received: by mail-vk0-x229.google.com with SMTP id e6so4265602vkh.2
	for <qemu-arm@nongnu.org>; Mon, 07 Mar 2016 20:33:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ZhGJBn6mdOB3nnTft8TNqdv5oqdPVrO4TFVRFF7FSow=;
	b=SzB4S1v34bAogX9EzHdUdml3jtkRDZTpFSErlxDAwt5ktg1DnJAsKLh5/fVE51HnYf
	Y8AHZ/HKuu1AkVdliZDkJkU/G1vOIoQ9ZWpNNEbgm98TIrWwir3XOjVq2i5oEgtRFqqc
	OX0tw4NtC+Oc8iWiIu6o3n1Jzj9uSMtCjP/hI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ZhGJBn6mdOB3nnTft8TNqdv5oqdPVrO4TFVRFF7FSow=;
	b=duwmvMZhNXvOIK+MDZ4li2eyLQ2C8rPCe/I7Ue3Qs0x6eCD+qrrDlAletYKj5HsGT9
	4CQ6I8AHLDlHJFjg6FFFU3nNtQalbyJ8Ak9nslTOkv0S+KM9g42/fYXnIO9oNFWg3PfG
	stl7jZ2u8I3/j6BC8G2T4q320BmJv+9+DikW/R6CVTs+xRKDIv7eGNKRM/4mlzmnupxn
	lBlWYXbdSQAnKkrjEX1nRgqtUig77GHhXHNWGxOB4rJA2hkAEsJpti5QHRKUcyRRTaR0
	2xa1Fpd9WfkFYqhVnFtyaWBDs/pSjVUVvRVSA8SNDvbjTjNWBNn6if+Krg39rQfXWHwS
	sztg==
X-Gm-Message-State: AD7BkJIoemktBpceDrfvH4pQgnMdCYmusY3+phcs0VvVNTq0QVjkFbDuBslxXBqUO/ZBKZnF6lUcdsesV39sje8t
X-Received: by 10.31.52.147 with SMTP id b141mr24526311vka.82.1457411615099;
	Mon, 07 Mar 2016 20:33:35 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.216.1 with HTTP; Mon, 7 Mar 2016 20:33:15 -0800 (PST)
In-Reply-To: <1457029479-11312-4-git-send-email-Andrew.Baumann@microsoft.com>
References: <1457029479-11312-1-git-send-email-Andrew.Baumann@microsoft.com>
	<1457029479-11312-4-git-send-email-Andrew.Baumann@microsoft.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Mar 2016 11:33:15 +0700
Message-ID: <CAFEAcA8U00y5BYeaChSVLvzbk8WfgOPG=oEzPx6nR55rOVaVRQ@mail.gmail.com>
To: Andrew Baumann <Andrew.Baumann@microsoft.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::229
Cc: =?UTF-8?Q?Gr=C3=A9gory_ESTRADE?= <gregory.estrade@gmail.com>,
	Stefan Weil <sw@weilnetz.de>, QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-arm] [PATCH v2 3/5] bcm2835_fb: add framebuffer device
	for Raspberry Pi
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
X-TUID: ZtzsC4aBB159

On 4 March 2016 at 01:24, Andrew Baumann <Andrew.Baumann@microsoft.com> wrote:
> The framebuffer occupies the upper portion of memory (64MiB by
> default), but it can only be controlled/configured via a system
> mailbox or property channel (to be added by a subsequent patch).
>
> Signed-off-by: Andrew Baumann <Andrew.Baumann@microsoft.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
