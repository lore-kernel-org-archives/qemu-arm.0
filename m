Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp120095lfb;
        Fri, 8 May 2020 05:56:20 -0700 (PDT)
X-Google-Smtp-Source: APiQypIjGgu+uu6W6XiYrS2tZ76EubgMl6zeGUyHccphIy6D494gEbfxpbHvkC+RK4c1OpYjNlhf
X-Received: by 2002:ac8:7683:: with SMTP id g3mr2902043qtr.166.1588942580030;
        Fri, 08 May 2020 05:56:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588942580; cv=none;
        d=google.com; s=arc-20160816;
        b=L7eqFY+hYWRhAiq7HAFSheXFQl/Uvf25DDE+v0wu5V2XHJTLxGy5wniGnsMJYnQc8S
         lwL5GQBfynZp84CnOhaueg7tJdmIqBW62Fi18asWbVGMOQ/Xd8Mt+vSx+Jpqisj5cXah
         /svpCYol4J7uYxid+Om5wRnAD87TwR7A+gy8KkZPMoF5vVhJiy9RzZ1eEGVjEcMr5RBa
         FskHXm00aaHCgcKiP5HymfLb5npkKFHl6DNq6jI1S0jFA9IqFEB4WgYZVon+FjqgNywh
         HCJ54bg5BoAcizUGVCN5U72QwzCFO4J1rYscyR7MudC0cXiQAORcA6vpZw54wRkS5fU3
         tPgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:user-agent:message-id:in-reply-to:date:references
         :subject:to:from:dkim-signature;
        bh=mr4uqpTXg1sXYxmIwAO3pDUOz2ZcsDiSAVP7r/LI/bA=;
        b=n2vYGlO3kcpT+9d05Hi979L5fVHy0x2y1tQXjgwtTeUxe/TTacpxk9G6JKQWqRMkoh
         /Oo3agS61l/OBxTB3sXGieWaYkAnGV5Yx6sG7uzflVq3iUkPjf5gFs3P89RmKIJ3FM1v
         dlAQ1+OiZ0ck0f2ZqbcRJiy8DdFuiypxHf8bR5IrBhlZJ4ZHIE0UjIrC9ZWQswUaDGX5
         aL0cpXxxczLxUXOeifr0VNFoio3g+vDSx45fRroitgFBo/kU4MBEifZjwnFXWkTOGdxy
         qgP2Gku/7el8YcprbFrCcdn/Ql747TYp5kPnN7+dvwMfP0viWXy6rOWZSzxtp9/YSnoF
         UdSQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=dDia5XBl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id ci18si1217544qvb.177.2020.05.08.05.56.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 May 2020 05:56:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=dDia5XBl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jX2Y7-0000lo-DX
	for alex.bennee@linaro.org; Fri, 08 May 2020 08:56:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jX2S5-0004pX-8f
 for qemu-arm@nongnu.org; Fri, 08 May 2020 08:50:05 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:48954
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jX2S4-0007YY-Df
 for qemu-arm@nongnu.org; Fri, 08 May 2020 08:50:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588942203;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mr4uqpTXg1sXYxmIwAO3pDUOz2ZcsDiSAVP7r/LI/bA=;
 b=dDia5XBlTA3Wm7yyFulPmJDfJsgkrpLBMc749SFGqJui70j8b+3qjeYE+BOppuzaOPCFyu
 inUuaWXTaRwGfQqUyvl2Q+DnJ5MetqSjR4ESRFRhYGKt7PM0KDNU455sHRsez4UxYwpp9X
 Y5IMbaiaMp9LV+rRYXsWuLlUwJgtBHE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-373-4YAIeqf8OaueleRfKAlSYA-1; Fri, 08 May 2020 08:50:00 -0400
X-MC-Unique: 4YAIeqf8OaueleRfKAlSYA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ABB70800688;
 Fri,  8 May 2020 12:49:56 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-113-6.ams2.redhat.com [10.36.113.6])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 500E85D9CA;
 Fri,  8 May 2020 12:49:50 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E80F711358BC; Fri,  8 May 2020 14:49:48 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH v2 2/3] various: Remove unnecessary OBJECT() cast
References: <20200504100735.10269-1-f4bug@amsat.org>
 <20200504100735.10269-3-f4bug@amsat.org>
Date: Fri, 08 May 2020 14:49:48 +0200
In-Reply-To: <20200504100735.10269-3-f4bug@amsat.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Mon, 4 May 2020 12:07:34
 +0200")
Message-ID: <87mu6iy4k3.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=207.211.31.120; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/08 02:23:32
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Paul Durrant <paul@xen.org>,
 Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 qemu-block@nongnu.org, David Hildenbrand <david@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Joel Stanley <joel@jms.id.au>, Anthony Perard <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org, David Gibson <david@gibson.dropbear.id.au>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Corey Minyard <minyard@acm.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Peter Chubb <peter.chubb@nicta.com.au>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>, qemu-ppc@nongnu.org,
 John Snow <jsnow@redhat.com>, Richard Henderson <rth@twiddle.net>,
 "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>, Cornelia Huck <cohuck@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Corey Minyard <cminyard@mvista.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3VN/iivhdYfh

Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> The OBJECT() macro is defined as:
>
>   #define OBJECT(obj) ((Object *)(obj))
>
> which expands to:
>
>   ((Object *)object_dynamic_cast_assert((Object *)(obj), (name),
>                                         __FILE__, __LINE__, __func__))

Nope :)

> This assertion can only fail when @obj points to something other
> than its stated type, i.e. when we're in undefined behavior country.

There is no assertion.

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
> ---
> v2: Reword (Markus)

My rewording suggestion applied to PATCH 3, not to this one.

With v2's commit message;
Reviewed-by: Markus Armbruster <armbru@redhat.com>

