Received: by 2002:a17:505:18c3:b0:1be9:327d:8ee3 with SMTP id tt3csp2983820njb;
        Tue, 22 Oct 2024 04:05:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEn1S46qef70UqG1ya2zWfesvmMEdESkfiikKq/ucbr0tZ2q/Qy9XN+bwWWgmhYlpjPe84A
X-Received: by 2002:a05:6214:5b89:b0:6cb:e867:7e5d with SMTP id 6a1803df08f44-6cde150c0cdmr214895036d6.16.1729595110675;
        Tue, 22 Oct 2024 04:05:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729595110; cv=none;
        d=google.com; s=arc-20240605;
        b=OrWew954gT8bxHVvhBLMafcll8FiHthbGLK/iYzCw9UGKAwpg4Kd+g69pSAktmbQE1
         vMxuawnyhYQJIai+9Sw9WUxDbFEsGkq+lpvBskkGlBIGNWOmAZHaN5WdjJpvG/YFoFbQ
         6cPE8iQMZAEbFOo9XQlgg7gtGEciciXPZ/eVHwlwBuEQRdhFmJKqooSCw8D50vZ/9ngS
         VhMIQlQg+yVUvGJxPZwa4jwXnb4ODVfUe2AUIC4ZHiCsUzxZ5R31Ay6mfjs2tIIH8aXg
         jlJim1snHMFFTF8vF1ZbjZSmMBJOm+TVQiGF45s3j/JJBADtZA7vcdwaCoz+Xt0bUAQo
         qYrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=XgXOm/egpp5fSRjhAcPNhDSab7aMEhiEVg5mXUt45Zk=;
        fh=RqJ/zhKZJZmzYLK4JmpGOOp/IsgKceU7MKSVATmiMsI=;
        b=dRwgsS2aEm1Npdlpc3pxTJQwAoxHJ1Db5qgiXCOLRsujDiQVke5sTcJWdLKnRZ0mE8
         j6txci+flXz+2MwcuRk4rABdLMROvduUQoppa3fBzpmupTq3SDRNA9P50I9rVnREXT0V
         N/ACJ84zvH5qWkCotz86/L5dBiTjpnD8Z45+43UUZqIGTJvXMU1lVLGy+zGr5t9ioNfd
         j7WJG3+c2l4UJtpvGQjG+N/x62QE6+aeNiUxTKjxGc/6+5swlxXXq4TkYySNIf3kpvOS
         K0xiCQ73YPPF2un+qbG0+9WRezHlEpt+Gw9xPt5/UrlHeJIeCSSo0Tk91Q1kxCSCbZq0
         cWQQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bkbpjvXi;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6ce0098af7asi62304656d6.230.2024.10.22.04.05.10
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 04:05:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bkbpjvXi;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729595110;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XgXOm/egpp5fSRjhAcPNhDSab7aMEhiEVg5mXUt45Zk=;
	b=bkbpjvXigl8L8erKXOwaHESJ1VDQiDAkfsu5tWWYS1cvX++cQFx9fVIegF8wGB3zaaBSOS
	FkwoyZ8OwXxX2qnMnTqHCOtpsuCWHCHozzZcJDeEBQkQPHEX+RySB4WdzV8p64ay7sfJnc
	92pMpefOUZk8PZn3v9efPxrXymOfmgE=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-572-1-6-f52TMw-jaPvV2hz7hg-1; Tue,
 22 Oct 2024 07:05:06 -0400
X-MC-Unique: 1-6-f52TMw-jaPvV2hz7hg-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 223351955D92;
	Tue, 22 Oct 2024 11:05:03 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.59])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6D63419560AE;
	Tue, 22 Oct 2024 11:04:53 +0000 (UTC)
Date: Tue, 22 Oct 2024 12:04:50 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Beraldo Leal <bleal@redhat.com>,
	Laurent Vivier <laurent@vivier.eu>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Yanan Wang <wangyanan55@huawei.com>, Thomas Huth <thuth@redhat.com>,
	John Snow <jsnow@redhat.com>,
	=?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
	qemu-arm@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
	devel@lists.libvirt.org, Cleber Rosa <crosa@redhat.com>,
	kvm@vger.kernel.org,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Riku Voipio <riku.voipio@iki.fi>, Zhao Liu <zhao1.liu@intel.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2 10/20] gitlab: make check-[dco|patch] a little more
 verbose
Message-ID: <ZxeG0rMSORBKjAVX@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20241022105614.839199-1-alex.bennee@linaro.org>
 <20241022105614.839199-11-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241022105614.839199-11-alex.bennee@linaro.org>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
X-TUID: Tomwd4XTFd4a

On Tue, Oct 22, 2024 at 11:56:04AM +0100, Alex Bennée wrote:
> When git fails the rather terse backtrace only indicates it failed
> without some useful context. Add some to make the log a little more
> useful.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  .gitlab-ci.d/check-dco.py   | 9 +++++----
>  .gitlab-ci.d/check-patch.py | 9 +++++----
>  2 files changed, 10 insertions(+), 8 deletions(-)
> 
> diff --git a/.gitlab-ci.d/check-dco.py b/.gitlab-ci.d/check-dco.py
> index 632c8bcce8..d29c580d63 100755
> --- a/.gitlab-ci.d/check-dco.py
> +++ b/.gitlab-ci.d/check-dco.py
> @@ -19,10 +19,11 @@
>  reponame = os.path.basename(cwd)
>  repourl = "https://gitlab.com/%s/%s.git" % (namespace, reponame)
>  
> -subprocess.check_call(["git", "remote", "add", "check-dco", repourl])
> -subprocess.check_call(["git", "fetch", "check-dco", "master"],
> -                      stdout=subprocess.DEVNULL,
> -                      stderr=subprocess.DEVNULL)
> +print(f"adding upstream git repo @ {repourl}")
> +subprocess.run(["git", "remote", "add", "check-dco", repourl],
> +               check=True, capture_output=True)
> +subprocess.run(["git", "fetch", "check-dco", "master"],
> +               check=True, capture_output=True)

This is effectively no change - 'capture_output'  means stderr/out
are captured into a buffer which subprocess.run returns, but you're
not using the return value so the captured output is invisible.

If we want to see errors, then just remove the stderr/stdout
args from the check_call function, so they're no longer sent
to /dev/null


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
