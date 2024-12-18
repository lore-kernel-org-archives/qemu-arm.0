Received: by 2002:a17:504:664e:b0:1be9:327d:8ee3 with SMTP id l14csp1059099njk;
        Wed, 18 Dec 2024 08:39:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGL5aYN/pv/gD4ZulzVwbZii0l07P6JPGtAE2hnt7P66UIc69913SPN9kSq2W2z6/BGA1pc
X-Received: by 2002:a05:6214:e6d:b0:6d8:9e9d:c223 with SMTP id 6a1803df08f44-6dd0918de7fmr61587266d6.7.1734539995104;
        Wed, 18 Dec 2024 08:39:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1734539995; cv=none;
        d=google.com; s=arc-20240605;
        b=EOmGZuRkuaukpm8HcMEsOvbGsfLFuhh5bD2y9h9K/RNgx0Th/0SMPZXRGKFCrNHM8y
         ZoL+nASPkGqkttahCPqhM6LdEf+ZloPDeQt6jpt/jQGmZ24IeGxH5PLBdNgROixQV+A8
         7LRNxgApv/N1I58DgRdQKhJQGtW4HXctOo/lfRJiaOuN0nM7k5vx/0HmZ0DkXfTNaild
         00JW83bnXKaGl4tcQd9WtwxySoBpr2sPPIrC7jPo6YTo/5TQx5GipAktUSp77Us8nuRL
         M3nJPZi8/K8Ol+Qs7N+Ps4ZP15+R1asMTj/rEFr8Vx3wh0ao1qKjOTX5zbVzqMVLROc8
         vZyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=XGlpZieNsCBXnIKD2cXRV0zgPqYY0gV21NOyHuyp8HU=;
        fh=NazwoK8sPxbyxYgjuSNBkuNLGz1It0LkfKBeHhLGOHI=;
        b=hdlqlMezi9/7fvd0XZFIsFBW5BRPc1tdSdTBT3wjvNRUXl9t8DI32NbYNIS+F/V5YJ
         4W68AyV07CkJgDYsuyMmPHdbF+NrzjOjYYd1Rj9uYtsR0ikSyTeFqWKKQVl5jAMDUYvc
         tAyJAOCdNJg+o0Pc+3Zhw3d5UTGHYoio1bh9I2uvWRgLJHWoVlD5MjiG8ZnJQIdcm9u8
         YXN0KQxooDK11MK8lVBeAy53iy/I+ExKno0f18tHYhBH+LaUWZQEy+5Ob58UEQOl5iH3
         ET0DXU0f1qOO2wv+K0BYF6LulauwI0Q83+jRexp00JTbob6M6zv3iJm3IkSEkb3wRXYl
         cC0Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=i0QMTRRj;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6dccd34e399si125491026d6.236.2024.12.18.08.39.54
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 08:39:55 -0800 (PST)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=i0QMTRRj;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734539994;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XGlpZieNsCBXnIKD2cXRV0zgPqYY0gV21NOyHuyp8HU=;
	b=i0QMTRRjc7pwlm6+eEFXumgmL2+4FWWZ8Q8yyK0DO4KnMIFo6SKq7jIeLPq7agTyajZdWZ
	+/sRHQ75yFhYjJi+UFLDj/oKvbnVefrP3kJ2xLucLQVYsnk3pFL0dnHFSdx8Xq2GzepyUf
	P4ZuhJNfu5tRriagU8nbPvnygkkpEyY=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-63-LYFe1BGbMh2zfILi_mCOYw-1; Wed,
 18 Dec 2024 11:39:51 -0500
X-MC-Unique: LYFe1BGbMh2zfILi_mCOYw-1
X-Mimecast-MFC-AGG-ID: LYFe1BGbMh2zfILi_mCOYw
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id CECFF19560BC;
	Wed, 18 Dec 2024 16:39:45 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.61])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 88C8F19560AD;
	Wed, 18 Dec 2024 16:39:30 +0000 (UTC)
Date: Wed, 18 Dec 2024 16:39:26 +0000
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
Subject: Re: [PATCH v2 20/27] tests/functional: extend test_aarch64_virt with
 vulkan test
Message-ID: <Z2L6vrM6uBZBBQ21@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20241218162104.3493551-1-alex.bennee@linaro.org>
 <20241218162104.3493551-21-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241218162104.3493551-21-alex.bennee@linaro.org>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
X-TUID: 76cdWS6HDEp6

On Wed, Dec 18, 2024 at 04:20:56PM +0000, Alex Bennée wrote:
> Now we have virtio-gpu Vulkan support lets add a test for it.
> Currently this is using images build by buildroot:
> 
>   https://lists.buildroot.org/pipermail/buildroot/2024-December/768196.html
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> 
> ---
> v2
>   - use decorator for has_cmd(zstd)
>   - move set_machine/require_accelerator to top of test
>   - un-handled->unhandled
>   - drop extra - from --snapshot
>   - drop unneeded virtualization=on
>   - only show 1s of each scene
>   - fix long lines
> ---
>  tests/functional/test_aarch64_virt.py | 84 ++++++++++++++++++++++++++-
>  1 file changed, 81 insertions(+), 3 deletions(-)
> 

> +    @skipUnless(*has_cmd('zstd'))
> +    def test_aarch64_virt_with_gpu(self):
> +        # This tests boots with a buildroot test image that contains
> +        # vkmark and other GPU exercising tools. We run a headless
> +        # weston that nevertheless still exercises the virtio-gpu
> +        # backend.
> +
> +        self.set_machine('virt')
> +        self.require_accelerator("tcg")
> +
> +        image_path_zst = self.ASSET_VIRT_GPU_ROOTFS.fetch()
> +        kernel_path = self.ASSET_VIRT_GPU_KERNEL.fetch()
> +
> +        image_path = self.workdir + "/rootfs.ext4"

Pending PULL has removed all direct access to self.workdir,
use  'self.scratch_file("rootfs.ext4") instead, except that
shouldn't be needed either....

> +
> +        run_cmd(['zstd', "-f", "-d", image_path_zst,
> +                 "-o", image_path])

...the pending PULL has added common helpers for uncompression,
but only covers gz + lzma so far. Can you create a 'zstd_uncompress'
in uncompress.py and wire it up in the same way. That would let
this code turn into

   image_path = self.uncompress(self.ASSERT_VIRT_GPU_ROOTFS)


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
