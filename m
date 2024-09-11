Received: by 2002:a17:504:928f:b0:1be9:327d:8ee3 with SMTP id d15csp233005nji;
        Wed, 11 Sep 2024 09:57:11 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWmpXCFK3Ko/D7AL0N+PeLYzRQa4lieUNASb0MiX2xO9JGDdbu67Ttiwegv7zy/3QKibVzIHPtWauQ1kw==@linaro.org
X-Google-Smtp-Source: AGHT+IHzVhesiJJIpo+fJ9AXR+SCz8zTDZtVf+ATcD3f6R8CyucPwJCpXp975B2UNB4W7U+7LjIa
X-Received: by 2002:a05:6214:590d:b0:6c3:6315:f287 with SMTP id 6a1803df08f44-6c57350c87dmr2181296d6.3.1726073831540;
        Wed, 11 Sep 2024 09:57:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726073831; cv=none;
        d=google.com; s=arc-20240605;
        b=eH/8/cqMKI7PnW4pG71EEITk+QQnOjFF4aOI3v7KHjp1/SfJXi50c8rfmOisl/SxUA
         AdChXZY/MWr7GG9fhcZAtYe08JeVZelyg/OlABcy3NZLKmHGCpfVLlYABejCW5giKZHI
         Ax4LNy+xSrydmoQhR6OWBHNzAwOewkd1A5uS0Xjp5UbhaMexvI1vDXVKe8Etb5Cfw/Yv
         OtwMspj9Lhmcfyh5uVS9kQT5xY5BLxbdFnUk9hZZxypNhRohKtllO9zGXxfobiNKlDil
         8FuO5zvPSigdsuvOXvpLV+Dj5LBb+24xCOzw6ewNIa44yingjZqKnAmy5VDFid2mniWq
         zi0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=FDcn3NduRBzJ1p1GnYweZ1g7LcQAP4wJdN/8+ZG8KQo=;
        fh=gZOqcxVDS4GfHrNwT5hL15Pi3uZ6Nah3AgRTmXQ/KWs=;
        b=M1eVad09CFJnLRwX42PuqtISvOWBF4AfXS8z8N8R7AoYEB1fXg/4oUYkmqvwwq0J9Z
         6rIeDJ2mECKQEQHpgqSRRtu8QR2KdORsmgGb0IG9lbrg9I4Ib5/bTGpTms/R/yqMFtQe
         2mKChbfC51VdHoodokqm492WQoifkqeHzn3t9FGr5lACNcCPDgLM9Voa6zyzyxLfWy4o
         3zI5InoG1e4Zok6oSyjpgRWTiGGyaCYVRUSOwvo1lTRVUtVVTL8UtqmNxsWwp0FUS39S
         UR/G+WJWlitO+Ab4tj+pZ1YVODEKNc+ywAocvWgTOWcx8xe5ySvH43pMirLkksY62ddf
         yYmQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="P/NvSYwr";
       spf=pass (google.com: domain of kwolf@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=kwolf@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kwolf@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6c53476f1fcsi106511866d6.282.2024.09.11.09.57.11
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 09:57:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of kwolf@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="P/NvSYwr";
       spf=pass (google.com: domain of kwolf@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=kwolf@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1726073831;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FDcn3NduRBzJ1p1GnYweZ1g7LcQAP4wJdN/8+ZG8KQo=;
	b=P/NvSYwr2gE8sSOb5yR13HWPtuSJCqIU7ALl7Y0z/ue6V2pBrb6k/3xdDl3qJchTOA3dvn
	pDIXmn89TRlq3alut0YmXwEQzsr02qMnOCI0ehtmTDxejKOHJStmZBQgmHGqrwouOd1IQW
	PuT9l44pF1UZ48oKuzlZNmoNIqCCU3c=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-270-FwSM-qCIPAissphWVt5f6Q-1; Wed,
 11 Sep 2024 12:57:10 -0400
X-MC-Unique: FwSM-qCIPAissphWVt5f6Q-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id DA93C1955F45;
	Wed, 11 Sep 2024 16:57:00 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.224])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D309F1956088;
	Wed, 11 Sep 2024 16:56:35 +0000 (UTC)
Date: Wed, 11 Sep 2024 18:56:32 +0200
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
Subject: Re: [PATCH 09/39] qobject: replace assert(0) with
 g_assert_not_reached()
Message-ID: <ZuHLwASwBt8qsnwb@redhat.com>
References: <20240910221606.1817478-1-pierrick.bouvier@linaro.org>
 <20240910221606.1817478-10-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240910221606.1817478-10-pierrick.bouvier@linaro.org>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
X-TUID: +CgX15VrtMqz

Am 11.09.2024 um 00:15 hat Pierrick Bouvier geschrieben:
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>

Reviewed-by: Kevin Wolf <kwolf@redhat.com>
