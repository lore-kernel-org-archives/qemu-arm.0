Received: by 2002:a05:7301:4085:b0:178:84eb:402c with SMTP id pt5csp723996dyb;
        Wed, 25 Jun 2025 02:25:07 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVOeJRh/e8spBNaWmUyf4mjwoewGQmm+QcIi9PxItPK6lr+O2wzHPTDiLKsirAlLnF4bq3P1VuKR1qyYA==@linaro.org
X-Google-Smtp-Source: AGHT+IEzxwtnfkie9M3Nvx/Yfc1+SlaTjTk1WJcnc3XerGAQzHn3JFJt/FskFXs2tt+O8rt0NXxu
X-Received: by 2002:a05:622a:1101:b0:4a1:3b18:598a with SMTP id d75a77b69052e-4a7c05fbd48mr37782511cf.5.1750843507351;
        Wed, 25 Jun 2025 02:25:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750843507; cv=none;
        d=google.com; s=arc-20240605;
        b=XXnqOYlaxQpB11+GPJjE3J6BsFxqIfxeI9QOylohRarUlTmoDI+bIc0qsHKQL+whcQ
         RZETvgPlOFcvx8dRMoGZy+ztRI2NkzIyiQR2goINt8oHxPbKSGrN/tuAJayWnByPc7MQ
         Ol6OJdKY1TrIfWUz6N5isqiDEeaJLDTkfs+UUGe99moNNfO4Fz7y7/kZNukxVKSTgrkS
         CMNEjZCt9pSwuD+aBgF67KXRP8upBhRrAxPI0jUVN005BTMtz4Yg0ANXGsnSiUXdc9dX
         tn5mhkRGazzAXuYK6xifMf41jvmBDamkog/NXs5t8v79dQT+RQ6Ghgja5QidyrSevu4h
         XXFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=mime-version:message-id:date:user-agent:references:organization
         :in-reply-to:subject:cc:to:from:dkim-signature;
        bh=J98pa0OgM1m3PXwe+TSA6SiLP5ra/6pWKwelnbc1vTA=;
        fh=wcSkgx08J2c8+J/nuIxxa9nj1zB8FwiCrauqmmA5Ov4=;
        b=dRzYKakuAYv88ZnaBp/zd8qtqH9YdNC14WWtpwJoNNNc5cJddBhSH2L6/yrIZMpAM8
         DGzt0b7N7MSSkC+kcDd9jjaQRkUipMr9OI0qmDC1ijJzNvMPf69sCQ2caYYf45GR2J4Z
         cPHk5LHWJJ4i4gzQo3Kykv73hqb6PB3GKIuaAS1VWh3xYm0tRUSOi5s50LW3VTxlNh5Y
         F/9pL+s6veKg37RO1S4DCSsXNd8sSBB/XaWmwh5cZyx4pFj6fkQ++Y4To5NArII2qjg/
         3hUxpIHblyd6c7gDY6Wg3+HKM0xyPfSJebrgAKlTx+ygUp6b/ph6tAJQVDopcTsD6Gmx
         W+GQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FZRZ4xhc;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <cohuck@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d75a77b69052e-4a77a0d6167si127406661cf.488.2025.06.25.02.25.07
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:25:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of cohuck@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FZRZ4xhc;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750843507;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=J98pa0OgM1m3PXwe+TSA6SiLP5ra/6pWKwelnbc1vTA=;
	b=FZRZ4xhch33cHopSbAp0srWQIipyffZtcWn6cKudUmiN2B1qHY2t/j271mnoQGYZVtKjFN
	JYnebSfMlq7eMGUH3HmxbiC65rh1adUmv/Rj2xZkqrFJJjwMd29SUafLWyHOSKGVau+InS
	VQPQwBQNn5artQu30Vd253qU7vf01a8=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-187-1BiK8-ymN6Wxp76_fZZwoQ-1; Wed,
 25 Jun 2025 05:25:03 -0400
