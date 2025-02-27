Received: by 2002:a17:504:76a5:b0:1be9:327d:8ee3 with SMTP id sy5csp90324njb;
        Thu, 27 Feb 2025 01:03:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHidUaL5YlkmLgDDbjF7BJP6lq/beB7rPD4RoUyjkTjKkiZA7EQS0li3ze409/bm7E9V2Bg
X-Received: by 2002:a05:6871:328b:b0:2b8:608d:5dd1 with SMTP id 586e51a60fabf-2c155806086mr1477482fac.18.1740647013222;
        Thu, 27 Feb 2025 01:03:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740647013; cv=none;
        d=google.com; s=arc-20240605;
        b=Rlbwk7orDb3kpxe+fACbTMCtlVpzWpaBibfBPUQQVrfzgijigdGhJPMlZbZ2j5go4L
         eBLzVRL9tygEPLzrwWZqvrMKCb9Q+DPJ3fXuRYFKu9U2wTtLHj2PGC9Lcg/cv4tukNS/
         u3zGpeqnP66Gp7KsvmH3KyfFAUguh3ABWRMCM/iC7duJT/VO3R2kYn+DfEQoOwJ+bma9
         FGqJJAgkDYRm0wOvrNHS1MRXldPRCAEEGQcdzJ7hpivo6Dnb8qeXT9zHDrTJnHklkwCq
         VrO4imhDr7P6geIy12bv4kjzNtKhsTAd/xn7TnQvhy7f9QPc8CZzZVmY4VT0PLmoX7QL
         E05Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=qZszhIPsciDW52yUIkHX/wCn0QHT7xVae/t/UlYN2pg=;
        fh=RT9TadapyfqR2sJkkkMQgbf+bHBNqHHVuvlVi98Li+o=;
        b=KCZ+KY7OhYbyypNkr46q6HNXvMJgPuUUyS6o+to1Wa0dTP0Sb8MIBvO9bTvaLfrAX+
         WgjjAw7yB6eUGcEbTP1eq07H1zbUeRag7pkUTqRBqA1uLf+o+Lf/kGc/y32FqIkk0KBv
         ko3gV3ON4PFgWq46rCEeBGbA9sE7p8PSS/nfm+EMlxdwrHjK1xw6bs8xjCKLQrEFe3ev
         zG1YiihL0H5muEWYAgfLqpTLLruRA+JocBGxDrysypxf7N79xZ+k0UlbC5/FC6PHIu8M
         rf2pfxhq0SSUUhC2P1DYbLYmTki259b43AePUwbkQ8CRg8lg2Bs33aA14VhXpaYu20Gs
         qnAw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LyiZFbpx;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 586e51a60fabf-2c15c3ad8a6si631761fac.144.2025.02.27.01.03.32
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 01:03:33 -0800 (PST)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LyiZFbpx;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740647011;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qZszhIPsciDW52yUIkHX/wCn0QHT7xVae/t/UlYN2pg=;
	b=LyiZFbpxjhQM0dZeLQiOrex9gJqDsRXP2i+Zg1/wdT/nqQ8A3CPay0cxNO2GUjEmkM4sAV
	s5bsXLm3t6Qs4Et1OHt+0PC8yu3NChXDWPUtUuARQnxP7ycsQ24iH0D3EtXCXskaWqRJFh
	Wtfjx2UuIAuF18UdaZIi9GYW+CBt1ZE=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-388-JI9U2pwlMhes5cuyONRRZA-1; Thu,
 27 Feb 2025 04:03:28 -0500
X-MC-Unique: JI9U2pwlMhes5cuyONRRZA-1
X-Mimecast-MFC-AGG-ID: JI9U2pwlMhes5cuyONRRZA_1740647006
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5F513190ECE1;
	Thu, 27 Feb 2025 09:03:25 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.99])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1BBE01800352;
	Thu, 27 Feb 2025 09:03:18 +0000 (UTC)
Date: Thu, 27 Feb 2025 09:03:15 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Kyle Evans <kevans@freebsd.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Alexandre Iooss <erdnaxe@crans.org>,
	=?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
	Laurent Vivier <laurent@vivier.eu>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
	Riku Voipio <riku.voipio@iki.fi>, Warner Losh <imp@bsdimp.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Ed Maste <emaste@freebsd.org>, Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 07/25] tests/functional: Allow running TCG plugins tests
 on non-Linux/BSD hosts
Message-ID: <Z8AqU7HaD9kraz_c@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20250226140343.3907080-1-alex.bennee@linaro.org>
 <20250226140343.3907080-8-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250226140343.3907080-8-alex.bennee@linaro.org>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-TUID: 0GDGpPmX9rEd

On Wed, Feb 26, 2025 at 02:03:25PM +0000, Alex Bennée wrote:
> From: Philippe Mathieu-Daudé <philmd@linaro.org>
> 
> Not all platforms use the '.so' suffix for shared libraries,
> which is how plugins are built. Use the recently introduced
> dso_suffix() helper to get the proper host suffix.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2804
> Suggested-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> Suggested-by: Daniel P. Berrangé <berrange@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> Message-Id: <20250220080215.49165-4-philmd@linaro.org>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  tests/functional/test_aarch64_tcg_plugins.py | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/functional/test_aarch64_tcg_plugins.py b/tests/functional/test_aarch64_tcg_plugins.py
> index 7e8beacc83..5736b60545 100755
> --- a/tests/functional/test_aarch64_tcg_plugins.py
> +++ b/tests/functional/test_aarch64_tcg_plugins.py
> @@ -13,10 +13,11 @@
>  
>  import tempfile
>  import mmap
> +import os
>  import re
>  
>  from qemu.machine.machine import VMLaunchFailure
> -from qemu_test import LinuxKernelTest, Asset
> +from qemu_test import LinuxKernelTest, Asset, dso_suffix
>  
>  
>  class PluginKernelBase(LinuxKernelTest):
> @@ -62,6 +63,10 @@ class PluginKernelNormal(PluginKernelBase):
>          ('https://storage.tuxboot.com/20230331/arm64/Image'),
>          'ce95a7101a5fecebe0fe630deee6bd97b32ba41bc8754090e9ad8961ea8674c7')
>  
> +    def plugin_file(self, plugin_name):
> +        sfx = dso_suffix()
> +        return os.path.join('tests', 'tcg', 'plugins', f'{plugin_name}.{sfx}')

General purpose helper functions shouldn't go in the test cases files.
This it better placed in tests/functional/qemu_test/testcase.py, alongside
all the other path construction helper functions.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
