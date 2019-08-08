Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp7702237wrv;
        Thu, 8 Aug 2019 03:52:45 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwroq0epKmZkJ62aFfUrvT3KOOA+83ZmzRX7TrmzK1XYvchmc+fJyIhWzEPcEawT+wc6FM2
X-Received: by 2002:a50:a56b:: with SMTP id z40mr14641844edb.99.1565261565237;
        Thu, 08 Aug 2019 03:52:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565261565; cv=none;
        d=google.com; s=arc-20160816;
        b=gKrQqjqo7yLCl7bZUWrWQyIYs4BlGAPpBJCbm2QoP1Q9+Yk29Yj4/wmlV+svsBIuyk
         nKd6CXB/6T0aXEcpDnT/cmw0+pUk+ELxZs+3l+6UHfRJfr03b+z/qvJMRCvQujs+evIx
         QWBPbW8OMgA5/Pa8mxQ9zLyQCL4xpKesMwqkrnH1Sn+odddcPIenAcSloUVXotdWFh7J
         M1vOHeHwakWumIfkgKWcaTQpsE/lrEQIfUi0ZxDyru31qPIbJyLaWJ1b7Z6FJwF0skkT
         NG3k4C9C03YV9vHEDvGyq9LSejJGABvjRA/wy0sJfcXKu8oa0vfzp3m4eJWm28G9glTE
         IoWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:to:from:date;
        bh=qxp0TyGjNq4kUyAPdujgAtdw69a/mxbaZxjkJypL2tg=;
        b=h0WRfN9mNFrvR5MBZystspoCaLi9Pil40TtObkA+yWF0BJdrs65iTX35gRRFbnHQb0
         zgoITq3PCjwg9/4DJzkGsLWhnpvxep81aEoCyeVnlKQ8YBENYzTaZ8j4cqwR4i6XbP3k
         Dm0IRm+CuwnQELLOANBe9SCn3WFX511QYDDyPHQT6U41mTX8yD/6Nty3HmMCRDYBqeyj
         ybHTY2ML5wVpNaIkVUSIXtsXlY5rwvE6VBnQriAziX/tO28CvuwT74X5Dq+rXQB1d99f
         xVGPParbSixMP3DBnt7GWusnScikGcZi7MfwbO6TS77P2WxLvd+ehTAdObgNsrRBBgVo
         HTaA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 90si33488283edq.146.2019.08.08.03.52.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Aug 2019 03:52:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hvg2G-0004k1-Ax
	for alex.bennee@linaro.org; Thu, 08 Aug 2019 06:52:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38173)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <cohuck@redhat.com>) id 1hvg2B-0004ja-JI
 for qemu-arm@nongnu.org; Thu, 08 Aug 2019 06:52:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1hvg2A-0006PU-MT
 for qemu-arm@nongnu.org; Thu, 08 Aug 2019 06:52:39 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33636)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>)
 id 1hvg2A-0006PJ-Gd; Thu, 08 Aug 2019 06:52:38 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 917CAC08EC18;
 Thu,  8 Aug 2019 10:52:37 +0000 (UTC)
Received: from gondolin (dhcp-192-181.str.redhat.com [10.33.192.181])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 424D660BE1;
 Thu,  8 Aug 2019 10:52:22 +0000 (UTC)
Date: Thu, 8 Aug 2019 12:52:20 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Damien Hedde <damien.hedde@greensocs.com>
Message-ID: <20190808125220.7a84fbf0.cohuck@redhat.com>
In-Reply-To: <20190729145654.14644-27-damien.hedde@greensocs.com>
References: <20190729145654.14644-1-damien.hedde@greensocs.com>
 <20190729145654.14644-27-damien.hedde@greensocs.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.31]); Thu, 08 Aug 2019 10:52:37 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v3 26/33] hw/s390x/s390-pci-inst.c: remove
 device_legacy_reset call
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: fam@euphon.net, peter.maydell@linaro.org, walling@linux.ibm.com,
 dmitry.fleytman@gmail.com, mst@redhat.com, mark.cave-ayland@ilande.co.uk,
 qemu-devel@nongnu.org, kraxel@redhat.com, edgar.iglesias@xilinx.com,
 hare@suse.com, qemu-block@nongnu.org, david@redhat.com, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, marcel.apfelbaum@gmail.com,
 marcandre.lureau@redhat.com, rth@twiddle.net, thuth@redhat.com,
 ehabkost@redhat.com, alistair@alistair23.me, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, clg@kaod.org, jsnow@redhat.com,
 david@gibson.dropbear.id.au, berrange@redhat.com, mark.burton@greensocs.com,
 qemu-ppc@nongnu.org, pbonzini@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Nks26caeZDKE

On Mon, 29 Jul 2019 16:56:47 +0200
Damien Hedde <damien.hedde@greensocs.com> wrote:

> Replace S390PCIBusDevice legacy reset by device_reset_warm.
> 
> The new function propagates also the reset to the sub-buses tree.
> I'm not sure whether S390PCIBusDevice has bus children or not.

This should be fine, I think.

> 
> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
> ---
>  hw/s390x/s390-pci-inst.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/s390x/s390-pci-inst.c b/hw/s390x/s390-pci-inst.c
> index 93cda37c27..d7bca68245 100644
> --- a/hw/s390x/s390-pci-inst.c
> +++ b/hw/s390x/s390-pci-inst.c
> @@ -242,7 +242,7 @@ int clp_service_call(S390CPU *cpu, uint8_t r2, uintptr_t ra)
>                  stw_p(&ressetpci->hdr.rsp, CLP_RC_SETPCIFN_FHOP);
>                  goto out;
>              }
> -            device_legacy_reset(DEVICE(pbdev));
> +            device_reset_warm(DEVICE(pbdev));
>              pbdev->fh &= ~FH_MASK_ENABLE;
>              pbdev->state = ZPCI_FS_DISABLED;
>              stl_p(&ressetpci->fh, pbdev->fh);

