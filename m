Received: by 2002:a05:7301:4085:b0:178:84eb:402c with SMTP id pt5csp720338dyb;
        Wed, 25 Jun 2025 02:16:30 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXTPaRb6gcnKhITJmpdGa2gEOG++2fxP7M0niysjxr8iL1kEpJMpJNC4k0s0dFgR2McbAvFA/2mlyGjUg==@linaro.org
X-Google-Smtp-Source: AGHT+IERokR+mgcdmUKW9nLbRaOvjyz523+KjtjTStpIGipWy8AWgPSIOf723PSZ66xoJC/Bi15J
X-Received: by 2002:a05:6214:4981:b0:6fa:c0f8:4dff with SMTP id 6a1803df08f44-6fd5ef979d0mr33380296d6.37.1750842990416;
        Wed, 25 Jun 2025 02:16:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750842990; cv=none;
        d=google.com; s=arc-20240605;
        b=HG36dBF81IvWu7vu+MQKu1LD7qq7eFe+ExXOIH6bXXlTxud+HkQkp7OHJV8NPbgGTC
         6pEBUGZtMcfXK0cm/SNtsq8dViIxTWo2pdcu7qlJ+9s66Xvu1BjlUtVgcCPVZWHbM9gG
         cnwtOF9XpsLhkNoSD9hjM4qhJrywHoSk/oiTo9waQ639YtBPo81syo72Ewwb0BtvJdgf
         zsD2xexO8iwc+1jFL0KvSvTvNWJellBq56Ii2s+6p9xMMH4M/EBicQnAqcQpuUZWNJha
         TEhjkmvCwzpf5slD1S+5dDrYGbK+ENOZfB979/dkoZrPGwg7KDU2AhU+O33XtuAVVYl+
         FbFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=QIocLogfrgK+l1a8CNugq6b9hdRreoiwycFXhnUjGKc=;
        fh=aL0y/0444G8JSCo4B5NaeW5oldvcnTXaR8I7SyoeMoU=;
        b=Dme3gMSd0y4uYHG9Kkg8L6RJY4TOpHyj4sE9fBfS1oV4HVUCTgnMIXY/EEtJydEo1Y
         LTuisaMlCB6IfO1UFQgxgbARM7dMeAjzpiv4i08b//TDzhioMYd4TCy0xotI7fZYIico
         2cczv1BBwV9rrLMfNw1rPxtkA4jzgnM4NhVB7fEoYDzFjAqhMlY4Cnkt+rQVX5T/0S/P
         n4UgWPeD73uN2+9M0KfyFsLlLjXWVqdZDZ9J5RXpSkYnGmrYNAcg0lqQUM+psOFpFB2C
         jVup5lurqlMyvLe5Vcapqb8wlOPdklN5tgEgC8Ad/0voVXnTQkRdJZ3PBcxdSPIcG4zC
         SJvw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LSXgzezR;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6fd1d4fdd32si85188456d6.417.2025.06.25.02.16.30
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:16:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LSXgzezR;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750842990;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QIocLogfrgK+l1a8CNugq6b9hdRreoiwycFXhnUjGKc=;
	b=LSXgzezRcClO/9WcXseCLbv84v38axDTe1SFnurHptaVznJYcI+vQvN0YhxeL7ZNzjEOx3
	3IPkDlbVY/xxXvSQKOasVnWuQEKNWpyZ3iVAtP6s/wh0TrN0aFw3VskQjtARcrqN+4H7HG
	6/wPR4bw6q0rj+XR/GMdXo5c+8vERgY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-466-h_h-RSidPymZeU_ApBBZww-1; Wed, 25 Jun 2025 05:16:28 -0400
X-MC-Unique: h_h-RSidPymZeU_ApBBZww-1
X-Mimecast-MFC-AGG-ID: h_h-RSidPymZeU_ApBBZww_1750842987
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a4fabcafecso651372f8f.0
        for <alex.bennee@linaro.org>; Wed, 25 Jun 2025 02:16:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750842987; x=1751447787;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QIocLogfrgK+l1a8CNugq6b9hdRreoiwycFXhnUjGKc=;
        b=L0RGkYhjAy5uWkIKVB//l6qfdGf5ocWCiNaGbc5wIFjiq3GuJqd+q0hnY79MnT4n/v
         L1OcgDYP3iiMWj2Zz+ucbboaow6hFCJ4m3S/Y0Fe4yO8atdi8R5nhFrRQ2G6B1BT/zVH
         nAludpVPC7lZyZMX4UlCvIwFo6U5I1R5kU2s6Ec3XY3fk49MfcFQ1ESY5b3mBKNCsJ6K
         svsCDGMYwMb3lCmIN7n8xiYR77CVfUt3deg8HoWkBGRuyAIDyrv5iO50Xc5uj4E+9JKJ
         Ai2NilYYEO+i4Rt/uZX2F5ShapjZ3vukwYmYOqfq2KGXRjwXLE2+cVKatTLX7Tm6WKFF
         DvGg==
