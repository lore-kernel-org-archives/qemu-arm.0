Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp4786229lfm;
        Tue, 14 Apr 2020 02:45:39 -0700 (PDT)
X-Google-Smtp-Source: APiQypK7kL025ArPItGUdkEGB8EMirRf6Dm11AmZ+XzvHritp0Bvd3hTzSo1nR/LhwkaEPkDOjCa
X-Received: by 2002:a0c:a899:: with SMTP id x25mr21461846qva.232.1586857539450;
        Tue, 14 Apr 2020 02:45:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586857539; cv=none;
        d=google.com; s=arc-20160816;
        b=WLXFEp0H/BPVEbT05yu1bHGwlP4hyNMuOoBkI4lJ5JLMuvgJSu7Mw0XjVcL4g7RyVk
         6uhPNG/ggQHJLpned44+9clWN4/8XX2JLu0zoCL3FdXCxpYU2cKkCcflH9wJ8uW5kCKH
         aN6pDr7KWWHhkg0d10m6lEG0OWbY56vjwnTw0JOT8jEl/T/T0yuiSfAuptQqWTeAI9L2
         OuZlcFZeDZTZmfOzmqFondoRVJd93Ks8/DBflsPT10JUPtrfOAq3Hnv7qQO21TXrRS3N
         fwHycfpb5fAVdvO2sqMLYBeE8BPMCgmqb24XCMVvN+GHj8VHAW6X8JxUKPW32iLR/IgX
         Ejdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:organization:references:in-reply-to:message-id:subject
         :to:from:date:dkim-signature;
        bh=XqQcjBaUA4/pWS6QQM0cWlmT+P/BcxGgavR3JzzWkIM=;
        b=U3K9uj0J8tTAh5AutKXBTPTJW8WwL7CrsbUXvggw1tmvhWEkeke+gnty8hJ9U1d7Mm
         mCPFQl/R4RvZjKk72d2g9Fo0etMG7CLo4q6tKk4gubM5Bi7xD9HoEHcgJKx8lJ27PDiE
         0Qv6tMYfdhIErgKF4Z3Xqt2R9N1U58UITrGA3BTnjanqq/6wLDj0TtUCgwXQAxhf9cCN
         gfDvpZdqRSV4Unbm6uQzfHjqda2u6yMEeh8CF0Prz7XcNawUzdLnHfilGxT20//UoYeP
         /0BscJ8YxbcEswo3rX79jslShKbq6IxEuCHnZcZ0D3HWMcqmKiS5qYoNNHxgKrn6uu6T
         p5EQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=cnpHjZh2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c23si7419196qkb.380.2020.04.14.02.45.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Apr 2020 02:45:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=cnpHjZh2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jOI8Q-0003QE-S2
	for alex.bennee@linaro.org; Tue, 14 Apr 2020 05:45:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60770)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <cohuck@redhat.com>) id 1jOI8G-0003O2-2e
 for qemu-arm@nongnu.org; Tue, 14 Apr 2020 05:45:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1jOI8E-0001fC-J6
 for qemu-arm@nongnu.org; Tue, 14 Apr 2020 05:45:27 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:41204
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>) id 1jOI8E-0001ey-Fz
 for qemu-arm@nongnu.org; Tue, 14 Apr 2020 05:45:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586857526;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XqQcjBaUA4/pWS6QQM0cWlmT+P/BcxGgavR3JzzWkIM=;
 b=cnpHjZh27dM/73VANj+eH8Z8NhKkzeaaFerTwBFEkqTQYTTxW5R1fmH7amMI5StjAxI3eQ
 3EvJJpiafT5SRPYBPHeAzM00+DaGIgDK3jZF8fUiko+Y59PHfd4ERFBpzUBmcEOJHxESM3
 3H8CeMKmR/GrJvt7NgMpTU6rU93A7/4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-403-ZJN9VRskMtK3FqqwWJ6GCA-1; Tue, 14 Apr 2020 05:45:22 -0400
X-MC-Unique: ZJN9VRskMtK3FqqwWJ6GCA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EE6C2107ACC4;
 Tue, 14 Apr 2020 09:45:18 +0000 (UTC)
Received: from gondolin (ovpn-113-32.ams2.redhat.com [10.36.113.32])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 52EA59F9A1;
 Tue, 14 Apr 2020 09:45:00 +0000 (UTC)
Date: Tue, 14 Apr 2020 11:44:57 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
Subject: Re: [PATCH-for-5.1 2/3] various: Remove unnecessary OBJECT() cast
Message-ID: <20200414114457.06e15bcb.cohuck@redhat.com>
In-Reply-To: <20200412210954.32313-3-f4bug@amsat.org>
References: <20200412210954.32313-1-f4bug@amsat.org>
 <20200412210954.32313-3-f4bug@amsat.org>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 207.211.31.81
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 BALATON Zoltan <balaton@eik.bme.hu>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>, qemu-block@nongnu.org,
 Paul Durrant <paul@xen.org>, Markus Armbruster <armbru@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Joel Stanley <joel@jms.id.au>, Anthony Perard <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org, David Gibson <david@gibson.dropbear.id.au>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Corey Minyard <minyard@acm.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Peter Chubb <peter.chubb@nicta.com.au>,
 =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>,
 John Snow <jsnow@redhat.com>, Richard Henderson <rth@twiddle.net>,
 "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>, Laurent Vivier <laurent@vivier.eu>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WdiySCAadsF4

On Sun, 12 Apr 2020 23:09:53 +0200
Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wrote:

> The OBJECT() macro is defined as:
>=20
>   #define OBJECT(obj) ((Object *)(obj))
>=20
> Remove unnecessary OBJECT() casts.
>=20
> Patch created mechanically using spatch with this script:
>=20
>   @@
>   typedef Object;
>   Object *o;
>   @@
>   -   OBJECT(o)
>   +   o
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/core/bus.c                       | 2 +-
>  hw/ide/ahci-allwinner.c             | 2 +-
>  hw/ipmi/smbus_ipmi.c                | 2 +-
>  hw/microblaze/petalogix_ml605_mmu.c | 8 ++++----
>  hw/s390x/sclp.c                     | 2 +-
>  monitor/misc.c                      | 3 +--
>  qom/object.c                        | 4 ++--
>  7 files changed, 11 insertions(+), 12 deletions(-)
>=20

s390x part:

Acked-by: Cornelia Huck <cohuck@redhat.com>

