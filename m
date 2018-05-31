Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp5566140wre;
        Wed, 30 May 2018 23:23:49 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKI/1JrJGYj6bno6VlZdbQV4ByADVJQV0/JUH6o0rM2U338bxYk5fkPdc+W3ouT9IGvwBBe8
X-Received: by 2002:a0c:e987:: with SMTP id z7-v6mr5402017qvn.202.1527747829465;
        Wed, 30 May 2018 23:23:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527747829; cv=none;
        d=google.com; s=arc-20160816;
        b=E9/9WyhfY4BaF1EeKMnrOAhBPRcLHAvigtQW1qnHrDIDyyGMt1j8QOgFOMxsqhjOnB
         MBinFQv+PuphfempxdFeNzIKlsiH7tB4qDnscJR6MFO4iJoVNlD9s13X55Iaf4m9r3J4
         W1nuZf4l6hIPCGMXhh4MnjSyXmkgzKdBVe9Nf2tEWrM47KrpPZz8OqmXObq4XigMy2kB
         958Uw3dh+kBF3lEpWc5w/7NHRzFupmDz5YdVk5jdcTTfylbSk12QodiM54VNKhJsCGwU
         cWMAn4HPvfppzywwILzMaFioDSZjjP+cFQmUOlC2BIPF1lrrrkHrAaqqaGT969whe4x2
         I93Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=tMGmfes/0xB9UAKG0VkwWkP+6XcZNN+y1UbTMOfDHtM=;
        b=vUay41GsfonP+O/ABlNXfz2ok0qwr56xR/twOAFqNCLV98BszcIONl6FLcR4SzG45B
         9LQ5VAyj6zAspxAjS49EYgkUDv2yuF2kIGsxY4xqUUM95lpyQfhVe9MI8eMt/xh/uW/9
         PLcoGPswFvNsIvN4BWhdZkov9PtsJQEmzUbdYt/amni1egY2FCTHibCmuH8YDVTd9iG/
         XQRJ2xXBmkXIjbQEIoYnhVqq2y5osU1O1sh50OcxYi/TOmaa3Vl5BDQ8zTxPq+tunLX2
         hHCN2blzSYgFbyNxWxmGpr2LUaMp8gMBHxFtxsz+8XB4XHeN+uVnGyYASmRwRTu89ZHh
         7MiA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l5-v6si7773536qvc.98.2018.05.30.23.23.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 30 May 2018 23:23:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42178 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fOH01-0002Ue-0H
	for alex.bennee@linaro.org; Thu, 31 May 2018 02:23:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49971)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fOGzu-0002UZ-Iv
	for qemu-arm@nongnu.org; Thu, 31 May 2018 02:23:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fOGzr-0004FN-Ek
	for qemu-arm@nongnu.org; Thu, 31 May 2018 02:23:42 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:59926 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fOGzr-0004F4-9s; Thu, 31 May 2018 02:23:39 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 815D77D83A;
	Thu, 31 May 2018 06:23:38 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-69.ams2.redhat.com
	[10.36.116.69])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BF23A1101E88;
	Thu, 31 May 2018 06:23:34 +0000 (UTC)
To: Shannon Zhao <zhaoshenglong@huawei.com>, Laszlo Ersek
	<lersek@redhat.com>, eric.auger.pro@gmail.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
References: <1527690380-9782-1-git-send-email-eric.auger@redhat.com>
	<1527690380-9782-3-git-send-email-eric.auger@redhat.com>
	<273bb69a-a463-7fbe-edb0-a87622556afb@redhat.com>
	<5B0F52F6.8060006@huawei.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <9711bb05-d02a-5c23-6494-951ce6783923@redhat.com>
Date: Thu, 31 May 2018 08:23:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <5B0F52F6.8060006@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Thu, 31 May 2018 06:23:38 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Thu, 31 May 2018 06:23:38 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 2/2] hw/arm/virt: Add virt-3.0
 machine type
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
Cc: liujinsong <liu.jinsong@huawei.com>, drjones@redhat.com,
	ard.biesheuvel@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Zv6RZS8fVr4q

Hi Shannon,

On 05/31/2018 03:42 AM, Shannon Zhao wrote:
> 
> 
> On 2018/5/31 0:18, Laszlo Ersek wrote:
>> +    vms->highmem_ecam &= vms->highmem && (!firmware_loaded || aarch64);
>>> +
> Does it need a info log here to tell user that even though you enable
> the highmem_ecam but due to some other reasons it's disabled.
> 
> Also, if user enables highmem_ecam but finally it can't enable, does it
> need to error out?

highmem_ecam is not a user settable option. highmem is. highmem_ecam is
computed based on the machine type capability to support this feature,
the fact highmem is set and we don't have an aarch32 FW being used.

Thanks

Eric
> 
> Thanks,
> 
