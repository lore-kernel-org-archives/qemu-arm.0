Received: by 10.28.71.27 with SMTP id u27csp2527606wma;
        Thu, 8 Feb 2018 12:46:38 -0800 (PST)
X-Google-Smtp-Source: AH8x224QiWDtwmiSX4bvwm0shn/SYQDjCr5hyXtH2HWE8T3lCZ+Xw94QaX+KeoAJOO1wms9Q164F
X-Received: by 10.37.177.148 with SMTP id h20mr251981ybj.376.1518122798080;
        Thu, 08 Feb 2018 12:46:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518122798; cv=none;
        d=google.com; s=arc-20160816;
        b=I795caUGPUk+noW+s59gHuqAIPQPS3rHED9QPk15/LV6+Qx04D7xsIXOERmkpnyYSB
         7UGGR6PDjevdpcNHUSpysNhjReLoDwtPhNWdST0zCpteHUQg1tveghn0u8GwBDAW1K91
         b86x0Qno9f+9lePM31bTAfzXATJIYxAAwb1YEUO1CckmkJ8dvpXvEzxRus08DxF7yupT
         /frStBU370G9HaXk/ub4uS+kdUph4iuli5zrVk7MEXlKsrc+mL7DhxyeWVsfzL2/QbQu
         Teckj0DRvhPFT/C+lkv7jrAmABPYv2XlZ6uhFuspgfadh28XO1X+AnwQ26wjIVvtRhpu
         YvpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=U57Jp2k6U1w41DMKhEia7lTgOD9qpt9leeHP/k6L1Z4=;
        b=A62X5xxJC9vssUQkks5U1TqTW5GF8xxmQejEK4/DqYwB8Crkoz1s9JySNIoz+x9hQF
         dhKgiGkKy0O5ixV3MWxO3lJ6b70eOvbpXewDyw2kSCbxx5fseheRvhY4mR4te1Ipratt
         usF8B+WNlLdPBXsum65w7e9njv2TQRW0aDVpxuUKMAradOnJQiEOTyasBQVaoRnb6NqF
         IcVy87wPqkq2n6vLmT6ve34fJcZJALDzoy/nNeoKxT+zXl3Lyba4QHLcB6LLA7p9aDfV
         iCbjHHkoCWxaHm+NMUAK0iw/Mi2aWR+DiWLD25VDCJnVK6qi8UqYK2JkDcMR7Yjc78XN
         +lJw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 80si132415ywh.548.2018.02.08.12.46.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 08 Feb 2018 12:46:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47628 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ejt5Y-0002ms-I6
	for alex.bennee@linaro.org; Thu, 08 Feb 2018 15:46:37 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45832)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1ejsY4-0004Jc-66
	for qemu-arm@nongnu.org; Thu, 08 Feb 2018 15:12:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1ejsY0-0003Hk-RQ
	for qemu-arm@nongnu.org; Thu, 08 Feb 2018 15:12:00 -0500
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:52678 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mst@redhat.com>)
	id 1ejsY0-0003HX-Lc; Thu, 08 Feb 2018 15:11:56 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4295F80125D6;
	Thu,  8 Feb 2018 20:11:56 +0000 (UTC)
Received: from redhat.com (ovpn-120-144.rdu2.redhat.com [10.10.120.144])
	by smtp.corp.redhat.com (Postfix) with SMTP id 7A1662166BAE;
	Thu,  8 Feb 2018 20:11:54 +0000 (UTC)
Date: Thu, 8 Feb 2018 22:11:54 +0200
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Andrey Smirnov <andrew.smirnov@gmail.com>
Message-ID: <20180208221121-mutt-send-email-mst@kernel.org>
References: <20180207042438.15422-1-andrew.smirnov@gmail.com>
	<20180207042438.15422-11-andrew.smirnov@gmail.com>
	<20180208194226-mutt-send-email-mst@kernel.org>
	<CAHQ1cqGZHie0sYudPGr-15LOEjMRT05=0+tsViKfCJBnN96Nag@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHQ1cqGZHie0sYudPGr-15LOEjMRT05=0+tsViKfCJBnN96Nag@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Thu, 08 Feb 2018 20:11:56 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Thu, 08 Feb 2018 20:11:56 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'mst@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [PATCH v5 10/14] pci: Add support for Designware IP
 block
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@zoho.com>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	"open list:ARM" <qemu-arm@nongnu.org>, Andrey Yurovsky <yurovsky@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 22NmoQuY69mZ

On Thu, Feb 08, 2018 at 12:03:04PM -0800, Andrey Smirnov wrote:
> >> +#define PCIE_PORT_LINK_CONTROL          0x710
> >> +
> >> +#define PCIE_PHY_DEBUG_R1               0x72C
> >> +#define PCIE_PHY_DEBUG_R1_XMLH_LINK_UP  BIT(4)
> >> +
> >> +#define PCIE_LINK_WIDTH_SPEED_CONTROL   0x80C
> >> +#define PORT_LOGIC_SPEED_CHANGE         (0x1 << 17)
> >> +
> >> +#define PCIE_MSI_ADDR_LO                0x820
> >> +#define PCIE_MSI_ADDR_HI                0x824
> >> +#define PCIE_MSI_INTR0_ENABLE           0x828
> >> +#define PCIE_MSI_INTR0_MASK             0x82C
> >> +#define PCIE_MSI_INTR0_STATUS           0x830
> >> +
> >> +#define PCIE_ATU_VIEWPORT               0x900
> >> +#define PCIE_ATU_REGION_INBOUND         (0x1 << 31)
> >> +#define PCIE_ATU_REGION_OUTBOUND        (0x0 << 31)
> >> +#define PCIE_ATU_REGION_INDEX2          (0x2 << 0)
> >> +#define PCIE_ATU_REGION_INDEX1          (0x1 << 0)
> >> +#define PCIE_ATU_REGION_INDEX0          (0x0 << 0)
> >> +#define PCIE_ATU_CR1                    0x904
> >> +#define PCIE_ATU_TYPE_MEM               (0x0 << 0)
> >> +#define PCIE_ATU_TYPE_IO                (0x2 << 0)
> >> +#define PCIE_ATU_TYPE_CFG0              (0x4 << 0)
> >> +#define PCIE_ATU_TYPE_CFG1              (0x5 << 0)
> >> +#define PCIE_ATU_CR2                    0x908
> >> +#define PCIE_ATU_ENABLE                 (0x1 << 31)
> >> +#define PCIE_ATU_BAR_MODE_ENABLE        (0x1 << 30)
> >> +#define PCIE_ATU_LOWER_BASE             0x90C
> >> +#define PCIE_ATU_UPPER_BASE             0x910
> >> +#define PCIE_ATU_LIMIT                  0x914
> >> +#define PCIE_ATU_LOWER_TARGET           0x918
> >> +#define PCIE_ATU_BUS(x)                 (((x) >> 24) & 0xff)
> >> +#define PCIE_ATU_DEVFN(x)               (((x) >> 16) & 0xff)
> >> +#define PCIE_ATU_UPPER_TARGET           0x91C

Can you avoid a PCIE prefix for this btw?

Thaks!
