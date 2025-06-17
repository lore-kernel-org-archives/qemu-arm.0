Received: by 2002:a17:504:5d2c:b0:1be9:327d:8ee3 with SMTP id et12csp2605193njc;
        Tue, 17 Jun 2025 08:45:35 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXtR3Fvy8QD3Fz9a16BVLDsxMBLoTIEvJ6sxpv33/etNCe/041U/zviaje5/lkMkfMBd3EazDzQyQudkw==@linaro.org
X-Google-Smtp-Source: AGHT+IFFhz3VApTWZjJJe9nUgWkIYBvB5HkTbmJYt8j0rPwWwfBdfYoQmYQ6owmXBfYOY4pi2NRq
X-Received: by 2002:a05:6a00:b8b:b0:748:6a12:1b47 with SMTP id d2e1a72fcca58-7489c47e470mr18065396b3a.10.1750175135448;
        Tue, 17 Jun 2025 08:45:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750175135; cv=none;
        d=google.com; s=arc-20240605;
        b=aSOLErF5vqGY+zKfyb0ZiT0SL/uQJCrxJy2Lefbl0NhVw4GVZALaNFGYYLNQ7s1t4E
         honUK82QguIuPJ1IQniZNCYmmvTNA63bEbstGjHOD83dE45WIgPh28mURLVlq4e9ehEp
         dVOsx41SY1fNHCALALnPs8+7SetPg21lcQwPV0IaQS/e92CRIV5dhpqUEpWvAam88hw2
         TmbSdlzwREv5npJsx16q3ztPhMc9+B9AkDYkcuKZHul3JpYQhdWaHYs6w3XhoQCgQryM
         RnZGhUUJa3S9758MWK6rP6h7wZ1nrEi0xowdpTdcms/bE3w7zJXyfN6oJhyaoLmE6Q6q
         U1xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=mime-version:message-id:date:user-agent:references:organization
         :in-reply-to:subject:cc:to:from:dkim-signature;
        bh=pimc7ToHXzj5NjsL3cnFa44sV45BUXzhB1gmiO8PNfc=;
        fh=wICZTdRVE8hcXpDo2ZiTXxCMq4RcRFA5Y76mB+7LaeM=;
        b=BMWvIVuDEKniibFkRiKXzEoZxynNvsGiNn+U2oER7gy2cXLGdHO9Rup8iEjhJ2r1Dt
         n2+e9af/Cq71BVQTdlVN6nC2mfrFM2ZX+QfeEqZ19J3hhIgoWSjkdmEYrT39+cgjLyva
         71QtYFo6vVjz0CwNizO0uaDt33pLeEAGnoZo+hqScj2L1w1RhtCRaP5S2Mor562GzZCt
         qlhpHo9IcteRGJgNqHvZA5TiE7/1RGkciuQgcKrPmovlr4stwmEOFcsvZFp0Q0FvwIdf
         Jo9LzKTUShLbw2IuP19TJBn2ynnMcXZgkYpORRgB/Al4U8GGzxG92WQJo7WUpXA+TnH0
         FKrg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Viho6jcx;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <cohuck@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id d2e1a72fcca58-748900e2aa0si13692910b3a.137.2025.06.17.08.45.35
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 08:45:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of cohuck@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Viho6jcx;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750175134;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pimc7ToHXzj5NjsL3cnFa44sV45BUXzhB1gmiO8PNfc=;
	b=Viho6jcxsh6TlbNIamcLzT2LFJZMf7S9yCEXczgurpIFY1RBdJ9EOtXK+8GntwFAFLGILK
	KKLt4SStK4VJepOwatw2Zkxz67UDZZPvYatTxb/hsPmM2Mw1y+WQiIFLrY6le6a5vgZZla
	wA22FshIUn5VJOzt7Vm4NOJtzWcP/qw=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-642-KFe1QetPPQC4DZGrfoLaKw-1; Tue,
 17 Jun 2025 11:45:27 -0400
X-MC-Unique: KFe1QetPPQC4DZGrfoLaKw-1
X-Mimecast-MFC-AGG-ID: KFe1QetPPQC4DZGrfoLaKw_1750175119
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 37CE81800284;
	Tue, 17 Jun 2025 15:45:19 +0000 (UTC)
Received: from localhost (pixel-6a.str.redhat.com [10.33.192.205])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 257B130001B1;
	Tue, 17 Jun 2025 15:45:17 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, kvmarm@lists.linux.dev, peter.maydell@linaro.org,
 richard.henderson@linaro.org, alex.bennee@linaro.org, maz@kernel.org,
 oliver.upton@linux.dev, sebott@redhat.com,
 shameerali.kolothum.thodi@huawei.com, armbru@redhat.com,
 berrange@redhat.com, abologna@redhat.com, jdenemar@redhat.com,
 agraf@csgraf.de
Cc: shahuang@redhat.com, mark.rutland@arm.com, philmd@linaro.org,
 pbonzini@redhat.com
Subject: Re: [PATCH v8 12/14] arm/cpu: Add sysreg generation scripts
In-Reply-To: <20250617153931.1330449-13-cohuck@redhat.com>
Organization: "Red Hat GmbH, Sitz: Werner-von-Siemens-Ring 12, D-85630
 Grasbrunn, Handelsregister: Amtsgericht =?utf-8?Q?M=C3=BCnchen=2C?= HRB
 153243,
 =?utf-8?Q?Gesch=C3=A4ftsf=C3=BChrer=3A?= Ryan Barnhart, Charles Cachera,
 Avril Crosse O'Flaherty"
References: <20250617153931.1330449-1-cohuck@redhat.com>
 <20250617153931.1330449-13-cohuck@redhat.com>
User-Agent: Notmuch/0.38.3 (https://notmuchmail.org)
Date: Tue, 17 Jun 2025 17:45:15 +0200
Message-ID: <87h60e1ies.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-TUID: SLnPxe7HWJyw

On Tue, Jun 17 2025, Cornelia Huck <cohuck@redhat.com> wrote:

> diff --git a/scripts/arm-gen-cpu-sysregs-header.awk b/scripts/arm-gen-cpu-sysregs-header.awk
> new file mode 100755
> index 000000000000..f92bbbafa727
> --- /dev/null
> +++ b/scripts/arm-gen-cpu-sysregs-header.awk
> @@ -0,0 +1,37 @@
> +#!/bin/awk -f
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +# arm-gen-cpu-sysregs-header.awk: arm64 sysreg header include generator
> +#
> +# Usage: awk -f arm-gen-cpu-sysregs-header.awk $LINUX_PATH/arch/arm64/tools/sysreg
> +
> +BEGIN {
> +    print "/* SPDX-License-Identifier: GPL-2.0-or-later */"

FWIW, checkpatch.pl chokes on this:

^* matches null string many times in regex; marked by <-- HERE in m/^* <-- HERE /"$/ at scripts/checkpatch.pl line 1389.
ERROR: Saw unacceptable licenses '*/"', valid choices for QEMU are:
GPL-2.0-or-later
GPL-2.0-only
LGPL-2.1-only
LGPL-2.1-or-later
BSD-2-Clause
BSD-3-Clause
MIT
total: 1 errors, 0 warnings, 76 lines checked


> +    print "/* GENERATED FILE, DO NOT EDIT */"
> +    print "/* use arm-gen-cpu-sysregs-header.awk to regenerate */"
> +} END {
> +    print ""
> +}
> +
