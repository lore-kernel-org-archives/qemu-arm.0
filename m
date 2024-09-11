Received: by 2002:a17:504:928f:b0:1be9:327d:8ee3 with SMTP id d15csp212306nji;
        Wed, 11 Sep 2024 08:53:45 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXIOLRpeI/2ozgovNPskIRX8n6Y1dWqDkWLLchHnnrD7DE/jTr77CeBdX5Luq9ZQGmnE4jtRSdj/EAjvQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFPVrbF+BC2QpVkc275HNL1ayTIqd15cQaM4nU5oVwQ94BB/MHzjeROMjnc2GI2Syw23Cb7
X-Received: by 2002:ac8:7f0d:0:b0:458:3cb6:13cb with SMTP id d75a77b69052e-4583cb61753mr113460451cf.56.1726070025428;
        Wed, 11 Sep 2024 08:53:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726070025; cv=none;
        d=google.com; s=arc-20240605;
        b=b7FrN5TDFjCj6vYbh7OH4/lguOJ3kH4qEA/O8I9mWakb9F1whzqz3w7p8nbsIfoSDE
         B+E5GDhfjfXq1e7l97O13JurfDLKViHRf1+dMnAF2uu8NtyvvdQdbGbatjvM8AvTOcBw
         ZoCC8ZRKmal2R9HSV4P0JIDD+e/nGOpPEEciij9QrNwbvb/+EYQi77OTueaXZ7hoGIRA
         qlkeeFL1UXratvQhK7PH3cs/HoaAihoMUEiYdEtFZgMjM9n/7RO42LcCxH9w3UF7oI+c
         aqbq8ajkhgUtLvTwVdvkqedKr0tkgFvqAx386C3qXeMB+9lJDw8nhrndOYHvLGz+TR3N
         H9CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=FDcn3NduRBzJ1p1GnYweZ1g7LcQAP4wJdN/8+ZG8KQo=;
        fh=gZOqcxVDS4GfHrNwT5hL15Pi3uZ6Nah3AgRTmXQ/KWs=;
        b=i5Tq98Z9+UGgLmjvHxfREbZ7sYMWTePX3sxBgacZj6oUzFT+BhWEM0HuMXQfF3IxNb
         7L1mS9pMdW+/TQhNJMRujUq5mb3p0eZa9BaTRpj8mTRMnznMidDDa0vMDFhL50rY/VyH
         S3TIMk1kudiJP4VbyVvDZXVYHl01kFS8RmVBxCzTQQH/DYo+Xq/UA8dT1JxqfrSTjg2A
         M9ZkEOP4sWu9NTJywWdTQZRrzsFZU0DlrIFa8kxaUD3lFXfSWFmNKWwWIKGhg+Equq1Q
         xWXEXRlxdqSL1oiJhlHt2QHK9vcGwsf3REVZ1tcdUPh3cDGe6QrHEr35aXZU0jdQM370
         kwyA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=b4SHzwVJ;
       spf=pass (google.com: domain of kwolf@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=kwolf@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kwolf@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d75a77b69052e-45822f3e3a2si100807661cf.233.2024.09.11.08.53.45
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 08:53:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of kwolf@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=b4SHzwVJ;
       spf=pass (google.com: domain of kwolf@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=kwolf@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1726070025;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FDcn3NduRBzJ1p1GnYweZ1g7LcQAP4wJdN/8+ZG8KQo=;
	b=b4SHzwVJyMuodd5JxizfrbKv2pOO9s9TN7uJfckm1eWvhYR6bkroOWbc+apHpaB2dNbp8+
	MTrpFJZKEft6OA0z3nS9qCgb4ud55sY6UNMO+kOcslcI6KL+7decEwK5YUxeIqf1enbDZ7
	PCmuhnRk2Kw02QKngGDEg9jdpRxmyRk=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-439-yBeBHTjvOoyp8ofJ7KOXEQ-1; Wed,
 11 Sep 2024 11:53:43 -0400
X-MC-Unique: yBeBHTjvOoyp8ofJ7KOXEQ-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C70C4195608B;
	Wed, 11 Sep 2024 15:53:34 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.224])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7A0BB1955D42;
	Wed, 11 Sep 2024 15:53:13 +0000 (UTC)
Date: Wed, 11 Sep 2024 17:53:10 +0200
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
Subject: Re: [PATCH 25/39] block: remove break after g_assert_not_reached()
Message-ID: <ZuG85ixOAt6-0CAk@redhat.com>
References: <20240910221606.1817478-1-pierrick.bouvier@linaro.org>
 <20240910221606.1817478-26-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240910221606.1817478-26-pierrick.bouvier@linaro.org>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
X-TUID: KPWy71/C+eyD

Am 11.09.2024 um 00:15 hat Pierrick Bouvier geschrieben:
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>

Reviewed-by: Kevin Wolf <kwolf@redhat.com>
