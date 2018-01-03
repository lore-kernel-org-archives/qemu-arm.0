Received: by 10.223.134.117 with SMTP id 50csp11937988wrw;
        Wed, 3 Jan 2018 05:36:42 -0800 (PST)
X-Google-Smtp-Source: ACJfBov9Fl5PevEUTHfB3bdaumqmpkmr/ywUlbODZ2Us9kNnYAbwPx+JO0OhM5K12g260gkE4qhV
X-Received: by 10.37.75.193 with SMTP id y184mr1326130yba.469.1514986602016;
        Wed, 03 Jan 2018 05:36:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1514986602; cv=none;
        d=google.com; s=arc-20160816;
        b=Gc7aoEh3SXRhCI/AYDHMFurY74V4R8iphaFCi3Zpbwlhnxxlc0T36kXRSSBbFNMAwh
         y3Zwee7z40IpRCY1iSSWte86azV4R4iw8fb1NnqgG3idSTK0hHDoDMsQ2DJef8npY9Pc
         dJ+0frWTcrfyxFP/C7VtlyQRRhVVImlYcRm6PJzrkLEAGsk/6eRUt/Faf8GkWXFZEvvd
         KKPOUS0sBYqWy4r7Ox97SWO5Ggy1qf4lVqDtiVFlf1a9Osaz10Ue9t6ayiHnTAPTbhbR
         iR707+s63DTRurPizyVlTNxOXNz/FrcD+amH9AKBAUf/e9rge/x3ENKm1/vGMazYM8pD
         GCCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date:arc-authentication-results;
        bh=PLqzh+t//ns9gsKoDnINj+0MB1KNlcNcqGcGLzFyh9E=;
        b=0TRSlbQtqxl2UOXLJ6OnWX6FOkCZs80GLqO1qcb/WZntIyudp7IcWid5MylhRuzdLk
         XJRy4BO6PDDb9VUPp29as/tCWxujyPvg2r3u/Qnj8mq706MFSJ4G8QkfWXLBiosgqHhb
         wtR2aBCqnMWj5ZJ5gfbEgVHqwR0eMYkpcUoWGDETQn/dUfNWZtGDuBr16EeW/fJNbaa4
         MDTmVNsP4d/VmuoIazVkX8qMrEl1UWQunl0x4jSXI9QEH469w0usJQ7rX9wckKiKW0fT
         HCkc3pZPV6CffZ9dRzD06GI9H+LYB8nw6qvldpjusT1NwHxsYQmJYBcZR46Y3lJmwATN
         ds0Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 16si227204ybj.88.2018.01.03.05.36.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 03 Jan 2018 05:36:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52704 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eWjDl-00089n-I0
	for alex.bennee@linaro.org; Wed, 03 Jan 2018 08:36:41 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38226)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1eWjDa-00089K-0r
	for qemu-arm@nongnu.org; Wed, 03 Jan 2018 08:36:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1eWjDW-0008Ar-3I
	for qemu-arm@nongnu.org; Wed, 03 Jan 2018 08:36:30 -0500
Received: from mx1.redhat.com ([209.132.183.28]:56766)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1eWjDV-0008AO-Sc; Wed, 03 Jan 2018 08:36:26 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C97E5128B;
	Wed,  3 Jan 2018 13:36:24 +0000 (UTC)
Received: from localhost (unknown [10.43.2.134])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 986CB5D6B7;
	Wed,  3 Jan 2018 13:36:19 +0000 (UTC)
Date: Wed, 3 Jan 2018 14:36:18 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: gengdongjiu <gengdongjiu@huawei.com>
Message-ID: <20180103143618.322b1b33@redhat.com>
In-Reply-To: <fc9e6c01-3334-f79c-5416-499177234044@huawei.com>
References: <1514440458-10515-1-git-send-email-gengdongjiu@huawei.com>
	<1514440458-10515-8-git-send-email-gengdongjiu@huawei.com>
	<20171228155310.312e95bb@igors-macbook-pro.local>
	<fc9e6c01-3334-f79c-5416-499177234044@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Wed, 03 Jan 2018 13:36:24 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v14 7/9] ARM: ACPI: Add GPIO notification
 type for hardware RAS error
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, kvm@vger.kernel.org,
	mst@redhat.com, marc.zyngier@arm.com, mtosatti@redhat.com,
	qemu-devel@nongnu.org, xuwei5@hisilicon.com, qemu-arm@nongnu.org,
	james.morse@arm.com, huangshaoyu@huawei.com,
	zhaoshenglong@huawei.com, pbonzini@redhat.com,
	zhengqiang10@huawei.com, christoffer.dall@linaro.org, rth@twiddle.net
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nkWYxG7jjl9p

On Wed, 3 Jan 2018 11:48:30 +0800
gengdongjiu <gengdongjiu@huawei.com> wrote:

> On 2017/12/28 22:53, Igor Mammedov wrote:
> > On Thu, 28 Dec 2017 13:54:16 +0800
> > Dongjiu Geng <gengdongjiu@huawei.com> wrote:
[...]
> >> +static void acpi_dsdt_add_error_device(Aml *scope)
> >> +{
> >> +    Aml *dev = aml_device(ACPI_HARDWARE_ERROR_DEVICE);
> >> +    Aml *method;
> >> +
> >> +    aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0C33")));
> >> +    aml_append(dev, aml_name_decl("_UID", aml_int(0)));
> >> +
> >> +    method = aml_method("_STA", 0, AML_NOTSERIALIZED);
> >> +    aml_append(method, aml_return(aml_int(0x0f)));  
> > no need for dummy _STA method, device is assumed to be present if there is no _STA   
> Igor,
>   do you mean remove above two line code as shown in [1]?
> I dump the DSDT table in my host Ubuntu PC for the error device (PNP0C33), it has the _STA, as shown in [2].
> do we not want to add the _STA for guest?
> 
> [1]
> +    method = aml_method("_STA", 0, AML_NOTSERIALIZED);
> +    aml_append(method, aml_return(aml_int(0x0f)));
compared to host, yours method does nothing,
read ACPI6.2 "6.3.7 _STA (Status)" one more time

> [2]:
>         Device (WERR)
>         {
>             Name (_HID, EisaId ("PNP0C33"))  // _HID: Hardware ID
>             Method (_STA, 0, NotSerialized)  // _STA: Status
>             {
>                 If (LGreaterEqual (OSYS, 0x07D9))
>                 {
>                     Return (0x0F)
>                 }
>                 Else
>                 {
>                     Return (Zero)
>                 }
>             }
>         }
> >   
> >> +    aml_append(dev, method);
> >> +    aml_append(scope, dev);
> >> +}
> >> +
[...]
