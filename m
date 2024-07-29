Received: by 2002:a17:504:5965:b0:1be9:327d:8ee3 with SMTP id xe5csp1714900njb;
        Mon, 29 Jul 2024 04:01:30 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX+FCvxakxBsd+6WCLE8UkBl90I+Rhe9F+OybLIzLJQ8eynGI+6dYQnLm/waggHnQ0+jU3/Tjyxm8rPq89pkvl5Ft2OHEJI
X-Google-Smtp-Source: AGHT+IFtHKyWXX5jfvtvAECpKRcs4wbjoVsh+ErgCcm2RQsVsRgOP9qWpPJTZ5YrotFd6WIBIhdR
X-Received: by 2002:a05:620a:2943:b0:79f:3f6:55d5 with SMTP id af79cd13be357-7a1e50532efmr1059295885a.0.1722250890240;
        Mon, 29 Jul 2024 04:01:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1722250890; cv=none;
        d=google.com; s=arc-20160816;
        b=N2VsFe20zxpuOl1eiB4Y1QY8Ct/Bi0WLY4hRNTgj2ClOLiJZB2h3Dw1z9Bkn9/zQMf
         auss38UrIH6EnmR0/gdVbkAVvNmWfgfB+YLEYoeZY9Z33qTMtQ0NIHqsOTZnmqltxjzP
         /x9osiiTj//FB/f2a8KYJfYTmwXPcvSgIIjssCPUjqw+xlJ5ShNA7b8iumu0dQLeuGjj
         ot0AZQM4p6y9AsK6PKjaqEkPSx/yU66SV2GcdWf2I/9NnZMnzUwxBYAKUgXyxue/5Pdm
         y/U7oBS46mk3I1CEOgFXfkVfyiv2eNJOCL7cj9a0+LqHNB6mEjhXdvbhcxMgZV0RiCi2
         PsJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:dkim-signature;
        bh=/136KuYSZeuOyvyvNzrmEgzKDOkJpPOyPtAP+U1yY4E=;
        fh=wNhxSdiHg8xiqcUd0ic1q+ay8XePjEEHF9Rtf9iA5Kw=;
        b=AJ5jZXEBD5Am2Wd31zQzu6H+ncVi42WvDF4YrwbvRTv7fuPYrkKhVxOXqlBqFolWAz
         Z82k6nOSvOGuR5iNnl4MzuciLYLvqUVnmF6AMUCeFLrurgLWsNbUyceVvq+StKjMxhVU
         WmZaO47aHtgMhWVviu7tvISu0pET6zkHOThqkPoe4V5y9ft9Imxjk8CrHjur3v3WtAqJ
         jupJnXme4I/SZNhZNZs1SXP+4jnAFbC3upgK3bNqEjpRFwJthSoMdaZDOuocwTKbz5Jd
         eHY2C09/0506oJXz4SCe/COA5lOx8jeqBxLdBRmehVOE6ur2LHJfXBw8/1Woil5zT7Fp
         W+qw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YUOhygUx;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id af79cd13be357-7a1d7444d1fsi1038222985a.370.2024.07.29.04.01.30
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 04:01:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YUOhygUx;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722250889;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:  references:references;
	bh=/136KuYSZeuOyvyvNzrmEgzKDOkJpPOyPtAP+U1yY4E=;
	b=YUOhygUxFqhBxD5ZdpMzGbtAqyouM/spqENeYHexwC9+DOASs+CyzC+ac/5qYWClXB3x+O
	RXytPtrG1cESs+S3VbvUCf/qidRWRtjljWLuO1m2N1hM/RTh3e2bW/meYoqB6ux1c0gYDQ
	0+4tqDfQdoX4IPGj+chwPWzyr6UEMQE=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-562-30K7-chHMJ-6wY0KsOPVSg-1; Mon,
 29 Jul 2024 07:01:25 -0400
X-MC-Unique: 30K7-chHMJ-6wY0KsOPVSg-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 685781955D4A;
	Mon, 29 Jul 2024 11:01:23 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.58])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 020C81955F23;
	Mon, 29 Jul 2024 11:01:16 +0000 (UTC)
Date: Mon, 29 Jul 2024 12:01:13 +0100
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
Subject: Re: [PATCH 09/13] tests/avocado/boot_xen.py: fetch kernel during
 test setUp()
Message-ID: <Zqd2edn1-aNiVriv@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20240726134438.14720-1-crosa@redhat.com>
 <20240726134438.14720-10-crosa@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240726134438.14720-10-crosa@redhat.com>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-TUID: IijHw4wK51fT

On Fri, Jul 26, 2024 at 09:44:34AM -0400, Cleber Rosa wrote:
> The kernel is a common blob used in all tests.  By moving it to the
> setUp() method, the "fetch asset" plugin will recognize the kernel and
> attempt to fetch it and cache it before the tests are started.

The other tests don't call  fetch_asset() from their setUp
method - what's different about this test that prevents the
asset caching working ?

> 
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>  tests/avocado/boot_xen.py | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/tests/avocado/boot_xen.py b/tests/avocado/boot_xen.py
> index f29bc58b9e..490a127a3e 100644
> --- a/tests/avocado/boot_xen.py
> +++ b/tests/avocado/boot_xen.py
> @@ -30,23 +30,22 @@ class BootXen(LinuxKernelTest):
>      timeout = 90
>      XEN_COMMON_COMMAND_LINE = 'dom0_mem=128M loglvl=all guest_loglvl=all'
>  
> -    def fetch_guest_kernel(self):
> +    def setUp(self):
> +        super(BootXen, self).setUp()
> +
>          # Using my own built kernel - which works
>          kernel_url = ('https://fileserver.linaro.org/'
>                        's/JSsewXGZ6mqxPr5/download?path=%2F&files='
>                        'linux-5.9.9-arm64-ajb')
>          kernel_sha1 = '4f92bc4b9f88d5ab792fa7a43a68555d344e1b83'
> -        kernel_path = self.fetch_asset(kernel_url,
> -                                       asset_hash=kernel_sha1)
> -
> -        return kernel_path
> +        self.kernel_path = self.fetch_asset(kernel_url,
> +                                            asset_hash=kernel_sha1)
>  
>      def launch_xen(self, xen_path):
>          """
>          Launch Xen with a dom0 guest kernel
>          """
>          self.log.info("launch with xen_path: %s", xen_path)
> -        kernel_path = self.fetch_guest_kernel()
>  
>          self.vm.set_console()
>  
> @@ -56,7 +55,7 @@ def launch_xen(self, xen_path):
>                           '-append', self.XEN_COMMON_COMMAND_LINE,
>                           '-device',
>                           'guest-loader,addr=0x47000000,kernel=%s,bootargs=console=hvc0'
> -                         % (kernel_path))
> +                         % (self.kernel_path))
>  
>          self.vm.launch()
>  
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
