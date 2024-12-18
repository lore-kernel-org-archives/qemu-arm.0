Received: by 2002:a17:504:664e:b0:1be9:327d:8ee3 with SMTP id l14csp1060723njk;
        Wed, 18 Dec 2024 08:42:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IErNvmpAeCw9CSUGuTYN1fe44+6krBEcHaHu8jCoGNlSIaOUKymX42/h5/J2FlC4OYaW9MI
X-Received: by 2002:a05:6214:406:b0:6d4:22e9:b8b5 with SMTP id 6a1803df08f44-6dd09258972mr58510696d6.46.1734540152829;
        Wed, 18 Dec 2024 08:42:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1734540152; cv=none;
        d=google.com; s=arc-20240605;
        b=YyW0/fjz3eUgwrLHgLyjjgFMttBcBLEcOeWYGY6UIkazZsFqSvOVyCTV9NShP22ZE0
         l9PeHwwOV9nmMKj4m6Pm3OxSTYOe/z+QwUG/e/UzV3xmuPhbmlcclcjlWUQnsKtPdi1U
         ZMt73j2iHerHRdp/5zi59vP0dv3NFIfW9tSqvHwV8s7QMm3ME0nAUTIZ/D6vlErMvnrK
         G0DsNetIeg7rNv5pn/Pm0vphYfQxJ9lab3JTaJqpretbKKJPG6OYtmR0tAJSrzTrLcvC
         Aj0N5p1R+dhrUJP3gs5YtOgyck0LJmBieFzB3CmFtuo6LWj8qBwejbowAFMK7it/7t2M
         oQcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=00azg0bxJY4Rn/l1rT1LJ13Rtkdjfr4MvO0BCYSrtzM=;
        fh=NazwoK8sPxbyxYgjuSNBkuNLGz1It0LkfKBeHhLGOHI=;
        b=VQ7zQiqfID4Jzeh5pzyzTuuuc+fVqxgTVLcba+DzDct/S4y4Tv0taPHM7dcNQOUEbR
         HctB5JdnKgghBI+gBzGkamfLKUrCpUeAorJA4CfDUxgI97B//uLJK8wXUnXQ5Bmh/6XD
         csz3/oKIAIzQU/hM+7HrafZSc9IrpB6neu+UeRomA1S96XSxt2DytC6VYH3w9m455m92
         ub2wOG6wz8GvkGzrvv0aQRAVHbyb5vo0ZSA7at206rTPS6pV5SQOSHHLB9rlwaI21RdX
         DXuYkk/vvsPeTkzz2oAgrDQdyunhbBPC84MRwx0eD50MzmvDGzMZuomIjTbkCXS6XHoR
         ioKg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Wca3lzj4;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6dccd3a0524si143936326d6.496.2024.12.18.08.42.32
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 08:42:32 -0800 (PST)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Wca3lzj4;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734540152;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=00azg0bxJY4Rn/l1rT1LJ13Rtkdjfr4MvO0BCYSrtzM=;
	b=Wca3lzj4pgZv9aqnjQjrVIKSfRofHuJaO0IH8fsSUGb3yYDqQQKZtqKOkLHpKRLEoz2+b9
	S0uEYmGFYuvNZRdzROmam47HcHnNva2JT+NPYU70hYlNkb9Y8lNIsvnIFGx4NS4wg1Nu4Q
	5N9aEszumfusDhQ+IjWlp1ujitetcCE=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-613-XSJa3orLOquC8v3XCVl43w-1; Wed,
 18 Dec 2024 11:42:29 -0500
X-MC-Unique: XSJa3orLOquC8v3XCVl43w-1
X-Mimecast-MFC-AGG-ID: XSJa3orLOquC8v3XCVl43w
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3F7331955EA5;
	Wed, 18 Dec 2024 16:42:24 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.61])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2BA1D19560AD;
	Wed, 18 Dec 2024 16:42:08 +0000 (UTC)
Date: Wed, 18 Dec 2024 16:42:05 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Ed Maste <emaste@freebsd.org>,
	Eric Farman <farman@linux.ibm.com>, Thomas Huth <thuth@redhat.com>,
	Li-Wen Hsu <lwhsu@freebsd.org>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Fabiano Rosas <farosas@suse.de>,
	Radoslaw Biernacki <rad@semihalf.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	=?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	qemu-riscv@nongnu.org, Nicholas Piggin <npiggin@gmail.com>,
	Joel Stanley <joel@jms.id.au>, Beraldo Leal <bleal@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Weiwei Li <liwei1518@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Cleber Rosa <crosa@redhat.com>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	John Snow <jsnow@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bmeng.cn@gmail.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Laurent Vivier <laurent@vivier.eu>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	Richard Henderson <richard.henderson@linaro.org>,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	Halil Pasic <pasic@linux.ibm.com>, qemu-arm@nongnu.org,
	Harsh Prateek Bora <harshpb@linux.ibm.com>, qemu-ppc@nongnu.org,
	Bernhard Beschow <shentey@gmail.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-s390x@nongnu.org,
	Laurent Vivier <lvivier@redhat.com>,
	Alistair Francis <alistair.francis@wdc.com>
Subject: Re: [PATCH v2 21/27] tests/lcitool: bump to latest version of
 libvirt-ci
Message-ID: <Z2L7Xf4KlQD2WCVI@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20241218162104.3493551-1-alex.bennee@linaro.org>
 <20241218162104.3493551-22-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241218162104.3493551-22-alex.bennee@linaro.org>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
X-TUID: zMpZhMioPWmi

On Wed, Dec 18, 2024 at 04:20:57PM +0000, Alex Bennée wrote:
> We will shortly need this to build our riscv64 cross container.
> However to keep the delta down just do the bump first. As ccache4 is
> now preferred for FreeBSD to get the latest version there is a little
> update in the FreeBSD metadata.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  .gitlab-ci.d/cirrus/freebsd-14.vars | 2 +-
>  tests/lcitool/libvirt-ci            | 2 +-
>  tests/vm/generated/freebsd.json     | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
