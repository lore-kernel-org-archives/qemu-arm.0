Received: by 2002:a17:504:5965:b0:1be9:327d:8ee3 with SMTP id xe5csp1717271njb;
        Mon, 29 Jul 2024 04:05:33 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXag90SLcBi2S+5KRj7s2kup1TE5DhGoHsGg7uksgP8QGcQ3UcGFKhMN99JJdRtxdwQdth9Q9Zh+cqyx+Fzj2M2B/jf7nmb
X-Google-Smtp-Source: AGHT+IF0LRJbtOnJAc4ajh/ZGXYJ65K/dIG00yLFrFLOXM8K6tyUUVKNUVjNYUKGGYgmNRKobkIR
X-Received: by 2002:a05:620a:4105:b0:79d:5af9:9e8a with SMTP id af79cd13be357-7a1e52f8e64mr922111885a.69.1722251133433;
        Mon, 29 Jul 2024 04:05:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1722251133; cv=none;
        d=google.com; s=arc-20160816;
        b=0qhs6TW7TcfXOPqIb3bEa2KC2ib/qI3CIvNkC48V0PYHra6/2I/lG6mLfSwa1Nfc3o
         ZrEFfL/pGjRUREBWP0JUiqpyNVJbESCYIxJesRAJ12eVOkAbXejXaozff+kUTdJht4Os
         5ZbcIgFOiC5JwbROTkdy8pxbRyZBAx5cUpLIb+jrrcXXxyhWnw2sHmdew0dhijJbe9Wm
         bDqDOTBfA+ckiOL2hTDFS1F7kOgQk3RzlEhG7oeeQXK7J7+NdCqzYRNliwLnEXsIzUdH
         GelTqwuWWUivs9eQDHKnHS4SKmxLdZ6oFG9rUvhezFVGdLPxpRY4265OiItXnnhbfTvR
         W5Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:dkim-signature;
        bh=3r1mIKK4V5hBTdmzUpz7ldC7D1ViTAzELfJkPVXxRLw=;
        fh=wNhxSdiHg8xiqcUd0ic1q+ay8XePjEEHF9Rtf9iA5Kw=;
        b=eMSiZwyHFgQdbe59CGcCU44VF52TCGGRRARg7Nv2eqZZVzDcDYjJhWUvTCOjY11wHV
         nqpZfQ283AtJlKKMl814lUJi9aCqcXlVWNXm60MZitAB1Y/wWRiPSw9OMwwTf0ZgwlIg
         9ddGIMuwxiB2pyDEO1Pmgtx+jE75McduTJcDvzdnED2DmNT/LnCE95wCcEySVNSjr8Ke
         fj13fQ4bEqVaP7T4PaHTzRwFZrOtXhI6YxnUafCCdICUAHR10QlW+uB8a3dkxp6Jm+Wo
         V47hsIO8ICFtrau8B3VnJNIS7BaI6pozEPebIqBh5gEWx/X+8Kp7yLBg5fj2ZWu5eztk
         HPPw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hdPn9Nvm;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id af79cd13be357-7a1d7473997si1027940985a.550.2024.07.29.04.05.33
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 04:05:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hdPn9Nvm;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722251133;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:  references:references;
	bh=3r1mIKK4V5hBTdmzUpz7ldC7D1ViTAzELfJkPVXxRLw=;
	b=hdPn9NvmmTUg7AWtThrdn8TOeefkBcjtHCbFA+B8qwCHrzSC3rygZhraSP8ljlHgkBeseW
	fQHUidKZHFasRHrvsqREGPzuZrv074lAegxBL51YMqh0YCau2dORUUU7rp46nI29iurB/3
	+cgz7K24H7jgy9UV7oggK7GhSdT6H6M=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-447-5ACTjvxFPseuOWQTfHarKg-1; Mon,
 29 Jul 2024 07:05:27 -0400
X-MC-Unique: 5ACTjvxFPseuOWQTfHarKg-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 31E321955BF7;
	Mon, 29 Jul 2024 11:05:24 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.58])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9AE401945113;
	Mon, 29 Jul 2024 11:05:12 +0000 (UTC)
Date: Mon, 29 Jul 2024 12:05:09 +0100
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
Subject: Re: [PATCH 11/13] tests/avocado/machine_aarch64_sbsaref.py: allow
 for rw usage of image
Message-ID: <Zqd3ZeNIo3dMTzHl@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20240726134438.14720-1-crosa@redhat.com>
 <20240726134438.14720-12-crosa@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240726134438.14720-12-crosa@redhat.com>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-TUID: yBH60E/Op3ue

On Fri, Jul 26, 2024 at 09:44:36AM -0400, Cleber Rosa wrote:
> When the OpenBSD based tests are run in parallel, the previously
> single instance of the image would become corrupt.  Let's give each
> test its own copy.
> 
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>  tests/avocado/machine_aarch64_sbsaref.py | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/avocado/machine_aarch64_sbsaref.py b/tests/avocado/machine_aarch64_sbsaref.py
> index 1275f24532..8816308b86 100644
> --- a/tests/avocado/machine_aarch64_sbsaref.py
> +++ b/tests/avocado/machine_aarch64_sbsaref.py
> @@ -7,6 +7,7 @@
>  # SPDX-License-Identifier: GPL-2.0-or-later
>  
>  import os
> +import shutil
>  
>  from avocado import skipUnless
>  from avocado.utils import archive
> @@ -187,7 +188,9 @@ def boot_openbsd73(self, cpu):
>          )
>  
>          img_hash = "7fc2c75401d6f01fbfa25f4953f72ad7d7c18650056d30755c44b9c129b707e5"
> -        img_path = self.fetch_asset(img_url, algorithm="sha256", asset_hash=img_hash)
> +        cached_img_path = self.fetch_asset(img_url, algorithm="sha256", asset_hash=img_hash)
> +        img_path = os.path.join(self.workdir, os.path.basename(cached_img_path))
> +        shutil.copy(cached_img_path, img_path)

Again I think we should be using a throwaway qcow2 overlay rather
than copying the full image.

>  
>          self.vm.set_console()
>          self.vm.add_args(

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
