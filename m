Received: by 10.25.208.211 with SMTP id h202csp2910102lfg;
        Thu, 25 Feb 2016 08:47:41 -0800 (PST)
X-Received: by 10.140.147.134 with SMTP id 128mr1503285qht.54.1456418860930;
        Thu, 25 Feb 2016 08:47:40 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f17si8766154qhc.19.2016.02.25.08.47.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 25 Feb 2016 08:47:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:44452 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aYz4m-0006iz-Fw
	for alex.bennee@linaro.org; Thu, 25 Feb 2016 11:47:40 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39145)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aYz4j-0006gI-LE
	for qemu-arm@nongnu.org; Thu, 25 Feb 2016 11:47:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aYz4i-00035C-PN
	for qemu-arm@nongnu.org; Thu, 25 Feb 2016 11:47:37 -0500
Received: from mail-vk0-x231.google.com ([2607:f8b0:400c:c05::231]:33711)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aYz4i-000350-KX
	for qemu-arm@nongnu.org; Thu, 25 Feb 2016 11:47:36 -0500
Received: by mail-vk0-x231.google.com with SMTP id k196so53440568vka.0
	for <qemu-arm@nongnu.org>; Thu, 25 Feb 2016 08:47:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=/Jae4RbGPMltukZ/LAwQtOkiDWHeH1hF2UDToaHXq1Q=;
	b=ZoCHs2tcKQyE7HiBrVotRziZ2dQOfKtUhKYWhsvyTputQbjfl3kHArfFb+IASroPdx
	q9tkfcf6ARcipsqAIMJ/JetpXDbijJk4oEwYesaQEEiYdRkjmRRY5QfMpMNxFVi16iCf
	IkQHXQ2WeCCQoGsnL4eRFmIwKB6v3/O1CBxAY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=/Jae4RbGPMltukZ/LAwQtOkiDWHeH1hF2UDToaHXq1Q=;
	b=kYO/Hohy8vIAu6SXEndW7A6EDbFd6MRM3pH/oIwQFlMcP0uLwjxmXfWZp2kQRKfi6m
	dBc2UX2MRB/v0ioOYB4NhVFw4KWP6n8VNGNORG3zW1e7j5vY6Jcs2vW1lzdOSNMK92sq
	B28CbtRcE0SMTZ4j6sokfNxR2c531vv0tDC2gNmmmj81AQvxOiz/OdpBZN5+0zyKQrG8
	RKKy5Y6y0gjMIeDf5mamwNwBq8iP1l42uAXY1UuDrybO3QOefkgWOV/pvW1fcjflgSoX
	diumU5LYrLYYv19uAs/18Np7PqndME/X+JTRpdEAlRNQGW9JGX2WUKCE9PVlXRqXmqfk
	8NRQ==
X-Gm-Message-State: AG10YOReUxGfbtNoaUfwr56B6osjrNylMNTQaTKaqtRBdqE48X5OcVykzs7brd0DYntspn361s9sL1wPeRwQEigL
X-Received: by 10.31.194.130 with SMTP id s124mr36869255vkf.92.1456418856199; 
	Thu, 25 Feb 2016 08:47:36 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.56.216 with HTTP; Thu, 25 Feb 2016 08:47:16 -0800 (PST)
In-Reply-To: <1455288361-30117-1-git-send-email-peter.maydell@linaro.org>
References: <1455288361-30117-1-git-send-email-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 25 Feb 2016 16:47:16 +0000
Message-ID: <CAFEAcA8hxP84gpGVnCfkzqVOj8==+tXGBcPo8ANChuKzKt0jNQ@mail.gmail.com>
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::231
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 0/4] virt: provide secure-only
	RAM and first flash
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
X-TUID: lYOrafKlGLaH

Ping? Review appreciated especially for the loader.c change...

thanks
-- PMM

On 12 February 2016 at 14:45, Peter Maydell <peter.maydell@linaro.org> wrote:
> This patchset adds some more secure-only devices to the virt board:
>  (1) a 16MB secure-only RAM
>  (2) the first flash device is secure-only
>
> The second of these is strictly speaking a breaking change, but I don't
> expect it in practice to break anybody:
>  (a) there's not much use of the secure support in virt yet
>  (b) anything booting a rom image from that flash if TZ is enabled
>   will be booting it in Secure mode anyway so will be able to access
>   the code -- the only thing that would stop working would be if the
>   guest flipped to NS and still expected to be able to access the flash
>
> The second flash device remains NS-accessible (with the expectation that
> it will be used for NS UEFI environment variable storage).
>
> In particular, the ATF+OPTEE+UEFI+Linux stack still works fine with
> these changes.
>
>
> NOTE: to get the -bios option to correctly load to the secure-only
> flash I had to implement a new function in loader.c. load_image_mr()
> is just like load_image_targphys() except that it requests loading
> to a MemoryRegion rather than a physaddr. I think we can also use this
> to clean up the Sparc cg3 and tcx display devices, which currently take
> a qdev property which is "the address I'm going to be mapped at"
> purely so they can use load_image_targphys() to load their ROMs.
>
> I have to say I found the loader.c code a bit confusing (it has some
> support for "load image to MR" already, but it seems to be tangled
> up with the fw_cfg and PC option rom support); review of that
> patch in particular appreciated.
>
> thanks
> -- PMM
>
> Peter Maydell (4):
>   hw/arm/virt: Provide a secure-only RAM if booting in Secure mode
>   loader: Add load_image_mr() to load ROM image to a MemoryRegion
>   hw/arm/virt: Load bios image to MemoryRegion, not physaddr
>   hw/arm/virt: Make first flash device Secure-only if booting secure
>
>  hw/arm/virt.c         | 118 ++++++++++++++++++++++++++++++++++++++------------
>  hw/core/loader.c      |  35 +++++++++++++--
>  include/hw/arm/virt.h |   1 +
>  include/hw/loader.h   |  18 +++++++-
>  4 files changed, 138 insertions(+), 34 deletions(-)
