Received: by 2002:a17:906:cc9:b0:a28:7ef3:d049 with SMTP id l9csp982152ejh;
        Thu, 4 Jan 2024 01:31:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEOvon+HH9jb9+5doXhmfhf/pVPIsK92L+x+DjNzmM8Iivaxt916EXSl8lMGcEg5c195ZVh
X-Received: by 2002:a05:6214:2a4f:b0:67e:aa84:b093 with SMTP id jf15-20020a0562142a4f00b0067eaa84b093mr367213qvb.22.1704360712757;
        Thu, 04 Jan 2024 01:31:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704360712; cv=none;
        d=google.com; s=arc-20160816;
        b=VE8fPHfVUIisn+n+efQ07+eYyN1c3G7AGKNwBmruiyfNYqvncRxYB6GDHJw+81An4w
         Uq8XQzbCZUXONdKIwY2Yl5/s+Sdx159uRm2UM3OxyBY6nD94x8JGFzeU7CqvcbY8YBKD
         I7vgkKvWU9rhMtDZgx/YMNTXbe7UFSiC4HD6juYqGupe2esVKMnUiYJWD48kSAQ4iEgm
         hJjQo57cbjRLI0eSVA2uvOPaHq6A2qSES0+TMd9sBihT2JXyxcRGrQwDwK5KAUHW3ecB
         hjIRF8AxJ3R4L4CCtxNQFmITjBG2ChyltEWgII7CMFqccCTgZWBzMGD4YrkRb7OIzaMu
         zryg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=zIXKKMqhILxRblSeoztvZ34izwtCDG3gNl+mN+M3Jfw=;
        fh=ZZLu8VKb6v/MUxFepkNuh2ehDcWjsx9dHDbiuIEtfS4=;
        b=s5F65uDqroCfaiGssr8SBNYFkYdhLyTQJoHOovJCQOFdzvzM+JV0MRZYkTuCpVoHiH
         4TKihUfom2mFoex0jyWqvXeahZAknn7LNP2UnK35/lX6O20kGnPxXRrFNi+sWGNCGyw8
         Ewhv5X2BpgB8e2v5X/24yQMyeFsuiEkG65bshTnTubd4nwQH2y80sI4SKi5YRHrzo1WT
         k5BdZ0sFpweJq01EM17HdT0grvPvr75GN8GOQSFUyNsEq2QxrsR+Q2AWrVCrKuhjCIc+
         VaArXFU2/sSl4RoFIWSqfg/X2otTRwgzBMz6GPc9xvIFAIi0yj4/El4J5jbnO65EBUIh
         qDNA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PukynblA;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id p3-20020a0cf543000000b0067f8cab3dc5si28665622qvm.488.2024.01.04.01.31.52
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jan 2024 01:31:52 -0800 (PST)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PukynblA;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704360712;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zIXKKMqhILxRblSeoztvZ34izwtCDG3gNl+mN+M3Jfw=;
	b=PukynblAw8rcHitjKMBiqqJPLa9+Sn+9WrZUUw/YzpRyP84rHhG1vX8sPKpOMkAcH7MgT7
	YvQv+LxAvrvri2lSIMAf6zChXBvUq4bjUm4xTLK0cXHux39+TE9jelwCpZNFLE40OuI1NG
	jjsw9Dgmh9zcbLDvDs6fAMzjwUzS5kg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-390-VfOJiDoeMgCX6uAq70exgQ-1; Thu, 04 Jan 2024 04:31:48 -0500
X-MC-Unique: VfOJiDoeMgCX6uAq70exgQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 288B3863B83;
	Thu,  4 Jan 2024 09:31:47 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.113])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 821551121313;
	Thu,  4 Jan 2024 09:31:37 +0000 (UTC)
Date: Thu, 4 Jan 2024 09:31:35 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-devel@nongnu.org, qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>,
	Song Gao <gaosong@loongson.cn>,
	=?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Yanan Wang <wangyanan55@huawei.com>,
	Bin Meng <bin.meng@windriver.com>,
	Laurent Vivier <lvivier@redhat.com>,
	Michael Rolnik <mrolnik@gmail.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	David Woodhouse <dwmw2@infradead.org>,
	Laurent Vivier <laurent@vivier.eu>,
	Paolo Bonzini <pbonzini@redhat.com>, Brian Cain <bcain@quicinc.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Beraldo Leal <bleal@redhat.com>, Paul Durrant <paul@xen.org>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Thomas Huth <thuth@redhat.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Cleber Rosa <crosa@redhat.com>, kvm@vger.kernel.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	qemu-arm@nongnu.org, Weiwei Li <liwei1518@gmail.com>,
	John Snow <jsnow@redhat.com>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	=?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	qemu-riscv@nongnu.org, Alistair Francis <alistair.francis@wdc.com>
Subject: Re: [PATCH v2 10/43] qtest: bump pxe-test timeout to 10 minutes
Message-ID: <ZZZ6912gSKasWA3G@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20240103173349.398526-1-alex.bennee@linaro.org>
 <20240103173349.398526-11-alex.bennee@linaro.org>
 <6826da51-3b97-4ecf-8517-9e5b5243e91f@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6826da51-3b97-4ecf-8517-9e5b5243e91f@linaro.org>
User-Agent: Mutt/2.2.10 (2023-03-25)
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3
X-TUID: cHPPzySSEyE0

On Wed, Jan 03, 2024 at 06:43:52PM +0100, Philippe Mathieu-Daudé wrote:
> Hi Daniel,
> 
> On 3/1/24 18:33, Alex Bennée wrote:
> > From: Daniel P. Berrangé <berrange@redhat.com>
> > 
> > The pxe-test uses the boot_sector_test() function, and that already
> > uses a timeout of 600 seconds. So adjust the timeout on the meson
> > side accordingly.
> 
> IIRC few years ago you said tests running on CI ('Tier-1') should
> respect a time limit. IMO 10min seems too much for CI, should this
> test be skipped there?

This isn't going to take 10 minutes in reality. We're setting timeouts
such that we avoid false-failures in the extreme worst case scenarios.

> 
> > Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> > [thuth: Bump timeout to 600s and adjust commit description]
> > Signed-off-by: Thomas Huth <thuth@redhat.com>
> > Message-Id: <20231215070357.10888-7-thuth@redhat.com>
> > Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> > ---
> >   tests/qtest/meson.build | 1 +
> >   1 file changed, 1 insertion(+)
> > 
> > diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> > index 7a4160df046..ec93d5a384f 100644
> > --- a/tests/qtest/meson.build
> > +++ b/tests/qtest/meson.build
> > @@ -4,6 +4,7 @@ slow_qtests = {
> >     'npcm7xx_pwm-test': 300,
> >     'qom-test' : 900,
> >     'test-hmp' : 240,
> > +  'pxe-test': 600,
> >   }
> >   qtests_generic = [
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
