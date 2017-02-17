Received: by 10.25.77.65 with SMTP id a62csp175244lfb;
        Fri, 17 Feb 2017 05:33:25 -0800 (PST)
X-Received: by 10.55.186.67 with SMTP id k64mr7550549qkf.232.1487338405760;
        Fri, 17 Feb 2017 05:33:25 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s16si7485444qts.250.2017.02.17.05.33.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 17 Feb 2017 05:33:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53758 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ceif7-0005rP-9P
	for alex.bennee@linaro.org; Fri, 17 Feb 2017 08:33:25 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37054)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ceieM-0005pj-9m
	for qemu-devel@nongnu.org; Fri, 17 Feb 2017 08:32:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ceieL-0007o3-Gu
	for qemu-devel@nongnu.org; Fri, 17 Feb 2017 08:32:38 -0500
Received: from mail-wr0-x231.google.com ([2a00:1450:400c:c0c::231]:33013)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ceieL-0007nk-AW
	for qemu-devel@nongnu.org; Fri, 17 Feb 2017 08:32:37 -0500
Received: by mail-wr0-x231.google.com with SMTP id i10so29998872wrb.0
	for <qemu-devel@nongnu.org>; Fri, 17 Feb 2017 05:32:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Ccs2W3zCN1sWqp/8nZRaL/rzNZtRvMsq2vG0MKi3Yvk=;
	b=UKlGvaRlF8wDaArh8UT+7np5jV8k4xG+ynihmTFUVHftIxXGer7fBciY7/Xc+EzY5J
	TtfAF9yKLswenmlOijg69JFVhX1qNZ4fBKlsT0O4PYXiOZlt3gD0XngDlJ/sRD27FFwE
	C8+kofj155Soyn1IzoLqqLYa8MvQcyRUUzPwI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Ccs2W3zCN1sWqp/8nZRaL/rzNZtRvMsq2vG0MKi3Yvk=;
	b=jQVGIHay7ZKzOpBaX8aBxbUnvQwzCSj6YF8K2KmKfFiG6rsU14WNZf5sYfyw0IPMBX
	cdDIrJgC3UAKhQpts8aFL7vmhHuErUxPpv3G3ShoGFMbdV0Luv9KzfkN2gMrUOTbsu6C
	u4o1peVDzrnqlf+DKrKP5bcAjbgpijzHGk5LOZ5StQpekM/4TaAEBje6FYzSdZAhVxrD
	cglfyiqW9okDAoI2YIKIgo2FjCqkJ/HQIeQMl9kRoirYJ+oUiv4G0CTWDwEIX/YurBEb
	kK3qeHnXqtIvj1rXYq7NNYoTH9yQuLgctulnupOASDoJ6+AYC5f2285B2G5rtJ9JFJBp
	7KmQ==
X-Gm-Message-State: AMke39nszqPPzk+0utkHNFHUZZ2z/6FdRn9AeOUG6+69dB6RRHD17hrXsq9zJ1pHSr3Lus6qZ7XeYTeD/jqq2zjO
X-Received: by 10.223.133.68 with SMTP id 62mr6544375wrh.195.1487338356208;
	Fri, 17 Feb 2017 05:32:36 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.69 with HTTP; Fri, 17 Feb 2017 05:32:15 -0800 (PST)
In-Reply-To: <20170216161114.220260cf@nial.brq.redhat.com>
References: <1487253461-269218-1-git-send-email-imammedo@redhat.com>
	<CAFEAcA_NgmdDCfbPy+DnHQBmNGmQ4tj1z4ci+OP7+x4tHLLCxg@mail.gmail.com>
	<20170216161114.220260cf@nial.brq.redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 17 Feb 2017 13:32:15 +0000
Message-ID: <CAFEAcA-aaEPxhYK2ePq2QXW6UVe2A=NxP=V7cokURkurPzLRGg@mail.gmail.com>
To: Igor Mammedov <imammedo@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c0c::231
Subject: Re: [Qemu-devel] [PATCH] hw/arm/virt: fix cpu object reference leak
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
Cc: Andrew Jones <drjones@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QX+DuhCyYrir

On 16 February 2017 at 15:11, Igor Mammedov <imammedo@redhat.com> wrote:
> On Thu, 16 Feb 2017 14:18:05 +0000
> Peter Maydell <peter.maydell@linaro.org> wrote:
>> I've always found the object reference semantics somewhat
>> confusing (why does realizing a device add a reference,
>> for instance?). Do we document them anywhere?
> I'm not aware of a place where it's documented.
>
> currently device_realize() sets parent thus increasing
> ref counter only if device creator haven't set parent
> explicitly.

It doesn't seem to:

static void device_realize(DeviceState *dev, Error **errp)
{
    DeviceClass *dc = DEVICE_GET_CLASS(dev);

    if (dc->init) {
        int rc = dc->init(dev);
        if (rc < 0) {
            error_setg(errp, "Device initialization failed.");
            return;
        }
    }
}

...it just calls the device's init function if it has one.

It's also pretty confusing that qdev_try_create()
and qdev_create() return a pointer to an object
that has been put into a bus and had unref called
(so the caller doesn't need to manually unref),
but plain object_new() returns a pointer to an
object that hasn't been put into a bus, yet
realizing does put it into a bus but doesn't do the
corresponding unref.

I'd be a lot happier if we had clear documentation that
described how our object model, plugging things into buses,
etc handled reference counting and what the expected
"correct" code patterns are for using it.

That said, I guess this patch is correct so I'm applying
it to target-arm.next.

thanks
-- PMM
