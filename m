Received: by 2002:a17:504:928f:b0:1be9:327d:8ee3 with SMTP id d15csp141262nji;
        Wed, 11 Sep 2024 05:37:36 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX4qVrRrr+Q6gT9DGV2NiI1pGjLJLKHlIWSqxK7dxppHvMnbyD1Ob+l8xFNERtlwwnEopLYNsvzdFAqaA==@linaro.org
X-Google-Smtp-Source: AGHT+IF0SSBWPKzTchdFgkBK0ca8dJsskW71n+SCkpIzkNt9bKeIXjXkMD2hA30lc/KAoDpb9/g0
X-Received: by 2002:a05:620a:370d:b0:7a9:bf2a:d7d8 with SMTP id af79cd13be357-7a9d3a1ae80mr413257585a.8.1726058256051;
        Wed, 11 Sep 2024 05:37:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726058256; cv=none;
        d=google.com; s=arc-20240605;
        b=SS0xonCnbCgVS7MZ9EQFr0Jo//VjWHALUWSCymjK3elFo+w6jfpPaOACT3k5Y+/hct
         lHnWgxaROPon3ZiS1+08+qGxoS6/4hg5o1LWfnsBZY1AzzoyFrY9qaAXpTFakImAEDQq
         OepJsBsyEvpjhT4ldVdKX/N18VOPFujpkf9oP8lcQ134/HnBDFpTH1KHRzpMNnjyqdBm
         KpSvNuQmpA3pBT+48p6p3237TpIvt20P7W75IL3bOBNgDLu9g2555gbcDGSbqqWiqNrE
         0bEbH/dM4Gh/FDvEyta3x/tVMiSnVJPYbED5Y3IdMlHv0V4ZWoEuT95Jhyjsj4LeLH13
         luNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=2yyoUHl0RktlwtpBgJrkB7WrBtx0gjcCkcB5aXQqSHw=;
        fh=tJaGHWigHq6HhQ2nMrI+t4CEa5kigBj+9t3YzUfdXss=;
        b=PBLIwlgxT+QIMAGwGO9ytYw+Y9akFAW8yLTVcvpM1gL5AQCZsukY7FyczHsXLK/pzQ
         RhsamR2572dQ0CEXKL30q4hG3N3W4Kc6XP6OlUCuTF/Ru7+vBqeygdyRPUiBcChv05gX
         B6LxrHS9v1oOwLIj1+h45lF21MoV9LAWYUkDCKzZrjz1hwQGYJbni6faCCq4xEg3YOpk
         nQ5V2Y1MUNeXo8J/sUxIk8B8FKjdl9HoAuXXE0gOg7kCxdPgf5+L4JyXYOUlwykH4z/y
         eQJ6WUVZcVVVE8u0IPIYUB7PBqnseLtAV76i0NT3baAcYjja7hSnKJ60A6+5nyOTbBDQ
         3UcQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=EiRMEf7G;
       spf=pass (google.com: domain of eblake@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eblake@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <eblake@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d75a77b69052e-4582302543csi106907951cf.785.2024.09.11.05.37.35
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 05:37:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of eblake@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=EiRMEf7G;
       spf=pass (google.com: domain of eblake@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eblake@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1726058255;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2yyoUHl0RktlwtpBgJrkB7WrBtx0gjcCkcB5aXQqSHw=;
	b=EiRMEf7GzRTVD4iiHNueLZ29Eq2R+odQR6EXVqAXz/0Egc6S8gVioap1iRtTzl6MRbqB1f
	C+J+RTiyZOwy4uK537djNoNN9kMPf1/r+MdE0WttyK/tCEVjk5tybsdc+CFHwXBEQc+pnv
	PFnw5dtPXBWHdMHCMk7ptsjHEoExthw=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-441-jaSzpHeWNrut-meJROLWwg-1; Wed,
 11 Sep 2024 08:37:32 -0400
X-MC-Unique: jaSzpHeWNrut-meJROLWwg-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C874D19560BE;
	Wed, 11 Sep 2024 12:37:23 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.98])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5E27C19560A3;
	Wed, 11 Sep 2024 12:37:05 +0000 (UTC)
Date: Wed, 11 Sep 2024 07:37:02 -0500
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
Message-ID: <bwo43ms2wi6vbeqhlc7qjwmw5jyt2btxvpph3lqn7tfol4srjf@77yusngzs6wh>
References: <20240910221606.1817478-1-pierrick.bouvier@linaro.org>
 <20240910221606.1817478-2-pierrick.bouvier@linaro.org>
 <zkyoryho5alnyirnl7ulvh5y6tkty6koccgeygmve42uml7glu@37rkdodtlx4f>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <zkyoryho5alnyirnl7ulvh5y6tkty6koccgeygmve42uml7glu@37rkdodtlx4f>
User-Agent: NeoMutt/20240425
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-TUID: u34mB29Y0v1J

On Wed, Sep 11, 2024 at 07:33:59AM GMT, Eric Blake wrote:
> On Tue, Sep 10, 2024 at 03:15:28PM GMT, Pierrick Bouvier wrote:
> > Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> > ---
> 
> A general suggestion for the entire series: please use a commit
> message that explains why this is a good idea.  Even something as
> boiler-plate as "refer to commit XXX for rationale" that can be
> copy-pasted into all the other commits is better than nothing,
> although a self-contained message is best.  Maybe:
> 
> This patch is part of a series that moves towards a consistent use of
> g_assert_not_reached() rather than an ad hoc mix of different
> assertion mechanisms.

Or summarize your cover letter:

Use of assert(false) can trip spurious control flow warnings from some
versions of gcc:
https://lore.kernel.org/qemu-devel/54bb02a6-1b12-460a-97f6-3f478ef766c6@linaro.org/
Solve that by unifying the code base on g_assert_not_reached()
instead.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.
Virtualization:  qemu.org | libguestfs.org
