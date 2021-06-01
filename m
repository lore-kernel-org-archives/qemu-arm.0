Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp3393948lfm;
        Tue, 1 Jun 2021 01:04:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy1knoiAOnK+xqWHooV2LY8RqnmPAxZZ8oZkMGKdJOKywNoJQVg3S8sXTp0gT7lylAgJLjg
X-Received: by 2002:a17:906:848c:: with SMTP id m12mr11157664ejx.330.1622534650626;
        Tue, 01 Jun 2021 01:04:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622534650; cv=none;
        d=google.com; s=arc-20160816;
        b=XsR5blE0bDGWBi7keG39LAuOiU2HcFrlcXouEJgr3gNZHLQXB1ayvefuAiaqlbKuJz
         i3elLWgKgVTGCqd9kaX+b3uSJBY4NUBFECiAhHCesLDENM8Vgc1dEaba5W9MNTYf0RTr
         /mrosx8KT/kGXg2K/J92L8h0j7+CiBwsyp7Qe+zdsoxwSGt0Ou3GHtdeAnsKRf15A5NE
         3ePg0Ozd4gd8K3LFG2+DBzb2y0lfZMiifcHdU67pQxTabjzfyAbuXceF0VKMPPF9+g9v
         kiPOV8yXZfyvZ2zWVvsJ1v8DZTqLOjTNdWIdcTZTDmnHTCT8j6cYMgKhvmSvIXaHvrZZ
         I7wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=qEKMdcRgAHOXZOXZjqFJaNgfDwrRNnICFKZA0rswVVI=;
        b=Dp7V2tiKBC5P/KtlpXFcNR1LTHfObJj+dRrr4eUnyLRJFfCsMPb/KwxoNqNlkOCp8W
         CLo0kxivCo6HQuMHXmZAIgEl90MyjPUneC1bxab3nEnkf0goyGhuRZ8UhVl+y85y7Vjx
         nizmGf+PlbTZUeVZOzJGsL6Qe8SLbrbWMSUr2mWbqNSDTe0EQ1E2XKMd6iqQW0zUkWjf
         hqxRhGIX82J2LUV/g/jXYjoIe25QR54DjaoZStwrgrF8LKOixHlbfeIc/uVcRjRAXSsc
         ihlIDfolHT6MK3w1P/VW51lmRu9jZR4RBnfeYKJzh/j8qLBnyLnv5uvMn72T1dcs3EZu
         7C0Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=K3GcWW78;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id e12si15386002ejk.225.2021.06.01.01.04.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 01 Jun 2021 01:04:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=K3GcWW78;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1622534649;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qEKMdcRgAHOXZOXZjqFJaNgfDwrRNnICFKZA0rswVVI=;
	b=K3GcWW78iUb/Bctx6vKSysPoaY6E9bF9o/wU/4QqGHnXtVyYtFttBH83K5b3/CHgRu/TXt
	1rHmOPK0gVpnCvvF2Ca4xYIDyA1ZRpKYqyWn4BBUAHV8XqWPMlUbXscuuwZkx+rv0t025z
	hJwmU5XTPs3QjxXnkVZ2pkymMfQM9RQ=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-487-2tG_0lv8PUGZAJ8sv2c7ww-1; Tue, 01 Jun 2021 04:04:06 -0400
X-MC-Unique: 2tG_0lv8PUGZAJ8sv2c7ww-1
Received: by mail-ed1-f72.google.com with SMTP id i3-20020aa7dd030000b029038ce772ffe4so7427735edv.12
        for <alex.bennee@linaro.org>; Tue, 01 Jun 2021 01:04:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=qEKMdcRgAHOXZOXZjqFJaNgfDwrRNnICFKZA0rswVVI=;
        b=RMUNs6I8SAr2pt8+V/zBIO9Lbe8qkBGvYmfkE+ZuoHu5PUPsyZFQ8VdW5mjkNNpIO1
         ob0WHtYnPenmEEmBgzxJxMIj1lwAuB2cReNXy/yYKEUYA3Ww1mUXZ2JzKCP1FITrH/sM
         pe9toy6nYHMYVlL6dOdJmuSqN/bU7pJSumXFeaISduYq5J6tiqpjizNf1btjK995LtuQ
         /5NBZ9aQn+zG95vofxyRk/9zADJQPEgsF5buexCi5gfPyYQB39VmGwINcru8JhUlZHpA
         uyTiP1T3B7hEBgb27uJpNgnFMRfYKpALqSPXYnRX676nxDp4qDkoOWx15yw1DGqpu6fr
         XToQ==
X-Gm-Message-State: AOAM5338ra8ccGgX087WkEoI9SOj7sHeKG0rS6002ornVyk6+7C0qe/N
	QEG6OVMPprsBxeXonqbsqZlWHr5eCO+K8iuRI+Y712w8UK25l4hkiREHHrhXqPAXzrLxSBDlhA2
	iwZ0sHiWxYzqccJM6
X-Received: by 2002:a05:6402:1590:: with SMTP id c16mr22467046edv.7.1622534645379;
        Tue, 01 Jun 2021 01:04:05 -0700 (PDT)
X-Received: by 2002:a05:6402:1590:: with SMTP id c16mr22467026edv.7.1622534645167;
        Tue, 01 Jun 2021 01:04:05 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.36] (235.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.235])
        by smtp.gmail.com with ESMTPSA id k21sm7586982edo.41.2021.06.01.01.04.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jun 2021 01:04:04 -0700 (PDT)
Subject: Re: [RFC PATCH] configure: allow the overriding of default-config in
 the build
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20210528163116.31902-1-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <679398ae-779b-0c59-4d37-981e5a1dc3f0@redhat.com>
Date: Tue, 1 Jun 2021 10:04:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210528163116.31902-1-alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: WACwcY/aIU9C

On 5/28/21 6:31 PM, Alex Bennée wrote:
> While the default config works well enough it does end up enabling a
> lot of stuff. For more minimal builds we can pass a slimmed down list
> of devices and let Kconfig work out what we want. For example:
> 
>   ../../configure --without-default-features \
>     --target-list=arm-softmmu,aarch64-softmmu \
>     --with-devices-aarch64=(pwd)/../../configs/aarch64-softmmu/aarch64-softmmu-64bit-only.mak
> 
> will override the aarch64-softmmu default devices to one of our own
> choosing.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Philippe Mathieu-Daudé <philmd@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  configure                                        | 16 ++++++++++++++++
>  .../aarch64-softmmu-64bit-only.mak               | 10 ++++++++++
>  meson.build                                      |  3 ++-
>  3 files changed, 28 insertions(+), 1 deletion(-)
>  create mode 100644 configs/aarch64-softmmu/aarch64-softmmu-64bit-only.mak

Surprisingly simple :)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
