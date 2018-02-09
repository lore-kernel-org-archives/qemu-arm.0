Received: by 10.28.71.27 with SMTP id u27csp78339wma;
        Thu, 8 Feb 2018 16:08:26 -0800 (PST)
X-Google-Smtp-Source: AH8x2246ydqZb3O4nBgboGLpEmd4nUETj/iyZEI0w4H9DX8dK/77A1Wce+sSvpnaWrAwtXDRfGvY
X-Received: by 10.37.185.140 with SMTP id r12mr569804ybg.283.1518134905921;
        Thu, 08 Feb 2018 16:08:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518134905; cv=none;
        d=google.com; s=arc-20160816;
        b=QL1bbzfaJ6yDHu1ZRJ2z/JV53x1pddF0MQNCsrTnzscgzKiY3xfoPfBOoRv0K7UhpM
         aBzJ9Zd3HIUMXEvvXrFp7A5B3/uLEzomqkqSb4oPFcbWBHsXQ7QLrs6rmml9fMyGmm90
         l87UvJ3dgUWHE0KhmMMGetdW+nwF5QDk0RRC0f7RN1FGew09/jRIQ6Xz2utKiQLJ3+si
         2dnlYeB+SU71zM2vBfGAPvRvxh4AXAM04Bqofg6NxsuXagOL3yWYjFPEI2a4LP/3CHpm
         LocJfg/2vpUyq1brbFxmNoQSE9UmnwXO0HKH71u7Qg6/Rh1KJqe6gsDmOmG4GKitfW6Z
         5n8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=zfIRj/tmmogjmjieGbzDAgnNkbxDKtTi9kgrjBvYKzQ=;
        b=Mj6+ykK5Mkp4zWOiZl2bZzowY9jMG6BSHiFrEfIpf4zJ0HhPs9aqg4QAkifdpH519a
         uhkrHH/GITLmAahOeK1fQPMlKI5ZluIy8sJVYaFlbATmJdnYHPZcFVGpHkd504uuq6Sn
         h/ud+oK0M5fq5rOP03P7MW6HsEpis8vz4OfLoekNas2H1VHMVKqpwwYwssdqDiSpro7y
         oIISmms3VEzTpqYw7rNM24LELmFluYT9WmP+fNylusrBCCkEEfc0UduktjA2Bd3FSm1P
         yey6xXPMdPbE25RvnWwRMM77Ad/siKyjhc5iXN2uVLplX6FD/kwEDhmH6MNzJvYyr0ok
         +GCw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u73si196640ywu.224.2018.02.08.16.08.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 08 Feb 2018 16:08:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38813 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ejwEr-0000oi-9Z
	for alex.bennee@linaro.org; Thu, 08 Feb 2018 19:08:25 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38489)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1ejwEi-0000mM-0z
	for qemu-arm@nongnu.org; Thu, 08 Feb 2018 19:08:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1ejwEe-0004OG-PW
	for qemu-arm@nongnu.org; Thu, 08 Feb 2018 19:08:15 -0500
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:34280 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mst@redhat.com>)
	id 1ejwEe-0004LP-JZ; Thu, 08 Feb 2018 19:08:12 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 73AEB402663E;
	Fri,  9 Feb 2018 00:08:07 +0000 (UTC)
Received: from redhat.com (ovpn-120-144.rdu2.redhat.com [10.10.120.144])
	by smtp.corp.redhat.com (Postfix) with SMTP id ED7112166BAE;
	Fri,  9 Feb 2018 00:08:03 +0000 (UTC)
Date: Fri, 9 Feb 2018 02:08:03 +0200
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Andrey Smirnov <andrew.smirnov@gmail.com>
Message-ID: <20180209020556-mutt-send-email-mst@kernel.org>
References: <20180207042438.15422-1-andrew.smirnov@gmail.com>
	<20180207042438.15422-11-andrew.smirnov@gmail.com>
	<20180208194226-mutt-send-email-mst@kernel.org>
	<CAHQ1cqGZHie0sYudPGr-15LOEjMRT05=0+tsViKfCJBnN96Nag@mail.gmail.com>
	<20180208221121-mutt-send-email-mst@kernel.org>
	<CAHQ1cqHGfTYyKuMEDGPWnHBbWYV2sMrqfHU6oJV3NQSv0Xi0Qg@mail.gmail.com>
	<20180208223323-mutt-send-email-mst@kernel.org>
	<CAHQ1cqHxUZTFiXpzdKWk1MA9QuqHC0Ljs0-uBkWZbYsNn6ix8Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHQ1cqHxUZTFiXpzdKWk1MA9QuqHC0Ljs0-uBkWZbYsNn6ix8Q@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Fri, 09 Feb 2018 00:08:07 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Fri, 09 Feb 2018 00:08:07 +0000 (UTC) for IP:'10.11.54.6'
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
X-TUID: CiOg4eWySedT

