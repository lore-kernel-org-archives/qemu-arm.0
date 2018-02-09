Received: by 10.28.71.27 with SMTP id u27csp1078809wma;
        Fri, 9 Feb 2018 07:47:54 -0800 (PST)
X-Google-Smtp-Source: AH8x2278QBKd1h430x7vQSYys9nhQsby17Its86POsa7TCcdNvcKgx+Lb1o1R4k7TIrzWgRduq9L
X-Received: by 10.13.208.197 with SMTP id s188mr2192841ywd.217.1518191274501;
        Fri, 09 Feb 2018 07:47:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518191274; cv=none;
        d=google.com; s=arc-20160816;
        b=c41+lxcxLaK5coBKH8glmlt+gJKl5z2Y4GCHMRuPaVzCIMebfaThUFIDo7Hj8cCpKl
         j7tmXiMltUbo53AQUG2HjiAorzkLnVdC0McuZtZk48uVRg5rT0Amn4nA4nibj2q13Jub
         i48DuUcJOSyKQLuEI4OWJyyFUKbDDlb7aUYCIfYOUHavLS2NiUOq63N7xQWT3dXVt9rw
         CzJTX/xHS2hHmz3SVwJfZx89ViEfGl3tc0c992DYxPeX7Oaib9qeBtuXUCGbFdoWNaWi
         u2w+4tLDHBwsObEsQTqKh0CoEYymb83C3KPHjks5GiPDMSUv56S7VzzbPcqQYJy92H6c
         rLDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=nV5tKreWi6MrKkTPhsoY4PP7F5ha1O0xr4E1GIfjUvY=;
        b=wNVLc4/IGphysVgyDZ0MOjgvvd24WcnXx6sxOou5zbEN1KrlsxnVpUyba8PkeovijG
         RAzB9TmXAi2j/J08ZLrn/8OV3PIYF3AcPHyYfoH5lmlctOVWmv0w2O4kdolU28rCzsFb
         mqstMyd+sBD1V3wJJazuXNn/NtFPafWO5BgDVcP1Ce6okAUel9OESxLy/hOC2Prttiq+
         p+1JUJY63okAcsB0FAktRq11aDw/yUj4Rf6JK7L9O5UaI55jKF7qW/5dRZknfWSCzY4M
         39zuY/adLlbuQywZHM/yfowGMA2UpA6xWuZdln5Ezv6gNRUfeRfO2dBukSaeSoQ0uP5Y
         uTtA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=W+N+FUFh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y125si444781ybc.91.2018.02.09.07.47.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 09 Feb 2018 07:47:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=W+N+FUFh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36015 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ekAu1-0005aF-OP
	for alex.bennee@linaro.org; Fri, 09 Feb 2018 10:47:53 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41934)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ekAaN-0004El-9q
	for qemu-arm@nongnu.org; Fri, 09 Feb 2018 10:27:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ekAaM-0000pA-Ch
	for qemu-arm@nongnu.org; Fri, 09 Feb 2018 10:27:35 -0500
Received: from mail-oi0-x244.google.com ([2607:f8b0:4003:c06::244]:37062)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ekAaM-0000oM-5w
	for qemu-arm@nongnu.org; Fri, 09 Feb 2018 10:27:34 -0500
