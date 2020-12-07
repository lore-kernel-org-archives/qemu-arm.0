Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp2803716lfb;
        Sun, 6 Dec 2020 21:11:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwZhl7u0rDrwk0tVp4X+KVd81eeBUBPHNQ6c0f3IJ+EcV1U/fb6qLrhYJOLcMf3FYOVj2rU
X-Received: by 2002:a25:7909:: with SMTP id u9mr13699138ybc.333.1607317887046;
        Sun, 06 Dec 2020 21:11:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607317887; cv=none;
        d=google.com; s=arc-20160816;
        b=OGawua2V4x0kscgAUZszQXw7kQG+kDl8+vFjtblDBsxPPuNxt2a0WtzxyiyA2c3HRP
         /DWwi56LIEFoRSEKqEaLm866qwiLSXYHDW5zt1CXWfmMIOL0f0w4n2o0EIEuAwvm4Ovj
         h3IVHRMARCgYDQgY57Z/Y4OaEVY5/A2ScRJsWSao3/EsrxBCrUwOrPwH2kxiWCRYm6dK
         Y2c6UZ9btHNWFGDTHKCS/8g+n+nYcUX07XYiw3rCT6BQedGIfrOPm0zPPW/TNIuzeRkY
         +zNoPFpz5jGefwUyVLDrfiiDYB8ZcnSLktKdstpWqLBnpWoLTUw3b/PjKZ1T6wny/+YS
         1VYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=Qab4deHbU/VN7oqCq/ddeCw/xxFnxVTtrXJHAdanJ30=;
        b=TmZBd5hU9i9xXEy6nOQWVWWZV60Ucjnitg648jCSs9bO7xnd7tUBrNIN6m4HjOEDGe
         YB/Fom0BZYrUyohkivJlvyvHvHFA26dVYg2dNr/GUYlJVYNd+vu6Sf3NE/c+CnkkTkU0
         rat74LgKoyfiOR7zhJLIobbzO0q1vzasuzlxpRpfFl95nXNMmeRNDTXpw2Vhc+OTKZba
         5O8yIJhqHNXbKTKyIA3m3jjWCGIBHavU+eDleUq2t9T9a4sA7nPs+BPEozoEaHc1mg7O
         5anNRHfRngFssoAsL4HzHsboSNWRcglqIQQS2F8kfIUofkpkVVSM1hmUPrieXvjmNNc6
         WRIg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Wd2KUSwn;
       spf=pass (google.com: domain of thuth@redhat.com designates 63.128.21.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [63.128.21.124])
        by mx.google.com with ESMTPS id v9si9386785ybp.362.2020.12.06.21.11.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 06 Dec 2020 21:11:27 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 63.128.21.124 as permitted sender) client-ip=63.128.21.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Wd2KUSwn;
       spf=pass (google.com: domain of thuth@redhat.com designates 63.128.21.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607317886;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Qab4deHbU/VN7oqCq/ddeCw/xxFnxVTtrXJHAdanJ30=;
	b=Wd2KUSwnCLr0XfStrF0+coXglJjXzI4yua/+Gv+o/8GdKmFNkomTSQG8Nqwj0Me2XwAM0M
	YwCJ2w2COGhRJ8jGWgheBtEn1/bi+Xwqxj+difq0eSzhVDmCy86Ncpp31sc93amy2oDZ/q
	nuyZLbMA25pr7OZF5koYPo6hZeEL83c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-508-v49AIyVENfWDHZqo9wU_CQ-1; Mon, 07 Dec 2020 00:11:24 -0500
X-MC-Unique: v49AIyVENfWDHZqo9wU_CQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5CB29800D55;
	Mon,  7 Dec 2020 05:11:22 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-85.ams2.redhat.com [10.36.112.85])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C9D315D6AB;
	Mon,  7 Dec 2020 05:11:09 +0000 (UTC)
Subject: Re: [PATCH 1/8] gitlab-ci: Replace YAML anchors by extends
 (cross_system_build_job)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 xen-devel@lists.xenproject.org, kvm@vger.kernel.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Willian Rampazzo
 <wrampazz@redhat.com>, Paul Durrant <paul@xen.org>,
 Huacai Chen <chenhc@lemote.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Claudio Fontana <cfontana@suse.de>, Halil Pasic <pasic@linux.ibm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, David Gibson
 <david@gibson.dropbear.id.au>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-s390x@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>,
 qemu-arm@nongnu.org
References: <20201206185508.3545711-1-philmd@redhat.com>
 <20201206185508.3545711-2-philmd@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <e5494ad3-a67e-0013-b48f-0fa82d67c397@redhat.com>
Date: Mon, 7 Dec 2020 06:11:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201206185508.3545711-2-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-TUID: Tx4EzAjqF2wx

On 06/12/2020 19.55, Philippe Mathieu-Daudé wrote:
> 'extends' is an alternative to using YAML anchors
> and is a little more flexible and readable. See:
> https://docs.gitlab.com/ee/ci/yaml/#extends
> 
> More importantly it allows exploding YAML jobs.
> 
> Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  .gitlab-ci.d/crossbuilds.yml | 40 ++++++++++++++++++------------------
>  1 file changed, 20 insertions(+), 20 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>