X-Forwarded-Encrypted: i=1; AJvYcCWrZsmDw0C5oJQP8Jpil+cZXxJh9UKooLpShfxsSoL5t2WmCdJTQgR15c3esJRzpFWrSBOMRBST02avrw==@linaro.org
X-Gm-Message-State: AOJu0Yxjvk7uIG7oY8KxFmoUlyWZ7WflmTtcSlweRQI9nwXMWJGcEWo7
	rZWPfeNzVTlssjLEkETHkGgfusaSsKdXTX6SzsL3obTi6VtNlAwc7dNznGpY6br0fyJhRwyn9xx
	r3dapiYsOUAwuz2bFQd7VnC3cyQY4ni4RuCpd8R93Ac65pNPWFw5DqAfOZg==
X-Gm-Gg: ASbGncvGDsXDxis5XF2rXHSDfaUdEvWDCeQ0ClbdWotJtg77eby4ssIEoYzkMyDlfXB
	AVEeGDh1PdvF8wt9ECR8QRBleqjzLsJUPPJDzHyTHCwYr293Rz/nyqYFcz6Xml9soCDvwifdbRg
	EaI2Wf8sw7VNya5fepn4Bi8ez46cfxJnIttKEgqL7twwUBinst3kaPK3lRrNtdgS2CGobp8OkFX
	7G2IAnbViSXEwXavv8NeaKTKXj2WpEpqwrxPgixLs+noTaIoM3BXWgOVy9XQBwhJXUbuw9YDfjh
	MZ2IyX0/s5d4HaiaWpPnFn6a3g31RbWj2R9O1QThU1gUryEBsRI5/MrvDwJi24cnWRyzZQ==
X-Received: by 2002:a05:6000:2b10:b0:3a5:8a68:b815 with SMTP id ffacd0b85a97d-3a6ed660d0emr1189737f8f.46.1750842987100;
        Wed, 25 Jun 2025 02:16:27 -0700 (PDT)
X-Received: by 2002:a05:6000:2b10:b0:3a5:8a68:b815 with SMTP id ffacd0b85a97d-3a6ed660d0emr1189715f8f.46.1750842986645;
        Wed, 25 Jun 2025 02:16:26 -0700 (PDT)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874? ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e80f279dsm4167515f8f.64.2025.06.25.02.16.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 02:16:25 -0700 (PDT)
Message-ID: <de402ecb-8d45-4e42-a805-cd3aaef8dc93@redhat.com>
Date: Wed, 25 Jun 2025 11:16:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [PATCH v8 12/14] arm/cpu: Add sysreg generation scripts
To: Cornelia Huck <cohuck@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, kvmarm@lists.linux.dev,
 peter.maydell@linaro.org, richard.henderson@linaro.org,
 alex.bennee@linaro.org, maz@kernel.org, oliver.upton@linux.dev,
 sebott@redhat.com, shameerali.kolothum.thodi@huawei.com, armbru@redhat.com,
 berrange@redhat.com, abologna@redhat.com, jdenemar@redhat.com,
 agraf@csgraf.de
Cc: shahuang@redhat.com, mark.rutland@arm.com, philmd@linaro.org,
 pbonzini@redhat.com
References: <20250617153931.1330449-1-cohuck@redhat.com>
 <20250617153931.1330449-13-cohuck@redhat.com> <87h60e1ies.fsf@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <87h60e1ies.fsf@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: J0P8anUl8fceoFT96sOnvrO2hfj5JubwHM6T6n7s7iQ_1750842987
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TUID: 5uS6htR8fIWh

Hi Connie,

On 6/17/25 5:45 PM, Cornelia Huck wrote:
> On Tue, Jun 17 2025, Cornelia Huck <cohuck@redhat.com> wrote:
>
>> diff --git a/scripts/arm-gen-cpu-sysregs-header.awk b/scripts/arm-gen-cpu-sysregs-header.awk
>> new file mode 100755
>> index 000000000000..f92bbbafa727
>> --- /dev/null
>> +++ b/scripts/arm-gen-cpu-sysregs-header.awk
>> @@ -0,0 +1,37 @@
>> +#!/bin/awk -f
>> +# SPDX-License-Identifier: GPL-2.0-or-later
>> +# arm-gen-cpu-sysregs-header.awk: arm64 sysreg header include generator
>> +#
>> +# Usage: awk -f arm-gen-cpu-sysregs-header.awk $LINUX_PATH/arch/arm64/tools/sysreg
>> +
>> +BEGIN {
>> +    print "/* SPDX-License-Identifier: GPL-2.0-or-later */"
> FWIW, checkpatch.pl chokes on this:
>
> ^* matches null string many times in regex; marked by <-- HERE in m/^* <-- HERE /"$/ at scripts/checkpatch.pl line 1389.
> ERROR: Saw unacceptable licenses '*/"', valid choices for QEMU are:
> GPL-2.0-or-later
> GPL-2.0-only
> LGPL-2.1-only
> LGPL-2.1-or-later
> BSD-2-Clause
> BSD-3-Clause
> MIT
> total: 1 errors, 0 warnings, 76 lines checked

so don't we need to improve checkpatch.pl to silence this error?

Cheers

Eric
>
>
>> +    print "/* GENERATED FILE, DO NOT EDIT */"
>> +    print "/* use arm-gen-cpu-sysregs-header.awk to regenerate */"
>> +} END {
>> +    print ""
>> +}
>> +
