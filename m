Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp495083wru;
        Wed, 8 Aug 2018 02:33:45 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPx1O8wP7LCLQae8IOP3ln8M4lgk37DyDaXKR6gk70nwAC6pNmmAZ3ee28QUnWIunj9V9hFF
X-Received: by 2002:a0c:8c05:: with SMTP id n5-v6mr1672788qvb.185.1533720825249;
        Wed, 08 Aug 2018 02:33:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533720825; cv=none;
        d=google.com; s=arc-20160816;
        b=IeqMKNOMzHJjE6N0dWBeUL8A36aHqeKyNnKFuj+V3+6YB72/Ii/1uHi/vyDlZ6WI6B
         elAv/QUaIqAsVdal7NFDrJl0ErKiqfKCiqah2dF+QK5UrKI7zpll35M24FLoPhcFVLkj
         voUoqq1wpln8LNK5ilLDiCvP6Viz67JAN2qhi5DtTs6NdlZrgOG/y6fB4gg02VfMYtU0
         0/xx1nW3629xuTYT2K0a1dPckqsrXANDQyr+k0TCmj9L6s3ry7jT8+B8VAfx+4qHM0Z5
         g7Bik6wgSzK7SRjwGR8YnuE/SP4+H+PgCKLmq06THu6Q8zjVinYFJoHNenbbKtXZLra+
         dyEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=7mPPQNg+PioWh3yz9oFokdCTr+GrZZGC255zaauZFYQ=;
        b=f02ZlVN48V3OCRlBBjRXGF0pEDjQ2SnZdl94341EAoNhJ0hczZ+d6B92S5e4XrTCBc
         2S6LgCoojGqNMvdaeN062dOM3p+k50fVVbxxWEOWYmXMmCh1jMXKd2Y/bYDM5IMf6qDU
         Vjhd5wwe6KR8p9q3cN8zraxkKtPZ+DLN2pbQSBV5tvo44PvxPwc95Cy8WRjtMQWI7RAo
         NOwJzwyTzf/50kY/3vpa6mF6AwLtmGqAJLEeGFc+0jCYqt3zDRlXECzJ/CnwBi3WJkm0
         ZsAn1VNiI0EH5gSVytQ+cu44PTom37zCbNhvUaLEf4Z7AuQdF2H8blo4Hu6dKbvzbQC4
         Ii7g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r13-v6si51363qta.0.2018.08.08.02.33.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 08 Aug 2018 02:33:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42550 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fnKqe-00075V-NM
	for alex.bennee@linaro.org; Wed, 08 Aug 2018 05:33:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48463)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fnKqS-000743-4e
	for qemu-arm@nongnu.org; Wed, 08 Aug 2018 05:33:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fnKqP-00015M-0E
	for qemu-arm@nongnu.org; Wed, 08 Aug 2018 05:33:32 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:47714 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fnKqO-00014c-QR; Wed, 08 Aug 2018 05:33:28 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8F4B040241C3;
	Wed,  8 Aug 2018 09:33:27 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-58.ams2.redhat.com
	[10.36.116.58])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BCC3020180F4;
	Wed,  8 Aug 2018 09:33:24 +0000 (UTC)
To: Igor Mammedov <imammedo@redhat.com>
References: <43c1349e-1ca6-4890-07c0-7bfa35ab914d@redhat.com>
	<5311fed5-7f13-a177-b967-db6e3ed028b9@redhat.com>
	<405e3f2b-3044-d7fc-8df4-b07a8487470f@redhat.com>
	<f2d61062-21df-4478-bc61-c32e92329cf8@redhat.com>
	<57030c9f-c3d1-49a8-090e-d6b316e7a818@redhat.com>
	<fc6a29d4-1094-8d29-d415-fc30d5e30c31@redhat.com>
	<5FC3163CFD30C246ABAA99954A238FA838712003@FRAEML521-MBX.china.huawei.com>
	<fd7e2831-86a8-c2a1-fe0c-d9784bc2d3cb@redhat.com>
	<20180711151740.3d119e95@redhat.com>
	<5e65f669-69f6-53aa-0337-2825ce353b5e@redhat.com>
	<20180712144516.zsjvfrruduirzqug@kamzik.brq.redhat.com>
	<6047361a-be99-fc7f-5270-5ab3b4ab84e2@redhat.com>
	<20180718150044.4c542d21@redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <20e89178-2ba6-b752-bac5-c208d608a02a@redhat.com>
Date: Wed, 8 Aug 2018 11:33:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20180718150044.4c542d21@redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Wed, 08 Aug 2018 09:33:27 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Wed, 08 Aug 2018 09:33:27 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC v3 06/15] hw/arm/virt: Allocate
 device_memory
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	Andrew Jones <drjones@redhat.com>, David Hildenbrand <david@redhat.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
	"agraf@suse.de" <agraf@suse.de>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>,
	"dgilbert@redhat.com" <dgilbert@redhat.com>,
	"david@gibson.dropbear.id.au" <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lR1LZ86SXCed

Hi Igor,

On 07/18/2018 03:00 PM, Igor Mammedov wrote:
[...]
>>>
>>> I think Igor wants one contiguous region for RAM, where additional
>>> space can be reserved for hotplugging.  
>> This is not compliant with 2012 ARM white paper, although I don't really
>> know if this document truly is a reference (did not get any reply).
> it's upto QEMU to pick layout, if we have maxmem (upto 256Gb) we could
> accommodate legacy req and put single device_memory in 1Gb-256Gb GPA gap,
> if it's more we can move whole device_memory to 2Tb, 8Tb ...
> that keeps things manageable for us and fits specs (if such exist).
> WE should make selection of the next RAM base deterministic is possible
> when layout changes due to maxram size or IOVA, so that we won't need
> to use compat knobs/checks to keep machine migratable.
Sorry for the delay. I was out of the office those past weeks.

OK understood. Your preferred approach is to have a contiguous memory
region (initial + hotplug). So this depends on the FW capability to
support flexible RAM base. Let's see how this dependency gets resolved.

This series does not bump the non hotpluggable memory region limit,
which is still limited to 255GB. The only way to add more memory is
though PCDIMM or NVDIMM (max 2TB atm). To do so you need to add ,maxmem
and ,slots options which need to be on both source and dest, right, +
the PCDIMM/NVDIMM device option lines? Also the series checks the
destination has at least the same IPA range capability as the source,
which conditions the fact the requested device_memory size can be
accommodated. At the moment I fail to see what are the other compat
knobs I must be prepared to handle.

Thanks

Eric
> 
> [...]
> 
