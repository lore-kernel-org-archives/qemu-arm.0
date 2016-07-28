Received: by 10.25.21.156 with SMTP id 28csp905172lfv;
        Thu, 28 Jul 2016 09:50:49 -0700 (PDT)
X-Received: by 10.13.230.78 with SMTP id p75mr31783096ywe.187.1469724649377;
        Thu, 28 Jul 2016 09:50:49 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m76si8542673qke.275.2016.07.28.09.50.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 28 Jul 2016 09:50:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:54680 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bSoWG-0002gW-L8
	for alex.bennee@linaro.org; Thu, 28 Jul 2016 12:50:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48859)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1bSoWC-0002dl-2X
	for qemu-arm@nongnu.org; Thu, 28 Jul 2016 12:50:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1bSoW9-0007zz-Ux
	for qemu-arm@nongnu.org; Thu, 28 Jul 2016 12:50:43 -0400
Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241]:32988)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>)
	id 1bSoW6-0007za-Ce; Thu, 28 Jul 2016 12:50:38 -0400
Received: by mail-oi0-x241.google.com with SMTP id l9so5037743oih.0;
	Thu, 28 Jul 2016 09:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=psw5wuvnvNT9AQQjgDwkxsso/rh+H/b9abyzstgH4N4=;
	b=NHHwANuTbERpEwZflCp4ZyW8p6lWu4HAO75K6RRTg87zL0FCJ8qx7aZ5SRvPR7kRK8
	FTCw+Bp5tfZaTDj13bLSL661VBN5pWSLeQF+WlGEXzIZHPSoqH8mN6kIIGGIdV4MoIvZ
	GPDzrU3Pjc0z+XsRadDTPlnPtErOBFeAAS9C20MJFzv/UAzDR5C7G5p/cWHh6qjqcO07
	zIThwoipN82v/1J6HD0/+Bhm/bDZ72uqfba+KeyZ2QdkFB0Uqk/CgcxxAJsL5EOQW7Qe
	0rkGZLyJ61Gx8yWZN5Q2DI+0ad+eklYpXZmk290RuEKd2F+oFC3X6bnisBLEeMLepTll
	bDNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=psw5wuvnvNT9AQQjgDwkxsso/rh+H/b9abyzstgH4N4=;
	b=ei3ieibPAPCTcxBvknmv/qTWhhhViz1bLC6vHzhB7qHo2tGT+Py5HW1bJaKQQNpuxb
	LXsSvSZo3x3EX3OI2oC15WxffFIZpKnmyS3S8DCn6ordQ/HZ1eJXLjRi0qViHfBsP3vR
	dyWXdMqPA3+P5r6yoeVHk7A9A9PyslKFk1UIMTwd09z14V8nwk7POi7dQZe73CrEAJ1B
	r1vibs0nBnLoSHraoYlV2a9WKVFvBiX/t6/lMqX94iwnLNFBcnItAVeU1AqfeJPymcdF
	4Qvkz5uQTrIqSAplJmfZICmm3SMsjRsAwLv4XnvHKw8gbd8ebWhresxYTCnjJy2Lvi3F
	BrrQ==
X-Gm-Message-State: AEkoousDQ+ENlJO5Axg1nZ2EL60K3vg9UyoHeTszIVUpB0a6bddx2rfS8SIdiGTvRMdMfA8eeq5g/YV4i8wctw==
X-Received: by 10.202.68.6 with SMTP id r6mr21477433oia.53.1469724637898; Thu,
	28 Jul 2016 09:50:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.14.72 with HTTP; Thu, 28 Jul 2016 09:50:08 -0700 (PDT)
In-Reply-To: <69992ebef8db49ddc320cd9f5d9a60c95c593aa7.1467752513.git.alistair.francis@xilinx.com>
References: <69992ebef8db49ddc320cd9f5d9a60c95c593aa7.1467752513.git.alistair.francis@xilinx.com>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Thu, 28 Jul 2016 09:50:08 -0700
X-Google-Sender-Auth: 9VR6BtQ0Uk4EP53vEttmTiOHUHw
Message-ID: <CAKmqyKO3fR_dMQy=P7acVPjaXLUG96F4bfVYUPz3w45oKe747w@mail.gmail.com>
To: Alistair Francis <alistair.francis@xilinx.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c06::241
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v1 1/1] MAINTAINERS: Update the
 Xilinx maintainers
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
Cc: Edgar Iglesias <edgar.iglesias@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: loZ4KcIQfOMG

On Mon, Jul 11, 2016 at 4:22 PM, Alistair Francis
<alistair.francis@xilinx.com> wrote:
> Update the Xilinx maintainers documentation to simplify what we maintain
> and cover all of our upstream code.

This is the patch I was talking about. I can't find it in the web archive.

Thanks,

Alistair

>
> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
> ---
>
>  MAINTAINERS | 30 ++++++++++++++----------------
>  1 file changed, 14 insertions(+), 16 deletions(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 1d0e2c3..14183d3 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -449,23 +449,23 @@ S: Maintained
>  F: hw/*/versatile*
>
>  Xilinx Zynq
> +M: Edgar E. Iglesias <edgar.iglesias@gmail.com>
>  M: Alistair Francis <alistair.francis@xilinx.com>
> -M: Peter Crosthwaite <crosthwaite.peter@gmail.com>
>  L: qemu-arm@nongnu.org
>  S: Maintained
> -F: hw/arm/xilinx_zynq.c
> -F: hw/misc/zynq_slcr.c
> +F: hw/*/xilinx_*
>  F: hw/*/cadence_*
> -F: hw/ssi/xilinx_spips.c
> +F: hw/misc/zynq_slcr.c
> +F: include/hw/xilinx.h
> +X: hw/ssi/xilinx_*
>
>  Xilinx ZynqMP
>  M: Alistair Francis <alistair.francis@xilinx.com>
> -M: Peter Crosthwaite <crosthwaite.peter@gmail.com>
> +M: Edgar E. Iglesias <edgar.iglesias@gmail.com>
>  L: qemu-arm@nongnu.org
>  S: Maintained
> -F: hw/arm/xlnx-zynqmp.c
> -F: hw/arm/xlnx-ep108.c
> -F: include/hw/arm/xlnx-zynqmp.h
> +F: hw/*/xlnx*.c
> +F: include/hw/*/xlnx*.c
>
>  ARM ACPI Subsystem
>  M: Shannon Zhao <zhaoshenglong@huawei.com>
> @@ -948,14 +948,6 @@ S: Supported
>  F: hw/scsi/megasas.c
>  F: hw/scsi/mfi.h
>
> -Xilinx EDK
> -M: Edgar E. Iglesias <edgar.iglesias@gmail.com>
> -M: Alistair Francis <alistair.francis@xilinx.com>
> -M: Peter Crosthwaite <crosthwaite.peter@gmail.com>
> -S: Maintained
> -F: hw/*/xilinx_*
> -F: include/hw/xilinx.h
> -
>  Network packet abstractions
>  M: Dmitry Fleytman <dmitry@daynix.com>
>  S: Maintained
> @@ -1243,6 +1235,12 @@ F: docs/*qmp-*
>  F: scripts/qmp/
>  T: git git://repo.or.cz/qemu/armbru.git qapi-next
>
> +Register API
> +M: Alistair Francis <alistair.francis@xilinx.com>
> +S: Maintained
> +F: hw/core/register.c
> +F: include/hw/register.h
> +
>  SLIRP
>  M: Samuel Thibault <samuel.thibault@ens-lyon.org>
>  M: Jan Kiszka <jan.kiszka@siemens.com>
> --
> 2.7.4
>
>
