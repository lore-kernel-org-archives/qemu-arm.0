Received: by 2002:a17:504:664e:b0:1be9:327d:8ee3 with SMTP id l14csp10116685njk;
        Fri, 3 Jan 2025 03:45:24 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV/vWujoaSyfpkOl8e8dYkRlzFB6R3syF6T2/LV0Gp7wnHu6cfVRVvYbK4q83+QfxjI0YpAEGKX+k1cwA==@linaro.org
X-Google-Smtp-Source: AGHT+IF9t4d1NmIv+8+ACDrEy501E+ZSBGpKgTn5l9h8k2S/DQOM3WErPHj0HKv3Q//ASowCQrlm
X-Received: by 2002:a05:620a:2449:b0:7b6:f6ac:60e with SMTP id af79cd13be357-7b9ba7b059amr9027914385a.36.1735904724369;
        Fri, 03 Jan 2025 03:45:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1735904724; cv=none;
        d=google.com; s=arc-20240605;
        b=KQCA9jAAoVhtb44WLU2GnnI47+nXJBFAc9nOcd6c9Ri7qtTwWd1mBGSeiQylUUz/ou
         6+UnGLEqCTBHgTTwwIbRe9fYhfwXXHpOdu0cr62uGv2BLfBhhDzZIcEFaMtoE00ArVid
         Pyy1qRlTpzzh8+8DQ4d0HFBpwUqMmetTA4hTwMuRTv7TFPh0Ei+U1IltFW40ZTQ+H+D+
         okXf6rM9b7bU/6kQKa7LqquMyMMcxeAnTVIOmcpF+kVIic4z3QoqEGhCzOl41A1VW9iK
         ToMomGUoh4SG0lV/Eiz7Gqr7XVIIKms8F6Plk+hr9kQ9YB9YWgMjgOyIyu8HanlzIuSi
         50eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=ue5XJJPzf0nRIyVmCQHUZuZzob9nJp3q9bDncAv13X0=;
        fh=E87fmj6alKaMqs9hQGurmJFj0IO5cHrs3PrRXeenkbE=;
        b=f8HR5iBXLEhijndq8SY9hwCDQPW6CGgBxFdp+buV3HWgl0yIpIlqCXGUKYfhDz+5Mw
         rbiUgdUYK55PT9nNqBHq/Jm0CWq034Nlf/UPGMa1jUIb7/GvhTsYe6skD7erdScbn2dj
         k2KmmNl3ZOD7tHoBqfhqS9wvH51hl4AVmwEhINpxXbSWVAJqrlK88jwHn0TsmN8sHZMv
         +m7L1m3LGtORvBXh9fES0yFInmeUr9tzyhghCPaMSTWASky7tMwG9CDm3e2KsEsPxFSF
         rdywlyMqHwe0igq5q0aHPxQ+x2wu1HemJFUB5e7rtainAYdGbWiLdxvafcUHEKtF6bWh
         GRJg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=g+Dsnl2p;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id af79cd13be357-7b9ac47a303si3703445585a.286.2025.01.03.03.45.24
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 03:45:24 -0800 (PST)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=g+Dsnl2p;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1735904724;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ue5XJJPzf0nRIyVmCQHUZuZzob9nJp3q9bDncAv13X0=;
	b=g+Dsnl2pYppUPDyZ5/PZlmDhWg2uys33JYr4bzt9ENRNTkNNlPb3DFKJkiu21YmKlvr/Ke
	bv88rqbjO2KvkMfIsM1suTMmGBuyPgTBQeo1RzcYCd2To4UUIxG1WKmW/QWs05acaT4Kem
	YdXDS0d26V9nvjDSEfB5CZWhZI81xH4=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-628-Lob3W6M8OHGRGOpSBrn4sg-1; Fri,
 03 Jan 2025 06:45:20 -0500
X-MC-Unique: Lob3W6M8OHGRGOpSBrn4sg-1
X-Mimecast-MFC-AGG-ID: Lob3W6M8OHGRGOpSBrn4sg
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7044F195608B;
	Fri,  3 Jan 2025 11:45:16 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.141])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E9D4B195608A;
	Fri,  3 Jan 2025 11:45:09 +0000 (UTC)
Date: Fri, 3 Jan 2025 11:45:06 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Radoslaw Biernacki <rad@semihalf.com>,
	Laurent Vivier <laurent@vivier.eu>, Cleber Rosa <crosa@redhat.com>,
	Fabiano Rosas <farosas@suse.de>,
	Gustavo Romero <gustavo.romero@linaro.org>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>, mzamazal@redhat.com,
	Aurelien Jarno <aurelien@aurel32.net>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Aleksandar Rikalo <arikalo@gmail.com>,
	Leif Lindholm <leif.lindholm@oss.qualcomm.com>,
	John Snow <jsnow@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
	qemu-arm@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
	Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH] licenses: Remove SPDX tags not being license identifier
 for Linaro
Message-ID: <Z3fNwkTOdgBM81zb@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20250102160510.61894-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250102160510.61894-1-philmd@linaro.org>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
X-TUID: jm3pbs+UVz4k

On Thu, Jan 02, 2025 at 05:05:10PM +0100, Philippe Mathieu-Daudé wrote:
> Per [*]:
> 
>   "we're only interested in adopting SPDX for recording the
>   licensing info, [not] any other SPDX metadata."
> 
> Replace the 'SPDX-FileCopyrightText' and 'SPDX-FileContributor'
> tags added by Linaro by 'Copyright (c)' and 'Authors' words
> respectively.
> 
> [*] https://lore.kernel.org/qemu-devel/20241007154548.1144961-4-berrange@redhat.com/
> 
> Inspired-by: Daniel P. Berrangé <berrange@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  accel/tcg/vcpu-state.h                           | 9 +++++++--
>  include/hw/misc/ivshmem-flat.h                   | 5 +++--
>  hw/misc/ivshmem-flat.c                           | 5 +++--
>  target/m68k/semihosting-stub.c                   | 7 +++++--
>  target/mips/tcg/system/semihosting-stub.c        | 5 +++--
>  tests/qtest/libqos/virtio-scmi.c                 | 2 +-
>  scripts/qom-cast-macro-clean-cocci-gen.py        | 7 +++++--
>  tests/functional/test_aarch64_sbsaref.py         | 8 +++++---
>  tests/functional/test_aarch64_sbsaref_alpine.py  | 8 +++++---
>  tests/functional/test_aarch64_sbsaref_freebsd.py | 8 +++++---
>  10 files changed, 42 insertions(+), 22 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
