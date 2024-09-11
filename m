Received: by 2002:a17:504:928f:b0:1be9:327d:8ee3 with SMTP id d15csp140145nji;
        Wed, 11 Sep 2024 05:34:12 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUnnIfLPyqCOtCKy9hm27yCg3gpgEs7mQNphOm1LGTqwtrK55t/D7pDwhs3owCHb7mIc+gSKK+a40rvPg==@linaro.org
X-Google-Smtp-Source: AGHT+IFOgVgk18s4pY30iWKTVcx9+W8dXWucsQXKk8og+h3VBwcBUEU63s7Eu2B5g/XlbLkO80Le
X-Received: by 2002:ac8:7f51:0:b0:446:5787:875f with SMTP id d75a77b69052e-4580c78031dmr256057351cf.38.1726058052132;
        Wed, 11 Sep 2024 05:34:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726058052; cv=none;
        d=google.com; s=arc-20240605;
        b=Eezzb8zoPNghtqXhyti3ECjPvcGNGMvyYDse4tgpy7JkvF16sxp2AUXrTFYn6ramOz
         yV0e1qoL/o3LbOc1K/t6E60EIXdogmBr/E7K4P6EoJ5cK9s6AX3Nz4jkXCUzXBCtljTy
         FJkPL49hx0lhgMCU5af8Qx/WyNT1PCDhW8vzi6bjsLk747/dTNPBeDoS+wR9BXHzUoma
         0ySzxqUnjJMcEIyWoZDNH1Jb28nH7skO2BBvnrVCwdVrNaTqiOBK6xj7zTH/eUymlidY
         enRD7AFPoKlieHymo3yWyVLbZ4F0Tr0b9a/OG6f03hMtzjie/CgK7neZbvIruny7nfec
         tFIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=zwWiCWwJ3dGN6gxSk3Yzd9j0+zvFL+3PfRinwilJ57Y=;
        fh=tJaGHWigHq6HhQ2nMrI+t4CEa5kigBj+9t3YzUfdXss=;
        b=dlm+v0FsBuu9aPrWvBrM9coghlxn23bYeamBSTo/Oe/LufybEasT8NC3TlyRO89ldP
         BAhZpYABw4nuncyb7InYng5WL/nLw79fYGsQstkKoghLqqt/M09wKBmSoElDoentx5M2
         xudufdOqsSYl9TID8fAIWezjApXSWCA9CuYX9ncU8qkAHm7N1yHYsAgFa64czePNHemy
         nAao0+FiGz4u8nTy5lh4YrveWO4lk6gBDk+rpb63jkRLCHRXMAujGSezzuDA3QJ2TPyh
         O/x3B1w08zZ9CueSAvnk+mhKvQ+bOgY6974KBDQ8SPA/D989W7etLMlC9w1uyltjkquk
         /pfA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DZX79cLt;
       spf=pass (google.com: domain of eblake@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eblake@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <eblake@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id d75a77b69052e-45822fb4acfsi100564131cf.620.2024.09.11.05.34.11
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 05:34:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of eblake@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DZX79cLt;
       spf=pass (google.com: domain of eblake@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eblake@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1726058051;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zwWiCWwJ3dGN6gxSk3Yzd9j0+zvFL+3PfRinwilJ57Y=;
	b=DZX79cLtUctBXtrH4fxQjL1vT8/AypkDfsw1bhiRkfgWk8G2KuerMyw4APu8U8rDwO9AeP
	WnnRGjT8cCfCSVTXo2t9devX4/7fh6ZPNyOkVaXex59kB9bMDFwoordssctQ12Gq/kn6E+
	T8C2LKuv//lQ0uG1DIvq24yjbEd385M=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-644-WpP9fjYZPdaDAYx7zZo4qg-1; Wed,
 11 Sep 2024 08:34:08 -0400
X-MC-Unique: WpP9fjYZPdaDAYx7zZo4qg-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C090E1958B1E;
	Wed, 11 Sep 2024 12:33:59 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.98])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 874C530001A1;
	Wed, 11 Sep 2024 12:33:39 +0000 (UTC)
