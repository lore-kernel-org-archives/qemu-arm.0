Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp974860njb;
        Wed, 5 Feb 2025 07:54:03 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWMULYFAkk45Dnr122xdZ7Be4bAjpSoZVOL6DWU5wQKuYtnUbjcoaPpvrg+uIYR02vYGobpW7UL5XmQJg==@linaro.org
X-Google-Smtp-Source: AGHT+IFAkLEbzwuOQVNcuvcBymRlePw7cMCL18/PCNOCeGMHb8PyCTNCoJYnFTLMX0Gk2whPhmCD
X-Received: by 2002:a05:620a:454a:b0:7be:2a68:6d79 with SMTP id af79cd13be357-7c039f98127mr515799785a.7.1738770842894;
        Wed, 05 Feb 2025 07:54:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738770842; cv=none;
        d=google.com; s=arc-20240605;
        b=h9WSL902tVOUP1r9za7csqUrNtt3wzGYdSRXNlKJ3ZUkRunliKG3uv4r+G7vl9UvwH
         0FzaSWpo/1PDtDcNbVze3OG+NlpWzSK6gc3wrhqucsM5MBqKX9lFTGUSbNfjF7u5vtlZ
         m6MeZ7mqhTdytfzVGEB7diCxbaB5MpyDPibKFzWrYweIuYONXXlWzFhc/HrEjdJ63jqd
         1IUI8ueOgnOZjloi0bUZnWQzGJxFbNBu3bEYtZhXlzGStKCgi0X4sIODFjIcPJwUhRww
         1AFurS3v/qUJmC+1qN5XwSBPuCo7+dxPUVTVc9p46YIlVgDaZhlTQBaBcktEx7FQIwwK
         Pc/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=mime-version:message-id:date:user-agent:references:organization
         :in-reply-to:subject:cc:to:from:dkim-signature;
        bh=HuRJHudXYzPLPY6ofEjlax1+GCZT5OXRUcbwGsQeyOE=;
        fh=edX1btqlmtapxLLCr9AWsM0crpUmoHKq70NGgjhVbUM=;
        b=PrVgB7vTaSFY3V/zwcWHxo0ZGES/we1sM5+ZNKeAtPxhLitrnckKKEGJU2x2li59yh
         UjNpvzgwWPgVw2nPFhjHMYGG+gMVm9/+NHQutfLbmhXzEKQJY5oqrXCFF2mA6UeNUrlo
         u+X87+6LAXsdmnY2sOxpF2qYRoF0Mf7/hPhKcW8ZC23R1f4i86ypBO/BZUxyil6O18hS
         zC7SkYsmQK1g0rkJWpKz0KmTSZnoCkKYc2Bzj47N4a0iCAGvd0jWY+z1wV4be2xhvP5l
         13cw4CPhNXPXTGqH75VNiH06+xNrmBez9+Lf2kj210QCIY5kG/RidL2rTJaR+R2bnURb
         dVLA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZlpwlPux;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <cohuck@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id af79cd13be357-7c02dbe8029si517422685a.421.2025.02.05.07.54.02
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 07:54:02 -0800 (PST)
Received-SPF: pass (google.com: domain of cohuck@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZlpwlPux;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738770842;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HuRJHudXYzPLPY6ofEjlax1+GCZT5OXRUcbwGsQeyOE=;
	b=ZlpwlPuxHMd6Rvlj1mXd3yun53fCsTdoExPJNKH97ZnNF3CsWLwUYw3RExWKJ5ithE/zm1
	WmUkDWjD0HntV2voHUngsn51Vsu5MI7vu11Jbkpq+Y/FwZlM1efku2f8XZ/opk10IupRRX
	1AGS/Puug/RZa68AeOMyuP68BEmXNII=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-590-uLwc9xBHPKCPm9YQCk6Tlw-1; Wed,
 05 Feb 2025 10:54:01 -0500
X-MC-Unique: uLwc9xBHPKCPm9YQCk6Tlw-1
X-Mimecast-MFC-AGG-ID: uLwc9xBHPKCPm9YQCk6Tlw
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 24C4719560A6;
	Wed,  5 Feb 2025 15:53:59 +0000 (UTC)
Received: from localhost (unknown [10.39.193.69])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7ABC71800570;
	Wed,  5 Feb 2025 15:53:57 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org, Alex
 =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] tests/functional/test_aarch64_virt: Fix vulkan test
 without egl-headless
In-Reply-To: <20250205141140.97437-1-thuth@redhat.com>
Organization: "Red Hat GmbH, Sitz: Werner-von-Siemens-Ring 12, D-85630
 Grasbrunn, Handelsregister: Amtsgericht =?utf-8?Q?M=C3=BCnchen=2C?= HRB
 153243,
 =?utf-8?Q?Gesch=C3=A4ftsf=C3=BChrer=3A?= Ryan Barnhart, Charles Cachera,
 Michael O'Neill, Amy
 Ross"
References: <20250205141140.97437-1-thuth@redhat.com>
User-Agent: Notmuch/0.38.3 (https://notmuchmail.org)
Date: Wed, 05 Feb 2025 16:53:55 +0100
Message-ID: <87o6zg75gs.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-TUID: qm4/1Y9rIZI6

On Wed, Feb 05 2025, Thomas Huth <thuth@redhat.com> wrote:

> The vulkan test currently fails if the egl-headless device is not
> available. Let's add a proper check to skip the test in this case.
>
> Fixes: 3d30f882ce ("tests/functional: extend test_aarch64_virt with vulkan test")
> Reported-by: Cornelia Huck <cohuck@redhat.com>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  tests/functional/test_aarch64_virt.py | 2 ++
>  1 file changed, 2 insertions(+)

Tested-by: Cornelia Huck <cohuck@redhat.com>
