Received: by 10.28.71.27 with SMTP id u27csp4941613wma;
        Tue, 27 Feb 2018 07:24:00 -0800 (PST)
X-Google-Smtp-Source: AH8x226KcSY6bvq+dArrAW/RItaGNoVdcerkv0dKd2dkrdauxmwD2pxsovnsIrRrMW0Hf/EtIxwu
X-Received: by 10.13.252.66 with SMTP id m63mr9508504ywf.503.1519745040676;
        Tue, 27 Feb 2018 07:24:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519745040; cv=none;
        d=google.com; s=arc-20160816;
        b=EnLMycn1JgG12XqslI2jwBMwy6AbVos1S/MjrLx1NChD0Bwmmw+Zuzf6r//pUEZLvC
         mfvFr0NhHpAUi+LPBpAMC2571gdRKL6SPE5KPDyHgW8tXwNR0r7gSxgM8QRrn2DUZ0BW
         z3A7VQIqhZePTRg0SvFYDklb6uWb92t99HANdaPfe8rVGJqe5qqAbrRfts73l4QF2DXv
         9sEyh7Jyq+iu2VHTm+ZWEHcyoUx2EjF3e2HvodMvKxtcZcQx5IyHgy8+w0zjM4PbAEG8
         0OiXzM7TDtaEidQbCdC+8sNreRJpv8Ba19vXHD0CLs9PhYHoyw7F/bSuyUG549lCR/W8
         ptCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date:arc-authentication-results;
        bh=QkNCuSL6gWDx7iL6KRLaGhDW0fVqPZZYw+aBgjyltNc=;
        b=NhAk8JYhN+Qs9VN/vPEOv2Aq2aodqLKePbwc3Zv6WSO2esmaMrJxvzJYcgRNJZrTIa
         LZo/bKx/htByXmWFuVKs/bpui0ac8lD54nOHJYk2dXEInXjXE3FFKEDOjY99O0vxeokK
         JP9ihlAT/7s6E0rrcyfqfKH7LcjBqtlD9E7JQ7R7ltXq/9wZ3HtbUz67idXhcp9GMQNJ
         sZ+/JFItxNMQ9KB+4Ae8lHYFwYDhkMrBenwZW13RCHDe/40Lf19ETAtGOWLntnnevY52
         uEbN4B03CAM6XK62oshEpmRIUkkWwNAReDbjjd1DtZ0lc0+92l0DN318ktvIExcY5npm
         aSIg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z127-v6si896692ybc.336.2018.02.27.07.24.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 27 Feb 2018 07:24:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38024 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eqh6m-0000Dr-4b
	for alex.bennee@linaro.org; Tue, 27 Feb 2018 10:24:00 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35699)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1eqgsf-00050m-88
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 10:09:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1eqgsZ-00024j-6A
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 10:09:25 -0500
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:48074 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1eqgsZ-00022q-0e; Tue, 27 Feb 2018 10:09:19 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1AAC8404084B;
	Tue, 27 Feb 2018 15:09:13 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D66DD2026E04;
	Tue, 27 Feb 2018 15:09:11 +0000 (UTC)
Date: Tue, 27 Feb 2018 16:09:10 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Auger Eric <eric.auger@redhat.com>
Message-ID: <20180227160910.44e1a51c@redhat.com>
In-Reply-To: <a431c9e9-5756-5fec-3bf5-716055202a5e@redhat.com>
References: <1519303376-92875-1-git-send-email-imammedo@redhat.com>
	<1519303376-92875-2-git-send-email-imammedo@redhat.com>
	<a431c9e9-5756-5fec-3bf5-716055202a5e@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Tue, 27 Feb 2018 15:09:13 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Tue, 27 Feb 2018 15:09:13 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'imammedo@redhat.com' RCPT:''
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
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
	Shannon Zhao <zhaoshenglong@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: n3ts0zaQb//L

On Tue, 27 Feb 2018 13:42:38 +0100
Auger Eric <eric.auger@redhat.com> wrote:

> Hi,
> 
> On 22/02/18 13:42, Igor Mammedov wrote:
> > SeaBIOS blob which is currently shipped with QEMU
> > doesn't need acpi-dsdt.aml nor is able to use it
> > and code that loaded it QEMU was removed by  
> as code that loaded it in QEMU was removed by?
Thanks, I'll fix it on respin.

> > (commit 9fb7aaaf4c "pc: drop external DSDT loading")
> > in 2013.
> > 
> > Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> > CC: Gerd Hoffmann <kraxel@redhat.com>  
> Otherwise
> Reviewed-by: Eric Auger <eric.auger@redhat.com>
> 
> Thanks
> 
> Eric
> > ---
> >  Makefile              |   1 -
> >  pc-bios/acpi-dsdt.aml | Bin 4405 -> 0 bytes
> >  2 files changed, 1 deletion(-)
> >  delete mode 100644 pc-bios/acpi-dsdt.aml
> > 
> > diff --git a/Makefile b/Makefile
> > index 90e05ac..f3a4cf9 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -648,7 +648,6 @@ bepo    cz
> >  ifdef INSTALL_BLOBS
> >  BLOBS=bios.bin bios-256k.bin sgabios.bin vgabios.bin vgabios-cirrus.bin \
> >  vgabios-stdvga.bin vgabios-vmware.bin vgabios-qxl.bin vgabios-virtio.bin \
> > -acpi-dsdt.aml \
> >  ppc_rom.bin openbios-sparc32 openbios-sparc64 openbios-ppc QEMU,tcx.bin QEMU,cgthree.bin \
> >  pxe-e1000.rom pxe-eepro100.rom pxe-ne2k_pci.rom \
> >  pxe-pcnet.rom pxe-rtl8139.rom pxe-virtio.rom \
> > diff --git a/pc-bios/acpi-dsdt.aml b/pc-bios/acpi-dsdt.aml
> > deleted file mode 100644
> > index 558c10f51ccbbf9ec2f47a4a998a7055059a8963..0000000000000000000000000000000000000000
> > GIT binary patch
> > literal 0
> > HcmV?d00001
> > 
> > literal 4405  
> > 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
> > U_=PAMqG*c36NN8|mMC`Mf01wzJpcdz
> >   

