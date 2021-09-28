Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp4809696lfp;
        Tue, 28 Sep 2021 05:11:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzMzYaCrFguJYslTlOCqkiUmKdEP8nu0CyC8bc2D7MB1aYrGn6CwE3vbbX74y8U3AKfJ0Eo
X-Received: by 2002:a17:906:3a0f:: with SMTP id z15mr6536155eje.42.1632831111433;
        Tue, 28 Sep 2021 05:11:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1632831111; cv=none;
        d=google.com; s=arc-20160816;
        b=i8D/4rQUabkjLRShq9+d8r8sfyI9t7yONNkkLK89Z0GG9a7yPB5/3uoCjp6VX3cDqE
         8KIxq4JwZQQHfHX+WrmYqqkFEJcPJl5UfLB+ttKuLDsac2Ii3cKQDI7likaj9lVbrT86
         5ZmGQ4RJvBMDnx70autYGA0f9dSod962/pd9Ry4/68EHzjARhkKRaT8m4k1qjmVrM71S
         CjPb6fzsszLESSgLfDVPW9N+qV6f57WKzNRblfyppEzaSTyV6EMxwJG9aOusjvccgKvQ
         v2o0tXF8rEH0AAZ0Wh3BU2Etjll3EFco8UASf2qHI2Yq6TAdJXiFOpaK7+A+KbGghfDz
         vZTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-disposition:in-reply-to:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=ZZrk8Sa31YIbiWVmHJ66JNKhskis3QqPpmnw51WX2/o=;
        b=shVrMWzA+c5F7TklzWr9IK+NLbjIXIe5UBEz5j/07lWI5mDL6K4/xobda3ExoYBAK7
         3eFLfKEPeIK4n2tQnjaCcI6UoXskN8gHufh5XCn2S6R5+ysbrNFECVWoL/BLV7bRbkRA
         kZKmwOG080EZ7Qa1ulavuVZOGeu5X5l99Umf63tzjG2cgpvp4ndhI+Q82vI5n/iznod+
         cTDrKAZ30zGGuNZSxKEGNtjmWbA6Sn5QakqzS2nD5Pbb5Gs75FK5W250YFghnOMtcwrv
         uKXBzmfKHI+UdQyjBO8ASIlLNFhwlO1hOgUa2/mRmNFYc6jp4PVbNLDyIE32Ec/Noxr4
         EGmg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RCW5fUc0;
       spf=pass (google.com: domain of kraxel@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=kraxel@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kraxel@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id t18si2074322edf.139.2021.09.28.05.11.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 Sep 2021 05:11:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of kraxel@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RCW5fUc0;
       spf=pass (google.com: domain of kraxel@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=kraxel@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1632831110;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZZrk8Sa31YIbiWVmHJ66JNKhskis3QqPpmnw51WX2/o=;
	b=RCW5fUc0po0jFcItvakEF/UY+m3kG7/gFnsQKFQXtoK+RVapSsSm7nn+W7vzmZOz2BFkwp
	KHixm1ru3mn0bhOPUAmf+3Q+ENa655HSdebRp535hEO9o+Wa6RvIONc1yJkiy65SfH5aDz
	2jiWHkUFjwwZjHZjo2hhxTE5i0JT5dQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-299-o7oXnew_MLSAw8AUsBogmg-1; Tue, 28 Sep 2021 08:11:49 -0400
X-MC-Unique: o7oXnew_MLSAw8AUsBogmg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C923F19253C0;
	Tue, 28 Sep 2021 12:11:45 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.134])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 59FE7100164A;
	Tue, 28 Sep 2021 12:11:28 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 9934C18003B6; Tue, 28 Sep 2021 14:11:26 +0200 (CEST)
Date: Tue, 28 Sep 2021 14:11:26 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>,
	Laurent Vivier <laurent@vivier.eu>, Peter Xu <peterx@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Cornelia Huck <cohuck@redhat.com>, qemu-ppc@nongnu.org,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Thomas Huth <thuth@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, qemu-riscv@nongnu.org,
	David Gibson <david@gibson.dropbear.id.au>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Stafford Horne <shorne@gmail.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Halil Pasic <pasic@linux.ibm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Bin Meng <bin.meng@windriver.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Alexandre Iooss <erdnaxe@crans.org>, Greg Kurz <groug@kaod.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-arm@nongnu.org,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Alistair Francis <alistair.francis@wdc.com>, qemu-s390x@nongnu.org,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH 09/29] tcg/module: add tcg-module.[ch] infrastructure
Message-ID: <20210928121126.6t6zyrlp5dmxqdtv@sirius.home.kraxel.org>
References: <20210831121545.2874233-1-kraxel@redhat.com>
 <20210831121545.2874233-10-kraxel@redhat.com>
 <5e36f960-7b40-a55b-ddba-1f635a39941a@redhat.com>
MIME-Version: 1.0
In-Reply-To: <5e36f960-7b40-a55b-ddba-1f635a39941a@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-TUID: DBsx1FHm0i9w

  Hi,

> > +struct TCGModuleOps {
> > +};
> > +extern struct TCGModuleOps tcg;
> 
> TCG functions taking a CPUState argument should reside in
> CPUClass's AccelCPUClass/TCGCPUOps, not a global struct.

It's not that easy.  Tried that first, but using TCGCPUOps outside cpu
code doesn't work.

take care,
  Gerd
