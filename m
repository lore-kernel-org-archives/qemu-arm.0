Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1485864lfb;
        Fri, 3 Sep 2021 10:10:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyUipUdtiPZB7RuySL9k+H0q8aHyTBui0Ob242Y/b5+zevG2lDHLfMffdLZVaU+FtSbMGOt
X-Received: by 2002:aa7:d951:: with SMTP id l17mr1967398eds.394.1630689019234;
        Fri, 03 Sep 2021 10:10:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630689019; cv=none;
        d=google.com; s=arc-20160816;
        b=ZudIe23CjcMFSNRlW4ig10ltrRXY4j5FuwZJ0R2xrC7ampj9MQ5D19rDF0ecXZxux/
         OU2t1kVsJknQ4DF0vHPnP7yCOhqkZXZuyzt7LMGiKFsB0HJu965WlUw1nwvsNetkmdsG
         Un23AE2WpOUGIPzzWFXDD5JyBXH0QX3bFMMUE7vnhDfKJKygX4lDzIYSTKx9qxQc1x4x
         PWrfOP4o1OZwkRfE3yQ+HNimLNGB8oRF/RDg34FQpCir9fw2XdrDGeTEQvGqZcHi+PYX
         ygTCXv+IOCPxUA4C+Vb9YFEtItt28T5kK3RY2Nh4E2WAWqIPDBFAHIwsj6yhCRZOHQ2+
         +VKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=ov5rv3A6ter6wNpEKGjXrXiwjQ8ijppg8NoIE1q3PLc=;
        b=ChRfF4PAqBDEX/yB/GVcx9FdxGC1i0aFTwBDx2ofRTo5eHr4enxiflcI16ml/ywYPX
         VifVBrfxav2Xae6kAYwP0aXt5l3pTI1CG7PxtcPCLHArYaBWIg+Y8JsSJm8E0wrymk8s
         jZTLBqtJY3MiofJhhAk0AXz8sfDcY1T325crXXrpqZ3pl6hNy7QrV8jmCkxDw1hOXFRn
         VOp9FbV6ac9u1+zslvtiF+yaplS2vOKSXkakrRGhpxduYQZuB1ShkkeTdehs8fVBTvfu
         x886Ke+srwWOUEiFZVCEtZeA91DVtalM7TTRCTBAhMjC0mrZnuTqTi5RPhq0i0mMT4hJ
         5LLA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DtMIkQxb;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id di27si64098edb.127.2021.09.03.10.10.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 Sep 2021 10:10:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DtMIkQxb;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1630689018;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ov5rv3A6ter6wNpEKGjXrXiwjQ8ijppg8NoIE1q3PLc=;
	b=DtMIkQxblw3XR0+XJuWD+M7yl6yM9ZW78uYTh4qYSufhstOn14LhAGyLnPgzXs5tsFeKTB
	mkZVS/XpJ5c58+QIzsjx8qyGd6nmH2V0EhStwr1RhzwMKso9lDp5U/3x1FZdkQyaDlMGmR
	7nGjpA25ksrlIFmtS77uNzfyB6za8wM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-551-P92Oqg6RPcSHV-znDmxYKQ-1; Fri, 03 Sep 2021 13:10:16 -0400
X-MC-Unique: P92Oqg6RPcSHV-znDmxYKQ-1
Received: by mail-wm1-f70.google.com with SMTP id k5-20020a7bc3050000b02901e081f69d80so2094740wmj.8
        for <alex.bennee@linaro.org>; Fri, 03 Sep 2021 10:10:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ov5rv3A6ter6wNpEKGjXrXiwjQ8ijppg8NoIE1q3PLc=;
        b=jsMpLZk9PLU0yVTXrt924MBC8/gqjQj9JWEBtYTz/VJ9FR3E48tS9WnURfDwc41WBG
         OyRblj1y1LZENfKoFD978UU7rzypnVQqpRFHApGP5fLBkRDF/QK58i0f+ylMPOc/HfDb
         KWMpCy+6qr51fkrFflSBuG4qRdEMnPkKxM2EjHXyOpcJlICF1XUOBxlGSTjp0+kDT2Px
         oUq6XHTWGWZ0DvD1OLIFgdyZQjxMm1Ef7IpMSNOYejdBD86FwJFyg+THKJSLCikUU/Dm
         bqDX//PE9WcQ5pE829BILyl7VlrU0W7I3XgqIN+g8f75hw55X4r3GELcuLmDCU3wvK1v
         w/Gg==
X-Gm-Message-State: AOAM5311dCyKf8mlw4CkIbQqR96G3rhPT2TIAo7C0zab52QDEXXN2gYH
	bjzzy0keS2Z1PDvPujMD2vigLBXe8LIkZ+/CKc9HquUBiokdh5JSCx7BHi4VthusJmrxdtBFYKV
	60BB9VazNwdftpZQp
X-Received: by 2002:a05:600c:2056:: with SMTP id p22mr1471857wmg.8.1630689015822;
        Fri, 03 Sep 2021 10:10:15 -0700 (PDT)
X-Received: by 2002:a05:600c:2056:: with SMTP id p22mr1471828wmg.8.1630689015615;
        Fri, 03 Sep 2021 10:10:15 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.36] (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
        by smtp.gmail.com with ESMTPSA id d24sm4629020wmb.35.2021.09.03.10.10.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Sep 2021 10:10:15 -0700 (PDT)
Subject: Re: [PATCH 03/28] qapi: Replace g_memdup() by g_memdup2_qemu()
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Fam Zheng <fam@euphon.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 Li Zhijian <lizhijian@cn.fujitsu.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Peter Xu <peterx@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Eric Blake <eblake@redhat.com>, qemu-block@nongnu.org,
 Zhang Chen <chen.zhang@intel.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Helge Deller <deller@gmx.de>,
 David Hildenbrand <david@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Stefan Weil <sw@weilnetz.de>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz
 <groug@kaod.org>, Alex Williamson <alex.williamson@redhat.com>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
 Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Laurent Vivier <laurent@vivier.eu>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-ppc@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Mahmoud Mandour <ma.mandourr@gmail.com>
References: <20210903110702.588291-1-philmd@redhat.com>
 <20210903110702.588291-4-philmd@redhat.com> <YTIEeO5udKWuqE6H@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <674f9eb9-7bc2-f7f9-d36d-a6d7da3bac80@redhat.com>
Date: Fri, 3 Sep 2021 19:10:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YTIEeO5udKWuqE6H@redhat.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: DoeWYz/M8w02

On 9/3/21 1:18 PM, Daniel P. Berrangé wrote:
> On Fri, Sep 03, 2021 at 01:06:37PM +0200, Philippe Mathieu-Daudé wrote:
>> Per https://discourse.gnome.org/t/port-your-module-from-g-memdup-to-g-memdup2-now/5538
>>
>>   The old API took the size of the memory to duplicate as a guint,
>>   whereas most memory functions take memory sizes as a gsize. This
>>   made it easy to accidentally pass a gsize to g_memdup(). For large
>>   values, that would lead to a silent truncation of the size from 64
>>   to 32 bits, and result in a heap area being returned which is
>>   significantly smaller than what the caller expects. This can likely
>>   be exploited in various modules to cause a heap buffer overflow.
>>
>> Replace g_memdup() by the safer g_memdup2_qemu() wrapper.
> 
> This and all following patches should directly use "g_memdup2"
> rather than the wrapper which is supposed to remain "secret"
> in the glib-compat.h header.

Yep, got it, thanks for the quick review!
