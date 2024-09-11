Received: by 2002:a17:504:928f:b0:1be9:327d:8ee3 with SMTP id d15csp213223nji;
        Wed, 11 Sep 2024 08:57:15 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUNNo2Z0obsxs+bOgRY5QyPi97z8OQuCVzHiwRvV8EhUkEoMWmc5x2AgvCRxN/d0mmgwShMc9UJt6Q7rQ==@linaro.org
X-Google-Smtp-Source: AGHT+IH6K8UzZg2+pbgE50iJj1LRDYvtqB9r2qgnjJAZ8km4vlE7zs2y45hmkWmLSO+7nach2RrV
X-Received: by 2002:a05:6214:4599:b0:6c3:68b0:a5ce with SMTP id 6a1803df08f44-6c5283fdc26mr283005506d6.27.1726070234998;
        Wed, 11 Sep 2024 08:57:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726070234; cv=none;
        d=google.com; s=arc-20240605;
        b=XXW0Lcxfg7SpSkIVqVnP7ILm/ua/RyZtgYN2XCLy1HGqJsFCpiFkMB3FIh5tVCXJVo
         KbHdyCENwOEMXMeAr1wbpu3C25FrzZZm8GGzi0kCYcizHN1zuAXNmsL5wgbo+WB0m8kA
         7kKD8XMcFXsOgQaCbidAhpGiDe3pSt+YAVO7uXL84sKS2NUuf/N9hlaj2fjzL29VHdzo
         K7dHQvpc0fi+7SVdELzd6PyiWEB0pRzWA1QufF0E3ThDmpjmjCJDNQb5JXWsyA+9T0gh
         c0a8bbfdxsm4BDihUhgKxOPFDQ2ULDJrC510dG6LKO5MmygbrsVMPde+N2uD8pVLcUMX
         qtXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=FDcn3NduRBzJ1p1GnYweZ1g7LcQAP4wJdN/8+ZG8KQo=;
        fh=gZOqcxVDS4GfHrNwT5hL15Pi3uZ6Nah3AgRTmXQ/KWs=;
        b=R7im6AOSOXfvqyiVpB2Hc52HqQXhqv9QJ0Uo8JnAJaN2JSiCUTcxiJB3fN5C9laou7
         yTktwkR0Kl6wwHhi/y2j1vgrLQjnWyUFgmisv7agLSrUNFIoIs04ClbioXLQwRapo7gZ
         oLJwfONHKLsq6Oa9MVt22EPx9nfAG9eHaQLgigRPSVH7dujkrvP2LfjSMYOMRg25Ntvb
         x8jaCNtyjnhkWY3XZfKyvWi2sYnn7VCf0Eij4pRdAoSFZ7TgouISSpt1Q9yXrQ2bsLRz
         +lAiCOtX0CfW/Fx4p0UjasEVtM+mxspodx8sjm0xB+Qf4qVn5klcLBRKOq+PCgEa0Ue/
         611g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GCcdNwpq;
       spf=pass (google.com: domain of kwolf@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=kwolf@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kwolf@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6c534770253si107797226d6.286.2024.09.11.08.57.14
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 08:57:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of kwolf@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GCcdNwpq;
       spf=pass (google.com: domain of kwolf@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=kwolf@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1726070234;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FDcn3NduRBzJ1p1GnYweZ1g7LcQAP4wJdN/8+ZG8KQo=;
	b=GCcdNwpqfe/Jf8uTZCajTMaLKZxYR4TXG0J4OF8VqERKu9BfhTul+Q+g1KKFykeuFwSJWX
	51STpWDyl8cyrqymk1GkYf7fY/en+m2yrUcCfM8wdEiPdp2n902pk86Qf2FYDlsZFny7rR
	V09CuUSPv5HsH4tUgUn6PnkFFoXbPrg=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-298-O2P3ggfTNa2ZO35Ibkhlxg-1; Wed,
 11 Sep 2024 11:57:10 -0400
X-MC-Unique: O2P3ggfTNa2ZO35Ibkhlxg-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0AAE019560AD;
	Wed, 11 Sep 2024 15:56:54 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.224])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A8DDD19560AD;
	Wed, 11 Sep 2024 15:56:31 +0000 (UTC)
Date: Wed, 11 Sep 2024 17:56:29 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Cc: qemu-devel@nongnu.org, Zhao Liu <zhao1.liu@intel.com>,
	"Richard W.M. Jones" <rjones@redhat.com>,
	Joel Stanley <joel@jms.id.au>, Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org, Corey Minyard <minyard@acm.org>,
	Eric Farman <farman@linux.ibm.com>, Thomas Huth <thuth@redhat.com>,
	Keith Busch <kbusch@kernel.org>, WANG Xuerui <git@xen0n.name>,
	Hyman Huang <yong.huang@smartx.com>,
	Stefan Berger <stefanb@linux.vnet.ibm.com>,
	Michael Rolnik <mrolnik@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	=?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org,
	Ani Sinha <anisinha@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
	Jesper Devantier <foss@defmacro.it>,
	Laurent Vivier <laurent@vivier.eu>,
	Peter Maydell <peter.maydell@linaro.org>,
	Igor Mammedov <imammedo@redhat.com>, kvm@vger.kernel.org,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Fam Zheng <fam@euphon.net>, qemu-s390x@nongnu.org,
	Hanna Reitz <hreitz@redhat.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Laurent Vivier <lvivier@redhat.com>, Rob Herring <robh@kernel.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	qemu-block@nongnu.org,
	"Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
	qemu-ppc@nongnu.org,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
	Nina Schoetterl-Glausch <nsg@linux.ibm.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Fabiano Rosas <farosas@suse.de>, Helge Deller <deller@gmx.de>,
	Dmitry Fleytman <dmitry.fleytman@gmail.com>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Yanan Wang <wangyanan55@huawei.com>, Peter Xu <peterx@redhat.com>,
	Bin Meng <bmeng.cn@gmail.com>, Weiwei Li <liwei1518@gmail.com>,
	Klaus Jensen <its@irrelevant.dk>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH 31/39] hw/scsi: remove break after g_assert_not_reached()
Message-ID: <ZuG9rRKgRMMYHe5Y@redhat.com>
References: <20240910221606.1817478-1-pierrick.bouvier@linaro.org>
 <20240910221606.1817478-32-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240910221606.1817478-32-pierrick.bouvier@linaro.org>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
X-TUID: +xA+CXF60/Zb

Am 11.09.2024 um 00:15 hat Pierrick Bouvier geschrieben:
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>

Reviewed-by: Kevin Wolf <kwolf@redhat.com>