Date: Wed, 11 Sep 2024 07:33:36 -0500
From: Eric Blake <eblake@redhat.com>
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Cc: qemu-devel@nongnu.org, Zhao Liu <zhao1.liu@intel.com>, 
	"Richard W.M. Jones" <rjones@redhat.com>, Joel Stanley <joel@jms.id.au>, Kevin Wolf <kwolf@redhat.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org, Corey Minyard <minyard@acm.org>, 
	Eric Farman <farman@linux.ibm.com>, Thomas Huth <thuth@redhat.com>, Keith Busch <kbusch@kernel.org>, 
	WANG Xuerui <git@xen0n.name>, Hyman Huang <yong.huang@smartx.com>, 
	Stefan Berger <stefanb@linux.vnet.ibm.com>, Michael Rolnik <mrolnik@gmail.com>, 
	Alistair Francis <alistair.francis@wdc.com>, =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>, 
	Markus Armbruster <armbru@redhat.com>, Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org, Ani Sinha <anisinha@redhat.com>, 
	Halil Pasic <pasic@linux.ibm.com>, Jesper Devantier <foss@defmacro.it>, 
	Laurent Vivier <laurent@vivier.eu>, Peter Maydell <peter.maydell@linaro.org>, 
	Igor Mammedov <imammedo@redhat.com>, kvm@vger.kernel.org, 
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, Richard Henderson <richard.henderson@linaro.org>, 
	Fam Zheng <fam@euphon.net>, qemu-s390x@nongnu.org, Hanna Reitz <hreitz@redhat.com>, 
	Nicholas Piggin <npiggin@gmail.com>, Eduardo Habkost <eduardo@habkost.net>, 
	Laurent Vivier <lvivier@redhat.com>, Rob Herring <robh@kernel.org>, 
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-block@nongnu.org, 
	"Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>, qemu-ppc@nongnu.org, 
	Daniel Henrique Barboza <danielhb413@gmail.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Harsh Prateek Bora <harshpb@linux.ibm.com>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, 
	Nina Schoetterl-Glausch <nsg@linux.ibm.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
	Fabiano Rosas <farosas@suse.de>, Helge Deller <deller@gmx.de>, 
	Dmitry Fleytman <dmitry.fleytman@gmail.com>, Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
	Akihiko Odaki <akihiko.odaki@daynix.com>, Marcelo Tosatti <mtosatti@redhat.com>, 
	David Gibson <david@gibson.dropbear.id.au>, Aurelien Jarno <aurelien@aurel32.net>, 
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Yanan Wang <wangyanan55@huawei.com>, 
	Peter Xu <peterx@redhat.com>, Bin Meng <bmeng.cn@gmail.com>, Weiwei Li <liwei1518@gmail.com>, 
	Klaus Jensen <its@irrelevant.dk>, Jean-Christophe Dubois <jcd@tribudubois.net>, 
	Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH 01/39] docs/spin: replace assert(0) with
 g_assert_not_reached()
Message-ID: <zkyoryho5alnyirnl7ulvh5y6tkty6koccgeygmve42uml7glu@37rkdodtlx4f>
References: <20240910221606.1817478-1-pierrick.bouvier@linaro.org>
 <20240910221606.1817478-2-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240910221606.1817478-2-pierrick.bouvier@linaro.org>
User-Agent: NeoMutt/20240425
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-TUID: 9/EAMofhFUYP

On Tue, Sep 10, 2024 at 03:15:28PM GMT, Pierrick Bouvier wrote:
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---

A general suggestion for the entire series: please use a commit
message that explains why this is a good idea.  Even something as
boiler-plate as "refer to commit XXX for rationale" that can be
copy-pasted into all the other commits is better than nothing,
although a self-contained message is best.  Maybe:

This patch is part of a series that moves towards a consistent use of
g_assert_not_reached() rather than an ad hoc mix of different
assertion mechanisms.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.
Virtualization:  qemu.org | libguestfs.org
