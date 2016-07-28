Received: by 10.25.21.156 with SMTP id 28csp702339lfv;
        Thu, 28 Jul 2016 02:39:56 -0700 (PDT)
X-Received: by 10.55.161.4 with SMTP id k4mr42584929qke.87.1469698796098;
        Thu, 28 Jul 2016 02:39:56 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n28si7407806qtb.63.2016.07.28.02.39.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 28 Jul 2016 02:39:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51980 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bShnH-0008W0-Kh
	for alex.bennee@linaro.org; Thu, 28 Jul 2016 05:39:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53980)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bShnE-0008VE-DZ
	for qemu-arm@nongnu.org; Thu, 28 Jul 2016 05:39:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bShnD-00015e-GT
	for qemu-arm@nongnu.org; Thu, 28 Jul 2016 05:39:52 -0400
Received: from mail-vk0-x234.google.com ([2607:f8b0:400c:c05::234]:36597)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bShnD-00015U-C2
	for qemu-arm@nongnu.org; Thu, 28 Jul 2016 05:39:51 -0400
Received: by mail-vk0-x234.google.com with SMTP id n129so27983776vke.3
	for <qemu-arm@nongnu.org>; Thu, 28 Jul 2016 02:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:from:date:message-id:subject:to:cc;
	bh=gSiaDIcYA4t0OiwrtD22xuE3lzPKwHqboAQ8Cltz/kk=;
	b=clf4h7P6/1rvggtqLQkr7HvaHTBuhGjoMC2iIpah5LhUHOW84/12rdd6Hh+dXhLIWA
	9Sn5GwsNBi4kI9x67e2+px8f/4ckntxqMtU7VeGVH7g+8H9Mse1g5RSsBGQrYd+GNb7I
	g3bfqSU4TcdClM6Rfzuim6XI7rzQ7Nw+X7jMA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
	bh=gSiaDIcYA4t0OiwrtD22xuE3lzPKwHqboAQ8Cltz/kk=;
	b=YW9ie58LVDyzb3tfKf8/RXMQEOc4aG3Zmn379zNDOL9behwRg6hbzRiSwaxRgk1DpQ
	ZZfuumr63k5D9qmj2s9KJQ0akrpPeeIeixeh5WzOIU2psFKSbiOJoZ9PLUFK31ip1IAD
	N4skjz/Eo9/SR9Ek34xTqvm8SBNVQnSKGDUmzk7PDTO1ueuBjR245ZFVgT7sfxF6TdO/
	+dgkdgkOrxThNweLruEA9mKY7/+JlMTJHcaDGJjYn/b5woYZwAJX67MQ37gWMfbTZmmQ
	tfRnbnu66p6xearcjTjbXLmQ32Og/pfvN1twTtW7fApaP6rPpe7kxM4spRbWOOwbdVz0
	SFqw==
X-Gm-Message-State: AEkoouv8mMyfEn1JXUzwJHmPkth+7dY1APGbfPqcDf1gi7ErUKe9MibqsUY0HvYTsBqMJndxMSxqm5aHhwbUfIzc
X-Received: by 10.31.88.70 with SMTP id m67mr14533522vkb.108.1469698790820;
	Thu, 28 Jul 2016 02:39:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.137.136 with HTTP; Thu, 28 Jul 2016 02:39:31 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Jul 2016 10:39:31 +0100
Message-ID: <CAFEAcA_UPR+nyBPX2qSPiX1j=fVkg9-+7FCo2bxX7RpmftfNKQ@mail.gmail.com>
To: Alistair Francis <alistair.francis@xilinx.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::234
Subject: Re: [Qemu-arm] [PATCH v3 4/6] cadence_gem: Add queue support
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
Cc: Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: upG+/3oyJzy6

On 26 July 2016 at 19:25, Alistair Francis <alistair.francis@xilinx.com> wrote:
> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
> ---
>
> There is a indentation error in this patch in the gem_transmit function.
> I have written it like that to make it easier to see the changes. It is
> fixed in the next patch.

> @@ -1417,8 +1500,8 @@ static void gem_init(Object *obj)
>
>  static const VMStateDescription vmstate_cadence_gem = {
>      .name = "cadence_gem",
> -    .version_id = 3,
> -    .minimum_version_id = 3,
> +    .version_id = 4,
> +    .minimum_version_id = 4,
>      .fields = (VMStateField[]) {
>          VMSTATE_UINT32_ARRAY(regs, CadenceGEMState, CADENCE_GEM_MAXREG),
>          VMSTATE_UINT16_ARRAY(phy_regs, CadenceGEMState, 32),

This bit should have moved into the other patch with the change of
the CADENCE_GEM_MAXREG define, right?

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
