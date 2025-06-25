Received: by 2002:a05:7301:4085:b0:178:84eb:402c with SMTP id pt5csp726712dyb;
        Wed, 25 Jun 2025 02:31:43 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWUYIt5VJhXYNCyu18nIBWPvV2P3BdWZqZyN+XbkA9FkbKh9HhDSHFkKI8Gd80S5JvO0J0ff9t3wVdH6A==@linaro.org
X-Google-Smtp-Source: AGHT+IH6jxUBWkrVfrsSvl356fKtJBvn+Rag3KqeVaPmJ6/+MDYnEQyDSeqQCNbS9SWrImfZ7IpX
X-Received: by 2002:a05:620a:462c:b0:7d2:257e:21d6 with SMTP id af79cd13be357-7d4296359c8mr319322985a.9.1750843903794;
        Wed, 25 Jun 2025 02:31:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750843903; cv=none;
        d=google.com; s=arc-20240605;
        b=dKa15xFC8AxjkIZ+D3EboCWHD9+RWJt9J0Lu9nFg2ziPSX4WB5hAaGfpZAs+W9DamU
         GG9vx4hNZR83FpudKqoReHIuM3gkO47n9FgoCqeT68OmgV9JXKrky6ZLcl/3D5/FMO3E
         gHjh8rEwPZh1Hp7iV9wSXk1VfCxntTwbkBAnCRdA560fl7ff51J6YmbblFQNoSfJ7U6f
         f03m1rQo/wXX24jDLl9gWUedD2TQu9ogks7kBfVEJt5MtIEQ1nZzrIuRiXITV1IOIoMY
         D6yhykDucGEL9N0JPEk+57KM5dWCxXXdPl3X7oizDOQK42qKyIQryDpvlL4h11VQUEDm
         HvRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=d4kb+ErCz0mhW0bKU7GDl25eFlTih4IPbtlUUppkujA=;
        fh=aGYziE65ZXH4yK4pvayeGgDXCHX8Inf/OprzgpFmTYY=;
        b=exgfIijgOhTQxtl34LUx9vw45iYV0FN/I/yWbIc4ajfC8mW1i8Q3Bua6P+ahx0U3dw
         uQti38Ol0U6C1FkQkZ2GURqpQXfq76fZ5pVExbt7bhm6I/RozdMpAcjGB38xnZMdmdpw
         IQ2eDOoZLdaWYvt2CBDnTGUfwASs/3EyqV6xygDfxrQzcSJhvUuuNOwDN8gFf7qTX8zz
         WUbPAdDBhbvWcNZ9XC1F/wBkkwgr6GqXI+1u1v49NRWVZNTaZc5Xakklt1e8ZXYX2NPZ
         yPOploAB1ktPfMjBnAZqglCyiN1pfT1DBCdXfkGhrZsgRVH4pEteDEGDCd7noRXER7KT
         hgJg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=awVuurJ8;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id af79cd13be357-7d3f9a081d0si1137521885a.409.2025.06.25.02.31.43
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:31:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=awVuurJ8;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750843903;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d4kb+ErCz0mhW0bKU7GDl25eFlTih4IPbtlUUppkujA=;
	b=awVuurJ8CxQ9ZQS1jJqeLygJ1VXQslLPoD3ofbgvXmn2y3VnW3pORND3TIaBb9b4K7Ddi8
	DzEXkwl7VIDoPRrwxkAy+ebjoOU8IzUv++6Y+EZhDX8tkaVTgplKQmkDeuTzxf45osNDL0
	6hwGUA2bQLsazFHiVdqfKNZTukpkcEA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-49-2kQeGU9iMrCQ0XehMv3N3Q-1; Wed, 25 Jun 2025 05:31:39 -0400
X-MC-Unique: 2kQeGU9iMrCQ0XehMv3N3Q-1
X-Mimecast-MFC-AGG-ID: 2kQeGU9iMrCQ0XehMv3N3Q_1750843898
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-450de98b28eso3426205e9.0
        for <alex.bennee@linaro.org>; Wed, 25 Jun 2025 02:31:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750843898; x=1751448698;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d4kb+ErCz0mhW0bKU7GDl25eFlTih4IPbtlUUppkujA=;
        b=srWlsgGcs21QoJVmNzHQ75Sbb7JFh0G7Sd8HkLew/jQzKYsY34tt8FvjPxec2b17/a
         zbrq1R+g1Rg4MfoojoaiClljG3hcF+9P3aBp5LfyuH4J+E6mtNc/bjVXbSCKkIbfizFN
         vtXPs+u4U0+N8oy7dYWYM9+NIkx+QFxhhbZrILIpCSqpi+tkeAXN1LgRoJHiG/v1v660
         AIwU1abPbhEz0Ha1wID+8Wbvwc1otn+vmpadpVVmHfqSCl4gv9DzW/Md433yG6DnJ+d9
         QKqV3yQjqaHMPQfGtpoZmBIAjLVGWT+6zmIPlbnbd/RfT3DpCgMNI0OYhIl/YzHagtKo
         Rr6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUuHASIMtxk+xD4gAWMmGVcytgqAM2CKQ8WvrS8muezsRXkh9sqj6/WVHf2TJHceEmPQdyaWWS9XT0TaQ==@linaro.org
