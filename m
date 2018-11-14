Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp5896916wrw;
        Wed, 14 Nov 2018 08:02:26 -0800 (PST)
X-Google-Smtp-Source: AJdET5eiTxl/yzpjZejbXcrxYhhPNNq6Gg0ROswEd5w4yjAyZn6afjJSr6e7dGiqvW4RBw/a0erS
X-Received: by 2002:a37:3753:: with SMTP id e80mr2185450qka.207.1542211346068;
        Wed, 14 Nov 2018 08:02:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542211346; cv=none;
        d=google.com; s=arc-20160816;
        b=AyKY6tTTXCKJg3gIKIlRSaXExS+dV+G5+PjmmKJZJvRx/wEJnP3srcL1WTgFSxCrgI
         FqYBs8C5aSN0lFGholbf4YczEi5+pjUymGGW7XjajCqWsXCsj/whgIqqC0fvQMW2XP9z
         FoF43utCAmzfhXiMQAtBNy/llEbqAO4/o7elTjm4M6z4XVZ+95ep3jZMq2nUGNr5626A
         hZAGBNhmX2LwjQOykjDYmBZd9CpillqJ3LSCt3yMxEC+uc70N0qj1fhxCGunOLXazK+N
         ojRAMbklulO+vDSE5yFiko3ZEumgAyLe9xrlukwKDW/UJq8SyuPXEj2Gqg0Nuu8GRXJA
         lZrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=6yYbwvmi+ZKfcW9ByyDuUH0khqCS9r48GOBZTqd0j5E=;
        b=oFvs8EYgVs0QwJqkXV3VvVh+gsoxnK6KH+0qpOclmfmiLbNHnTzb1d5d+FlsiH+maI
         nyIPiRWDNXvnWWMJg4s9zLNh4721N69xWYkR7xUuQaToqX1jjTFTXHyydu9Q8qXWsV3M
         iVN4hCJ+uYcdjRCSUXgI15Et+/tO47CZbl0Bn/YHN2RLSPsw//h1aQhKZ2Z4KQnKxrup
         jNyl3JqLdSZwNdhCAX+Ewwir34fyuH0Fa2axhpqdAcF4iin8K1pSBvAXa9ykWmyDU2p7
         tDxwdDzIusEOFVaro3GeSkBRLNoPWCTtZlJ/db24n9TZmSyUM9BNvBZPIPQVG5d5k/WR
         cWmA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x54si1709673qtx.347.2018.11.14.08.02.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 14 Nov 2018 08:02:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:32913 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gMxcX-0004Xu-6I
	for alex.bennee@linaro.org; Wed, 14 Nov 2018 11:02:25 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35155)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jean-philippe.brucker@arm.com>) id 1gMxcC-0004SI-2X
	for qemu-arm@nongnu.org; Wed, 14 Nov 2018 11:02:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jean-philippe.brucker@arm.com>) id 1gMxc5-0006Jh-Rt
	for qemu-arm@nongnu.org; Wed, 14 Nov 2018 11:02:03 -0500
Received: from usa-sjc-mx-foss1.foss.arm.com ([217.140.101.70]:54762
	helo=foss.arm.com) by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jean-philippe.brucker@arm.com>)
	id 1gMxc5-00069d-MC; Wed, 14 Nov 2018 11:01:57 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9CABE80D;
	Wed, 14 Nov 2018 08:01:47 -0800 (PST)
Received: from [10.1.196.78] (ostrya.cambridge.arm.com [10.1.196.78])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F2D2D3F5A0;
	Wed, 14 Nov 2018 08:01:45 -0800 (PST)
To: Eric Auger <eric.auger@redhat.com>,
	"eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"mst@redhat.com" <mst@redhat.com>
References: <20181109112957.10067-1-eric.auger@redhat.com>
	<20181109112957.10067-16-eric.auger@redhat.com>
From: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
Message-ID: <2d6c96ce-9eb5-9347-1a75-4e13c0cea0ec@arm.com>
Date: Wed, 14 Nov 2018 16:01:28 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20181109112957.10067-16-eric.auger@redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 217.140.101.70
Subject: Re: [Qemu-arm] [RFC v8 15/18] hw/arm/virt: Add virtio-iommu to the
 virt board
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
Cc: "tn@semihalf.com" <tn@semihalf.com>,
	"kevin.tian@intel.com" <kevin.tian@intel.com>,
	"bharat.bhushan@nxp.com" <bharat.bhushan@nxp.com>,
	"peterx@redhat.com" <peterx@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hYQHpvsRhmcm

On 09/11/2018 11:29, Eric Auger wrote:
> +static void create_virtio_iommu(VirtMachineState *vms,
> +                                const char *pciehb_nodename, PCIBus *bus)
> +{
> +    const char compat[] = "virtio,pci-iommu";
> +    uint16_t bdf = 0x8; /* 00:01.0 */
> +    DeviceState *dev;
> +    char *node;
> +
> +    dev = qdev_create(BUS(bus), TYPE_VIRTIO_IOMMU_PCI);
> +    object_property_set_bool(OBJECT(dev), true, "realized", &error_fatal);

For the Arm virt platform, should msi_bypass default to false? Otherwise
I don't think pass-through to guest userpace will work.

Thanks,
Jean