On Thu, Feb 08, 2018 at 12:43:03PM -0800, Andrey Smirnov wrote:
> On Thu, Feb 8, 2018 at 12:33 PM, Michael S. Tsirkin <mst@redhat.com> wrote:
> > On Thu, Feb 08, 2018 at 12:22:53PM -0800, Andrey Smirnov wrote:
> >> On Thu, Feb 8, 2018 at 12:11 PM, Michael S. Tsirkin <mst@redhat.com> wrote:
> >> > On Thu, Feb 08, 2018 at 12:03:04PM -0800, Andrey Smirnov wrote:
> >> >> >> +#define PCIE_PORT_LINK_CONTROL          0x710
> >> >> >> +
> >> >> >> +#define PCIE_PHY_DEBUG_R1               0x72C
> >> >> >> +#define PCIE_PHY_DEBUG_R1_XMLH_LINK_UP  BIT(4)
> >> >> >> +
> >> >> >> +#define PCIE_LINK_WIDTH_SPEED_CONTROL   0x80C
> >> >> >> +#define PORT_LOGIC_SPEED_CHANGE         (0x1 << 17)
> >> >> >> +
> >> >> >> +#define PCIE_MSI_ADDR_LO                0x820
> >> >> >> +#define PCIE_MSI_ADDR_HI                0x824
> >> >> >> +#define PCIE_MSI_INTR0_ENABLE           0x828
> >> >> >> +#define PCIE_MSI_INTR0_MASK             0x82C
> >> >> >> +#define PCIE_MSI_INTR0_STATUS           0x830
> >> >> >> +
> >> >> >> +#define PCIE_ATU_VIEWPORT               0x900
> >> >> >> +#define PCIE_ATU_REGION_INBOUND         (0x1 << 31)
> >> >> >> +#define PCIE_ATU_REGION_OUTBOUND        (0x0 << 31)
> >> >> >> +#define PCIE_ATU_REGION_INDEX2          (0x2 << 0)
> >> >> >> +#define PCIE_ATU_REGION_INDEX1          (0x1 << 0)
> >> >> >> +#define PCIE_ATU_REGION_INDEX0          (0x0 << 0)
> >> >> >> +#define PCIE_ATU_CR1                    0x904
> >> >> >> +#define PCIE_ATU_TYPE_MEM               (0x0 << 0)
> >> >> >> +#define PCIE_ATU_TYPE_IO                (0x2 << 0)
> >> >> >> +#define PCIE_ATU_TYPE_CFG0              (0x4 << 0)
> >> >> >> +#define PCIE_ATU_TYPE_CFG1              (0x5 << 0)
> >> >> >> +#define PCIE_ATU_CR2                    0x908
> >> >> >> +#define PCIE_ATU_ENABLE                 (0x1 << 31)
> >> >> >> +#define PCIE_ATU_BAR_MODE_ENABLE        (0x1 << 30)
> >> >> >> +#define PCIE_ATU_LOWER_BASE             0x90C
> >> >> >> +#define PCIE_ATU_UPPER_BASE             0x910
> >> >> >> +#define PCIE_ATU_LIMIT                  0x914
> >> >> >> +#define PCIE_ATU_LOWER_TARGET           0x918
> >> >> >> +#define PCIE_ATU_BUS(x)                 (((x) >> 24) & 0xff)
> >> >> >> +#define PCIE_ATU_DEVFN(x)               (((x) >> 16) & 0xff)
> >> >> >> +#define PCIE_ATU_UPPER_TARGET           0x91C
> >> >
> >> > Can you avoid a PCIE prefix for this btw?
> >> >
> >>
> >> That's how those constants were named in Linux kernel, but yeah, I'll
> >> add a prefix to them.
> >>
> >> Thanks,
> >> Andrey Smirnov
> >
> > In that case you should not copy it into your file.
> > Stuff from linux kernel should be imported into standard-headers.
> >
> 
> Just to be sure we are on the same page, this is the file I am talking about:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/pci/dwc/pcie-designware.h?h=v4.15
> 
> you want me to put it in standard-headers/linux and get those
> constants from there?
> 
> Thanks,
> Andrey Smirnov

Oh it's from a source file. I see. standard-headers/linux is for
files exported from include/uapi.

I take it back then but pls rename appropriately - and I guess
you should only copy what you actually use.

-- 
MST
