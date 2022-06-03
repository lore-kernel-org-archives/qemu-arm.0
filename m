Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp5500062lfh;
        Fri, 3 Jun 2022 03:07:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxrsbf8Z9Uqw7Y8lZTJCEa1LJ2jHJYUgKsuTLbPNMdvI12iD28DSWxdo0w0z3YWAXx5Z0fV
X-Received: by 2002:a05:622a:1d4:b0:304:c72e:ac4b with SMTP id t20-20020a05622a01d400b00304c72eac4bmr6686817qtw.101.1654250839895;
        Fri, 03 Jun 2022 03:07:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654250839; cv=none;
        d=google.com; s=arc-20160816;
        b=HGJbPE8Nw6bZ8664geiN4m1OnDiGjkQ8OXHRgrnM51PdF33JCuD8pQkVZIqP7/2AVf
         ACq54QqGuPXr1ft0sFj4pMEFUbJWaBX/3weHUWteNv/iXDGvgbkj2DajNTPe2EITAIkz
         QQ/jyQlko+8Vc8tOHQaS+xPHgFJfsLxhQfx7gQ0yazbNIYk+aiP9PbCEh4C+1rwsbrej
         aOtm+fTT+EWhpJTv9yeoikugFiHe1ceb4Ff0MztoTaeXrmSC3te5Tkk2e6RWyNy4JAqY
         mleWEgfSJ1iiX1L1XK6Y2+OLbmWL7NUZeRUrZG/gJ2bUz81Q3XN1j2Tb5Ld8j6ao0KDX
         X2PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:organization:in-reply-to:subject:cc:to:from
         :dkim-signature;
        bh=kP8ltlA59JjLB0JV5vyYWZwW4BiEA6NoNU0/kU5d6Gw=;
        b=kselv9RdZWKEQFvswKCRBs4P+DBfzz5t1cEJYT+qp45lhtekUHVXpaesnjld4kxmt5
         F1xPwWjHLbN3+FZyLSji1TesKxixg9IKjpsxbP4ZFqM7y0csdLwA8XdzMg4jINmW3Li6
         e2ZsQL1RJhHhBdR5SeK/eJsEwqMdZ/wyC656EwEMqcse4ziOMB49vB4Y2wPaXisPCgvQ
         aT8JainyoHgw9/QPzkELAbcgoHXAXB4XM70fuTtq49TtRDgskkI/8Mp52iq6ayYfnF3A
         8V4Zl+Sfr66VX6Wfn4j0sJus2RrglirSXCd05Mwrz6+IyoIXGTPrFktc8KZ95hZ7YgOT
         BeQw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=D5FGhN1F;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <cohuck@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id i15-20020ad45c6f000000b00467cb2fcc1asi1970792qvh.210.2022.06.03.03.07.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 Jun 2022 03:07:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of cohuck@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=D5FGhN1F;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1654250839;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kP8ltlA59JjLB0JV5vyYWZwW4BiEA6NoNU0/kU5d6Gw=;
	b=D5FGhN1FzytHbDgLt0/eqFvmmTLcM5TQqp4ovQaob2oNQ71CMKoHTxJG/Irftye+4sJ1TB
	3A7IzI7OAEYVtN3ZXCkefhSn0C0Eqqe4tFudcybO4g/h4fKHgmlrzuOLvD0MSXYy7D7QKs
	qJMdG+vXLWj1ZIFx+/Huw331zD2gBzc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-159-qvHnmHX8OceoU_SsM230bg-1; Fri, 03 Jun 2022 06:07:15 -0400
X-MC-Unique: qvHnmHX8OceoU_SsM230bg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D0E5D811E75;
	Fri,  3 Jun 2022 10:07:14 +0000 (UTC)
Received: from localhost (dhcp-192-194.str.redhat.com [10.33.192.194])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8E9211410F36;
	Fri,  3 Jun 2022 10:07:14 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Andrew Jones <drjones@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Cc: f4bug@amsat.org, alex.bennee@linaro.org
Subject: Re: [PATCH] tests/avocado: Prefer max cpu type when using AArch64
 virt machine
In-Reply-To: <20220603092505.1450350-1-drjones@redhat.com>
Organization: Red Hat GmbH
References: <20220603092505.1450350-1-drjones@redhat.com>
User-Agent: Notmuch/0.36 (https://notmuchmail.org)
Date: Fri, 03 Jun 2022 12:07:13 +0200
Message-ID: <871qw69i26.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
X-TUID: QKlAk/lDbmkk

On Fri, Jun 03 2022, Andrew Jones <drjones@redhat.com> wrote:

> The max cpu type is the best default cpu type for tests to use
> when specifying the cpu type for AArch64 mach-virt. Switch all
> tests to it.
>
> Cc: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> ---
>  tests/avocado/replay_kernel.py     | 2 +-
>  tests/avocado/reverse_debugging.py | 2 +-
>  tests/avocado/tcg_plugins.py       | 6 +++---
>  3 files changed, 5 insertions(+), 5 deletions(-)

Is there anything in the boot_xen tests that requires cortex-a57, or
should they be switched to max as well?
