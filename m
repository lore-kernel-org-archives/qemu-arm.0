Received: by 2002:a17:505:d21:b0:1be9:327d:8ee3 with SMTP id vh1csp805963njb;
        Wed, 8 Jan 2025 04:33:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF7pSngBhXaqMO3B5LBO8BXbG7wSFAzsENF9erOf1Qrc5LiW24tNA5ifPAtG2WBHw5w5pv3
X-Received: by 2002:a05:6102:1624:b0:4b2:5c4b:55e7 with SMTP id ada2fe7eead31-4b3d106a3a0mr1483671137.25.1736339599369;
        Wed, 08 Jan 2025 04:33:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736339599; cv=none;
        d=google.com; s=arc-20240605;
        b=cJLnF7+4LkrMZ3HgOe6Y5TjXTRUDd5wP9LkmWDwNtP0m2Qf15UTahikNzcqwZZTC2J
         D/K0GQop1cDjZN07bUnhul0sWQ/NPnHc9/OXQslcX8Ex3cMlJ/zQchWd6r0j3c0yxCiy
         lMSbUKf7t16MMtaeC4wiKaLGvoPmAgU7eZv6VAZQfqUwUFCL5vj+O+8+MkwAto4P7GEI
         rO0I72h6r0mRMA32dszB1mxx6r2Ts9pWvN40CFsdFWuLSl6jJHOZCo+4SIeyjqsAXL6d
         AqdG9cojTUlKhcxwWdIWHpZFNbE5J42Lv9xd0Z6jWdnz22oVKsXIr1dXV3LS9c9SUr35
         YTRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=bH6hCNPRDorQnY63I4xOpITClsVhCHPSYSt1oId0mvM=;
        fh=oYGGdyfrs1mjC/oG5I45Lc73TyecOFE0GdD98CPHjNA=;
        b=C87jBTU+eDXLEaBDLbydMCmjKAhbPGvUNf8IRiwhQm12yOh+g8c6BIyA+EWpxW0Tuo
         azKUlXTyLe3ofvR0VjwkEcruR7vEZ2tz9DJ4rPxsF90cIoH2iiGGD4NaX55psbRsJviM
         Bbp/5yLLxyJQctfPiwuhnR+Ay2JMSAOKLkNm3I5D1+CqhPQ7iO5PuF5BAvssjqIyp9ox
         +MSlMLq5fTS8mxQmsyTz6LH10QV1Cw2dLENqCshNVqxxtYVKC5vcxft2UTl3VZSoOKwT
         Ly+J64FESAj0Q5NNYp/qE96hhaK/Goc2k4hQy79P297jOV80Ulu32zzYAxud5zD+CXpx
         wQTw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=e5ip4GHk;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id ada2fe7eead31-4b2bfb777dbsi9903581137.505.2025.01.08.04.33.19
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 04:33:19 -0800 (PST)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=e5ip4GHk;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736339599;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bH6hCNPRDorQnY63I4xOpITClsVhCHPSYSt1oId0mvM=;
	b=e5ip4GHkVRLwUatzLO/flziFht6wbXxDtO07rDo4zS8UQt+b7MLlHl0EaeEzipAbDECV34
	FCDwehgBlYk7x6iBv0xjhqCSpjr7dXdGlaqlHsyvzIR4k+vkcxPFMSpY6c4t4X7QwksQtF
	iotJ47CcjNcZcvUFFiBQp2cHLaIclcE=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-22-VEplcDwENNG6rW1gPoGBuw-1; Wed,
 08 Jan 2025 07:33:15 -0500
X-MC-Unique: VEplcDwENNG6rW1gPoGBuw-1
X-Mimecast-MFC-AGG-ID: VEplcDwENNG6rW1gPoGBuw
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 761C419153CF;
	Wed,  8 Jan 2025 12:33:10 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.103])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2C966195608E;
	Wed,  8 Jan 2025 12:32:54 +0000 (UTC)
Date: Wed, 8 Jan 2025 12:32:51 +0000
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
	Li-Wen Hsu <lwhsu@freebsd.org>
Subject: Re: [PATCH v4 19/32] tests/functional: add zstd support to
 uncompress utility
Message-ID: <Z35wc_YFjElT4ozH@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20250108121054.1126164-1-alex.bennee@linaro.org>
 <20250108121054.1126164-20-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250108121054.1126164-20-alex.bennee@linaro.org>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-TUID: xtoO8+2eZMHT

On Wed, Jan 08, 2025 at 12:10:41PM +0000, Alex Bennée wrote:
> Rather than using the python library (which has a different API
> anyway) lets just call the binary. zstdtools is already in out
> qemu.yml so all test containers should have it around. Tests should
> still use @skipIfMissingCommands('zstd') to gracefully handle when
> only minimal dependencies have been installed.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> 
> ---
> v4
>   - add chmod step to helper
>   - also handle .zst extension
> ---
>  tests/functional/qemu_test/uncompress.py | 26 ++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

> 
> diff --git a/tests/functional/qemu_test/uncompress.py b/tests/functional/qemu_test/uncompress.py
> index 6d02ded066..911d74ec23 100644
> --- a/tests/functional/qemu_test/uncompress.py
> +++ b/tests/functional/qemu_test/uncompress.py


> @@ -79,5 +101,9 @@ def guess_uncompress_format(compressed):
>          return "xz"
>      elif ext == ".gz":
>          return "gz"
> +    elif ext == ".zstd":
> +        return "zstd"
> +    elif ext == ".zst":
> +        return "zstd"

Or

  elif ext in [".zstd", ".zst"]:
      return 'zstd'

Either way, by R-b stands.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
