Received: by 2002:a17:504:928f:b0:1be9:327d:8ee3 with SMTP id d15csp210844nji;
        Wed, 11 Sep 2024 08:48:29 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXDpWPQpLYx5kcf//raGMzA/upNtXN0zendszZZGCw26bv4OLj9sW5xVLyicrxJQtyPhhM2XJ3D8pQ6NQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGhKXRYaid8b4nfOY4xX3CxFHi80l3UFy2gFabSQuClNqMW45UQ9nVvvQ50Z4ODxZR70Vnr
X-Received: by 2002:a05:6122:3bcc:b0:501:be30:2abf with SMTP id 71dfb90a1353d-5032d3e3e56mr37257e0c.1.1726069709055;
        Wed, 11 Sep 2024 08:48:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726069708; cv=none;
        d=google.com; s=arc-20240605;
        b=lLOZOzBTgdsDA2zl6GEilv97h3/IM4H5XTkw4dnvNaPmRyVRC5wnlOGOMJ7jI5jD/n
         RHMINa/rsFx3K0V5+x6tSYsTU2zEIRDJz2D2AhvIMWm0xhGa4grzHMhlr9gV0SYNqDwL
         LnHY0quLzS4sfnJDC7ZNqJ0DOSPHsS3h2+sUQ6PnGPtL6qpxsCfhv80BDwiFhtsh3UWJ
         dhKBSRmpY2XA+hdZ9sLyi6wHL3Z3Rea0Z6UGc2wKCQ9NgP8gOv9kVQbuc/Zb1EUbM0pA
         mAWoEn+arVrB8053voCn83tTG5pRrFIV0dWiSqq2xHkqOXNDG3ImJs550j7bZJCyzceI
         +Rlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=FDcn3NduRBzJ1p1GnYweZ1g7LcQAP4wJdN/8+ZG8KQo=;
        fh=gZOqcxVDS4GfHrNwT5hL15Pi3uZ6Nah3AgRTmXQ/KWs=;
        b=P1lO+qufsojC6OG05tYULfOTRurcTpH3aMl5J4ILJcOxiBtE7otZltZJnZf2jRYpf6
         nOnnegvt7UGCC8SdbabexvYaSeR3umcrJXB1yLJ7GI/4t1LoXLZLA/V9/7UNz1w4RfOH
         VVQ9fSxVyTXcwNFzapZWDDDcSTEHHk9/gkVzi8tZpt4aq5KK8bVnCPyj1z66Sc2GRyID
         USTizuMO+F08PW2OJmF/5R8eMqhjP7rRwhps+UIvzBTcpw3bOFtTGcr2FHRSWsCpsaFV
         y7S/jzNsgL163fK+tFcg8JzIoi8HXmbpVVTm0vvVXhasf28Jf9g244xlyicQPEAxsYr+
         gfUg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DbmuZH8m;
       spf=pass (google.com: domain of kwolf@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=kwolf@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kwolf@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6c534783ecbsi106198486d6.426.2024.09.11.08.48.28
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 08:48:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of kwolf@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DbmuZH8m;
       spf=pass (google.com: domain of kwolf@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=kwolf@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1726069707;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FDcn3NduRBzJ1p1GnYweZ1g7LcQAP4wJdN/8+ZG8KQo=;
	b=DbmuZH8mKI5EUedDJmWOHxdSgAkryP237HWY8T37ADABMXRX0WRv2tK2V7l3YbHDIsY0a+
	BoeHnJdjHhX1v1ElcbjQR6PBLBXdXq768kZAPhE1IFe/D/OwiCTkLBTjrAVl9uxeqa+S2m
	BEXV2t1uIX6kSHuetPYMUkOxo/3akDc=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-463-mW7O2tfiMtGR-XEoQRGdqQ-1; Wed,
 11 Sep 2024 11:48:24 -0400
X-MC-Unique: mW7O2tfiMtGR-XEoQRGdqQ-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7094419344C2;
	Wed, 11 Sep 2024 15:48:12 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.224])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 59475195605A;
	Wed, 11 Sep 2024 15:47:48 +0000 (UTC)
Date: Wed, 11 Sep 2024 17:47:40 +0200
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
Subject: Re: [PATCH 15/39] block: replace assert(false) with
 g_assert_not_reached()
Message-ID: <ZuG7nHfvuis-IAcf@redhat.com>
References: <20240910221606.1817478-1-pierrick.bouvier@linaro.org>
 <20240910221606.1817478-16-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240910221606.1817478-16-pierrick.bouvier@linaro.org>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
X-TUID: H8abEilH8paG

Am 11.09.2024 um 00:15 hat Pierrick Bouvier geschrieben:
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>

Reviewed-by: Kevin Wolf <kwolf@redhat.com>
