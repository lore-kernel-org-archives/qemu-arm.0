Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp1503162lfp;
        Tue, 21 Jan 2020 05:54:59 -0800 (PST)
X-Google-Smtp-Source: APXvYqwqge0b9y3QWi8bAT3vd1TzWWa/OUMmF+mNe/tgnLWNRTvW7o5k/Mq4bnLgFhrFPTCrWCw2
X-Received: by 2002:aed:3786:: with SMTP id j6mr4666684qtb.62.1579614898932;
        Tue, 21 Jan 2020 05:54:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579614898; cv=none;
        d=google.com; s=arc-20160816;
        b=LZIJacWYYY8icHo7sipmp3Jw2jNSQlxiEz3CFGDKcz2yxaOy5XS2SEGLk5khfO7SPU
         KtP8oUH0WGDJ0iMG6hVdi1LV7peppyIVKR6rEJuyn1cymuD/hdzk+sFy8erjmXoVXH/K
         mYWG7fTpGy8X9Fq2lEnGY6VBwc+ow79PYoQ8i/AvKB0YLbs3zG8QyZXDJOr7P6lt+ue+
         ZejowSdTRdWJeijAqFEDJ4jj3cICMZhW42tnBOo0rw39SBg4WAjuz7iz8GdByZSmTYC7
         DEifEe4bMmO07IF5DUzix/uIC7PQZsRUfPZ95g5RYXrRAc8OE7L5okYwnWdBRz3VIdhX
         ecLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:user-agent:message-id:in-reply-to:date:references
         :subject:to:from:dkim-signature;
        bh=gf+EqPnWCVY7K5HI5R7cyodwc3CP8L/GJIq6g3rpOpw=;
        b=ME57v58cgfjRGBlk63/gCI/y73fWT4/dznNJ3ohlFV05s97saSnU/6pFFHlzmsaiFW
         LRB/gs3o8dKQXgbLbO9Yr563ttrGUN7vCJkm4AX+KhvCjd0EINm2VSFC1z7mClNx7qQN
         hy1MOIVYolzdG7/fePX5WUFiy1CVsdgfBctf7X1gYsV+oQD+0OOFCLpQ1g6qaq5E9mMT
         p5mFurYLrefbeA+yHQy1AQEV9qdXjZXGPGxNoyqojgXaXI4jlY6IRok3dz7cUv2HBCem
         pQcNan6Q/gP8G4okifk8N10Rh5u/Y8kEJOIrMnsnB7Lq4YQdtv8l8Qh3CMO4kYndXYOp
         RNnw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=jG+vrown;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n17si20689754qtc.336.2020.01.21.05.54.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Jan 2020 05:54:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=jG+vrown;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ittzd-0003W6-TY
	for alex.bennee@linaro.org; Tue, 21 Jan 2020 08:54:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54564)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1itsuI-0000lm-Pi
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 07:45:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1itsuE-0003SK-RI
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 07:45:22 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:51365
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1itsuE-0003Qa-Ak
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 07:45:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579610717;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gf+EqPnWCVY7K5HI5R7cyodwc3CP8L/GJIq6g3rpOpw=;
 b=jG+vrownkKNqCjepd7hzMYOtzshvb4SZ2L7s7bf5UQ2Bs2Mt3c1drWKDP45pxLCNfDJKr5
 FBAMzQ6h4NzAgSqhaoOlDmrxiB8yQwQ3gpqWhvlK5mISOwFFuJBZMqLo+tEP60IK5D8dy8
 IWGq/y9KRxCknNMMOwaBCqSFQP9E7Vk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-229-bPKRfJwIM4-wzUqyocoBNA-1; Tue, 21 Jan 2020 07:45:16 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7A58A8017CC;
 Tue, 21 Jan 2020 12:45:14 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-131.ams2.redhat.com
 [10.36.116.131])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DA3A984DB3;
 Tue, 21 Jan 2020 12:45:07 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 3BA251138600; Tue, 21 Jan 2020 13:45:06 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v2 07/10] qdev: Abort if the root machine container is
 missing
References: <20200121110349.25842-1-philmd@redhat.com>
 <20200121110349.25842-8-philmd@redhat.com>
Date: Tue, 21 Jan 2020 13:45:06 +0100
In-Reply-To: <20200121110349.25842-8-philmd@redhat.com> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Tue, 21 Jan 2020 12:03:46
 +0100")
Message-ID: <87k15ldlm5.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: bPKRfJwIM4-wzUqyocoBNA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
 Marcelo Tosatti <mtosatti@redhat.com>,
 "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Like Xu <like.xu@linux.intel.com>,
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 qemu-devel@nongnu.org, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uxsVJFNyxlq1

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> The QEMU device API (qdev) relies on having the '/machine'
> container always available.
>
> If it is missing, QEMU will later crash dereferencing a NULL
> pointer, we will get a SEGV, open a debugger, look at the
> backtrace, and figure out we messed with QOM.
> Or we can use g_assert() which abort, displaying the filename
> and line number, so we can quickly open our favorite IDE.
> Prefer the later, to save time to developers.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
> v2: New patch
> ---
>  hw/core/qdev.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/hw/core/qdev.c b/hw/core/qdev.c
> index 58e87d336d..d30cf6320b 100644
> --- a/hw/core/qdev.c
> +++ b/hw/core/qdev.c
> @@ -1143,6 +1143,7 @@ Object *qdev_get_machine(void)
> =20
>      if (dev =3D=3D NULL) {
>          dev =3D container_get(object_get_root(), "/machine");
> +        g_assert(dev !=3D NULL);
>      }
> =20
>      return dev;

container_get()'s contract promises it won't return null.  I think the
assertion belongs there instead.

