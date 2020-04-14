Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp4882317lfm;
        Tue, 14 Apr 2020 04:32:44 -0700 (PDT)
X-Google-Smtp-Source: APiQypKbnvZF/WZDUl/h9i9EI61sVMmn4/oVFqEJWfMGN9lkvneuqyUTejzNU8z2WEDW2Y7EdnT3
X-Received: by 2002:a05:6214:3ad:: with SMTP id m13mr13719682qvy.57.1586863964677;
        Tue, 14 Apr 2020 04:32:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586863964; cv=none;
        d=google.com; s=arc-20160816;
        b=j5fo1hEz6a0TjFPhDZEvPkTnfl4KpyDDAXOHMH4xznt9B0AcsouEKG1rxWl6SjHzqL
         JukcVWqK9XkLbGTdTZ3LRuNKo7hc5OvS3c89QrEG02zUBgbBUIPwMFgxI0lZH4GzcEJK
         Euf2b6uhv0wZ3/vykOTys6yfiyqu2NDmm/T3Zarwa7JCzvgJqCv02aOdLu7Hx9ZTgAWq
         1bdaIxznIhn7xV0Gtccr4faEPuuc2yNzbKJt3ma0tW0pDrdjzXMMXeNb6O2jbC5U2JvY
         FuUMWode7+p2ax+13uMQAjdC2JrfQym9Luw5KDqND/l8lSoZTmCUp3e/FCcRBgaXDEa/
         vfuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:user-agent:message-id:in-reply-to:date:references
         :subject:to:from:dkim-signature;
        bh=DYr/KkW0QKxRMJqYT/HOwSxpZUuq1t2YsKc/mTSrfYk=;
        b=EU4I6gcf1tL4PJeXIl2cCNtGmCbJX6FEJfIKXVtOrB7uap31/1643o5iMjOJFhJ+EF
         zyFXt8JWWpZ7hJuJYeplVWY7vPLyLM5r1IxLJzflddjWBmxkMeOlBo+43L7LqEKkYb4Z
         cMaJlCz0NneTKYaJivYfhLK1aZwMkBuhCPVMw/OLlZ47yRqA5KSpTKMPBT7c8Sl9xsIn
         ksmE8irrlu6velxzDJFTlsOhclb+er2uJS+Pio5E8ruisWXTjTye+tyj2dEDHsucdJF9
         g9pTNNT/uPLWAuwfQPDro+DmcHcgdZHaCZp1bMd/83E+2WU+5vG87nkg0+DNeS736ay/
         sCeQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=XAWn5qMp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 67si7679979qkm.91.2020.04.14.04.32.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Apr 2020 04:32:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=XAWn5qMp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jOJo4-0001AI-3C
	for alex.bennee@linaro.org; Tue, 14 Apr 2020 07:32:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55292)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1jOJnb-00019r-47
 for qemu-arm@nongnu.org; Tue, 14 Apr 2020 07:32:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1jOJna-0003o1-4D
 for qemu-arm@nongnu.org; Tue, 14 Apr 2020 07:32:15 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:22163
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1jOJna-0003nd-1F
 for qemu-arm@nongnu.org; Tue, 14 Apr 2020 07:32:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586863933;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DYr/KkW0QKxRMJqYT/HOwSxpZUuq1t2YsKc/mTSrfYk=;
 b=XAWn5qMpSMcXQnMjSRSqUL6fuB47VcoPM6wdz3wJAPwY2+Tu7DbueIcrxSWX4CdL+VrTek
 EaKYRxrPBMWqnipsjb0v7hmpEBZZL7zywdrEnJkLSwy2+06Vg41SrvQ88XBy2qmEfRX6Q0
 Olw5y4AVhVN91JP44tj+IUlD4c+YRpw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-415-9sDNE59FPAeERBjNn-43JQ-1; Tue, 14 Apr 2020 07:32:11 -0400
X-MC-Unique: 9sDNE59FPAeERBjNn-43JQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 08406107BA97;
 Tue, 14 Apr 2020 11:32:08 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-113-20.ams2.redhat.com
 [10.36.113.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3BCC15D9E2;
 Tue, 14 Apr 2020 11:32:01 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id B5AB011385C8; Tue, 14 Apr 2020 13:31:59 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH-for-5.1 3/3] hw: Remove unnecessary DEVICE() cast
References: <20200412210954.32313-1-f4bug@amsat.org>
 <20200412210954.32313-4-f4bug@amsat.org>
Date: Tue, 14 Apr 2020 13:31:59 +0200
In-Reply-To: <20200412210954.32313-4-f4bug@amsat.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Sun, 12 Apr 2020 23:09:54
 +0200")
Message-ID: <87lfmytia8.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
 Gerd Hoffmann <kraxel@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 qemu-block@nongnu.org, Paul Durrant <paul@xen.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Joel Stanley <joel@jms.id.au>, Anthony Perard <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org, Richard Henderson <rth@twiddle.net>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Corey Minyard <minyard@acm.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Peter Chubb <peter.chubb@nicta.com.au>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>, Cornelia Huck <cohuck@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FLFNKfKsGKEZ

Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> The DEVICE() macro is defined as:
>
>   #define DEVICE(obj) OBJECT_CHECK(DeviceState, (obj), TYPE_DEVICE)
>
> Remove unnecessary DEVICE() casts.
>
> Patch created mechanically using spatch with this script:
>
>   @@
>   typedef DeviceState;
>   DeviceState *s;
>   @@
>   -   DEVICE(s)
>   +   s
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

DEVICE(obj) expands to

    OBJECT_CHECK(DeviceState, (obj), TYPE_DEVICE)

and then to

    ((DeviceState *)object_dynamic_cast_assert((Object *)(obj), (name),
                                               __FILE__, __LINE__, __func__=
))

object_dynamic_cast_assert() asserts @obj can be safely converted to the
type named by @name, and returns @obj.

Your patch drops the assertion.

The assertion can only fail when @obj points to something other than its
stated type, i.e. when we're in undefined behavior country.

Preferably with this argument worked into your commit message:
Reviewed-by: Markus Armbruster <armbru@redhat.com>

There are many similar macros.  Should they get the same treatment?

