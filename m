Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp2030628lfi;
        Mon, 23 Mar 2020 16:09:01 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vsWwmRstCHZyxKZVpTkto5Hd85P3X/vMlrcr1B2zGUBOsE/xV5uplUxEm39q8H7d/NY9bUV
X-Received: by 2002:a05:620a:a12:: with SMTP id i18mr21035437qka.334.1585004941216;
        Mon, 23 Mar 2020 16:09:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585004941; cv=none;
        d=google.com; s=arc-20160816;
        b=pVSOdeni/JJfX3WCx6uVKRlfT//G3O1CKCL38Ea+TPOgkt/lC6UAXrsUl3tfC4Qrty
         gkQnaYQrq9JnORbNOMN14Fu9r9U6+NjhjwQUZX+xs3cwUfkTaegEuOj/R+3VkJ48yAGW
         PZTV5xrhviI8s2TMtrD6UuN+juIy9FajDhU0/0wTB/cH1NWZUpn12i73vuS8PvwB8mGg
         NI8ScXkaXY9EM0dcSBqvGYP9O95Vz+tM9Ztx+64X2+ZhPaKoF5/cxIfKPVFUtj2cAJk5
         2frc0XbarJvnnilFLDvfAb29gAzBkZNpQhqidFIOkuqzB/BYqjZJ2AiAhO2fMbmTEv27
         lA3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=xplLJ56MVWTvyGrI32x6Qz4ZpXbqBjG9ojd3SDfNrrk=;
        b=sEzg/NlkbrxRFwl4O9Dj5wu6Sr4DVL+au6/Nel3rZpZek3JdKkOLlN09F66t2OV8CP
         lEQQGHnsH45MAZUEw5jZ4CUpt5Y10Ff7iKvh5PLVdzlz3hZKit8ZTN5DB9amdXVoTM/G
         PpLqRTdCz+0tkELrYEWkCyBSDgYf5tHAWhhfDPYKi6VqzXNzYIgOGl4HErG1i0Tkvueo
         akvmLdY35UG+za5MUYpKxEJO6+M+ftSWTx9EZmh2L4SaMR1mIzX1RyeLQLVp0WiShX/H
         18gGWRIYFgTDvhGgT6lUiqVIXmzTXLxvKsxqES/wlcLO50YkPtTtHpNrJRr92e1kIc9X
         C3Mg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=LYC7F+Vf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e20si10238450qvm.142.2020.03.23.16.09.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Mar 2020 16:09:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=LYC7F+Vf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jGWBo-00015J-M2
	for alex.bennee@linaro.org; Mon, 23 Mar 2020 19:09:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49426)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.williamson@redhat.com>) id 1jGWBg-00013C-An
 for qemu-arm@nongnu.org; Mon, 23 Mar 2020 19:08:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.williamson@redhat.com>) id 1jGWBf-0007ve-7V
 for qemu-arm@nongnu.org; Mon, 23 Mar 2020 19:08:52 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:55426)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <alex.williamson@redhat.com>)
 id 1jGWBf-0007vP-4n
 for qemu-arm@nongnu.org; Mon, 23 Mar 2020 19:08:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585004930;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xplLJ56MVWTvyGrI32x6Qz4ZpXbqBjG9ojd3SDfNrrk=;
 b=LYC7F+VfzC4Q75hVaMyMWFH9l3prNvUWURbaD8PY6ZcDC0Li9r9ivj2/1qbi20VgyhiBWV
 06ftKCKkvluC37HWn5jII/q6Gui3rzM80vHf9ihpGPzof783opX2W4XBe+sG3h6BP+pzen
 bIauWYy7bfVKX0i7WKepXdk7hRbv5t8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-433-GCRnyuOSNfygB1WgDMKLxw-1; Mon, 23 Mar 2020 19:08:47 -0400
X-MC-Unique: GCRnyuOSNfygB1WgDMKLxw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 44103800D5B;
 Mon, 23 Mar 2020 23:08:45 +0000 (UTC)
Received: from w520.home (ovpn-112-162.phx2.redhat.com [10.3.112.162])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1105619C4F;
 Mon, 23 Mar 2020 23:08:36 +0000 (UTC)
Date: Mon, 23 Mar 2020 17:08:35 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Bharat Bhushan <bbhushan2@marvell.com>
Subject: Re: [PATCH v9 1/9] hw/vfio/common: Remove error print on mmio
 region translation by viommu
Message-ID: <20200323170835.5021f845@w520.home>
In-Reply-To: <20200323084617.1782-2-bbhushan2@marvell.com>
References: <20200323084617.1782-1-bbhushan2@marvell.com>
 <20200323084617.1782-2-bbhushan2@marvell.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 216.205.24.74
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
Cc: yang.zhong@intel.com, peter.maydell@linaro.org, kevin.tian@intel.com,
 tnowicki@marvell.com, mst@redhat.com, drjones@redhat.com, peterx@redhat.com,
 qemu-devel@nongnu.org, Eric Auger <eric.auger@redhat.com>,
 bharatb.linux@gmail.com, qemu-arm@nongnu.org, jean-philippe@linaro.org,
 linuc.decode@gmail.com, David Gibson <david@gibson.dropbear.id.au>,
 eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7Sxn5hXRrhUs

[Cc +dwg who originated this warning]

On Mon, 23 Mar 2020 14:16:09 +0530
Bharat Bhushan <bbhushan2@marvell.com> wrote:

> On ARM, the MSI doorbell is translated by the virtual IOMMU.
> As such address_space_translate() returns the MSI controller
> MMIO region and we get an "iommu map to non memory area"
> message. Let's remove this latter.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Signed-off-by: Bharat Bhushan <bbhushan2@marvell.com>
> ---
>  hw/vfio/common.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index 5ca11488d6..c586edf47a 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
> @@ -426,8 +426,6 @@ static bool vfio_get_vaddr(IOMMUTLBEntry *iotlb, void **vaddr,
>                                   &xlat, &len, writable,
>                                   MEMTXATTRS_UNSPECIFIED);
>      if (!memory_region_is_ram(mr)) {
> -        error_report("iommu map to non memory area %"HWADDR_PRIx"",
> -                     xlat);
>          return false;
>      }
>  

I'm a bit confused here, I think we need more justification beyond "we
hit this warning and we don't want to because it's ok in this one
special case, therefore remove it".  I assume the special case is that
the device MSI address is managed via the SET_IRQS ioctl and therefore
we won't actually get DMAs to this range.  But I imagine the case that
was in mind when adding this warning was general peer-to-peer between
and assigned and emulated device.  Maybe there's an argument to be made
that such a p2p mapping might also be used in a non-vIOMMU case.  We
skip creating those mappings and drivers continue to work, maybe
because nobody attempts to do p2p DMA with the types of devices we
emulate, maybe because p2p DMA is not absolutely reliable on bare metal
and drivers test it before using it.  Anyway, I need a better argument
why this is ok.  Thanks,

Alex

