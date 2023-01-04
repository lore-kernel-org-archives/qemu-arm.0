Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp8238880ejb;
        Wed, 4 Jan 2023 11:47:02 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsQ7jwC8MAS2JJxVwLzSbx7rBYMbLBx77mJjXW1/8MHR9I7o6WVjcGdmBuFnj7qM41QCp2B
X-Received: by 2002:ac8:7389:0:b0:3a5:4a20:3096 with SMTP id t9-20020ac87389000000b003a54a203096mr67201579qtp.6.1672861622789;
        Wed, 04 Jan 2023 11:47:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672861622; cv=none;
        d=google.com; s=arc-20160816;
        b=Ulpt4Uwp/iERpQytkIQb0bqxX6NJ4WtEL5RRJzSwPU9z3OGPTUly6W4uX2630qz0qd
         8Fz/3w7S/P0njm/GAxRJSbxwHwWWuJy/MU+fyz/WI4zWZKj66dviguQD1We+XasHDL2Z
         efk6nrH6JwJ3wm7P0Q2ngCR4Iu5LI43AdzJa5kHL1qmAZAREjI2qdn6BKjKT+O8g8u82
         qww0SvnMFB5gEQCLPI4l/UZbIBGUy2eef8GtQsMGEw2hjnKwtMInJj/18dXRtA5QSkWn
         P7urdV5idl6fFvk/L1+Gran7nP9QRl1lr9n0H9IMwrvLHRijGQMpF6fUmdC/F4h7X00x
         wMYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-disposition:user-agent
         :in-reply-to:mime-version:references:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=6QXOEovurLwLNIz+FnppUbIJfgyjk9M5XlA8eSDuCrU=;
        b=miF0JGCF/avHxNpthZZLIQgaLYytwSrwesxz2VLSO2BocYOEhFuVmPl2m3BqadqEJL
         nJXEKIW5Hn9BzA/Cv6Z0ZWPrzMNakr5scbDxWHFPqmoGvLj52bD+g9u/eRiBYGDwT/q4
         vzZ6zgtyE2+mHKEQmh5kNHql3yhFX2jowUM5gZfLK6f+/TbPjR4RbhWnnxRZB2ngCQfl
         u7rNnkDnKr5LSO1rU5K/cuVHHiAB8FE8Dpv2ZxtfgrDrTltcOed7oi8zgJmThN2sc4Hl
         mA7R+m3RKS3VFZzAlN0QSn3dT4VcHti5l8K+5kPXwP+zB1Nr7otGknaX9VH/Ey4PRhVw
         KwJA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bOROpirO;
       spf=pass (google.com: domain of dgilbert@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=dgilbert@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <dgilbert@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id a7-20020ac85b87000000b003abc7bf4105si1917175qta.33.2023.01.04.11.47.02
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jan 2023 11:47:02 -0800 (PST)
Received-SPF: pass (google.com: domain of dgilbert@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bOROpirO;
       spf=pass (google.com: domain of dgilbert@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=dgilbert@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1672861622;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6QXOEovurLwLNIz+FnppUbIJfgyjk9M5XlA8eSDuCrU=;
	b=bOROpirOTfEFQ8A/CrJV8F3pKLGf5WqadCoNUxFnvqrUYL98MmHJ3MG7pXEKXLQrrLa1QZ
	sC1pFDF4/6YN2NARc3v5UV8RDyMTZpYgrL2NUdu0RmjUqHgr7e3VD0LuQDcH35k9CCMvcY
	ouGY7RmP5/1Kxir3k1JkMhE2KkJ+8ug=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-556-C7pQahYeMw-TusOidZ9o3g-1; Wed, 04 Jan 2023 14:47:01 -0500
X-MC-Unique: C7pQahYeMw-TusOidZ9o3g-1
Received: by mail-wm1-f69.google.com with SMTP id m7-20020a05600c4f4700b003d971a5e770so16519648wmq.3
        for <alex.bennee@linaro.org>; Wed, 04 Jan 2023 11:47:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6QXOEovurLwLNIz+FnppUbIJfgyjk9M5XlA8eSDuCrU=;
        b=Xs5jsJrJ8Oyeqiqc5k9GBo6IXsr06akfQT3ZtKLkGlGyMNyBXxFRowdW22lxfPmERR
         IqotCqVUUyvhXOrpIf86az3j+a0iQ+2JPSvaGWJWA377t6B6DYzrn7niCjp/V8htfd/u
         Yue5ZBhwfinH+xrXN/+OPnpHiJh2mfIbEgbzJcBmMq4L/2dQnAzD38wCVIyhWTyb3lxl
         1tqeoTCtO9kDbFpY/zuBla5OduSJfM1QeYUN4mEoue6XrnJu9RhIZY6EnwvCR5GIPdqb
         RhMyIwfYbS3OsHcsdaz6vN2ZOrSi6hNKa811MGWLcR8mwJNPH6NM4YEvmdxa2Rt3Du9g
         +VRQ==
X-Gm-Message-State: AFqh2kpQ00+xzKWvnQ6JJ983JsbhUFSQFnNotjYgUH0vk6b2Uhln/XwG
	zQokRA+9FtM4pURi61fbof1/47ioj6QSdnAtHRsXc+91N+REI7mDp5BTLfJ33yZZCoc/Y01FK0w
	ZOLkHyTU6odbhSEfU
X-Received: by 2002:a05:600c:4191:b0:3d1:fcca:ce24 with SMTP id p17-20020a05600c419100b003d1fccace24mr33592853wmh.32.1672861620110;
        Wed, 04 Jan 2023 11:47:00 -0800 (PST)
X-Received: by 2002:a05:600c:4191:b0:3d1:fcca:ce24 with SMTP id p17-20020a05600c419100b003d1fccace24mr33592836wmh.32.1672861619972;
        Wed, 04 Jan 2023 11:46:59 -0800 (PST)
Return-Path: <dgilbert@redhat.com>
Received: from work-vm (ward-16-b2-v4wan-166627-cust863.vm18.cable.virginm.net. [81.97.203.96])
        by smtp.gmail.com with ESMTPSA id p19-20020a1c5453000000b003d2157627a8sm50343697wmi.47.2023.01.04.11.46.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 11:46:59 -0800 (PST)
Date: Wed, 4 Jan 2023 19:46:56 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
	xen-devel@lists.xenproject.org, Laurent Vivier <lvivier@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	virtio-fs@redhat.com, Michael Roth <michael.roth@amd.com>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org, Paul Durrant <paul@xen.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	=?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
	John Snow <jsnow@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gerd Hoffmann <kraxel@redhat.com>, Greg Kurz <groug@kaod.org>,
	Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 3/6] tools/virtiofsd: add G_GNUC_PRINTF for logging
 functions
Message-ID: <Y7XXsHEqgTG9Ani6@work-vm>
References: <20221219130205.687815-1-berrange@redhat.com>
 <20221219130205.687815-4-berrange@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20221219130205.687815-4-berrange@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-TUID: 2o9eX7b7bd2D

* Daniel P. Berrangé (berrange@redhat.com) wrote:
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>

Yes, although I'm a little surprised this hasn't thrown up any warnings.


Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  tools/virtiofsd/fuse_log.c       | 1 +
>  tools/virtiofsd/fuse_log.h       | 6 ++++--
>  tools/virtiofsd/passthrough_ll.c | 1 +
>  3 files changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/virtiofsd/fuse_log.c b/tools/virtiofsd/fuse_log.c
> index 745d88cd2a..2de3f48ee7 100644
> --- a/tools/virtiofsd/fuse_log.c
> +++ b/tools/virtiofsd/fuse_log.c
> @@ -12,6 +12,7 @@
>  #include "fuse_log.h"
>  
>  
> +G_GNUC_PRINTF(2, 0)
>  static void default_log_func(__attribute__((unused)) enum fuse_log_level level,
>                               const char *fmt, va_list ap)
>  {
> diff --git a/tools/virtiofsd/fuse_log.h b/tools/virtiofsd/fuse_log.h
> index 8d7091bd4d..e5c2967ab9 100644
> --- a/tools/virtiofsd/fuse_log.h
> +++ b/tools/virtiofsd/fuse_log.h
> @@ -45,7 +45,8 @@ enum fuse_log_level {
>   * @param ap format string arguments
>   */
>  typedef void (*fuse_log_func_t)(enum fuse_log_level level, const char *fmt,
> -                                va_list ap);
> +                                va_list ap)
> +    G_GNUC_PRINTF(2, 0);
>  
>  /**
>   * Install a custom log handler function.
> @@ -68,6 +69,7 @@ void fuse_set_log_func(fuse_log_func_t func);
>   * @param level severity level (FUSE_LOG_ERR, FUSE_LOG_DEBUG, etc)
>   * @param fmt sprintf-style format string including newline
>   */
> -void fuse_log(enum fuse_log_level level, const char *fmt, ...);
> +void fuse_log(enum fuse_log_level level, const char *fmt, ...)
> +    G_GNUC_PRINTF(2, 3);
>  
>  #endif /* FUSE_LOG_H_ */
> diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
> index 20f0f41f99..40ea2ed27f 100644
> --- a/tools/virtiofsd/passthrough_ll.c
> +++ b/tools/virtiofsd/passthrough_ll.c
> @@ -4182,6 +4182,7 @@ static void setup_nofile_rlimit(unsigned long rlimit_nofile)
>      }
>  }
>  
> +G_GNUC_PRINTF(2, 0)
>  static void log_func(enum fuse_log_level level, const char *fmt, va_list ap)
>  {
>      g_autofree char *localfmt = NULL;
> -- 
> 2.38.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
