Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp719218lfa;
        Wed, 2 Jun 2021 16:26:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyuM3YTWMVSxDOCD0xft28uI5cuPs0h7K3ygVqKQEPPYZse6LIpqz+JhTHsZF5kME0OfcVe
X-Received: by 2002:aa7:ca50:: with SMTP id j16mr9635157edt.158.1622676399353;
        Wed, 02 Jun 2021 16:26:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622676399; cv=none;
        d=google.com; s=arc-20160816;
        b=Yl979mr17NgPxd/MG12V60En6Y/aiqZOJBoVKm8BNalCLXowRJNoTeFU4EBY2588wH
         94Ot3uWIbIaBWc8vMpjrzgxXRZjs31GSs2s4D/oOu0BwWcq18AQsMkXjjeZDIbU91FZs
         dW6gNLbp3BrYbY11kcSRUSzSfU54anQQNnMlUdP5vXibXkcPVen13lqIqgUmD/HL4xYp
         gpwE9p38VNNovUtlqMy1hZgNaT5JQKimS3LniNSI6G7nHTxOOxzDMDL+0aoFdH6E3NwN
         mtJqOTHWtbVuZJV02+xfWWbBz4e7/iKJM05n+MR6B1W8Ig10poR7DTAbz9QlnJ7ToLwb
         Uo3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=6GRM2eF2sPqn1Q1exRPr933/xNxENCApp30O3GosJ/c=;
        b=yVT+W6c5OQDNUA8cVxx+0++E0GK2TDs0l6x6U2huwsaVV9OjwpBknEzBuo3Svut7FW
         ceC/wBZi7sAqrZT1HDRYWDs2u+AZQ50FOqseAOKT7WuNslTJXgPe2Lgj0W979pAn9TzG
         pd9pitzWNcO4Mjk4TTvrJ1nG2l3GmUZfS9mhMeTqcXlsDqzJ9+KmXfeHEt2PtOQ8o142
         qx+GTo+kt4Iqwg3zciM/JX1vsazTj5JtThPtrLqtHKfJXtqEJen+6i2vkGcN7e2RC3AX
         UjXbaHK/Hhs5skqgWUZoSpmknlICTrjLloMR/2UhVqV2Np+uowx2qtKIuUUY4TfXOAzq
         /RSA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VwR6bFNc;
       spf=pass (google.com: domain of jsnow@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=jsnow@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <jsnow@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id w9si978352edx.381.2021.06.02.16.26.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 02 Jun 2021 16:26:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of jsnow@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VwR6bFNc;
       spf=pass (google.com: domain of jsnow@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=jsnow@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1622676398;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6GRM2eF2sPqn1Q1exRPr933/xNxENCApp30O3GosJ/c=;
	b=VwR6bFNce8naa4YOOHdnT8jOvasKKItLWgPUey1ZaSSG7ro1VU03K6XImWwNRl86y7LYnF
	d1haLRbzG2mG5iAk6vs/EtzH8/usdUYyBslMGJOyIBnn+QoBlbnwXhPeDKyvwekklxzRUl
	vQkQWJ8svyRSAvC2b0vLqOfQd4+/byQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-352-E1W3DaZqMiWvTEtfb07D2w-1; Wed, 02 Jun 2021 19:26:35 -0400
X-MC-Unique: E1W3DaZqMiWvTEtfb07D2w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2A31C801B12;
	Wed,  2 Jun 2021 23:26:34 +0000 (UTC)
Received: from [10.10.116.137] (ovpn-116-137.rdu2.redhat.com [10.10.116.137])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4A663614FD;
	Wed,  2 Jun 2021 23:26:32 +0000 (UTC)
Subject: Re: [PATCH v8 02/12] accel: Introduce 'query-accels' QMP command
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20210526170432.343588-1-philmd@redhat.com>
 <20210526170432.343588-3-philmd@redhat.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <e42a93e4-dfee-2446-f82c-8fec074d4c59@redhat.com>
Date: Wed, 2 Jun 2021 19:26:31 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210526170432.343588-3-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: fqq2rkArRteX

On 5/26/21 1:04 PM, Philippe Mathieu-Daudé wrote:
> Introduce the 'query-accels' QMP command which returns a list
> of built-in accelerator names.
>  > - Accelerator is a QAPI enum of all existing accelerators,
> 
> - AcceleratorInfo is a QAPI structure providing accelerator
>    specific information. Currently the common structure base
>    provides the name of the accelerator, while the specific
>    part is empty, but each accelerator can expand it.
> 
> - 'query-accels' QMP command returns a list of @AcceleratorInfo
> 
> For example on a KVM-only build we get:
> 
>      { "execute": "query-accels" }
>      {
>          "return": [
>              {
>                  "name": "qtest"
>              },
>              {
>                  "name": "kvm"
>              }
>          ]
>      }
> 
> Reviewed-by: Eric Blake <eblake@redhat.com>
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> Tested-by: Alex Bennée <alex.bennee@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
> v8:
> - Include code snippet from Markus adding to machine-target.json
>    to be able to use enum values or union branches conditional.
> - Use accel_find() on enum to be sure the accelerator is enabled
>    at runtime (chat with jsnow / eblake).
> 

Hi Phil -- Unfortunately I think I am going to defer on this one until 
Markus is back. I need to chat with him about the right way to design 
this, since I'm also not entirely clear on it myself.

--js

> Cc: Eric Blake <eblake@redhat.com>
> Cc: John Snow <jsnow@redhat.com>
> Cc: Markus Armbruster <armbru@redhat.com>
