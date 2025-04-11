Received: by 2002:a17:504:14cd:b0:1be9:327d:8ee3 with SMTP id g13csp344525njc;
        Fri, 11 Apr 2025 03:35:05 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWASW3ofmQ5/scJlWTcjujgqcbfaEL9UtM6IrhOMPGPsLxR75oE0UKUAJ2wBILA5wuw+9QKZjUsg0l0KA==@linaro.org
X-Google-Smtp-Source: AGHT+IFaKCVBj5sSXl52x5eMO3RkY5t0SGuaDwVlNZBaNXQWJT/1jV7qBCHccm8kNnRatrOSBz9w
X-Received: by 2002:a05:622a:40f:b0:477:e07:4c5d with SMTP id d75a77b69052e-4797753aef7mr28818821cf.19.1744367705020;
        Fri, 11 Apr 2025 03:35:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744367705; cv=none;
        d=google.com; s=arc-20240605;
        b=NKvXg8omO/eYCFZeYfi2ayvtwqZo/WQiybYtStk6cIgPY1P6Xl+dzrkIFMVqbqX3yk
         /lxFvr8qM3P1Az7Bq7RCUiePrKNqijc1hIGkaRrLKliqUlzPQ8CyveKSl5UODnv+EwnN
         xXQtkm9Ig+holYCApnfyYdqqNOGEvwMbuVhQ9Hn48utsw+EXWCWV/0VgILKa/f+IoVuP
         Fc3fnqSbEeR/exTyna3BDRSmvTz24nUiuMz0+LKIpQGnIisbckwu7RVbqvGoKcP2YNdm
         iHDhgdiTAOdquje3MRETDbY4qgz9y0fC8Nx7mu1RbNYV8kNIiJc2zmATegA05JzNMto8
         CTvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:dkim-signature;
        bh=SZUpbrIgh4sUhOoLF25Bvrmv0xMYjp2UOgSfJ+KQ4Qw=;
        fh=nPtBIeYIMxHwRwJ2O8Xp2PYpM8frp9wKEtpX56yDMCc=;
        b=gRukOyFxOSiPgHqmmZy0TGZOKLZ/JNa/KCrHRSJCUr3NzSTP4FP63YCbZ9m1WLrt98
         A3I5PIMH4kMLUHdtuC/qE3FQcoqhZVh6xJ4qb1b4GIIt0bOflE15d7ZU+hwOELiCoIcE
         GWcsWtGjj+vuk8zz5BOxtygdisAuU6/Z1utopun+9dSxtLJMPAVw3ml8IfxLM4ndocKN
         hzHwsiCxolzfAq1ZSrJqflUmDS/8oSO91VS5+pWtSGsQPV/vAROQWZBOZH0OrmiFCqv2
         REhhJhHvK2A2OclPHC/ZDDddlpa/qpM4psRGRst9Ktsc41u9yeO9Q6IMC8xe+8jUQsBP
         674w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GQvMFI0z;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d75a77b69052e-4796edbdb67si27886701cf.207.2025.04.11.03.35.04
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 03:35:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GQvMFI0z;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744367704;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:  references:references;
	bh=SZUpbrIgh4sUhOoLF25Bvrmv0xMYjp2UOgSfJ+KQ4Qw=;
	b=GQvMFI0zhnaFcetUPkLi0uk2TFhzwURKnkWcyRJFjqPlFO7dMJVbVfo8jN+DnGSoMu9+RF
	4yf3oymnVBD5k6ZUnFmlXSon9gGWHHcj53wYSuwcCEoj+bLItzCtvOsvG2LYiCen8BumvX
	Tjfn5QGlcjr03WNzJ/Yn0HMroaA8et0=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-427-LIDpHNx8MkClpTueLd78Xw-1; Fri,
 11 Apr 2025 06:34:59 -0400
X-MC-Unique: LIDpHNx8MkClpTueLd78Xw-1
X-Mimecast-MFC-AGG-ID: LIDpHNx8MkClpTueLd78Xw_1744367696
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 055CB180899B;
	Fri, 11 Apr 2025 10:34:56 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.63])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A3FBB1828AAA;
	Fri, 11 Apr 2025 10:34:48 +0000 (UTC)
Date: Fri, 11 Apr 2025 11:34:44 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: Kohei Tokunaga <ktokunaga.mail@gmail.com>, qemu-devel@nongnu.org,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
	Hanna Reitz <hreitz@redhat.com>,
	Christian Schoenebeck <qemu_oss@crudebyte.com>,
	Greg Kurz <groug@kaod.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Weiwei Li <liwei1518@gmail.com>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	=?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
	qemu-riscv@nongnu.org, qemu-arm@nongnu.org
Subject: Re: [PATCH 00/10] Enable QEMU to run on browsers
Message-ID: <Z_jwRMsLhtjzdcF5@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <cover.1744032780.git.ktokunaga.mail@gmail.com>
 <20250409192115.GA5528@fedora>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250409192115.GA5528@fedora>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-TUID: 5Kg2G8BLo59N

On Wed, Apr 09, 2025 at 03:21:15PM -0400, Stefan Hajnoczi wrote:
> On Mon, Apr 07, 2025 at 11:45:51PM +0900, Kohei Tokunaga wrote:
> > This patch series enables QEMU's system emulator to run in a browser using
> > Emscripten.
> > It includes implementations and workarounds to address browser environment
> > limitations, as shown in the following.
> 
> I think it would be great to merge this even if there are limitations
> once code review comments have been addressed. Developing WebAssembly
> support in-tree is likely to allow this effort to develop further than
> if done in personal repos (and with significant efforts required to
> rebase the code periodically).

It is certainly impressive & clever but first two critical questions..

Is there a committment to long term (many years) development & maintenance
of this, or is it just a short term experiment which will have attention
dwindle in a year's time ?

Is there a compelling real world use case for this that will justify
carrying it in QEMU, or is it a case of "it exists because it can" ?

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
