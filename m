Received: by 10.25.205.13 with SMTP id d13csp772581lfg;
        Fri, 16 Dec 2016 08:19:09 -0800 (PST)
X-Received: by 10.200.40.179 with SMTP id i48mr3798840qti.42.1481905149527;
        Fri, 16 Dec 2016 08:19:09 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d76si3508544qkc.278.2016.12.16.08.19.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 16 Dec 2016 08:19:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:33070 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cHvDu-0004f8-Qc
	for alex.bennee@linaro.org; Fri, 16 Dec 2016 11:19:06 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49536)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1cHvDp-0004az-FE
	for qemu-arm@nongnu.org; Fri, 16 Dec 2016 11:19:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1cHvDo-0001ZA-Mq
	for qemu-arm@nongnu.org; Fri, 16 Dec 2016 11:19:01 -0500
Received: from mail-lf0-x243.google.com ([2a00:1450:4010:c07::243]:33575)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <edgar.iglesias@gmail.com>)
	id 1cHvDi-0001Tf-Pa; Fri, 16 Dec 2016 11:18:54 -0500
Received: by mail-lf0-x243.google.com with SMTP id y21so1560641lfa.0;
	Fri, 16 Dec 2016 08:18:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=+s2izNPvgL1n15PBE0gfZxJJFNShxOdumQLnFuSsqGg=;
	b=awNIc1cchl7cIFGoBNUNAkVm803BJjbOSQqfcEZZ0p5fMPWMzRqv3YGxuHyFhjZ73C
	vwStugEW1DzV7JmSdvuu6KzijzUosQ4+cZNtzeyCSw9uAQgLWoxr9R606emx/00pB3Kg
	dN/uLGbM+l7eUhN3+Tco4RtnaiBDT8WGOkJ3wKZFOpd3Ld194+76+zgQQSTR2qAjk8/L
	XFPAbg2gCL/0aCsxfGnAG4lRRHIbVqzmSUuHEJdeSsKqRBqIvNQlBvAOyVwsCTgu/uhd
	mVtci/pos06eub6R3UeGdJxjl5vv/xu+gSj7RKOoqDXoXJx7WQED8tb0DTj9MZ18yG93
	Yxvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=+s2izNPvgL1n15PBE0gfZxJJFNShxOdumQLnFuSsqGg=;
	b=Ov7FsyvFfrhYzpcrO90ARsHh7ZCytzPauo+12zFwtiFHaxFzM1Fu9gSqJf/DbpFqVD
	MN5MFKfMFV5tL1MnnxWApVnByUJq26Zs+HfYwkGAWGTIBSud820u2YrC6//vNpQ5ybqn
	eZ0In9CB41IQokVWFtTvkhKOfOEoJcX509/EYiIzA0bRlbIOAdy7oEYQ/S3LUiuKoWrJ
	gej6qBmgONWO0Pnb75FaeBIFnBeF9Z01O/d9Y3OBAy/SfK+qrJpi+0aRYJnx0FEKN/2u
	K6kmz5yg4XrzG0gdUL/zqJ8Im8n33AYFnxnPUOZ/Wjz3Nal65Cynw4A+72ydM54svcB9
	+Xuw==
X-Gm-Message-State: AKaTC01oibTI8UQSsyVcswTRaHR5u9o6awKOfNG+5DbesSH8UoBibOPyejiUNr5uobN4ow==
X-Received: by 10.25.43.69 with SMTP id r66mr1216002lfr.158.1481905131951;
	Fri, 16 Dec 2016 08:18:51 -0800 (PST)
Received: from localhost (81-231-233-234-no56.tbcn.telia.com. [81.231.233.234])
	by smtp.gmail.com with ESMTPSA id
	r204sm1469785lfr.19.2016.12.16.08.18.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 16 Dec 2016 08:18:51 -0800 (PST)
Date: Fri, 16 Dec 2016 17:18:50 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: marcin.krzeminski@nokia.com
Message-ID: <20161216161850.GP9606@toto>
References: <1481894862-14102-1-git-send-email-marcin.krzeminski@nokia.com>
	<1481894862-14102-2-git-send-email-marcin.krzeminski@nokia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1481894862-14102-2-git-send-email-marcin.krzeminski@nokia.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::243
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 1/2] block: m25p80: Add Quad
 Page Program 4byte version op
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
Cc: peter.maydell@linaro.org, rfsw-patches@mlist.nokia.com,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org, clg@kaod.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RmUumTZ8gvOv

On Fri, Dec 16, 2016 at 02:27:41PM +0100, marcin.krzeminski@nokia.com wrote:
> From: Marcin Krzeminski <marcin.krzeminski@nokia.com>
> 
> Some flash chips has additional page program opcode that
> takes only 4 byte address. This commit adds support
> for such command in Qemu.
> 
> Signed-off-by: Marcin Krzeminski <marcin.krzeminski@nokia.com>

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>


> ---
>  hw/block/m25p80.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
> index d29ff4c..2bc7028 100644
> --- a/hw/block/m25p80.c
> +++ b/hw/block/m25p80.c
> @@ -325,6 +325,7 @@ typedef enum {
>      PP4_4 = 0x3e,
>      DPP = 0xa2,
>      QPP = 0x32,
> +    QPP_4 = 0x34,
>  
>      ERASE_4K = 0x20,
>      ERASE4_4K = 0x21,
> @@ -573,6 +574,7 @@ static inline int get_addr_length(Flash *s)
>     switch (s->cmd_in_progress) {
>     case PP4:
>     case PP4_4:
> +   case QPP_4:
>     case READ4:
>     case QIOR4:
>     case ERASE4_4K:
> @@ -606,6 +608,7 @@ static void complete_collecting_data(Flash *s)
>      switch (s->cmd_in_progress) {
>      case DPP:
>      case QPP:
> +    case QPP_4:
>      case PP:
>      case PP4:
>      case PP4_4:
> @@ -873,6 +876,7 @@ static void decode_new_cmd(Flash *s, uint32_t value)
>      case READ4:
>      case DPP:
>      case QPP:
> +    case QPP_4:
>      case PP:
>      case PP4:
>      case PP4_4:
> -- 
> 2.7.4
> 
> 
