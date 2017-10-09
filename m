Received: by 10.223.197.9 with SMTP id q9csp2696340wrf;
        Mon, 9 Oct 2017 10:48:05 -0700 (PDT)
X-Received: by 10.200.37.230 with SMTP id f35mr16879611qtf.335.1507571284972;
        Mon, 09 Oct 2017 10:48:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507571284; cv=none;
        d=google.com; s=arc-20160816;
        b=L2uQQgz89YDb/6C94h+ziJSFS5a5KYWdLOVakYOHYOkka6vgSrLM36p7U5XEUinW4G
         4XSQr5G11E1VBd2YDzQ1c92DnmV2K3ecUBqz/mfdktynkHmzRasnWZdm+I3TBQFXIGW8
         G1LtoGmvmfo/Nz1ccrSmSLzwMaLz9e+R193BZDUXhPiwBSEa4LV0OvLQsxJjTAP9HQ7J
         yBn5OZ3k8eA5bh/Ah1EHLetRRvSiw2NvXNgHuec7/0RJbU8C9OMn8q9iOGK4fpaAOl8I
         urA108CJNRDmFXeXi1mzPPqE0CV8Ks0iSFUigyVBqkJuMYmJl08NI61obh7XYsdxDAgX
         8tZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=XFbJpMRt8Jt+UpuZswtltTXHhY44TKYvwxtL6fvc//w=;
        b=Ssg8XfQS5ELqP66t+mRlRu9z4mkBFRi+VHLIwxsBXHEosTLXj1hwH210PLR61Tfeoi
         slkkZQ1wxZm9jq4FuNT75i42FsgxDF4V20CGEvwIE8cyY5KYgTeY5Zp2XuMqs8NJ9Jc2
         fv7HC9ZUbQAMDItu9BIOTgGTvI3nNPJKICl1V37zJi5NdSNzsQHMLZUJ3vYZBOqjvAma
         5jl4Uc7uq4PafX/q+MT0Z1S+1Mm4YvHlN0nZd59dnHhk7UtSuiAdP8R31hnFJXtC8RC7
         a2TaGtweis5KbtzTOjJVAnAm+QXy86IjdBj+cguI0aIOGUQ4cm9GEe6uBE5IePpkJi43
         Z/aA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XrSI5BJV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x2si1257673qkc.265.2017.10.09.10.48.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 09 Oct 2017 10:48:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XrSI5BJV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59112 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e1c9s-00073f-Gy
	for alex.bennee@linaro.org; Mon, 09 Oct 2017 13:48:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57207)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e1c9k-00073V-Cj
	for qemu-arm@nongnu.org; Mon, 09 Oct 2017 13:47:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e1c9j-000601-Kn
	for qemu-arm@nongnu.org; Mon, 09 Oct 2017 13:47:56 -0400
Received: from mail-wm0-x230.google.com ([2a00:1450:400c:c09::230]:54675)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1e1c9j-0005zZ-El
	for qemu-arm@nongnu.org; Mon, 09 Oct 2017 13:47:55 -0400
Received: by mail-wm0-x230.google.com with SMTP id i124so25594449wmf.3
	for <qemu-arm@nongnu.org>; Mon, 09 Oct 2017 10:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=XFbJpMRt8Jt+UpuZswtltTXHhY44TKYvwxtL6fvc//w=;
	b=XrSI5BJVUKYFlbmbZZWbo8LZfjwJBVuCYa4AnF6RZw7UHKLKLwTRO2i/0IiXsSemF5
	noMTixFN9X1h1qp6O+jFgAziSczPeiwgL+PqAyvhx4QM5VBdf11Z5EuqluipDbooxOKF
	edgeunJ13fauE7jj9+lXw9/ioEMqJVL8fbMZ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=XFbJpMRt8Jt+UpuZswtltTXHhY44TKYvwxtL6fvc//w=;
	b=DEd6sQSMfj8aH/zQlLcTL20d+f9MoxiTInm06m/wRvAYyf8sKMq2NwUQ7GmAWVBDpD
	78aTx5VORZB2D83Un3LgAXtaY1rCcsWYHSJbUHIeusztm5vOg0VE6S+HhldwbWbdOC9Q
	Jg2MJ4HprhXb6aO3FdlJ05veheh7wz1QQOgPP0Bd3fGL6lXCUWcxZ2NXxAvbcgZhmuae
	skuvXtx7QvtOm/Ntj1QuPBb8NikNyJVMf1Qs9pbLhCQ15Hd3nmAEqAW3+r/04X4Q+mnM
	/uGl6HmZHB34YC8hj3NtxmsSEN8ZsmfX5xvv71/Dy314aDZFq9Z3DuQQgKqgz035R6hV
	+5ZQ==
