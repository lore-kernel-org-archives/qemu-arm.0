Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1210567lfb;
        Fri, 3 Sep 2021 04:57:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJweiVnI1oy5yJ6s4xqMqGJXpOXz2yskSr035tjDCGxESbHZwe2w21kEKIdNYnih52hCFMH6
X-Received: by 2002:a05:6402:1b93:: with SMTP id cc19mr3529518edb.362.1630670233137;
        Fri, 03 Sep 2021 04:57:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630670233; cv=none;
        d=google.com; s=arc-20160816;
        b=T+fYJ0AnpOFaLWxfFefOszm5COrTZFnbreiR132X6WLEbz0RAHnisQPjJFGIWNl73p
         DDfeevJUnpXomYeYUjp4spYVVbty5Nou+aACaNoHUtNORwznXk7es6/T5ACnhyXNUQSt
         uySCrunJNM0xUxTUrfsssMinNIJR5CnhPdqTVVL1mJip3zYagMuaTV71eP0Ywa3wXXgx
         90ZyL7wv/LdRyqO6hvcJe6WLvIanpIXE9OLCzWubQ8aqIOZjrwVxdRMADj/ySDGnfMKQ
         Bl41iKFEHAz9l5BpYTO+YmpkteAIBWrPl9H8f+UoT8Rlh3OA61GNMSxaUd+yi/mWlwur
         4McA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-disposition:user-agent:in-reply-to:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:dkim-signature;
        bh=qx7q+ynwNlUdf5xhudsXgJ7h+396EMUM6+GIc2Uds/E=;
        b=zRzw6aO9g3iVFoWRP5qHy+9tG0XG6Kb+s2oJ8bZOzw7TWTSfAaRFLPIXbfH928FgC5
         cJOoSrh3PoVv0ioMel2b3FRQxyMea46ySx9uDXWeil2PIYnzldq3dgs6Dq8bM622/bTj
         I+QcL9G0Bbxy2yC84K2l65insTaBdbHV0VDfF98Wis5WnI0D+u51EXDV2QR64bbfwXvc
         xbF2M75IOcuhY6Vhmyku0QiOw7MRKeeTXy/tHzX3b+DUaY4PrUo1TEZe+u4GwhJtUpLu
         oBMN4hfFU7sLvtUO/JXEAxa/9hPaofhts+jkL8Jyv/W2FJ7IQl4UYopOdzVEUzAgdDh3
         y1MQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="cYHl/+9s";
       spf=pass (google.com: domain of berrange@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id n4si5153075edd.117.2021.09.03.04.57.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 Sep 2021 04:57:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="cYHl/+9s";
       spf=pass (google.com: domain of berrange@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1630670232;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:  references:references;
	bh=qx7q+ynwNlUdf5xhudsXgJ7h+396EMUM6+GIc2Uds/E=;
	b=cYHl/+9sn0ubfntAel4ahtyV7xyc65fFH1yEOoPYgv3V7uYdO81YPrEdKsrdeVOKPYXiZx
	jOvoGI2SgLscCllC9nvTzELbxN7xqXxRyPhSgMIjsPEG/ACR8yDJ83r66pGq9iSe6gT+d8
	TqIJfahtInq8f/vuR6+QyybkxL7zjg4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-433-FBl6eYJ5Nui1zOv_iC-6fw-1; Fri, 03 Sep 2021 07:56:54 -0400
X-MC-Unique: FBl6eYJ5Nui1zOv_iC-6fw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6370684A5E0;
	Fri,  3 Sep 2021 11:56:51 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.241])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F080E5D9F0;
	Fri,  3 Sep 2021 11:56:24 +0000 (UTC)
Date: Fri, 3 Sep 2021 12:56:22 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	qemu-devel@nongnu.org, Fam Zheng <fam@euphon.net>,
	Peter Maydell <peter.maydell@linaro.org>,
	Li Zhijian <lizhijian@cn.fujitsu.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Christian Schoenebeck <qemu_oss@crudebyte.com>,
	Yuval Shaia <yuval.shaia.ml@gmail.com>,
	Peter Xu <peterx@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
	Alexandre Iooss <erdnaxe@crans.org>, Eric Blake <eblake@redhat.com>,
	qemu-block@nongnu.org, Zhang Chen <chen.zhang@intel.com>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Helge Deller <deller@gmx.de>, David Hildenbrand <david@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	"Gonglei (Arei)" <arei.gonglei@huawei.com>,
	Stefan Weil <sw@weilnetz.de>, Laurent Vivier <lvivier@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Michael Roth <michael.roth@amd.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Greg Kurz <groug@kaod.org>,
	Alex Williamson <alex.williamson@redhat.com>, qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Kevin Wolf <kwolf@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
	Shannon Zhao <shannon.zhaosl@gmail.com>,
	Hanna Reitz <hreitz@redhat.com>, qemu-ppc@nongnu.org,
	Igor Mammedov <imammedo@redhat.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>
Subject: Re: [PATCH 02/28] glib-compat: Introduce g_memdup2() wrapper
Message-ID: <YTINZmrWJLOnp193@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20210903110702.588291-1-philmd@redhat.com>
 <20210903110702.588291-3-philmd@redhat.com>
 <YTIEDKAgWGRt/I6y@redhat.com>
 <04ba0442-08ca-bf88-3f04-0be00c11bd1b@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <04ba0442-08ca-bf88-3f04-0be00c11bd1b@virtuozzo.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-TUID: rSJb7zZ7x1pw

On Fri, Sep 03, 2021 at 02:51:21PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> That was most probably already discussed, so sorry my question:
> 
> Why we can't just do
> 
> #if ! GLIB_CHECK_VERSION(2, 68, 0)
> static inline gpointer g_memdup2(gconstpointer mem, gsize byte_size)
> {
>     gpointer new_mem;
> 
>     if (mem && byte_size != 0) {
>         new_mem = g_malloc(byte_size);
>         memcpy(new_mem, mem, byte_size);
>     } else {
>         new_mem = NULL;
>     }
> 
>     return new_mem;
> }
> #endif
> 
> ?

This doesn't play with GLIB_VERSION_MAX_ALLOWED - any use of
g_memdup2 will trigger compile warnings since we're using an
API that only exists in a glib version newer than our declared
baseline.

The inline wrapper  + macro is a trick that lets us backport
new features, while avoiding the compile warnings.

This is documented in the include/glib-compat.h file that Philippe
is modifying.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
