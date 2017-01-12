Received: by 10.25.205.13 with SMTP id d13csp1450408lfg;
        Thu, 12 Jan 2017 13:42:03 -0800 (PST)
X-Received: by 10.55.42.41 with SMTP id q41mr17060154qkh.169.1484257323832;
        Thu, 12 Jan 2017 13:42:03 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l5si7017059qtf.58.2017.01.12.13.42.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 12 Jan 2017 13:42:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:36827 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cRn8F-0001oC-C1
	for alex.bennee@linaro.org; Thu, 12 Jan 2017 16:42:03 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36366)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1cRn8B-0001m5-UC
	for qemu-arm@nongnu.org; Thu, 12 Jan 2017 16:42:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1cRn88-0002UE-0S
	for qemu-arm@nongnu.org; Thu, 12 Jan 2017 16:41:59 -0500
Received: from mail-lf0-x241.google.com ([2a00:1450:4010:c07::241]:36025)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <edgar.iglesias@gmail.com>)
	id 1cRn87-0002U2-PS; Thu, 12 Jan 2017 16:41:55 -0500
Received: by mail-lf0-x241.google.com with SMTP id h65so3540563lfi.3;
	Thu, 12 Jan 2017 13:41:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=age80aTZeueuDqmHD5jiH6B2s4d2QqpfAOKLvFKgmZ0=;
	b=PXmlAht3lAjXYrQ5WMvsQA3RgefDwXNPCTKlDo7ZvYLJvL2dmgzQ/q4IQNqbsmkkn+
	xNSQ0yAOxqpf1f5kWUHjcpddJAOXloiE9WdFnpbj3g9mObxjdGQsko7dlDKBvDbc+Hml
	SQFwCV2uqqxQQVXF548zg7KK0JWxx23pyHspAP2rn8sjq/jT465+PBdoQRHm6m/kZsUC
	0sHJkPhDKOUJ1dtvdFbbkukCJ+FOIEMqJYPkjU2/I3FL7srmt9tBVtvt9utucem+0t9O
	tLQmmIdm9mM/mn36H9hz6vlpBrbV80b0XZwc9r8V6LAtAi2+Ot6LXTLIyiqzaGPxNiKP
	EPkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=age80aTZeueuDqmHD5jiH6B2s4d2QqpfAOKLvFKgmZ0=;
	b=c7ssiGjjtEdYECzSEHq/TlfwqhW4DznP/Nt3t1iHmPXc0RmDFo7lfGnYdjSRodIxGo
	AG1KH3KWaonrs2va/Fl8wbdEMq3kb1gZz3p+2jF2DWeIbdEDQWHeIi2mGYw54nNkwpDM
	8E21WCxyFC+4jhsNHVCaTqerLrINLdN2Lk+OwgGs651KRSb71WXma8MEoKbSTBeZMnIh
	gYetEcLA5jcM/2J7UHLkXMO/Ox2E920J6BoBKME1VMb8g4Ra+hkDkURYYppTUYvniJd4
	ZAiMyqv12wnFlMoXWqB+i5A1c8c/RsTS48zbaoMV64aRwIgKmqkfQ+g7F2fhcGWfCTFK
	7sPg==
X-Gm-Message-State: AIkVDXLtxD3ubdWJcc2QdgHQsmMyV32aYMZ5A+yRpaucokASgFBgPv/FpPnEfP6qKpJpBQ==
X-Received: by 10.46.8.10 with SMTP id 10mr1801291lji.21.1484257314130;
	Thu, 12 Jan 2017 13:41:54 -0800 (PST)
Received: from localhost (81-231-233-234-no56.tbcn.telia.com. [81.231.233.234])
	by smtp.gmail.com with ESMTPSA id
	h15sm2917205ljb.46.2017.01.12.13.41.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Jan 2017 13:41:53 -0800 (PST)
Date: Thu, 12 Jan 2017 22:41:52 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20170112214152.GB9606@toto>
References: <1484073849-32666-1-git-send-email-peter.maydell@linaro.org>
	<1484073849-32666-3-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1484073849-32666-3-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::241
Subject: Re: [Qemu-arm] [PATCH 2/3] target/arm: Handle VIRQ and VFIQ in
 arm_cpu_do_interrupt_aarch32()
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XPqKUGJ0i6bo

On Tue, Jan 10, 2017 at 06:44:08PM +0000, Peter Maydell wrote:
> To run a VM in 32-bit EL1 our AArch32 interrupt handling code
> needs to be able to cope with VIRQ and VFIQ exceptions.
> These behave like IRQ and FIQ except that we don't need to try
> to route them to Monitor mode.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

We could possibly avoid some duplication with EXCP_IRQ and _FIQ
but either way works:

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>


> ---
>  target/arm/helper.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 8dcabbf..dc90986 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -6403,6 +6403,20 @@ static void arm_cpu_do_interrupt_aarch32(CPUState *cs)
>          }
>          offset = 4;
>          break;
> +    case EXCP_VIRQ:
> +        new_mode = ARM_CPU_MODE_IRQ;
> +        addr = 0x18;
> +        /* Disable IRQ and imprecise data aborts.  */
> +        mask = CPSR_A | CPSR_I;
> +        offset = 4;
> +        break;
> +    case EXCP_VFIQ:
> +        new_mode = ARM_CPU_MODE_FIQ;
> +        addr = 0x1c;
> +        /* Disable FIQ, IRQ and imprecise data aborts.  */
> +        mask = CPSR_A | CPSR_I | CPSR_F;
> +        offset = 4;
> +        break;
>      case EXCP_SMC:
>          new_mode = ARM_CPU_MODE_MON;
>          addr = 0x08;
> -- 
> 2.7.4
> 
