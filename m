Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp7108220wrx;
        Fri, 22 Feb 2019 08:01:17 -0800 (PST)
X-Google-Smtp-Source: AHgI3IZA0Q0Sf3/791+JnMaD7NTLuca6/tu5rxPgdVpDmpmvqJEu42eG8sGvt+UG24bobHa05O/K
X-Received: by 2002:a25:8708:: with SMTP id a8mr3874199ybl.164.1550851277359;
        Fri, 22 Feb 2019 08:01:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550851277; cv=none;
        d=google.com; s=arc-20160816;
        b=dZEwPtJgGvm3boIPkjS1F/tQeEvR3gW5y4k1wW4s0B6m27xXTO6N8VZco+IMt/2Hye
         +mjdFoLaDahJWmNC3/N2wh9kZ2Dsb6ySXDSUMYbNpp/wN280mgJrNVAmJ93ZmiNINu5m
         ZBmxE5gCpyrrWKz12uLvtX+0oKzvZGTKe9EMPWhFds2QMdvP8mVZEiCLG04NNTGDsfz6
         DZsJnirqNE8QaTp8XkhBUYAa489yQhM5nBBxJWBS+lQ/pXT5eIXlzAVU3qQoUldOX0Rs
         UXkxdCigDtLz5Y6TFbSNX4eagCmOBveyMpIXpbCzsGmc7bXCU/Vvg9SK24g5L+sbHoW9
         Y45Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=hsEmVyioYtbCqvt3bo260BZ4FCWpR5Go3NNIIIcO5GY=;
        b=tgunf9g0v2tTj7+jhp8ye92G/EKtnkb2CEjbPVo5//dArGOZjtdIy+jms54fDBydLp
         8QoEW5ippuSj18SS1m2il2r9ei7UKj4tiQWLjq2dnXf975TXR6MNiMaGpokW6MzRibO6
         CHjlbnUwrQk1dymMVINZiZNeEfRMWYB0grSltjkX+p5K3Fn36VxQj3MF23RJJFU6/Dgf
         csnBeaw9qJVwUJpF2ItB1GvPb0vqctcVVdIGihr+GZKZJa+urzTwShwGd+9bAzyX/i/R
         rpSqDlslqti4Y/mU8dhr2EJswCFPRX1wbHhrleoJRL2JOHvx3vZORtGbvLcG8dwNZ70S
         AuoA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g67si1181268ywc.59.2019.02.22.08.01.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Feb 2019 08:01:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:53389 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gxDGG-0004sK-N0
	for alex.bennee@linaro.org; Fri, 22 Feb 2019 11:01:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37515)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gxDDb-0002qg-EA
	for qemu-arm@nongnu.org; Fri, 22 Feb 2019 10:58:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gxDDa-0005ds-Lj
	for qemu-arm@nongnu.org; Fri, 22 Feb 2019 10:58:31 -0500
Received: from mx1.redhat.com ([209.132.183.28]:17496)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gxDDa-0004eN-Bn; Fri, 22 Feb 2019 10:58:30 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9C46D3688B;
	Fri, 22 Feb 2019 15:57:50 +0000 (UTC)
Received: from [10.36.116.102] (ovpn-116-102.ams2.redhat.com [10.36.116.102])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 04EBE60BF1;
	Fri, 22 Feb 2019 15:57:41 +0000 (UTC)
To: Igor Mammedov <imammedo@redhat.com>
References: <20190220224003.4420-1-eric.auger@redhat.com>
	<20190220224003.4420-18-eric.auger@redhat.com>
	<20190222164814.10411186@redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <e188c7e9-633b-f80c-6ca3-45c5886a0134@redhat.com>
Date: Fri, 22 Feb 2019 16:57:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190222164814.10411186@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Fri, 22 Feb 2019 15:57:50 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v7 17/17] hw/arm/virt: Add
 nvdimm and nvdimm-persistence options
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
Cc: peter.maydell@linaro.org, drjones@redhat.com,
	Shivaprasad G Bhat <sbhat@linux.ibm.com>, david@redhat.com,
	qemu-devel@nongnu.org, shameerali.kolothum.thodi@huawei.com,
	dgilbert@redhat.com, qemu-arm@nongnu.org,
	eric.auger.pro@gmail.com, david@gibson.dropbear.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xcRj5upItxwe

Hi Igor,

On 2/22/19 4:48 PM, Igor Mammedov wrote:
> On Wed, 20 Feb 2019 23:40:03 +0100
> Eric Auger <eric.auger@redhat.com> wrote:
> 
>> Machine option nvdimm allows to turn NVDIMM support on.
> 
> With virt-arm and spapr[1] trying to add nvdimm, I think it's time
> to generalize and move acpi_nvdimm_state to generic Machine
> instead of duplicating the same code in several machines.

OK I will go this way

Thanks a lot for your time!

Best Regards

Eric
> 
> 1) [RFC PATCH 3/4] spapr: Add NVDIMM device support
> 
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> ---
> [...]
> 
> 
