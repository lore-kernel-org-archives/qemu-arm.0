Received: by 10.25.21.156 with SMTP id 28csp2663378lfv;
        Mon, 1 Aug 2016 07:34:15 -0700 (PDT)
X-Received: by 10.37.19.5 with SMTP id 5mr34951276ybt.141.1470062055759;
        Mon, 01 Aug 2016 07:34:15 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a31si20158143qtb.7.2016.08.01.07.34.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 01 Aug 2016 07:34:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50685 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bUEIJ-00025H-4s
	for alex.bennee@linaro.org; Mon, 01 Aug 2016 10:34:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59508)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bUEHC-0001Y7-Sq
	for qemu-devel@nongnu.org; Mon, 01 Aug 2016 10:33:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bUEHB-0005ho-IT
	for qemu-devel@nongnu.org; Mon, 01 Aug 2016 10:33:06 -0400
Received: from mail-oi0-x236.google.com ([2607:f8b0:4003:c06::236]:34935)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bUEHB-0005hd-Dw
	for qemu-devel@nongnu.org; Mon, 01 Aug 2016 10:33:05 -0400
Received: by mail-oi0-x236.google.com with SMTP id l72so194888748oig.2
	for <qemu-devel@nongnu.org>; Mon, 01 Aug 2016 07:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=C4WnhhRAjr9NUS7iKecw43vfD8KQOSQliHzRT1ivh5U=;
	b=hJ8J7pW/h1VSZVDKtOR5Jdm/Y3X5LgM+RpgbWf9BKGhBCW/65qiRmce+ERMeuHB22L
	yhbZ1UcImgot/nhvZxpK5bgZCePTjRNs2pIKLsdy/9bxOgZqkiEDvHkHskaf601FqIDo
	FJUVZkFYv+1QC2D9Dl0nTRDwuxRNkyyHY2prQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=C4WnhhRAjr9NUS7iKecw43vfD8KQOSQliHzRT1ivh5U=;
	b=EV3AJcTvBChZJSMItIBFbQhvIG7GirZ90f7RXHohRsHCY3pyIAN97YS1MaAkW8raBl
	jtvJPdjnwu2dHPbcCQpyyb6chS8NCwhdszeSYBntm4gV4auJHokHKDqP5obn+b7WUAWd
	jVutKTbR74W70ntWMtwPyUjO6mLeaHqKQaOewc7rN3WpW777VTIhPvtH39+My2aOJ6Gt
	ECQwrJsgqLflRMFC3ByZa7h8JYIL0jj92M+B3PkjCrapv/E5rFSBPF8xz3R/JsGHmAja
	AnO8fHG3jDQ2PYVDrPzXCxTudbkQXZSwvCR3o6UrkOjk2l6k0Nbg1uLYmRJkY55tkelX
	K2MQ==
X-Gm-Message-State: AEkooutQENHl83SA/wPYKLz3hqMBxFkN2ZVUk7iDh3o7YDOjB1k9c4XYvVNkaQotni2BklAWdCu2eCLX43ueejnD
X-Received: by 10.202.86.15 with SMTP id k15mr30497889oib.178.1470061984782;
	Mon, 01 Aug 2016 07:33:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.222.68 with HTTP; Mon, 1 Aug 2016 07:32:44 -0700 (PDT)
In-Reply-To: <69992ebef8db49ddc320cd9f5d9a60c95c593aa7.1467752513.git.alistair.francis@xilinx.com>
References: <69992ebef8db49ddc320cd9f5d9a60c95c593aa7.1467752513.git.alistair.francis@xilinx.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 1 Aug 2016 15:32:44 +0100
Message-ID: <CAFEAcA91DY4=MgXHC22rNogqPLiUqL+1oDis5mkuFGPkstKNeQ@mail.gmail.com>
To: Alistair Francis <alistair.francis@xilinx.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c06::236
Subject: Re: [Qemu-devel] [PATCH v1 1/1] MAINTAINERS: Update the Xilinx
 maintainers
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Edgar Iglesias <edgar.iglesias@xilinx.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OTSqgrhHKJYO

On 28 July 2016 at 17:55, Alistair Francis <alistair.francis@xilinx.com> wrote:
> Update the Xilinx maintainers documentation to simplify what we maintain
> and cover all of our upstream code.
>
> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>

Mailing list seems not to have got this one second time
around either -- maybe some spam filter dislikes the content
for some reason. Anyway, applied to master.

thanks
-- PMM


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
