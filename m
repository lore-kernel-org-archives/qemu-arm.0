Received: by 2002:a17:504:5965:b0:1be9:327d:8ee3 with SMTP id xe5csp1713875njb;
        Mon, 29 Jul 2024 03:59:42 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWdFq/hrjzz2/7n/PQSZnk4bZ1ZUCPW+rR4Xmifm4xNKFOZ0Ew7f+fsV/R3MK6URrQdFFKkL64GXFe65cUQvkDKgOBbp688
X-Google-Smtp-Source: AGHT+IGrsCbHKVvgUXfw5Yu2MSIKOlZxqWrR6FWA6RUYNmhNXHKYhucIcqc6IOpSTFfdo1EeLauA
X-Received: by 2002:a05:620a:1aa6:b0:79d:60c2:59f with SMTP id af79cd13be357-7a1e526534cmr573969585a.32.1722250782539;
        Mon, 29 Jul 2024 03:59:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1722250782; cv=none;
        d=google.com; s=arc-20160816;
        b=hQv7BHiPCc1rDb5LZW8qDXegIHTfe10ZgWigUnG4q6y+z31FmipQQ0yBbTQlbM9O6F
         MenTqELW7MmxmeftKkm0UZs1n1VZHA192rTBB3JLkMUKtBIu5aYvCnQMUKFmwnq0uT9M
         PoLuzEOxt7CuxtRSNBOJeetNPZ3dEr/goyQhLKeRMzbboTMgK0iEw9zSWNQWAHrapSDq
         0rlF5r3OXdBPMgK9eXSTjwzhMFu8nOd7pIsYYTO0wtn7tfpHg+4BwZ1cK2OS7e1DJP8n
         YytKHz0ORipIlNZiqEHgO1+hrXnXiNqq3VNDA/f7mC7znaazL7EyyPWR850AvjmKtRvR
         H9Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=wFddE/KnwkER6UAYALyDN4no1tJhTjqMvlEdSKIcCog=;
        fh=wNhxSdiHg8xiqcUd0ic1q+ay8XePjEEHF9Rtf9iA5Kw=;
        b=xQ0m3C+CsInu0SGkwDH52yzkqLP5OqauaW2gO5iOEdTtXmbDxYlm+/YyjAk45zBS6R
         avpSQLe09P+KtBr4qGJ0eckYZ0n7O+Kx+rRaFaooS3haILWQJQELQ7CVlQY9D3k/8eWo
         oOCIh+O3zWjpROkCDc8Hs3EM2Q2vhk67Oc6FRLIGgAYOtkGK+FL/MkB6I/6nz8LFmKiF
         Ei0fQwQYAc6tbiHWKwTFfkmVxk9MJihChrtDn1QvLfxLKUW7TZWpTuFppxZUpb5VKmO6
         NgYfCb+P4i29kL577HJVKRjL10j1ba3FQHSGRXONrnaiNTA+/kfZRNz2I3B/pWSIxoif
         vqjg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="hz/vgcXF";
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id af79cd13be357-7a1d747395asi999393485a.585.2024.07.29.03.59.42
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 03:59:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="hz/vgcXF";
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722250782;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wFddE/KnwkER6UAYALyDN4no1tJhTjqMvlEdSKIcCog=;
	b=hz/vgcXFEnTRtx1GOxAzpOvhS2umIa63KprQ2GbHsB+ojomkYsXxdxZc+BFabaiAYFC7pE
	OnD8K1LlcGVWGxJgSgZb9/dsrGWQBktbW2cLFnvX8ToSvFge6ecRSxFTM0XR03dJgcdznt
	p1JE2nNfr8fv4wY2HRFsFpPP67OcJ5Q=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-241-AyMedb8oPt29atOdHuSslQ-1; Mon,
 29 Jul 2024 06:59:38 -0400
X-MC-Unique: AyMedb8oPt29atOdHuSslQ-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 85E7D1955D58;
	Mon, 29 Jul 2024 10:59:36 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.58])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id F3B7E1955F40;
	Mon, 29 Jul 2024 10:59:29 +0000 (UTC)
Date: Mon, 29 Jul 2024 11:59:26 +0100
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
Subject: Re: [PATCH 08/13] testa/avocado: test_arm_emcraft_sf2: handle RW
 requirements for asset
Message-ID: <Zqd2Dg8RChDn0B4t@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20240726134438.14720-1-crosa@redhat.com>
 <20240726134438.14720-9-crosa@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240726134438.14720-9-crosa@redhat.com>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-TUID: jSRKXITkPZwV

On Fri, Jul 26, 2024 at 09:44:33AM -0400, Cleber Rosa wrote:
> The asset used in the mentioned test gets truncated before it's used
> in the test.  This means that the file gets modified, and thus the
> asset's expected hash doesn't match anymore.  This causes cache misses
> and re-downloads every time the test is re-run.
> 
> Let's make a copy of the asset so that the one in the cache is
> preserved and the cache sees a hit on re-runs.
> 
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>  tests/avocado/boot_linux_console.py | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
