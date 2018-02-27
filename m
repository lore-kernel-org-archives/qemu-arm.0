Received: by 10.28.71.27 with SMTP id u27csp4778987wma;
        Tue, 27 Feb 2018 04:43:04 -0800 (PST)
X-Google-Smtp-Source: AG47ELtOd4bvSk2QdUtn3vmDgG6tFV+4AV7PEqlI3O41yFHOuLS3tHAVsteqmprhZM82NLtXbXm2
X-Received: by 2002:a25:a02:: with SMTP id 2-v6mr9570304ybk.155.1519735384349;
        Tue, 27 Feb 2018 04:43:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519735384; cv=none;
        d=google.com; s=arc-20160816;
        b=a27ZnXe0LUH/gq94lsrlN2QuMWOIypOITJVUV3h35w6ytpBDSxvD2Fz+7/GCJE3kqS
         XOwlRsX8hMQyEeJdkkyHLq26vHa5vGwF+/fjFU5vTyOtQgcyhGn4VJFh8vKBUGLQEPBl
         PpaoZkwGFPtXCFJXwCWbB7RPHVbF9sFPN75Y3TveUuSERFJYJja49T4Wi/RDG2cJWy1J
         /97ah/GEOerNDh4oZ2g0XQfU0thh9pGCNNsUZVki87DwU8h0QTAmreMOQlTAanNZvN/w
         10K3oPoz3oVFBr1RwR45TCrDRWgRTD7NurIqRfU3t41yTHDLJRVATO6MoT3aNBZ9uJ0a
         kUyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=OI02yUZy7D8PipgMrV7yrQauM+u8xTl63Nfk/I/lfA4=;
        b=GEysn7deTxgfGViIufJ+Bv0FbOXXD18/Sy29UeqpZtj5iV67QdDvbr1SDTRZA66Tte
         06CijbNlJ20ARlDzwcPBuVykyuyyTXtZd7Fp/T7plG8rET1lW3lcH+Z3BeF8Jdw1IL5z
         +83EvpVQ9h4awEepNESlU0MVDBnDLtVoTBHV5375S4ow+qJwV5DF0jAvM6hD/9gwmk3k
         8vUL6FvUv0KMRg6I7RYFYHOkuKMmkvGode9FETRT241ZJ6yDSf5oo7BTzgCs2PsPEaCo
         D7uoY4YF3Of3/JHyQfhn67gJTJiqtVdgoZ7YSvUokhC2Euo3o4Q9YHc0euBf1ADMCRu5
         u3HA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p17-v6si1742185ybe.801.2018.02.27.04.43.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 27 Feb 2018 04:43:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36595 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eqeb1-0002Ig-PF
	for alex.bennee@linaro.org; Tue, 27 Feb 2018 07:43:03 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53695)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1eqean-0002GU-4E
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 07:42:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1eqeaj-0002NJ-Vt
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 07:42:49 -0500
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:36464 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1eqeaj-0002N5-PN; Tue, 27 Feb 2018 07:42:45 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4A1D48D6EA;
	Tue, 27 Feb 2018 12:42:45 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-135.ams2.redhat.com
	[10.36.116.135])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C828F1C71D;
	Tue, 27 Feb 2018 12:42:39 +0000 (UTC)
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
References: <1519303376-92875-1-git-send-email-imammedo@redhat.com>
	<1519303376-92875-2-git-send-email-imammedo@redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <a431c9e9-5756-5fec-3bf5-716055202a5e@redhat.com>
Date: Tue, 27 Feb 2018 13:42:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1519303376-92875-2-git-send-email-imammedo@redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Tue, 27 Feb 2018 12:42:45 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Tue, 27 Feb 2018 12:42:45 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 1/9] acpi: remove unused
 acpi-dsdt.aml
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-arm@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>, Shannon Zhao <zhaoshenglong@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lFve20V86H4A

Hi,

On 22/02/18 13:42, Igor Mammedov wrote:
> SeaBIOS blob which is currently shipped with QEMU
> doesn't need acpi-dsdt.aml nor is able to use it
> and code that loaded it QEMU was removed by
as code that loaded it in QEMU was removed by?
> (commit 9fb7aaaf4c "pc: drop external DSDT loading")
> in 2013.
> 
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> CC: Gerd Hoffmann <kraxel@redhat.com>
Otherwise
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric
> ---
>  Makefile              |   1 -
>  pc-bios/acpi-dsdt.aml | Bin 4405 -> 0 bytes
>  2 files changed, 1 deletion(-)
>  delete mode 100644 pc-bios/acpi-dsdt.aml
> 
> diff --git a/Makefile b/Makefile
> index 90e05ac..f3a4cf9 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -648,7 +648,6 @@ bepo    cz
>  ifdef INSTALL_BLOBS
>  BLOBS=bios.bin bios-256k.bin sgabios.bin vgabios.bin vgabios-cirrus.bin \
>  vgabios-stdvga.bin vgabios-vmware.bin vgabios-qxl.bin vgabios-virtio.bin \
> -acpi-dsdt.aml \
>  ppc_rom.bin openbios-sparc32 openbios-sparc64 openbios-ppc QEMU,tcx.bin QEMU,cgthree.bin \
>  pxe-e1000.rom pxe-eepro100.rom pxe-ne2k_pci.rom \
>  pxe-pcnet.rom pxe-rtl8139.rom pxe-virtio.rom \
> diff --git a/pc-bios/acpi-dsdt.aml b/pc-bios/acpi-dsdt.aml
> deleted file mode 100644
> index 558c10f51ccbbf9ec2f47a4a998a7055059a8963..0000000000000000000000000000000000000000
> GIT binary patch
> literal 0
> HcmV?d00001
> 
> literal 4405
> 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
> U_=PAMqG*c36NN8|mMC`Mf01wzJpcdz
> 
