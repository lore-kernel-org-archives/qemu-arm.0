Received: by 2002:a17:505:d21:b0:1be9:327d:8ee3 with SMTP id vh1csp803916njb;
        Wed, 8 Jan 2025 04:30:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGx2qBSKSgNw+zEpl17jpEYX6LMEWR0VZbFWfHaXWn1t+b4kQiDAINQXA5K/vAM9AfGsq+i
X-Received: by 2002:a05:6e02:1f8a:b0:3a7:e528:6f1e with SMTP id e9e14a558f8ab-3ce3a8880c6mr21307105ab.11.1736339413154;
        Wed, 08 Jan 2025 04:30:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736339413; cv=none;
        d=google.com; s=arc-20240605;
        b=VfAqk8cQtaZpc1MLSucfpIaOxYG2zPPI74WOuZVElD+prJVL2pQCOnM2UGteHsTCRF
         NiAFoBKSYYcWdvnHXxMalIzLZjZiuqTG39ZsCYPURaAUJnJvCnEUCX8b3F6HrsPQ9mCc
         L0dtu7p4eEIOlWsKQryBLlpDMjv6ua5OmrTBADZjgBt71MVkfZd0j5gXFl8eVLLEyXuH
         ML9LLQ3cu3cP+r8oc5ENynxMe9dmukbPMoVgbH1zYZiDk0RuX6H6mVbjc3nkZuOCF6Ig
         1l0d1bdR+HOK9fTVow0SlTO+jNvuGMwT5fAA4sJtq0DlpzJsjYcumNEXLGNJOr5r0WV6
         sQ2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=H/lVGwK4inVqSP+d8wKrWPmq6WbYLqE8Rag5d/vGmes=;
        fh=IrB2f3zqDp4O7JfQfR0yWVY3JraaiQwV4mS8Rr4O8gQ=;
        b=IMcec4M+8IWdtKiNmzxKE50/3yaKszeE5tRhpMGhToiV43FOGDUpyqyZS2AtwSkV28
         jl+KMkwU5fFibFJXITROpF4UhQxixHB0tUbl917hL05aIY2k1kJjWOX4dUi03QO9UDDG
         ylVEvWOAnGJj0NmrjcgsMiRwWhNkl99XV+wF95QoBzteEEk8tQyBNKyt7b/l0+y/gR/m
         tE9TiDmCAGZRj4XM1l/qzk5LAOFFUj67pWD8A0Rnbwj7BZlpfmQpotO1Tg9HEj3gdKZe
         ckcwIeLhcivQRu0WxilHONIcFrOw9SQ8mXv1R7cLqGpO3rT/9wYA6qTjzUCc90C3oG2W
         vFyQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=UMpWrpOI;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id e9e14a558f8ab-3c0e5927bb1si237322425ab.185.2025.01.08.04.30.12
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 04:30:13 -0800 (PST)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=UMpWrpOI;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736339412;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H/lVGwK4inVqSP+d8wKrWPmq6WbYLqE8Rag5d/vGmes=;
	b=UMpWrpOIf8nWVc4r8IMZGYotEg4g5yzeVr0pM1ykCGLi2tzXvEqQHTvs4nbEiUWTGUdRwb
	mTQHRWfxHDLAlCD0cLYoFAfF4U3WHBaXdrCoi2fIKO9HZU5D8WhBPC1mEeS1z6EQXtxC3X
	eBhJPN/ces2/US3intyAm11ICRkIpRQ=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-571-YBMX4C2nNWSnW_cBlyGkoA-1; Wed,
 08 Jan 2025 07:30:08 -0500
X-MC-Unique: YBMX4C2nNWSnW_cBlyGkoA-1
X-Mimecast-MFC-AGG-ID: YBMX4C2nNWSnW_cBlyGkoA
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id F166919560AB;
	Wed,  8 Jan 2025 12:30:01 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.103])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4BA883000199;
	Wed,  8 Jan 2025 12:29:44 +0000 (UTC)
Date: Wed, 8 Jan 2025 12:29:41 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
	Aurelien Jarno <aurelien@aurel32.net>, qemu-riscv@nongnu.org,
	Radoslaw Biernacki <rad@semihalf.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Beraldo Leal <bleal@redhat.com>, Fabiano Rosas <farosas@suse.de>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Laurent Vivier <lvivier@redhat.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	=?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
	Ed Maste <emaste@freebsd.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Bernhard Beschow <shentey@gmail.com>, Bin Meng <bmeng.cn@gmail.com>,
	qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>, Joel Stanley <joel@jms.id.au>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	John Snow <jsnow@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	Alistair Francis <alistair.francis@wdc.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	Cleber Rosa <crosa@redhat.com>, Thomas Huth <thuth@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, qemu-s390x@nongnu.org,
	Eric Farman <farman@linux.ibm.com>, Weiwei Li <liwei1518@gmail.com>,
	Markus Armbruster <armbru@redhat.com>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Li-Wen Hsu <lwhsu@freebsd.org>,
	Anders Roxell <anders.roxell@linaro.org>
Subject: Re: [PATCH v4 03/32] tests/functional: add a m68k tuxrun tests
Message-ID: <Z35vtfvX7OGNwjY_@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20250108121054.1126164-1-alex.bennee@linaro.org>
 <20250108121054.1126164-4-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250108121054.1126164-4-alex.bennee@linaro.org>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-TUID: d4MSzQPDOwVq

On Wed, Jan 08, 2025 at 12:10:25PM +0000, Alex Bennée wrote:
> We didn't have this before and as it exercises the m68k virt platform
> it seems worth adding. We don't wait for the shutdown because QEMU
> will auto-exit on the shutdown.
> 
> Cc: Laurent Vivier <laurent@vivier.eu>
> Cc: Anders Roxell <anders.roxell@linaro.org>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20241121165806.476008-24-alex.bennee@linaro.org>
> 
> ---
> v2
>   - add to MAINTAINERS
> ---
>  MAINTAINERS                          |  1 +
>  tests/functional/meson.build         |  1 +
>  tests/functional/test_m68k_tuxrun.py | 34 ++++++++++++++++++++++++++++
>  3 files changed, 36 insertions(+)
>  create mode 100644 tests/functional/test_m68k_tuxrun.py

> diff --git a/tests/functional/test_m68k_tuxrun.py b/tests/functional/test_m68k_tuxrun.py
> new file mode 100644

This (and any other new functional tests) should be mode 0755
to enable direct execution

> index 0000000000..7eacba135f
> --- /dev/null
> +++ b/tests/functional/test_m68k_tuxrun.py

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
