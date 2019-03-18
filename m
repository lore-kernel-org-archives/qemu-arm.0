Received: by 2002:a5d:4d11:0:0:0:0:0 with SMTP id z17csp2322674wrt;
        Mon, 18 Mar 2019 05:49:34 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyk0SFbX5Ss8FGMMUnvUYBeJX3A1M/BHwEOd9RJKfMP5pJru/wEqeHGY7zOULxKgK0ChAok
X-Received: by 2002:adf:e4c2:: with SMTP id v2mr1827265wrm.124.1552913374273;
        Mon, 18 Mar 2019 05:49:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552913374; cv=none;
        d=google.com; s=arc-20160816;
        b=ge2kPhIjxf0h+Nr0aEj0ic3Bts2+x5ZlW2ASsVyajjfMvLuYUYRSd7C+cjrA+g68uv
         +dTKdLOPDlq1EvKIFyRGf/s23LuPkuOjJEirtKO94gfNIILARQf0COxrmcOpTbhoC68T
         qa5BIV6dnR2hETZUF+agDqlysYzG4lbsqV2gsNGqqTSwzg3K/siwCkZXykW1mEUonvaU
         ADczuuvwVOWSj+G++WPwvIN6ujlKemMzX7Duj7ZRK4IT1fsATDTrPEx+FpgRQKLIOokn
         lyaPSqhCm5phJOEdO0yg0H2NxP/MQFdCZewAeRh8S7eNdIhxUCiq/6SO43BplYq9DI1I
         hNhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=XasuiM80DM6CCCs6ugbNF6JKJjR6t+RjXqwBXZlL7vw=;
        b=DO1w7dYs5+WlFjvqyZCi0t3zIEPEYw6H/zu++VKAN7+bikkHQcgac5/9H2v9kQfgc4
         38TYkXr00wFeVb7e27PNvxKUXcsd0f7t5S8EF7VHmGnUqaRPIhqNXssG6xktiX+cVjaf
         cu07dkvxMsmuhzt5SQKjuXaiIDKUmExxmcYF2aeEbC1cUAIKAUH9KRwDhy69vaCit93O
         KGkUDBgkC7Tp/6kz8/VLHr8oNCMmRRKzLD50faj6MgOr30dq2zyaMDZ3B3A+3mg1KfzW
         kcqx4Kb4i11uHETEXpet8hg3TZ9Rrq7JHLfqg7Xi5hT51Yj+vfeNtQ/T3OW1qyTcKut/
         jsJQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u14si4113018wrr.257.2019.03.18.05.49.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 18 Mar 2019 05:49:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:41041 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h5rht-0003XV-Ak
	for alex.bennee@linaro.org; Mon, 18 Mar 2019 08:49:33 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39255)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1h5rgH-0002pQ-4g
	for qemu-devel@nongnu.org; Mon, 18 Mar 2019 08:47:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1h5rTM-0005v9-Ta
	for qemu-devel@nongnu.org; Mon, 18 Mar 2019 08:34:33 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45848)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1h5rTL-0005ts-KK; Mon, 18 Mar 2019 08:34:32 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 655AF30832D8;
	Mon, 18 Mar 2019 12:26:07 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 79B695D9D3;
	Mon, 18 Mar 2019 12:26:02 +0000 (UTC)
Date: Mon, 18 Mar 2019 13:26:01 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Message-ID: <20190318132601.6cf82e50@redhat.com>
In-Reply-To: <20190308114218.26692-10-shameerali.kolothum.thodi@huawei.com>
References: <20190308114218.26692-1-shameerali.kolothum.thodi@huawei.com>
	<20190308114218.26692-10-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.44]);
	Mon, 18 Mar 2019 12:26:07 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v2 09/11] hw/acpi: Add ACPI Generic Event
 Device Support
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, sameo@linux.intel.com, shannon.zhaosl@gmail.com,
	qemu-devel@nongnu.org, xuwei5@hisilicon.com, linuxarm@huawei.com,
	eric.auger@redhat.com, qemu-arm@nongnu.org, sebastien.boeuf@intel.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hu2gOXVdKF9b

On Fri, 8 Mar 2019 11:42:16 +0000
Shameer Kolothum <shameerali.kolothum.thodi@huawei.com> wrote:

> From: Samuel Ortiz <sameo@linux.intel.com>
> 
> The ACPI Generic Event Device (GED) is a hardware-reduced specific
> device that handles all platform events, including the hotplug ones.
> This patch generate the AML code that defines GEDs.
> Platforms need to specify their own GedEvent array to describe what kind
> of events they want to support through GED. The build_ged_aml routine
> takes a GedEvent array that maps a specific GED event to an IRQ number.
> Then we use that array to build both the _CRS and the _EVT section
> of the GED device.

I'd this a part of "virtual ACPI device"

> This is in preparation for making use of GED for ARM/virt
> platform and for now supports only memory hotplug.
> 
> Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
> Signed-off-by: Sebastien Boeuf <sebastien.boeuf@intel.com>
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> ---
[...]
