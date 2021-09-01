Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp254798lfb;
        Wed, 1 Sep 2021 01:09:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyQGGyeWDJ2EPopzifRJgOlolq2wmIjbv2uSA5gZDAeToc4gOv7hSj974Sy8SLOLPzCAQrD
X-Received: by 2002:adf:c550:: with SMTP id s16mr28700218wrf.25.1630483787849;
        Wed, 01 Sep 2021 01:09:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630483787; cv=none;
        d=google.com; s=arc-20160816;
        b=gOSO3aOZgYE19s5tfuajmykhlRPoiqh5Mgooh7iVH9+I+wjS1HWrdN5UgJNjeBxIKa
         SyiNKjYzbz+eivBa33qA37SRgW4MJgHwMmMyM9oLlHOZviUMjGrrQ+Y38ZSl74XPThPb
         rs/9sgZaiyqqQuaAeUkkYXBJEp79s+Kww4WMTrjsdfGov8QbTtmHo7eGxw1NK6HIu7ij
         kMMbAGy8P2QtkZ1RunIGyyqu/gV6Q3obiICRHAWHwy0u9MXOJwwLZGCpXTN0GH3eKztd
         Ijc6yhi/fcF35vQ4ssMtj1OeT2mVF95vSNM0uO0RKvN4fgDDZ7MPtYlW/zeW4CJPFsfp
         Jq4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=6lZ6ydmxvbnC4r0Pymcd338rHTaneKicD1zouDaR9B4=;
        b=q0CZ2xiGFcOXNZMcbM/RTrElFXRewQXaTm5w6XJlmfN+Z34cils0uGvPDS6Dqk4JsO
         yvGY2TJui6/0+f5jS8GTguThYr38M+gbNjYcxa9b5LwRsUFPiK51kF3qiYRarY/oLTdd
         U81Zk4HRyvgvhxLxF0gKE0df0uCCniSWCk/Nmn+rvvBPX0u1BMfVsGiaRyLfGukkc6jH
         AM8SzT8RcFUIjcoJruyqf50mt9FrgRiK5dPJzEdpn+9w4PpS9fHzsp/LZAxUm9CgEgrQ
         7vi2eCULdihR/hrakyFzMvDlo/Va5ej/NxeY0ftVWZajTyf9tzkpdOE9K+lYF/LiUHUd
         S8Pg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@mail.uni-paderborn.de header.s=20170601 header.b=nmvAFUt4;
       spf=pass (google.com: domain of kbastian@mail.uni-paderborn.de designates 2001:638:502:c003::14 as permitted sender) smtp.mailfrom=kbastian@mail.uni-paderborn.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=uni-paderborn.de
Return-Path: <kbastian@mail.uni-paderborn.de>
Received: from collins.uni-paderborn.de (collins.uni-paderborn.de. [2001:638:502:c003::14])
        by mx.google.com with ESMTPS id t26si14214059wrb.219.2021.09.01.01.09.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Sep 2021 01:09:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of kbastian@mail.uni-paderborn.de designates 2001:638:502:c003::14 as permitted sender) client-ip=2001:638:502:c003::14;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@mail.uni-paderborn.de header.s=20170601 header.b=nmvAFUt4;
       spf=pass (google.com: domain of kbastian@mail.uni-paderborn.de designates 2001:638:502:c003::14 as permitted sender) smtp.mailfrom=kbastian@mail.uni-paderborn.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=uni-paderborn.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mail.uni-paderborn.de; s=20170601; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=6lZ6ydmxvbnC4r0Pymcd338rHTaneKicD1zouDaR9B4=; b=nmvAFUt4vIGCfB6G8oONgc+jwF
	+rEGS7jey9hOxOwvjlXfNSsB7XEdoc/uYmhO01C9zV9blvAp0OYj7tjkbDKhJQMOzu9cuMozUn+9H
	MtOfSkBCBidNQY7MYUBVD8rVY8Ah9xTQCVAxoliEMRmJgtsP7YTbNRRQAdSP/mphQp7k=;
Date: Wed, 1 Sep 2021 10:09:30 +0200
From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Bin Meng <bin.meng@windriver.com>,
	David Hildenbrand <david@redhat.com>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Peter Xu <peterx@redhat.com>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	Halil Pasic <pasic@linux.ibm.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Greg Kurz <groug@kaod.org>, qemu-s390x@nongnu.org,
	qemu-arm@nongnu.org, Stafford Horne <shorne@gmail.com>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	David Gibson <david@gibson.dropbear.id.au>, qemu-riscv@nongnu.org,
	Cornelia Huck <cohuck@redhat.com>,
	Laurent Vivier <laurent@vivier.eu>, qemu-ppc@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Aurelien Jarno <aurelien@aurel32.net>
Subject: Re: [PATCH 20/29] tcg_funcs: Add cpu_restore_state to TCGModuleOps
Message-ID: <20210901080930.42kpcwrobyzgxmqt@schnipp-desktop>
References: <20210831121545.2874233-1-kraxel@redhat.com>
 <20210831121545.2874233-21-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210831121545.2874233-21-kraxel@redhat.com>
X-IMT-Spam-Score: 0.0 ()
X-PMX-Version: 6.4.9.2830568, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2021.9.1.75716, AntiVirus-Engine: 5.84.0, AntiVirus-Data: 2021.7.20.5840001
X-Sophos-SenderHistory: ip=84.184.59.97,fs=3861074,da=118092839,mc=48,sc=0,hc=48,sp=0,fso=3861074,re=0,sd=0,hd=0
X-IMT-Authenticated-Sender: kbastian@UNI-PADERBORN.DE
X-TUID: SQYsqisBv7ed

On Tue, Aug 31, 2021 at 02:15:36PM +0200, Gerd Hoffmann wrote:
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  include/exec/exec-all.h             | 2 +-
>  include/tcg/tcg-module.h            | 1 +
>  accel/tcg/cpu-exec-common.c         | 2 +-
>  accel/tcg/tcg-module.c              | 6 ++++++
>  accel/tcg/translate-all.c           | 3 ++-
>  softmmu/physmem.c                   | 2 +-
>  target/alpha/helper.c               | 2 +-
>  target/alpha/mem_helper.c           | 2 +-
>  target/arm/op_helper.c              | 2 +-
>  target/arm/tlb_helper.c             | 8 ++++----
>  target/cris/helper.c                | 2 +-
>  target/i386/helper.c                | 2 +-
>  target/i386/tcg/sysemu/svm_helper.c | 2 +-
>  target/m68k/op_helper.c             | 6 +++---
>  target/microblaze/helper.c          | 2 +-
>  target/openrisc/sys_helper.c        | 8 ++++----
>  target/ppc/excp_helper.c            | 2 +-
>  target/s390x/tcg/excp_helper.c      | 2 +-
>  target/tricore/op_helper.c          | 2 +-
>  target/xtensa/helper.c              | 6 +++---
>  20 files changed, 36 insertions(+), 28 deletions(-)

tricore part

Reviewed-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>

Cheers,
Bastian
