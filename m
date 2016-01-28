Received: by 10.55.129.195 with SMTP id c186csp295885qkd;
        Thu, 28 Jan 2016 02:11:07 -0800 (PST)
X-Received: by 10.140.107.182 with SMTP id h51mr2320909qgf.53.1453975867342;
        Thu, 28 Jan 2016 02:11:07 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b68si3319602qkj.65.2016.01.28.02.11.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 28 Jan 2016 02:11:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:55020 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aOjXe-0004aY-VS
	for alex.bennee@linaro.org; Thu, 28 Jan 2016 05:11:06 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40444)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aOjXZ-0004Zw-2o
	for qemu-arm@nongnu.org; Thu, 28 Jan 2016 05:11:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aOjXY-0000Gh-4N
	for qemu-arm@nongnu.org; Thu, 28 Jan 2016 05:11:01 -0500
Received: from mail-vk0-x232.google.com ([2607:f8b0:400c:c05::232]:35000)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aOjXY-0000GQ-0Y
	for qemu-arm@nongnu.org; Thu, 28 Jan 2016 05:11:00 -0500
Received: by mail-vk0-x232.google.com with SMTP id e6so20866506vkh.2
	for <qemu-arm@nongnu.org>; Thu, 28 Jan 2016 02:11:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=1We1RfMCy1lHQm4kJCNGfUfmgM0Ovo3TCJgv4F8rOyk=;
	b=HoTJLp+LLD7E1KMGzUoZ+JrHsse8CSGhXfYzyQ+m+QdJPspxjAFU8Ay8xPy2rew8OH
	WAQG7KlX/4i0Op+6u1cDq2Egy9gOFRgyppiYM5PoeCNjNiBeVPjU6QgSk2f5N3SHY0mn
	zzn59+zxujSiU5EMjxCbzYUcJ+mWObEHF+foA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=1We1RfMCy1lHQm4kJCNGfUfmgM0Ovo3TCJgv4F8rOyk=;
	b=QWwdnZWaHz6p34ijT+WNEeFG9xl0A0MxsUbS0H5wbyxA+U4GYFYoxIDTs95eNANOng
	+peDRgJho1/8ZI1SRoGXpoRQYDCtK9qy0HX5/8+ni4pSXe6a32vovShBkMquIxN+MIzU
	TUZo+45/k4Lesq05DcSyzVLgpgkXkvMj4hgh+T45zjD5alaiJYa26TWx8H2XRvWH7fiw
	0FAVKZh7ep+5sYZhBFOMhacWYGWIoznMO8H6AIknme486xAJSgCTfcGbdXjH3LN4jng9
	z6Du6tBUH/E/yHRfFAYj54WOsxOJtOo8YHM+K2jZeiszVeeifwsG4XYtW0RuwmH+p+Ah
	R++w==
X-Gm-Message-State: AG10YOQCqUdsK2640VyVdapc4mwL+3TWZJd3ZH3yqf9Vlp8K6sGFOKaQ7MJkPzFQ7Kuj2/aPC6PaRNv7sRIomuJd
X-Received: by 10.31.194.130 with SMTP id s124mr1463480vkf.92.1453975859706;
	Thu, 28 Jan 2016 02:10:59 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.56.216 with HTTP; Thu, 28 Jan 2016 02:10:40 -0800 (PST)
In-Reply-To: <1453902715-25304-7-git-send-email-eric.auger@linaro.org>
References: <1453902715-25304-1-git-send-email-eric.auger@linaro.org>
	<1453902715-25304-7-git-send-email-eric.auger@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Jan 2016 10:10:40 +0000
Message-ID: <CAFEAcA9_wR=0+Mbq-7CiQAUSphRrLB70c4MeoDawpMUzbPHLQg@mail.gmail.com>
To: Eric Auger <eric.auger@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::232
Cc: eric.auger@st.com, pranav.sawargaonkar@gmail.com,
	Pavel Fedin <p.fedin@samsung.com>, QEMU Developers <qemu-devel@nongnu.org>,
	Alexander Graf <agraf@suse.de>,
	Bharat Bhushan <Bharat.Bhushan@freescale.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Christoffer Dall <christoffer.dall@linaro.org>
Subject: Re: [Qemu-arm] [RFC 6/7] hw: arm: virt: register reserved IOVA
	region
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
X-TUID: gLoDrutby2iV

On 27 January 2016 at 13:51, Eric Auger <eric.auger@linaro.org> wrote:
> Registers a 16x64kB reserved iova region. Currently this iova
> region is used by the kernel to map host MSI controller frames
> (GICv2m, GITS_TRANSLATER).

Do you mean the host kernel or the guest kernel? The host
kernel should be keeping its paws out of the guest's
address space, and the guest kernel can manage the memory
and the address space any way it likes, I would have thought.
It's not clear to me what this is for.

> Signed-off-by: Eric Auger <eric.auger@linaro.org>
> ---
>  hw/arm/virt.c         | 10 ++++++++++
>  include/hw/arm/virt.h |  1 +
>  2 files changed, 11 insertions(+)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 3839c68..7eaf8be 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -125,6 +125,7 @@ static const MemMapEntry a15memmap[] = {
>      [VIRT_GPIO] =               { 0x09030000, 0x00001000 },
>      [VIRT_SECURE_UART] =        { 0x09040000, 0x00001000 },
>      [VIRT_MMIO] =               { 0x0a000000, 0x00000200 },
> +    [VIRT_RESERVED] =           { 0x0be00000, 0x00100000 },
>      /* ...repeating for a total of NUM_VIRTIO_TRANSPORTS, each of that size */

You've put the new entry between the VIRT_MMIO line and the comment that
is associated with it.

thanks
-- PMM
