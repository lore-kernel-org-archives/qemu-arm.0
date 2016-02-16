Received: by 10.25.208.211 with SMTP id h202csp1453471lfg;
        Tue, 16 Feb 2016 10:21:53 -0800 (PST)
X-Received: by 10.140.102.232 with SMTP id w95mr24569318qge.21.1455646913524;
        Tue, 16 Feb 2016 10:21:53 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x4si41821105qkx.21.2016.02.16.10.21.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 Feb 2016 10:21:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:49326 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aVkG1-0005Qt-00
	for alex.bennee@linaro.org; Tue, 16 Feb 2016 13:21:53 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47009)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aVk99-00020J-Fy
	for qemu-arm@nongnu.org; Tue, 16 Feb 2016 13:14:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aVk98-0007CJ-HH
	for qemu-arm@nongnu.org; Tue, 16 Feb 2016 13:14:47 -0500
Received: from mail-vk0-x230.google.com ([2607:f8b0:400c:c05::230]:34597)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aVk98-0007Bw-Dk
	for qemu-arm@nongnu.org; Tue, 16 Feb 2016 13:14:46 -0500
Received: by mail-vk0-x230.google.com with SMTP id e185so140842235vkb.1
	for <qemu-arm@nongnu.org>; Tue, 16 Feb 2016 10:14:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=4fCrHA+T/raPTgU6hErGnSVZ6ELLCgjPbTwjA41jKnw=;
	b=iK6awEr/z51Oqx+in4XMvzq4RdCXKLHzGWXYEiM+PHdVpPtjMJrEYbX/aVxNLubkHO
	iCTwec17QOZApv0obxmUT+iqGu9ddmREuPujf8RqhUZ+Smz/BRxnhCZdgbK9gDjPtk0u
	YDdUkUYNKjZdp7m7/o/zNgnxhjqMVX/otn0LU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=4fCrHA+T/raPTgU6hErGnSVZ6ELLCgjPbTwjA41jKnw=;
	b=IgC4AVwb7RFcghhbd2FEHQMwDCBWYSzryNKL6prw5ABQoIHntWwwwob7EJtRjCibAt
	nG22R64jDf5StapkWVi5pnCudEz6ocqD0KdUF3sqvF0h2FR6b1D8yWx59MYEcBulyEkT
	tT8i2Ws8ltQiR4jpfRkZn3PLUY8zMRHMURSQhivMddIY5/niNOb9uEQEE7Jpnha35p73
	v83n8/4brIb8VJCLUmKNGQtYpPOPmE7U9JQrYWROlKD1DNWIN8EB+jUVLsT/2vU3reTI
	UFcR3spkQ4lJRPv9xiUpqvV6sN5lPPaMZsLYypebZfAWaf6mM1PBzfDQyYKxmcc55siV
	XtmQ==
X-Gm-Message-State: AG10YOSlOHTFUrBZVoJ3gCq5ssZN3PdwSCON5aSCAIXg8BAsFc+jSAzKChlarde/hnmcytkoMwa8ar81DqbeMvOs
X-Received: by 10.31.1.6 with SMTP id 6mr17301030vkb.139.1455646484866; Tue,
	16 Feb 2016 10:14:44 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.56.216 with HTTP; Tue, 16 Feb 2016 10:14:25 -0800 (PST)
In-Reply-To: <1454086429-4373-4-git-send-email-eric.auger@linaro.org>
References: <1454086429-4373-1-git-send-email-eric.auger@linaro.org>
	<1454086429-4373-4-git-send-email-eric.auger@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Feb 2016 18:14:25 +0000
Message-ID: <CAFEAcA_ZQu7Lecf4UTG+br9yfVr64m_51CtHqGry0K-DnQO+ZA@mail.gmail.com>
To: Eric Auger <eric.auger@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::230
Cc: eric.auger@st.com, Pranav Sawargaonkar <pranav.sawargaonkar@gmail.com>,
	Pavel Fedin <p.fedin@samsung.com>, QEMU Developers <qemu-devel@nongnu.org>,
	Alexander Graf <agraf@suse.de>,
	Bharat Bhushan <Bharat.Bhushan@freescale.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Christoffer Dall <christoffer.dall@linaro.org>
Subject: Re: [Qemu-arm] [RFC v2 3/8] Generic PCIe host bridge INTx
	determination for INTx routing
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
X-TUID: ZC0HYWmgZdwb

On 29 January 2016 at 16:53, Eric Auger <eric.auger@linaro.org> wrote:
> This patch stores information about assigned legacy interrupt numbers in
> GPEX host structure.
> This is used during GPEX INTx number determination from a pin during
> INTx routing.
>
> Signed-off-by: Pranavkumar Sawargaonkar <address@hidden>
> Signed-off-by: Tushar Jagad <address@hidden>
> ---
>  hw/arm/virt.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 15658f4..3839c68 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -826,6 +826,7 @@ static void create_pcie(const VirtBoardInfo *vbi, qemu_irq *pic,
>      char *nodename;
>      int i;
>      PCIHostState *pci;
> +    GPEXHost *s;
>
>      dev = qdev_create(NULL, TYPE_GPEX_HOST);
>      qdev_init_nofail(dev);
> @@ -861,8 +862,11 @@ static void create_pcie(const VirtBoardInfo *vbi, qemu_irq *pic,
>      /* Map IO port space */
>      sysbus_mmio_map(SYS_BUS_DEVICE(dev), 2, base_pio);
>
> +    s = GPEX_HOST(dev);
> +
>      for (i = 0; i < GPEX_NUM_IRQS; i++) {
>          sysbus_connect_irq(SYS_BUS_DEVICE(dev), i, pic[irq + i]);
> +        s->irq_num[i] = irq + i;
>      }

I don't think that the board code should be prodding stuff in the GPEXHost
struct like this -- device structs are supposed to be private to the
device implementation. If you need the information in the device then
you need to come up with a better API for this.

thanks
-- PMM
