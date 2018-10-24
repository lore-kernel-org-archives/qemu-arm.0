Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp497720wrt;
        Wed, 24 Oct 2018 04:40:11 -0700 (PDT)
X-Google-Smtp-Source: AJdET5exo8w0zgxGxbuq466Xy7QGNSfP416O1kXctj0iIgT1TJujvMSqouBo+vlNlbee83rgH12Q
X-Received: by 2002:a37:182a:: with SMTP id j42mr1875165qkh.83.1540381211270;
        Wed, 24 Oct 2018 04:40:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540381211; cv=none;
        d=google.com; s=arc-20160816;
        b=UBosZaik2gx7I7wRp6HAuPLyy5RoGEZ575HgIQ/Ml/Z57r/DsOr6YtanonPa7tOgJK
         7v8/FlGtkoxgIVNowxbd/DMetFl9iMD+/yZDf/HwDpViYqGLfq8q8VyhVCjYHdbmRKeP
         wcwrXMsSEwc6N2Ip4FG+G9lao89GA4nT8LmIzusrA9pbD2p4tj7WDsIJit7cXVMfzMI9
         PwmYXIgT5SEo7UDa7CFVSb1V1fg4IrMgR8Uipj2eYxyRtsnXd3NzOsCDCbf7Fwg3nSlg
         gIwTlJ/0j07PphK5t9yVZ6xUNC8rgjv6qG+GrqBjDABzm5PJPLApzcwOuSjpxd0tcVwC
         Sr+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=2LDZThc3dp3Vtr/oFZEiNBhenqoyrEIJyESGovuT+A8=;
        b=1GnGiwj476g4fJQTGvnM9wFCrgxBXvzaL0uBL/3pAgwVjl0pSVnEQ6wfD0kQBCy50v
         p5Er3hIpOyctYaHhQWjDCFbLAxVZwJd/z9NX3By8t9bBK18DiqlKjsdCjOkLS4nvaXYM
         x7RcaGs0xC6qU4S3m0QgHw50jQT/itb0bpN56AtuGiiB7MMkeulgmLtBoaQxNPGh/RI2
         Mu48IuVQY8gytOArtj1CwuFnx2hGYAQDWjJTpAPKMnCMRI7AIswr/fEVyaUUMNEo87Mx
         VxdmbBI7h93QjAmH9ODcUr9pioHW/z+fCdM4t1TjedKurr8ZZRol5Hpe7yu/iLNSBUcT
         zowg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z9si3677477qvg.165.2018.10.24.04.40.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 24 Oct 2018 04:40:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47650 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gFHWE-0005Hk-Ml
	for alex.bennee@linaro.org; Wed, 24 Oct 2018 07:40:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46187)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1gFHST-0000w4-Lp
	for qemu-devel@nongnu.org; Wed, 24 Oct 2018 07:36:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1gFHIF-0006kT-41
	for qemu-devel@nongnu.org; Wed, 24 Oct 2018 07:25:43 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53040)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1gFHI9-0006Zm-Li; Wed, 24 Oct 2018 07:25:37 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B1BCB307D864;
	Wed, 24 Oct 2018 11:25:33 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.205.115])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5AA5B5DD64;
	Wed, 24 Oct 2018 11:25:28 +0000 (UTC)
Date: Wed, 24 Oct 2018 12:25:25 +0100
From: Andrew Jones <drjones@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Message-ID: <20181024112525.wdysex6exqd5aued@kamzik.brq.redhat.com>
References: <20181024085602.16611-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181024085602.16611-1-eric.auger@redhat.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.48]);
	Wed, 24 Oct 2018 11:25:33 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH] hw/arm/virt: Set VIRT_COMPAT_3_0 compat
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cBPlREsCOge2

On Wed, Oct 24, 2018 at 10:56:02AM +0200, Eric Auger wrote:
> We are missing the VIRT_COMPAT_3_0 definition and setting.
> Let's add them.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>  hw/arm/virt.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 9f677825f9..a2b8d8f7c2 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1871,6 +1871,9 @@ static void virt_machine_3_1_options(MachineClass *mc)
>  }
>  DEFINE_VIRT_MACHINE_AS_LATEST(3, 1)
>  
> +#define VIRT_COMPAT_3_0 \
> +    HW_COMPAT_3_0
> +
>  static void virt_3_0_instance_init(Object *obj)
>  {
>      virt_3_1_instance_init(obj);
> @@ -1879,6 +1882,7 @@ static void virt_3_0_instance_init(Object *obj)
>  static void virt_machine_3_0_options(MachineClass *mc)
>  {
>      virt_machine_3_1_options(mc);
> +    SET_MACHINE_COMPAT(mc, VIRT_COMPAT_3_0);
>  }
>  DEFINE_VIRT_MACHINE(3, 0)
>  
> -- 
> 2.17.2
> 
>

Oops, I should have done this with the 3.1 machine type. Thanks for the
catching and patching.

Reviewed-by: Andrew Jones <drjones@redhat.com>
