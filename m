Received: by 2002:a17:906:3657:b0:a0d:e0d9:b5bf with SMTP id r23csp499027ejb;
        Thu, 30 Nov 2023 12:08:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGrrOT55zywCLfAJ8+FlwJAp9NSuNShTaXjWJYY1qff6BO6sUk14Lk3+KOXAh9J4RJK7D7O
X-Received: by 2002:ac8:7c46:0:b0:423:789c:659b with SMTP id o6-20020ac87c46000000b00423789c659bmr23965586qtv.60.1701374937165;
        Thu, 30 Nov 2023 12:08:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701374937; cv=none;
        d=google.com; s=arc-20160816;
        b=Fx9kA4p0I7n3No+hA6oA1fDsdaNz8hTomUZ35q9BDPN65sYRig87qorHmLMlHCm8fM
         C/iK0pg6qXC7YrmO5DNWotc9U5CEffiYjuBdilSWMyq1GGszlJ4go+SS/f8YL8DxI1Jw
         1N/eJ4zOCltNzKrnunPu3iDHdOIwtx2XLRLaLiRjMR+6SisKgusPT1etv1XLLT2Qe4js
         gTeQqO5cx5yU2L/Uopc0+jsifXsd9vRRgEFkP1KNPtvwZBSrFAZ0ebOq7klak5BE1XS4
         cs2KVp6Z2KQpgnW50lVyc+6/ptfFgC9XwSWQta6pE2GriM8wzNPwdxI0NUd8sPmGQRPz
         3Zww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-disposition:in-reply-to:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=vQ5m3o7+UqdtWYSDU6QubOO0VIH9lcTK3EaDyGHvbxw=;
        fh=BROLpBsjE8l0PO+4K7bFkU/eo6Z8LYjlwxVafCKoxFE=;
        b=JPCqtUHoxtYBv6SP5uyK/sZWNhPMucOVjGJtQ1YW4JTta5fr2efpt3vI9cb+DRyfdr
         qmYIRAnL3zywpXq8SZpidg133TZ9QN9a/0pSbbtgBMJhq9uvtxx6R8LONxMy2uk3VNT8
         NJxg9PST4ovrbGkWlhGnaRH0qI2koJkjgscZKoI2a5FZTvR5OoeoJnLAsE+izpULll+X
         ghD8wbTLJvuiu+9mtr0Md/smaKGavb07gOVY2a9adwkYljwkppOWJGR4pubFmJfZ4/Up
         LKcfW/pcg9JtH3Q679FmWQk7k8QZb3K4lcQr4Bj3PVUAp6W9FqI2Dj2V6sTY0sUuKi19
         UOXw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Mtct1fO/";
       spf=pass (google.com: domain of peterx@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=peterx@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <peterx@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id bc9-20020a05622a1cc900b0042399654f71si1925107qtb.218.2023.11.30.12.08.56
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 12:08:57 -0800 (PST)
Received-SPF: pass (google.com: domain of peterx@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Mtct1fO/";
       spf=pass (google.com: domain of peterx@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=peterx@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701374936;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vQ5m3o7+UqdtWYSDU6QubOO0VIH9lcTK3EaDyGHvbxw=;
	b=Mtct1fO/ctWsHPFB+5wB3YkKWIi/8kY27OjH8kRwmuhYOoj/9W0NoGoJs1A18gtogaCYUD
	vRffEee1eUh+KlaA+W6L6CSktX+K5UIEAVyUr+LBUSgmdRbz278lk3afFfDrj6OZVBpOpg
	eBP1oeEHCSNxEordsBYKyhvdgJ8WBVU=
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com
 [209.85.161.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-618-e1T6Z2CQOkGH9WlhHP8Y-Q-1; Thu, 30 Nov 2023 15:08:55 -0500
X-MC-Unique: e1T6Z2CQOkGH9WlhHP8Y-Q-1
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-58dba38a819so212699eaf.0
        for <alex.bennee@linaro.org>; Thu, 30 Nov 2023 12:08:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701374935; x=1701979735;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vQ5m3o7+UqdtWYSDU6QubOO0VIH9lcTK3EaDyGHvbxw=;
        b=MngRohWZKw0flbmcyK5E4/ijsqsGKd3HUmJeqOPljMsXqyqBcOdd3/DAhsNWlXOEUA
         jTx9wKpQhdrt5EuHN+vXbsZbq08rQ+AnyzKfTkHffGBGPgWOJy3og+JStnHt08ZxGb6B
         SZtHnUi/cov9k67Lbv2qRRUfIaLTm+SyGNlQbbCLiu85PS3DnfUZsS6fEkFFNQb1QQ9f
         +w8pdkgWLFHU9BEoU/pUOC4iE5r2rfNIuwReZ1QBXFuWhKX5HlCdZH+NBUhMKyOI5IBT
         maygoaXaxCR9BpVkcyTeg65RiV6HTt0zUpVH6K1snPAYW7Li2qAyvkdW3QolSID7RBz8
         5KUQ==
X-Gm-Message-State: AOJu0YzvEZMFRLU7jE7tUyDilQYDAWE/68gwujSFDya+qvvOleeCRehT
	8n5vvLV6JQGea16R54PkB6laFCBNYOqSu9WNi+j3Qlpb304EcsqBARCZ9FLjUKXWT6pkALv3u9H
	HLx5YK6qR1/gIcgVe
X-Received: by 2002:a05:6820:a8f:b0:58d:e3d3:ec72 with SMTP id de15-20020a0568200a8f00b0058de3d3ec72mr3219661oob.0.1701374934933;
        Thu, 30 Nov 2023 12:08:54 -0800 (PST)
X-Received: by 2002:a05:6820:a8f:b0:58d:e3d3:ec72 with SMTP id de15-20020a0568200a8f00b0058de3d3ec72mr3219606oob.0.1701374934634;
        Thu, 30 Nov 2023 12:08:54 -0800 (PST)
Return-Path: <peterx@redhat.com>
Received: from x1n (cpe688f2e2cb7c3-cm688f2e2cb7c0.cpe.net.cable.rogers.com. [99.254.121.117])
        by smtp.gmail.com with ESMTPSA id qr13-20020a05620a390d00b0077d5e1e4edesm790071qkn.57.2023.11.30.12.08.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 12:08:54 -0800 (PST)
Date: Thu, 30 Nov 2023 15:08:49 -0500
From: Peter Xu <peterx@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, Jean-Christophe Dubois <jcd@tribudubois.net>,
	Fabiano Rosas <farosas@suse.de>, qemu-s390x@nongnu.org,
	Song Gao <gaosong@loongson.cn>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Thomas Huth <thuth@redhat.com>, Hyman Huang <yong.huang@smartx.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Kevin Wolf <kwolf@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Paul Durrant <paul@xen.org>,
	Jagannathan Raman <jag.raman@oracle.com>,
	Juan Quintela <quintela@redhat.com>,
	Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
	qemu-arm@nongnu.org, Jason Wang <jasowang@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
	=?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
	BALATON Zoltan <balaton@eik.bme.hu>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Elena Ufimtseva <elena.ufimtseva@oracle.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Hailiang Zhang <zhanghailiang@xfusion.com>,
	Roman Bolshakov <rbolshakov@ddn.com>,
	Huacai Chen <chenhuacai@kernel.org>, Fam Zheng <fam@euphon.net>,
	Eric Blake <eblake@redhat.com>, Jiri Slaby <jslaby@suse.cz>,
	Alexander Graf <agraf@csgraf.de>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Weiwei Li <liwei1518@gmail.com>, Eric Farman <farman@linux.ibm.com>,
	Stafford Horne <shorne@gmail.com>,
	David Hildenbrand <david@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Reinoud Zandijk <reinoud@netbsd.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Cameron Esfahani <dirty@apple.com>, xen-devel@lists.xenproject.org,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, qemu-riscv@nongnu.org,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	John Snow <jsnow@redhat.com>,
	Sunil Muthuswamy <sunilmut@microsoft.com>,
	Michael Roth <michael.roth@amd.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Bin Meng <bin.meng@windriver.com>,
	Stefano Stabellini <sstabellini@kernel.org>, kvm@vger.kernel.org,
	qemu-block@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
	=?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
	qemu-ppc@nongnu.org,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	Leonardo Bras <leobras@redhat.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH 1/6] system/cpus: rename qemu_mutex_lock_iothread() to
 qemu_bql_lock()
Message-ID: <ZWjr0TKxihlpd1jm@x1n>
References: <20231129212625.1051502-1-stefanha@redhat.com>
 <20231129212625.1051502-2-stefanha@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20231129212625.1051502-2-stefanha@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-TUID: r7oTIGXznmbC

On Wed, Nov 29, 2023 at 04:26:20PM -0500, Stefan Hajnoczi wrote:
> The Big QEMU Lock (BQL) has many names and they are confusing. The
> actual QemuMutex variable is called qemu_global_mutex but it's commonly
> referred to as the BQL in discussions and some code comments. The
> locking APIs, however, are called qemu_mutex_lock_iothread() and
> qemu_mutex_unlock_iothread().
> 
> The "iothread" name is historic and comes from when the main thread was
> split into into KVM vcpu threads and the "iothread" (now called the main
> loop thread). I have contributed to the confusion myself by introducing
> a separate --object iothread, a separate concept unrelated to the BQL.
> 
> The "iothread" name is no longer appropriate for the BQL. Rename the
> locking APIs to:
> - void qemu_bql_lock(void)
> - void qemu_bql_unlock(void)
> - bool qemu_bql_locked(void)
> 
> There are more APIs with "iothread" in their names. Subsequent patches
> will rename them. There are also comments and documentation that will be
> updated in later patches.
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>

Acked-by: Peter Xu <peterx@redhat.com>

Two nickpicks:

  - BQL contains "QEMU" as the 2nd character, so maybe easier to further
    rename qemu_bql into bql_?

  - Could we keep the full spell of BQL at some places, so people can still
    reference it if not familiar?  IIUC most of the BQL helpers will root
    back to the major three functions (_lock, _unlock, _locked), perhaps
    add a comment of "BQL stands for..." over these three functions as
    comment?

Please take or ignore these nitpicks; my ACK will stand irrelevant.

Thanks,

-- 
Peter Xu