Received: by mail-oi0-x244.google.com with SMTP id t78so6369383oih.4
	for <qemu-arm@nongnu.org>; Fri, 09 Feb 2018 07:27:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=nV5tKreWi6MrKkTPhsoY4PP7F5ha1O0xr4E1GIfjUvY=;
	b=W+N+FUFhGojcB2dh7smKfkvASZbudE5oHCTR+9100f9e0jVAB9cv7XrQni+u61vf7i
	qPHdsFHNgqvBkECWcr8jjc75UZa7R+Z0AXan9i93jkBe6wtK7IVs00ZgQUf/UylIg1EB
	rwa6HB3A49yl4MQDRPKi+8S6HAuDMJu6evXdM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=nV5tKreWi6MrKkTPhsoY4PP7F5ha1O0xr4E1GIfjUvY=;
	b=MSgFB4B9Vp+Trv/lsjJmj3EYYK1/BQv3ugksrtavruP8xnIjXVFxGLcJUOXQyJ3dPC
	3shWAOKzVCswwdeiP90Vjm1rHbP91Y4i4sJOUWnKCeQhz0jkK7Hkkcm+vo00SpFzS5UJ
	dTiqY6H24KFWwa2jjSlWKdbzb8fMyFFStYrmhXhk71JfQb/XXDJvJmBhjUlVR+TThbAi
	XXphKa8YjHZpMxjPu9QkO360YHJe07UAjYsIVMStHJSL0934bV6s1d5hQQQAfh1zvKWt
	0/SJzgGDxokRcHa5cwsZAn/8sTf7KnXeM9/6PH9STC+trbREnqE6qQ8itogdzJMKNURV
	SYpQ==
X-Gm-Message-State: APf1xPBMYAuWD/KMWe34YkndrA7494PezZF8GvS+Kx0Rszzgi1CmAy9I
	+Ai1yKmdFYhFfwnsqLjMoLAMqRdEg8BZQaGqlCkHpw==
X-Received: by 10.202.252.68 with SMTP id a65mr2098126oii.256.1518190053496;
	Fri, 09 Feb 2018 07:27:33 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.34.163 with HTTP; Fri, 9 Feb 2018 07:27:13 -0800 (PST)
In-Reply-To: <1518189456-2873-4-git-send-email-geert+renesas@glider.be>
References: <1518189456-2873-1-git-send-email-geert+renesas@glider.be>
	<1518189456-2873-4-git-send-email-geert+renesas@glider.be>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 9 Feb 2018 15:27:13 +0000
Message-ID: <CAFEAcA_Z1JH6RXp19g2N3rV3TGOTa7LzFctEScrENBYB8eAf3w@mail.gmail.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::244
Subject: Re: [Qemu-arm] [PATCH/RFC 3/5] hw/arm/virt: Allow dynamic sysbus
 devices again
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
Cc: Arnd Bergmann <arnd@arndb.de>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Magnus Damm <magnus.damm@gmail.com>, Alexander Graf <agraf@suse.de>,
	QEMU Developers <qemu-devel@nongnu.org>, linux-renesas-soc@vger.kernel.org,
	Auger Eric <eric.auger@redhat.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	Xiao Feng Ren <renxiaof@linux.vnet.ibm.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7ikDi+VA7PKk

On 9 February 2018 at 15:17, Geert Uytterhoeven <geert+renesas@glider.be> wrote:
> Allow the instantation of generic dynamic sysbus devices again, without
> the need to create a new device-specific vfio type.
>
> This is a partial revert of commit  6f2062b9758ebc64 ("hw/arm/virt:
> Allow only supported dynamic sysbus devices").
>
> Not-Yet-Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  hw/arm/virt.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index b334c82edae9fb1f..fa83784fc08ed076 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1596,6 +1596,7 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
>      mc->max_cpus = 255;
>      machine_class_allow_dynamic_sysbus_dev(mc, TYPE_VFIO_CALXEDA_XGMAC);
>      machine_class_allow_dynamic_sysbus_dev(mc, TYPE_VFIO_AMD_XGBE);
> +    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_SYS_BUS_DEVICE);
>      mc->block_default_type = IF_VIRTIO;
>      mc->no_cdrom = 1;
>      mc->pci_allow_0_address = true;

This needs a lot of justification. Dynamic sysbus is not supposed
to be for plugging any random sysbus device in, it's for vfio,
which needs special casing anyway to work right. (Overall it's
a terrible hack -- in an ideal world all vfio would use pci
or another probeable bus.)

thanks
-- PMM
