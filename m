Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp164554lfb;
        Thu, 14 May 2020 21:41:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxogTa1brevC1niauqfl0ME5RA0GRKSg1VLxzSIAfRlynbJMo25o2A14gJ38Oeff7pWcjzc
X-Received: by 2002:a0c:e7cc:: with SMTP id c12mr1759193qvo.231.1589517665030;
        Thu, 14 May 2020 21:41:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589517665; cv=none;
        d=google.com; s=arc-20160816;
        b=KI2n/JR2H8pRM9czH1T2Av5VWevmas65smxmnHr+9YNsVZl4y0YvdIFm+/na7Eho3A
         BbyuZ1LE3+V7Ctc1krZoo22EFQQq2x+Z3nVnH+mMsHzeCg3D4e4fZKJ4mxEF6/2gVIjD
         ktUmQspAY9BfQvAZ7DHMiueNlVlC2xHmkOOhhFgsjxsYtnDUCgCKIF22BkrjP8FUBBhF
         xtLQAR1mQUrW+4xd4Z8xNTVcwHH/CmvW3gJT67KWFh//xx6x2gc9gXlnWvzqi8lC5Ce4
         wllr1+zmVWlSd19vEXAvkRxNgjofjWZutCYKOHAJCQ8ct8G/BzmQsoPWJEqJhZpGyxqZ
         8zyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:user-agent:message-id:in-reply-to:date:references
         :subject:to:from:dkim-signature;
        bh=OKJR3XWl1FD5yBYTcoQ2dBjNcY31o5w0McSpi+jkOug=;
        b=AWVqGt05DNqRjl4xxzcOoR2S7u/PbJHtSibqDTThnrNlAbsud8arSVRDL77IBU4dhH
         610U7f5zEOwKH6UCAxmSTmSrbzBi8wzy/YSl59zLSSGICqK9auTNfYS6ATLH8IyKqoXQ
         JlmFn3Hg3DeEHYiVSKZmn4PiyTlPX6X+ewXBB9wuEQJwVtm7d6cUNDWkdcNXKft52m2M
         J6SvY/gaHA8rGDqAHjFEjoUC4V1yD2BgUoAh4KXtMOJvMtGg7AcnT9VYPCdfE97TlT8w
         vlRfkNH1v8BWvNBQaAXRt5zVNi7un+dryxOUskdSbGVl+2qfLswlT2VRlViK6dS5ZiX4
         Zh2A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=XvMj7qjb;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o13si678791qti.8.2020.05.14.21.41.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 May 2020 21:41:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=XvMj7qjb;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jZS9g-0001fc-H8
	for alex.bennee@linaro.org; Fri, 15 May 2020 00:41:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jZS7z-0008If-PR
 for qemu-devel@nongnu.org; Fri, 15 May 2020 00:39:19 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:50263
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jZS7y-0007it-UG
 for qemu-devel@nongnu.org; Fri, 15 May 2020 00:39:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589517554;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OKJR3XWl1FD5yBYTcoQ2dBjNcY31o5w0McSpi+jkOug=;
 b=XvMj7qjbsdMLyUITpJNmPh/3qiusP+q3OWLjYbI/QcMRwSWgmiFfybZYgaoB7OUWh8EAH6
 cjcrl42zgBTpoK01KVVvUBteCKdhLhEfCwRn2W/n4agGla7+s4HG4hG2FI6vFeS55C0D52
 p0Pd7wdj5lcGdKCTsw0He5O+ueek/6Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-107-4tGOUR7dN4mlE7aK9dqnnQ-1; Fri, 15 May 2020 00:39:10 -0400
X-MC-Unique: 4tGOUR7dN4mlE7aK9dqnnQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C3776460;
 Fri, 15 May 2020 04:39:06 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-113-6.ams2.redhat.com [10.36.113.6])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7AD5360BE2;
 Fri, 15 May 2020 04:38:59 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 082E611358BC; Fri, 15 May 2020 06:38:58 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH v3 2/3] various: Remove unnecessary OBJECT() cast
References: <20200512070020.22782-1-f4bug@amsat.org>
 <20200512070020.22782-3-f4bug@amsat.org>
Date: Fri, 15 May 2020 06:38:57 +0200
In-Reply-To: <20200512070020.22782-3-f4bug@amsat.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Tue, 12 May 2020 09:00:19
 +0200")
Message-ID: <87r1vlstge.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=207.211.31.81; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/15 00:39:12
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Paul Durrant <paul@xen.org>,
 Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>, qemu-block@nongnu.org,
 qemu-trivial@nongnu.org, David Hildenbrand <david@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Joel Stanley <joel@jms.id.au>, Anthony Perard <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org, Richard Henderson <rth@twiddle.net>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Corey Minyard <minyard@acm.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Peter Chubb <peter.chubb@nicta.com.au>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>, qemu-ppc@nongnu.org,
 John Snow <jsnow@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
 "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>, Cornelia Huck <cohuck@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Corey Minyard <cminyard@mvista.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bW0SuwCf29+g

Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> The OBJECT() macro is defined as:
>
>   #define OBJECT(obj) ((Object *)(obj))
>
> Remove the unnecessary OBJECT() casts when we already know the
> pointer is of Object type.
>
> Patch created mechanically using spatch with this script:
>
>   @@
>   typedef Object;
>   Object *o;
>   @@
>   -   OBJECT(o)
>   +   o
>
> Acked-by: Cornelia Huck <cohuck@redhat.com>
> Acked-by: Corey Minyard <cminyard@mvista.com>
> Acked-by: John Snow <jsnow@redhat.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Markus Armbruster <armbru@redhat.com>

