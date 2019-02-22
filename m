Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp7102039wrx;
        Fri, 22 Feb 2019 07:54:49 -0800 (PST)
X-Google-Smtp-Source: AHgI3IbPeuKEFnW/62JUa991ZajGQ0dFmo8VN0tdTmQghVOZxTTbb7wo73cG4llN65RJmysZL0Jt
X-Received: by 2002:a81:6bc6:: with SMTP id g189mr3926129ywc.296.1550850889886;
        Fri, 22 Feb 2019 07:54:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550850889; cv=none;
        d=google.com; s=arc-20160816;
        b=zqIoslw3kSECFpPJj54zifWSi3a0ncLs2miXlLIVT60h+/ZEHKkRQ41s41kE2JJjGm
         swAmNCVP5lxJ6t16mVZSui4rXbuVDSk3KwQ1HGdwfsya7quyYzcUMJc9is/V5StAlTm5
         IJDMLp+YZwNgQK2fgbhHVYNQc9hz6YxgVR2Be9b3/Niufc9/PTqa1r3cxFQDhA6ebRFF
         OlR5xqm/oap4A1HDb11ym/1BfJSPgekKje7c6pg3ZNpmyE+GaXulae2w7rPDLZggvKYG
         UeoniLZrevs5DqKzE96/wR43e0IIzFm/U5yBQtrD7DH6L10uK5m40G8SIMangKmKl/rl
         EgMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=htxXs6JK37LQ2ooKFusHkDEHQLB15ocdQuxFXVIjA74=;
        b=oR7oCcI+IXRnwqPvVsd0McO9KljpCrevTfUUweF/bkjpOu2ca19dMJmCVct2IaJ8JD
         /ZODMRagSHZcCbbuTyEjxsz9pvOWcnxAPoWmQqhd4urYEn2uHUTn4ktXs5ywpVTzr2P8
         dGh60k2G3r+MVDWVGdDUxRqBLjH7vj2OFkXCvGQW10sHi2Gm8KLSmClSFMVBpgyWBBce
         K6ae4jc2QwY68yGovqGXwTRg8VrZHlyQksyfWNWUtZSio2LDaj1NaZbBe3VApImxuoHk
         4lU1jAWqysgG8fH8UV5ItLpH0ZQR4fLGFvdVZ6y3XhhuHPTFS3Tc17UhGdnM46cYQjZ/
         E/lA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d203si1035316ybd.387.2019.02.22.07.54.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Feb 2019 07:54:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:53249 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gxDA1-0007oT-Bx
	for alex.bennee@linaro.org; Fri, 22 Feb 2019 10:54:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33047)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gxD46-0002Fa-36
	for qemu-devel@nongnu.org; Fri, 22 Feb 2019 10:48:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gxD44-0000Op-6O
	for qemu-devel@nongnu.org; Fri, 22 Feb 2019 10:48:41 -0500
Received: from mx1.redhat.com ([209.132.183.28]:42700)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1gxD3y-0008TE-G5; Fri, 22 Feb 2019 10:48:34 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CC3355858D;
	Fri, 22 Feb 2019 15:48:23 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E6EB05D704;
	Fri, 22 Feb 2019 15:48:15 +0000 (UTC)
Date: Fri, 22 Feb 2019 16:48:14 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Message-ID: <20190222164814.10411186@redhat.com>
In-Reply-To: <20190220224003.4420-18-eric.auger@redhat.com>
References: <20190220224003.4420-1-eric.auger@redhat.com>
	<20190220224003.4420-18-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Fri, 22 Feb 2019 15:48:24 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v7 17/17] hw/arm/virt: Add nvdimm and
 nvdimm-persistence options
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
Cc: peter.maydell@linaro.org, drjones@redhat.com,
	Shivaprasad G Bhat <sbhat@linux.ibm.com>, david@redhat.com,
	qemu-devel@nongnu.org, shameerali.kolothum.thodi@huawei.com,
	dgilbert@redhat.com, qemu-arm@nongnu.org,
	david@gibson.dropbear.id.au, eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: M9Apipdlphvx

On Wed, 20 Feb 2019 23:40:03 +0100
Eric Auger <eric.auger@redhat.com> wrote:

> Machine option nvdimm allows to turn NVDIMM support on.

With virt-arm and spapr[1] trying to add nvdimm, I think it's time
to generalize and move acpi_nvdimm_state to generic Machine
instead of duplicating the same code in several machines.

1) [RFC PATCH 3/4] spapr: Add NVDIMM device support

> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
[...]

