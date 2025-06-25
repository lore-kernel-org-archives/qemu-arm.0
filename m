Received: by 2002:a05:7301:4085:b0:178:84eb:402c with SMTP id pt5csp723437dyb;
        Wed, 25 Jun 2025 02:23:47 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVlklhsWNWjIAe/2FgzK0o21eKKoMzoTCTqM/yIlHDDLzQ2oBwP2e8Aq7cZYsqfAwXnpbqTeivqOx7TAw==@linaro.org
X-Google-Smtp-Source: AGHT+IGgEBLIdDOLWxR7PqKxWbSgWXpLq/RLoOVfLHMMjO53gEA0P38QtmuWUksu4BiJKlqTDFXw
X-Received: by 2002:a05:6214:d64:b0:6fa:9a6a:7cfc with SMTP id 6a1803df08f44-6fd5ef8394emr26373616d6.26.1750843427379;
        Wed, 25 Jun 2025 02:23:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750843427; cv=none;
        d=google.com; s=arc-20240605;
        b=kH+XtSFERkIkT8o8tgbB40gzBHqT3v7hwaESJS1mIjHo0ucZ5XCwqCeChAZvrDW2Ou
         BBmm78YM4evcOmUkE/uSigecHp732fELsk0ugLNe/RTHTNIUfUPNLW5vUv0G8ZUaUoqf
         wqEV02OQrSPOvfsTavaU6biHmNRYfvgq1BQVDq/LHN5WoMszY401fXekZHJlgFrW4Mu1
         e1D8AHbGM8YyWxccM2uA5pre8X7eWWCVhJbb11LeorMvkizD5rqnWV+NrV82hVaoe5Oh
         osztQkXoBjw7jP5cD0la9XsGWoB5+PPnNxob6miMZfShxRvRcKEKxObsgENKcQ/diMT+
         4dOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:dkim-signature;
        bh=bZ+XYuox0wC95cywpvr8h67ROsM30izGhUHLxDsrux8=;
        fh=Eo1vVuYmLOM1PpHufm6LdIFf2/OgF2geqCPa3GSdfbY=;
        b=kOJqyKNIaKcujLG2Im01VIBnnQ2uEkx5v6JSP4chGxO+st9KVDb0nAJMqxzQYPcea3
         MmCy/twgYgT0RiyH/fSnJPzpJu462ne1zxOSy7TGBvHVmBX/uVvTxftxvu5N1r53xJMy
         VA1Ux04NfDNs8Cl4nvmLPQXsSi7cYfnlTMPf6yix7I1WSFp1susXeWuh58DBZEOT4/ek
         fKqOS1vbw1S1h2E1W+6ZQGWH0uB20Fq2ZDYpyptX8sCn6ybdKJN903+n4ty5xkQBYH7n
         Z0xQzGhu9eMU+rmb2kzqFptQhHYab1H1BnJGMnxpzUbk7qMuK1ZUa3qEIKSwrIfs2Z9F
         xCNQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=EbAlDXl8;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6fd09530fcfsi130909196d6.231.2025.06.25.02.23.47
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:23:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=EbAlDXl8;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750843427;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:  references:references;
	bh=bZ+XYuox0wC95cywpvr8h67ROsM30izGhUHLxDsrux8=;
	b=EbAlDXl84z+ilfUPAc2V8escLTLxP81D9jk05dVxfYxl+V9ffb8JHTfMIDiSWHZWaMi3Jk
	0zg+OEZbbr7v7VE4OAR3uCtFPi75pHYHZ2H7127tNkS6nm8z+uAidMhKZBmdqWMR3b1a2B
	01J6nvO+ZSaWqTw2zZVm90xZXFyO2h0=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-636-pPsRU3IcO_eApNH12hmkAQ-1; Wed,
 25 Jun 2025 05:23:43 -0400
X-MC-Unique: pPsRU3IcO_eApNH12hmkAQ-1
X-Mimecast-MFC-AGG-ID: pPsRU3IcO_eApNH12hmkAQ_1750843422
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D8E331809C89;
	Wed, 25 Jun 2025 09:23:40 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.177])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 91DCC19560A3;
	Wed, 25 Jun 2025 09:23:33 +0000 (UTC)
Date: Wed, 25 Jun 2025 10:23:29 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: Cornelia Huck <cohuck@redhat.com>, eric.auger.pro@gmail.com,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org, kvmarm@lists.linux.dev,
	peter.maydell@linaro.org, richard.henderson@linaro.org,
	alex.bennee@linaro.org, maz@kernel.org, oliver.upton@linux.dev,
	sebott@redhat.com, shameerali.kolothum.thodi@huawei.com,
	armbru@redhat.com, abologna@redhat.com, jdenemar@redhat.com,
	agraf@csgraf.de, shahuang@redhat.com, mark.rutland@arm.com,
	philmd@linaro.org, pbonzini@redhat.com
Subject: Re: [PATCH v8 12/14] arm/cpu: Add sysreg generation scripts
Message-ID: <aFvAEXWi7PUbVAud@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20250617153931.1330449-1-cohuck@redhat.com>
 <20250617153931.1330449-13-cohuck@redhat.com>
 <87h60e1ies.fsf@redhat.com>
 <de402ecb-8d45-4e42-a805-cd3aaef8dc93@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <de402ecb-8d45-4e42-a805-cd3aaef8dc93@redhat.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
X-TUID: z9ab/6E40Pxu

On Wed, Jun 25, 2025 at 11:16:22AM +0200, Eric Auger wrote:
> Hi Connie,
> 
> On 6/17/25 5:45 PM, Cornelia Huck wrote:
> > On Tue, Jun 17 2025, Cornelia Huck <cohuck@redhat.com> wrote:
> >
> >> diff --git a/scripts/arm-gen-cpu-sysregs-header.awk b/scripts/arm-gen-cpu-sysregs-header.awk
> >> new file mode 100755
> >> index 000000000000..f92bbbafa727
> >> --- /dev/null
> >> +++ b/scripts/arm-gen-cpu-sysregs-header.awk
> >> @@ -0,0 +1,37 @@
> >> +#!/bin/awk -f
> >> +# SPDX-License-Identifier: GPL-2.0-or-later
> >> +# arm-gen-cpu-sysregs-header.awk: arm64 sysreg header include generator
> >> +#
> >> +# Usage: awk -f arm-gen-cpu-sysregs-header.awk $LINUX_PATH/arch/arm64/tools/sysreg
> >> +
> >> +BEGIN {
> >> +    print "/* SPDX-License-Identifier: GPL-2.0-or-later */"
> > FWIW, checkpatch.pl chokes on this:
> >
> > ^* matches null string many times in regex; marked by <-- HERE in m/^* <-- HERE /"$/ at scripts/checkpatch.pl line 1389.
> > ERROR: Saw unacceptable licenses '*/"', valid choices for QEMU are:
> > GPL-2.0-or-later
> > GPL-2.0-only
> > LGPL-2.1-only
> > LGPL-2.1-or-later
> > BSD-2-Clause
> > BSD-3-Clause
> > MIT
> > total: 1 errors, 0 warnings, 76 lines checked
> 
> so don't we need to improve checkpatch.pl to silence this error?

Its regex gets confused by the trailing " after the comment end. We
could fix it, but ignoring the error is also valid as this is a
highly unusual file that's not likely to be common through our
source tree.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
