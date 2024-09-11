Received: by 2002:a17:504:928f:b0:1be9:327d:8ee3 with SMTP id d15csp145312nji;
        Wed, 11 Sep 2024 05:51:42 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUCe+lO5Tf9r8Y/d1Ie1rbZ/j6vv2Po20M+mXCRWticI175MlhIZgnvQynURAyXuxQhu3cY449SnVezjQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEUR1Pfa4/UF+24NUozU2Xy5fOx4sIroXq4k3uotiEFPKAAoTqd1wSdK+N0QrmUhIr8Af6i
X-Received: by 2002:a05:6102:e07:b0:49b:dfaa:c76a with SMTP id ada2fe7eead31-49bedb74571mr13021034137.4.1726059101776;
        Wed, 11 Sep 2024 05:51:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726059101; cv=none;
        d=google.com; s=arc-20240605;
        b=TNwPGJan6AWqgA1FH5e7qOZAKHlaTDbJluPqF8XshsJOejipIv2VkMdLN/YKNv0L5U
         XWVhy5I74b6wqVwhnrF6YTq7TJ1AXIIEagdzm4/AYULrJ0YmzUQSKyGdAYNUNMU90nmG
         Iocmtah7EvWXkNGm/GVKRrHnfY5kFFI3wPAbrI+3h/uCl4f/TOo+k/hg8arJBNwScKd1
         cga83svpm5dXPsl8MeYzIZC0SoLLYy/+Y2DUxz53g45Xik0v1AXc+FUM32Z7kGjQ7j1X
         S0ohs3qiBPildN1Q8OfIFfyvDfho1hVAfwtN1WLORrLxutlUk+6g+B/ASfJYFtk4SJI1
         bNOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=mFTkfxZe8Y3KC8+GnCo7YhR64xl+MhtnbrQRYDpeikY=;
        fh=IZ3/yjsSQj5+8tXCaBXT/xFoSWKQ6B57xSNl4CPgR+s=;
        b=fyKTAi7Db/BKdE/i0nbmuBTfhETgIihM9qKCDS+llLnCpl7UTlh8ZoWuVZa6G+WG9W
         WfJGpf9g3QTBhB/yyhEwVTtf57lwswKd+cRwcgHBVrlpaga0i74GFhpt3D5ePxXlOkx7
         YSvA8aM6jYgeMAqDYSzCYubiVgRMQ+h3+a5MtjaVWqEVTU31GRnxhiHGtaTDO0QZGIgV
         X/qgdl7uSi+i5fk8XTvCjyxwpN55WFyUkEfdMhG0WD+542xSGEdII0lC9t1qj43HgbSd
         Fz5lQwVnT7F0OV0YACgdgkbURniEVDwvqCdlNYPBzQLCiQDNAM4kdbrAym3GBv8s07DI
         v5Mw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WnCuUegk;
       spf=pass (google.com: domain of rjones@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=rjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <rjones@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6c53433deecsi101673956d6.165.2024.09.11.05.51.41
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 05:51:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of rjones@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WnCuUegk;
       spf=pass (google.com: domain of rjones@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=rjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1726059101;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mFTkfxZe8Y3KC8+GnCo7YhR64xl+MhtnbrQRYDpeikY=;
	b=WnCuUegknep5HUo4gzjiXh2YieF6mAPvg86y+eWZH/sSAyIktS6Wb+HTJ4gBiKpskkmC68
	6/6OHH3xg+GbJc88WjphSFCpPiUhToJKm6JpfwT85kB8dajaKaqk5cmS9RW4V8Fd/3/EHp
	0BaW3o5SspEFfrFptR+TtqscOi27WVo=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-632-iUWjuNGROCO2yRVTK23Trg-1; Wed,
 11 Sep 2024 08:51:40 -0400
X-MC-Unique: iUWjuNGROCO2yRVTK23Trg-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8F906193584D;
	Wed, 11 Sep 2024 12:51:31 +0000 (UTC)
Received: from localhost (unknown [10.42.28.10])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id E3A1319560AB;
	Wed, 11 Sep 2024 12:51:27 +0000 (UTC)
Date: Wed, 11 Sep 2024 13:51:26 +0100
From: "Richard W.M. Jones" <rjones@redhat.com>
To: "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>
Cc: Eric Blake <eblake@redhat.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	qemu-devel@nongnu.org, Zhao Liu <zhao1.liu@intel.com>,
	Joel Stanley <joel@jms.id.au>, Kevin Wolf <kwolf@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
	Corey Minyard <minyard@acm.org>, Eric Farman <farman@linux.ibm.com>,
	Thomas Huth <thuth@redhat.com>, Keith Busch <kbusch@kernel.org>,
	WANG Xuerui <git@xen0n.name>, Hyman Huang <yong.huang@smartx.com>,
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
	qemu-block@nongnu.org, qemu-ppc@nongnu.org,
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
Subject: Re: [PATCH 01/39] docs/spin: replace assert(0) with
 g_assert_not_reached()
Message-ID: <20240911125126.GS1450@redhat.com>
References: <20240910221606.1817478-1-pierrick.bouvier@linaro.org>
 <20240910221606.1817478-2-pierrick.bouvier@linaro.org>
 <zkyoryho5alnyirnl7ulvh5y6tkty6koccgeygmve42uml7glu@37rkdodtlx4f>
 <bwo43ms2wi6vbeqhlc7qjwmw5jyt2btxvpph3lqn7tfol4srjf@77yusngzs6wh>
 <10d6d67a-32f6-40fc-aba9-c62a74d9d98d@maciej.szmigiero.name>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <10d6d67a-32f6-40fc-aba9-c62a74d9d98d@maciej.szmigiero.name>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-TUID: Fy/PdQQ6uuCC

On Wed, Sep 11, 2024 at 02:46:18PM +0200, Maciej S. Szmigiero wrote:
> On 11.09.2024 14:37, Eric Blake wrote:
> >On Wed, Sep 11, 2024 at 07:33:59AM GMT, Eric Blake wrote:
> >>On Tue, Sep 10, 2024 at 03:15:28PM GMT, Pierrick Bouvier wrote:
> >>>Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> >>>---
> >>
> >>A general suggestion for the entire series: please use a commit
> >>message that explains why this is a good idea.  Even something as
> >>boiler-plate as "refer to commit XXX for rationale" that can be
> >>copy-pasted into all the other commits is better than nothing,
> >>although a self-contained message is best.  Maybe:
> >>
> >>This patch is part of a series that moves towards a consistent use of
> >>g_assert_not_reached() rather than an ad hoc mix of different
> >>assertion mechanisms.
> >
> >Or summarize your cover letter:
> >
> >Use of assert(false) can trip spurious control flow warnings from some
> >versions of gcc:
> >https://lore.kernel.org/qemu-devel/54bb02a6-1b12-460a-97f6-3f478ef766c6@linaro.org/
> >Solve that by unifying the code base on g_assert_not_reached()
> >instead.
> >
> 
> If using g_assert_not_reached() instead of assert(false) silences
> the warning about missing return value in such impossible to reach
> locations should we also be deleting the now-unnecessary "return"
> statements after g_assert_not_reached()?

Although it's unlikely to be used on any compiler that can also
compile qemu, there is a third implementation of g_assert_not_reached
that does nothing, see:

https://gitlab.gnome.org/GNOME/glib/-/blob/927683ebd94eb66c0d7868b77863f57ce9c5bc76/glib/gtestutils.h#L269

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
virt-builder quickly builds VMs from scratch
http://libguestfs.org/virt-builder.1.html