X-Gm-Message-State: AOJu0YzZJpvLK7BZ7O1E2+1LyFUZWDdY/3XW0/0dhPPkueCDx+BoQy+h
	huyzhdbwngHNO3RjS66/eyBAuMFmSr5DATEn8KlF9R0GLPV/0CbgDzJdNFZvsuP81axoJABIcj1
	s/4r4NB91iP72eYX6+CjwdhZEn6tKmDmXNwP8WhKWsC9bA2eA7fHBWbvTsw==
X-Gm-Gg: ASbGnct45UqRCEOfjAQj23oeqxIfFO7oacCQUqIgTFAfj6f9T4njl4WiKl1zKnVIHWM
	Uf5PAKtLAyU3mZbPW0wsDEuANe+uJ46xxT+/9ZZqe3Sr2GRPm3/tNcHd2JMrT69EnZjBo8arE66
	1WygFg92FNMUA0fixmx4lwCuLf/bs5cT1rLKjfv9vFGFNktCOhMKhIGGr5H+PBuoI4AZdZ9X4sz
	VIwNjY/jFIUSqXBnDPK7cEUCpEEFoWCaIAK2Rt9V3vrtuf1u0TocJekUhpv+NenCdHMMfPQtj4t
	QtxKc0I8dsXHzLFP8MhFCwKkpasOvO1I180d7s2gHO7ysdAftNC+cu/hlr/qoATnHlemxg==
X-Received: by 2002:a05:600d:108:10b0:453:79cb:7c86 with SMTP id 5b1f17b1804b1-4537b722e5cmr41195045e9.3.1750843898193;
        Wed, 25 Jun 2025 02:31:38 -0700 (PDT)
X-Received: by 2002:a05:600d:108:10b0:453:79cb:7c86 with SMTP id 5b1f17b1804b1-4537b722e5cmr41194605e9.3.1750843897660;
        Wed, 25 Jun 2025 02:31:37 -0700 (PDT)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874? ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538236694esm14290065e9.28.2025.06.25.02.31.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 02:31:36 -0700 (PDT)
Message-ID: <3bf1b8eb-4ce2-4d33-9aa0-9c9f4c1afa17@redhat.com>
Date: Wed, 25 Jun 2025 11:31:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [PATCH v8 12/14] arm/cpu: Add sysreg generation scripts
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Cornelia Huck <cohuck@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, kvmarm@lists.linux.dev,
 peter.maydell@linaro.org, richard.henderson@linaro.org,
 alex.bennee@linaro.org, maz@kernel.org, oliver.upton@linux.dev,
 sebott@redhat.com, shameerali.kolothum.thodi@huawei.com, armbru@redhat.com,
 abologna@redhat.com, jdenemar@redhat.com, agraf@csgraf.de,
 shahuang@redhat.com, mark.rutland@arm.com, philmd@linaro.org,
 pbonzini@redhat.com
References: <20250617153931.1330449-1-cohuck@redhat.com>
 <20250617153931.1330449-13-cohuck@redhat.com> <87h60e1ies.fsf@redhat.com>
 <de402ecb-8d45-4e42-a805-cd3aaef8dc93@redhat.com>
 <aFvAEXWi7PUbVAud@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <aFvAEXWi7PUbVAud@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 8FKB1kek4qoGPtWTXZobZ6NImvC8gCNrz1Ft9KE9t1U_1750843898
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: jQh67z0R1Fjn

Hi Daniel,

On 6/25/25 11:23 AM, Daniel P. Berrangé wrote:
> On Wed, Jun 25, 2025 at 11:16:22AM +0200, Eric Auger wrote:
>> Hi Connie,
>>
>> On 6/17/25 5:45 PM, Cornelia Huck wrote:
>>> On Tue, Jun 17 2025, Cornelia Huck <cohuck@redhat.com> wrote:
>>>
>>>> diff --git a/scripts/arm-gen-cpu-sysregs-header.awk b/scripts/arm-gen-cpu-sysregs-header.awk
>>>> new file mode 100755
>>>> index 000000000000..f92bbbafa727
>>>> --- /dev/null
>>>> +++ b/scripts/arm-gen-cpu-sysregs-header.awk
>>>> @@ -0,0 +1,37 @@
>>>> +#!/bin/awk -f
>>>> +# SPDX-License-Identifier: GPL-2.0-or-later
>>>> +# arm-gen-cpu-sysregs-header.awk: arm64 sysreg header include generator
>>>> +#
>>>> +# Usage: awk -f arm-gen-cpu-sysregs-header.awk $LINUX_PATH/arch/arm64/tools/sysreg
>>>> +
>>>> +BEGIN {
>>>> +    print "/* SPDX-License-Identifier: GPL-2.0-or-later */"
>>> FWIW, checkpatch.pl chokes on this:
>>>
>>> ^* matches null string many times in regex; marked by <-- HERE in m/^* <-- HERE /"$/ at scripts/checkpatch.pl line 1389.
>>> ERROR: Saw unacceptable licenses '*/"', valid choices for QEMU are:
>>> GPL-2.0-or-later
>>> GPL-2.0-only
>>> LGPL-2.1-only
>>> LGPL-2.1-or-later
>>> BSD-2-Clause
>>> BSD-3-Clause
>>> MIT
>>> total: 1 errors, 0 warnings, 76 lines checked
>> so don't we need to improve checkpatch.pl to silence this error?
> Its regex gets confused by the trailing " after the comment end. We
> could fix it, but ignoring the error is also valid as this is a
> highly unusual file that's not likely to be common through our
> source tree.
Makes sense. We are good then.

Thanks!

Eric
>
>
> With regards,
> Daniel
