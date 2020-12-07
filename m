Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp2829077lfb;
        Sun, 6 Dec 2020 21:57:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw/dgM1Il3gvgs20x/lcTsj7O/uIBIGWXw7DXn12rvtJlF5hwgR/Z1jybunbbVHrcZg8YLc
X-Received: by 2002:a25:cb03:: with SMTP id b3mr21269033ybg.207.1607320672030;
        Sun, 06 Dec 2020 21:57:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607320672; cv=none;
        d=google.com; s=arc-20160816;
        b=R0QkSzCamFw6qejwPnUJ6QjObsHoOLqNL3IN1pROQGJi0UfMM0czhJKCkc1I/ET2wg
         a8c0pBiTxZtT8rWFJQDPZQkyn81JWDLK2w2arf7KUrbsjxOooMsZFCJJWMDnF8Nqsqea
         oQUiq259WsN1gqXkHuTFNI7sfJxZOn6tOi12xp/oO5lpb1c34Zjm2o4zYGWQvAGlusG3
         9NicC7kiNfLKiuZnrwzK4v9udB+SLFH+UdG+BpxeaBU6A7JIuDJZ5gi9il6dVzfyx9wd
         0FwYEbLg9vfdp+fyMGUyhQcfiR+gSPbJDSs3HuGSD890mD6hUJU9QrB0d0QMd6P4fczq
         U09Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=R0BBgmAIun19ecWxrxGSMAu6pxT4TBupQwMGoVA8c7E=;
        b=alCpDEIk99W8u8GIpFsie/TBydQo6qb0shDLhGLNmwI7foK4pY5AqXdvBMOejY4xA7
         rjr6BLT7Bj2evtwPc+28IK6sBwQxS+F4znEX2M8csax9A74ua10obgA95/laHTrWdohu
         xkH5JLhhaqGl00OnBaeycbucauM/sefWc8T5GEUGmlqkDxy3PEQGDL3neLrSxV5b8l+O
         cjJlrBPbGvUDxPhEvBFRM6aep1uaCj/i97cbKKBYT1KLwR3sWksXM8d4r26JbUkA4niL
         qccZXJrXyT6egmjUrzdsx9ux/gUPfBK/0DAWXfE5mDBm/2Ju8FS9h9YOha8GQ8RDrM94
         3TnA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Hgc5eHXF;
       spf=pass (google.com: domain of thuth@redhat.com designates 63.128.21.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [63.128.21.124])
        by mx.google.com with ESMTPS id s82si4459334ybc.183.2020.12.06.21.57.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 06 Dec 2020 21:57:52 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 63.128.21.124 as permitted sender) client-ip=63.128.21.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Hgc5eHXF;
       spf=pass (google.com: domain of thuth@redhat.com designates 63.128.21.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607320671;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R0BBgmAIun19ecWxrxGSMAu6pxT4TBupQwMGoVA8c7E=;
	b=Hgc5eHXFDGIotYxtivf3YmhIc4vBVKwPq99psVPqGssJUAPwCUPjUfgp06w/Rj1fUKB+Cd
	DCg8GOUHNHAvmsW6nBbv1PG3rxrnvG6LX9g2HWHj70MzRpaiY/xrK5cPaAeHbVCGC3QCJ5
	3x0mTl9AfNMhSgXaR2l235NkkN08oFY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-18-DGCDi2V8PqC2tkcP-WhOyg-1; Mon, 07 Dec 2020 00:57:48 -0500
X-MC-Unique: DGCDi2V8PqC2tkcP-WhOyg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4B19E180E460;
	Mon,  7 Dec 2020 05:57:45 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-85.ams2.redhat.com [10.36.112.85])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 31A93100239A;
	Mon,  7 Dec 2020 05:57:32 +0000 (UTC)
Subject: Re: [PATCH 6/8] gitlab-ci: Add KVM PPC cross-build jobs
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 xen-devel@lists.xenproject.org, kvm@vger.kernel.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Willian Rampazzo
 <wrampazz@redhat.com>, Paul Durrant <paul@xen.org>,
 Huacai Chen <chenhc@lemote.com>, Anthony Perard <anthony.perard@citrix.com>,
 Marcelo Tosatti <mtosatti@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Claudio Fontana <cfontana@suse.de>, Halil Pasic <pasic@linux.ibm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, David Gibson
 <david@gibson.dropbear.id.au>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-s390x@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>,
 qemu-arm@nongnu.org
References: <20201206185508.3545711-1-philmd@redhat.com>
 <20201206185508.3545711-7-philmd@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <ffafcb2d-c32e-95ef-82c7-20bf5c366df7@redhat.com>
Date: Mon, 7 Dec 2020 06:57:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201206185508.3545711-7-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-TUID: mpWS47ju2BNR

On 06/12/2020 19.55, Philippe Mathieu-Daudé wrote:
> Cross-build PPC target with KVM and TCG accelerators enabled.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
> later this job build KVM-only.
> ---
>  .gitlab-ci.d/crossbuilds-kvm-ppc.yml | 5 +++++
>  .gitlab-ci.yml                       | 1 +
>  MAINTAINERS                          | 1 +
>  3 files changed, 7 insertions(+)
>  create mode 100644 .gitlab-ci.d/crossbuilds-kvm-ppc.yml
> 
> diff --git a/.gitlab-ci.d/crossbuilds-kvm-ppc.yml b/.gitlab-ci.d/crossbuilds-kvm-ppc.yml
> new file mode 100644
> index 00000000000..9df8bcf5a73
> --- /dev/null
> +++ b/.gitlab-ci.d/crossbuilds-kvm-ppc.yml
> @@ -0,0 +1,5 @@
> +cross-ppc64el-kvm:
> +  extends: .cross_accel_build_job
> +  variables:
> +    IMAGE: debian-ppc64el-cross
> +    TARGETS: ppc64-softmmu

Compilation of the ppc KVM code should already be covered by the
cross-ppc64el-system job, see e.g.:

https://gitlab.com/qemu-project/qemu/-/jobs/883985074#L297

Thus there is no need to add a new job for this here. It might be a good
idea to remove ppc64-softmmu from the exclude list in crossbuilds.yml,
though, so that we also check the 64-bit builds and not only the 32-bit ones.

 Thomas
