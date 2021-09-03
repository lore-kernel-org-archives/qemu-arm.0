Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1182884lfb;
        Fri, 3 Sep 2021 04:18:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJytKlIKBQ0HrCxtTRb9kPg5tBO+XjPp0eSfAOhhkqEO7+lgpuZXLQTDODBCDBVs3Ge01jKB
X-Received: by 2002:a17:906:4e11:: with SMTP id z17mr3571132eju.483.1630667934222;
        Fri, 03 Sep 2021 04:18:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630667934; cv=none;
        d=google.com; s=arc-20160816;
        b=pJG7WAlghqkJaR992AOSrUL/raQnT1tc7FxE9MkpExWOl+jePSmhNPXvbHKrqSCQ9V
         sDcn3+2xGfCMSeeu+rmCiIWFVOeKiZ6Cmn+6AldeIeeqf7ABmisBcnFAhipVNMadAF76
         eaq7KrZeJhoK3JoV1U/GMaBmy7qFCdodNROvR6cpvn4wUZFv2YHLQZX+zefScKiSYgac
         jzjdMEBcQkeaIwv419L5kl2MU7FUZdFfijqSu2HdX50LGzrd1jePFtHfB8v+h5I6fzvj
         I/y5xDaJuFh814ad6Nd0wLjUuoW7jP1jaZYuxSX2phuaJRFJ4mKGSt4v+ZYYhBGwkWlI
         VFDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-disposition:user-agent
         :in-reply-to:mime-version:references:reply-to:message-id:subject:cc
         :to:from:date:dkim-signature;
        bh=d9H6Y/x3aFTcQdkDCU9IR24Ruj76cNc11pNOs8U9ZeE=;
        b=pLW+zpBFgoIbogsiZ+31wHlDghXhJRmOGa9iAqCfP06NY3m+rtxXgEaKSRI2bz7p9k
         bTYIVgvsJhxG6ux1tkXQtBmcbjE+nBJANHh4HI7pE6KJnk/eL6JupwdzZRHIRAsYSILX
         84MzsxASftAqCqEtdxOpvGzRUj0OXp4Z4X/KDOTpvg0ATBWbtnuTyL4TLIJcxxheNf4t
         y256gtGdNAsarOmE9KCBAQcJ48NieAI0X9VGEpHiztCwFlabJFTzlcDbSJLh/DYWuh3+
         xWO5xOWsPncW5EQ0kbnZMo/kjMhqhVrSaE+bH1tj6x4YuTsKF1McPbXVFUIEA/LdX/kD
         /GBw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Za/QDRAP";
       spf=pass (google.com: domain of berrange@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id p15si4962651ejy.519.2021.09.03.04.18.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 Sep 2021 04:18:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Za/QDRAP";
       spf=pass (google.com: domain of berrange@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1630667933;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d9H6Y/x3aFTcQdkDCU9IR24Ruj76cNc11pNOs8U9ZeE=;
	b=Za/QDRAPbwAsBoMAwOS/DwwdTJv5UUi7gTufGGV6+TfsOF7pZcecfKw2BRq/jor9NzNeC6
	xaRMbCeT+ldjjivmk9pqbdG21z0HfxPTgrxKzax+2lUB+/7qQ4PYFg2aHcnpHUQ4euYN28
	c/ZgdnZHJWOcPBbeSP4666pbmE4B5e8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-391-H8poPZlMOuixug7-bAsqBw-1; Fri, 03 Sep 2021 07:18:51 -0400
X-MC-Unique: H8poPZlMOuixug7-bAsqBw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B0970501E1;
	Fri,  3 Sep 2021 11:18:48 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.241])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5F03210016F4;
	Fri,  3 Sep 2021 11:18:19 +0000 (UTC)
Date: Fri, 3 Sep 2021 12:18:16 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org, Fam Zheng <fam@euphon.net>,
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
	Kevin Wolf <kwolf@redhat.com>,
	Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
	Laurent Vivier <laurent@vivier.eu>,
	Shannon Zhao <shannon.zhaosl@gmail.com>,
	Hanna Reitz <hreitz@redhat.com>, qemu-ppc@nongnu.org,
	Igor Mammedov <imammedo@redhat.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>
Subject: Re: [PATCH 03/28] qapi: Replace g_memdup() by g_memdup2_qemu()
Message-ID: <YTIEeO5udKWuqE6H@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20210903110702.588291-1-philmd@redhat.com>
 <20210903110702.588291-4-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210903110702.588291-4-philmd@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-TUID: V3nGLvXtreK7

On Fri, Sep 03, 2021 at 01:06:37PM +0200, Philippe Mathieu-Daudé wrote:
> Per https://discourse.gnome.org/t/port-your-module-from-g-memdup-to-g-memdup2-now/5538
> 
>   The old API took the size of the memory to duplicate as a guint,
>   whereas most memory functions take memory sizes as a gsize. This
>   made it easy to accidentally pass a gsize to g_memdup(). For large
>   values, that would lead to a silent truncation of the size from 64
>   to 32 bits, and result in a heap area being returned which is
>   significantly smaller than what the caller expects. This can likely
>   be exploited in various modules to cause a heap buffer overflow.
> 
> Replace g_memdup() by the safer g_memdup2_qemu() wrapper.

This and all following patches should directly use "g_memdup2"
rather than the wrapper which is supposed to remain "secret"
in the glib-compat.h header.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
