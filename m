Received: by 2002:a17:906:3657:b0:a0d:e0d9:b5bf with SMTP id r23csp523524ejb;
        Thu, 30 Nov 2023 12:56:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH3ydCXzJ/2lcE+5xtfFQ6SItYtsNPGdzdVeCU3FXFd2MO43Nx5DsdFCWmCUDSh5RIFQHtU
X-Received: by 2002:a05:6102:2745:b0:464:4aeb:7782 with SMTP id p5-20020a056102274500b004644aeb7782mr6147137vsu.32.1701377802546;
        Thu, 30 Nov 2023 12:56:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701377802; cv=none;
        d=google.com; s=arc-20160816;
        b=aomtVKEfecOr4C0e1cKi4WbWB62lu2cLEMVeuEB/fCM3rS+n5J/aZg0/2ghDWL2Pwn
         dqBY6tJtDtXEZ3zOQhDWAib/bbsIuJkcld+zyYBM+EHjGa+SbiEHHyRUUz2p8egeTTD+
         1WRvgzFI1kNn6WvBkCkDoxVhUbO1taqYc1ex399XUHiLRB7Z7Q6BGlv/9dKYsovmZGG9
         IDKsVitdQScyBuVuaT5lYaGyAUR/EDnnJ9pq4TuzCfAvNmIXZq1vEkYmRfw8Fs0CsZwp
         GaM7NpH9eJeXoZadOQX457XsC3ed11nLI8eIyCk4+C6hUlY4o5Jnk5GVIyGutrS9DrkV
         NLVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-disposition:in-reply-to:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=CvBa0sQTQ4iydX+WLgMreuODjjAkBlkycz9lfLxb2yo=;
        fh=BROLpBsjE8l0PO+4K7bFkU/eo6Z8LYjlwxVafCKoxFE=;
        b=BJfNEP7ByrEZlzOBdubSD9AVF9++VNYt15LIIpuimH65unYHL3Is5aOewoU/14pUZS
         Tzci4QpynEXU2UGmXBbdLCAQlnSFwyyKZbXNwg+OITRlc0ns1pwZStKJlOm7SpjYxZ40
         ts7ieGztfZhXqdSoxb4AVKwdzHpOKHFP7Y1UhwIAAgnDF8DFzJ2wkvYWEfiRgOzr8NVe
         8OHnwg47t8SVPL11mmbCa3MFmWNFLZvOcErRbeSjG4lr2608TKF6aTSRNd8bFkQMU+lm
         F+G3Nj00jYBnInoOp34HrQBX4FfhxaC2v3AWyCj9qZSg7hbBKhgrd3fEHQsHMGNQ5VDE
         i8uQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=go4JouXg;
       spf=pass (google.com: domain of peterx@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=peterx@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <peterx@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d13-20020a0cf6cd000000b00679e94355f5si1692076qvo.278.2023.11.30.12.56.42
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 12:56:42 -0800 (PST)
Received-SPF: pass (google.com: domain of peterx@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=go4JouXg;
       spf=pass (google.com: domain of peterx@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=peterx@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701377802;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CvBa0sQTQ4iydX+WLgMreuODjjAkBlkycz9lfLxb2yo=;
	b=go4JouXgP/qYR0pqbpuiwCswEGdsF9/BFXEkQoDQVk+eFSzVe2FzADGiJXn+w6Cw7B5BQq
	G1U2lRZFN6XBgFG/XtD6WNhsvB1OWchvenC7wnqDIa9FdBKdUpIAsad52JQvXil46gR3hd
	MplBgH/IAzkCjZBbgEthJX/wCTgXT4o=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-269-4fW60KLLNvK3hrvWowbFLw-1; Thu, 30 Nov 2023 15:56:40 -0500
X-MC-Unique: 4fW60KLLNvK3hrvWowbFLw-1
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-67a1f7b4a0fso3396436d6.1
        for <alex.bennee@linaro.org>; Thu, 30 Nov 2023 12:56:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701377800; x=1701982600;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CvBa0sQTQ4iydX+WLgMreuODjjAkBlkycz9lfLxb2yo=;
        b=Jdj9pM/t1tZR4S8Trk+1TkItqaS+eYm+FzLHDIaCwNKiNyBryFc9OqXb/9RGiLP1j7
         WHAbO5EXw7zQF3jBN5Zz827YNc8gJlST02S6nUQ13QbduOzSUf4ddNqhHGpcZSI7T1Pi
         ldtIOqavvvLbI6Sfs0aPAXAUoIk61+i+WuN44FhnYEPGZt8mbpLJwyiWqygxmUhz+6j/
         RspycwTvv6Xs1iLpZy5ffwDmCApmprdCoiF3ufAJreyCA7RsSRmlsC7whtbUAjvw9C73
         p7ZhCAPQHuTJaXP+l9DwsZFwnEeB9/eTB3mqMKEbbAkQKSaWVBIV3jcuWqRSG82mj7qA
         kMyg==
X-Gm-Message-State: AOJu0YxLcNhX6QxgCXA6sby5sg+VBBD3YdwN32BO23jYdNyZRUOMkMdY
	VNFD8hCYCE5w5ONsg+bF9gr0j45QWWzVL7Riih2w0DQp+KPTSQLw9aL3BhP3ALJvFoqn4Sypsg4
	MpPo5+OGiq2r5kCpJ
X-Received: by 2002:ad4:5246:0:b0:67a:1c70:115e with SMTP id s6-20020ad45246000000b0067a1c70115emr20447933qvq.1.1701377800282;
        Thu, 30 Nov 2023 12:56:40 -0800 (PST)
X-Received: by 2002:ad4:5246:0:b0:67a:1c70:115e with SMTP id s6-20020ad45246000000b0067a1c70115emr20447887qvq.1.1701377799939;
        Thu, 30 Nov 2023 12:56:39 -0800 (PST)
Return-Path: <peterx@redhat.com>
Received: from x1n (cpe688f2e2cb7c3-cm688f2e2cb7c0.cpe.net.cable.rogers.com. [99.254.121.117])
        by smtp.gmail.com with ESMTPSA id y10-20020a0cc54a000000b0067835abc38bsm811386qvi.129.2023.11.30.12.56.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 12:56:39 -0800 (PST)
Date: Thu, 30 Nov 2023 15:56:32 -0500
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
Message-ID: <ZWj3AN5qBnEu8NcI@x1n>
References: <20231129212625.1051502-1-stefanha@redhat.com>
 <20231129212625.1051502-2-stefanha@redhat.com>
 <ZWjr0TKxihlpd1jm@x1n>
 <20231130204325.GE1184658@fedora>
MIME-Version: 1.0
In-Reply-To: <20231130204325.GE1184658@fedora>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-TUID: LxJa1ZopRJnQ

On Thu, Nov 30, 2023 at 03:43:25PM -0500, Stefan Hajnoczi wrote:
> On Thu, Nov 30, 2023 at 03:08:49PM -0500, Peter Xu wrote:
> > On Wed, Nov 29, 2023 at 04:26:20PM -0500, Stefan Hajnoczi wrote:
> > > The Big QEMU Lock (BQL) has many names and they are confusing. The
> > > actual QemuMutex variable is called qemu_global_mutex but it's commonly
> > > referred to as the BQL in discussions and some code comments. The
> > > locking APIs, however, are called qemu_mutex_lock_iothread() and
> > > qemu_mutex_unlock_iothread().
> > > 
> > > The "iothread" name is historic and comes from when the main thread was
> > > split into into KVM vcpu threads and the "iothread" (now called the main
> > > loop thread). I have contributed to the confusion myself by introducing
> > > a separate --object iothread, a separate concept unrelated to the BQL.
> > > 
> > > The "iothread" name is no longer appropriate for the BQL. Rename the
> > > locking APIs to:
> > > - void qemu_bql_lock(void)
> > > - void qemu_bql_unlock(void)
> > > - bool qemu_bql_locked(void)
> > > 
> > > There are more APIs with "iothread" in their names. Subsequent patches
> > > will rename them. There are also comments and documentation that will be
> > > updated in later patches.
> > > 
> > > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> > 
> > Acked-by: Peter Xu <peterx@redhat.com>
> > 
> > Two nickpicks:
> > 
> >   - BQL contains "QEMU" as the 2nd character, so maybe easier to further
> >     rename qemu_bql into bql_?
> 
> Philippe wondered whether the variable name should end with _mutex (or
> _lock is common too), so an alternative might be big_qemu_lock. That's

IMHO mutex isn't important in this context, but an implementation detail of
the "lock" as an abstract concept.

For example, we won't need to rename it again then if the impl changes,
e.g. using pure futex or a rwlock replacement.  When that happens we don't
need to change all call sites again.

(never really meant to change the lock impl, just an example.. :)

KVM actually has that example of KVM_MMU_LOCK() macro taking as the rwlock
write lock when the spinlock is replaced with rwlock, while it'll keep to
be the spinlock "lock()" when !KVM_HAVE_MMU_RWLOCK.

> imperfect because it doesn't start with the usual qemu_ prefix.
> qemu_big_lock is better in that regard but inconsistent with our BQL
> abbreviation.
> 
> I don't like putting an underscore at the end. It's unusual and would
> make me wonder what that means.

Ah, I meant replacing the "qemu_bql_" prefix with "bql_", as that contains
QEMU already, rather than making "_" at the end.  So they'll be bql_lock(),
bql_unlock(), bql_locked().

> 
> Naming is hard, but please discuss and I'm open to change to BQL
> variable's name to whatever we all agree on.

I'm pretty okay with qemu_bql_lock(), etc. too.  I prefer a tiny little bit
on bql_ over qemu_bql_ in this regard, but frankly they're all names good
enough to me.  The "qemu_" prefix can still be a good thing saying "this is
a qemu global function", even if contained inside "bql" itself.

> 
> > 
> >   - Could we keep the full spell of BQL at some places, so people can still
> >     reference it if not familiar?  IIUC most of the BQL helpers will root
> >     back to the major three functions (_lock, _unlock, _locked), perhaps
> >     add a comment of "BQL stands for..." over these three functions as
> >     comment?
> 
> Yes, I'll update the doc comments to say "Big QEMU Lock (BQL)" for each
> of these functions.

Thanks!

-- 
Peter Xu