X-Gm-Message-State: AMCzsaXi26Wh6f1FSt3zvZOUdB+coA0dROE6+dxBk2ATMRujjnLVA738
	TbP2Ba3+2kQ78NvBn8yB4/C81ku8Rmm795W7zbaJEA==
X-Google-Smtp-Source: AOwi7QBEfCDRB75arylCEa4FftFpEim5Rpt7SqzsPkHGShMgW10z907BZiAJD5+UvfMw58SHGR9pHEEZuFkA1PGcb38=
X-Received: by 10.28.22.66 with SMTP id 63mr8630896wmw.11.1507571274323; Mon,
	09 Oct 2017 10:47:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.128.207 with HTTP; Mon, 9 Oct 2017 10:47:33 -0700 (PDT)
In-Reply-To: <1504286483-23327-16-git-send-email-eric.auger@redhat.com>
References: <1504286483-23327-1-git-send-email-eric.auger@redhat.com>
	<1504286483-23327-16-git-send-email-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 9 Oct 2017 18:47:33 +0100
Message-ID: <CAFEAcA-BfvNFMFpiQd-XwGPYGasV3D-w3oDcqfHRoAXOAT17Fg@mail.gmail.com>
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::230
Subject: Re: [Qemu-arm] [PATCH v7 15/20] hw/arm/sysbus-fdt: Pass the
 VirtMachineState to the node creation functions
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
Cc: Radha Mohan <mohun106@gmail.com>, Andrew Jones <drjones@redhat.com>,
	Trey Cain <tcain@qti.qualcomm.com>,
	Radha.Chintakuntla@cavium.com, Sunil.Goutham@cavium.com,
	"Michael S. Tsirkin" <mst@redhat.com>,
	jean-philippe.brucker@arm.com, Tomasz Nowicki <tn@semihalf.com>,
	Will Deacon <will.deacon@arm.com>, QEMU Developers <qemu-devel@nongnu.org>,
	Peter Xu <peterx@redhat.com>, Alex Williamson <alex.williamson@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	Christoffer Dall <christoffer.dall@linaro.org>,
	robin.murphy@arm.com, wtownsen@redhat.com,
	Bharat Bhushan <bharat.bhushan@nxp.com>,
	Prem Mallappa <prem.mallappa@gmail.com>, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1z03dlMITrtc

On 1 September 2017 at 18:21, Eric Auger <eric.auger@redhat.com> wrote:
> The VirtMachineState contains some dt phandles that will be used
> in some node creation functions. For instance we plan to use the
> PCI host controller phandle in the smmu node creation function. So
> let's pass the VirtMachineState handle down to the node creation
> functions by enhancing the involved datatypes.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>  hw/arm/sysbus-fdt.c         | 3 +++
>  hw/arm/virt.c               | 1 +
>  include/hw/arm/sysbus-fdt.h | 2 ++
>  3 files changed, 6 insertions(+)
>
> diff --git a/hw/arm/sysbus-fdt.c b/hw/arm/sysbus-fdt.c
> index d68e3dc..d92a983 100644
> --- a/hw/arm/sysbus-fdt.c
> +++ b/hw/arm/sysbus-fdt.c
> @@ -36,6 +36,7 @@
>  #include "hw/vfio/vfio-platform.h"
>  #include "hw/vfio/vfio-calxeda-xgmac.h"
>  #include "hw/vfio/vfio-amd-xgbe.h"
> +#include "hw/arm/virt.h"
>  #include "hw/arm/fdt.h"
>
>  /*
> @@ -47,6 +48,7 @@ typedef struct PlatformBusFDTData {
>      int irq_start; /* index of the first IRQ usable by platform bus devices */
>      const char *pbus_node_name; /* name of the platform bus node */
>      PlatformBusDevice *pbus;
> +    VirtMachineState *vms;
>  } PlatformBusFDTData;

sysbus-fdt isn't virt specific, so this doesn't belong here.

More generally, why is sysbus-fdt involved in this at all?
I expected that instantiating and wiring up the SMMU would
be the job of hw/arm/virt.c, like any other device we
might have on the board.

thanks
-- PMM
