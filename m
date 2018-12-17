Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2644566wrt;
        Mon, 17 Dec 2018 07:46:27 -0800 (PST)
X-Google-Smtp-Source: AFSGD/Uo+sRjm6oSZOnQXu7Bk1mmMwPIJZeRhlYr7hazGjKT/17wY/+NVcYNzmy1Jf0+B7MG7F1x
X-Received: by 2002:ac8:1941:: with SMTP id g1mr13271192qtk.193.1545061587905;
        Mon, 17 Dec 2018 07:46:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1545061587; cv=none;
        d=google.com; s=arc-20160816;
        b=o8JX3GV25aNfm9sL6VKoUd05/5/yn5px8BJVpPQas03QPbhL4oxnLV8U5rUEFAt3ie
         CTVWUP5/UWwhusOyRijuEUMTJc+E3+ke3DoIqRu5pqLDKZnOWComaGQ6ON7W9MxrgAxi
         BbuALMxH4q1EtDQhYHmvdMK5r69huzj+AjwSpEA5TTp4dCDnLNXd67RWF7R+5nhBkiYo
         3O5k27QWaZAesuD1B0KWg6yo/9HFEbI75jcV3cJO5w/BkHlU8T1EqB2duiYF6TAulg0w
         YAxPmI5yyRpmV10RU41n2UWgQW8qylltZjeDWfR0KSJndjjLbcDpkBhWn/cD2+lZaGik
         G3Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=WjvHmath/znQxArFBkq0Ju0TEWRbaZYbvUQT/QbuJ/E=;
        b=thISPjzaW81p1js0FBybJV4VCXnHV4cy5M+0radRnEExXhtgb/+eoslUb6f/Gm3euA
         IwM6RdHVjZ7iJsxl4AQGK9l8jgAKm62hKrUfQdyIbe0Gn5uGyTuv1eLDYa9F8jK4TZEZ
         mVcQobkebd+ij4NbOnSI2XoCzyxzNzPfd595Rco9RW9TM6N1fxIOUuV184+7uHmFjZpZ
         1Gp0DowkjQXSGbOd2MKpn7Oh3j/LQ1gNR+RhyOkrkZ1mvf552mKfQwDv0p9H3U/5zCKG
         9KEeHOsFGbLmbCVXfs8uRcZOGBC6I18qS8zj5ytja2NtY/PM69BUQ2StsfaU2W05sidz
         +cBg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f3si3739213qkf.49.2018.12.17.07.46.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 17 Dec 2018 07:46:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47506 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gYv6B-0000gH-AN
	for alex.bennee@linaro.org; Mon, 17 Dec 2018 10:46:27 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39171)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1gYv61-0000fp-VT
	for qemu-arm@nongnu.org; Mon, 17 Dec 2018 10:46:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1gYv5y-0005oR-Rn
	for qemu-arm@nongnu.org; Mon, 17 Dec 2018 10:46:17 -0500
Received: from mx1.redhat.com ([209.132.183.28]:49306)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1gYv5y-0005dW-He; Mon, 17 Dec 2018 10:46:14 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 142DF58E59;
	Mon, 17 Dec 2018 15:46:12 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C53436012E;
	Mon, 17 Dec 2018 15:46:00 +0000 (UTC)
Date: Mon, 17 Dec 2018 16:45:58 +0100
From: Andrew Jones <drjones@redhat.com>
To: Samuel Ortiz <sameo@linux.intel.com>
Message-ID: <20181217154558.hrnt2scjppa2jwsa@kamzik.brq.redhat.com>
References: <20181217104838.18957-8-sameo@linux.intel.com>
	<20181217153448.GF4456@caravaggio>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181217153448.GF4456@caravaggio>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Mon, 17 Dec 2018 15:46:12 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v5 7/8] hw: acpi: Export and
 share the ARM RSDP build
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
Cc: Laurent Vivier <lvivier@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, Ben Warren <ben@skyportsystems.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
	Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /sizDCjTW9FF

On Mon, Dec 17, 2018 at 04:34:48PM +0100, Samuel Ortiz wrote:
> 
> From: Samuel Ortiz <sameo@linux.intel.com>
> 
> Now that build_rsdp() supports building both legacy and current RSDP
> tables, we can move it to a generic folder (hw/acpi) and have the i386
> ACPI code reuse it in order to reduce code duplication.
> 
> Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> ---
>  include/hw/acpi/aml-build.h |  2 ++
>  hw/acpi/aml-build.c         | 68 +++++++++++++++++++++++++++++++++++++
>  hw/arm/virt-acpi-build.c    | 65 -----------------------------------
>  hw/i386/acpi-build.c        | 49 +++++++++++---------------
>  4 files changed, 89 insertions(+), 95 deletions(-)
>

Reviewed-by: Andrew Jones <drjones@redhat.com>
