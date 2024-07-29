Received: by 2002:a17:504:5965:b0:1be9:327d:8ee3 with SMTP id xe5csp1703887njb;
        Mon, 29 Jul 2024 03:30:46 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXl2xte5e8WVdENn9+u6M7iSV3tFbA/QYfN76cMuQhIabXV2Aw1bwCc0ZHEo5/LSBxRQBx8Gf22vnqZ2hcgM3knUk2loSsQ
X-Google-Smtp-Source: AGHT+IGwCwe5I5chnGmJURvH1clhvlicV2SqXjV3Oqp8IZyDUT7Q2TDr3twda5TkB5mrzAxBiaUa
X-Received: by 2002:a05:6214:300b:b0:6b7:b4b1:85ae with SMTP id 6a1803df08f44-6bb55af6226mr104478626d6.54.1722249046778;
        Mon, 29 Jul 2024 03:30:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1722249046; cv=none;
        d=google.com; s=arc-20160816;
        b=WPMB7W+AN9ZkoXNlgr+6kdzMPTkb8m9TD02DYmgcFbvxxdKgK+jdDDJdWLiIOIdPFl
         F4l3ybo0DHwpnYWCVD6GxohACIKiWAxlLgFVP5pv+wrwi4eItoa/jGWZ4cT2JsD4Ysqj
         gHOHZ9I5/2BespWABviJBhfE7pjdD1mbNb8d4Pv/pAMi3meSObtDQ5Sr3VPKJODDfw/Y
         pdIk+PLRrmTgHq6YTtir5MdtniTqFXo2aQnmJ7QV2alfiXlBa51y/ij9sJabXc71YMRT
         FLk1XbB/phGkfqXDJYKjSwNIg7mo4Aq47vl7t6ovEwL+LXM9rB8GBCihNSeaxvCKRyQu
         GCOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:dkim-signature;
        bh=E/v307qrJPqbG9EmIQvCRmaOD0J7mX5czZH3z26/3Oo=;
        fh=wNhxSdiHg8xiqcUd0ic1q+ay8XePjEEHF9Rtf9iA5Kw=;
        b=Leq2X9u1BkVYvScy4saZTtF86wbHzJQJjLZb6RHAf2gkvt96mqeomzx7R48tRfyHN+
         E5Ep/5un5ziC18/gmrJDZgQyDJY72zcmCu8VrGxUwz/F8fZAOSVL8bmeCtTQkP/MmhtR
         QEEQUaM4a4z+QTi+dpNliF8T5CQJxz9FkRxW67EI3i98jEd1/MWkKIHxvpS3C2Lgmufa
         SFSBTCCqj7PcyCToUHIhadLCG0GhpDAP7eW+K5NRJdk+7rH3WlFchRhYcgcWFho4H4kg
         Sl9XPPNSIP03Bcque/3KeY4AvY8wccFOXhNR7T2jyL5GTg562qNrmFDQAioGsi5ag5Zm
         AYnA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=a3s3yUXn;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6bb3fb130absi103164306d6.571.2024.07.29.03.30.46
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 03:30:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=a3s3yUXn;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722249046;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:  references:references;
	bh=E/v307qrJPqbG9EmIQvCRmaOD0J7mX5czZH3z26/3Oo=;
	b=a3s3yUXnoXLtwFpkg1VlaVu/HCXPKQHD4qvInebK/3FhM1FN9eezANpmaG6CRWU7E+z4hl
	jrE15SE07v602eyJzJk9PsT3e3Ms8Z7HovQPtGDRvuo5gHsmI8cS7DZUfECrObuUSGetSy
	E+QENOX4afv9CjSGxSIdISS3esXbDP4=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-70-g733LZZ5PF-0JSc1Znuxmw-1; Mon,
 29 Jul 2024 06:30:45 -0400
X-MC-Unique: g733LZZ5PF-0JSc1Znuxmw-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6C2951955D4E;
	Mon, 29 Jul 2024 10:30:41 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.58])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 04B55195605F;
	Mon, 29 Jul 2024 10:30:34 +0000 (UTC)
Date: Mon, 29 Jul 2024 11:30:31 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Cleber Rosa <crosa@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
	Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>, kvm@vger.kernel.org,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	qemu-arm@nongnu.org, Radoslaw Biernacki <rad@semihalf.com>,
	Paul Durrant <paul@xen.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: Re: [PATCH 03/13] tests/avocado/intel_iommu.py: increase timeout
Message-ID: <ZqdvR3UFBCAu8wiI@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20240726134438.14720-1-crosa@redhat.com>
 <20240726134438.14720-4-crosa@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240726134438.14720-4-crosa@redhat.com>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
X-TUID: Le+94RInamaM

On Fri, Jul 26, 2024 at 09:44:28AM -0400, Cleber Rosa wrote:
> Based on many runs, the average run time for these 4 tests is around
> 250 seconds, with 320 seconds being the ceiling.  In any way, the
> default 120 seconds timeout is inappropriate in my experience.
> Let's increase the timeout so these tests get a chance to completion.

A high watermark of over 5 minutes is pretty long for a test.

Looking at the test I see it runs

   self.ssh_command('dnf -y install numactl-devel')

but then never actually uses the installed package.

I expect that most of the wallclock time here is coming from having
dnf download all the repodata, 4 times over.

If the intention was to test networking, then replace this with
something that doesn't have to download 100's of MB of data, then
see what kind of running time we get before increasing any timeout. 


> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>  tests/avocado/intel_iommu.py | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/tests/avocado/intel_iommu.py b/tests/avocado/intel_iommu.py
> index 008f214397..9e7965c5df 100644
> --- a/tests/avocado/intel_iommu.py
> +++ b/tests/avocado/intel_iommu.py
> @@ -25,6 +25,8 @@ class IntelIOMMU(LinuxTest):
>      :avocado: tags=flaky
>      """
>  
> +    timeout = 360
> +
>      IOMMU_ADDON = ',iommu_platform=on,disable-modern=off,disable-legacy=on'
>      kernel_path = None
>      initrd_path = None
> -- 
> 2.45.2
> 
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
