Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp2760288njb;
        Mon, 12 May 2025 07:27:09 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU+RlnCko5WmCjHGHaOXxxjgSF1lnZCZdjfEjdc0WfMOE/US4RuUeuseOVb30SzQd4xcHRqnrT4hDKmSw==@linaro.org
X-Google-Smtp-Source: AGHT+IHdC1x6fJJwbMQxsy0cytM6svsucKH4vXaqrPIWJa8cVWnrQelWPwPkVl0tWa/RIEyijLd7
X-Received: by 2002:a05:620a:2b8d:b0:7c5:5fa0:45f8 with SMTP id af79cd13be357-7cd010f0e75mr1833746785a.17.1747060029340;
        Mon, 12 May 2025 07:27:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747060029; cv=none;
        d=google.com; s=arc-20240605;
        b=H9M4xJr9IIL6Vlq0a6EP57+t8UPpjGw7mNA59ijxiltmuJxqze5tO1xYrdC0Shtfme
         4TsmgKCzPXmJIxPbPGDkEzWDMwsVFU6NNIc46F/Ee1z10RRsF67GD5ta/HE/FIndXimH
         kxzYVyvOPupgdamgdLc45K4R3wLuy2yXU+32RkUITrktkFIoa0Oo8wS27AQvwDaGHhq8
         wb02evdTh1OBxhryu4xncm8/wPihC232j7LRVarCbNDpQ6gkTDcN0hLYt/fal4WzjqKE
         QQdQ2iM3iOc0Sp5UXfbwj9X1evCTS6kE2D3jZvHKR/drzDI3Fg4pEXJE20MZRBfI0qY6
         YraQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=Iu+ldpClS4R8zOA9HFgy/XOafNN1ohTrKAY38lqFEHg=;
        fh=VlqcgPpr9K6AE8YRrxWuJdQzWYpaMZ2SPRn4PDmqkTk=;
        b=Qg9jSoKh0/hbzpXMqYwoAG3KjJ2xYA5GCQSFoceC8juoCEEsoAJ36NfNrohwIuYZtR
         auOR77qfXHBq5lWL9i8ytIz6bq/IWzoZmkMr6Q/xCiDzLzm7Sh+cuSeBjDxyMQZaq36d
         HibFAc9knld5RHsLqFIGdFh/mPaRXLpw59HgSQj53dvJEk5yibxsDgTDEgWkOCSn5SJ+
         1Z4kpQRrANX91bRkkBlRMmK1OLRaK7fCqs5Wogfd71vAjVnmjFjFw8m3vK2LB5USBCch
         6oBPlDFyPI64WEJpaPB0R+YoYK0aqVPjj6Aq6sXS7wi5HAUR0oLV7xLq1VddQ/XG98Pd
         veZA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OQXrZNse;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id af79cd13be357-7cd00fd4645si860735285a.323.2025.05.12.07.27.09
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 07:27:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OQXrZNse;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747060029;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Iu+ldpClS4R8zOA9HFgy/XOafNN1ohTrKAY38lqFEHg=;
	b=OQXrZNseezIy4lAj70m9OjDCB1av/KyLBPwUuOS7M5dBD/Zq1UnrvaH0PRFkEf0sp9HDkM
	oAE/0Sw9MqS33XvGa773PHFVPEG2rrhgx69hw+JkfP36aKO6n/bH95MENs48mYpGnCDsWl
	mI83tim7w4wG2bcTaC4Ph/oLYAU8GtI=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-249-WLrpr9vwN1C4mlC_iAa79A-1; Mon,
 12 May 2025 10:27:05 -0400
X-MC-Unique: WLrpr9vwN1C4mlC_iAa79A-1
X-Mimecast-MFC-AGG-ID: WLrpr9vwN1C4mlC_iAa79A_1747060024
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7D5E2180036E;
	Mon, 12 May 2025 14:27:04 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.162])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4E5BD1943282;
	Mon, 12 May 2025 14:27:01 +0000 (UTC)
Date: Mon, 12 May 2025 15:26:58 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Gustavo Romero <gustavo.romero@linaro.org>
Cc: qemu-devel@nongnu.org, thuth@redhat.com, eric.auger@redhat.com,
	alex.bennee@linaro.org, philmd@linaro.org, peter.maydell@linaro.org,
	qemu-arm@nongnu.org
Subject: Re: [PATCH v3] tests/functional: Add PCI hotplug test for aarch64
Message-ID: <aCIFMpnpvUA445_h@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20250512142336.181080-1-gustavo.romero@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250512142336.181080-1-gustavo.romero@linaro.org>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-TUID: kpMtwkoptA+2

On Mon, May 12, 2025 at 03:23:25PM +0100, Gustavo Romero wrote:
> Add a functional test, aarch64_hotplug_pci, to exercise PCI hotplug and
> hot-unplug on arm64.
> 
> Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
> ---
>  MAINTAINERS                                  |  5 ++
>  tests/functional/meson.build                 |  1 +
>  tests/functional/test_aarch64_hotplug_pci.py | 72 ++++++++++++++++++++
>  3 files changed, 78 insertions(+)
>  create mode 100755 tests/functional/test_aarch64_hotplug_pci.py


> diff --git a/tests/functional/test_aarch64_hotplug_pci.py b/tests/functional/test_aarch64_hotplug_pci.py
> new file mode 100755
> index 0000000000..f4a05de39e
> --- /dev/null
> +++ b/tests/functional/test_aarch64_hotplug_pci.py
> @@ -0,0 +1,72 @@
> +#!/usr/bin/env python3
> +#
> +# The test hotplugs a PCI device and checks it on a Linux guest.
> +#
> +# Copyright (c) 2025 Linaro Ltd.
> +#
> +# Author:
> +#  Gustavo Romero <gustavo.romero@linaro.org>
> +#
> +# This work is licensed under the terms of the GNU GPL, version 2 or
> +# later.  See the COPYING file in the top-level directory.

Nitpick, can you use "SPDX-License-Identifier: GPL-2.0-or-later" after
the sheband line, instead of this.

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