X-MC-Unique: 1BiK8-ymN6Wxp76_fZZwoQ-1
X-Mimecast-MFC-AGG-ID: 1BiK8-ymN6Wxp76_fZZwoQ_1750843501
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id CDB9D195608A;
	Wed, 25 Jun 2025 09:25:00 +0000 (UTC)
Received: from localhost (mschlens-int.str.redhat.com [10.33.192.203])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C93CA1956096;
	Wed, 25 Jun 2025 09:24:58 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: eric.auger@redhat.com, eric.auger.pro@gmail.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, kvmarm@lists.linux.dev, peter.maydell@linaro.org,
 richard.henderson@linaro.org, alex.bennee@linaro.org, maz@kernel.org,
 oliver.upton@linux.dev, sebott@redhat.com,
 shameerali.kolothum.thodi@huawei.com, armbru@redhat.com,
 berrange@redhat.com, abologna@redhat.com, jdenemar@redhat.com,
 agraf@csgraf.de
Cc: shahuang@redhat.com, mark.rutland@arm.com, philmd@linaro.org,
 pbonzini@redhat.com
Subject: Re: [PATCH v8 12/14] arm/cpu: Add sysreg generation scripts
In-Reply-To: <de402ecb-8d45-4e42-a805-cd3aaef8dc93@redhat.com>
Organization: "Red Hat GmbH, Sitz: Werner-von-Siemens-Ring 12, D-85630
 Grasbrunn, Handelsregister: Amtsgericht =?utf-8?Q?M=C3=BCnchen=2C?= HRB
 153243,
 =?utf-8?Q?Gesch=C3=A4ftsf=C3=BChrer=3A?= Ryan Barnhart, Charles Cachera,
 Avril Crosse O'Flaherty"
References: <20250617153931.1330449-1-cohuck@redhat.com>
 <20250617153931.1330449-13-cohuck@redhat.com> <87h60e1ies.fsf@redhat.com>
 <de402ecb-8d45-4e42-a805-cd3aaef8dc93@redhat.com>
User-Agent: Notmuch/0.38.3 (https://notmuchmail.org)
Date: Wed, 25 Jun 2025 11:24:55 +0200
Message-ID: <874iw4i36g.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
X-TUID: ja2bnx8alNoj

On Wed, Jun 25 2025, Eric Auger <eric.auger@redhat.com> wrote:

> Hi Connie,
>
> On 6/17/25 5:45 PM, Cornelia Huck wrote:
>> On Tue, Jun 17 2025, Cornelia Huck <cohuck@redhat.com> wrote:
>>
>>> diff --git a/scripts/arm-gen-cpu-sysregs-header.awk b/scripts/arm-gen-cpu-sysregs-header.awk
>>> new file mode 100755
>>> index 000000000000..f92bbbafa727
>>> --- /dev/null
>>> +++ b/scripts/arm-gen-cpu-sysregs-header.awk
>>> @@ -0,0 +1,37 @@
>>> +#!/bin/awk -f
>>> +# SPDX-License-Identifier: GPL-2.0-or-later
>>> +# arm-gen-cpu-sysregs-header.awk: arm64 sysreg header include generator
>>> +#
>>> +# Usage: awk -f arm-gen-cpu-sysregs-header.awk $LINUX_PATH/arch/arm64/tools/sysreg
>>> +
>>> +BEGIN {
>>> +    print "/* SPDX-License-Identifier: GPL-2.0-or-later */"
>> FWIW, checkpatch.pl chokes on this:
>>
>> ^* matches null string many times in regex; marked by <-- HERE in m/^* <-- HERE /"$/ at scripts/checkpatch.pl line 1389.
>> ERROR: Saw unacceptable licenses '*/"', valid choices for QEMU are:
>> GPL-2.0-or-later
>> GPL-2.0-only
>> LGPL-2.1-only
>> LGPL-2.1-or-later
>> BSD-2-Clause
>> BSD-3-Clause
>> MIT
>> total: 1 errors, 0 warnings, 76 lines checked
>
> so don't we need to improve checkpatch.pl to silence this error?

Yes, that would be good, but my perl-fu is basically nonexistant :(
