Received: by 2002:a17:90a:ad88:0:0:0:0 with SMTP id s8csp8994136pjq;
        Wed, 29 May 2019 01:53:41 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxXzaAEwj8nfYzdQDu2t6jU9cKWLoh2XYqVL7f3VCyeT+6/Q1xoPd4Gr8VJ6Howqp7zWikQ
X-Received: by 2002:a05:6214:18e:: with SMTP id q14mr6193071qvr.183.1559120021581;
        Wed, 29 May 2019 01:53:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559120021; cv=none;
        d=google.com; s=arc-20160816;
        b=OolwylKF8vI1e4DVLu3dwpc9DJBmPTfM6uWGoe2REyM7UkAcU8hgGkMqObNiLGt6w2
         XNTNf/wXTNWv+xwO9iYW/CzRtkVmHPD8mijYkFF6gZc2vMBK3C+V5i7x6k82nyDaQd4j
         e6Vi6ZFUiYD4drvgR9gDhZJdcQ10P9za/obdwWgnzygng7hwY5Bs8A3YvPKvbxBjFwV8
         2Bo7ybi+lxbSggyIsQgLCipsa2BawJAqMWpZ1jSS9uVukNs2IHtU4TiY1vUWwj+Ps+Fa
         glOZSOlTaksZfRr+DB0OgMPuYV1kb93cdpxiMjxLeIKisTbAyZC9p1mAu998ORSHySus
         jQdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:subject:user-agent
         :in-reply-to:content-disposition:mime-version:references:message-id
         :to:from:date;
        bh=EwIglUcLvfDQLAYZP1mSpTtjrM9ZawpQf8/DpHJLPxA=;
        b=ytiSFBs3mUtfxnmbNKCkRb0qaZd8hFML2iIB1qknVIo0pbwzh45xNWY3wPOKhen8GB
         kS5vDuEPPKsw0CZB8VDv+Dv7wWt/FtY7e/+bZrkzRR8DkNkaP8pU0PpxLck47FwumLDQ
         A0gGTLYrWk32DrQK4ISTwCCvm4l6JIeIcjGyGArMN9TpQEvjy28bk+YxlgpER1E2tgKQ
         Z8A91ndyQ23xx1qBRaOEc/jEowM2/RkhdDUXdZ2WA8gY6sEZO5EESNhXWElh0nMFsQLc
         CMGXjNjQD9Kkaod4WevFR0t0FkFAGsirS08c4l7jPE8/G2pU0el1IFPWVVo94y1YbL+C
         7Cdw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n10si256089qti.320.2019.05.29.01.53.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 29 May 2019 01:53:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([127.0.0.1]:50082 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hVuL7-0003kO-3s
	for alex.bennee@linaro.org; Wed, 29 May 2019 04:53:41 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45380)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1hVuKm-0003hd-42
	for qemu-arm@nongnu.org; Wed, 29 May 2019 04:53:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1hVuKi-0002ee-AZ
	for qemu-arm@nongnu.org; Wed, 29 May 2019 04:53:19 -0400
Received: from mga12.intel.com ([192.55.52.136]:26053)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
	id 1hVuKZ-0002bt-0d; Wed, 29 May 2019 04:53:10 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	29 May 2019 01:53:04 -0700
X-ExtLoop1: 1
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
	by fmsmga006.fm.intel.com with ESMTP; 29 May 2019 01:53:03 -0700
Date: Wed, 29 May 2019 16:52:34 +0800
From: Wei Yang <richardw.yang@linux.intel.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <20190529085234.GA13368@richard>
References: <20190326024320.27895-1-richardw.yang@linux.intel.com>
	<20190528230111-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190528230111-mutt-send-email-mst@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 192.55.52.136
Subject: Re: [Qemu-arm] [PATCH v6] hw/acpi: extract acpi_add_rom_blob()
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
Reply-To: Wei Yang <richardw.yang@linux.intel.com>
Cc: yang.zhong@intel.com, peter.maydell@linaro.org, qemu-devel@nongnu.org,
	shannon.zhaosl@gmail.com, qemu-arm@nongnu.org,
	Wei Yang <richardw.yang@linux.intel.com>, imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xsHHf43sIF2T

On Tue, May 28, 2019 at 11:01:32PM -0400, Michael S. Tsirkin wrote:
>On Tue, Mar 26, 2019 at 10:43:20AM +0800, Wei Yang wrote:
>> arm and i386 has almost the same function acpi_add_rom_blob(), except
>> giving different FWCfgCallback function.
>> 
>> This patch moves acpi_add_rom_blob() to utils.c by passing
>> FWCfgCallback to it.
>> 
>> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
>> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
>
>Conflicts with your other patches. Pls rebase on top.
>

Ah, would you mind letting me know which tree I need to rebase on?


-- 
Wei Yang
Help you, Help me
