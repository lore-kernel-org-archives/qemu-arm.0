Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp5563153lfh;
        Fri, 3 Jun 2022 04:55:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJztpI3QUR6KgYLDbJIrpv6K/WhMmEsUwfdmFvO5jLhwti54RK9IXJy6HYZaKSgQXc9X295U
X-Received: by 2002:a05:620a:178d:b0:6a4:61f1:742a with SMTP id ay13-20020a05620a178d00b006a461f1742amr5857227qkb.523.1654257348079;
        Fri, 03 Jun 2022 04:55:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654257348; cv=none;
        d=google.com; s=arc-20160816;
        b=VU3++lQRDh96oXJXU850ajhsG5HA5G2shQ6bkhnWcnynDCPX4v8BmUgZNDLZ4njiF1
         T7WNfu2A6bR1XlY2QwONBRqd101cLrbE//kWTECBEc5/5T9aEOH1Z+51KHcBq0cqBySI
         s2VmTUCtfCzgb7kuMg4vxgIk/1DVBGnu60uf9ytMYu9MbvaSDIQw4ZNTfGCoChC28CtS
         Wm5nav/jgVMEqVhGQBxSOnvvmCwTjId00yNGuZkl2O1xF977Oh6xqp/Y1+ox429+lKNF
         z/E4G3LGwIVkXELExMB5YdCzxLI7xluOIHhK5i6B+dzo8YMldL5UK6fzCtNg0CyqROJC
         dGxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:organization:in-reply-to:subject:cc:to:from
         :dkim-signature;
        bh=VhoPSLEifgFBRSvt4oTaKoS3WMrZaT+dJK0LGswuKk8=;
        b=Rxd0ZkAkQp2L/vd0cAru4yCLsDEUS35IY4vipbrJmSYOLy+Jtg2ZVNZTVoQb0BvEHm
         TdUX5b4s4kGe8k2/GmOK9PqAvyhjRV9Af8GGD7P+iFTkZIToR3bqFjJ8DNqQQErqcuPK
         NWl5KvYQVihqy5gwM8yc0jVK/NkPoF1se0O61e4aaA/ADCmHlOwJpcAwrAsHFYXYDuVD
         /c5jgWYPnF8c8pYtxSt89mhMjTK00c+VfQHD+yo2F7Ui+e89XOe15i5M2kfa962UvPzK
         lmMr7rf2pMBZT8q1vHZY8+An8MSwSUUC1Yraet2dQVhcJwHRvZq7adriG/BdfB2PVObz
         J2og==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Y7vYXbOz;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <cohuck@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id bb9-20020a05622a1b0900b002f93f42e301si3200226qtb.645.2022.06.03.04.55.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 Jun 2022 04:55:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of cohuck@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Y7vYXbOz;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1654257347;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VhoPSLEifgFBRSvt4oTaKoS3WMrZaT+dJK0LGswuKk8=;
	b=Y7vYXbOzLphCQRwpjeH7jMVf2mgpN6t2ZCw69spfbzqb+3z8gduW0qEFIX6gEF1z34lnoB
	aU55bvMXy63I494cwOUvwa/l0IVV60O9kNJtNyn3iUDxZ/ujMHOFc9lLTYWrxWPqrEyvEB
	eGBwH1AWiXKckEZBgwOx2CWDYvCpxsk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-627-j_G7oe-sP1CIG55D1x6pgA-1; Fri, 03 Jun 2022 07:55:46 -0400
X-MC-Unique: j_G7oe-sP1CIG55D1x6pgA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 040F61010439;
	Fri,  3 Jun 2022 11:55:46 +0000 (UTC)
Received: from localhost (dhcp-192-194.str.redhat.com [10.33.192.194])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BBA9A492C3B;
	Fri,  3 Jun 2022 11:55:45 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Andrew Jones <drjones@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Cc: f4bug@amsat.org, alex.bennee@linaro.org
Subject: Re: [PATCH v2] tests: Prefer max cpu type when using AArch64 virt
 machine
In-Reply-To: <20220603111849.1481100-1-drjones@redhat.com>
Organization: Red Hat GmbH
References: <20220603111849.1481100-1-drjones@redhat.com>
User-Agent: Notmuch/0.36 (https://notmuchmail.org)
Date: Fri, 03 Jun 2022 13:55:44 +0200
Message-ID: <87y1ye7ygv.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
X-TUID: 2cRRFqv5fPpo

On Fri, Jun 03 2022, Andrew Jones <drjones@redhat.com> wrote:

> The max cpu type is the best default cpu type for tests to use
> when specifying the cpu type for AArch64 mach-virt. Switch all
> tests to it.
>
> Cc: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> ---
>  tests/avocado/boot_xen.py          |  6 +++---
>  tests/avocado/replay_kernel.py     |  2 +-
>  tests/avocado/reverse_debugging.py |  2 +-
>  tests/avocado/tcg_plugins.py       |  6 +++---
>  tests/qtest/bios-tables-test.c     | 12 ++++++------
>  tests/qtest/machine-none-test.c    |  4 ++--
>  tests/vm/aarch64vm.py              |  2 +-
>  tests/vm/ubuntu.aarch64            |  2 +-
>  8 files changed, 18 insertions(+), 18 deletions(-)

Reviewed-by: Cornelia Huck <cohuck@redhat.com>
