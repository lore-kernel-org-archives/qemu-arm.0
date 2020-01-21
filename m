Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp1546183lfp;
        Tue, 21 Jan 2020 06:30:17 -0800 (PST)
X-Google-Smtp-Source: APXvYqy0lIVz2gTlqkWK2VVyGpwkodmMXJqiZQ8yic6mFW3yqw88aDronBdW6wx3QXbVoWAniM3T
X-Received: by 2002:a05:6402:64a:: with SMTP id u10mr3922998edx.147.1579617017870;
        Tue, 21 Jan 2020 06:30:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579617017; cv=none;
        d=google.com; s=arc-20160816;
        b=TU84V//WsNrXwnqd84pazUTN7XuF/1mKVHg8jKSYVcoY0gDzw+z4Un9Dhfdej/I7C/
         eawXlumUgErDpiDdZz24Ea/TkzjDycVHYgSzw2I1PGmi6aY+v1bhOgpxoZJ4V+CFzQPa
         CZD9H7YMN2v+r3L8Dct+XZfCJ/a+TiOYJf2ruM7ymZH8CepoPtzrCZZrojoyJvyZGljy
         T8Mk0C/9yQYS5d6tfBDvIX+aCXYxcn7HYle0x+0JsocixNdCsCu9V0holvCVykCOJol2
         xa7VYHZYHwCXEPo1XOJYv+zlg/nuZO6WvWuXjVR4IHGH0TasxlyhsYmuuaIWJb+Zgsqi
         5Ygw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:organization:references:in-reply-to:message-id:subject
         :to:from:date:dkim-signature;
        bh=nFmAXocXNFdH6LtZ+0S+7/9aL8xZkZ/6AoqILpYrPdk=;
        b=ZrIYGk6crT/h9oiRm3XeWg9NMM91AjVzTgFIGoBA9e3ziha3qmZytjPJOr7ArBc951
         rMbZ6YXSVq1CXvuOKCw7O9Kw6RrNHP/sfNWb4pD8a/vdcSX8ySXq4feNIEEfmRyBattt
         ZhFDuRHBzQTYkdiNzf3Ng2j8LW8uvFt62vZ5av8nL9BX6HgeX6rFnPwWq2PKGcHLeB48
         +D9g4eVnhew2QtlQ/i81BQm7AMn00gMPIPULbaNVR0Y884iShp8WUC5D6sIoKEHlt6rq
         Ak63PuA0cHeChLPTNoOeEvzqoanYaNIvwZ4mfKSGYrKTdvhLPJ+VX3KP+OPeZWwI0aWm
         BX0w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=fhOg4iGj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r11si24583204edl.308.2020.01.21.06.30.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Jan 2020 06:30:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=fhOg4iGj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ituXo-0003FP-BG
	for alex.bennee@linaro.org; Tue, 21 Jan 2020 09:30:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38611)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <cohuck@redhat.com>) id 1itu1s-0007N7-Pu
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 08:57:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1itu1r-0004Bf-LX
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 08:57:16 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:34227
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>) id 1itu1r-0004B0-I3
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 08:57:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579615034;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nFmAXocXNFdH6LtZ+0S+7/9aL8xZkZ/6AoqILpYrPdk=;
 b=fhOg4iGjFwDqp07QsNf0fUT/Y/DQJgxI60D/rEPLEhenQ52uTwVUNHYys60pxfuQkLwPZ9
 Bly4oQR7gAPNgBGmPu5vH0qMmFhTbJnCQWFi9uRbhr/qy8lEb2YX0OPRohN7mQEVPMI/N4
 j9XTD7WuQp9KaR1Gg4/5ymL6LjH9KTA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-250-6PMSumwPM8W_pkwUH9iEmw-1; Tue, 21 Jan 2020 08:57:13 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 19FD6477;
 Tue, 21 Jan 2020 13:57:12 +0000 (UTC)
Received: from gondolin (dhcp-192-195.str.redhat.com [10.33.192.195])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8E7CD8572D;
 Tue, 21 Jan 2020 13:56:58 +0000 (UTC)
Date: Tue, 21 Jan 2020 14:56:56 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Subject: Re: [PATCH v2 08/10] accel: Introduce the current_accel() wrapper
Message-ID: <20200121145656.7a5e0fe3.cohuck@redhat.com>
In-Reply-To: <20200121110349.25842-9-philmd@redhat.com>
References: <20200121110349.25842-1-philmd@redhat.com>
 <20200121110349.25842-9-philmd@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: 6PMSumwPM8W_pkwUH9iEmw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Like Xu <like.xu@linux.intel.com>,
 David Hildenbrand <david@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EvghhpKkIfxa

On Tue, 21 Jan 2020 12:03:47 +0100
Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:

> The accel/ code only access the MachineState::accel field.

s/access/accesses/

> As we simply want to access the accelerator, not the machine,
> add a current_accel() wrapper.
>=20
> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
> v2: Reworded description using 'wrapper'
> ---
>  include/sysemu/accel.h | 2 ++
>  accel/accel.c          | 5 +++++
>  2 files changed, 7 insertions(+)

Reviewed-by: Cornelia Huck <cohuck@redhat.com>

